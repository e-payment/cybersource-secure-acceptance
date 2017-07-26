CyberSource Secure Acceptance
=============================

## Run

```term
mvn clean jetty:run
```

## Package

```term
mvn clean package
java -jar target\dependency\jetty-runner.jar target\*.war --path /cybs-sa
```

## Test
 - [http://localhost:8080/sa](http://localhost:8080/sa)

### Test Card
 - http://www.sagepay.co.uk/support/12/36/test-card-details-for-your-test-transactions

## Merchant Login
- URL: https://ebctest.cybersource.com/ebctest/login/Login.do

### Merchant ID: 950212563

#### Admin
 - CyberSource Merchant ID: 950212563_acct
 - Username: admin
 - Password: Pa******03

#### Merchant
 - CyberSource Merchant ID: 950212563
 - Username: merchant
 - Password: Pa******03

#### Menu
- Transaction Search > General Search

### Check BIN
 - https://api.bincodes.com/bin/?format=json&api_key=98d50a2a93f7e326a99fc03c4231701c&bin=401200

### Inquiry
 - [http://localhost:8080/sa/query.jsp](http://localhost:8080/sa/query.jsp)
 - Username: ?
 - Password: ?
