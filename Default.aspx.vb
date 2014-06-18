Imports System.IO
Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports Microsoft.VisualBasic

Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Request.QueryString("name") Is Nothing Then
            Response.Redirect("Home.aspx")
        End If

        If Request.QueryString("name").ToLower = "simon" Then
            tblSimon.Visible = True
            tblMalini.Visible = False
        ElseIf Request.QueryString("name").ToLower = "malini" Then
            tblSimon.Visible = False
            tblMalini.Visible = True
        End If

        If Not Page.IsPostBack() Then

            BindTheData()
        End If
       


    End Sub




    Private Sub BindTheData()
        Dim dirInfo As DirectoryInfo
        If Request.QueryString("name").ToLower = "simon" Then
              dirInfo = New DirectoryInfo(Server.MapPath("SimonPics"))
        ElseIf Request.QueryString("name").ToLower = "malini" Then
            dirInfo = New DirectoryInfo(Server.MapPath("MaliniPics"))
        End If

        'dirInfo = New DirectoryInfo(Server.MapPath("SimonPics"))


        Dim dt As New DataTable
        Dim dc As New DataColumn
        dc.ColumnName = "Name"
        dt.Columns.Add(dc)
        dc = New DataColumn
        dc.ColumnName = "IsNew"
        dt.Columns.Add(dc)
        dc = New DataColumn
        dc.ColumnName = "DateCreated"
        dt.Columns.Add(dc)
        dc = New DataColumn
        dc.ColumnName = "DateCreatedInt"
        dt.Columns.Add(dc)

        dt.AcceptChanges()


        Dim d As DirectoryInfo() = dirInfo.GetDirectories()
        For i As Integer = 0 To d.Length - 1
            Dim dr As DataRow = dt.NewRow()
            dr("Name") = d(i).Name
            dr("DateCreated") = d(i).CreationTime



            Dim dtime As String() = d(i).CreationTime.ToShortDateString.Split("/")
            Dim intDC As Integer = dtime(2).ToString & dtime(0).ToString & dtime(1).ToString
            dr("DateCreatedInt") = intDC



            If DateDiff(DateInterval.Day, d(i).CreationTime, Date.Now()) < 30 Then
                dr("IsNew") = "New "
            Else
                dr("IsNew") = ""
            End If

            dt.Rows.Add(dr)
        Next

        Dim dv As New DataView(dt)
        dv.Sort = "DateCreatedInt desc"

        DataList1.DataSource = dv 'dt.DefaultView
        DataList1.DataBind()



    End Sub

     
End Class
