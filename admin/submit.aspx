<%@ Page Language="C#" AutoEventWireup="true" CodeFile="submit.aspx.cs" Inherits="admin_submit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>投稿页</title>
</head>
<body>
    <form id="form1" runat="server">
        <uc2:userinfo runat="server" id="userinfo" />
        <div>
                标题：<asp:TextBox ID="Title" runat="server" Height="15px" Width="300px"></asp:TextBox>
                <asp:Label runat="server" Text="*" ForeColor="Red"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="标题不能为空" ControlToValidate="Title" Height="15px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                <br /><br />
                图片地址：<asp:TextBox ID="Imageurl" runat="server" Height="15px" Width="800px"></asp:TextBox>
                <asp:Label runat="server" Text="* 暂时只支持点点贴图" ForeColor="Red"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="网址不能为空" ControlToValidate="Imageurl" SetFocusOnError="True"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="必须为网络地址" ControlToValidate="Imageurl" SetFocusOnError="True" ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?"></asp:RegularExpressionValidator>
                <br /><br />
                描述：<asp:TextBox ID="Description" runat="server" Height="15px" Width="1000px"></asp:TextBox>
                <asp:Label runat="server" Text="可不填" ForeColor="Red"></asp:Label>
                <br /><br />
                类别：<asp:DropDownList ID="classList" runat="server" DataSourceID="ClassDataSource" DataTextField="title" DataValueField="class">
                </asp:DropDownList>
                <asp:SqlDataSource ID="ClassDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:dmtucaoConnectionString %>" SelectCommand="SELECT [class], [title] FROM [Class]"></asp:SqlDataSource>
                <asp:Label runat="server" Text="“二次元”“三次元”“搞笑”“学习”为大类别，可选择其下方小类别（“搞笑”下无小类别）" ForeColor="Red"></asp:Label>
                <br /><br />
                标签：<asp:TextBox ID="Tag" runat="server" Height="15px" Width="500px"></asp:TextBox>
                <asp:Label runat="server" Text="可不填，若填写请以空格分隔" ForeColor="Red"></asp:Label>
                <br /><br />
                <asp:Button ID="Submit" runat="server" Text="提交" OnClick="Submit_Click" />
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="List" Visible="False" />
        </div>
        <asp:HyperLink runat="server" NavigateUrl="~/index.aspx">首页</asp:HyperLink>
        <p>注意事项：</p>
        <ol>
            <li>由于本站服务器容量极小，无法容纳大量图片，故必须引用其他网站外链，但大部分网站图片不支持外链，故投稿前请将图片上传至支持外链的图床，推荐<a href="http://www.diandian.com/">点点贴图</a>，具体步骤请参考<a href="../html/diandian.html">这里</a></li>
            <li>投稿后需等待审核才能显示在页面上，请耐心等待，对不符合要求的链接，审核者将进行修正，若无法补救将不能通过审核</li>
        </ol>
    </form>
</body>
</html>

