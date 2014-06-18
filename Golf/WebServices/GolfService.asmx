<%@ WebService Language="VB" Class="GolfService" %>

Imports System.Web
Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.Web.Script.Services
Imports System.Web.Script.Serialization
Imports System.Data

' To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line.
<System.Web.Script.Services.ScriptService()> _
<WebService(Namespace:="http://tempuri.org/")> _
<WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
Public Class GolfService
    Inherits System.Web.Services.WebService
    
    <WebMethod()> _
   <ScriptMethod(ResponseFormat:=ResponseFormat.Json, UseHttpGet:=True)> _
    Public Sub AuthenticateUser(ByVal Email As String, ByVal Password As String)
       
        Dim sqlh As New SQLHelper("GolfDB", Data.CommandType.StoredProcedure)
        sqlh.Parameters.AddWithValue("@Email", Email)
        sqlh.Parameters.AddWithValue("@Password", Password)
        
        Dim ds As DataSet = sqlh.ReturnDataSetFromSproc("[dbo].[ReturnAllUserAfterAuthentication]")
        Dim returnString As String = ""
        If Not IsNothing(ds) AndAlso ds.Tables.Count > 0 AndAlso ds.Tables(0).Rows.Count > 0 Then
            Dim dt As DataTable = ds.Tables(0)
            dt.TableName = "Golfers"
            returnString = Helper.ConvertDataTableToJSON(dt)
        End If

        Dim context As New HttpContext(HttpContext.Current.Request, HttpContext.Current.Response)
        context.Response.ContentType = "application/json;charset=utf-8"
        context.Response.Write(returnString)

    End Sub
    
    
    <WebMethod()> _
  <ScriptMethod(ResponseFormat:=ResponseFormat.Json, UseHttpGet:=True)> _
    Public Sub RetriveGames(ByVal StartDate As String)
        Dim sqlh As New SQLHelper("GolfDB", Data.CommandType.StoredProcedure)
        Dim dtGameDate As DateTime
        If DateTime.TryParse(StartDate, dtGameDate) Then
            sqlh.Parameters.AddWithValue("@StartDate", dtGameDate)
        End If
        Dim ds As DataSet = sqlh.ReturnDataSetFromSproc("[dbo].[Retrieve_Games]")
        Dim returnString As String = ""
        If Not IsNothing(ds) AndAlso ds.Tables.Count > 0 AndAlso ds.Tables(0).Rows.Count > 0 Then
            Dim dt As DataTable = ds.Tables(0)
            dt.TableName = "Games"
            returnString = Helper.ConvertDataTableToJSON(dt)
        End If

        Dim context As New HttpContext(HttpContext.Current.Request, HttpContext.Current.Response)
        context.Response.ContentType = "application/json;charset=utf-8"
        context.Response.Write(returnString)

    End Sub

    
    
    
    <WebMethod()> _
 <ScriptMethod(ResponseFormat:=ResponseFormat.Json, UseHttpGet:=True)> _
    Public Sub RetriveResponses(ByVal GameID As String)
        Dim sqlh As New SQLHelper("GolfDB", Data.CommandType.StoredProcedure)
        Dim intGameID As Integer
        If Integer.TryParse(GameID, intGameID) Then
            sqlh.Parameters.AddWithValue("@GameId", intGameID)
        End If
        Dim ds As DataSet = sqlh.ReturnDataSetFromSproc("[dbo].[Retrieve_Player_Respomses]")
        Dim returnString As String = ""
        If Not IsNothing(ds) AndAlso ds.Tables.Count > 0 AndAlso ds.Tables(0).Rows.Count > 0 Then
            Dim dt As DataTable = ds.Tables(0)
            dt.TableName = "Responses"
            returnString = Helper.ConvertDataTableToJSON(dt)
        End If

        Dim context As New HttpContext(HttpContext.Current.Request, HttpContext.Current.Response)
        context.Response.ContentType = "application/json;charset=utf-8"
        context.Response.Write(returnString)

    End Sub
    
    <WebMethod()> _
