<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StaffLogin.aspx.cs" Inherits="StaffLogin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1 {
            width: 960px;
        }
        .style2 {
            width: 960px;
            height: 135px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <img class="style2" src="Image/FMS_banner.jpg" /><table class="style1">
        <tr>
            <td>
                Staff Id:</td>
            <td>
                <asp:TextBox ID="staffIdTextBox" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Password:</td>
            <td>
                <asp:TextBox ID="passwordTextBox" runat="server" TextMode="Password"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Button ID="loginButton" runat="server" onclick="loginButton_Click" 
                    Text="Login" />
            </td>
            
        </tr>
    </table>

    <asp:Label ID="messageLabel" runat="server" ForeColor="#FF3300"></asp:Label>
    </div>
    </form>
</body>
</html>
