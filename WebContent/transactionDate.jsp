<%-- 
    Document   : transactions
    Created on : 24 May, 2018, 11:18:40 AM
    Author     : Easebuzz
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="assets/css/style.css">
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
<title>Transactional Date wise Page</title>

</head>

<body>
	<div class="grid-container">
		<header class="wrapper">
			<div class="logo">
				<a href="#"> <img src="assets/images/eb-logo.svg" alt="Easebuzz">
				</a>
			</div>

			<div class="hedding">
				<h2>
					<a class="highlight" href="/Easebuzz_javaKit/index.jsp">Back</a>
				</h2>
			</div>
		</header>
	</div>

	<div class="form-container">
		<h2>TRANSACTION DATE API</h2>
		<hr>
		<form method="POST" action="transaction_date_return">

			<div class="main-form">
				<h3>Mandatory Parameters</h3>
				<hr>
				<div class="mandatory-data">
					<div class="form-field">
						<label for="merchant_email">Merchant Email ID<sup>*</sup></label>
						<input id="merchant_email" class="merchant_email"
							name="merchant_email" value="" required
							placeholder="date.transaction@easebuzz.in">
					</div>

					<div class="form-field">
						<label for="transaction_date">Transaction Date<sup>*</sup></label>
						<input id="transaction_date" class="transaction_date"
							name="transaction_date" value="" required
							placeholder="DD-MM-YYYY">
					</div>


				</div>

				<div class="btn-submit">
					<button type="submit">Submit</button>
				</div>
			</div>
		</form>
	</div>

	<!-- import javascript file -->
	<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
</body>

</html>