<ScriptMethod(ResponseFormat:=ResponseFormat.Json, UseHttpGet:=True)> _
    Public Sub PostRSVP(ByVal GameID As String, ByVal PlayerId As String, ByVal isPlaying As String, ByVal sendreminder As String, ReminderType As String)
        Dim returnString As String = ""
        Try
            Dim sqlh As New SQLHelper("GolfDB", Data.CommandType.StoredProcedure)
            sqlh.Parameters.AddWithValue("@PlayerId", PlayerId)
            sqlh.Parameters.AddWithValue("@GameId", GameID)
            sqlh.Parameters.AddWithValue("@isPlaying", isPlaying)
            sqlh.Parameters.AddWithValue("@SendReminder", sendreminder)
            sqlh.Parameters.AddWithValue("@ReminderType", ReminderType)
            Dim ds As DataSet = sqlh.ReturnDataSetFromSproc("[dbo].[Post_RSVP_Response]")
            If Not IsNothing(ds) AndAlso ds.Tables.Count > 0 AndAlso ds.Tables(0).Rows.Count > 0 Then
                Dim dt As DataTable = ds.Tables(0)
                dt.TableName = "Output"
                returnString = Helper.ConvertDataTableToJSON(dt)
            End If
        Catch ex As Exception
            Dim dt As New DataTable()
            Dim dc As New DataColumn("Message")
            dc.DefaultValue = ex.Message
            dt.Columns.Add(dc)
            dt.AcceptChanges()
            dt.TableName = "Output"
            returnString = Helper.ConvertDataTableToJSON(dt)
        End Try
        Dim context As New HttpContext(HttpContext.Current.Request, HttpContext.Current.Response)
        context.Response.ContentType = "application/json;charset=utf-8"
        context.Response.Write(returnString)

    End Sub
    
    
    <WebMethod()> _
  <ScriptMethod(ResponseFormat:=ResponseFormat.Json, UseHttpGet:=False)> _
    Public Function Web_RetriveGames(ByVal ApplicationID As String) As String
        Dim sqlh As New SQLHelper("GolfDB", Data.CommandType.StoredProcedure)
        sqlh.Parameters.AddWithValue("@ApplicationID", ApplicationID)
        Dim ds As DataSet = sqlh.ReturnDataSetFromSproc("[dbo].[Web_Retrive_Games]")
        Dim returnString As String = ""
        If Not IsNothing(ds) AndAlso ds.Tables.Count > 0 AndAlso ds.Tables(0).Rows.Count > 0 Then
            Dim dt As DataTable = ds.Tables(0)
            dt.TableName = "Games"
            returnString = Helper.ConvertDataTableToJSON(dt)
        End If

        Return returnString

    End Function

    
    
    
    
    <WebMethod()> _
  <ScriptMethod(ResponseFormat:=ResponseFormat.Json, UseHttpGet:=False)> _
    Public Function Web_RetrivePlayers(ByVal ApplicationID As String, ByVal ShowType As String) As String
   
        Dim sqlh As New SQLHelper("GolfDB", Data.CommandType.StoredProcedure)
        sqlh.Parameters.AddWithValue("@ApplicationID", ApplicationID)
        sqlh.Parameters.AddWithValue("@ShowType", ShowType)
        
        
        Dim ds As DataSet = sqlh.ReturnDataSetFromSproc("[dbo].[Web_Retrive_AllPlayers]")
        Dim returnString As String = ""
        If Not IsNothing(ds) AndAlso ds.Tables.Count > 0 AndAlso ds.Tables(0).Rows.Count > 0 Then
            Dim dt As DataTable = ds.Tables(0)
            dt.TableName = "Players"
            returnString = Helper.ConvertDataTableToJSON(dt)
        End If

        Return returnString
        
    End Function
    
    
    
   
    <WebMethod()> _
 <ScriptMethod(ResponseFormat:=ResponseFormat.Json, UseHttpGet:=False)> _
    Public Function Web_RetriveGameDetail(ByVal GameID As String) As String
        Dim sqlh As New SQLHelper("GolfDB", Data.CommandType.StoredProcedure)
        sqlh.Parameters.AddWithValue("@Gameid", GameID)
        Dim ds As DataSet = sqlh.ReturnDataSetFromSproc("[dbo].[Web_Retrive_Game_info]")
        Dim returnString As String = ""
        If Not IsNothing(ds) AndAlso ds.Tables.Count > 1 AndAlso ds.Tables(0).Rows.Count > 0 Then
            ds.Tables(0).TableName = "Attending"
            ds.Tables(1).TableName = "GameInfo"
            returnString = Helper.ConvertDataSetToJSON(ds)
        End If
        Return returnString
    End Function
    
    
    <WebMethod()> _
 <ScriptMethod(ResponseFormat:=ResponseFormat.Json, UseHttpGet:=False)> _
    Public Function Web_ValidateRSVPEmail(ByVal EmailAddress As String, ByVal GameId As String) As String
        Dim sqlh As New SQLHelper("GolfDB", Data.CommandType.StoredProcedure)
        sqlh.Parameters.AddWithValue("@Email", EmailAddress)
        sqlh.Parameters.AddWithValue("@GameId", GameId)
        Dim ds As DataSet = sqlh.ReturnDataSetFromSproc("[dbo].[Web_ValidateRSVPEmail]")
        Dim returnString As String = ""
        If Not IsNothing(ds) AndAlso ds.Tables.Count > 0 AndAlso ds.Tables(0).Rows.Count > 0 Then
            Dim dt As DataTable = ds.Tables(0)
            dt.TableName = "RSVPValidateEmail"
            returnString = Helper.ConvertDataTableToJSON(dt)
        End If
        Return returnString
    End Function

    <WebMethod()> _
