Imports Microsoft.VisualBasic

Public Class CybsUtil

    Public Shared Function getConfig(ByVal key As String) As String

        Dim webConfig As System.Configuration.Configuration
        webConfig = System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration(Nothing)

        Dim customSetting As System.Configuration.KeyValueConfigurationElement
        customSetting = webConfig.AppSettings.Settings(key)

        Dim value As String
        value = ""

        If (webConfig.AppSettings.Settings.Count > 0) Then
            If Not (customSetting.Value = Nothing) Then
                value = customSetting.Value
            End If
        End If

        Return value

    End Function

    Public Shared Function getPaymentUrl() As String

        Dim environment As String
        Dim paymentUrl As String
        Dim orgId As String

        environment = getConfig("ENVIRONMENT")
        paymentUrl = "https://testsecureacceptance.cybersource.com/pay"
        orgId = "1snn5n9w"

        If ("LIVE".Equals(environment, StringComparison.InvariantCultureIgnoreCase)) Then
            paymentUrl = "https://secureacceptance.cybersource.com/pay"
            orgId = "k8vif92e"
        End If

        Return paymentUrl

    End Function

End Class
