Imports System.IO
Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports Microsoft.VisualBasic

Partial Class viewer
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Request.QueryString("name").ToLower = "simon" Then
            tblSimon.Visible = True
            tblMalini.Visible = False
        ElseIf Request.QueryString("name").ToLower = "malini" Then
            tblSimon.Visible = False
            tblMalini.Visible = True
        End If


        If Not Page.IsPostBack() Then
            lblSort.Text = "Date DESC"
            'Fodler1.Enabled = True
            'Folder2.Enabled = False

            If Request.QueryString("name").ToLower = "simon" Then
                lblFolder.Text = "SimonPics/" & Request.QueryString("folder") & "/" '"SimonPics/3_4Months/"

            ElseIf Request.QueryString("name").ToLower = "malini" Then
                lblFolder.Text = "MaliniPics/" & Request.QueryString("folder") & "/" '"SimonPics/3_4Months/"

            End If

            'lblFolder.Text = "SimonPics/" & Request.QueryString("folder") & "/" '"SimonPics/3_4Months/"

            BindTheData()


        End If



    End Sub




    Private Sub BindTheData()
        Dim dirInfo As New DirectoryInfo(Server.MapPath(lblFolder.Text))
       
        Dim dt As New DataTable
        Dim dc As New DataColumn
        dc.ColumnName = "Name"
        dt.Columns.Add(dc)
        dc = New DataColumn
        dc.ColumnName = "Date"
        dc.DataType = GetType(DateTime)
        dt.Columns.Add(dc)
        dc = New DataColumn
        dc.ColumnName = "Height"
        dt.Columns.Add(dc)
        dc = New DataColumn
        dc.ColumnName = "Width"
        dt.Columns.Add(dc)
        dt.AcceptChanges()

        Dim cindex As Integer
        Try
            cindex = CInt(lblCurrentIndex.Text)
        Catch ex As Exception
            cindex = 0
        End Try

        Dim d As FileInfo() '= dirInfo.GetFiles("*.JPG")

        If Request.QueryString("folder").ToLower <> "movies" Then
            d = dirInfo.GetFiles("*.JPG")
        Else
            d = dirInfo.GetFiles("*.AVI")
        End If

        Dim i As Integer = lblCurrentIndex.Text

        
        Dim newDT As New DataTable
        newDT = dt.Clone

        Dim last2 As Integer = cindex + CType(lblPageSize.Text, Integer)
        If last2 > d.Length - 1 Then
            last2 = d.Length - 1
        End If
        Dim s As String



        If Request.QueryString("folder").ToLower <> "movies" Then
            For i = 0 To d.Length - 1
                Dim currentImage As System.Drawing.Image = System.Drawing.Image.FromFile(Server.MapPath(lblFolder.Text & "thumbs/" & d(i).Name.ToString))
                Dim dr As DataRow = dt.NewRow
                dr("Name") = d(i).Name.ToString
                dr("Date") = d(i).CreationTime
                dr("Height") = currentImage.Height
                dr("Width") = currentImage.Width
                dt.Rows.Add(dr)
                dt.AcceptChanges()
            Next
        Else
            For i = 0 To d.Length - 1
                ' Dim currentImage As System.Drawing.Image = System.Drawing.Image.FromFile(Server.MapPath(lblFolder.Text & "thumbs/" & d(i).Name.ToString))
                Dim dr As DataRow = dt.NewRow
                dr("Name") = d(i).Name.ToString
                dr("Date") = d(i).CreationTime
                dr("Height") = 0 'currentImage.Height
                dr("Width") = 0 'currentImage.Width
                dt.Rows.Add(dr)
                dt.AcceptChanges()
            Next

        End If


        dt.DefaultView.Sort = lblSort.Text '"Height DESC, Date DESC"

        For i = 0 To dt.DefaultView.Count - 1
            If i < cindex Then
                'dt.Rows.RemoveAt(i)
            ElseIf i > last2 Then
                'dt.Rows.RemoveAt(i)
            Else
                Dim row As DataRow = newDT.NewRow
                'row = dt.Rows(i)
                row(0) = dt.DefaultView(i)(0)
                row(1) = dt.DefaultView(i)(1)
                row(2) = dt.DefaultView(i)(2)
                row(3) = dt.DefaultView(i)(3)

                newDT.Rows.Add(row)
            End If
            newDT.AcceptChanges()


        Next
        'For i = cindex To last 'd.Length - 1
        '    Dim dr As DataRow = dt.NewRow
        '    dr("Name") = d(i).Name
        '    dr("Date") = d(i).CreationTime
        '    dt.Rows.Add(dr)
        '    dt.AcceptChanges()

        'Next

        'If Not Page.IsPostBack() Then

        lblRecordCount.Text = d.Length - 1 'dt.Rows.Count ' CStr(dataSet.Tables(0).Rows.Count)

        '  End If

        If cindex + 19 > CType(lblRecordCount.Text, Integer) Then
            Last.Disabled = True
            aNext.Disabled = True
            A3.Disabled = True
            A4.Disabled = True


        Else
            Last.Disabled = False
            aNext.Disabled = False
            A3.Disabled = False
            A4.Disabled = False

        End If

        If cindex = 0 Then
            First.Disabled = True
            A1.Disabled = True
            A2.Disabled = True
            Previous.Disabled = True
        Else
            First.Disabled = False
            A1.Disabled = False
            A2.Disabled = False
            Previous.Disabled = False

        End If



        newDT.DefaultView.Sort = lblSort.Text '"Height DESC, Date DESC"
        ' dataAdapter.Fill(dataSet, CInt(lblCurrentIndex.Text), CInt(lblPageSize.Text), "Customers")
        DataList1.DataSource = newDT.DefaultView ' dt ' dataSet.Tables(0).DefaultView
        DataList1.DataBind()



    End Sub

    Public Sub ShowFirstPage(ByVal s As System.Object, ByVal e As System.EventArgs)
        lblCurrentIndex.Text = "0"
        BindTheData()
    End Sub

    Public Sub ShowPreviousPage(ByVal s As System.Object, ByVal e As System.EventArgs)
        lblCurrentIndex.Text = CStr(CInt(lblCurrentIndex.Text) - CInt(lblPageSize.Text))
        If CInt(lblCurrentIndex.Text) < 0 Then
            lblCurrentIndex.Text = "0"
        End If
        BindTheData()
    End Sub

    Public Sub ShowNextPage(ByVal s As System.Object, ByVal e As System.EventArgs)
        If CInt(CInt(lblCurrentIndex.Text) + CInt(lblPageSize.Text)) < CInt(lblRecordCount.Text) Then
            lblCurrentIndex.Text = CStr(CInt(lblCurrentIndex.Text) + CInt(lblPageSize.Text))
        End If
        BindTheData()
    End Sub

    Public Sub ShowLastPage(ByVal s As System.Object, ByVal e As System.EventArgs)
        Dim intMod As Integer
        intMod = CInt(lblRecordCount.Text) Mod CInt(lblPageSize.Text)
        If intMod > 0 Then
            lblCurrentIndex.Text = CStr(CInt(lblRecordCount.Text) - intMod)
        Else
            lblCurrentIndex.Text = CStr(CInt(lblRecordCount.Text) - CInt(lblPageSize.Text))
        End If
        BindTheData()
    End Sub

    Private Sub ShowCounts()
        lblCounts.Text = "|Total Rows: <b>" & lblRecordCount.Text
        lblCounts.Text += "</b> | Page:<b> "
        lblCounts.Text += CStr(CInt(CInt(lblCurrentIndex.Text) / CInt(lblPageSize.Text) + 1))
        lblCounts.Text += "</b> of <b>"
        If (CInt(lblRecordCount.Text) Mod CInt(lblPageSize.Text)) > 0 Then
            lblCounts.Text += CStr(Fix(CInt(lblRecordCount.Text) / CInt(lblPageSize.Text) + 1))
        Else
            lblCounts.Text += CStr(Fix(lblRecordCount.Text) / CInt(lblPageSize.Text))
        End If
        lblCounts.Text += "</b> |"
    End Sub


    Protected Sub LinkButton2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton2.Click
        lblSort.Text = "Height DESC, Date DESC"
        LinkButton2.Enabled = False
        LinkButton1.Enabled = True
        BindTheData()

    End Sub

    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton1.Click
        lblSort.Text = "Date DESC"
        LinkButton2.Enabled = True
        LinkButton1.Enabled = False
        BindTheData()
    End Sub

    'Protected Sub Fodler1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Fodler1.Click
    '    lblCurrentIndex.Text = "0"
    '    lblFolder.Text = "SimonPics/1_2Months/"
    '    Fodler1.Enabled = False
    '    Folder2.Enabled = True
    '    BindTheData()
    'End Sub

    'Protected Sub Folder2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Folder2.Click
    '    lblCurrentIndex.Text = "0"
    '    lblFolder.Text = "SimonPics/3_4Months/"
    '    Folder2.Enabled = False
    '    Fodler1.Enabled = True

    '    BindTheData()
    'End Sub
End Class
