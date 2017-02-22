<%@ page contentType="text/html;charset=UTF-8"  language="java" pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.TimeZone" %>
<%@ page import="java.util.UUID" %>
<%@ page import="java.util.Locale" %>
<%
	request.setCharacterEncoding("UTF-8");
	String contextPath = request.getContextPath();

	String accessKey = "f854903616a93495b4dfccbd075bad8b";
	String profileId = "291CDD47-6036-4C1E-BB97-B5CDA504B76F";

	String cancelURL = "http://127.0.0.1:8080/sa/cybs-cancel.jsp";
	//String notifyURL = "http://www.krungsriepayment.net/EPayMerchantTestWeb/test/bgurl.jsp";
	//String notifyURL = "https://www.google.co.th";
%>

<html>

	<head>
		<title>Secure Acceptance - Payment Form Example</title>
		<link rel="stylesheet" type="text/css" href="<%=contextPath%>/css/payment.css"/>
	</head>

	<body>
		<table width='100%'>

			<!-- top -->
			<tr>
				<td align='center'>
					<img alt="" src="<%=contextPath%>/images/cybs_top.jpg"/>
				</td>
			</tr>

			<!-- body -->
			<tr>
				<td align="center">
					<form id="payment_form" action="<%=contextPath%>/cybs-confirm.jsp" method="POST">
						<input type="hidden" name="access_key" value="<%= accessKey %>">
						<input type="hidden" name="profile_id" value="<%= profileId %>">
						<input type="hidden" name="override_custom_cancel_page" value="<%= cancelURL %>">

						<!--<input type="hidden" name="key_name" value="krungsri">-->
						<input type="hidden" name="transaction_uuid" value="<%= UUID.randomUUID() %>">
						<input type="hidden" name="signed_field_names"
							   value="access_key,profile_id,transaction_uuid,signed_field_names,unsigned_field_names,signed_date_time,locale,transaction_type,reference_number,amount,currency">
						<input type="hidden" name="unsigned_field_names" value="override_custom_cancel_page,signature,bill_to_address_line1,bill_to_address_city,bill_to_address_country,bill_to_forename,bill_to_surname,bill_to_email">
						<input type="hidden" name="signed_date_time" value="<%= getUTCDateTime() %>">
						<input type="hidden" name="locale" value="en-US">

						<input type="hidden" name="bill_to_address_line1" value="bill_to_address_line1">
						<input type="hidden" name="bill_to_address_city" value="CITY">
						<input type="hidden" name="bill_to_address_country" value="TH">
						<input type="hidden" name="bill_to_email" value="x@y.com">

						<table>
							<tr>
								<td valign="top" align="right">
									<br/>
									<fieldset style='text-align: left;'>
										<legend><b>Payment Details</b></legend>

										<table>
											<tr>
												<td>Transaction Type:</td>
												<td>
													<select id="transaction_type" name="transaction_type">
														<option value="sale" selected="true">Sale</option>
														<option value="authorization">Authorization</option>
													</select>
												</td>
											</tr>
											<tr>
												<td>Ref No:</td>
												<td><input type="text" name="reference_number" size="20" value='REF-000001'></td>
											</tr>
											<tr>
												<td>Name:</td>
												<td><input type="text" name="bill_to_forename" size="20" value='Name'></td>
											</tr>
											<tr>
												<td>LastName:</td>
												<td><input type="text" name="bill_to_surname" size="20" value='Lastname'></td>
											</tr>
																						<tr>
												<td>Amount:</td>
												<td><input type="text" name="amount" size="20" value='99.99'></td>
											</tr>
											<tr>
												<td>Currency:</td>
												<td>
													<select id="currency" name="currency">
														<option value="THB" selected="true">THB - Thai Baht</option>
														<option value="USD">USD - US Dollar</option>
													</select>
												</td>
											</tr>
										</table>

									</fieldset>

								</td>
								<td>
									<img alt="" src="<%=contextPath%>/images/item001.jpg"/>
								</td>
							</tr>
							<tr>
								<td valign="top" align="center">
									<input type="submit" id="submit" value="Submit"/>
								</td>
							</tr>
						</table>

					</form>
				</td>
			</tr>

			<!-- footer -->
			<tr>

			</tr>
		</table>

		<script src="<%=contextPath%>/js/jquery-1.7.min.js"></script>
		<script src="<%=contextPath%>/js/payment_form.js"></script>

	</body>
</html>

<%!
	private String getUTCDateTime() {
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'", new Locale("en", "EN"));
		sdf.setTimeZone(TimeZone.getTimeZone("UTC"));

		return sdf.format(new Date());
	}
%>
