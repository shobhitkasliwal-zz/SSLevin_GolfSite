Imports System.Data
Imports System.Data.SqlClient

Partial Class Golf_Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim dv As System.Data.DataView
        Calendar1.TodayDayStyle.BackColor = Drawing.Color.White


        Dim sss As New System.Web.UI.DataSourceSelectArguments
        sss.SortExpression = "GameDate Asc"
        dv = SqlDataSource2.Select(sss)
        Dim newA As ArrayList
        newA = New ArrayList

        For i As Integer = 0 To dv.Count - 1
            Dim thisdate As DateTime
            thisdate = CType(dv(i)("GameDate"), DateTime)
            'Calendar1.SelectedDates.Add(thisdate)
            newA.Add(thisdate)


        Next

        ViewState("newA") = newA

        If Not Page.IsPostBack Then
            If Not Request.QueryString("gameday") Is Nothing Then
                loadRSVPFOR(Request.QueryString("gameday"))
            End If
        End If

        If Not Request.QueryString("email") Is Nothing Then
            txtEmail.Text = Request.QueryString("email")
        End If





    End Sub

    Private Sub loadRSVPFOR(ByVal RSVPDAY As String)

        ViewState("SelectedDateTime") = ""
        tableProposal.Visible = False
        lnkRSVP.Visible = False
        lnkPropose.Visible = ShowProposeGameLink(False)

        lblMessage.Text = ""

        Calendar1.SelectedDate = CDate(RSVPDAY)

        Dim thisdate As Date = Calendar1.SelectedDate
        Dim al As ArrayList = CType(ViewState("newA"), ArrayList)
        For i As Integer = 0 To al.Count - 1
            If CType(al(i), Date).ToShortDateString = thisdate.ToShortDateString Then
                ViewState("SelectedDate") = CType(al(i), Date)

                Dim ddate As String = CType(al(i), Date).ToLongDateString
                Dim dtime As String = CType(al(i), Date).ToShortTimeString

                GV1_GameDate.Text = ddate
                GV1_GameTime.Text = dtime

                'GridView1.Caption = "<b>Game Day:</b> " & ddate & "<br>"
                'GridView1.Caption &= "<b>Game Time :</b> " & dtime & "<br>"

                ViewState("SelectedDateTime") = CType(ddate & " " & dtime, DateTime)
                If isGameClosed(RSVPDAY) = True Then
                    lnkRSVP.Visible = False
                    lnkPropose.Visible = ShowProposeGameLink(False)
                    tableEmail.Visible = False
                    tableClosed.Visible = True
                Else
                    lnkRSVP.Visible = True
                    lnkPropose.Visible = ShowProposeGameLink(False)
                    tableEmail.Visible = True
                    lblMessage.Text = "Please RSVP for this game."
                End If
                
            End If

        Next

        If lblMessage.Text = "" Then
            lnkPropose.Visible = ShowProposeGameLink(True)

        End If

        RenderRSVPGrid()
      

    End Sub

    Protected Sub Calendar1_DayRender(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DayRenderEventArgs) Handles Calendar1.DayRender
        Dim thisdate As Date = e.Day.Date
        Dim al As ArrayList = CType(ViewState("newA"), ArrayList)
        For i As Integer = 0 To al.Count - 1
            If CType(al(i), Date).ToShortDateString = thisdate.ToShortDateString Then
                e.Cell.BackColor = Drawing.Color.Green
                e.Cell.ForeColor = Drawing.Color.White
                If thisdate < Date.Today Then

                    e.Cell.ForeColor = Drawing.Color.Red

                    e.Cell.BackColor = Drawing.Color.DarkGreen



                End If
            End If

        Next



    End Sub

    Private Function ShowProposeGameLink(ByVal Bool As Boolean) As Boolean
        If Session("admin") = True Then
            Return Bool
        Else
            Return False

        End If

    End Function


    Protected Sub Calendar1_SelectionChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Calendar1.SelectionChanged
        tableProposal.Visible = False
        tableEmail.Visible = False
        lblMessage.Text = ""
        lnkRSVP.Visible = False
        lnkPropose.Visible = ShowProposeGameLink(True)

        ViewState("SelectedDateTime") = ""

        ViewState("SelectedDate") = Calendar1.SelectedDate.ToShortDateString
        tableClosed.Visible = False


        Dim thisdate As Date = Calendar1.SelectedDate
        Dim al As ArrayList = CType(ViewState("newA"), ArrayList)
        For i As Integer = 0 To al.Count - 1
            If CType(al(i), Date).ToShortDateString = thisdate.ToShortDateString Then
                ViewState("SelectedDate") = CType(al(i), Date)

                'Dim ddate As String = CType(al(i), Date).ToShortDateString
                Dim ddate As String = CType(al(i), Date).ToLongDateString
                Dim dtime As String = CType(al(i), Date).ToShortTimeString

                'GridView1.Caption = "<b>Game Day:</b> " & ddate & "<br>"
                'GridView1.Caption &= "<b>Game Time :</b> " & dtime & "<br>"

                GV1_GameDate.Text = ddate
                GV1_GameTime.Text = dtime

                ViewState("SelectedDateTime") = CType(ddate & " " & dtime, DateTime)


                If isGameClosed(ddate) = True Then
                    tableEmail.Visible = False
                    tableClosed.Visible = True
                    lnkRSVP.Visible = False
                    lnkPropose.Visible = ShowProposeGameLink(False)
                Else
                    lnkRSVP.Visible = True
                    lnkPropose.Visible = ShowProposeGameLink(False)
                    tableEmail.Visible = False
                    tableClosed.Visible = False
                End If

            End If

        Next

        RenderRSVPGrid()


    End Sub

    Private Sub RenderRSVPGrid()
        ' SqlDataSource1.SelectParameters.Item("GameDate").DefaultValue = "05/13/2009"

        Dim a As New Web.UI.DataSourceSelectArguments()
        Dim dv As DataView = SqlDataSource1.Select(DataSourceSelectArguments.Empty)
        'tbGameInfo.visible = True

        If dv.Count > 0 Then
            tbGameInfo.Visible = True

            dv.RowFilter = "IsPlaying=1"
            GV1_NumOfPlayers.Text = dv.Count.ToString


        Else
            tbGameInfo.Visible = False
        End If
    End Sub

    Protected Sub lnkRSVP_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkRSVP.Click
        tableEmail.Visible = True
        tableProposal.Visible = False
        lnkRSVP.Visible = False
        lnkPropose.Visible = ShowProposeGameLink(False)

        lblMessage.Text = ""

    End Sub




    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound

        If e.Row.RowType = DataControlRowType.DataRow Then

        End If


    End Sub

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click
        Dim selectedDate As DateTime = CType(ViewState("SelectedDateTime"), DateTime)


        Dim emailadd As String = txtEmail.Text
        Dim rsvp As Boolean = CType(rdoResponse.SelectedValue, Boolean)

        Dim objSQL As New SQLHelper(Data.CommandType.Text)

        Dim GameID As Integer = objSQL.ExecuteTextScalar("SELECT  Game_ID  FROM  GOLF_Games where gamedate = '" & selectedDate.ToString & "'")



        Dim strSQL As String = "Update Golf_Responses " & vbCrLf & _
        "set SendReminder=0, IsPlaying = " & rdoResponse.SelectedValue & " where Game_ID = " & GameID & " and playerid = (Select [id] from golf_Players where emailaddress = '" & txtEmail.Text & "');"
        objSQL.ExecuteText(strSQL)
        objSQL.Kill()

        GridView1.DataBind()


        lblMessage.Text = "Thank you, your RSVP has been successfully updated."
        tableEmail.Visible = False
        tableClosed.Visible = False



    End Sub

    Protected Sub lnkPropose_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkPropose.Click


        tableProposal.Visible = True
        tableEmail.Visible = False
        lblPDate.Text = ViewState("SelectedDate").ToString
        lnkRSVP.Visible = False
        lnkPropose.Visible = ShowProposeGameLink(False)
        lblMessage.Text = "<font color=red><b>NOTE:</b></font> After submitting this game,<br>every player will be sent an email."



    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim strGamers As String = ""
        For Each itm As ListItem In CheckBoxList1.Items
            If itm.Selected = True Then
                If strGamers = "" Then
                    strGamers = itm.Value
                Else
                    strGamers &= "," & itm.Value
                End If
            End If
        Next

        Dim teetime As String = ddONE.SelectedValue & ":" & ddTWO.SelectedValue & " " & ddTHREE.SelectedValue

        Dim objsql As New SQLHelper(Data.CommandType.StoredProcedure)
        objsql.Parameters.Add(New SqlParameter("@GameDate", lblPDate.Text & " " & teetime))
        objsql.Parameters.Add(New SqlParameter("@GAMERS", strGamers.ToString))
        objsql.ExecuteStoredProcedure("GOLF_ADDGAME_WithPlayers")

        tableProposal.Visible = False

        objsql.Kill()

        'Dim objSQL As New SQLHelper(Data.CommandType.Text)

        'Dim strSQL As String = "Insert into GOLF_RESPONSES (GameDate, PlayerID) " & vbCrLf & _
        '"Select '" & lblPDate.Text & " " & teetime & "', [ID] From GOLF_PLAYERS"
        'objSQL.ExecuteText(strSQL)

        ''  Dim strSelect As String = "Select "



        'objSQL = New SQLHelper(Data.CommandType.StoredProcedure)
        'objSQL.ExecuteStoredProcedure("[dbo].[GOLF_SENDREMINDERS]")

        'objSQL.Kill()

        Dim dv As System.Data.DataView
        Calendar1.TodayDayStyle.BackColor = Drawing.Color.White


        Dim sss As New System.Web.UI.DataSourceSelectArguments
        sss.SortExpression = "GameDate Asc"
        dv = SqlDataSource2.Select(sss)
        Dim newA As ArrayList
        newA = New ArrayList

        For i As Integer = 0 To dv.Count - 1
            Dim thisdate As DateTime
            thisdate = CType(dv(i)("GameDate"), DateTime)
            'Calendar1.SelectedDates.Add(thisdate)
            newA.Add(thisdate)


        Next

        ViewState("newA") = newA

        ViewState("SelectedDateTime") = ""
        ViewState("SelectedDate") = CDate(lblPDate.Text).ToShortDateString

        Dim mydate As Date = CDate(lblPDate.Text)
        Dim al As ArrayList = CType(ViewState("newA"), ArrayList)
        For i As Integer = 0 To al.Count - 1
            If CType(al(i), Date).ToShortDateString = mydate.ToShortDateString Then
                ViewState("SelectedDate") = CType(al(i), Date)
                'Dim ddate As String = CType(al(i), Date).ToShortDateString
                Dim ddate As String = CType(al(i), Date).ToLongDateString
                Dim dtime As String = CType(al(i), Date).ToShortTimeString

                GV1_GameDate.Text = ddate
                GV1_GameTime.Text = dtime

                'GridView1.Caption = "<b>Game Day:</b> " & ddate & "<br>"
                'GridView1.Caption &= "<b>Game Time :</b> " & dtime & "<br>"

                ViewState("SelectedDateTime") = CType(ddate & " " & dtime, DateTime)

                lnkRSVP.Visible = True
                lnkPropose.Visible = ShowProposeGameLink(False)
            End If

        Next


        GridView1.DataBind()
        GridView1.Visible = True


        tableEmail.Visible = True
        tableClosed.Visible = False

        rdoResponse.SelectedValue = 1


        lblMessage.Text = "Thank you, a new game has been loaded into the system.<br><br>Please RSVP to this game now if you'd like in the above table."

        tableProposal.Visible = False

        RenderRSVPGrid()

    End Sub

    Protected Sub GridView2_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView2.PreRender
        If Session("admin") = False Then
            GridView2.Columns(0).Visible = False
            GridView2.Columns(1).Visible = False
            tredit.Visible = True
            trAdd.Visible = False
        Else

            GridView2.Columns(0).Visible = True
            GridView2.Columns(1).Visible = True
            tredit.Visible = False
            trAdd.Visible = True

        End If



    End Sub

    Protected Sub lnkPassword_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkPassword.Click
        If txtpassword.Text = "Mavin3982" Then
            Session("admin") = True


        End If
    End Sub

    Protected Sub btnAddEmail_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAddEmail.Click
        Dim objsql As New SQLHelper(CommandType.Text)
        objsql.ExecuteText("INSERT INTO [GOLF_Players] ([FullName], [EmailAddress]) VALUES ('" & txtFullName.Text & "', '" & txtEmailaddress.Text & "');")
        objsql.Kill()
        lblmsg1.Text = "Player added<br>"
        Page.DataBind()

    End Sub

    Protected Sub GridView2_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView2.RowDataBound
        If Session("admin") = True Then
            If e.Row.RowState = DataControlRowState.Normal Then
                If e.Row.RowType = DataControlRowType.DataRow Then
                    CType(e.Row.Cells(0).Controls(0), LinkButton).Attributes.Add("onclick", "return confirm('Are you sure you want to delete this user?');")
                End If
            End If
        End If

    End Sub

    Public Function isGameClosed(ByVal GameDate As DateTime) As Boolean
        Dim retval As Boolean = False
        Dim objsql As New SQLHelper(CommandType.Text)
        Dim ds As DataSet = objsql.ReturnDataSetFromText("select isnull(IsClosed,0) from Golf_Games where day(GameDate) = day('" & CDate(GameDate) & "') and year(GameDate) = year('" & CDate(GameDate) & "') and month(GameDate) = month('" & CDate(GameDate) & "')")
        retval = CType(ds.Tables(0).Rows(0)(0).ToString, Boolean)
        objsql.Kill()
        Return retval


    End Function




End Class
