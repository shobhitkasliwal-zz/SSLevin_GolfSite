Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlTypes
Imports System.Configuration
Imports System.Collections
Imports System.Web
Imports System.Web.UI.WebControls
Imports System.Web.UI.HtmlControls
Imports Microsoft.VisualBasic



Public Class SQLHelper
#Region " FIELDS "
    Private connection As SqlConnection
    Private command As SqlCommand
    Private myTrans As SqlTransaction
#End Region

    Public ReadOnly Property Parameters() As SqlParameterCollection
        Get
            Return command.Parameters
        End Get
    End Property

    Public Sub New(Optional ByVal cmdType As CommandType = CommandType.StoredProcedure)
        Dim objReader As New AppSettingsReader()
        Dim connString As String

        Try
            connString = ConfigurationManager.ConnectionStrings("DBPoker").ConnectionString.ToString 'objReader.GetValue("SG_DBConnectionString", GetType(System.String))          

        Catch
            connString = ""
        End Try

        connection = New SqlConnection(connString)
        command = New SqlCommand()
        command.CommandType = cmdType 'CommandType.StoredProcedure

    End Sub

    Public Sub New(ByVal connectionStringConfigName As String, Optional ByVal cmdType As CommandType = CommandType.StoredProcedure)
        Dim objReader As New AppSettingsReader()
        Dim connString As String

        Try
            connString = ConfigurationManager.ConnectionStrings(connectionStringConfigName).ConnectionString.ToString 'objReader.GetValue("SG_DBConnectionString", GetType(System.String))          

        Catch
            connString = ""
        End Try

        connection = New SqlConnection(connString)
        command = New SqlCommand()
        command.CommandType = cmdType 'CommandType.StoredProcedure

    End Sub

    Public Sub ExecuteText(ByVal strSQL As String)


        command.CommandText = strSQL

        Try
            If connection.State <> ConnectionState.Open Then
                connection.Open()
            End If

            command.Connection = connection
            myTrans = connection.BeginTransaction()
            command.Transaction = myTrans

            Dim result As Integer = command.ExecuteNonQuery()

            myTrans.Commit()
        Catch ex As Exception
            myTrans.Rollback()
            Throw ex
        End Try

    End Sub

    Public Function ExecuteTextScalar(ByVal strSQL As String) As Integer
        command.CommandText = strSQL

        Try
            If connection.State <> ConnectionState.Open Then
                connection.Open()
            End If

            command.Connection = connection
            myTrans = connection.BeginTransaction()
            command.Transaction = myTrans
            Dim result As Integer = command.ExecuteScalar()
            myTrans.Commit()
            Return result
        Catch ex As Exception
            myTrans.Rollback()
            Throw ex
        End Try

    End Function



    Public Function ExecuteStoredProcedure(ByVal procedureName As String) As SqlParameterCollection
        If command.Parameters.Count < 1 Then
            'error
        End If

        command.CommandText = procedureName

        Try
            If connection.State <> ConnectionState.Open Then
                connection.Open()
            End If

            command.Connection = connection
            myTrans = connection.BeginTransaction()
            command.Transaction = myTrans

            Dim result As Integer = command.ExecuteNonQuery()

            myTrans.Commit()
            Kill()
        Catch ex As Exception
            myTrans.Rollback()
            Kill()
            Throw ex
        End Try

        Return command.Parameters

    End Function

    Public Function ReturnDataReaderFromSproc(ByVal procedureName As String) As SqlDataReader
        command.CommandText = procedureName
        Dim objSqlDataReader As SqlDataReader

        Try
            If connection.State <> ConnectionState.Open Then
                connection.Open()
            End If

            command.Connection = connection
            objSqlDataReader = command.ExecuteReader()
        Catch ex As Exception
            Throw ex
        End Try

        Return objSqlDataReader

    End Function

    Public Function ReturnDataSetFromSproc(ByVal procedureName As String, Optional ByVal dsTableName As String = "table1") As DataSet
        command.CommandText = procedureName
        Dim objDataAdapter As SqlDataAdapter
        Dim objDataSet As New DataSet()

        Try
            If connection.State <> ConnectionState.Open Then
                connection.Open()
            End If

            command.Connection = connection

            objDataAdapter = New SqlDataAdapter(command)
            objDataAdapter.Fill(objDataSet, dsTableName)
            Kill()
            Return objDataSet

        Catch ex As Exception
            Kill()
            Throw ex
        End Try
    End Function

    Public Function ReturnDataSetFromText(ByVal sqlString As String, Optional ByVal dsTableName As String = "table1") As DataSet
        command.CommandText = sqlString
        command.CommandType = CommandType.Text
        Dim objDataAdapter As SqlDataAdapter
        Dim objDataSet As New DataSet()

        Try
            If connection.State <> ConnectionState.Open Then
                connection.Open()
            End If

            command.Connection = connection

            objDataAdapter = New SqlDataAdapter(command)
            objDataAdapter.Fill(objDataSet, dsTableName)
            Kill()
            Return objDataSet

        Catch ex As Exception
            Kill()
            Throw ex
        End Try
    End Function

    Public Sub Kill()
        connection.Close()
        command.Dispose()

    End Sub
End Class