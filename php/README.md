CyberSource Secure Acceptance
=============================

## Configuration

To run the examples first create a file `config.php` under directory `sa-sop` and `sa-wm`

```php
<?php

define('MERCHANT_ID', '<MERCHANT_ID>');
define('PROFILE_ID',  '<PROFILE_ID>');
define('ACCESS_KEY',  '<ACCESS_KEY>');
define('SECRET_KEY',  '<SECRET_KEY>');

// DF TEST: 1snn5n9w, LIVE: k8vif92e 
define('DF_ORG_ID', '1snn5n9w');

// PAYMENT URL
define('CYBS_BASE_URL', 'https://testsecureacceptance.cybersource.com/silent');

define('PAYMENT_URL', CYBS_BASE_URL . '/pay');
// define('PAYMENT_URL', '/sa-sop/debug.php');

define('TOKEN_CREATE_URL', CYBS_BASE_URL . '/token/create');
define('TOKEN_UPDATE_URL', CYBS_BASE_URL . '/token/update');

// EOF
```

## Test
```
php -t ./ -S 0.0.0.0:8088
```

## Web/Mobile
http://localhost:8088/sa-wm/

## Silent Order Post
http://localhost:8088/sa-sop/
