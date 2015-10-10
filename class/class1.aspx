<%@ Page Title="" Language="C#" MasterPageFile="~/class/ClassMaster.master" AutoEventWireup="true" CodeFile="class1.aspx.cs" Inherits="class_class1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Navigate" Runat="Server">
    <asp:HyperLink ID="IndexLink" runat="server" NavigateUrl="~/index.aspx">主页</asp:HyperLink>→<asp:Label ID="TitleLink" runat="server"></asp:Label>
</asp:Content>

