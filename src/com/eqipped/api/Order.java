package com.eqipped.api;

import java.util.*;
import java.util.stream.Collectors;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.net.ssl.HttpsURLConnection;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintStream;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;

import com.ccavenue.security.AesCryptUtil;

@RestController
@RequestMapping("/pay")
@CrossOrigin("*")
public class Order {

//	private static final String MERCHANT_KEY = "2PBP7IABZ2";
//	private static final String SALT = "DAH88E3UWQ";
//	private static final String BASE_URL = "https://testpay.easebuzz.in/";
	
	
	private static final String ACCESS_CODE = "AVHU13JG47CI18UHIC";
	private static final String WORKING_KEY = "FDE1D2BAF9BB80A383B0A8282736C86B";
	private static final String CCAVENUE_URL = "https://secure.ccavenue.com/transaction.do?command=initiateTransaction";
//	private static final String CCAVENUE_URL = "https://test.ccavenue.com/transaction.do?command=initiateTransaction";

	
	//@PostMapping("/makePayment")
	@RequestMapping(value="/makePayment" ,method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
	public String makePayment(@RequestBody Map<String, String> paymentRequest) {
		try {
			String ccaRequest = mapToQueryString(paymentRequest);

			AesCryptUtil aesUtil = new AesCryptUtil(WORKING_KEY);
			String encRequest = aesUtil.encrypt(ccaRequest);

			String redirectUrl = CCAVENUE_URL + "&encRequest=" + encRequest + "&access_code=" + ACCESS_CODE;

			return redirectUrl;
		} catch (Exception e) {
			e.printStackTrace();
			return "Error processing payment.";
		}
	}

	private String mapToQueryString(Map<String, String> map) {
		return map.entrySet().stream().map(entry -> entry.getKey() + "=" + entry.getValue())
				.collect(Collectors.joining("&"));
	}
	
	
	//private static final String WORKING_KEY = "FDE1D2BAF9BB80A383B0A8282736C86B";

    //@PostMapping("/processResponse")
    @RequestMapping(value="/processResponse" ,method = RequestMethod.POST, consumes = MediaType.ALL_VALUE)
    public String processResponse(@RequestBody String encryptedResponse) {
        try {
            AesCryptUtil aesUtil = new AesCryptUtil(WORKING_KEY);
            String decryptedResponse = aesUtil.decrypt(encryptedResponse);

            Hashtable<String, String> responseTable = new Hashtable<>();
            StringTokenizer tokenizer = new StringTokenizer(decryptedResponse, "&");
            while (tokenizer.hasMoreTokens()) {
                String pair = tokenizer.nextToken();
                if (pair != null) {
                    StringTokenizer strTok = new StringTokenizer(pair, "=");
                    String pname = "";
                    String pvalue = "";
                    if (strTok.hasMoreTokens()) {
                        pname = strTok.nextToken();
                        if (strTok.hasMoreTokens()) {
                            pvalue = strTok.nextToken();
                            responseTable.put(pname, pvalue);
                        }
                    }
                }
            }

            // Process the response data as needed
            // Here you can create a JSON response or HTML response

            return "Response processed successfully";
        } catch (Exception e) {
            e.printStackTrace();
            return "Error processing response";
        }
    }
	
	

	

	@RequestMapping(value = "/initiatepayment/{key}/{salt}", method = RequestMethod.POST)
	public String initiatePayment(
			@RequestBody Map<String, String> paymentParams,
			@PathVariable String key,
			@PathVariable String salt,
			@RequestParam String baseUrl
			) throws IOException, ParseException {
		paymentParams.put("key", key);
		String hashSequence = "key|txnid|amount|productinfo|firstname|email|udf1|udf2|udf3|udf4|udf5|udf6|udf7|udf8|udf9|udf10";
		String ccaRequest = mapToQueryString(paymentParams);
		// Similar to the JSP code, build the hash and process the payment
//		Enumeration paramNames = request.getParameterNames();
//        Map<String, String> params = new HashMap<String, String>();
//        while (paramNames.hasMoreElements()) {
//            String paramName = (String) paramNames.nextElement();
//
//            String paramValue = ((String) request.getParameter(paramName)).trim();
//            params.put(paramName, paramValue);
//        }
		int error = 0;
        String txnid = "";
        
        String hashString = "";
        String hash = "";
        String redirectUrl = null;
        //params.put("key",merchant_key);
        //String hashSequence = "key|txnid|amount|productinfo|firstname|email|udf1|udf2|udf3|udf4|udf5|udf6|udf7|udf8|udf9|udf10";    
            if (empty(paymentParams.get("key"))) {
                //error = 1;
            } else {
                String[] hashVarSeq = hashSequence.split("\\|");

                for (String part : hashVarSeq) {
                    hashString = (empty(paymentParams.get(part))) ? hashString.concat("") : hashString.concat(paymentParams.get(part));
                    hashString = hashString.concat("|");
                }
                hashString = hashString.concat(salt);
                hash = Easebuzz_Generatehash512("SHA-512", hashString);
                paymentParams.put("hash", hash);

                StringBuilder sb = new StringBuilder();
                for (Map.Entry<String, String> e : paymentParams.entrySet()) {
                    if (sb.length() > 0) {
                        sb.append('&');
                    }
                    sb.append(URLEncoder.encode(e.getKey().trim(), "UTF-8")).append('=').append(URLEncoder.encode(e.getValue().trim(), "UTF-8"));
                }

                URL url = new URL(baseUrl + "payment/initiateLink");
                HttpsURLConnection con = (HttpsURLConnection) url.openConnection();
                con.setRequestMethod("POST");
                con.setDoOutput(true);
                PrintStream ps = new PrintStream(con.getOutputStream());
                ps.println(sb);
                ps.close();
                con.connect();
                StringBuilder res = new StringBuilder();
                if (con.getResponseCode() == HttpsURLConnection.HTTP_OK) {
                    BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream()));
                    String line;
                    while ((line = br.readLine()) != null) {
                        res.append(line);
                    }
                    br.close();
                }
                con.disconnect();
                //out.print(res);

                Object obj = new JSONParser().parse(res.toString());
                JSONObject jo = (JSONObject) obj;
                
                if (jo.get("status").toString().equals("1")) {
                	redirectUrl = baseUrl + "pay/" + jo.get("data").toString();
                } else {
                    redirectUrl = jo.get("data").toString();
                }

            }
        
        
		return redirectUrl; // The JSON response from the payment gateway
	}
	
//	private String mapToQueryString(Map<String, String> map) {
//		return map.entrySet().stream().map(entry -> entry.getKey() + "=" + entry.getValue())
//				.collect(Collectors.joining("&"));
//	}
	
	public boolean empty(String s) {
        if (s == null || s.trim().equals("")) {
            return true;
        } else {
            return false;
        }
    }

	 public String clean(String s) {
         s.trim();
         return s;
     }
	 
	 public String Easebuzz_Generatehash512(String type, String str) {
         byte[] hashseq = str.getBytes();
         StringBuffer hexString = new StringBuffer();
         try {
             MessageDigest algorithm = MessageDigest.getInstance(type);
             algorithm.reset();
             algorithm.update(hashseq);
             byte messageDigest[] = algorithm.digest();

             for (int i = 0; i < messageDigest.length; i++) {
                 String hex = Integer.toHexString(0xFF & messageDigest[i]);
                 if (hex.length() == 1) {
                     hexString.append("0");
                 }
                 hexString.append(hex);
             }

         } catch (NoSuchAlgorithmException nsae) {
         }
         return hexString.toString();
     }
}
