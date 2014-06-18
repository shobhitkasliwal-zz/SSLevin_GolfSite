<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Home.aspx.vb" Inherits="Home" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>The Levin Babies</title>
    <style type="text/css">
<!--

.SimonText
{
 font-family:arial;
 font-size:10pt;
font-weight:bold;
}
.MaliniText
{
 font-family:arial;
 font-size:10pt;
 font-weight:bold;

}

.SimonimgOff
{
/*bgcolor="#E4E4E4";*/
background-color:#3399FF;
border: solid 1px black;

}
.SimonimgOn
{
/*bgcolor="#DCF5F2";*/
background-color:#DCF5F2;
border: solid 1px black;
}

.MaliniimgOff
{
/*bgcolor="#E4E4E4";*/
background-color:#EBBAC1;
border: solid 1px black;

}
.MaliniimgOn
{
/*bgcolor="#DCF5F2";*/
background-color:#DCF5F2;
border: solid 1px black;
}

--></style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        <br />
        <br />
        <div align=center style="font-family:Verdana; font-size:14px; font-weight:bold;">The Levin Babies</div>
        <div align=center style="font-family:Verdana; font-size:12px; font-style:italic;">By Deneese &amp; Matt</div>
        <br />
        <br />
        <br />
            <p align="center">
                <table width="750" border="0">
                    <tr>
                        <td>
                            <tablewidth="100%">
                                <tr>
                                    <td onclick="Javascript:location.href='Default.aspx?name=simon'" valign="middle" height=300 width=375 align="center" onmouseout="this.className='SimonimgOff'" onmouseover="this.className='SimonimgOn'" class="SimonimgOff" >
                                       <div class=SimonText align=center>
                                        <br />
                                        Simon Singh Levin
                                        <br />
                                        <br />
                                       </div><a href="Default.aspx?name=simon">
                                       <img src="SimonHome.jpg" border="0" /></a>
                                       <div align=center>
                                        <br />
                                        Click to view photos
                                        <br />
                                        <br />
                                       </div>
                                    </td>
                                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                    <td onclick="Javascript:location.href='Default.aspx?name=malini'" valign="middle" height=300 width=375 align="center" onmouseout="this.className='MaliniimgOff'" onmouseover="this.className='MaliniimgOn'" class="MaliniimgOff" >
                                        <div class=MaliniText align=center>
                                        <br />
                                        Malini Singh Levin
                                        <br />
                                        <br />
                                       </div>
                                       <a href="Default.aspx?name=malini">
                                        <img src="MaliniHome.jpg" border="0" /></a>
                                        <div align=center>
                                        <br />
                                        Click to view photos
                                        <br />
                                        <br />
                                       </div>
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
