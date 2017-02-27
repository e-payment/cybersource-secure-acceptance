<?php

include_once('config.php'); 

ob_start();

// Start a new session
session_start();

// Remove the $_SESSION variable
session_unset();

// Remove the server-side session
session_destroy();

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

    <input type="hidden" name="signed_field_names" value="profile_id,access_key,transaction_uuid,signed_field_names,unsigned_field_names,signed_date_time,locale,transaction_type,reference_number,amount,currency">
    
    <input type="hidden" name="unsigned_field_names" value="override_custom_cancel_page,signature,bill_to_forename,bill_to_surname,bill_to_email,bill_to_phone,bill_to_address_line1,bill_to_address_city,bill_to_address_country,customer_ip_address,item_1_name,item_1_unit_price,merchant_defined_data1,merchant_defined_data2,merchant_defined_data3">

    <fieldset>
        <legend>Payment Details</legend>
        <div id="paymentDetailsSection" class="section">

            <span>transaction_type:</span>        <input type="text" name="transaction_type"><br/>
            <span>reference_number:</span>        <input type="text" name="reference_number"><br/>
            <span>amount:</span>                  <input type="text" name="amount"><br/>
            <span>currency:</span>                <input type="text" name="currency"><br/>

            <span>bill_to_forename:</span>        <input type="text" name="bill_to_forename"><br/>
            <span>bill_to_surname:</span>         <input type="text" name="bill_to_surname"><br/>
            <span>bill_to_email:</span>           <input type="text" name="bill_to_email"><br/>
            <span>bill_to_phone:</span>           <input type="text" name="bill_to_phone"><br/>
            <span>bill_to_address_line1:</span>   <input type="text" name="bill_to_address_line1"><br/>
            <span>bill_to_address_city:</span>    <input type="text" name="bill_to_address_city"><br/>
            <span>bill_to_address_country:</span> <input type="text" name="bill_to_address_country"><br/>

        </div>
    </fieldset>

    <input type="hidden" name="override_custom_cancel_page"  value="http://localhost:8088/sa-wm/response.php">

    <!-- MDD START -->
    <input type="hidden" name="customer_ip_address" value="<?php echo @$_SERVER['REMOTE_ADDR'] ?>">

    <input type="hidden" name="item_1_code" value="KFLTFDIV">
    <input type="hidden" name="item_1_name" value="Krungsri LTF DIV">
    <input type="hidden" name="item_1_unit_price" value="15.72">
    <input type="hidden" name="item_1_quantity" value="100">

    <input type="hidden" name="merchant_defined_data1" value="MDD#1">
    <input type="hidden" name="merchant_defined_data2" value="MDD#2">
    <input type="hidden" name="merchant_defined_data3" value="MDD#3">

    <input type="hidden" name="merchant_secure_data1" value="secure_data1">
    <!-- MDD END -->

    <input type="submit" id="submit" value="Submit"/>

    <script type="text/javascript" src="/js/jquery-1.7.min.js"></script>
    <script type="text/javascript" src="/js/payment_form.js"></script>

</form>

</body>
</html>
