Imports Microsoft.VisualBasic

Public Class security

    Const SECRET_KEY As String = "9a5d4d3a6f9845bf96372912813ff4582e71cf2482c14924b6a8a56b146d79bb5ec5b1b6ea5449229eaefaea522d1e25edd359e9c16946b691c504850cb5e9cb188383e627594e19b925de7a36ab06dcc23511ddc0754c86836feedf500332452f8bc1f455d44af5aae4dcbfe2cbec14b4b8644878ea40fab7f761cd6c9c96b1" '<REPLACE WITH SECRET KEY>

    Public Shared Function sign(ByVal paramsArray As Hashtable) As String
        Return sign(buildDataToSign(paramsArray), SECRET_KEY)
    End Function

    Private Shared Function sign(ByVal data As String, ByVal secretKey As String) As String

        Dim encoder As New System.Text.UTF8Encoding
        Dim key() As Byte = encoder.GetBytes(secretKey)
        Dim dataAsBytes() As Byte = encoder.GetBytes(data)

        Dim myHMACSHA256 As New System.Security.Cryptography.HMACSHA256(key)
        Dim HashCode As Byte() = myHMACSHA256.ComputeHash(dataAsBytes)

        Return Convert.ToBase64String(HashCode)

    End Function

    Private Shared Function buildDataToSign(ByVal paramsArray As Hashtable) As String
        Dim signedFieldNames As String() = paramsArray("signed_field_names").Split(",")
        Dim dataToSign As New List(Of String)
        Dim signedFieldName As String

        For Each signedFieldName In signedFieldNames
            dataToSign.Add(signedFieldName + "=" + paramsArray(signedFieldName))
        Next

        Return commaSeparate(dataToSign)
    End Function

    Private Shared Function commaSeparate(ByVal dataToSign As List(Of String)) As String
        Return String.Join(",", dataToSign.ToArray)
    End Function

End Class
