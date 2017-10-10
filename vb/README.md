CyberSource Secure Acceptance
=============================

## Prerequisite

1. Install IIS with ASP.NET support
2. Setup ASP.NET with .NET Framework 4.0

```batch

## Run as administrator

> cd %windir%\Microsoft.NET\Framework64\v4.0.30319
> aspnet_regiis.exe –i
```

## Configuration

To run the examples first create a file `config.vb` under directory `sa-wm\App_Code`

```vb

Namespace CyberSource

    Public Class Config

        Public Const MERCHANT_ID As String = "<MERCHANT_ID>"

        'DF TEST: 1snn5n9w, LIVE: k8vif92e 
        Public Const DF_ORG_ID AS = "1snn5n9w"

        Public Const PROFILE_ID As String = "<PROFILE_ID>"
        Public Const ACCESS_KEY As String = "<ACCESS_KEY>"
        Public Const SECRET_KEY As String = "<SECRET_KEY>"
        '<REPLACE WITH SECRET KEY>

        'PAYMENT URL
        Public Const CYBS_BASE_URL As String = "https://testsecureacceptance.cybersource.com"
        Public Const PAYMENT_URL As String   = CYBS_BASE_URL + "/pay"
        'Public Const PAYMENT_URL As String  = "debug.aspx"

        'Public Const TOKEN_CREATE_URL As String = CYBS_BASE_URL + "/token/create"
        'Public Const TOKEN_UPDATE_URL As String = CYBS_BASE_URL + "/token/update"

    End Class

End Namespace
```

## Web/Mobile
http://localhost/sa-wm/payment_form.aspx
