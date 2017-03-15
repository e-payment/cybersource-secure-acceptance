<?php

/*

LINE Notify API Document
https://notify-bot.line.me/doc/en/

*/

define('TOKEN_ID', '2wc6Ib5LAIiDAIbZ9erfMbcL7PBUxGLmHG0Z1f5FKjb');

function lineNotify($message) {
	// $message        = 'test ทดสอบ テスト';
	// $imageThumbnail = 'https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_120x44dp.png';
	// $imageFullsize  = 'https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png';

	$chOne = curl_init();
	curl_setopt($chOne, CURLOPT_URL, "https://notify-api.line.me/api/notify");
	// SSL USE
	curl_setopt($chOne, CURLOPT_SSL_VERIFYHOST, 0);
	curl_setopt($chOne, CURLOPT_SSL_VERIFYPEER, 0);
	//POST
	curl_setopt($chOne, CURLOPT_POST, 1);
	// Message
	curl_setopt($chOne, CURLOPT_POSTFIELDS, $message);

	$message = 'message=' . $message;

	if ( !empty($imageThumbnail) && !empty($imageFullsize) ) {
		$message .= '&imageThumbnail=' . $imageThumbnail;
		$message .= '&imageFullsize=' . $imageFullsize;
	}

	//print_r($message); exit(0);
	curl_setopt($chOne, CURLOPT_POSTFIELDS, $message);

	// follow redirects
	curl_setopt($chOne, CURLOPT_FOLLOWLOCATION, 1);
	//ADD header array
	$headers = array('Content-type: application/x-www-form-urlencoded', 'Authorization: Bearer ' . TOKEN_ID);
	curl_setopt($chOne, CURLOPT_HTTPHEADER, $headers);
	//RETURN
	curl_setopt($chOne, CURLOPT_RETURNTRANSFER, 1);
	$result = curl_exec($chOne);

	//Check error
	if (curl_error($chOne)) {
		echo 'error:' . curl_error($chOne);
	}
	else {
		$result_ = json_decode($result, true);
		//echo 'status  : ' . $result_['status'] . ', ';
		//echo 'message : ' . $result_['message'] . PHP_EOL;
	}

	//Close connect
	curl_close( $chOne );
}

// EOF //