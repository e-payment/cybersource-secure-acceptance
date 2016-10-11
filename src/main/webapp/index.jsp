<%@ page contentType="text/html;charset=UTF-8"  language="java" pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.TimeZone" %>
<%@ page import="java.util.UUID" %>
<%@ page import="java.util.Locale" %>

<%
	request.setCharacterEncoding("UTF-8");
	String contextPath = request.getContextPath();
%>

<html>

	<head>
		<title>Secure Acceptance - Payment Form Example</title>
		<link rel="stylesheet" type="text/css" href="<%=contextPath%>/css/payment.css"/>
		<script type="text/javascript" src="<%=contextPath%>/js/jquery-1.7.min.js"></script>
		<script type="text/javascript" src="<%=contextPath%>/js/payment_form.js"></script>
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
					<form id="payment_form" action="<%=contextPath%>/cybs-confirmation.jsp" method="POST">
						<input type="hidden" name="access_key" value="f854903616a93495b4dfccbd075bad8b">
						<input type="hidden" name="profile_id" value="291CDD47-6036-4C1E-BB97-B5CDA504B76F">
						<!--<input type="hidden" name="key_name" value="krungsri">-->
						<input type="hidden" name="transaction_uuid" value="<%=UUID.randomUUID()%>">
						<input type="hidden" name="signed_field_names"
							value="access_key,profile_id,transaction_uuid,signed_field_names,unsigned_field_names,signed_date_time,locale,transaction_type,reference_number,amount,currency">
						<input type="hidden" name="unsigned_field_names" value="override_backoffice_post_url,override_custom_cancel_page,signature">
						<input type="hidden" name="signed_date_time" value="<%=getUTCDateTime()%>">


						<input type="hidden" name="locale" value="en-US">
						<input type="hidden" name="override_backoffice_post_url" value="http://www.google.com">
						<input type="hidden" name="override_custom_cancel_page" value="http://www.google.com">

						<table>
							<tr>
								<td valign="top" align="right">
									<br/>
									<fieldset style='text-align: left;'>
										<legend><b>Payment Details</b></legend>

										<table>
											<tr>
												<td>transaction_type:</td>
												<td>
													<select id="transaction_type" name="transaction_type">
														<option value="sale" selected="true">Sale</option>
														<option value="authorization">Authorization</option>
													</select>
												</td>
											</tr>
											<tr>
												<td>reference_number:</td>
												<td><input type="text" name="reference_number" size="20" value='REF-001'></td>
											</tr>
											<tr>
												<td>amount:</td>
												<td><input type="text" name="amount" size="20" value='350'></td>
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
												<td>currency:</td>
												<td>
													<select id="currency" name="currency">
														<option value="THB" selected="true">THB - Thai Baht</option>
														<option value="USD">USD - US Dollar</option>
													</select>
												</td>
											</tr>
										</table>

									</fieldset>

									<br/>

									<input type="submit" id="submit" name="submit" value="Submit"/>&nbsp;&nbsp;&nbsp;
								</td>
								<td>
									<img alt="" src="<%=contextPath%>/images/galaxy note II.jpg"/>
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

	</body>
</html>

<%!
	private String getUTCDateTime() {
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'", new Locale("en", "EN"));
		sdf.setTimeZone(TimeZone.getTimeZone("UTC"));

		return sdf.format(new Date());
	}
%>
