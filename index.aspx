<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="_Default" EnableViewState="False" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>弹幕吐槽网</title>
        <meta http-equiv="content-Type" content="text/html; charset=gb2312" />
        <meta name="keywords" content="弹幕,吐槽,图片" />
        <meta name="description" content="一个自由、平等、轻松、愉快的交流平台。用弹幕倾诉你的心声，用吐槽吐露你的看法。弹幕吐槽网，欢迎您的加入！" />
        <link rel="stylesheet" type="text/css" href="Styles/index.css" />
        <script type="text/javascript" src="Scripts/jquery-1.10.2.min.js" ></script>
    </head>
    <body>
        <form id="form1" runat="server">
            <uc2:userinfo runat="server" id="userinfo" />
            <div id="logo">
                <div class="logo">
                    <img src="images/logo.jpg" alt="弹幕吐槽网" />
                </div>
            </div>
            <div id="title">
                <div class="title">
                    <img src="images/title.jpg" alt="弹幕吐槽网" />
                </div>
            </div>
            <div id="index">
                <div class="index">
                    <uc1:index runat="server"/>
                </div>
            </div>
            <div id="new">
                <div class="new">
                    <asp:Image ID="newtitle" runat="server" ImageUrl="~/images/new.jpg" Width="250px" Height="40px" />
                    <table>
                        <tr>
                            <td><asp:HyperLink ID="newimagelink1" runat="server"  Target="_blank"><asp:Image ID="newimage1" runat="server" CssClass="thumbnail" GenerateEmptyAlternateText="True"  AlternateText="无更多内容" /></asp:HyperLink></td>
                            <td><asp:HyperLink ID="newtitle1" runat="server"  Target="_blank"></asp:HyperLink></td>
                        </tr>
                        <tr>
                            <td><asp:HyperLink ID="newimagelink2" runat="server"  Target="_blank"><asp:Image ID="newimage2" runat="server" CssClass="thumbnail" GenerateEmptyAlternateText="True"  AlternateText="无更多内容" /></asp:HyperLink></td>
                            <td><asp:HyperLink ID="newtitle2" runat="server"  Target="_blank"></asp:HyperLink></td>
                        </tr>
                        <tr>
                            <td><asp:HyperLink ID="newimagelink3" runat="server"  Target="_blank"><asp:Image ID="newimage3" runat="server" CssClass="thumbnail" GenerateEmptyAlternateText="True"  AlternateText="无更多内容" /></asp:HyperLink></td>
                            <td><asp:HyperLink ID="newtitle3" runat="server"  Target="_blank"></asp:HyperLink></td>
                        </tr>
                        <tr>
                            <td><asp:HyperLink ID="newimagelink4" runat="server"  Target="_blank"><asp:Image ID="newimage4" runat="server" CssClass="thumbnail" GenerateEmptyAlternateText="True"  AlternateText="无更多内容" /></asp:HyperLink></td>
                            <td><asp:HyperLink ID="newtitle4" runat="server"  Target="_blank"></asp:HyperLink></td>
                        </tr>
                        <tr>
                            <td><asp:HyperLink ID="newimagelink5" runat="server"  Target="_blank"><asp:Image ID="newimage5" runat="server" CssClass="thumbnail" GenerateEmptyAlternateText="True"  AlternateText="无更多内容" /></asp:HyperLink></td>
                            <td><asp:HyperLink ID="newtitle5" runat="server"  Target="_blank"></asp:HyperLink></td>
                        </tr>
                        <tr>
                            <td><asp:HyperLink ID="newimagelink6" runat="server"  Target="_blank"><asp:Image ID="newimage6" runat="server" CssClass="thumbnail" GenerateEmptyAlternateText="True"  AlternateText="无更多内容" /></asp:HyperLink></td>
                            <td><asp:HyperLink ID="newtitle6" runat="server"  Target="_blank"></asp:HyperLink></td>
                        </tr>
                    </table>
                </div>
                <%--<div class="ad1">
                </div>--%>
            </div>
            <div id="topic">
                <div class="topic">
                    <asp:HyperLink ID="TopicLink" runat="server"  Target="_blank"><asp:Image ID="TopicImage" runat="server" GenerateEmptyAlternateText="True"  AlternateText="无更多内容" Height="480px" Width="430px" /></asp:HyperLink>
                </div>
            </div>
            <div id="hot">
                <div class="hot">
                    <asp:Image ID="hottitle" runat="server" ImageUrl="~/images/hot.jpg" Width="250px" Height="40px" />
                    <table>
                        <tr>
                            <td><asp:HyperLink ID="hotimagelink1" runat="server"  Target="_blank"><asp:Image ID="hotimage1" runat="server" CssClass="thumbnail" GenerateEmptyAlternateText="True"  AlternateText="无更多内容" /></asp:HyperLink></td>
                            <td><asp:HyperLink ID="hottitle1" runat="server"  Target="_blank"></asp:HyperLink></td>
                        </tr>
                        <tr>
                            <td><asp:HyperLink ID="hotimagelink2" runat="server"  Target="_blank"><asp:Image ID="hotimage2" runat="server" CssClass="thumbnail" GenerateEmptyAlternateText="True"  AlternateText="无更多内容" /></asp:HyperLink></td>
                            <td><asp:HyperLink ID="hottitle2" runat="server"  Target="_blank"></asp:HyperLink></td>
                        </tr>
                        <tr>
                            <td><asp:HyperLink ID="hotimagelink3" runat="server"  Target="_blank"><asp:Image ID="hotimage3" runat="server" CssClass="thumbnail" GenerateEmptyAlternateText="True"  AlternateText="无更多内容" /></asp:HyperLink></td>
                            <td><asp:HyperLink ID="hottitle3" runat="server"  Target="_blank"></asp:HyperLink></td>
                        </tr>
                        <tr>
                            <td><asp:HyperLink ID="hotimagelink4" runat="server"  Target="_blank"><asp:Image ID="hotimage4" runat="server" CssClass="thumbnail" GenerateEmptyAlternateText="True"  AlternateText="无更多内容" /></asp:HyperLink></td>
                            <td><asp:HyperLink ID="hottitle4" runat="server"  Target="_blank"></asp:HyperLink></td>
                        </tr>
                        <tr>
                            <td><asp:HyperLink ID="hotimagelink5" runat="server"  Target="_blank"><asp:Image ID="hotimage5" runat="server" CssClass="thumbnail" GenerateEmptyAlternateText="True"  AlternateText="无更多内容" /></asp:HyperLink></td>
                            <td><asp:HyperLink ID="hottitle5" runat="server"  Target="_blank"></asp:HyperLink></td>
                        </tr>
                        <tr>
                            <td><asp:HyperLink ID="hotimagelink6" runat="server"  Target="_blank"><asp:Image ID="hotimage6" runat="server" CssClass="thumbnail" GenerateEmptyAlternateText="True"  AlternateText="无更多内容" /></asp:HyperLink></td>
                            <td><asp:HyperLink ID="hottitle6" runat="server"  Target="_blank"></asp:HyperLink></td>
                        </tr>
                    </table>
                </div>
                <%--<div class="ad1">
                </div>--%>
            </div>
            <div id="class">
                <div class="class">
                    <asp:HyperLink runat="server" NavigateUrl="~/class/class1.aspx?page=1&class=100"><asp:Image ID="classtitle1" runat="server" ImageUrl="~/images/class1.jpg" Width="700px" Height="20px" /></asp:HyperLink>
                    <table>
                        <tr>
                            <td>
                                <div class="classgroup">
                                    <asp:HyperLink ID="classimagelink11" runat="server"  Target="_blank"><asp:Image ID="classimage11" runat="server" CssClass="classpicture" GenerateEmptyAlternateText="True"  AlternateText="无更多内容" /></asp:HyperLink>
                                    <asp:HyperLink ID="classtitle11" runat="server"  Target="_blank" CssClass="classtitle"></asp:HyperLink>
                                </div>
                            </td>
                            <td>
                                <div class="classgroup">
                                    <asp:HyperLink ID="classimagelink12" runat="server"  Target="_blank"><asp:Image ID="classimage12" runat="server" CssClass="classpicture" GenerateEmptyAlternateText="True"  AlternateText="无更多内容" /></asp:HyperLink>
                                    <asp:HyperLink ID="classtitle12" runat="server"  Target="_blank" CssClass="classtitle"></asp:HyperLink>
                                </div>
                            </td>
                            <td>
                                <div class="classgroup">
                                    <asp:HyperLink ID="classimagelink13" runat="server"  Target="_blank"><asp:Image ID="classimage13" runat="server" CssClass="classpicture" GenerateEmptyAlternateText="True"  AlternateText="无更多内容" /></asp:HyperLink>
                                    <asp:HyperLink ID="classtitle13" runat="server"  Target="_blank" CssClass="classtitle"></asp:HyperLink>
                                </div>
                            </td>
                            <td>
                                <div class="classgroup">
                                    <asp:HyperLink ID="classimagelink14" runat="server"  Target="_blank"><asp:Image ID="classimage14" runat="server" CssClass="classpicture" GenerateEmptyAlternateText="True"  AlternateText="无更多内容" /></asp:HyperLink>
                                    <asp:HyperLink ID="classtitle14" runat="server"  Target="_blank" CssClass="classtitle"></asp:HyperLink>
                                </div>
                            </td>
                            <td>
                                <div class="classgroup">
                                    <asp:HyperLink ID="classimagelink15" runat="server"  Target="_blank"><asp:Image ID="classimage15" runat="server" CssClass="classpicture" GenerateEmptyAlternateText="True"  AlternateText="无更多内容" /></asp:HyperLink>
                                    <asp:HyperLink ID="classtitle15" runat="server"  Target="_blank" CssClass="classtitle"></asp:HyperLink>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="class">
                    <asp:HyperLink runat="server" NavigateUrl="~/class/class1.aspx?page=1&class=200"><asp:Image ID="classtitle2" runat="server" ImageUrl="~/images/class2.jpg" Width="700px" Height="20px" /></asp:HyperLink>
                    <table>
                        <tr>
                            <td>
                                <div class="classgroup">
                                    <asp:HyperLink ID="classimagelink21" runat="server"  Target="_blank"><asp:Image ID="classimage21" runat="server" CssClass="classpicture" GenerateEmptyAlternateText="True"  AlternateText="无更多内容" /></asp:HyperLink>
                                    <asp:HyperLink ID="classtitle21" runat="server"  Target="_blank" CssClass="classtitle"></asp:HyperLink>
                                </div>
                            </td>
                            <td>
                                <div class="classgroup">
                                    <asp:HyperLink ID="classimagelink22" runat="server"  Target="_blank"><asp:Image ID="classimage22" runat="server" CssClass="classpicture" GenerateEmptyAlternateText="True"  AlternateText="无更多内容" /></asp:HyperLink>
                                    <asp:HyperLink ID="classtitle22" runat="server"  Target="_blank" CssClass="classtitle"></asp:HyperLink>
                                </div>
                            </td>
                            <td>
                                <div class="classgroup">
                                    <asp:HyperLink ID="classimagelink23" runat="server"  Target="_blank"><asp:Image ID="classimage23" runat="server" CssClass="classpicture" GenerateEmptyAlternateText="True"  AlternateText="无更多内容" /></asp:HyperLink>
                                    <asp:HyperLink ID="classtitle23" runat="server"  Target="_blank" CssClass="classtitle"></asp:HyperLink>
                                </div>
                            </td>
                            <td>
                                <div class="classgroup">
                                    <asp:HyperLink ID="classimagelink24" runat="server"  Target="_blank"><asp:Image ID="classimage24" runat="server" CssClass="classpicture" GenerateEmptyAlternateText="True"  AlternateText="无更多内容" /></asp:HyperLink>
                                    <asp:HyperLink ID="classtitle24" runat="server"  Target="_blank" CssClass="classtitle"></asp:HyperLink>
                                </div>
                            </td>
                            <td>
                                <div class="classgroup">
                                    <asp:HyperLink ID="classimagelink25" runat="server"  Target="_blank"><asp:Image ID="classimage25" runat="server" CssClass="classpicture" GenerateEmptyAlternateText="True"  AlternateText="无更多内容" /></asp:HyperLink>
                                    <asp:HyperLink ID="classtitle25" runat="server"  Target="_blank" CssClass="classtitle"></asp:HyperLink>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="class">
                    <asp:HyperLink runat="server" NavigateUrl="~/class/class1.aspx?page=1&class=300"><asp:Image ID="classtitle3" runat="server" ImageUrl="~/images/class3.jpg" Width="700px" Height="20px" /></asp:HyperLink>
                    <table>
                        <tr>
                            <td>
                                <div class="classgroup">
                                    <asp:HyperLink ID="classimagelink31" runat="server"  Target="_blank"><asp:Image ID="classimage31" runat="server" CssClass="classpicture" GenerateEmptyAlternateText="True"  AlternateText="无更多内容" /></asp:HyperLink>
                                    <asp:HyperLink ID="classtitle31" runat="server"  Target="_blank" CssClass="classtitle"></asp:HyperLink>
                                </div>
                            </td>
                            <td>
                                <div class="classgroup">
                                    <asp:HyperLink ID="classimagelink32" runat="server"  Target="_blank"><asp:Image ID="classimage32" runat="server" CssClass="classpicture" GenerateEmptyAlternateText="True"  AlternateText="无更多内容" /></asp:HyperLink>
                                    <asp:HyperLink ID="classtitle32" runat="server"  Target="_blank" CssClass="classtitle"></asp:HyperLink>
                                </div>
                            </td>
                            <td>
                                <div class="classgroup">
                                    <asp:HyperLink ID="classimagelink33" runat="server"  Target="_blank"><asp:Image ID="classimage33" runat="server" CssClass="classpicture" GenerateEmptyAlternateText="True"  AlternateText="无更多内容" /></asp:HyperLink>
                                    <asp:HyperLink ID="classtitle33" runat="server"  Target="_blank" CssClass="classtitle"></asp:HyperLink>
                                </div>
                            </td>
                            <td>
                                <div class="classgroup">
                                    <asp:HyperLink ID="classimagelink34" runat="server"  Target="_blank"><asp:Image ID="classimage34" runat="server" CssClass="classpicture" GenerateEmptyAlternateText="True"  AlternateText="无更多内容" /></asp:HyperLink>
                                    <asp:HyperLink ID="classtitle34" runat="server"  Target="_blank" CssClass="classtitle"></asp:HyperLink>
                                </div>
                            </td>
                            <td>
                                <div class="classgroup">
                                    <asp:HyperLink ID="classimagelink35" runat="server"  Target="_blank"><asp:Image ID="classimage35" runat="server" CssClass="classpicture" GenerateEmptyAlternateText="True"  AlternateText="无更多内容" /></asp:HyperLink>
                                    <asp:HyperLink ID="classtitle35" runat="server"  Target="_blank" CssClass="classtitle"></asp:HyperLink>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="class">
                    <asp:HyperLink runat="server" NavigateUrl="~/class/class1.aspx?page=1&class=400"><asp:Image ID="classtitle4" runat="server" ImageUrl="~/images/class4.jpg" Width="700px" Height="20px" /></asp:HyperLink>
                    <table>
                        <tr>
                            <td>
                                <div class="classgroup">
                                    <asp:HyperLink ID="classimagelink41" runat="server"  Target="_blank"><asp:Image ID="classimage41" runat="server" CssClass="classpicture" GenerateEmptyAlternateText="True"  AlternateText="无更多内容" /></asp:HyperLink>
                                    <asp:HyperLink ID="classtitle41" runat="server"  Target="_blank" CssClass="classtitle"></asp:HyperLink>
                                </div>
                            </td>
                            <td>
                                <div class="classgroup">
                                    <asp:HyperLink ID="classimagelink42" runat="server"  Target="_blank"><asp:Image ID="classimage42" runat="server" CssClass="classpicture" GenerateEmptyAlternateText="True"  AlternateText="无更多内容" /></asp:HyperLink>
                                    <asp:HyperLink ID="classtitle42" runat="server"  Target="_blank" CssClass="classtitle"></asp:HyperLink>
                                </div>
                            </td>
                            <td>
                                <div class="classgroup">
                                    <asp:HyperLink ID="classimagelink43" runat="server"  Target="_blank"><asp:Image ID="classimage43" runat="server" CssClass="classpicture" GenerateEmptyAlternateText="True"  AlternateText="无更多内容" /></asp:HyperLink>
                                    <asp:HyperLink ID="classtitle43" runat="server"  Target="_blank" CssClass="classtitle"></asp:HyperLink>
                                </div>
                            </td>
                            <td>
                                <div class="classgroup">
                                    <asp:HyperLink ID="classimagelink44" runat="server"  Target="_blank"><asp:Image ID="classimage44" runat="server" CssClass="classpicture" GenerateEmptyAlternateText="True"  AlternateText="无更多内容" /></asp:HyperLink>
                                    <asp:HyperLink ID="classtitle44" runat="server"  Target="_blank" CssClass="classtitle"></asp:HyperLink>
                                </div>
                            </td>
                            <td>
                                <div class="classgroup">
                                    <asp:HyperLink ID="classimagelink45" runat="server"  Target="_blank"><asp:Image ID="classimage45" runat="server" CssClass="classpicture" GenerateEmptyAlternateText="True"  AlternateText="无更多内容" /></asp:HyperLink>
                                    <asp:HyperLink ID="classtitle45" runat="server"  Target="_blank" CssClass="classtitle"></asp:HyperLink>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div id="news">
                <div class="news">
                </div>
                <%--<div class="ad2">
                </div>--%>
            </div>
            <div id="information">
                <div class="information">
                </div>
            </div>
            <div>
                <asp:HyperLink runat="server" NavigateUrl="~/admin/submit.aspx">投稿页</asp:HyperLink>
                <asp:HyperLink runat="server" NavigateUrl="~/admin/check.aspx">审核页</asp:HyperLink>
                <asp:HyperLink runat="server" NavigateUrl="~/it/countdown.aspx">高考倒计时</asp:HyperLink>
            </div>
        </form>
    </body>
</html>