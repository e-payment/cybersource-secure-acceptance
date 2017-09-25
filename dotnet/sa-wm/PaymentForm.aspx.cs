using System;
using System.Web;
using System.Web.UI;

namespace Payment
{

    public partial class PaymentForm : System.Web.UI.Page
    {
        public String getUUID()
        {
            return System.Guid.NewGuid().ToString();
        }

        public String getUTCDateTime()
        {
            DateTime time = DateTime.Now.ToUniversalTime();
            return time.ToString("yyyy-MM-dd'T'HH:mm:ss'Z'");
        }
    }
}
