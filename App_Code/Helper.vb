Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Text
Imports System.Collections.Generic


Public Class Helper

    Public Shared Function ConvertDataTableToJSON(dt As DataTable) As String
        Dim serializer As New System.Web.Script.Serialization.JavaScriptSerializer()
        Dim rows As New List(Of Dictionary(Of String, Object))()
        Dim row As Dictionary(Of String, Object) = Nothing

        For Each dr As DataRow In dt.Rows
            row = New Dictionary(Of String, Object)()
            For Each col As DataColumn In dt.Columns
                row.Add(col.ColumnName, dr(col))
            Next
            rows.Add(row)
        Next
        Return serializer.Serialize(rows)



    End Function


    Public Shared Function ConvertDataSetToJSON(ds As DataSet) As String
        Dim dict As New Dictionary(Of String, Object)
        For Each dt As DataTable In ds.Tables
            Dim arr(dt.Rows.Count - 1) As Object
            For i As Int64 = 0 To dt.Rows.Count - 1
                arr(i) = dt.Rows(i).ItemArray
            Next
            dict.Add(dt.TableName, arr)
        Next
        Dim serializer As New System.Web.Script.Serialization.JavaScriptSerializer()

        Return serializer.Serialize(dict)
    End Function

End Class
