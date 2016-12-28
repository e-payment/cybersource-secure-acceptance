<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<%@ include file="cybs-secure-acceptance.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	String contextPath = request.getContextPath();
	Iterator paramsIterator = null;
%>

<html>
	<head>
		<link rel="stylesheet" type="text/css" href="<%=contextPath%>/css/payment.css"/>
		<title>Secure Acceptance - Payment Form Example</title>
	</head>

	<body>
		<%
			Map params = new HashMap();
			Enumeration paramsEnum = request.getParameterNames();

			while (paramsEnum.hasMoreElements()) {
				String paramName = (String) paramsEnum.nextElement();
				String paramValue = request.getParameter(paramName);
				System.out.println(paramValue);
				params.put(paramName, paramValue);
			}
		%>

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
					<form action="https://testsecureacceptance.cybersource.com/pay" method="post"/>
						<%
							paramsIterator = params.entrySet().iterator();
							while (paramsIterator.hasNext()) {

								Map.Entry param = (Map.Entry) paramsIterator.next();
								out.print("<input type=\"hidden\" id=\"" + param.getKey()
											+ "\" name=\"" + param.getKey()
											+ "\" value=\"" + param.getValue()
											+ "\"/>\n");
							}

							out.print("<input type=\"hidden\" id=\"signature\" name=\"signature\" value=\"" + sign(params) + "\"/>\n");
						%>

						<table>
							<tr>
								<td valign="top" align="right">
									<br/>
									<fieldset id="confirmation" style='text-align: left;'>
										<legend><b>Review Payment Details</b></legend>
										<div style="width: 960px; overflow: auto;">
										<table>
											<%
												paramsIterator = params.entrySet().iterator();
												while (paramsIterator.hasNext()) {

													Map.Entry param = (Map.Entry) paramsIterator.next();
													String keyStr = (String) param.getKey();
													String valStr = (String) param.getValue();

													/*if ("reference_number".equals(keyStr) || "amount".equals(keyStr))
													{*/%>


														<!--<div>

															<span class="fieldName"></%/=param.getKey()%>:</span>
															<span class="fieldValue"></%/=param.getValue()%></span>

														</div>-->


														<tr>
															<td><%=keyStr%>:</td>
															<td><%=valStr%></td>
														</tr>

													<%//}
												}
											%>
										</table>
										<div>
									</fieldset>
								</td>
							</tr>
							<tr>
								<td valign="top" align="center">
									<input type="submit" id="submit" value="Confirm"/>
								</td>
							</tr>
						</table>

					</form>
				</td>
			</tr>

		</table>

	</body>
</html>