<ScriptMethod(ResponseFormat:=ResponseFormat.Json, UseHttpGet:=False)> _
    Public Function Web_RSVP_Game(ByVal PlayerId As String, ByVal GameId As String, ByVal isPlaying As String, ByVal Guests As String, ByVal RSVP_TeeOff As String, ByVal RSVP_TeeBox As String, ByVal RSVP_Risk As String, ByVal RSVP_Mode As String) As String
        Dim sqlh As New SQLHelper("GolfDB", Data.CommandType.StoredProcedure)
        sqlh.Parameters.AddWithValue("@PlayerId", PlayerId)
        sqlh.Parameters.AddWithValue("@GameId", GameId)
        sqlh.Parameters.AddWithValue("@isPlaying", isPlaying)
        sqlh.Parameters.AddWithValue("@Guests", Guests)
        sqlh.Parameters.AddWithValue("@RSVP_TeeOff", RSVP_TeeOff)
        sqlh.Parameters.AddWithValue("@RSVP_TeeBox", RSVP_TeeBox)
        sqlh.Parameters.AddWithValue("@RSVP_Risk", RSVP_Risk)
        sqlh.Parameters.AddWithValue("@RSVP_Mode", RSVP_Mode)
        Dim ds As DataSet = sqlh.ReturnDataSetFromSproc("[dbo].[Web_RSVP_Game]")
        Dim returnString As String = ""
        If Not IsNothing(ds) AndAlso ds.Tables.Count > 0 AndAlso ds.Tables(0).Rows.Count > 0 Then
            Dim dt As DataTable = ds.Tables(0)
            dt.TableName = "RSVPGame"
            returnString = Helper.ConvertDataTableToJSON(dt)
        End If
        Return returnString
    End Function
    
    <WebMethod()> _
  <ScriptMethod(ResponseFormat:=ResponseFormat.Json, UseHttpGet:=False)> _
    Public Function Web_ReturnUserInfoAfterAuthentication(ByVal Email As String, ByVal Password As String, ByVal ApplicationID As String) As String
       
        Dim sqlh As New SQLHelper("GolfDB", Data.CommandType.StoredProcedure)
        sqlh.Parameters.AddWithValue("@Email", Email)
        sqlh.Parameters.AddWithValue("@Password", Password)
        sqlh.Parameters.AddWithValue("@ApplicationID", ApplicationID)
        Dim ds As DataSet = sqlh.ReturnDataSetFromSproc("[dbo].[Web_ReturnUserInfoAfterAuthentication]")
        Dim returnString As String = ""
        If Not IsNothing(ds) AndAlso ds.Tables.Count > 0 AndAlso ds.Tables(0).Rows.Count > 0 Then
            Dim dt As DataTable = ds.Tables(0)
            dt.TableName = "Golfers"
            returnString = Helper.ConvertDataTableToJSON(dt)
        End If

        Return returnString

    End Function
    
    <WebMethod()> _
 <ScriptMethod(ResponseFormat:=ResponseFormat.Json, UseHttpGet:=False)> _
    Public Function Web_DeleteUserProfile(ByVal PlayerId As String, ByVal ApplicationID As String) As String
       
        Dim sqlh As New SQLHelper("GolfDB", Data.CommandType.StoredProcedure)
        sqlh.Parameters.AddWithValue("@PlayerID", PlayerId)
        sqlh.Parameters.AddWithValue("@ApplicationID", ApplicationID)
        Dim ds As DataSet = sqlh.ReturnDataSetFromSproc("[dbo].[Web_DeleteUserProfile]")
        Dim returnString As String = ""
        If Not IsNothing(ds) AndAlso ds.Tables.Count > 0 AndAlso ds.Tables(0).Rows.Count > 0 Then
            Dim dt As DataTable = ds.Tables(0)
            dt.TableName = "DeleteProfile"
            returnString = Helper.ConvertDataTableToJSON(dt)
        End If

        Return returnString
    End Function
    
    <WebMethod()> _
 <ScriptMethod(ResponseFormat:=ResponseFormat.Json, UseHttpGet:=False)> _
    Public Function Web_InsertUpdateUserProfile(ByVal PlayerId As String, ByVal FullName As String, ByVal Email As String, ByVal WedGame As String, ByVal FriGame As String, ByVal SatGame As String, ByVal SunGame As String, ByVal Enable As String, ByVal Teeoff As String, ByVal TeeBox As String, ByVal Mode As String, ByVal Risk As String, ByVal Password As String, ByVal CreatedBy As String, ByVal ModifyBy As String, ByVal ApplicationID As String, ByVal WedCaptain As String, ByVal FriCaptain As String, ByVal SatCaptain As String, ByVal SunCaptain As String) As String
       
        Dim sqlh As New SQLHelper("GolfDB", Data.CommandType.StoredProcedure)
        If PlayerId.Length > 0 Then sqlh.Parameters.AddWithValue("@PlayerID", PlayerId)
        sqlh.Parameters.AddWithValue("@FullName", FullName)
        sqlh.Parameters.AddWithValue("@EmailAddress", Email)
        If WedGame.Length > 0 Then sqlh.Parameters.AddWithValue("@WednesdayGame", WedGame)
        If FriGame.Length > 0 Then sqlh.Parameters.AddWithValue("@FridayGame", FriGame)
        If SatGame.Length > 0 Then sqlh.Parameters.AddWithValue("@SaturdayGame", SatGame)
        If SunGame.Length > 0 Then sqlh.Parameters.AddWithValue("@SundayGame", SunGame)
        
        If WedCaptain.Length > 0 Then sqlh.Parameters.AddWithValue("@WednesdayCaptain", WedCaptain)
        If FriCaptain.Length > 0 Then sqlh.Parameters.AddWithValue("@FridayCaptain", FriCaptain)
        If SatCaptain.Length > 0 Then sqlh.Parameters.AddWithValue("@SaturdayCaptain", SatCaptain)
        If SunCaptain.Length > 0 Then sqlh.Parameters.AddWithValue("@SundayCaptain", SunCaptain)
        
        If Enable.Length > 0 Then sqlh.Parameters.AddWithValue("@Enable", Enable)
        If Teeoff.Length > 0 Then sqlh.Parameters.AddWithValue("@TeeOff", Teeoff)
        If TeeBox.Length > 0 Then sqlh.Parameters.AddWithValue("@TeeBox", TeeBox)
        If Risk.Length > 0 Then sqlh.Parameters.AddWithValue("@Risk", Risk)
        If Mode.Length > 0 Then sqlh.Parameters.AddWithValue("@Mode", Mode)
        If Password.Length > 0 Then sqlh.Parameters.AddWithValue("@Password", Password)
        If CreatedBy.Length > 0 Then sqlh.Parameters.AddWithValue("@CreatedBy", CreatedBy)
        If ModifyBy.Length > 0 Then sqlh.Parameters.AddWithValue("@modifyBy", ModifyBy)
        sqlh.Parameters.AddWithValue("@ApplicationID", ApplicationID)
        
        Dim ds As DataSet = sqlh.ReturnDataSetFromSproc("[dbo].[Web_InsertUpdateUserProfile]")
        Dim returnString As String = ""
        If Not IsNothing(ds) AndAlso ds.Tables.Count > 0 AndAlso ds.Tables(0).Rows.Count > 0 Then
            Dim dt As DataTable = ds.Tables(0)
            dt.TableName = "Profile"
            returnString = Helper.ConvertDataTableToJSON(dt)
        End If

        Return returnString

    End Function
    
    <WebMethod()> _
