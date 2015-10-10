<%@ Page Language="C#" AutoEventWireup="true" CodeFile="center.aspx.cs" Inherits="user_center" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>用户中心</title>
</head>
<body>
    <form id="form1" runat="server">
        <uc2:userinfo runat="server" ID="userinfo" />
    <div>
    <table style="margin:auto;">
        <tr>
            <td>昵称：</td>
            <td><asp:Label ID="NickName" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td>头像：</td>
            <td><asp:Image ID="Face" runat="server" /></td>
        </tr>
        <tr>
            <td></td>
            <td><asp:TextBox ID="FaceUrl" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>性别：</td>
            <td><asp:DropDownList ID="Sex" runat="server">
                <asp:ListItem Value="0">保密</asp:ListItem>
                <asp:ListItem Value="1">男</asp:ListItem>
                <asp:ListItem Value="2">女</asp:ListItem>
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td>电子邮箱：</td>
            <td>
                <asp:TextBox ID="Email" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>QQ号：</td>
            <td>
                <asp:TextBox ID="QQ" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>手机号：</td>
            <td>
                <asp:TextBox ID="PhoneNumber" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>生日：</td>
            <td>
                <asp:TextBox ID="Birthday" runat="server" ></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>节操：</td>
            <td>
                <asp:Label ID="Point" runat="server" ></asp:Label>
            </td>
        </tr>
        <tr>
            <td>灵符：</td>
            <td>
                <asp:Label ID="Money" runat="server" ></asp:Label>
            </td>
        </tr>
        <tr>
            <td>个人简介：</td>
            <td>
                <asp:TextBox ID="Introduction" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td><asp:Button ID="Submit" runat="server" Text="修改" OnClick="Submit_Click" /></td>
            <td><asp:HyperLink runat="server" NavigateUrl="~/index.aspx" Text="回首页"></asp:HyperLink></td>
            
        </tr>
    </table>
    </div>
    </form>
</body>
</html>
