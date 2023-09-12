
<%@page import="org.springframework.web.client.RestTemplate"%>
<%@page import="org.springframework.http.HttpMethod"%>
<%@page import="org.springframework.http.HttpEntity"%>
<%@page import="org.springframework.http.MediaType"%>
<%@page import="org.springframework.http.HttpHeaders"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="com.google.gson.Gson"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.io.*,java.util.*,com.ccavenue.security.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
	<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
	
<title>Response Handler</title>
<script type="text/javascript">
	function print() {
		window.print();
	}
</script>
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
</style>
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
					<button type="button" onclick="window.print()" class="btn btn-danger m-0"
						>
						<span class="material-symbols-outlined"> print </span>
						<p class='p-0 m-0'>Print</p>
					</button>
				</div>

			</div>

		</header>
		<%
		String workingKey = ""; //32 Bit Alphanumeric Working Key should be entered here so that data can be decrypted.
		String encResp = request.getParameter("encResp");
		AesCryptUtil aesUtil = new AesCryptUtil(workingKey);
		String decResp = aesUtil.decrypt(encResp);
		StringTokenizer tokenizer = new StringTokenizer(decResp, "&");
		Hashtable hs = new Hashtable();
		String pair = null, pname = null, pvalue = null;
		while (tokenizer.hasMoreTokens()) {
			pair = (String) tokenizer.nextToken();
			if (pair != null) {
				StringTokenizer strTok = new StringTokenizer(pair, "=");
				pname = "";
				pvalue = "";
				if (strTok.hasMoreTokens()) {
			pname = (String) strTok.nextToken();
			if (strTok.hasMoreTokens())
				pvalue = (String) strTok.nextToken();
			hs.put(pname, pvalue);
				}
			}
		}
		%><div class="form-container">
			<h2>Payment Received</h2>
			<hr>
			<form method="POST" name="initiatePayment"
				action="initiate_payment_invoke">

				<div class="main-form">
					<h3>Payments Details</h3>
					<hr>
					<div class="mandatory-data">
						<%
						Enumeration enumeration = hs.keys();
						while (enumeration.hasMoreElements()) {
							
							pname = "" + enumeration.nextElement();
							pvalue = "" + hs.get(pname);
							
							if (pname.equals("trans_date") || pname.equals("amount") || pname.equals("tracking_id")
									|| pname.equals("discount_value") || pname.equals("billing_email") || pname.equals("status_message")
									|| pname.equals("payment_mode") || pname.equals("mer_amount") || pname.equals("order_status")
									|| pname.equals("order_id")) {
									
							
						%>
						<div class="form-field">
							<label for="txnid"><%=pname%><sup>*</sup></label> <input
								id="txnid" class="txnid" name="txnid" value=<%=pvalue%> disabled>
						</div>
						<%
							}
						}
						
						// Start Calling  api for Create Order Response

						//Map<String, String> paramsResponse = new HashMap<String, String>();
						//while (enumeration.hasMoreElements()) {
						//	String paramName = (String) enumeration.nextElement();

						//	String paramValue = ((String) request.getParameter(paramName)).trim();
						//	paramsResponse.put(paramName, paramValue);
						//}

						//Gson gson = new Gson();
						//String jsonResponse = gson.toJson(hs);
						//System.out.println("JSON RESPONSE : " + jsonResponse);

						//URL url = new URL("https://api.eqipped.com/order/createOrder/ccavenue/response");
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

						//if (responseCode == 200) {
							//InputStream inputStream = connection.getInputStream();
							//String responseBody = new String(inputStream.readAllBytes(), "UTF-8");
							//System.out.println("Response body: " + responseBody);
						//}
						
						// End Calling  api for Create Order 
					
						
						String responseData = "";
						String url1 = "https://api.eqipped.com/order/createOrder/ccavenue/response";
						try {			
							
							// calling api
							HttpHeaders headers = new HttpHeaders();
							headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
				            headers.add("user-agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36");
							HttpEntity<?> entity = new HttpEntity<>(hs, headers);
							//String url = paymentApiUrl +""+ key +"/"+salt+"?baseUrl="+baseUrl;
							RestTemplate restTemplate = new RestTemplate();
							responseData = restTemplate.exchange(url1, HttpMethod.POST, entity, String.class).getBody();

							System.out.println("Response Body New : "+responseData);
							

						} catch (Exception e) {
							e.printStackTrace();
						}
						
						%>



					</div>
					<div class="btn-submit">
						<button type="button" onclick="window.print()">Print</button>
					</div>//
				</div>
			</form>
		</div>

	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>
