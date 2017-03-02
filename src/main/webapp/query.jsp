<%@ page contentType="text/html;charset=UTF-8"  language="java" pageEncoding="UTF-8"%>
<%@ page import="java.text.*" %>
<%@ page import="java.util.*" %>
<%

    SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd", new Locale("en", "EN"));
	// String targetDate = df.format(new Date());
	String targetDate = "20170302";

%>
<!doctype html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>Single Transaction Query</title>
 </head>
<html>
<head>
	<title>Single Transaction Query</title>
</head>
<body>
	<form action="https://ebctest.cybersource.com/ebctest/Query" method="POST" id="frmSTQ" >
		<table>
		<tbody>
			<tr>
				<td>Merchant ID</td>
				<td><input type="text" name="merchantID" value="kr950210047"></td>
			</tr>
			<tr>
				<td>type</td>
				<td><input type="text" name="type" value="transaction" readonly="readonly"></td>
			</tr>
			<tr>	
				<td>subtype</td>
				<td><input type="text" name="subtype" value="transactionDetail" readonly="readonly"></td>
			</tr>
			<tr>
				<td>requestID</td>
				<td><input type="text" name="requestID" value=""></td>
			</tr>
			<tr>
				<td>Merchant Reference Number</td>
				<td><input type="text" name="merchantReferenceNumber" value="1488467770396"></td>
			</tr>
			<tr>
				<td>Target Date (YYYYMMDD)</td>
				<td><input type="text" name="targetDate" value="<%= targetDate %>"></td>
			</tr>
			<tr>
				<td>version</td>
				<td><input type="text" name="versionNumber" value="1.7"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Submit"/></td>
			</tr>
		</tbody>
		</table>
	</form>
</body>
</html>
