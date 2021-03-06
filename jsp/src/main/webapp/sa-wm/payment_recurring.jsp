<%@ page contentType="text/html;charset=UTF-8"  language="java" pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.*" %>
<%@ include file="config.jsp" %>
<%

String responsePage = request.getRequestURL().toString();
responsePage = responsePage.replaceAll("payment_recurring.jsp", "response.jsp");

%>
<!DOCTYPE html>
<head>
    <title>SOP - Payment Form</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link type="image/x-icon" href="../favicon.png" rel="shortcut icon">
    <link rel="stylesheet" type="text/css" href="../css/payment.css"/>
</head>
<body>
<div id="header">
    <div id="logo">
        <img src="../img/logo-cybersource.png" style="padding-bottom: 10px;" />
    </div>
    <div id="title_heaer">
        <h2>Recurring Billing</h2>
    </div>
</div>

<p>
<form id="payment_form" action="./payment_confirm.jsp" method="post">

    <input type="hidden" name="profile_id" value="<%= PROFILE_ID %>">
    <input type="hidden" name="access_key" value="<%= ACCESS_KEY %>">
    <input type="hidden" name="transaction_uuid" value="<%= UUID.randomUUID() %>">
    <input type="hidden" name="signed_date_time" value="<%= getUTCDateTime() %>"">
    
    <input type="hidden" name="signed_field_names" value="profile_id,access_key,transaction_uuid,signed_field_names,unsigned_field_names,signed_date_time,locale,transaction_type,recurring_frequency,recurring_start_date,recurring_amount,reference_number,amount,currency,override_custom_cancel_page,override_custom_receipt_page">
    
    <input type="hidden" name="unsigned_field_names" value="device_fingerprint_id,override_custom_cancel_page,signature,bill_to_forename,bill_to_surname,bill_to_email,bill_to_phone,bill_to_address_line1,bill_to_address_line2,bill_to_address_city,bill_to_address_state,bill_to_address_country,bill_to_address_postal_code,customer_ip_address,merchant_defined_data1,merchant_defined_data2,merchant_defined_data3,merchant_defined_data4">
    
    <div id="paymentDetailsSection" class="section">
    <fieldset>
        <legend>Signed Data Fields</legend>
        These fields will be POSTed to your server for signing using the Security file included in the sample script.<br>
        The name of each signed field should be included in the signed_field_names.

            <h3>Payment Information</h3>
            <span>transaction_type:</span>            <input type="text" name="transaction_type" value="create_payment_token"><br/>
            <span>subscription only:</span>           <input type="checkbox" id="create_token" checked="checked" onclick="createToken(this)"><br/>
            <span>reference_number:</span>            <input type="text" name="reference_number"><br/>
            <span class="keyitem">recurring_frequency:</span>   <input type="text" name="recurring_frequency" value="monthly"> (weekly, monthly)<br/>
            <span class="keyitem">recurring_start_date:</span>  <input type="text" name="recurring_start_date" value="<%= getDateTime("yyyyMMdd") %>"><br/>
            <span class="keyitem">recurring_amount:</span>      <input type="text" name="recurring_amount"><br/>
            <span>amount:</span>                      <input type="text" name="amount"><br/>
            <span>currency:</span>                    <input type="text" name="currency" max="3"><br/>
            <span>locale:</span>                      <input type="text" name="locale"> (en-us, th-th, ja-jp)
    </fieldset>
    <p>
    <fieldset>
        <legend>Unsigned Data Fields</legend>
        The name of each unsigned field should be included in the unsigned_field_names.
            <h3>Billing Information</h3>
            <span>bill_to_forename:</span>            <input type="text" name="bill_to_forename"><br/>
            <span>bill_to_surname:</span>             <input type="text" name="bill_to_surname"><br/>
            <span>bill_to_email:</span>               <input type="text" name="bill_to_email"><br/>
            <span>bill_to_phone:</span>               <input type="text" name="bill_to_phone"><br/>
            <span>bill_to_address_line1:</span>       <input type="text" name="bill_to_address_line1"><br/>
            <span>bill_to_address_line2:</span>       <input type="text" name="bill_to_address_line2"><br/>            
            <span>bill_to_address_city:</span>        <input type="text" name="bill_to_address_city"><br/>
            <span>bill_to_address_state:</span>       <input type="text" name="bill_to_address_state"><br/>
            <span>bill_to_address_country:</span>     <input type="text" name="bill_to_address_country"><br/>
            <span>bill_to_address_postal_code:</span> <input type="text" name="bill_to_address_postal_code"><br/>
        
    </fieldset>
    </div>

    <input type="hidden" name="override_custom_cancel_page"  value="<%= responsePage %>">
    <input type="hidden" name="override_custom_receipt_page" value="<%= responsePage %>">

    <!-- MDD START -->
    <input type="hidden" name="customer_ip_address" value="<%= request.getRemoteAddr() %>">

    <input type="hidden" name="merchant_defined_data1" value="MDD#1" />
    <input type="hidden" name="merchant_defined_data2" value="MDD#2" />
    <input type="hidden" name="merchant_defined_data3" value="MDD#3" />
    <input type="hidden" name="merchant_defined_data4" value="MDD#4" />
    <!-- MDD END -->

    <input type="submit" id="btn_submit" value="Submit"/>
</form>

<script type="text/javascript" src="../js/jquery-1.7.min.js"></script>
<script type="text/javascript" src="../js/payment_form.js"></script>
<script type="text/javascript">
    
    function createToken(create_token) {

        var type = 'sale,create_payment_token';

        if (create_token.checked) {
            type = 'create_payment_token';
        }

        $("input[name='transaction_type']").val(type);
    }
</script>

</body>
</html>

<%!
    private String getUTCDateTime() {
        return getDateTime("yyyy-MM-dd'T'HH:mm:ss'Z'");
    }

    private String getDateTime(String format) {
        SimpleDateFormat sdf = new SimpleDateFormat(format, new Locale("en", "EN"));
        sdf.setTimeZone(TimeZone.getTimeZone("UTC"));

        return sdf.format(new Date());
    }

%>