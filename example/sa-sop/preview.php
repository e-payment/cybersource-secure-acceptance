<?php 

include_once('config.php');
include_once('security.php');

define('DF_ORG_ID', '1snn5n9w');
session_start();

$df_param = 'org_id=' . DF_ORG_ID . '&amp;session_ id=' . MERCHANT_ID . session_id();

?>
<html>
<head>
    <title>Unsigned Data Fields</title>
    <link rel="stylesheet" type="text/css" href="/css/payment.css"/>
</head>
<body>
<img src="/img/logo-cybersource.png" style="padding-bottom: 20px;" />

<form id="payment_confirmation" action="<?php echo PAYMENT_URL; ?>" method="post"/>
<?php

    foreach($_REQUEST as $name => $value) {
        $params[$name] = $value;
    }
?>
    <fieldset id="confirmation">
        <legend>Signed Data Fields</legend>
        These fields have been signed on your server, and a signature has been generated. This will <br> detect tampering with these values as they pass through the consumers browser to the SASOP endpoint.<BR></BR>
        <div>
            <?php
                foreach($params as $name => $value) {
                    echo "<div>";
                    echo "<span class=\"fieldName\">" . $name . "</span><span class=\"fieldValue\">" . $value . "</span>";
                    echo "</div>\n";
                }
            ?>
        </div>
    </fieldset>
    <?php
        foreach($params as $name => $value) {
            echo "<input type=\"hidden\" id=\"" . $name . "\" name=\"" . $name . "\" value=\"" . $value . "\"/>\n";
        }
        echo "<input type=\"hidden\" id=\"signature\" name=\"signature\" value=\"" . sign($params) . "\"/>\n";
    ?>
    <fieldset>
        <legend>Unsigned Data Fields</legend>  
        Card data fields are posted directly to CyberSource, together with the fields above. These field <br>
        names will need to be included in the unsigned_field_names.
        <BR></BR>
        <div id="UnsignedDataSection" class="section">
        <span>card_type:</span><input type="text" name="card_type"><br/>
        <span>card_number:</span><input type="text" name="card_number"><br/>
        <span>card_expiry_date:</span><input type="text" name="card_expiry_date"><br/>
    </div>
    </fieldset>

    <input type="submit" id="submit" value="Confirm "/>

</form>

<script type="text/javascript" src="/js/jquery-1.7.min.js"></script>
<script type="text/javascript" src="/js/payment_form.js"></script>

<!-- DF START -->
<p style="background:url(https://h.online-metrix.net/fp/clear.png?<?php echo $df_param ?>&amp;m=1)"></p>
<img src="https://h.online-metrix.net/fp/clear.png?org_id=<?php echo $df_param ?>&amp;m=2" width="0" height="0" alt="" />

<object type="application/x-shockwave-flash"
        data="https://h.online- metrix.net/fp/fp.swf?org_id=<?php echo $df_param ?>" width="0" height="0" id="thm_fp">
<param name="movie" value="https://h.online-metrix.net/fp/fp.swf?org_ id=<?php echo $df_param ?>" />
</object>

<script type="text/javascript" src="https://h.online-metrix.net/fp/check.js?<?php echo $df_param ?>"></script>

<!-- DF END-->

</body>
</html>
