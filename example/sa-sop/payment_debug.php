<pre>

change PAYMENT_URL at config.php
define('PAYMENT_URL', 'https://testsecureacceptance.cybersource.com/silent/pay');

<?php

$request = $_POST;
ksort($request);
print_r($request);

// EOF