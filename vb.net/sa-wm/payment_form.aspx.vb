
Partial Class payment_form
    Inherits System.Web.UI.Page

    Public Function getUUID() As String
        Return System.Guid.NewGuid().ToString()
    End Function

    Public Function getUTCDateTime() As String
        Dim univDateTime As System.DateTime = DateTime.UtcNow
        Return univDateTime.ToString("yyyy-MM-dd'T'HH:mm:ss'Z'")
    End Function

    Public Function getDFParams(ByVal sessionId As String) As String
        ' DF TEST: 1snn5n9w, LIVE: k8vif92e
        ' define('DF_ORG_ID', '1snn5n9w');
        Return sessionId
    End Function

End Class
