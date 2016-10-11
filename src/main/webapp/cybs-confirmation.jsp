<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>

<%@ page import="java.util.Enumeration" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>

<%@ include file="cybs-secure-acceptance.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");
	Iterator paramsIterator = null;
	String contextPath = request.getContextPath();
%>

<html>
	<head>
		<link rel="stylesheet" type="text/css" href="<%=contextPath%>/css/payment.css"/>
		<title>Secure Acceptance - Payment Form Example</title>
	</head>

	<body>
		<%
			HashMap params = new HashMap();
			Enumeration paramsEnum = request.getParameterNames();

			while (paramsEnum.hasMoreElements())
			{
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
							while (paramsIterator.hasNext())
							{
								Map.Entry param = (Map.Entry) paramsIterator.next();
								out.print("<input type=\"hidden\" id=\"" + param.getKey()
											+ "\" name=\"" + param.getKey()
											+ "\" value=\"" + param.getValue()
											+ "\"/>\n");
							}

							out.print("<input type=\"hidden\" id=\"signature\" name=\"signature\" value=\"" + sign(params) + "\"/>\n");
						%>

						<!--<table width='100%'>-->
						<table>
							<tr>
								<!--<td valign="top" width='50%' align="right">-->
								<td valign="top" align="right">
									<br/>
									<!--<fieldset id="confirmation" style='width: 50%;text-align: left;'>-->
									<fieldset id="confirmation" style='text-align: left;'>
										<legend><b>Review Payment Details</b></legend>

										<table>
											<%
												paramsIterator = params.entrySet().iterator();
												while (paramsIterator.hasNext())
												{
													Map.Entry param = (Map.Entry) paramsIterator.next();

													String keyStr = (String)param.getKey();
													String valStr = (String)param.getValue();

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

									</fieldset>

									<br/>

									<input type="submit" id="submit" value="Confirm"/>&nbsp;&nbsp;&nbsp;
								</td>
							</tr>
						</table>

					</form>
				</td>
			</tr>

		</table>

	</body>
</html>
