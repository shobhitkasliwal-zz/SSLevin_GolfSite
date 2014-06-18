<%@ Page Title="" Language="C#" MasterPageFile="~/Golf/Administration/Site.master" AutoEventWireup="true" CodeFile="AdminLogin.aspx.cs" Inherits="Golf_Administration_AdminLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="min-height: 500px; margin-top: 50px;">
        <fieldset style="margin: 0 auto; width: 380px; padding: 20px; border: 1px solid #3D800C;">
            <legend>Admin Login</legend>
            <table>
                <tr>
                    <td style="padding: 15px;"><b>Email Address:</b></td>
                    <td style="padding: 15px;">

                        <asp:TextBox runat="server" Style="width: 180px; height: 10px;" ID="txtEditProfileEmail" />
                    </td>
                </tr>
                <tr>
                    <td style="padding: 15px;"><b>Password:</b></td>
                    <td style="padding: 15px;">
                        <asp:TextBox runat="server" TextMode="Password" Style="width: 180px; height: 10px;" ID="txtEditProfilePassword" /></td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center; padding: 15px;">
                        <asp:LinkButton ID="lnkSubmit" runat="server" OnClick="lnkSubmit_Click" CssClass="-button green" Text="Submit">
                
                        </asp:LinkButton>
                        <asp:Button ID="btnLogin" style="display:none;" runat="server" OnClick="btnLogin_Click" />

                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red"></asp:Label>
                    </td>

                </tr>
            </table>
        </fieldset>
    </div>
    <script type="text/javascript">
       

        function BindJquery()
        {
            $("input").bind("keydown", function (event) {
                // track enter key
                var keycode = (event.keyCode ? event.keyCode : (event.which ? event.which : event.charCode));
                if (keycode == 13) { // keycode for enter key
                    // force the 'Enter Key' to implicitly click the Update button

                    $('#<%= btnLogin.ClientID %>').click();
                   
                } 
             }); // end of function
        }


    </script>
</asp:Content>

