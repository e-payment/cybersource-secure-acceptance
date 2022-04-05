<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ include file="security.jsp" %>
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
		        	<h2>SOP - Receipt</h2>
		        </div>
	        	<div class="content">
	        		<div class="row">
	        			<div class="col-md-12">
	        				<div class="products">
	        					<div class="alert alert-secondary" role="alert">
	        						<%
										String decision     = request.getParameter("decision");
										String reasonCode   = request.getParameter("reason_code");
										String message      = request.getParameter("message");
										String refNumber    = request.getParameter("req_reference_number");
										String reconcileId  = request.getParameter("auth_trans_ref_no");
										String amount       = request.getParameter("auth_amount");
										String currency     = request.getParameter("req_currency");
										String signature    = request.getParameter("signature");
										
										out.print("<dl class='row' style='margin-bottom: -0.5rem;'>\n");
										out.print("<dt class='col-sm-2''><small><strong>decision</strong></small></dt>\n");
										out.print("<dd class='col-sm-10'><small style='word-break: break-word;'>: " + decision + "</small></dd>\n");
										out.print("</dl>\n");
										out.print("<dl class='row' style='margin-bottom: -0.5rem;'>\n");
										out.print("<dt class='col-sm-2''><small><strong>reasonCode</strong></small></dt>\n");
										out.print("<dd class='col-sm-10'><small style='word-break: break-word;'>: " + reasonCode + "</small></dd>\n");
										out.print("</dl>\n");
										out.print("<dl class='row' style='margin-bottom: -0.5rem;'>\n");
										out.print("<dt class='col-sm-2''><small><strong>message</strong></small></dt>\n");
										out.print("<dd class='col-sm-10'><small style='word-break: break-word;'>: " + message + "</small></dd>\n");
										out.print("</dl>\n");
										out.print("<dl class='row' style='margin-bottom: -0.5rem;'>\n");
										out.print("<dt class='col-sm-2''><small><strong>refNumber</strong></small></dt>\n");
										out.print("<dd class='col-sm-10'><small style='word-break: break-word;'>: " + refNumber + "</small></dd>\n");
										out.print("</dl>\n");
										out.print("<dl class='row' style='margin-bottom: -0.5rem;'>\n");
										out.print("<dt class='col-sm-2''><small><strong>reconcileId</strong></small></dt>\n");
										out.print("<dd class='col-sm-10'><small style='word-break: break-word;'>: " + reconcileId + "</small></dd>\n");
										out.print("</dl>\n");
									
										if (amount != null) {										    
										    out.print("<dl class='row' style='margin-bottom: -0.5rem;'>\n");
											out.print("<dt class='col-sm-2''><small><strong>amount</strong></small></dt>\n");
											out.print("<dd class='col-sm-10'><small style='word-break: break-word;'>: " + amount + " " + currency + "</small></dd>\n");
											out.print("</dl>\n");
										}
																			
										out.print("<dl class='row' style='margin-bottom: -0.5rem;'>\n");
										out.print("<dt class='col-sm-2''><small><strong>payment_token</strong></small></dt>\n");
										out.print("<dd class='col-sm-10'><small style='word-break: break-word;'>: " + request.getParameter("payment_token") + "</small></dd>\n");
										out.print("</dl>\n");
									
									    Map params = new HashMap();
									    List<String> keys = Collections.list(request.getParameterNames());
									    Collections.sort(keys);
									
									    for (String key : keys) {
									        params.put(key, request.getParameter(key));
									    }
									
										boolean signed = signature.equals(sign(params));										
										out.print("<dl class='row' style='margin-bottom: -0.5rem;'>\n");
										out.print("<dt class='col-sm-2''><small><strong>valid signature</strong></small></dt>\n");
										out.print("<dd class='col-sm-10'><small style='word-break: break-word;'>: " + signed + "</small></dd>\n");
										out.print("</dl>\n");
									%>
	        					</div>
	        					
	        					<h3 class="title text-left">Response Fields</h3>
	        					<%
								    for (String name: keys) {
								        String value = (String) request.getParameter(name);
								
								        out.print("<dl class='row' style='margin-bottom: -0.5rem;'>\n");
						                out.print("<dt class='col-sm-4''><small><strong>" + name + "</strong></small></dt>\n");
						                out.print("<dd class='col-sm-8'><small style='word-break: break-word;'>" + value + "</small></dd>\n");
						                out.print("</dl>\n");
								    }								
								%>
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
</body>
</html>