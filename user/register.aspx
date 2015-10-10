<%@ Page Language="C#" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="user_register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>注册</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="margin:auto;">
            <tr>
                <td>用户名：</td>
                <td><asp:TextBox ID="UserName" runat="server"></asp:TextBox></td>
                <td><asp:Label runat="server" Text="*" ForeColor="Red"/><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="用户名不能为空" SetFocusOnError="True" ControlToValidate="UserName"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>昵称：</td>
                <td><asp:TextBox ID="NickName" runat="server"></asp:TextBox></td>
                <td><asp:Label runat="server" Text="*" ForeColor="Red"/><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="昵称不能为空" ControlToValidate="NickName" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>密码：</td>
                <td><asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox></td>
                <td><asp:Label runat="server" Text="*" ForeColor="Red"/><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="密码不能为空" ControlToValidate="Password" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>确认密码：</td>
                <td><asp:TextBox ID="PsdAgain" runat="server" TextMode="Password"></asp:TextBox></td>
                <td><asp:Label runat="server" Text="*" ForeColor="Red"/>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="Password" ControlToValidate="PsdAgain" ErrorMessage="两次输入密码不一致"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td>Email：</td>
                <td><asp:TextBox ID="Email" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Button ID="Submit" runat="server" Text="提交" OnClick="Submit_Click" /></td>
                <td><asp:HyperLink ID="Login" runat="server" Text="已有帐号，立即登录" NavigateUrl="~/user/login.aspx"></asp:HyperLink></td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
