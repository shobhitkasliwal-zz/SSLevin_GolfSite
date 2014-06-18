<%@ Page Language="VB" AutoEventWireup="false" CodeFile="viewer.aspx.vb" Inherits="viewer" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
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
                            <table width="100%" style="font-size: 12pt">
                                <tr>
                                    <td align="left" width="60%">
                                        <asp:LinkButton Enabled=false ID="LinkButton1" ForeColor=red runat="server" Font-Names="Arial" Font-Size="12px">Sort By Newest Picture</asp:LinkButton><font style="font-family: Arial" size=2>&nbsp;|&nbsp;</font><asp:LinkButton  ID="LinkButton2" ForeColor=red runat="server" Font-Names="Arial" Font-Size="12px">Sort by Image Dimension</asp:LinkButton></td>
                                    <td align="right">
                                       
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                     <tr>
                        <td>
                            <font size="2" face="Arial, Helvetica, sans-serif">
                                
                                                       
                               </font>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table width=100%> <tr>
                                    <td align=left nowrap><a href=Default.aspx style="font-family:Arial; font-size:12px;">Home</a>
                                        <asp:Label ID=lblFolder runat=server Visible=false />
                                    </td>
                               
                                    <td align=center width=80%><div align=center><font face=arial size=2 color="#990000"><b>Click on image to enlarge</b> <font color=black>(<asp:Label ID="lblRecordCount" Visible="true" runat="server" /> Images)</font></font></div></td>
                                   
                                    <td nowrap align=right> 
                                    <div align=center><font face=arial size=2><asp:Label ID="lblCurrentIndex" Visible="false" Text="0" runat="server" /><%=ctype(lblCurrentIndex.Text, Integer) + 1 %> to <%=CType(lblCurrentIndex.Text, Integer) + 20%><asp:Label ID="lblPageSize" Visible="false" Text="19" runat="server" /></font>
                                    </div>
                                    <a id="A1" style="font-family: Arial; font-size: small" onserverclick="ShowFirstPage"
                                            runat="server">First</a> &nbsp;|&nbsp; <a id="A2" style="font-family: Arial; font-size: small"
                                                onserverclick="ShowPreviousPage" runat="server">Previous</a> &nbsp;|&nbsp;
                                        <a id="A3" style="font-family: Arial; font-size: small" onserverclick="ShowNextPage"
                                            runat="server">Next</a> &nbsp;|&nbsp; <a id="A4" style="font-family: Arial; font-size: small"
                                                onserverclick="ShowLastPage" runat="server">Last</a></td>
                                </tr>
                            </table>
                        
                       </td>
                    </tr>
                    <tr>
                        <td align="center"> 
                            <asp:DataList Visible="true" RepeatColumns="4" RepeatDirection=horizontal ID="DataList1" runat="server" Width="80%">
                                <ItemTemplate>
                                    <table border=0 cellpadding=0 cellpadding=0>
                                        <tr><td colspan=2><img src=spacer.gif height=1 width=210 /></td></tr>
                                        <tr>
                                            <td height=250><img src=spacer.gif height=250 width=1 /></td>
                                            <td valign=middle align=center height=250 width=210 background='<%#iif(EVAL("height")>180, "bg_tall.jpg" ,"bg_wide.jpg")%>'>
                                                                                                    <a href='<%=lblfolder.text%><%# Databinder.eval(Container.DataItem, "Name")%>'>
                                                  <%If Request.QueryString("folder") <> "Movies" Then%>
                                                    <img src='<%=lblfolder.text%>thumbs/<%# Databinder.eval(Container.DataItem, "Name")%>' border="0" />
                                                  <%Else%>
                                                    <img src='SimonPics/Movies.jpg' border="0" />
                                                  <%end If%>
                                                  </a>
                                                  
                                            </td>
                                        </tr>
                                        <tr><td></td><td align=center><font face=arial size=1><%#EVAL("NAME") %></font><br /></td></tr>
                                    </table> 
                                </ItemTemplate>
                            </asp:DataList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table width="100%">
                                <tr>
                                    <td align="left" width="60%">
                                        <asp:Label ID="lblCounts" runat="server" CssClass="plaintable" />
                                        <asp:Label ID="Label1" runat="server" Font-Names="arial" />
                                        <asp:Label ID="lblSort" runat="server" Text="Height DESC, Date DESC" Visible="False"></asp:Label></td>
                                    <td align="right">
                                        <a style="font-family: Arial; font-size: small" id="First" onserverclick="ShowFirstPage"
                                            runat="server">First</a> &nbsp;|&nbsp; <a style="font-family: Arial; font-size: small"
                                                id="Previous" onserverclick="ShowPreviousPage" runat="server">Previous</a>
                                        &nbsp;|&nbsp; <a style="font-family: Arial; font-size: small" id="aNext" onserverclick="ShowNextPage"
                                            runat="server">Next</a> &nbsp;|&nbsp; <a style="font-family: Arial; font-size: small"
                                                id="Last" onserverclick="ShowLastPage" runat="server">Last</a>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                   
                </table>
        </div>
    </form>
</body>
</html>
