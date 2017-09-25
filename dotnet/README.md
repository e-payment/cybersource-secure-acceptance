Secure Acceptance Windows/Mobile
================================

create file sa-wm/Config.cs

```cs
using System;

namespace Payment
{
    public class Config
    {
        public const String MERCHANT_ID = "<MERCHANT_ID>";
        public const String PROFILE_ID  = "<PROFILE_ID>";
        public const String ACCESS_KEY  = "<ACCESS_KEY>";
        public const String SECRET_KEY  = "<SECRET_KEY>";

        // DF TEST: 1snn5n9w, LIVE: k8vif92e 
        public const String DF_ORG_ID = "1snn5n9w";

        // PAYMENT URL
        public const String CYBS_BASE_URL = "https://testsecureacceptance.cybersource.com";

        public const String PAYMENT_URL = CYBS_BASE_URL + "/pay";
        // public const String PAYMENT_URL = "Debug.aspx";

        public const String TOKEN_CREATE_URL = CYBS_BASE_URL + "/token/create";
        public const String TOKEN_UPDATE_URL = CYBS_BASE_URL + "/token/update";
    }
}
```