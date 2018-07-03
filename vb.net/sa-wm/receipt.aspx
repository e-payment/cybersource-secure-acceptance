<%@ Page Language="VB" AutoEventWireup="false" CodeFile="receipt.aspx.vb" Inherits="receipt" %>

<!DOCTYPE html>

<html>
<head>
    <title>Secure Acceptance - Payment Form Example</title>
    <link rel="stylesheet" type="text/css" href="Styles/payment.css"/>
</head>
<body>

<fieldset id="response">
    <legend>Receipt</legend>
    <div>
    <%
        Dim parameters As New Hashtable()

        For Each key In Request.Form.AllKeys()
            Response.Write("<span>" + key + "</span><input type=""text"" name=""" + key + """ size=""50"" value=""" + Request.Params(key) + """ readonly=""true""/><br/>")
            parameters.Add(key, Request.Params(key))
        Next

        Response.Write("<span>Signature Verified:</span><input value=""" + Request.Params("signature").Equals(Security.sign(parameters)).ToString + """ type=""text"" name=""verified"" size=""50"" readonly=""true""/><br/>")
    %>
    </div>
</fieldset>

</body>
</html>

