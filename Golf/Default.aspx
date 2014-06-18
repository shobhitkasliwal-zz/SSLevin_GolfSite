<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Debug="true"
    Inherits="Golf_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Online Golf Reservations</title>
    <style>
        body{font-size:12px;font-family:Arial, Helvetica, sans-serif;   }
    </style>

    <script language="javascript">
        function checkAll() {
         for (i = 0; i < document.all.length; i++)
            if (document.all[i].type=='checkbox')
                document.all[i].checked=true;
        }
        function UNcheckAll() {
         for (i = 0; i < document.all.length; i++)
            if (document.all[i].type=='checkbox')
                document.all[i].checked=false;
        }
    </script>

</head>
<body style="margin: 0px">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" EnablePartialRendering="true" />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div align="center">
                    <table width="750px" border="0">
                        <tr>
                            <td colspan="2">
                                <table align="left" style="border-bottom: solid 1px black; border-top: solid 1px black;
                                    border-left: solid 1px black; border-right: solid 1px black;" width="100%">
                                    <tr>
                                        <td style="height: 135px">
                                            <img border="1" src="../Golf/tiger.jpg" style="width: 221px; height: 147px" /></td>
                                        <td background="header.jpg" style="background-position: right; background-repeat: no-repeat;"
                                            align="center" width="100%">
                                            <strong>Golf RSVP<br />
                                            </strong>Questions, email <a href="mailto:Stuart@levinlevy.com">Stuart@levinlevy.com</a></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" align="Left">
                                <table style="border: solid 1px black;">
                                    <tr>
                                        <td align="center" bgcolor="#008000" style="color: White; font-weight: bold;">
                                            Calendar of Games</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Gamedays highlighted in <font color="#008000"><b>Green</b></font></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#999999"
                                                CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt"
                                                ForeColor="Black" Height="227px" Width="300px">
                                                <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                                                <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                                                <SelectorStyle BackColor="#CCCCCC" />
                                                <WeekendDayStyle BackColor="#FFFFCC" />
                                                <OtherMonthDayStyle ForeColor="Gray" />
                                                <NextPrevStyle VerticalAlign="Bottom" />
                                                <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                                                <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                                            </asp:Calendar>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <asp:LinkButton Style="color: blue" Font-Bold="true" ID="lnkRSVP" runat="server"
                                                Visible="false">RSVP for this game</asp:LinkButton>
                                            <asp:LinkButton Style="color: blue" Font-Bold="true" ID="lnkPropose" Visible="false"
                                                runat="server">Propose game for this day</asp:LinkButton>
                                            <asp:Literal ID=litNoAccess runat=server />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <table id="tableEmail" runat="server" visible="false" cellpadding="5">
                                                <tr>
                                                    <td colspan="2" align="center">
                                                        <b>Your Response</b>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" valign="top">
                                                        <b>In or Out?</b></td>
                                                    <td align="left">
                                                        <asp:RadioButtonList ID="rdoResponse" runat="server">
                                                            <asp:ListItem Selected="True" Text="I'm Playing" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="I'm NOT Playing" Value="0"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left">
                                                        <b>Email Address</b></td>
                                                    <td align="left">
                                                        <asp:TextBox ID="txtEmail" runat="server" /></td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    </td>
                                                    <td align="left">
                                                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" /></td>
                                                </tr>
                                                <tr>
                                                    <td align="left">
                                                    </td>
                                                    <td align="left">
                                                    </td>
                                                </tr>
                                            </table>
                                            <table id="tableClosed" width="300" runat="server" visible="false" cellpadding="5">
                                                <tr>
                                                    <td align="center">
                                                        <b><font color="red">Game Closed!</font></b>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" valign="top">
                                                        I'm sorry, this game has been closed already and all RSVP's have been sent to the
                                                        club. Please contact the club directly.
                                                    </td>
                                                </tr>
                                            </table>
                                            <table id="tableProposal" runat="server" visible="false" cellpadding="5">
                                                <tr>
                                                    <td colspan="2" align="center">
                                                        <b>Game Proposal</b></td>
                                                </tr>
                                                <tr>
                                                    <td align="left">
                                                        <b>Proposed Date</b></td>
                                                    <td align="left">
                                                        &nbsp;<asp:Label ID="lblPDate" runat="server" Text="Label"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td align="left">
                                                        <b>Proposed Time</b></td>
                                                    <td align="left">
                                                        <asp:DropDownList ID="ddONE" runat="server">
                                                            <asp:ListItem>1</asp:ListItem>
                                                            <asp:ListItem>2</asp:ListItem>
                                                            <asp:ListItem>3</asp:ListItem>
                                                            <asp:ListItem>4</asp:ListItem>
                                                            <asp:ListItem>5</asp:ListItem>
                                                            <asp:ListItem>6</asp:ListItem>
                                                            <asp:ListItem>7</asp:ListItem>
                                                            <asp:ListItem Selected="True">8</asp:ListItem>
                                                            <asp:ListItem>9</asp:ListItem>
                                                            <asp:ListItem>10</asp:ListItem>
                                                            <asp:ListItem>11</asp:ListItem>
                                                            <asp:ListItem>12</asp:ListItem>
                                                        </asp:DropDownList>:
                                                        <asp:DropDownList ID="ddTWO" runat="server">
                                                            <asp:ListItem>00</asp:ListItem>
                                                            <asp:ListItem>15</asp:ListItem>
                                                            <asp:ListItem Selected="True">30</asp:ListItem>
                                                            <asp:ListItem>45</asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:DropDownList ID="ddTHREE" runat="server">
                                                            <asp:ListItem Selected="True">AM</asp:ListItem>
                                                            <asp:ListItem>PM</asp:ListItem>
                                                        </asp:DropDownList></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" align="left">
                                                        <strong>Select Players</strong>&nbsp;[<a onclick="checkAll();" href="#">Check All</a>]
                                                        | [<a onclick="UNcheckAll()" href="#">UnCheck All</a>]
                                                        <br />
                                                        <asp:CheckBoxList RepeatColumns="2" ID="CheckBoxList1" runat="server" DataSourceID="SqlDataSource3"
                                                            DataTextField="FullName" DataValueField="ID">
                                                        </asp:CheckBoxList></td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    </td>
                                                    <td align="left">
                                                        <asp:Button ID="Button1" runat="server" Text="Submit" /></td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    </td>
                                                    <td>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <asp:Label ID="lblMessage" runat="server" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td valign="top" align="right">
                                <div align="left" style="padding-left: 10px;">
                                    <table style="border: solid 1px black;" id="tbGameInfo" runat="server" visible="false">
                                        <tr>
                                            <td align="center" bgcolor="#008000" style="color: White; font-weight: bold;" colspan="2">
                                                Game Info</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <table>
                                                    <tr>
                                                        <td width="75">
                                                            <b>Game Date:</b></td>
                                                        <td>
                                                            <asp:Label ID="GV1_GameDate" runat="server" /></td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <b>Game Time:</b></td>
                                                        <td>
                                                            <asp:Label ID="GV1_GameTime" runat="server" /></td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <b># Of Players:</b></td>
                                                        <td>
                                                            <asp:Label ID="GV1_NumOfPlayers" runat="server" /></td>
                                                    </tr>
                                                </table>
                                                </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <asp:GridView AutoGenerateColumns="False" ID="GridView1" runat="server" DataSourceID="SqlDataSource1"
                                                    CellPadding="4" AllowSorting="true" ForeColor="#333333" GridLines="None">
                                                    <Columns>
                                                        <asp:BoundField SortExpression="FullName" DataField="FullName" HeaderText="Name" />
                                                        <asp:BoundField SortExpression="EmailAddress" DataField="EmailAddress" HeaderText="Email Address" />
                                                        <asp:TemplateField HeaderText="Playing?" SortExpression="IsPlaying">
                                                            <ItemTemplate>
                                                                <%#IIf(Eval("IsPlaying") Is DBNull.Value, "Not Yet Responded", IIf(CType(Eval("IsPlaying").ToString, String) = "True", "Yes", "No"))%>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                                    <RowStyle BackColor="#E3EAEB" />
                                                    <EditRowStyle BackColor="#7C6F57" />
                                                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                                    <AlternatingRowStyle BackColor="White" />
                                                </asp:GridView>
                                            </td>
                                        </tr>
                                    </table>
                                
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" colspan="2" align="left">
                                <!--PLAYERS-->
                                <ajaxToolkit:CollapsiblePanelExtender ID="cpeDemo" runat="Server" TargetControlID="pnl_Grid"
                                    ExpandControlID="pnl_Header" CollapseControlID="pnl_Header" Collapsed="True"
                                    TextLabelID="lblViewhistory" ImageControlID="Image1" ExpandedImage="~/images/ajax/collapse_blue.jpg"
                                    CollapsedImage="~/images/ajax/expand_blue.jpg" ExpandedText="Collapse" CollapsedText="Expand"
                                    SuppressPostBack="true" />
                                <asp:Panel ID="pnl_Header" runat="server" Style="border: solid 1px black; height: 25px;"
                                    Width="306">
                                    <div style="padding: 5px; cursor: pointer; vertical-align: middle;">
                                        <div style="float: left;">
                                            <b>View Registered Players</b></div>
                                        <div style="float: right; vertical-align: middle;">
                                            <asp:Label ID="lblViewhistory" runat="server"></asp:Label>&nbsp;<asp:ImageButton
                                                ImageAlign="absMiddle" ID="Image1" runat="server" ImageUrl="~/images/ajax/expand_blue.jpg"
                                                AlternateText="(View History...)" />
                                        </div>
                                    </div>
                                </asp:Panel>
                                <asp:Panel ID="pnl_Grid" runat="server">
                                    <table>
                                        <tr id="tredit" runat="server">
                                            <td colspan="2" valign="top" align="left">
                                                <a href="#" onclick="document.all['tblPassword'].style.display = 'block';">Edit Player
                                                    Data</a>
                                                <table style="display: none;" id="tblPassword">
                                                    <tr>
                                                        <td>
                                                        </td>
                                                        <td>
                                                        </td>
                                                        <td>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <b>Password</b></td>
                                                        <td>
                                                            <asp:TextBox TextMode="password" runat="server" ID="txtpassword" /></td>
                                                        <td>
                                                            <asp:LinkButton runat="server" ID="lnkPassword" Text="Submit" /></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" valign="top">
                                                <asp:GridView ID="GridView2" Caption="<b>Players</b>" runat="server" AllowPaging="True"
                                                    AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666"
                                                    BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSource4"
                                                    PageSize="30" GridLines="Horizontal" Width="450px">
                                                    <FooterStyle BackColor="White" ForeColor="#333333" />
                                                    <Columns>
                                                        <asp:CommandField ControlStyle-ForeColor="red" ShowDeleteButton="true" />
                                                        <asp:CommandField ShowEditButton="true" />
                                                        <asp:CommandField ShowSelectButton="True" Visible="false" />
                                                        <asp:BoundField Visible="false" DataField="ID" HeaderText="ID" InsertVisible="False"
                                                            ReadOnly="True" SortExpression="ID" />
                                                        <asp:BoundField DataField="FullName" ItemStyle-Wrap="false" HeaderText="Full Name"
                                                            SortExpression="FullName" />
                                                        <asp:BoundField DataField="EmailAddress" HeaderText="Email Address" SortExpression="EmailAddress" />
                                                        <asp:CheckBoxField DataField="WednesdayGame" HeaderText="Wednesdays" SortExpression="WednesdayGame" />
                                                        <asp:CheckBoxField DataField="FridayGame" HeaderText="Fridays" SortExpression="FridayGame" />
                                                        <asp:CheckBoxField DataField="SaturDayGame" HeaderText="Saturdays" SortExpression="SaturDayGame" />
                                                        <asp:CheckBoxField DataField="SundayGame" HeaderText="Sundays" SortExpression="SundayGame" />
                                                    </Columns>
                                                    <RowStyle BackColor="White" ForeColor="#333333" HorizontalAlign="left" />
                                                    <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                                                    <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                                                    <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                                                </asp:GridView>
                                            </td>
                                        </tr>
                                        <tr id="trAdd" visible="false" runat="server">
                                            <td colspan="2" valign="top">
                                                <table style="display: block;" id="Table1">
                                                    <tr>
                                                        <td colspan="3">
                                                            <br />
                                                            <asp:Label ID="lblmsg1" runat="server" ForeColor="red" />
                                                            <b>Add New Player</b>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <b>Full Name</b></td>
                                                        <td>
                                                            <asp:TextBox runat="server" ID="txtFullName" /></td>
                                                        <td>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <b>Email</b></td>
                                                        <td>
                                                            <asp:TextBox runat="server" ID="txtEmailaddress" /></td>
                                                        <td>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                        </td>
                                                        <td colspan="2">
                                                            <asp:Button ID="btnAddEmail" runat="server" Text="Submit" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                                <!--END PLAYERS-->
                            </td>
                        </tr>
                    </table>
                </div>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBPoker %>"
                    SelectCommand="SELECT [FullName], [EmailAddress], [IsPlaying], [GameDate] FROM [vw_Golf_Responses] 
            WHERE Month([GameDate]) = Month(@GameDate)
                and day([GameDate]) = day(@GameDate)
                and year([GameDate]) = year(@GameDate)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Calendar1" Name="GameDate" PropertyName="SelectedDate"
                            Type="DateTime" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DBPoker %>"
                    SelectCommand="SELECT distinct [GameDate] FROM [GOLF_Games]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DBPoker %>"
                    SelectCommand="SELECT [ID], [FullName], [EmailAddress] FROM [GOLF_Players]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:DBPoker %>"
                    DeleteCommand="DELETE FROM [GOLF_Players] WHERE [ID] = @ID" InsertCommand="INSERT INTO [GOLF_Players] ([FullName], [EmailAddress]) VALUES (@FullName, @EmailAddress)"
                    SelectCommand="SELECT [ID], [FullName], [EmailAddress], WednesdayGame, FridayGame, SaturDayGame, SundayGame, Enable FROM [GOLF_Players]"
                    UpdateCommand="UPDATE [GOLF_Players] SET [FullName] = @FullName, [EmailAddress] = @EmailAddress,
                    WednesdayGame=convert(bit,@WednesdayGame),
                    FridayGame=convert(bit,@FridayGame),
                    SaturdayGame=convert(bit,@SaturdayGame),
                    SundayGame=convert(bit,@SundayGame)
                     WHERE [ID] = @ID">
                    <DeleteParameters>
                        <asp:Parameter Name="ID" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="FullName" Type="String" />
                        <asp:Parameter Name="EmailAddress" Type="String" />
                        <asp:Parameter Name="ID" Type="Int32" />
                        <asp:Parameter Name="WednesdayGame" Type="boolean" />
                        <asp:Parameter Name="FridayGame" Type="boolean" />
                        <asp:Parameter Name="SaturdayGame" Type="boolean" />
                        <asp:Parameter Name="SundayGame" Type="boolean" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="FullName" Type="String" />
                        <asp:Parameter Name="EmailAddress" Type="String" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
