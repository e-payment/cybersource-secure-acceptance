<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*"%>
<%@ include="HOP.jsp"%>
<html>
<body>
<h1>Custom Receipt/Decline Page</h1>
<table border="1">
	<tr>
		<td><b>Field Name</b></td>
		<td><b>Field Value</b></td>
	</tr>
<%

	System.out.println("check request for cyber source");

	try {

		HashMap map = new HashMap();
		Enumeration myEnum = request.getParameterNames();

		while (myEnum.hasMoreElements()) {

	  		String paramName = (String)myEnum.nextElement();
	  		String paramValue = request.getParameter(paramName);

	  		out.print("<tr><td>" + paramName + "</td><td>" + paramValue + "</td></tr>");
	  		map.put(paramName, paramValue);

		}

		out.print("<tr><td>VerifyTransactionSignature()</td><td>" + verifyTransactionSignature(map) + "</td></tr>");

	} catch (Exception e) {

		out.print(e.getMessage);

	}

%>
</table>
</body>
</html>