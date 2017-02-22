<h1>Shindai</h1>

<form id="payment_form" action="https://testsecureacceptance.cybersource.com/pay" method="post"> 
<input type="hidden" name="access_key" 
value="a02e4b65c9163421b0ec308a53118b33"> 
<input type="hidden" name="profile_id" value="Shindai2"> 
<input type="hidden" name="transaction_uuid" value="<?php echo uniqid() ?>">
<input type="hidden" name="signed_date_time" value="<?php echo gmdate("Y-m-d\TH:i:s\Z"); ?>">  
<input type="hidden" name="signed_field_names" value="access_key,profile_id,transaction_uuid,signed_field_names,unsigned_field_names,signed_date_time,locale,transaction_type,reference_number,amount,currency"> 
<input type="hidden" name="locale" value="en"> 
<input type="hidden" name="transaction_type" value="sale"> 
<input type="hidden" name="currency" value="THB"> 
<input type="hidden" name="amount" value="1031"> 
<input type="hidden" name="merchant_secure_data1" value="1"> 
<input type="hidden" name="bill_to_phone" value=""> 
<input type="hidden" name="bill_to_email" value="kgtstr@b-ta.jp"> 
<input type="hidden" name="bill_to_forename" value="">
<input type="hidden" name="bill_to_surname" value="testAXS"> 
<input type="hidden" name="customer_ip_address" value="106.181.127.253"> 
<input type="hidden" name="device_fingerprint_id" value="rir034ekjb4n9kjofm304t3ur6"> 
<input type="hidden" name="item_1_name" value="Popcorn Hostel Busan Station"> 
<input type="hidden" name="item_1_unit_price" value="3301"> 
<input type="hidden" name="merchant_defined_data2" value="EN"> 
<input type="hidden" name="merchant_defined_data3" value="2"> 
<input type="hidden" name="unsigned_field_names" value="merchant_secure_data1,bill_to_phone,bill_to_email,bill_to_surname,bill_to_forename,customer_ip_address,device_fingerprint_id,item_1_name,item_1_unit_price,merchant_defined_data2,merchant_defined_data3"> 
<input type="hidden" name="reference_number" value="15828"> 
<input type="hidden" name="signature" value="OOXPSwb2bL0h0y5noMejM3U52UmFfTIFNNkBsDOKtG0="> 
<input type="submit" id="submitbtn" value="Submit"/> 
</form>
