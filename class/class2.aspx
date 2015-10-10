<%@ Page Title="" Language="C#" MasterPageFile="~/class/ClassMaster.master" AutoEventWireup="true" CodeFile="class2.aspx.cs" Inherits="class_class2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Navigate" Runat="Server">
    <asp:HyperLink ID="IndexLink" runat="server" NavigateUrl="~/index.aspx">主页</asp:HyperLink>→<asp:HyperLink ID="ClassLink1" runat="server"></asp:HyperLink>→<asp:Label ID="TitleLink" runat="server"></asp:Label>
</asp:Content>