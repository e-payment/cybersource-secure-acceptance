<%@ Page Language="VB" AutoEventWireup="false" CodeFile="receipt.aspx.vb" Inherits="receipt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>
    <title>Secure Acceptance - Payment Form Example</title>
    <link rel="stylesheet" type="text/css" href="/Styles/payment.css"/>
</head>
<body>

<fieldset id="response">
    <legend>Receipt</legend>
    <div>
        <form id="receipt" action="">
            <%
                Dim parameters As New Hashtable()
        
                For Each key In Request.Form.AllKeys()                    
                    Response.Write("<span>" + key + "</span><input type=""text"" name=""" + key + """ size=""50"" value=""" + Request.Params(key) + """ readonly=""true""/><br/>")
                    parameters.Add(key, Request.Params(key))
                Next
                          
                Response.Write("<span>Signature Verified:</span><input value=""" + Request.Params("signature").Equals(security.sign(parameters)).ToString + """ type=""text"" name=""verified"" size=""50"" readonly=""true""/><br/>")
            %>
        </form>
    </div>
</fieldset>

</body>
</html>

