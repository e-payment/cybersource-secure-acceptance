<%@ page contentType="text/html;charset=UTF-8"  language="java" pageEncoding="UTF-8"%>
<%@ page import="java.text.*" %>
<%@ page import="java.util.*" %>
<%
    SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd", new Locale("en", "EN"));
	//sdf.setTimeZone(TimeZone.getTimeZone("UTC"));
	String targetDate = df.format(new Date());
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
				<td>Username</td>
				<td><input type="text" name="username" value="itcybs"></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input type="text" name="password" value="Password106"></td>
			</tr>
			<tr>
				<td>type</td>
				<td><input type="text" name="type" value="transaction"></td>
			</tr>
			<tr>	
				<td>subtype</td>
				<td>
					<select name="subtype">
						<option value="transactionDetail" selected="selected">transactionDetail</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>requestID</td>
				<td><input type="text" name="requestID" value=""></td>
			</tr>
			<tr>
				<td>Merchant Reference Number (use either this identifier or the request id, not both)</td>
				<td><input type="text" name="merchantReferenceNumber" value="REF-000001"></td>
			</tr>
			<tr>
				<td>Target Date (used with the merchant reference number. Format: YYYYMMDD)</td>
				<td><input type="text" name="targetDate" value="<%= targetDate %>"></td>
			</tr>
			<tr>
				<td>version (corresponds to a TDR DTD version)</td>
				<td><input type="text" name="versionNumber" value="1.9"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Submit"/></td>
			</tr>
		</tbody>
		</table>
	</form>
</body>
</html>
