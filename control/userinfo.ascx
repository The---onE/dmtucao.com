<%@ Control Language="C#" AutoEventWireup="true" CodeFile="userinfo.ascx.cs" Inherits="control_userinfo" %>
<asp:Panel ID="NotLoggedIn" runat="server" HorizontalAlign="Right">
    您尚未登录，请点此<asp:HyperLink ID="login" runat="server" Text="登录" NavigateUrl="~/user/login.aspx"></asp:HyperLink>或<asp:HyperLink ID="register" runat="server" Text="注册" NavigateUrl="~/user/register.aspx"></asp:HyperLink>
</asp:Panel>

<asp:Panel ID="LoggedIn" runat="server" Visible="False" HorizontalAlign="Right">
    <asp:Label ID="nickname" runat="server"></asp:Label>，您好，点此进入<asp:HyperLink ID="usercenter" runat="server" Text="用户中心" NavigateUrl="~/user/center.aspx"></asp:HyperLink>，<asp:Button ID="logout" runat="server" Text="退出" BorderStyle="None" Height="21px" OnClick="logout_Click" />
</asp:Panel>