<ScriptMethod(ResponseFormat:=ResponseFormat.Json, UseHttpGet:=False)> _
    Public Function Web_Retrive_NoGameDates(ByVal ApplicationID As String) As String
        Dim sqlh As New SQLHelper("GolfDB", Data.CommandType.StoredProcedure)
        sqlh.Parameters.AddWithValue("@ApplicationID", ApplicationID)
        Dim ds As DataSet = sqlh.ReturnDataSetFromSproc("[dbo].[NoGameDates_CRUD]")
        
        Dim returnString As String = ""
        If Not IsNothing(ds) AndAlso ds.Tables.Count > 0 AndAlso ds.Tables(0).Rows.Count > 0 Then
            Dim dt As DataTable = ds.Tables(0)
            dt.TableName = "NoGameDates"
            returnString = Helper.ConvertDataTableToJSON(dt)
        End If
        Return returnString
    End Function
    

    
    <WebMethod()> _
 <ScriptMethod(ResponseFormat:=ResponseFormat.Json, UseHttpGet:=False)> _
    Public Function Web_Retrive_AddNoGameDates(ByVal NoGameDate As String, ByVal ApplicationID As String) As String
       
        Dim sqlh As New SQLHelper("GolfDB", Data.CommandType.StoredProcedure)
        sqlh.Parameters.AddWithValue("@Action", "insert")
        sqlh.Parameters.AddWithValue("@GameDate", NoGameDate)
        sqlh.Parameters.AddWithValue("@ApplicationID", ApplicationID)
        Dim ds As DataSet = sqlh.ReturnDataSetFromSproc("[dbo].[NoGameDates_CRUD]")
        Dim returnString As String = ""
        If Not IsNothing(ds) AndAlso ds.Tables.Count > 0 AndAlso ds.Tables(0).Rows.Count > 0 Then
            Dim dt As DataTable = ds.Tables(0)
            dt.TableName = "AddNoGameDate"
            returnString = Helper.ConvertDataTableToJSON(dt)
        End If

        Return returnString

    End Function
    
    

    
    <WebMethod()> _
 <ScriptMethod(ResponseFormat:=ResponseFormat.Json, UseHttpGet:=False)> _
    Public Function Web_Retrive_DeleteNoGameDates(ByVal ID As String, ByVal ApplicationID As String) As String
       
        Dim sqlh As New SQLHelper("GolfDB", Data.CommandType.StoredProcedure)
        sqlh.Parameters.AddWithValue("@Action", "delete")
        sqlh.Parameters.AddWithValue("@id", ID)
        sqlh.Parameters.AddWithValue("@ApplicationID", ApplicationID)
        Dim ds As DataSet = sqlh.ReturnDataSetFromSproc("[dbo].[NoGameDates_CRUD]")
        Dim returnString As String = ""
        If Not IsNothing(ds) AndAlso ds.Tables.Count > 0 AndAlso ds.Tables(0).Rows.Count > 0 Then
            Dim dt As DataTable = ds.Tables(0)
            dt.TableName = "DeleteNoGameDate"
            returnString = Helper.ConvertDataTableToJSON(dt)
        End If

        Return returnString

    End Function
    
    <WebMethod()> _
