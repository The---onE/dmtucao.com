<%@ Control Language="C#" AutoEventWireup="true" CodeFile="index.ascx.cs" Inherits="control_index" %>

<style type="text/css">
    ul {
        padding:0;
        margin:0;
    }
    #nav {
        margin:0;
    }
    #nav .mainlevel {
        background:#CCFF66;
        float:left;
        border:1px solid #0066CC;
        width:100px;
        text-align:center;
    }
    #nav .mainlevel a {
        color:#000000;
        text-decoration:none;
        line-height:30px;
        display:block;
        width:100px;
    }
    #nav .mainlevel a:hover {
        color:#FFFFFF;
        text-decoration:none;
        background:#336699;
    }
    #nav li {
        list-style-type:none;
        border:1px solid #CC9999;
        background:#99CCCC;
        width:100px;
    }
    #nav .mainlevel ul {
        display:none;
        position:absolute;
        z-index:100;
    }
</style>


<ul id="nav">
    <li class="mainlevel" id="Li1"><a id="A1" runat="server" href="~/index.aspx">主页</a>
    </li>

    <li class="mainlevel" id="mainlevel1"><a runat="server" href="~/class/class1.aspx?page=1&class=100">二次元</a>
        <ul id="sub1">
            <li><a runat="server" href="~/class/class2.aspx?page=1&class=101">游戏</a></li>
            <li><a runat="server" href="~/class/class2.aspx?page=1&class=102">动画</a></li>
            <li><a runat="server" href="~/class/class2.aspx?page=1&class=103">漫画</a></li>
        </ul>
    </li>
                
    <li class="mainlevel" id="mainlevel2"><a runat="server" href="~/class/class1.aspx?page=1&class=200">三次元</a>
        <ul id="sub2">
            <li><a runat="server" href="~/class/class2.aspx?page=1&class=201">COSPLAY</a></li>
            <li><a runat="server" href="~/class/class2.aspx?page=1&class=202">电影</a></li>
            <li><a runat="server" href="~/class/class2.aspx?page=1&class=203">电视剧</a></li>
            <li><a runat="server" href="~/class/class2.aspx?page=1&class=204">人物</a></li>
            <li><a runat="server" href="~/class/class2.aspx?page=1&class=205">风景</a></li>
        </ul>
    </li>
                
    <li class="mainlevel" id="mainlevel3"><a runat="server" href="~/class/class1.aspx?page=1&class=300">搞笑</a>
    </li>
                
    <li class="mainlevel" id="mainlevel4"><a runat="server" href="~/class/class1.aspx?page=1&class=400">学习</a>
        <ul id="Ul2">
            <li><a runat="server" href="~/class/class2.aspx?page=1&class=401">语文</a></li>
            <li><a runat="server" href="~/class/class2.aspx?page=1&class=402">数学</a></li>
            <li><a runat="server" href="~/class/class2.aspx?page=1&class=403">外语</a></li>
            <li><a runat="server" href="~/class/class2.aspx?page=1&class=404">物理</a></li>
            <li><a runat="server" href="~/class/class2.aspx?page=1&class=405">化学</a></li>
            <li><a runat="server" href="~/class/class2.aspx?page=1&class=406">生物</a></li>
            <li><a runat="server" href="~/class/class2.aspx?page=1&class=407">历史</a></li>
            <li><a runat="server" href="~/class/class2.aspx?page=1&class=408">地理</a></li>
            <li><a runat="server" href="~/class/class2.aspx?page=1&class=409">政治</a></li>
        </ul>
    </li>
</ul>
<script type="text/javascript">
    $(function () {
        $('li.mainlevel').mousemove(function () {
            $(this).find('ul').slideDown("normal")
        });
        $('li.mainlevel').mouseleave(function () {
            $(this).find('ul').slideUp("fast");
        });
    });
</script>