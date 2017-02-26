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

$response = $_POST;
$message  = $response['decision'] . ' ' . $response['reason_code'] . ' - ' . $response['message'];
echo $message . PHP_EOL . PHP_EOL;

ksort($response);
print_r($response);

$params = array();
foreach($_REQUEST as $name => $value) {
    $params[$name] = $value;
}

$signed = (strcmp($params["signature"], sign($params)) == 0 ? "true" : "false");
echo PHP_EOL . PHP_EOL . "Signed: " . $signed;

?>

</pre>
</div>

<hr/>
<p><a href="./payment_form.php">&lt;&lt; BACK</a></p>

</body>
</html>
