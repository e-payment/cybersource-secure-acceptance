<?php 

include_once('config.php');
include_once('security.php');

session_start();
$sess_id  = session_id();
$df_param = 'org_id=' . DF_ORG_ID . '&amp;session_id=' . MERCHANT_ID . $sess_id;

$endpoint_url = PAYMENT_URL;
if ($_POST['transaction_type'] === 'create_payment_token') {
    $endpoint_url = TOKEN_CREATE_URL;
}

?>

<html>
<head>
    <title>Confirm</title>
    <link rel="stylesheet" type="text/css" href="../css/payment.css"/>
</head>
<body>
<img src="../img/logo-cybersource.png" style="padding-bottom: 10px;" />
<h2>Review &amp; Confirm</h2>
<form id="payment_confirmation" action="<?php echo $endpoint_url ?>" method="post"/>

<?php
    foreach($_POST as $name => $value) {
        $params[$name] = $value;
    }
?>
<fieldset id="confirmation">
    <legend>Payment Details</legend>
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
            echo "<input type=\"hidden\" name=\"" . $name . "\" value=\"" . $value . "\"/>\n";
        }
    ?>

    <input type="hidden" name="device_fingerprint_id" value="<?php echo $sess_id ?>" />
    <input type="hidden" name="signature" value="<?php echo sign($params) ?>" />
    <input type="submit" id="btn_submit" value="Confirm"/>

</form>

<!-- DF START -->

device_fingerprint_param: <?php echo $df_param ?>

<p style="background:url(https://h.online-metrix.net/fp/clear.png?<?php echo $df_param ?>&amp;m=1)"></p>
<img src="https://h.online-metrix.net/fp/clear.png?<?php echo $df_param ?>&amp;m=2" width="1" height="1" />
<!-- DF END -->

</body>
</html>
