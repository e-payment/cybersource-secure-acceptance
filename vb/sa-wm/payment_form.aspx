<%@ Page Language="VB" AutoEventWireup="false" CodeFile="payment_form.aspx.vb" Inherits="payment_form" %>

<!DOCTYPE html>
<html>
<head>
    <title>Secure Acceptance - Payment Form Example</title>
    <link rel="stylesheet" type="text/css" href="Styles/payment.css"/>
    <script type="text/javascript" src="Scripts/jquery-1.7.min.js"></script>
</head>
<body>
<form id="payment_form" action="payment_confirmation.aspx" method="post">
    <input type="hidden" name="profile_id" value="291CDD47-6036-4C1E-BB97-B5CDA504B76F"/>
    <input type="hidden" name="access_key" value="f854903616a93495b4dfccbd075bad8b"/>
    <input type="hidden" name="transaction_uuid" value="<% Response.Write(getUUID()) %>"/>
    <input type="hidden" name="signed_field_names" value="access_key,profile_id,transaction_uuid,signed_field_names,unsigned_field_names,signed_date_time,locale,transaction_type,reference_number,amount,currency"/>
    <input type="hidden" name="unsigned_field_names"/>
    <input type="hidden" name="signed_date_time" value="<% Response.Write(getUTCDateTime()) %>"/>
    <input type="hidden" name="locale" value="en"/>
    <fieldset>
        <legend>Payment Details</legend>
        <div id="paymentDetailsSection" class="section">
            <span>transaction_type:</span><input type="text" name="transaction_type" size="25"><br/>
            <span>reference_number:</span><input type="text" name="reference_number" size="25"><br/>
            <span>amount:</span><input type="text" name="amount" size="25"><br/>
            <span>currency:</span><input type="text" name="currency" size="25"><br/>
        </div>
    </fieldset>
    <input type="submit" id="submit" name="submit" value="Submit"/>
    <script type="text/javascript" src="Scripts/payment_form.js"></script>
</form>
</body>
</html>
