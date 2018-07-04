Imports Microsoft.VisualBasic

Public Class Security

    Public Shared Function sign(ByVal paramsArray As Hashtable) As String
        Return sign(buildDataToSign(paramsArray), CybsUtil.getConfig("SECRET_KEY"))
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