<ScriptMethod(ResponseFormat:=ResponseFormat.Json, UseHttpGet:=False)> _
    Public Function Web_Retrive_CreateNewGame(ByVal GameTitle As String, ByVal GameDate As String, ByVal GameTime As String, ByVal CreatedBy As String, ByVal ApplicationID As String) As String
       
        Dim sqlh As New SQLHelper("GolfDB", Data.CommandType.StoredProcedure)
        sqlh.Parameters.AddWithValue("@GameTitle", GameTitle)
        sqlh.Parameters.AddWithValue("@GameDate", GameDate)
        sqlh.Parameters.AddWithValue("@GameTime", GameTime)
        sqlh.Parameters.AddWithValue("@CreatedBy", CreatedBy)
        sqlh.Parameters.AddWithValue("@ApplicationID", ApplicationID)
        Dim ds As DataSet = sqlh.ReturnDataSetFromSproc("[dbo].[Web_Retrive_CreateNewGame]")
        Dim returnString As String = ""
        If Not IsNothing(ds) AndAlso ds.Tables.Count > 0 AndAlso ds.Tables(0).Rows.Count > 0 Then
            Dim dt As DataTable = ds.Tables(0)
            dt.TableName = "CreateNewGame"
            returnString = Helper.ConvertDataTableToJSON(dt)
        End If

        Return returnString

    End Function
    
    
    <WebMethod()> _
