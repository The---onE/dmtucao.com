<%@ Page Language="C#" AutoEventWireup="true" CodeFile="check.aspx.cs" Inherits="admin_check" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>审核页</title>
</head>
<body>
    <form id="form1" runat="server">
        <uc2:userinfo runat="server" id="userinfo" />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/index.aspx">首页</asp:HyperLink>
        <div>
            <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:dmtucaoConnectionString %>" 
                SelectCommand="SELECT * FROM [ImageText] ORDER BY [it] DESC"
                UpdateCommand="UPDATE [ImageText] SET [state] = @state, [title] = @title, [imageurl] = @imageurl, [class] = @class, [type] = @type, [limit] = @limit, [setting] = @setting, [thumbnail] = @thumbnail, [description] = @description, [tag] = @tag WHERE [it] = @original_it" 
                OldValuesParameterFormatString="original_{0}" >
                <UpdateParameters>
                    <asp:Parameter Name="state" Type="Byte" />
                    <asp:Parameter Name="title" Type="String" />
                    <asp:Parameter Name="imageurl" Type="String" />
                    <asp:Parameter Name="class" Type="Int16" />
                    <asp:Parameter Name="type" Type="Byte" />
                    <asp:Parameter Name="limit" Type="Byte" />
                    <asp:Parameter Name="setting" Type="Int32" />
                    <asp:Parameter Name="thumbnail" Type="String" />
                    <asp:Parameter Name="description" Type="String" />
                    <asp:Parameter Name="tag" Type="String" />
                    <asp:Parameter Name="original_it" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="it" DataSourceID="SqlDataSource" EnableModelValidation="True" CellPadding="4" ForeColor="#333333" GridLines="None" Width="1280px" HorizontalAlign="Center">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:CommandField ShowEditButton="True" />
                    <asp:BoundField DataField="it" HeaderText="序号" InsertVisible="False" ReadOnly="True" SortExpression="it" />
                    <asp:BoundField DataField="state" HeaderText="状态" SortExpression="state" />
                    <asp:BoundField DataField="title" HeaderText="标题" SortExpression="title" >
                    </asp:BoundField>
                    <asp:BoundField DataField="imageurl" HeaderText="图片地址" SortExpression="imageurl" >
                    </asp:BoundField>
                    <asp:BoundField DataField="date" HeaderText="时间" SortExpression="date" ReadOnly="True" />
                    <asp:BoundField DataField="up" HeaderText="UP主" SortExpression="up" ReadOnly="True" />
                    <asp:BoundField DataField="class" HeaderText="类别" SortExpression="class" />
                    <asp:BoundField DataField="type" HeaderText="种类" SortExpression="type" />
                    <asp:BoundField DataField="limit" HeaderText="权限" SortExpression="limit" />
                    <asp:BoundField DataField="setting" HeaderText="设置" SortExpression="setting" />
                    <asp:BoundField DataField="thumbnail" HeaderText="缩略图地址" SortExpression="thumbnail" />
                    <asp:BoundField DataField="description" HeaderText="描述" SortExpression="description" >
                    </asp:BoundField>
                    <asp:BoundField DataField="tag" HeaderText="标签" SortExpression="tag" />
                    <asp:BoundField DataField="read" HeaderText="阅读数" SortExpression="read" ReadOnly="True" />
                    <asp:BoundField DataField="danmaku" HeaderText="弹幕数" SortExpression="danmaku" ReadOnly="True" />
                    <asp:HyperLinkField DataNavigateUrlFields="it" DataNavigateUrlFormatString="page.aspx?it={0}" HeaderText="分P" InsertVisible="False" Text="分P" />
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            </asp:GridView>
            <br />
        </div>
    </form>
</body>
</html>
