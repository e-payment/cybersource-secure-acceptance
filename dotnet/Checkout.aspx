<%@ Page Language="C#" %>
<%
	// vvv TEST: 1snn5n9w, LIVE: k8vif92e vvv
	string org_id      = "1snn5n9w";
	string merchant_id = "kr950214320";
	string sess_id     = System.Web.HttpContext.Current.Session.SessionID;
	string df_param    = "org_id=" + org_id + "&session_id=" + merchant_id + sess_id;
%>

<html>
<!-- START DEVICE FINGERPRINTING CODE (One-Pixel Image Code) -->
<p style="background:url(https://h.online-metrix.net/fp/clear.png?<%= df_param %>&m=1)"></p> 
<img src="https://h.online-metrix.net/fp/clear.png?<%= df_param %>&m=2" width="1" height="1" />
<!-- END DEVICE FINGERPRINTING CODE -->

<form method="post" action="https://dvl3.ipay88.com/ePayment/testing_bay.asp" name="form1">
	<input type="hidden" name="deviceFingerprintID" value="<%= sess_id %>" />
	<input type="submit" name="Submit" value="Proceed" />
</form>
</html>