<ScriptMethod(ResponseFormat:=ResponseFormat.Json, UseHttpGet:=False)> _
    Public Function Web_RetriveGameInfo(ByVal ApplicationID As String, ByVal ShowOnlyFutureGames As Boolean) As String
       
        Dim sqlh As New SQLHelper("GolfDB", Data.CommandType.StoredProcedure)
        sqlh.Parameters.AddWithValue("@ApplicationID", ApplicationID)
        sqlh.Parameters.AddWithValue("@ShowOnlyFutureGames", ShowOnlyFutureGames)
        Dim ds As DataSet = sqlh.ReturnDataSetFromSproc("[dbo].[Retrieve_Games]")
        Dim returnString As String = ""
        If Not IsNothing(ds) AndAlso ds.Tables.Count > 0 AndAlso ds.Tables(0).Rows.Count > 0 Then
            Dim dt As DataTable = ds.Tables(0)
            dt.TableName = "GameInfo"
            returnString = Helper.ConvertDataTableToJSON(dt)
        End If

        Return returnString

    End Function

    
        
    <WebMethod()> _
<ScriptMethod(ResponseFormat:=ResponseFormat.Json, UseHttpGet:=False)> _
    Public Function Web_DeleteGame(ByVal Gameid As String) As String
       
        Dim sqlh As New SQLHelper("GolfDB", Data.CommandType.StoredProcedure)
        sqlh.Parameters.AddWithValue("@GameId", Gameid)
        Dim ds As DataSet = sqlh.ReturnDataSetFromSproc("[dbo].[Web_DeleteGame]")
        Dim returnString As String = ""
        If Not IsNothing(ds) AndAlso ds.Tables.Count > 0 AndAlso ds.Tables(0).Rows.Count > 0 Then
            Dim dt As DataTable = ds.Tables(0)
            dt.TableName = "DeleteGame"
            returnString = Helper.ConvertDataTableToJSON(dt)
        End If

        Return returnString

    End Function

           

    <WebMethod()> _
  <ScriptMethod(ResponseFormat:=ResponseFormat.Json, UseHttpGet:=False)> _
    Public Function Web_UpdateApplicationSettings(ByVal ApplicationID As String, ByVal Key As String, ByVal Value As String, ByVal UserName As String) As String
       
        Dim sqlh As New SQLHelper("GolfDB", Data.CommandType.StoredProcedure)
        sqlh.Parameters.AddWithValue("@ApplicationID", ApplicationID)
        sqlh.Parameters.AddWithValue("@Key", Key)
        sqlh.Parameters.AddWithValue("@value", Value)
        sqlh.Parameters.AddWithValue("@UserName", UserName)
        sqlh.Parameters.AddWithValue("@Action", "update")
        Dim ds As DataSet = sqlh.ReturnDataSetFromSproc("[dbo].[Web_ApplicationSetting_CRUD]")
        Dim returnString As String = ""
        If Not IsNothing(ds) AndAlso ds.Tables.Count > 0 AndAlso ds.Tables(0).Rows.Count > 0 Then
            Dim dt As DataTable = ds.Tables(0)
            dt.TableName = "ApplicationSettingsMessage"
            returnString = Helper.ConvertDataTableToJSON(dt)
        End If

        Return returnString

    End Function

    
    <WebMethod()> _
 <ScriptMethod(ResponseFormat:=ResponseFormat.Json, UseHttpGet:=False)> _
    Public Function Web_RetrieveApplicationSettings(ByVal ApplicationID As String, ByVal Key As String) As String
       
        Dim sqlh As New SQLHelper("GolfDB", Data.CommandType.StoredProcedure)
        sqlh.Parameters.AddWithValue("@ApplicationID", ApplicationID)
        If (Key.Length > 0) Then
            sqlh.Parameters.AddWithValue("@Key", Key)
            sqlh.Parameters.AddWithValue("@Action", "retrieve")
        Else
            sqlh.Parameters.AddWithValue("@Action", "retrieveall")
        End If
        
        Dim ds As DataSet = sqlh.ReturnDataSetFromSproc("[dbo].[Web_ApplicationSetting_CRUD]")
        Dim returnString As String = ""
        If Not IsNothing(ds) AndAlso ds.Tables.Count > 0 AndAlso ds.Tables(0).Rows.Count > 0 Then
            Dim dt As DataTable = ds.Tables(0)
            dt.TableName = "ApplicationSettings"
            returnString = Helper.ConvertDataTableToJSON(dt)
        End If

        Return returnString

    End Function

    <WebMethod()> _
     <ScriptMethod(ResponseFormat:=ResponseFormat.Json, UseHttpGet:=False)> _
    Public Function Web_ChangeUserPassword(ByVal Email As String, ByVal OldPassword As String, ByVal NewPassword As String, ByVal ApplicationID As String) As String
       
        Dim sqlh As New SQLHelper("GolfDB", Data.CommandType.StoredProcedure)
        sqlh.Parameters.AddWithValue("@Email", Email)
        sqlh.Parameters.AddWithValue("@OldPassword", OldPassword)
        sqlh.Parameters.AddWithValue("@NewPassword", NewPassword)
        sqlh.Parameters.AddWithValue("@ApplicationID", ApplicationID)
        Dim ds As DataSet = sqlh.ReturnDataSetFromSproc("[dbo].[Web_ChangeUserPassword]")
        Dim returnString As String = ""
        If Not IsNothing(ds) AndAlso ds.Tables.Count > 0 AndAlso ds.Tables(0).Rows.Count > 0 Then
            Dim dt As DataTable = ds.Tables(0)
            dt.TableName = "ChangePasswordResponse"
            returnString = Helper.ConvertDataTableToJSON(dt)
        End If

        Return returnString

    End Function
    
    <WebMethod()> _
    <ScriptMethod(ResponseFormat:=ResponseFormat.Json, UseHttpGet:=False)> _
    Public Function Web_ResetUserPassword(ByVal Email As String, ByVal ApplicationID As String) As String
       
        Dim sqlh As New SQLHelper("GolfDB", Data.CommandType.StoredProcedure)
        sqlh.Parameters.AddWithValue("@Email", Email)
        sqlh.Parameters.AddWithValue("@ApplicationID", ApplicationID)
        Dim ds As DataSet = sqlh.ReturnDataSetFromSproc("[dbo].[Web_ResetUserPassword]")
        Dim returnString As String = ""
        If Not IsNothing(ds) AndAlso ds.Tables.Count > 0 AndAlso ds.Tables(0).Rows.Count > 0 Then
            Dim dt As DataTable = ds.Tables(0)
            dt.TableName = "ResetPasswordResponse"
            returnString = Helper.ConvertDataTableToJSON(dt)
        End If

        Return returnString

    End Function

    
    <WebMethod()> _
<ScriptMethod(ResponseFormat:=ResponseFormat.Json, UseHttpGet:=False)> _
    Public Function Web_Retrive_PlayerInfo(ByVal PlayerID As String) As String
       
        Dim sqlh As New SQLHelper("GolfDB", Data.CommandType.StoredProcedure)
        sqlh.Parameters.AddWithValue("@PlayerID", PlayerID)
        Dim ds As DataSet = sqlh.ReturnDataSetFromSproc("[dbo].[Web_Retrive_PlayerInfo]")
        Dim returnString As String = ""
        If Not IsNothing(ds) AndAlso ds.Tables.Count > 0 AndAlso ds.Tables(0).Rows.Count > 0 Then
            Dim dt As DataTable = ds.Tables(0)
            dt.TableName = "PlyerInfo"
            returnString = Helper.ConvertDataTableToJSON(dt)
        End If

        Return returnString

    End Function

End Class

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    


