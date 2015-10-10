<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="user_login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>登录</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="margin:auto;">
            <tr>
                <td>用户名：</td>
                <td><asp:TextBox ID="UserName" runat="server"></asp:TextBox></td>
                <td><asp:Label runat="server" Text="*" ForeColor="Red"/><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="请输入用户名" ControlToValidate="UserName" SetFocusOnError="True"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>密码：</td>
                <td><asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox></td>
                <td><asp:Label  runat="server" Text="*" ForeColor="Red"/><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="请输入密码" ControlToValidate="Password" SetFocusOnError="True"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td><asp:CheckBox ID="Remember" runat="server" Text="自动登录"/></td>
            </tr>
            <tr>
                <td><asp:Button ID="Login" runat="server" Text="登录" OnClick="Login_Click" /></td>
                <td><asp:HyperLink ID="Register" runat="server" Text="还没有帐号，立即注册" NavigateUrl="~/user/register.aspx"></asp:HyperLink></td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
