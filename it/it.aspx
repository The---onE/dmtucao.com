<%@ Page Language="C#" MasterPageFile="~/it/ImageText.master" AutoEventWireup="true" CodeFile="it.aspx.cs" Inherits="it_it" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" type="text/css" href="../Styles/danmaku.css" />
    <script type="text/javascript" src="../Scripts/danmaku.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Navigate" Runat="Server">
    <asp:HyperLink ID="IndexLink" runat="server" NavigateUrl="~/index.aspx">主页</asp:HyperLink>→<asp:HyperLink ID="ClassLink1" runat="server"></asp:HyperLink><asp:Label ID="point2" runat="server" Text="→" /><asp:HyperLink ID="ClassLink2" runat="server"></asp:HyperLink><asp:Label ID="point3" runat="server" Text="→" /><asp:Label ID="TitleLink" runat="server"></asp:Label>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Picture" Runat="Server">
    <asp:HyperLink ID="picturelink" runat="server"  Target="_blank"><asp:Image ID="picture" runat="server" ImageUrl="~/images/picture.jpg" ImageAlign="AbsMiddle" /></asp:HyperLink>
    <asp:Panel ID="Url" runat="server" Height="0" Width="0">
        <asp:HiddenField ID="page0" runat="server"/>
        <asp:HiddenField ID="Index" runat="server" Value="0"/>
    </asp:Panel>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="About" Runat="Server">
    <br /><asp:Label ID="itTitle" runat="server" Text="标题" Font-Bold="True" Font-Names="Adobe 黑体 Std R" Font-Size="XX-Large"></asp:Label>
    <br />时间：<asp:Label ID="Date" runat="server" Text="时间"></asp:Label>
    <br />阅读：<asp:Label ID="Read" runat="server" Text="阅读"></asp:Label> 弹幕：<asp:Label ID="Danmaku" runat="server" Text="弹幕"></asp:Label>
    <br />up主：<asp:Label ID="Uploader" runat="server" Text="up主"></asp:Label>
    <br /><br />TAG:<asp:Label ID="Tag" runat="server" Text="tag"></asp:Label>
    <br /><br />描述：<asp:Label ID="Description" runat="server" Text="描述"></asp:Label>
    <br /><br /><br /><br /><br />
    <br /><script type="text/javascript">
              (function () {
                  var p = {
                      url: location.href,
                      showcount: '1',/*是否显示分享总数,显示：'1'，不显示：'0' */
                      desc: $("#ctl00_About_itTitle").text() + '  ' + location.href,/*默认分享理由(可选)*/
                      summary: $("#ctl00_About_Description").text(),/*分享摘要(可选)*/
                      title: $("#ctl00_About_itTitle").text(),/*分享标题(可选)*/
                      site: '弹幕吐槽网',/*分享来源 如：腾讯网(可选)*/
                      pics: $("#ctl00_Picture_picture").attr("src"), /*分享图片的路径(可选)*/
                      style: '102',
                      width: 145,
                      height: 30
                  };
                  var s = [];
                  for (var i in p) {
                      s.push(i + '=' + encodeURIComponent(p[i] || ''));
                  }
                  document.write(['<a version="1.0" class="qzOpenerDiv" href="http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?', s.join('&'), '" target="_blank">分享</a>'].join(''));
              })();
        </script>
        <script src="http://qzonestyle.gtimg.cn/qzone/app/qzlike/qzopensl.js#jsdate=20111201" charset="utf-8"></script>
    <div id="qqwb_share__" data-appkey="801408037" data-icon="1" data-counter="1" data-counter_pos="right"></div>
          <script type="text/javascript">
              var weibo = $("#qqwb_share__");
              weibo.attr("data-content", $("#ctl00_About_itTitle").text());
              weibo.attr("data-url", location.href);
              weibo.attr("data-pic", $("#ctl00_Picture_picture").attr("src"))
          </script>
          <script src="http://mat1.gtimg.com/app/openjs/openjs.js#autoboot=no&debug=no"></script>
</asp:Content>
