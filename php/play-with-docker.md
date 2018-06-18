
Play with Docker
================

1. Goto https://labs.play-with-docker.com/
2. Login or Register
3. Add New Instance
4. Create docker container

```sh
docker pull php:5.6.36-cli-alpine3.7
wget https://github.com/e-payment/cybersource-secure-acceptance/archive/master.zip
unzip master.zip
cd /root/cybersource-secure-acceptance-master/php/sa-wm
vi config.php
```

5. Setup config
```php
<?php

define('MERCHANT_ID', '<MERCHANT_ID>');
define('PROFILE_ID',  '<PROFILE_ID>');
define('ACCESS_KEY',  '<ACCESS_KEY>');
define('SECRET_KEY',  '<SECRET_KEY>');

// DF TEST: 1snn5n9w, LIVE: k8vif92e 
define('DF_ORG_ID', '1snn5n9w');

// PAYMENT URL

// TEST
define('PAYMENT_URL', 'https://testsecureacceptance.cybersource.com/pay');

// LIVE
//define('PAYMENT_URL', 'https://secureacceptance.cybersource.com/pay');

// EOF
```

6. Run

```
docker run --name php \
    --rm -it \
    -p 8088:8088 \
    -v /root/cybersource-secure-acceptance-master/php:/www:ro \
    php:5.6.36-cli-alpine3.7 -t /www -S 0.0.0.0:8088
```

7. Open URL
{URL:8088/sa-wm/}
