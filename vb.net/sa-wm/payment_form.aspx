<%@ Page Language="VB" AutoEventWireup="false" CodeFile="payment_form.aspx.vb" Inherits="payment_form" %>
<%

    Dim sessionId As String
    sessionId = System.Web.HttpContext.Current.Session.SessionID

%>
<!DOCTYPE html>
<html>
<head>
    <title>Secure Acceptance - Payment Form Example</title>
    <link rel="stylesheet" type="text/css" href="Styles/payment.css"/>
</head>
<body>

<form id="payment_form" method="post" action="./payment_confirmation.aspx">
    <input type="hidden" name="profile_id" value="<%= CybsUtil.getConfig("PROFILE_ID") %>"/>
    <input type="hidden" name="access_key" value="<%= CybsUtil.getConfig("ACCESS_KEY") %>"/>
    <input type="hidden" name="transaction_uuid" value="<%= getUUID() %>"/>
    <input type="hidden" name="signed_field_names" value="access_key,profile_id,transaction_uuid,signed_field_names,unsigned_field_names,signed_date_time,locale,transaction_type,reference_number,amount,currency"/>
    <input type="hidden" name="unsigned_field_names"/>
    <input type="hidden" name="signed_date_time" value="<%= getUTCDateTime() %>"/>
    <input type="hidden" name="locale" value="en"/>
    <fieldset>
        <legend>Payment Details</legend>
        <div id="paymentDetailsSection" class="section">
            <span>transaction_type:</span><input type="text" name="transaction_type" size="25" value="sale" /><br/>
            <span>reference_number:</span><input type="text" name="reference_number" size="25" value="<%= DateTime.UtcNow.Ticks %>" /><br/>
            <span>amount:</span><input type="text" name="amount" size="25" value="1572.00"/><br/>
            <span>currency:</span><input type="text" name="currency" size="25" value="THB"/><br/>
        </div>
    </fieldset>
    <input type="submit" id="btn_submit" value="Submit"/>

</form>

DF: <%= getDFParams(sessionId) %>

<script type="text/javascript" src="Scripts/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="Scripts/payment_form.js"></script>

</body>
</html>
