<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="java.util.*" %>
<%@ include file="security.jsp" %>
<%

String sess_id     = request.getSession().getId();
String df_param    = "org_id=" + DF_ORG_ID + "&amp;session_id=" + request.getParameter("merchant_id") + sess_id;
String endponitUrl = PAYMENT_URL;

if ("create_payment_token".equals(request.getParameter("transaction_type"))) {
    endponitUrl = TOKEN_CREATE_URL;
}

%>
<!DOCTYPE html>
<html>
<head>
	<title>CyberSource Secure Acceptance</title>
	<meta equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link type="image/x-icon" href="../favicon.ico" rel="shortcut icon">
	<link rel="stylesheet" href="../resources/bootstrap-4.4.1/css/bootstrap.min.css">
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
		        	<h2>Web/Mobile - Review &amp; Confirm</h2>
		        </div>
	        	<div class="content">
	        		<div class="row">
	        			<div class="col-md-12">
	        				<div class="products">
	        					<form id="payment_confirmation" action="<%= endponitUrl %>" method="post">
	        						<%
									    Map params = new HashMap();
									    List<String> keys = Collections.list(request.getParameterNames());
									    Collections.sort(keys);
									
									    for (String key : keys) {
									        params.put(key, request.getParameter(key));
									    }
									%>
									<h3 class="title text-left">Data Fields</h3>
							        <p class="subtitle">These fields have been signed on your server, and a signature has been generated.<br>
							        This will detect tampering with these values as they pass through the consumers browser to the SA SOP endpoint.</p>
							        <%
							            for (String name: keys) { 
							                String value = (String) params.get(name);
							
							                out.print("<dl class='row' style='margin-bottom: -0.5rem;'>\n");
							                out.print("<dt class='col-sm-3''><small><strong>" + name + "</strong></small></dt>\n");
							                out.print("<dd class='col-sm-9'><small style='word-break: break-word;'>" + value + "</small></dd>\n");
							                out.print("<input type='hidden' id='" + name + "' name='" + name + "' value='" + value + "'/>\n");
							                out.print("</dl>\n");
							            }
							        %>
									<br>
									<input type="hidden" name="device_fingerprint_id" value="<%= sess_id %>" />
								   	<input type="hidden" name="signature" value="<%= sign(params) %>" />
								    <input type="submit" class="btn btn-primary" id="btn_submit" value="Confirm"/>
	        					</form>
	        					<!-- DF START -->
								<div style="color: #ccc; margin-top: 20px;">
								device_fingerprint_param: <%= df_param %>
								<p style="background:url(https://h.online-metrix.net/fp/clear.png?<%= df_param %>&amp;m=1)" />
								<img src="https://h.online-metrix.net/fp/clear.png?<%= df_param %>&amp;m=2" width="1" height="1" />
								</div>
								<!-- DF END -->
	        				</div>
	        			</div>
	        		</div>
	        	</div>
			</div>
		</section>
	</main>
<script src="../resources/jquery/jquery-3.4.1.min.js"></script>
<script src="../resources/bootstrap-4.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../resources/js/payment-tl-form.js"></script>
<script type="text/javascript">
$(function() {
	$("#btn_defaultAll").hide();
});	
</script>
</body>
</html>