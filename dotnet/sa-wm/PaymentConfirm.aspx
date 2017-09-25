<%@ Page Language="C#" Inherits="Payment.PaymentConfirm" %>
<%

String SESS_ID = Session.SessionID;
String DF_PARAM = "org_id=" + Payment.Config.DF_ORG_ID + "&amp;session_id=" + Payment.Config.MERCHANT_ID + SESS_ID;

%>
<!DOCTYPE html>
<html>
<html>
<head>
    <title>Secure Acceptance - Payment Form Example</title>
    <link rel="stylesheet" type="text/css" href="css/payment.css"/>
</head>
<body>
<form id="payment_confirmation" action="<% Response.Write(Payment.Config.PAYMENT_URL); %>" method="post">
<fieldset id="confirmation">
    <legend>Review Payment Details</legend>
    <div>
        <%
            foreach (var key in Request.Form.AllKeys)
            { 
                Response.Write("<div>");
                Response.Write("<span class=\"fieldName\">" + key + ":</span><span class=\"fieldValue\">" + Request.Params[key] + "</span>\n");
                Response.Write("</div>");
            }
        %>
    </div>
</fieldset>

    <%
		
        System.Collections.Generic.Dictionary<string, string> parameters = new System.Collections.Generic.Dictionary<string, string>();
				
        foreach (var key in Request.Form.AllKeys)
        {
            Response.Write("<input type=\"hidden\" id=\"" + key + "\" name=\"" + key + "\" value=\"" + Request.Params[key] + "\"/>\n");
            parameters.Add(key, Request.Params[key]);
        }
				
        Response.Write("<input type=\"hidden\" id=\"signature\" name=\"signature\" value=\"" + Payment.Security.sign(parameters) + "\"/>\n");
    %>
    <input type="hidden" name="device_fingerprint_id" value="<% Response.Write(SESS_ID); %>" />
    <input type="submit" id="btn_submit" value="Confirm"/>
</form>

<!-- DF START -->

device_fingerprint_param: <% Response.Write(DF_PARAM); %>

<p style="background:url(https://h.online-metrix.net/fp/clear.png?<% Response.Write(DF_PARAM); %>&amp;m=1)"></p>
<img src="https://h.online-metrix.net/fp/clear.png?<% Response.Write(DF_PARAM); %>&amp;m=2" width="1" height="1" />

<!-- DF END -->

<script type="text/javascript" src="js/jquery-1.7.min.js"></script>
<script type="text/javascript" src="js/payment_form.js"></script>
</body>
</html>