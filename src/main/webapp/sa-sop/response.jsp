<%@ page contentType="text/html;charset=UTF-8"  language="java" pageEncoding="UTF-8"%>
<%@ include file="security.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Receipt</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link type="image/x-icon" href="../favicon.png" rel="shortcut icon">
    <link rel="stylesheet" type="text/css" href="../css/payment.css"/>
</head>
<body>
<img src="../img/logo-cybersource.png" style="padding-bottom: 10px;" />
<h2>SOP - Receipt</h2>

<hr/>
<div style="display: block">
<pre>
<%

	String decision     = request.getParameter("decision");
	String reasonCode   = request.getParameter("reason_code");
	String message      = request.getParameter("message");
	String refNumber    = request.getParameter("req_reference_number");
	String reconcileId  = request.getParameter("auth_trans_ref_no");
	String amount       = request.getParameter("auth_amount");
	String currency     = request.getParameter("req_currency");
	String signature    = request.getParameter("signature");

	out.println("decision        : " + decision);
	out.println("reasonCode      : " + reasonCode);
	out.println("message         : " + message);
	out.println("ref number      : " + refNumber);
	out.println("reconcile Id    : " + reconcileId);

	if (amount != null) {
	    out.println("amount          : " + amount + " " + currency);
	}
	
	out.println("payment_token   : " + request.getParameter("payment_token"));

    Map params = new HashMap();
    List<String> keys = Collections.list(request.getParameterNames());
    Collections.sort(keys);

    for (String key : keys) {
        params.put(key, request.getParameter(key));
    }

	boolean signed = signature.equals(sign(params));
	out.println("valid signature : " + signed);
%>
</pre>
<div style="display: block">
    <fieldset>
        <legend>Response Fields</legend>
<%

    for (String name: keys) { 
        String value = (String) request.getParameter(name);

        out.println("<div>");
        out.println("<span class='fieldName'>" + name + "</span><span class='fieldValue'>" + value + "</span>");
        out.println("</div>");
    }

%>
    </fieldset>
</div>

<hr/>
<p><a href="./">&lt;&lt; BACK</a></p>

</body>
</html>
