Imports Microsoft.VisualBasic
Imports System.IO
Imports System
Imports System.Web
Imports System.Web.HttpServerUtility


Public Class Class1
    Public Class1()


    Public Shared Function getdata() As FileInfo()
        Dim dirinfo As New DirectoryInfo("SimonPics/")
        'dirinfo.GetFiles("*.JPG")
        Return dirinfo.GetFiles("*.JPG")



    End Function

End Class

