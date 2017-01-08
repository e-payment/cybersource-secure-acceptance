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
 - [http://localhost:8080/cybs-sa](http://localhost:8080/cybs-sa)

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
 - Username: merchant
 - Password: Passw0rd2513

#### Menu
- Transaction Search > General Search
