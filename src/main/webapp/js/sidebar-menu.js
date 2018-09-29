(function ($) {
    $.fn.sidebarMenu = function (options) {
        options = $.extend({}, $.fn.sidebarMenu.defaults, options || {});
        var target = $(this);
        target.addClass('nav');
        target.addClass('nav-list');
        if (options.data) {
            init(target, options.data);
        }
        else {
            if (!options.url) return;
            $.getJSON(options.url, options.param, function (data) {
                init(target, data);
            });
        }
        var url = window.location.pathname;
        //menu = target.find("[href='" + url + "']");
        //menu.parent().addClass('active');
        //menu.parent().parentsUntil('.nav-list', 'li').addClass('active').addClass('open');
        function init(target, data) {
            $.each(data, function (i, item) {
                var li = $('<li></li>');
                var a = $('<a></a>');
                var icon = $('<i></i>');
                //icon.addClass('glyphicon');
                icon.addClass(item.icon);
                var text = $('<span></span>');
                text.addClass('menu-text').text(item.text);
                a.append(icon);
                a.append(text);
                if (item.menus&&item.menus.length>0) {
                    a.attr('href', '#');
                    a.addClass('dropdown-toggle');
                    var arrow = $('<b></b>');
                    arrow.addClass('arrow').addClass('fa').addClass('icon-angle-down');
                    a.append(arrow);
                    li.append(a);
                    var menus = $('<ul></ul>');
                    menus.addClass('submenu');
                    init(menus, item.menus);
                    li.append(menus);
                }
                else {
                    var href = 'javascript:addTabs({id:\'' + item.id + '\',title: \'' + item.text + '\',close: true,url: \'' + item.url + '\'});';
                    a.attr('href', href);
                    //if (item.istab)
                    //  a.attr('href', href);
                    //else {
                    //  a.attr('href', item.url);
                    //  a.attr('title', item.text);
                    //  a.attr('target', '_blank')
                    //}
                    li.append(a);
                }
                target.append(li);
            });
        }
    }

    $.fn.sidebarMenu.defaults = {
        url: null,
        param: null,
        data: null
    };
})(jQuery);




var addTabs = function (options) {
    //可以在此处验证session
    //var rand = Math.random().toString();
    //var id = rand.substring(rand.indexOf('.') + 1);
    debugger;
    var url = window.location.protocol + '//' + window.location.host;
    options.url = url + options.url;
    id = "tab_" + options.id;
    var active_flag = false;
    if($("#" + id)){
        active_flag = $("#" + id).hasClass('active');
    }
    $(".active").removeClass("active");
    //如果TAB不存在，创建一个新的TAB
    if (!$("#" + id)[0]) {
        //固定TAB中IFRAME高度
        mainHeight = $(document.body).height();
        //创建新TAB的title
        title = '<li role="presentation" id="tab_' + id + '"><a href="#' + id + '" aria-controls="' + id + '" role="tab" data-toggle="tab"><i class="'+options.icon+'"></i>' + options.title;
        //是否允许关闭
        if (options.close) {
            title +=  '<i class="glyphicon glyphicon-remove-sign" tabclose="' + id + '"></i>';
        }
        title += '</a></li>';
        //是否指定TAB内容
        if (options.content) {
            content = '<div role="tabpanel" class="tab-pane" id="' + id + '">' + options.content + '</div>';
        } else {//没有内容，使用IFRAME打开链接
            content = '<div role="tabpanel" class="tab-pane" id="' + id + '"><iframe id="iframe_'+id+'" src="' + options.url + 
                '" width="100%" height="100%" onload="changeFrameHeight(this)" frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="yes" allowtransparency="yes"></iframe></div>';
        }
        //加入TABS
        $(".nav-tabs").append(title);
        $(".tab-content").append(content);
    }else{
        if(active_flag){
            $("#iframe_" + id).attr('src', $("#iframe_" + id).attr('src'));
        }
    }
    //激活TAB
    $("#tab_" + id).addClass('active');
    $("#" + id).addClass("active");

};

//自适应高度
var changeFrameHeight = function (that) {
    $(that).height(document.documentElement.clientHeight - 115);
    $(that).parent(".tab-pane").height(document.documentElement.clientHeight - 190);
}
var closeTab = function (id) {
    //如果关闭的是当前激活的TAB，激活他的前一个TAB
    if ($("li.active").attr('id') == "tab_" + id) {
        $("#tab_" + id).prev().addClass('active');
        $("#" + id).prev().addClass('active');
    }
    //关闭TAB
    $("#tab_" + id).remove();
    $("#" + id).remove();
};


$(function () {
    $("[addtabs]").click(function () {
        addTabs({ id: $(this).attr("id"), title: $(this).attr('title'), close: true });
    });

    $(".nav-tabs").on("click", "[tabclose]", function (e) {
        id = $(this).attr("tabclose");
        closeTab(id);
    });

    window.onresize = function () {
        var target = $(".tab-content .active iframe");
        changeFrameHeight(target);
    }
});

