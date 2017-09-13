<?php

include_once("config.php");

?>

<!DOCTYPE html>
<html>
<head>
    <title>Card &ndash; the better way to collect credit cards</title>
    <meta name="viewport" content="initial-scale=1">
    <!-- CSS is included through the card.js script -->
    <style type="text/css">

        input[type=text], input[type=tel], input[type=number]  {
            width: 200px;
            font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
            font-size: 16px;
            margin: 2px;
        }

        input[type=submit] {
            margin-top: 20px;
            margin-bottom: 40px;
            padding: 2px 8px;
            border-radius: 4px;
            border: 1px solid transparent;
            touch-action: manipulation;
            cursor: pointer;
            height: 40px;
            width: 120px;
            font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
            font-size: 16px;
            color: #fff;
            background-color: #337ab7;
            border-color: #2e6da4;
            outline: none;
        }

    </style>
</head>
<body>
    <style>
        .demo-container {
            width: 100%;
            max-width: 350px;
            margin: 50px auto;
        }

        form {
            margin: 30px;
        }
        input {
            width: 200px;
            margin: 10px auto;
            display: block;
        }

    </style>
    <div class="demo-container">
        <div class="card-wrapper"></div>

        <div class="form-container active">
            <form action="payment_debug.php" method="post">
                <input placeholder="Card number" type="tel" name="number">
                <input placeholder="Full name" type="text" name="name">
                <input placeholder="MM/YY" type="tel" name="expiry">
                <input placeholder="CVC" type="number" name="cvc">
                <input type="submit">
            </form>
        </div>
    </div>

    <script src="/js/card.js"></script>
    <script>
        new Card({
            form: document.querySelector('form'),
            container: '.card-wrapper'
        });
    </script>
</body>
</html>
