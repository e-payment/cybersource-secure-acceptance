<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.*" %>
<%@ include file="config.jsp" %>
<%!
    private String getUTCDateTime() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'", new Locale("en", "EN"));
        sdf.setTimeZone(TimeZone.getTimeZone("UTC"));

        return sdf.format(new Date());
    }
%>
<%
String responsePage = request.getRequestURL().toString();
responsePage        = responsePage.replaceAll("payment-form.jsp", "response.jsp");
%>
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
		        	<h2>SOP - Payment Form</h2>
		        </div>
	        	<div class="content">
	        		<div class="row">
	        			<div class="col-md-12 col-lg-8">
	        				<div class="products">
	        					<form class="form-horizontal" id="payment_form" action="./payment-confirm.jsp" method="post">
	        						<input type="hidden" name="transaction_uuid" value="<%= UUID.randomUUID() %>">
								    <input type="hidden" name="signed_date_time" value="<%= getUTCDateTime() %>">
								
								    <input type="hidden" name="signed_field_names" value="profile_id,access_key,transaction_uuid,signed_field_names,unsigned_field_names,signed_date_time,locale,payment_method,transaction_type,reference_number,auth_trans_ref_no,amount,currency,merchant_descriptor,override_custom_receipt_page">
    								<input type="hidden" name="unsigned_field_names" value="device_fingerprint_id,card_type,card_number,card_expiry_date,card_cvn,bill_to_forename,bill_to_surname,bill_to_email,bill_to_phone,bill_to_address_line1,bill_to_address_line2,bill_to_address_city,bill_to_address_state,bill_to_address_country,bill_to_address_postal_code,customer_ip_address,line_item_count,item_0_code,item_0_sku,item_0_name,item_0_quantity,item_0_unit_price,item_1_code,item_1_sku,item_1_name,item_1_quantity,item_1_unit_price,merchant_defined_data1,merchant_defined_data2,merchant_defined_data3,merchant_defined_data4">
    								
    								<div id="paymentDetailsSection" class="section">
								    	<h3 class="title text-left">Config</h3>
								    	<div class="form-group row form-group-sm">
											<label class="col-sm-4 col-form-label col-form-label-sm">merchant_id</label>
											<div class="col-sm-8">
												<input type="text" class="form-control form-control-sm" name="merchant_id" value="<%= MERCHANT_ID %>">
											</div>
										</div>
										<div class="form-group row form-group-sm">
											<label class="col-sm-4 col-form-label col-form-label-sm">profile_id</label>
											<div class="col-sm-8">
												<input type="text" class="form-control form-control-sm" name="profile_id" value="<%= PROFILE_ID %>">
											</div>
										</div>
										<div class="form-group row form-group-sm">
											<label class="col-sm-4 col-form-label col-form-label-sm">access_key</label>
											<div class="col-sm-8">
												<input type="text" class="form-control form-control-sm" name="access_key" value="<%= ACCESS_KEY %>">
											</div>
										</div>
										<div class="form-group row form-group-sm">
											<label class="col-sm-4 col-form-label col-form-label-sm">secret_key</label>
											<div class="col-sm-8">
												<input type="text" class="form-control form-control-sm" name="secret_key" value="<%= SECRET_KEY %>">
											</div>
										</div>
								    	<br />
								    	
		        						<h3 class="title text-left">Signed Data Fields</h3>
		        						<p class="subtitle">These fields will be POSTed to your server for signing using the Security file included in the sample script.<br>
	       									The name of each signed field should be included in the signed_field_names.</p>
	       								<h2 class="h2title">Payment Information</h2>
	       								<div class="form-group row form-group-sm">
											<label class="col-sm-4 col-form-label col-form-label-sm">payment_method</label>
											<div class="col-sm-8">
												<input type="text" class="form-control form-control-sm" name="payment_method">
											</div>
										</div>
										<div class="form-group row">
											<label class="col-sm-4 col-form-label col-form-label-sm">transaction_type</label>
											<div class="col-sm-4">
												<input type="text" class="form-control form-control-sm" name="transaction_type" value="sale">
											</div>
											<div class="col-sm-4">
												authorization, sale
											</div>
										</div>
										<div class="form-group row">
											<label class="col-sm-4 col-form-label col-form-label-sm">create_token</label>
											<div class="col-sm-8">
												<input type="checkbox" id="create_token" onclick="createToken(this)">
											</div>
										</div>
										<div class="form-group row">
											<label class="col-sm-4 col-form-label col-form-label-sm">reference_number</label>
											<div class="col-sm-8">
												<input type="text" class="form-control form-control-sm" name="reference_number">
											</div>
										</div>
										<div class="form-group row">
											<label class="col-sm-4 col-form-label col-form-label-sm"><strong>auth_trans_ref_no</strong></label>
											<div class="col-sm-8">
												<input type="text" class="form-control form-control-sm" name="auth_trans_ref_no">
											</div>
										</div>
										<div class="form-group row">
											<label class="col-sm-4 col-form-label col-form-label-sm">amount</label>
											<div class="col-sm-8">
												<input type="text" class="form-control form-control-sm" name="amount">
											</div>
										</div>
										<div class="form-group row">
											<label class="col-sm-4 col-form-label col-form-label-sm">currency</label>
											<div class="col-sm-8">
												<input type="text" class="form-control form-control-sm" name="currency" max="3">
											</div>
										</div>
										<div class="form-group row">
											<label class="col-sm-4 col-form-label col-form-label-sm">locale</label>
											<div class="col-sm-4">
												<input type="text" class="form-control form-control-sm" name="locale">
											</div>
											<div class="col-sm-4">
												<small>(en-us, th-th, ja-jp)</small>
											</div>
										</div>
										<div class="form-group row">
											<label class="col-sm-4 col-form-label col-form-label-sm">merchant_descriptor</label>
											<div class="col-sm-8">
												<input type="text" class="form-control form-control-sm" name="merchant_descriptor" value="Krungsri">
											</div>
										</div>
										<h3 class="title text-left">Unsigned Data Fields</h3>
		        						<p class="subtitle">The name of each unsigned field should be included in the unsigned_field_names.</p>
	       								<h2 class="h2title">Billing Information</h2>
	       								<div class="form-group row">
											<label class="col-sm-4 col-form-label col-form-label-sm">bill_to_forename</label>
											<div class="col-sm-8">
												<input type="text" class="form-control form-control-sm" name="bill_to_forename">
											</div>
										</div>
										<div class="form-group row">
											<label class="col-sm-4 col-form-label col-form-label-sm">bill_to_surname</label>
											<div class="col-sm-8">
												<input type="text" class="form-control form-control-sm" name="bill_to_surname">
											</div>
										</div>
										<div class="form-group row">
											<label class="col-sm-4 col-form-label col-form-label-sm">bill_to_email</label>
											<div class="col-sm-8">
												<input type="text" class="form-control form-control-sm" name="bill_to_email">
											</div>
										</div>
										<div class="form-group row">
											<label class="col-sm-4 col-form-label col-form-label-sm">bill_to_phone</label>
											<div class="col-sm-8">
												<input type="text" class="form-control form-control-sm" name="bill_to_phone">
											</div>
										</div>
										<div class="form-group row">
											<label class="col-sm-4 col-form-label col-form-label-sm">bill_to_address_line1</label>
											<div class="col-sm-8">
												<input type="text" class="form-control form-control-sm" name="bill_to_address_line1" maxlength="60">
											</div>
										</div>
										<div class="form-group row">
											<label class="col-sm-4 col-form-label col-form-label-sm">bill_to_address_line2</label>
											<div class="col-sm-8">
												<input type="text" class="form-control form-control-sm" name="bill_to_address_line2" maxlength="60">
											</div>
										</div>
										<div class="form-group row">
											<label class="col-sm-4 col-form-label col-form-label-sm">bill_to_address_city</label>
											<div class="col-sm-8">
												<input type="text" class="form-control form-control-sm" name="bill_to_address_city">
											</div>
										</div>
										<div class="form-group row">
											<label class="col-sm-4 col-form-label col-form-label-sm">bill_to_address_state</label>
											<div class="col-sm-8">
												<input type="text" class="form-control form-control-sm" name="bill_to_address_state">
											</div>
										</div>
										<div class="form-group row">
											<label class="col-sm-4 col-form-label col-form-label-sm">bill_to_address_country</label>
											<div class="col-sm-8">
												<input type="text" class="form-control form-control-sm" name="bill_to_address_country">
											</div>
										</div>
										<div class="form-group row">
											<label class="col-sm-4 col-form-label col-form-label-sm">bill_to_address_postal_code</label>
											<div class="col-sm-8">
												<input type="text" class="form-control form-control-sm" name="bill_to_address_postal_code">
											</div>
										</div>
									</div>
									
								    <input type="hidden" name="override_custom_receipt_page" value="<%= responsePage %>">
								
								    <!-- MDD START -->					
								    <input type="hidden" name="customer_ip_address" value="<%= request.getRemoteAddr() %>">
								
								    <input type="hidden" name="line_item_count" value="2" />
								
								    <input type="hidden" name="item_0_sku" value="sku001" />
								    <input type="hidden" name="item_0_code" value="KFLTFDIV" />
								    <input type="hidden" name="item_0_name" value="KFLTFDIV" />
								    <input type="hidden" name="item_0_quantity" value="100" />
								    <input type="hidden" name="item_0_unit_price" value="5.72" />
								
								    <input type="hidden" name="item_1_sku" value="sku002" />
								    <input type="hidden" name="item_1_code" value="KFLTFD70" />
								    <input type="hidden" name="item_1_name" value="KFLTFD70" />
								    <input type="hidden" name="item_1_quantity" value="100" />
								    <input type="hidden" name="item_1_unit_price" value="10.00" />
								
								    <input type="hidden" name="merchant_defined_data1" value="MDD#1" />
								    <input type="hidden" name="merchant_defined_data2" value="MDD#2" />
								    <input type="hidden" name="merchant_defined_data3" value="MDD#3" />
								    <input type="hidden" name="merchant_defined_data4" value="MDD#4" />
								    <!-- MDD END -->
								    <br>
									<input type="submit" class="btn btn-primary" id="btn_submit" value="Submit">
									
	        					</form>
	        				</div>
	        			</div>
	        			<div class="col-md-12 col-lg-4">
			 				<div class="summary">
			 					<h3 class="title">Your cart <span class="badge badge-secondary badge-pill">2</span></h3>			 					
			 					<div class="item">
					              	<span class="price">฿572</span>
					              	<p class="item-name">Product Item 1</p>
					              	<p class="item-description">Brief description</p>
					            </div>
					            <div class="item">
					              	<span class="price">฿1,000</span>
					              	<p class="item-name">Product Item 2</p>
					              	<p class="item-description">Brief description</p>
					            </div>
					            <div class="total">Total<span class="price">฿1,572</span></div>
				 			</div>
			 			</div>
	        		</div>
	        		<hr>
	        		<div class="row text-center">
	        			<div class="col-md-12">
	        				<a href="./" class="btn btn-lg btn-dark">&lt;&lt; BACK</a>
	        			</div>
	        		</div>
	        	</div>
			</div>
		</section>
	</main>
<script src="../resources/jquery/jquery-3.4.1.min.js"></script>
<script src="../resources/bootstrap-4.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../resources/js/payment-form.js"></script>
<script type="text/javascript">
    
    function createToken(create_token) {

        var type = 'sale';

        if (create_token.checked) {
            type += ',create_payment_token';
        }

        $("input[name='transaction_type']").val(type);
    }
</script>
</body>
</html>