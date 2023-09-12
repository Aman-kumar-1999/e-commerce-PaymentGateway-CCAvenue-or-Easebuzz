<%-- 
    Document   : response
    Created on : 23 May, 2018, 6:41:07 PM
    Author     : Easebuzz
--%>
<%@page import="org.springframework.web.client.RestTemplate"%>
<%@page import="org.springframework.http.HttpMethod"%>
<%@page import="org.springframework.http.HttpEntity"%>
<%@page import="org.springframework.http.MediaType"%>
<%@page import="org.springframework.http.HttpHeaders"%>
<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="java.nio.charset.StandardCharsets"%>
<%@page import="java.io.Reader"%>
<%@page import="com.fasterxml.jackson.databind.JsonNode"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Map"%>
<%@page import="org.json.*"%>
<%@page import="java.io.PrintStream"%>
<%@page import="javax.net.ssl.SSLContext"%>
<%@page import="java.io.InputStream"%>
<%@page import="javax.net.ssl.HttpsURLConnection"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@ page import="java.util.*"%>
<%@ page import="java.security.*"%>
<%@page import="javax.net.ssl.X509TrustManager"%>
<%@page import="javax.net.ssl.TrustManager"%>
<%@page import="javax.net.*"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.*"%>
<%@page import="java.io.FileReader"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
button {
	background-color: #2979ff;
	color: white;
	padding: 10px 20px;
	border-radius: 5px;
	cursor: pointer;
}
/*
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
*/
/* 
    Created on : 27 Jun, 2018, 12:44:58 PM
    Author     : Easebuzz
*/
body {
	height: 100%;
	margin: 0px !important;
}

body * {
	font-family: Ubuntu;
}

.grid-container {
	display: grid;
	grid-template-columns: auto;
	background-color: #fff;
	margin: 0px;
	padding: 0px;
}

header {
	display: grid;
	grid-template-columns: 35% 65% auto;
	padding: 8px 25px 0px 25px;
	background-color: #07275d;
	border: 1px solid;
	border-radius: 2px;
}

.logo {
	padding: 2px;
}

img {
	max-width: 150px;
	text-align: left;
}

.hedding {
	color: white;
	text-align: right;
}

.hedding>a>h2 {
	font-size: 1.2em;
	margin-top: 10px !important;
	color: #fff;
}

.hedding>a>h2>spam {
	border-bottom: 1px solid;
}

.hedding>h2 {
	font-size: 1.2em;
	margin-top: 10px !important;
}

.container {
	display: grid;
	grid-template-columns: auto;
	padding: 10px 25px;
	height: 650px;
}

.card-container {
	display: grid;
	grid-template-columns: 100% auto;
	grid-gap: 10px;
	margin: 1px 25%;
}

.card {
	height: fit-content;
	background-color: #565455;
	color: #fff;
	padding: 10px;
	margin: 10px 15px 10px 0px;
	border: 1px solid;
	border-radius: 10px;
	z-index: 1;
}

.card>h2 {
	text-align: center;
	margin: 0px;
	padding: 5px;
}

.card>p {
	font-size: 1.1em;
}

ul {
	padding-left: 20px
}

ul>li {
	margin: 5px;
	border: 1px solid #487;
	padding: 10px;
	border-radius: 5px;
	background-color: #fff;
}

.highlight {
	color: #fff;
}

.form-container {
	display: block;
	margin: 0px 20px;
}

.form-container>h2 {
	color: #ce042c;
}

.main-form {
	border: 1px solid #000;
	border-radius: 10px;
	padding: 10px;
	margin: 25px 10% 100px 10%;
}

.mandatory-data {
	display: grid;
	grid-template-columns: auto auto;
	grid-gap: 10px;
	padding: 0px 30px;
}

.optional-data {
	display: grid;
	grid-template-columns: auto auto;
	grid-gap: 10px;
	padding: 0px 30px;
}

.form-field input {
	margin: 5px 10px 5px 0px;
	min-width: 90%;
}

.form-field {
	padding: 0px 20px 0px 0px;
}

.main-form button {
	background: #060919;
	border: 0px;
	color: #fff;
	font-size: 1em;
	border-radius: 4px;
	margin: 10px;
	padding: 15px;
}

.btn-submit {
	margin: 10px;
	text-align: center;
}

label {
	font-size: 1.2em;
}

input {
	border: 1px solid;
	border-radius: 5px;
	padding: 7px 5px;
	font-size: 1em;
}

sup {
	color: red;
}

#transaction_date, #payout_date {
	background: #fff
		url(https://cdn1.iconfinder.com/data/icons/cc_mono_icon_set/blacks/16x16/calendar_2.png)
		97% 50% no-repeat;
}

a {
	text-decoration: none;
}

