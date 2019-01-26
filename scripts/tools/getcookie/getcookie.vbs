Option Explicit
''USAGE getcookie.vbs "url"
''''Bgetdescription#[VBS] Extracts a cookie from a website.
''''Bgetauthor#Kul-Tigin
''''Bgetcategory#tools
Function Fetch(ByVal URL, ByVal sHdrName)
    Dim http
    Set http = CreateObject("Microsoft.XmlHttp")
        http.open "GET", URL, False
        http.Send
        Fetch = getHeaders(http, sHdrName)
    Set http = Nothing  
End Function

Function getHeaders(oReq, sHdrName)
    Dim tHdrName : tHdrName = Trim(sHdrName) & ": "
    Dim tArr : tArr = Split(oReq.getAllResponseHeaders(), vbCrLf)
    tArr = Filter(tArr, tHdrName, True, vbTextCompare)
    Dim i
    For i = 0 To UBound(tArr)
        tArr(i) = Mid(tArr(i), Len(tHdrName) + 1, Len(tArr(i)))
    Next
    getHeaders = tArr 'Returns Array
End Function

'Iterate & Fetch
Dim iHdrVal
dim args
Set args = Wscript.Arguments
'first = args(0)
For Each iHdrVal In Fetch(args(0), "Set-Cookie")
    WScript.Echo iHdrVal
Next