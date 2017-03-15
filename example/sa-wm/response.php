<?php include 'security.php' ?>

<html>
<head>
    <title>Receipt</title>
    <link rel="stylesheet" type="text/css" href="/css/payment.css"/>
</head>
<body>
<img src="/img/logo-cybersource.png" style="padding-bottom: 10px;" />
<h2>Receipt</h2>

<hr/>
<div id="container">
<pre>
<?php

$response = $_REQUEST;
$message  = $response['decision'] . ' ' . $response['reason_code'] . ' - ' . $response['message'];

ksort($response);

echo $message . PHP_EOL;
echo 'payment_token: ' . $response['payment_token'] . PHP_EOL;

$params = array();
foreach($_POST as $name => $value) {
    $params[$name] = $value;
}

$signed = (strcmp($params["signature"], sign($params)) == 0 ? "true" : "false");
echo 'signed: ' . $signed . "\n\n";

print_r($response);

?>

</pre>
</div>

<hr/>
<p><a href="./">&lt;&lt; BACK</a></p>

</body>
</html>
