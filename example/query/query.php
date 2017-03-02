<?php

// $url = 'http://127.0.0.1:8088/sa-sop/payment_debug.php';
// $url = 'https://ebc.cybersource.com/ebc/Query';
$url = 'https://ebctest.cybersource.com/ebctest/Query';


$username = 'ekra01210047';
$password = 'Password852';

//create array of data to be posted
$post_data['merchantID']              = 'kr950210047';			// kr950210047, 950212563
$post_data['type']                    = 'transaction';
$post_data['subtype']                 = 'transactionDetail';
$post_data['targetDate']              = '20170302';
$post_data['merchantReferenceNumber'] = '1488467770396';
// $post_data['requestID'               = '';


//traverse array and prepare data for posting (key1=value1)
foreach ($post_data as $key => $value) {
	$post_items[] = $key . '=' . $value;
}

//create the final string to be posted using implode()
$post_string = implode('&', $post_items);

//create cURL connection
$curl_conn = curl_init($url);

//set options
// curl_setopt($curl_conn, CURLOPT_PROXY, '127.0.0.1:3128');
// curl_setopt($curl_conn, CURLOPT_PROXYUSERPWD, 'user:password');

curl_setopt($curl_conn, CURLOPT_HTTPAUTH, CURLAUTH_BASIC);
curl_setopt($curl_conn, CURLOPT_USERPWD, $username . ":" . $password);

// curl_setopt($curl_conn, CURLOPT_HEADER, true);
curl_setopt($curl_conn, CURLOPT_CONNECTTIMEOUT, 30);
curl_setopt($curl_conn, CURLOPT_RETURNTRANSFER, true);
curl_setopt($curl_conn, CURLOPT_FOLLOWLOCATION, true);
curl_setopt($curl_conn, CURLOPT_SSL_VERIFYPEER, false);
curl_setopt($curl_conn, CURLOPT_SSLVERSION, CURL_SSLVERSION_TLSv1_2);
// curl_setopt($curl_conn, CURLOPT_USERAGENT, "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1)");

//set data to be posted
curl_setopt($curl_conn, CURLOPT_POSTFIELDS, $post_string);

//perform our request
$result = curl_exec($curl_conn);
print_r($result);

//show information regarding the request
$status = curl_getinfo($curl_conn);
// print_r($status);
echo PHP_EOL . '================';
echo PHP_EOL . ' http_code: ' . $status['http_code'];
echo PHP_EOL . '================';

// echo curl_errno($curl_conn) . '-' . curl_error($curl_conn);

//close the connection
curl_close($curl_conn);

// EOF //