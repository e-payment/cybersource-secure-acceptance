<?php

include_once('config.php'); 

ob_start();

// Remove the $_SESSION variable
session_unset();

// Remove the server-side session
session_destroy();

// Start a new session
session_start();

// Generate a new session ID
session_regenerate_id(true);

ob_end_clean();

?>

<html>
<head>
    <title>Secure Acceptance - Payment Form</title>
    <link rel="stylesheet" type="text/css" href="/css/payment.css"/>
</head>
<body>
<img src="/img/logo-cybersource.png" style="padding-bottom: 10px;" />

<h2>Payment Form</h2>

<form id="payment_form" action="payment_confirm.php" method="post">
    <input type="hidden" name="profile_id" value="<?php echo PROFILE_ID ?>">
    <input type="hidden" name="access_key" value="<?php echo ACCESS_KEY ?>">
    <input type="hidden" name="transaction_uuid" value="<?php echo uniqid() ?>">
    <input type="hidden" name="signed_date_time" value="<?php echo gmdate("Y-m-d\TH:i:s\Z"); ?>">
    <input type="hidden" name="locale" value="en">
    <input type="hidden" name="signed_field_names" value="profile_id,access_key,transaction_uuid,signed_field_names,unsigned_field_names,signed_date_time,locale,transaction_type,reference_number,amount,currency,bill_to_forename,bill_to_surname,bill_to_email,bill_to_phone">
    <input type="hidden" name="unsigned_field_names" value="device_fingerprint_id" />
    <fieldset>
        <legend>Payment Details</legend>
        <div id="paymentDetailsSection" class="section">

            <span>transaction_type:</span><input type="text" name="transaction_type"><br/>
            <span>reference_number:</span><input type="text" name="reference_number"><br/>
            <span>amount:</span><input type="text" name="amount"><br/>
            <span>currency:</span><input type="text" name="currency"><br/>

            <span>bill_to_forename:</span><input type="text" name="bill_to_forename"><br/>
            <span>bill_to_surname:</span><input type="text" name="bill_to_surname"><br/>
            <span>bill_to_email:</span><input type="text" name="bill_to_email"><br/>
            <span>bill_to_phone:</span><input type="text" name="bill_to_phone"><br/>

            <span>device_fingerprint_id:</span><input type="text" name="device_fingerprint_id" readonly="readonly"> 

        </div>
    </fieldset>
    <input type="submit" id="submit" value="Submit"/>

    <script type="text/javascript" src="/js/jquery-1.7.min.js"></script>
    <script type="text/javascript" src="/js/payment_form.js"></script>

</form>

</body>
</html>
