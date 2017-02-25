<?php include 'security.php' ?>

<html>
<head>
    <title>Secure Acceptance - API Payment Form Example</title>
    <link rel="stylesheet" type="text/css" href="/css/payment.css"/>
</head>
<body>
<img src="/img/logo-cybersource.png" style="padding-bottom: 20px;" />
<br>
<a href="/sa-sop/payment.php">&lt;&lt; back</a>

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
<?php

/*

<fieldset id="response">
    <legend>Receipt</legend>
    <div>
        <form id="receipt">
            <?php

            foreach($_REQUEST as $name => $value) {
                $params[$name] = $value;
                echo "<span>" . $name . "</span> ";
                echo "<input type=\"text\" name=\"" . $name . "\" size=\"50\" value=\"" . $value . "\" readonly=\"true\"/><br/>";
            }

            echo "<span>Signature Verified:</span> ";
            echo "<input type=\"text\" name=\"verified\" size=\"50\" value=\"";

            if (strcmp($params["signature"], sign($params)) == 0) {
                echo "True";
            }
            else {
                echo "False";
            }

            echo "\" readonly=\"true\"/><br/>";

            ?>
        </form>
    </div>
</fieldset>

*/
?>

</body>
</html>
