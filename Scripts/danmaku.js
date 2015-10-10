var Class = {
    create: function () {
        return function () {
            this.initialize.apply(this, arguments);
        }
    }
}

function readDanmaku(othis) {
    var count = $("#count0");
    var data = $("#ctl00_CommentTable td");
    var flag = false;
    while (true) {
        if (data[4 + count.attr("value") * 7] == undefined) {
            if (flag == true)
                return;
            count.val("0");
            flag = true;
        } else if (data[4 + count.attr("value") * 7].innerHTML == "0") {
            flag = false;
            break;
        } else {
            count.val(Number(count.attr("value")) + 1);
        }
    }

    $(othis.strComment + " " + ".dm2").html("<p>" + data[1 + count.attr("value") * 7].innerHTML + " </p>");
    count.val(Number(count.attr("value")) + 1);


    while (true) {
        if (data[4 + count.attr("value") * 7] == undefined) {
            if (flag == true)
                return;
            count.val("0");
            flag = true;
        } else if (data[4 + count.attr("value") * 7].innerHTML == "0") {
            flag = false;
            break;
        } else {
            count.val(Number(count.attr("value")) + 1);
        }
    }

    $(othis.strComment + " " + ".dm3").html("<p>" + data[1 + count.attr("value") * 7].innerHTML + " </p>");
    count.val(Number(count.attr("value")) + 1);
}

function readTopBottom(othis,type) {
    var count = $("#count"+type);
    var data = $("#ctl00_CommentTable td");
    var flag = false;
    while (true) {
        if (data[4 + count.attr("value") * 7] == undefined) {
            if (flag == true)
                return;
            count.val("0");
            flag = true;
        } else if (data[4 + count.attr("value") * 7].innerHTML == type) {
            flag = false;
            break;
        } else {
            count.val(Number(count.attr("value")) + 1);
        }
    }

    $(othis.strComment + " " + ".tb").html("<p>" + data[1 + count.attr("value") * 7].innerHTML + " </p>");
    count.val(Number(count.attr("value")) + 1);
}

var Danmaku = Class.create();
Danmaku.prototype = {
    initialize: function (idComment, idInComment) {
        var oThis = this,
        oComment = $(idComment),
        oInComment = $(idInComment);
        this.strComment = idComment,
        this.strInComment = idInComment,
        this.Step = 1;//每次变化的px量 
        this.speed = 5; //速度 
        this.scroller = oComment; //对象
        this.timer = null; //时间
        this.side = 0; //方向
        //用于左右滚动 
        this.widthScroller = oComment.width();
        this.widthList = oInComment.width();
        $("#pause").click(function () { oThis.Stop(); });
        $("#start").click(function () { oThis.Start(); });
        $("#hide").click(function () { oThis.Stop(); });
        $("#show").click(function () { oThis.Start(); });
        oComment.mouseover(function () { oThis.Stop(); });
        oComment.mouseout(function () { oThis.Start(); });
        readDanmaku(this);;
        this.Start();
    },
    //左右滚动 
    ScrollLeftRight: function () {
        this.scroller.scrollLeft(this.GetScroll(this.scroller.scrollLeft(), this.widthScroller, this.widthList));
        var oThis = this;
        this.timer = window.setTimeout(function () { oThis.Start(); }, this.speed);
    },
    //获取设置滚动数据 
    GetScroll: function (iScroll, iScroller, iList) {
        var iStep = this.Step * this.side;
        if (this.side > 0) {
            if (iScroll >= (iList - iScroller)) {
                $(this.strComment + " " + ".dm1").html($(this.strComment + " " + ".dm3").html());
                readDanmaku(this);
                iScroll -= iList;
            }
        } else {
            if (iScroll <= 0) {
                iScroll += iList;
            }
        }
        return (iScroll + iStep);
    },
    //开始 
    Start: function () {
        this.side = 1;
        this.ScrollLeftRight();
    },
    //停止 
    Stop: function () {
        clearTimeout(this.timer);
    }
    //隐藏
};

var TopBottom = Class.create();
TopBottom.prototype = {
    initialize: function (idComment, idInComment, itype) {
        var oThis = this,
        oComment = $(idComment),
        oInComment = $(idInComment);
        this.type = itype;
        this.strComment = idComment,
        this.strInComment = idInComment,
        this.showTime = 3000;
        this.hiddenTime = 500;
        this.scroller = oComment; //对象
        this.timer = null; //时间
        this.side = 0; //方向
        this.widthScroller = oComment.width();
        $("#pause").click(function () { oThis.Stop(); });
        $("#start").click(function () { oThis.Show(); });
        $("#hide").click(function () { oThis.Stop(); $(".danmaku").css('visibility', 'hidden'); });
        $("#show").click(function () { oThis.Show(); $(".danmaku").css('visibility', 'visible');});
        oComment.mouseover(function () { oThis.Stop(); });
        oComment.mouseout(function () { oThis.Show(); });
        this.Show();
    },
    //显示 
    Show: function () {
        readTopBottom(this, this.type);
        this.scroller.scrollLeft(this.widthScroller);
        var oThis = this;
        this.timer = window.setTimeout(function () { oThis.Hidden(); }, this.showTime);
    },

    //隐藏 
    Hidden: function () {
        this.scroller.scrollLeft(0);
        var oThis = this;
        this.timer = window.setTimeout(function () { oThis.Show(); }, this.hiddenTime);
    },
    //停止 
    Stop: function () {
        clearTimeout(this.timer);
    }
};