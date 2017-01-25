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

### Merchant ID: kr950210047

#### Merchant
 - Username: ekra01210047
 - Password: Password852

#### IT
 - Username: itcybs
 - Password: Password106

### Merchant ID: 950212563
CyberSource Merchant ID: 950212563_acct

#### Merchant
 - Username: admin
 - Password: Passw0rd563

#### IT
 - Username: itcybs
 - Password: Password106

 - Username: merchant
 - Password: Passw0rd2513
 - Password: Passw0rd2563


#### Menu
- Transaction Search > General Search

### Check BIN
 - https://api.bincodes.com/bin/?format=json&api_key=98d50a2a93f7e326a99fc03c4231701c&bin=401200

### Inquiry
 - [http://localhost:8080/sa/query.jsp](http://localhost:8080/sa/query.jsp)
 - Username: itquery
 - Password: Password123
