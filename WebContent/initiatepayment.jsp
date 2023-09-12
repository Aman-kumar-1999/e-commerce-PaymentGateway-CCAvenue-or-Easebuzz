
<%@page import="org.json.*"%>
<%@page import="java.io.PrintStream"%>
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
<%@page import="javax.net.*"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.*"%>
<%@page import="java.io.FileReader"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="assets/css/style.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
	
<style type="text/css">
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
<title>Initiate Payment API</title>

</head>

<body>
	<div class="grid-container">
		<header class="wrapper">
			<div class="logo">
				<a href="https://eqipped.com"> <img src="https://eqipped.com/eqipped_1.png" alt="Easebuzz">
				</a>
			</div>

			<div class="hedding">
				<h2>
					<a class="highlight" href="">Back</a>
				</h2>
			</div>
		</header>

		<div class="form-container">
			<h2>INITIATE PAYMENT API</h2>
			<hr>
			<form method="POST" name="initiatePayment"
				action="initiate_payment_invoke">

				<div class="main-form">
					<h3>Mandatory Parameters</h3>
					<hr>
					<div class="mandatory-data">
						<div class="form-field">
							<label for="txnid">Transaction ID<sup>*</sup></label> <input
								id="txnid" class="txnid" name="txnid" value="T31Q6JT8HB"
								required placeholder="T31Q6JT8HB">
						</div>

						<div class="form-field">
							<label for="amount">Amount<sup>(should be float)*</sup></label> <input
								id="amount" class="amount" name="amount" value="125.25" required
								placeholder="125.25">
						</div>

						<div class="form-field">
							<label for="firstname">First Name<sup>*</sup></label> <input
								id="firstname" class="firstname" name="firstname"
								value="Easebuzz Pvt. Ltd" required
								placeholder="Easebuzz Pvt. Ltd.">
						</div>

						<div class="form-field">
							<label for="email">Email ID<sup>*</sup></label> <input id="email"
								class="email" name="email" value="amankumar19990923@gmail.com"
								required placeholder="initiate.payment@easebuzz.in">
						</div>

						<div class="form-field">
							<label for="phone">Phone<sup>*</sup></label> <input id="phone"
								class="phone" name="phone" value="0123456789" required
								placeholder="0123456789">
						</div>

						<div class="form-field">
							<label for="productinfo">Product Information<sup>*</sup></label>
							<input id="productinfo" class="productinfo" name="productinfo"
								value="Windows" required placeholder="Apple Laptop">
						</div>

						<div class="form-field">
							<label for="surl">Success URL<sup>*</sup></label> <input
								id="surl" class="surl" name="surl"
								value="http://localhost:8090/EasebuzzCcavenuePayment/response"
								required>
						</div>

						<div class="form-field">
							<label for="furl">Failure URL<sup>*</sup></label> <input
								id="furl" class="furl" name="furl"
								value="http://localhost:8090/EasebuzzCcavenuePayment/response"
								required>
						</div>

					</div>

					<h3>Optional Parameters</h3>
					<hr>
					<div class="optional-data">

						<div class="form-field">
							<label for="udf1">UDF1</label> <input id="udf1" class="udf1"
								name="udf1" value="" placeholder="User description1">
						</div>

						<div class="form-field">
							<label for="udf2">UDF2</label> <input id="udf2" class="udf2"
								name="udf2" value="" placeholder="User description2">
						</div>

						<div class="form-field">
							<label for="udf3">UDF3</label> <input id="udf3" class="udf3"
								name="udf3" value="" placeholder="User description3">
						</div>

						<div class="form-field">
							<label for="udf4">UDF4</label> <input id="udf4" class="udf4"
								name="udf4" value="" placeholder="User description4">
						</div>

						<div class="form-field">
							<label for="udf5">UDF5</label> <input id="udf5" class="udf5"
								name="udf5" value="" placeholder="User description5">
						</div>


					</div>


					<div class="btn-submit">
						<button type="submit">SUBMIT</button>
					</div>
				</div>
			</form>
		</div>

	</div>
</body>

</html>
