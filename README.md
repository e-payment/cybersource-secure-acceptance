CyberSource Secure Acceptance
=============================

## Run

```term
mvn clean jetty:run
```

## Package

```term
mvn clean package
java -jar target/dependency/jetty-runner.jar target/*.war --path /
```

## Test
 - [http://localhost:8080/sa-sop](http://localhost:8080/sa-sop/)
 - [http://localhost:8080/sa-wm](http://localhost:8080/sa-wm/)

### Test Card
 - http://www.sagepay.co.uk/support/12/36/test-card-details-for-your-test-transactions

## Merchant Login
- URL: https://ebctest.cybersource.com/ebctest/login/Login.do

#### Transaction Search Menu
- Transaction Search > Secure Acceptance Search
- Transaction Search > General Search