.print {
	
}
</style>
<title>Response Page</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>
<body>
	<div class="grid-container">
		<header class="wrapper">
			<div class="logo">
				<a href="https://eqipped.com"> <img
					src="https://eqipped.com/eqipped_1.png" alt="Easebuzz">
				</a>
			</div>

			<div class="hedding">
				<br />
				<div class="highlight">
					<button type="button" class="btn btn-danger m-0"
						onclick="window.print()">
						<span class="material-symbols-outlined"> print </span>
						<p class='p-0 m-0'>Print</p>
					</button>
				</div>

			</div>

		</header>


		<div class="form-container">
			<h2 class='text-center'>Payment Received</h2>
			<hr>
			<form method="POST" name="initiatePayment"
				action="initiate_payment_invoke">

				<div class="main-form">
					<h3>Payments Details</h3>
					<hr>
					<div class="mandatory-data">

						<%!// validations check
	public boolean empty(String s) {
		if (s == null || s.trim().equals("")) {
			return true;
		} else {
			return false;
		}
	}%>

						<%!//hashcode generation method
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
	}%>
						<%
						//reverse hash matching while response
						//String key = "2PBP7IABZ2";
						String salt = "DAH88E3UWQ";
						//String salt = "XXXXXXXXXXX";
						Enumeration paramNames = request.getParameterNames();
						Map<String, String> params = new HashMap<String, String>();
						while (paramNames.hasMoreElements()) {
							String paramName = (String) paramNames.nextElement();

							String paramValue = ((String) request.getParameter(paramName)).trim();
							params.put(paramName, paramValue);
						}

						// Start Calling  api for Create Order Response

						//Map<String, String> paramsResponse = new HashMap<String, String>();
						//while (paramNames.hasMoreElements()) {
						//	String paramName = (String) paramNames.nextElement();

						//	String paramValue = ((String) request.getParameter(paramName)).trim();
						//	paramsResponse.put(paramName, paramValue);
						//}

						//Gson gson = new Gson();
						//String jsonResponse = gson.toJson(params);
						//System.out.println("JSON RESPONSE : " + jsonResponse);

						//URL url = new URL("https://api.eqipped.com/order/createOrder/response");
						//HttpURLConnection connection = (HttpURLConnection) url.openConnection();
						//connection.setRequestMethod("POST");
						//connection.setRequestProperty("Content-Type", "application/json");

						//String json = jsonResponse;
						//byte[] data = json.getBytes("UTF-8");

						//connection.setDoOutput(true);
						//connection.setRequestProperty("Content-Length", String.valueOf(data.length));
						//connection.getOutputStream().write(data);

						//int responseCode = connection.getResponseCode();
						//System.out.println("Response code: " + responseCode);
						String responseData = "";
						String url1 = "https://api.eqipped.com/order/createOrder/response";
						//String url1 = "http://localhost:5004/order/createOrder/response";
						try {			
							
							// calling api
							HttpHeaders headers = new HttpHeaders();
							headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
				            headers.add("user-agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36");
							HttpEntity<?> entity = new HttpEntity<>(params, headers);
							//String url = paymentApiUrl +""+ key +"/"+salt+"?baseUrl="+baseUrl;
							RestTemplate restTemplate = new RestTemplate();
							responseData = restTemplate.exchange(url1, HttpMethod.POST, entity, String.class).getBody();

							System.out.println("Response Body New : "+responseData);
							

						} catch (Exception e) {
							e.printStackTrace();
						}
						//if (responseCode == 200) {
							//JsonNode node;
							//try (
							//	Reader in = new InputStreamReader(connection.getInputStream(), StandardCharsets.UTF_8
							//			)) {
							//    ObjectMapper mapper = new ObjectMapper();
							//    node = mapper.readTree(in);
							//    System.out.println(" Resposne body : "+node);
							//}
							//try{					            
								//InputStream inputStream = connection.getInputStream();
								//String responseBody = new String(inputStream.readAllBytes(), "UTF-8");
								//System.out.println("Response body: " + responseBody);
							//}
							//catch(Exception e){
							//	e.printStackTrace();
							//}
							//InputStream inputStream = connection.getInputStream();
							//String responseBody = new String(inputStream.readAllBytes(), "UTF-8");
							//System.out.println("Response body: " + responseBody);
						//}

						// End Calling  api for Create Order 

						Map<String, String[]> parameters = request.getParameterMap();
						for (String parameter : parameters.keySet()) {
							params.put(parameter, parameters.get(parameter)[0].toString());
						}
						params.put("salt", salt);
						params.put("status", request.getParameter("status"));
						String hashString = "";
						String hash = "";

						String hashSequence = "salt|status|udf10|udf9|udf8|udf7|udf6|udf5|udf4|udf3|udf2|udf1|email|firstname|productinfo|amount|txnid";

						String[] hashVarSeq = hashSequence.split("\\|");

						for (String part : hashVarSeq) {
							hashString = (empty(params.get(part))) ? hashString.concat("") : hashString.concat(params.get(part));
							hashString = hashString.concat("|");
						}
						hashString = hashString.concat(request.getParameter("key"));
						hash = Easebuzz_Generatehash512("SHA-512", hashString);

						String responseHash = request.getParameter("hash");
						if (hash.trim().equals(responseHash.trim())) {
							Map<String, String[]> parameters1 = request.getParameterMap();
							//out.print("<div class='container'><ul class='text-center '>");
							for (String parameter : parameters1.keySet())

							//out.print("<div ><li class='list-group-item list-group-item-success'>"

							//+parameter + " : " + parameters1.get(parameter)[0].toString() + "</li></div><br/>");
							{

								//if (parameters1.get(parameter)[0].toString().isBlank() || parameters1.get(parameter)[0].toString().isEmpty()
								//|| parameters1.get(parameter)[0].toString() == null) {
							//continue;
								//}
								//System.out.println(" Field Name : " + parameter);
								if (parameter.equals("firstname") || parameter.equals("addedon") || parameter.equals("mode")
								|| parameter.equals("bank_ref_num") || parameter.equals("email") || parameter.equals("txnid")
								|| parameter.equals("amount") || parameter.equals("phone") || parameter.equals("status")
								|| parameter.equals("easepayid")) {

							//System.out.println(" Field Name : "+parameter);
						%><div class="form-field">
							<label for="txnid"><%=parameter%><sup>*</sup></label> <input
								id="txnid" class="txnid" name="txnid"
								value=<%=parameters1.get(parameter)[0].toString()%> disabled>
						</div>

						<%
						}
						}
						//out.print("</ul></div>");
						} else {
						//out.print("something wrong happend");

						}
						%>
					</div>
					<div class="btn-submit">
						<button type="button" onclick="window.print()">Print</button>
					</div>
				</div>
			</form>
		</div>

	</div>


</body>
</html>
