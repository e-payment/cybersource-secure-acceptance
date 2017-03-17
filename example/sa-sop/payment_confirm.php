<?php 

include_once('config.php');
include_once('security.php');

?>

<html>
<head>
    <title>Confirm</title>
    <link rel="stylesheet" type="text/css" href="../css/payment.css"/>
</head>
<body>
<img src="../img/logo-cybersource.png" style="padding-bottom: 10px;" />
<h2>SOP - Review &amp; Confirm</h2>

<form id="payment_confirmation" action="<?php echo PAYMENT_URL; ?>" method="post"/>
<?php

    foreach (@$_POST as $name => $value) {
        $params[$name] = $value;
    }

?>
    <fieldset id="confirmation">
        <legend>Signed Data Fields</legend>
        These fields have been signed on your server, and a signature has been generated. This will <br> detect tampering with these values as they pass through the consumers browser to the SASOP endpoint.<BR></BR>
        <div>
        <?php

            foreach ($params as $name => $value) {
                echo "<div>";
                echo "<span class=\"fieldName\">" . $name . "</span><span class=\"fieldValue\">" . $value . "</span>";
                echo "</div>\n";
            }

        ?>
        </div>
    </fieldset>

    <?php if (empty($params['payment_token'])) { ?>
    <p>
    <fieldset>
        <legend>Card Information</legend>  
        Card data fields are posted <u>directly to CyberSource</u>, together with the fields above.<br>
        These field names will need to be included in the unsigned_field_names.
        <p>
        <div id="UnsignedDataSection" class="section">
        <span>card_type:</span><input type="text" name="card_type"><br/>
        <span>card_number:</span><input type="text" name="card_number"><br/>
        <span>card_expiry_date:</span><input type="text" name="card_expiry_date"><br/>
        <span>card_cvn:</span><input type="password" name="card_cvn" maxlength="3"><br/>
    </div>
    </fieldset>
    <?php

        }

        foreach ($params as $name => $value) {
            echo "<input type=\"hidden\" id=\"" . $name . "\" name=\"" . $name . "\" value=\"" . $value . "\"/>\n";
        }

        echo "<input type=\"hidden\" id=\"signature\" name=\"signature\" value=\"" . sign($params) . "\"/>\n";
    ?>

    <input type="submit" id="btn_submit" value="Confirm"/>

</form>

<script type="text/javascript" src="../js/jquery-1.7.min.js"></script>
<script type="text/javascript" src="../js/payment_form.js"></script>
<script type="text/javascript" src="../js/jquery.maskedinput-1.3.js"></script>
<script type="text/javascript">

    $("#card_number").mask("9999 9999 9999 9999");

</script>
</body>
</html>
