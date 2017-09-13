<!DOCTYPE html>
<html>
<head>
    <title>Receipt</title>
    <link rel="stylesheet" type="text/css" href="../css/payment.css"/>
</head>
<body>
<img src="../img/logo-cybersource.png" style="padding-bottom: 10px;" />
<h2>Debug</h2>

change at config.php<br/>
define('PAYMENT_URL', 'https://testsecureacceptance.cybersource.com/pay');

<hr/>

<div id="debug">
<pre>
<?php

$request = $_POST;
print_r($request);

?>
</pre>
</div>

<hr/>
<p><a href="./payment_form.php">&lt;&lt; BACK</a></p>

</body>
</html>