Imports Microsoft.VisualBasic

Public Class security
    Const SECRET_KEY As String = "fc65fa272ce54851bae8433d7016aaace58d636b087043e285cc2120c2095c6c60faa1b0901b47e6bc1bc9ddeffe76b8ddb2ff08ed594fe2b8207758ee1d4a2684a591073545499485b9023a03d4de2b5c661d4de7214a0f862c5e8c785844f927fd3fba0d5c4cbc8895f61656353998aef73b42d15c4ed397d22bf86a64563c"

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
