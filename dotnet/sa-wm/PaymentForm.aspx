<%@ Page Language="C#" Inherits="Payment.PaymentForm" %>
<%

String BASE_URL = Context.Request.Url.GetLeftPart(UriPartial.Authority);
String RESPONSE_PAGE = BASE_URL + "/Response.aspx";

%>
<!DOCTYPE html>
<html>
<html>
<head>
    <title>Secure Acceptance - Payment Form Example</title>
    <link rel="stylesheet" type="text/css" href="css/payment.css"/>
</head>
<body>
<form id="payment_form" action="PaymentConfirm.aspx" method="post">
    <input type="hidden" name="access_key" value="<% Response.Write(Payment.Config.ACCESS_KEY); %>">
    <input type="hidden" name="profile_id" value="<% Response.Write(Payment.Config.PROFILE_ID); %>">
    <input type="hidden" name="transaction_uuid" value="<% Response.Write(getUUID()); %>">
    <input type="hidden" name="signed_date_time" value="<% Response.Write(getUTCDateTime()); %>">

    <input type="hidden" name="signed_field_names" value="access_key,profile_id,transaction_uuid,signed_field_names,unsigned_field_names,signed_date_time,locale,transaction_type,reference_number,auth_trans_ref_no,amount,currency,override_custom_cancel_page,override_custom_receipt_page">
    <input type="hidden" name="unsigned_field_names" value="device_fingerprint_id,signature,bill_to_forename,bill_to_surname,bill_to_email,bill_to_phone,bill_to_address_line1,bill_to_address_line2,bill_to_address_city,bill_to_address_state,bill_to_address_country,bill_to_address_postal_code,customer_ip_address">
    
    <fieldset>
        <legend>Payment Details</legend>
        <div id="paymentDetailsSection" class="section">

            <span>transaction_type:</span>            <input type="text" name="transaction_type" value="sale"><br/>
            <span>create_token:</span>                <input type="checkbox" id="create_token" onclick="createToken(this)"><br/>
            <span>reference_number:</span>            <input type="text" name="reference_number"><br/>
            <span><b>auth_trans_ref_no</b>:</span>    <input type="text" name="auth_trans_ref_no"><br/>
            <span>amount:</span>                      <input type="text" name="amount"><br/>
            <span>currency:</span>                    <input type="text" name="currency"><br/>
            <span>locale:</span>                      <input type="text" name="locale"> (en-us, th-th, ja-jp)

            <p>
            <span>bill_to_forename:</span>            <input type="text" name="bill_to_forename"><br/>
            <span>bill_to_surname:</span>             <input type="text" name="bill_to_surname"><br/>
            <span>bill_to_email:</span>               <input type="text" name="bill_to_email"><br/>
            <span>bill_to_phone:</span>               <input type="text" name="bill_to_phone"><br/>

            <p>
            <span>bill_to_address_line1:</span>       <input type="text" name="bill_to_address_line1" maxlength="60"><br/>
            <span>bill_to_address_line2:</span>       <input type="text" name="bill_to_address_line2" maxlength="60"><br/>
            <span>bill_to_address_city:</span>        <input type="text" name="bill_to_address_city"><br/>
            <span>bill_to_address_state:</span>       <input type="text" name="bill_to_address_state"><br/>
            <span>bill_to_address_country:</span>     <input type="text" name="bill_to_address_country"><br/>
            <span>bill_to_address_postal_code:</span> <input type="text" name="bill_to_address_postal_code"><br/>

        </div>
    </fieldset>

    <input type="hidden" name="override_custom_cancel_page" value="<% Response.Write(RESPONSE_PAGE); %>">
    <input type="hidden" name="override_custom_receipt_page" value="<% Response.Write(RESPONSE_PAGE); %>">

    <input type="hidden" name="customer_ip_address" value="127.0.0.1">

    <input type="submit" id="btn_submit" name="submit" value="Submit"/>

</form>

<script type="text/javascript" src="js/jquery-1.7.min.js"></script>
<script type="text/javascript" src="js/payment_form.js"></script>
</body>
</html>