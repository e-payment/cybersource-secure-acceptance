<?php 

include_once('config.php');
include_once('security.php');

session_start();
$df_param = 'org_id=' . DF_ORG_ID . '&amp;session_id=' . MERCHANT_ID . session_id();

?>

<html>
<head>
    <title>Confirm</title>
    <link rel="stylesheet" type="text/css" href="/css/payment.css"/>
</head>
<body>
<img src="/img/logo-cybersource.png" style="padding-bottom: 10px;" />
<h2>Review &amp; Confirm</h2>
<form id="payment_confirmation" action="<?php echo PAYMENT_URL; ?>" method="post"/>

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

    <input type="hidden" name="device_fingerprint_param" value="<?php echo $df_param ?>" />
    <input type="hidden" name="signature" value="<?php echo sign($params) ?>" />
    <input type="submit" id="submit" value="Confirm"/>

<!-- DF START -->
<p style="background:url(https://h.online-metrix.net/fp/clear.png?<?php echo $df_param ?>&amp;m=1)"></p>
<img src="https://h.online-metrix.net/fp/clear.png?<?php echo $df_param ?>&amp;m=2" width="1" height="1" />

<!--
<object type="application/x-shockwave-flash" width="1" height="1" id="thm_fp"
        data="https://h.online-metrix.net/fp/fp.swf?<?php echo $df_param ?>">
    <param name="movie" value="https://h.online-metrix.net/fp/fp.swf?<?php echo $df_param ?>" />
</object>

<script type="text/javascript" src="https://h.online-metrix.net/fp/check.js?<?php echo $df_param ?>"></script>
-->

<!-- DF END -->

</form>
</body>
</html>
