<%@ Page Language="VB" AutoEventWireup="false" CodeFile="payment_confirmation.aspx.vb" Inherits="payment_confirmation" %>

<!DOCTYPE html>
<html>
<head>
    <title>Secure Acceptance - Payment Form Example</title>
    <link rel="stylesheet" type="text/css" href="Styles/payment.css"/>
</head>
<body>
<form id="payment_confirmation" method="post" action="<%= CybsUtil.getPaymentUrl() %>">
<fieldset id="confirmation">
    <legend>Review Payment Details</legend>
    <div>
        <%
            Dim key As String
            For Each key In Request.Form.AllKeys()
                Response.Write("<div>")
                Response.Write("<span class=""fieldName"">" + key + ":</span><span class=""fieldValue"">" + Request.Params(key) + "</span>")
                Response.Write("</div>")
            Next
        %>
    </div>
</fieldset>
    <%
        Dim parameters As New Hashtable()

        For Each key In Request.Form.AllKeys()
            Response.Write("<input type=""hidden"" id=""" + key + """ name=""" + key + """ value=""" + Request.Params(key) + """/>")
            parameters.Add(key, Request.Params(key))
        Next
        Response.Write("<input type=""hidden"" id=""signature"" name=""signature"" value=""" + Security.sign(parameters) + """/>")
    %>

<input type="submit" id="btn_submit" value="Confirm"/>

</form>
</body>
</html>
