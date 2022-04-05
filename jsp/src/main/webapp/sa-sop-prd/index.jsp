<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
	<title>CyberSource Secure Acceptance</title>
	<meta equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link type="image/x-icon" href="../favicon.ico" rel="shortcut icon">
	<link rel="stylesheet" href="../resources/bootstrap-4.4.1/css/bootstrap.min.css">
	<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
	<link rel="stylesheet" href="../resources/css/theme.css">
</head>
<body>
	<main class="page">
		<section class="payment-form dark">
			<div class="container">
				<div class="block-heading">
					<div class="logo">
						<img src="../resources/img/cybs-logo.png">
					</div>
		        	<h2>Secure Acceptance - Silent Order Post</h2>
		        	<ul class="list-unstyled">
						<li><a href="payment-form.jsp">Payment</a></li>
						<li><a href="payment-token.jsp">Tokenization</a></li>
						<li><a href="payment-recurring.jsp">Recurring Billing</a></li>
						<li>Installment</li>
					</ul>
					<h3>Test CyberSource Business Center</h3>
					<ul class="list-unstyled">
						<li><a href="https://ebctest.cybersource.com/ebctest/login/Login.do" target="_cybs_">Login</a></li>
					</ul>
		        </div>
		        <hr>
        		<div class="row text-center">
        			<div class="col-md-12">
        				<a href="../" class="btn btn-lg btn-dark">&lt;&lt; BACK</a>
        			</div>
        		</div>
			</div>
		</section>
	</main>
<script src="../resources/jquery/jquery-3.4.1.min.js"></script>
<script src="../resources/bootstrap-4.4.1/js/bootstrap.min.js"></script>
</body>
</html>