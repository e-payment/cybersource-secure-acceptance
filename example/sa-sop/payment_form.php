<?php

include_once('config.php'); 

?>

<html>
<head>
    <title>Payment Form</title>
    <link rel="stylesheet" type="text/css" href="/css/payment.css"/>
</head>
<body>
<img src="/img/logo-cybersource.png" style="padding-bottom: 20px;" />
<form id="payment_form" action="payment_confirm.php" method="post">
    <input type="hidden" name="profile_id" value="<?php echo PROFILE_ID ?>">
    <input type="hidden" name="access_key" value="<?php echo ACCESS_KEY ?>">
    <input type="hidden" name="transaction_uuid" value="<?php echo uniqid() ?>">
    <input type="hidden" name="signed_date_time" value="<?php echo gmdate("Y-m-d\TH:i:s\Z"); ?>">
    <input type="hidden" name="locale" value="en">
    <input type="hidden" name="signed_field_names" value="access_key,profile_id,transaction_uuid,signed_field_names,unsigned_field_names,signed_date_time,locale,transaction_type,reference_number,amount,currency,payment_method,bill_to_forename,bill_to_surname,bill_to_email,bill_to_phone,bill_to_address_line1,bill_to_address_city,bill_to_address_state,bill_to_address_country,bill_to_address_postal_code">
    <input type="hidden" name="unsigned_field_names" value="card_type,card_number,card_expiry_date">
    <fieldset>
        <legend>Signed Data Fields</legend>
These fields will be POSTed to your server for signing using the Security file included in the <br> sample script.  The name of each signed field should be included in the signed_field_names.<BR></BR>
        <div id="paymentDetailsSection" class="section">
            <span>transaction_type:</span><input type="text" name="transaction_type"><br/>
            <span>reference_number:</span><input type="text" name="reference_number"><br/>
            <span>amount:</span><input type="text" name="amount"><br/>
            <span>currency:</span><input type="text" name="currency" max="3"><br/>
            <span>payment_method:</span><input type="text" name="payment_method"><br/>
            <span>bill_to_forename:</span><input type="text" name="bill_to_forename"><br/>
            <span>bill_to_surname:</span><input type="text" name="bill_to_surname"><br/>
            <span>bill_to_email:</span><input type="text" name="bill_to_email"><br/>
            <span>bill_to_phone:</span><input type="text" name="bill_to_phone"><br/>
            <span>bill_to_address_line1:</span><input type="text" name="bill_to_address_line1"><br/>
            <span>bill_to_address_city:</span><input type="text" name="bill_to_address_city"><br/>
            <span>bill_to_address_state:</span><input type="text" name="bill_to_address_state"><br/>
            <span>bill_to_address_country:</span><input type="text" name="bill_to_address_country"><br/>
            <span>bill_to_address_postal_code:</span><input type="text" name="bill_to_address_postal_code"><br/>
        </div>
    </fieldset>
    <input type="submit" id="submit" value="Submit"/>
</form>

<script type="text/javascript" src="/js/jquery-1.7.min.js"></script>
<script type="text/javascript" src="/js/payment_form.js"></script>

</body>
</html>
