<%@ Page Language="VB" Debug="True" AutoEventWireup="false" CodeFile="Default.aspx.vb"  Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>The Levin Babies</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

      
            <p align="left">
                <table width="100%" border="0">
                    <tr>
                        <td>
                            <table id=tblSimon runat=server width=100% bgcolor="#3399ff">
                                <tr>
                                    <td align=center width=80%>
                                        <font color=white size="2" face="Arial, Helvetica, sans-serif"><strong>Simon Singh Levin</strong></font><br />
                                        <font color=white size="2" face="Arial, Helvetica, sans-serif">Born on January 27, 2006 at 3:07am
                                            at Northwestern Memorial Hospital in Chicago.<br />
                                        </font><font color=white size="2" face="Arial, Helvetica, sans-serif">He was 20 inches tall and
                                            weighed 8 pounds and 13 ounces.&nbsp;</font>
                                    </td>
                                    <td>
                                        <img src="simon.jpg" />
                                    </td>
                                </tr>
                            </table>
                            <table id=tblMalini runat=server width=100% bgcolor="#EBBAC1">
                                <tr>
                                    <td align=center width=80%>
                                        <font color=white size="2" face="Arial, Helvetica, sans-serif"><strong>Malini Singh Levin</strong></font><br />
                                        <font color=white size="2" face="Arial, Helvetica, sans-serif">Born on August 22, 2007 at 11:30am
                                            at Northwestern Memorial Hospital in Chicago.<br />
                                        </font><font color=white size="2" face="Arial, Helvetica, sans-serif">She weighed 7 pounds and 12 ounces.&nbsp;</font>
                                    </td>
                                    <td>
                                        <img src="Malini.jpg" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                            
                    <tr>
                        <td align="center"> 
                            <asp:DataList RepeatDirection=horizontal Caption="<font size=2 face=arial><b>Click an image to view gallery</b></font>" Visible="true" RepeatColumns="4" ID="DataList1" runat="server" Width="80%">
                                <ItemTemplate>
                                    <table border=0 cellpadding=0 cellpadding=0>
                                        <tr><td colspan=2><img src=spacer.gif height=1 width=210 /></td></tr>
                                        <tr>
                                            <td height=250><img src=spacer.gif height=250 width=1 /></td>
                                            <td valign=middle align=center height=250 width=210 background='bg_wide.jpg'>
                                            <a href='viewer.aspx?name=<%=Request.QueryString("name") %>&folder=<%#EVAL("Name")%>'><img src='<%=Request.QueryString("name") %>pics/<%#EVAL("Name")%>.jpg' border="0" /></a>&nbsp;</td>
                                        </tr>
                                        <tr><td></td><td align=center><font color="red"><%#EVAL("IsNew") %></font><font face=arial size=1><%#EVAL("NAME") %></font><br />
                                        <br />
                                        </td></tr>
                                    </table> 
                                </ItemTemplate>
                            </asp:DataList>
                        </td>
                    </tr>
                     
                   
                </table>
        </div>
    </form>
</body>
</html>
