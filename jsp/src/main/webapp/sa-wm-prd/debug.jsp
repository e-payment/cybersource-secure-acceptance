<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Debug</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link type="image/x-icon" href="../favicon.png" rel="shortcut icon">
    <link rel="stylesheet" type="text/css" href="../Resources/css/payment.css"/>
</head>
<body>
<img src="../Resources/img/logo-cybersource.png" style="padding-bottom: 10px;" />
<h2>Debug</h2>

<div style="display: block">
    <fieldset>
        <legend>Request Fields</legend>
        <%
            Map params = new HashMap();
            List<String> keys = Collections.list(request.getParameterNames());
            Collections.sort(keys);

            for (String name: keys) { 
                String value = (String) request.getParameter(name);

                out.print("<div>\n");
                out.print("<span class='fieldName'>" + name + "</span><span class='fieldValue'>" + value + "</span>\n");
                out.print("</div>\n");
            }
        %>
    </fieldset>
</div>

<hr/>
<p><a href="./">&lt;&lt; BACK</a></p>

</body>
</html>