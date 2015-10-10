<%@ Page Language="C#" AutoEventWireup="true" CodeFile="page.aspx.cs" Inherits="admin_page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>分P</title>
</head>
<body>
    <form id="form1" runat="server">
        <uc2:userinfo runat="server" id="userinfo" />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/index.aspx">首页</asp:HyperLink>
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="index" DataSourceID="SqlDataSource" EnableModelValidation="True" CellPadding="4" ForeColor="#333333" GridLines="None" Width="1280px" HorizontalAlign="Center">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        <asp:BoundField DataField="index" HeaderText="index" InsertVisible="False" ReadOnly="True" SortExpression="index">
                        </asp:BoundField>
                        <asp:BoundField DataField="url" HeaderText="url" SortExpression="url" />
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:dmtucaoConnectionString %>" DeleteCommand="DELETE FROM [Url] WHERE [index] = @original_index AND [url] = @original_url" InsertCommand="INSERT INTO [Url] ([url]) VALUES (@url)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [index], [url] FROM [Url]" UpdateCommand="UPDATE [Url] SET [url] = @url WHERE [index] = @original_index AND [url] = @original_url">
                <DeleteParameters>
                    <asp:Parameter Name="original_index" Type="Int32" />
                    <asp:Parameter Name="original_url" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="url" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="url" Type="String" />
                    <asp:Parameter Name="original_index" Type="Int32" />
                    <asp:Parameter Name="original_url" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
        <asp:Panel runat="server">
            <asp:TextBox ID="txtUrl" runat="server" Width="1001px" ValidationGroup="add"></asp:TextBox>
            <asp:Button ID="Add" runat="server" Text="添加" OnClick="Add_Click" ValidationGroup="add" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="网址不能为空" ControlToValidat="txtUrl" SetFocusOnError="True" ControlToValidate="txtUrl" ValidationGroup="add"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="必须为网络地址" ControlToValidate="txtUrl" SetFocusOnError="True" ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?" ValidationGroup="add"></asp:RegularExpressionValidator>
        </asp:Panel>
    </form>
</body>
</html>
