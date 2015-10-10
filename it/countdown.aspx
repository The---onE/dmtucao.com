<%@ Page Title="高考倒计时" Language="C#" MasterPageFile="~/it/ImageText.master" AutoEventWireup="true" CodeFile="countdown.aspx.cs" Inherits="it_countdown" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
        function left_zero(str) {
            str = String(str);
            if (str.length > 1)
                return str;
            else
                return "0" + str;
        }
        function countdown(y, m, d, h, mi, s, id) {
            var timer = window.setTimeout(function () { countdown(y, m, d, h, mi, s, id) }, 999);

            var target = new Date(y, m-1, d, h, mi, s);
            var now = new Date();
            var date = Math.floor((target.getTime() - now.getTime()) / 1000);
            if (date >= 0) {
                $("#" + id + " .flag")[0].innerHTML = "还有";
            } else {
                $("#" + id + " .flag")[0].innerHTML = "已过";
                date = -date; 
            }
            var seconds = Math.floor(date % 60);
            var minutes = Math.floor(date % (60 * 60) / 60);
            var hours = Math.floor(date % (60 * 60 * 24) / (60 * 60));
            var days = Math.floor(date / (60 * 60 * 24));
            $("#" + id + " .seconds")[0].innerHTML = left_zero(seconds);
            $("#" + id + " .minutes")[0].innerHTML = left_zero(minutes);
            $("#" + id + " .hours")[0].innerHTML = left_zero(hours);
            $("#" + id + " .days")[0].innerHTML = left_zero(days);
        }

        function usercountdown(y, m, d, id, index) {
            if (index == $("#u_hid").attr("value")) {
                var timer = window.setTimeout(function () { usercountdown(y, m, d, id, index) }, 999);
            }
            else {
                return;
            }

            var target = new Date(y, m-1, d);
            var now = new Date();
            var date = Math.floor((target.getTime() - now.getTime()) / 1000);
            if (date >= 0) {
                $("#countdown").val("还有");
            } else {
                $("#countdown").val("已过");
                date = -date;
            }
            var seconds = Math.floor(date % 60);
            var minutes = Math.floor(date % (60 * 60) / 60);
            var hours = Math.floor(date % (60 * 60 * 24) / (60 * 60));
            var days = Math.floor(date / (60 * 60 * 24));
            $("#" + id + " .seconds")[0].innerHTML = left_zero(seconds);
            $("#" + id + " .minutes")[0].innerHTML = left_zero(minutes);
            $("#" + id + " .hours")[0].innerHTML = left_zero(hours);
            $("#" + id + " .days")[0].innerHTML = left_zero(days);
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Navigate" Runat="Server">
    <asp:HyperLink ID="IndexLink" runat="server" NavigateUrl="~/index.aspx">主页</asp:HyperLink>→倒计时
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Picture" Runat="Server">
    <div style="width:630px; height:630px; line-height:normal; font-size:30px; color:blue; ">
        <div id="gaokao"><p>距高考<span class="flag">还有</span><span class="days">0</span>天<span class="hours">0</span>小时<span class="minutes">0</span>分钟<span class="seconds">0</span>秒</p></div>
        <div id="liankao"><p>距六校联考<span class="flag">还有</span><span class="days">0</span>天<span class="hours">0</span>小时<span class="minutes">0</span>分钟<span class="seconds">0</span>秒</p></div>
        <div id="user"><p>距<input type="text" id="u_year" maxlength="4" style="width:50px" />年<input type="text" id="u_month" maxlength="2" style="width:25px" />月<input type="text" id="u_day" maxlength="2" style="width:25px" />日<input type="button" id="countdown" value="还有"/>
            <span class="days">0</span>天<span class="hours">0</span>小时<span class="minutes">0</span>分钟<span class="seconds">0</span>秒</p><input type="hidden" id="u_hid" value="0" /></div>
    </div>

    <script>
        countdown(2014, 6, 7, 9, 0, 0, "gaokao");
        countdown(2013, 9, 26, 8, 0, 0, "liankao");
        $("#countdown").click(function () {
            $("#u_hid").val($("#u_hid").attr("value") + 1);
            usercountdown($("#u_year").val(), $("#u_month").val(), $("#u_day").val(), "user", $("#u_hid").attr("value"));
        });
    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="About" Runat="Server">
</asp:Content>

