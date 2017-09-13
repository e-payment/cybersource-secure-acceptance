<?php

include 'security.php';
#include '../notify/line-notify.php';

?>
<!DOCTYPE html>
<html>
<head>
    <title>Receipt</title>
    <link rel="stylesheet" type="text/css" href="../css/payment.css"/>
</head>
<body>
<img src="../img/logo-cybersource.png" style="padding-bottom: 10px;" />
<h2>Receipt</h2>

<hr/>
<div id="container">
<pre>
<?php

$response = $_REQUEST;
$amount   = @$response['auth_amount'];
if (!empty($amount)) {
	$amount  = ', ' . $amount;
	$amount .= ' ' . $response['req_currency'];
}

$message  = 'req_reference_number: ' . $response['req_reference_number'] . $amount;
$message .= ' => ' . $response['decision'] . ' ' . @$response['reason_code'] . ' - ' . $response['message'];
// lineNotify($message);

echo $message . PHP_EOL;
echo 'payment_token: ' . @$response['payment_token'] . PHP_EOL;

$params = array();
foreach($_POST as $name => $value) {
    $params[$name] = $value;
}

$signed = (strcmp($params["signature"], sign($params)) == 0 ? "true" : "false");
echo 'signed: ' . $signed . "\n\n";

ksort($response);
print_r($response);

?>

</pre>
</div>

<hr/>
<p><a href="./">&lt;&lt; BACK</a></p>

</body>
</html>
