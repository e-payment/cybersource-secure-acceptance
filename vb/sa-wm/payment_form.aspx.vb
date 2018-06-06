
Partial Class payment_form
    Inherits System.Web.UI.Page

    Public Function getUUID() As String
        Return System.Guid.NewGuid().ToString()
    End Function

    Public Function getUTCDateTime() As String
        Dim univDateTime As System.DateTime = DateTime.UtcNow
        Return univDateTime.ToString("yyyy-MM-dd'T'HH:mm:ss'Z'", New System.Globalization.CultureInfo("en-US"))
    End Function

End Class
