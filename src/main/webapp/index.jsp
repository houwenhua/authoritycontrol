<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2018/9/17
  Time: 13:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> <!--输出,条件,迭代标签库-->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="fmt"%> <!--数据格式化标签库-->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="sql"%> <!--数据库相关标签库-->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="fn"%> <!--常用函数标签库-->
<%@ page isELIgnored="false"%> <!--支持EL表达式，不设的话，EL表达式不会解析-->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>权限管理系统</title>

    <meta name="description" content="with draggable and editable events" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

    <!-- bootstrap & fontawesome -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="assets/font-awesome/4.5.0/css/font-awesome.min.css" />

    <!-- page specific plugin styles -->
    <link rel="stylesheet" href="assets/css/jquery-ui.custom.min.css" />
    <link rel="stylesheet" href="assets/css/fullcalendar.min.css" />

    <!-- text fonts -->
    <link rel="stylesheet" href="assets/css/fonts.googleapis.com.css" />

    <!-- ace styles -->
    <link rel="stylesheet" href="assets/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />

    <!--[if lte IE 9]>
    <link rel="stylesheet" href="assets/css/ace-part2.min.css" class="ace-main-stylesheet" />
    <![endif]-->
    <link rel="stylesheet" href="assets/css/ace-skins.min.css" />
    <link rel="stylesheet" href="assets/css/ace-rtl.min.css" />

    <!--[if lte IE 9]>
    <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
    <![endif]-->

    <link rel="stylesheet" href="css/bootstrap-tab.css" />
    <link rel="stylesheet" href="css/font-awesome.min.css" />

    <!-- inline styles related to this page -->

    <!-- ace settings handler -->
    <script src="assets/js/ace-extra.min.js"></script>

    <!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

    <!--[if lte IE 8]>
    <script src="assets/js/html5shiv.min.js"></script>
    <script src="assets/js/respond.min.js"></script>
    <![endif]-->
    <style>
        .nav-tabs li {
            box-sizing: border-box;
        }
        .nav-tabs li a {
            border-radius: 10px;
        }
        .tab-content {
            border-left: 0px;
            border-right: 0px;
            border-bottom: 0px;
            height: 100%;
            padding:0px;
        }
        .glyphicon {
            margin-left:3px;
        }
        .nav-tabs li a.glyphicon-remove-sign:hover{
            　　color:red;
            　　cursor: pointer;
        }
    </style>
</head>

<body class="no-skin">
<div id="navbar" class="navbar navbar-default          ace-save-state">
    <div class="navbar-container ace-save-state" id="navbar-container">

        <div class="navbar-header pull-left">
            <a href="index.jsp" class="navbar-brand">
                <small>
                    <i class="fa fa-leaf"></i>
                    商店管理系统
                </small>
            </a>
        </div>

        <div class="navbar-buttons navbar-header pull-right" role="navigation">
            <ul class="nav ace-nav">
                <li class="light-blue dropdown-modal">
                    <a data-toggle="dropdown" href="#" class="dropdown-toggle">
                        <img class="nav-user-photo" src="assets/images/avatars/avatar4.png" alt="Jason's Photo" />
                        <span class="user-info">
									<small>欢迎,</small>
									${activeUser.username}
								</span>
                    </a>
                </li>
            </ul>
        </div>
    </div><!-- /.navbar-container -->
</div>

<div class="main-container ace-save-state" id="main-container">
    <script type="text/javascript">
        try{ace.settings.loadState('main-container')}catch(e){}
    </script>

    <div class="sidebar" id="sidebar">
        <%--四个装饰按钮--%>
        <div class="sidebar-shortcuts" id="sidebar-shortcuts">
            <div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
                <button class="btn btn-success">
                    <i class="ace-icon fa fa-signal"></i>
                </button>

                <button class="btn btn-info">
                    <i class="ace-icon fa fa-pencil"></i>
                </button>

                <button class="btn btn-warning">
                    <i class="ace-icon fa fa-users"></i>
                </button>

                <button class="btn btn-danger">
                    <i class="ace-icon fa fa-cogs"></i>
                </button>
            </div>

            <div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
                <span class="btn btn-success"></span>

                <span class="btn btn-info"></span>

                <span class="btn btn-warning"></span>

                <span class="btn btn-danger"></span>
            </div>
        </div><!-- /.sidebar-shortcuts -->
            <%--四个装饰按钮--%>
        <ul class="nav nav-list" id="menu"></ul>
        <div class="sidebar-collapse" id="sidebar-collapse">
            <i class="icon-double-angle-left" data-icon1="icon-double-angle-left" data-icon2="icon-double-angle-right"></i>
        </div>
        <div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
            <i id="sidebar-toggle-icon" class="ace-icon fa fa-angle-double-left ace-save-state" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
        </div>
    </div>


    <%--<div class="main-content">
        <div class="main-content-inner">
            <!--导航标签-->
            <div class="breadcrumbs ace-save-state" id="breadcrumbs">
                <ul class="breadcrumb">
                    <li>
                        <i class="ace-icon fa fa-home home-icon"></i>
                        <a href="index.jsp">主页</a>
                    </li>
                    <li class="active">仪表板</li>
                </ul><!-- /.breadcrumb -->
            </div>

            <div class="page-content">

                <!--第二层导航标签-->
                <div class="page-header">
                    <h1>
                        仪表板
                        <small>
                            <i class="ace-icon fa fa-angle-double-right"></i>
                            欢迎页
                        </small>
                    </h1>
                </div><!-- /.page-header -->

                <div class="row">
                    <div class="col-xs-12">
                        <!-- PAGE CONTENT BEGINS --><!--主内容位置-->
                        <div class="row">
                            <div class="col-sm-9">
                                <div class="space"></div>

                                <div id="calendar"></div>
                            </div>

                            <div class="col-sm-3">
                                <div class="widget-box transparent">
                                    <div class="widget-header">
                                        <h4>Draggable events</h4>
                                    </div>

                                    <div class="widget-body">
                                        <div class="widget-main no-padding">
                                            <div id="external-events">
                                                <div class="external-event label-grey" data-class="label-grey">
                                                    <i class="ace-icon fa fa-arrows"></i>
                                                    My Event 1
                                                </div>

                                                <div class="external-event label-success" data-class="label-success">
                                                    <i class="ace-icon fa fa-arrows"></i>
                                                    My Event 2
                                                </div>

                                                <div class="external-event label-danger" data-class="label-danger">
                                                    <i class="ace-icon fa fa-arrows"></i>
                                                    My Event 3
                                                </div>

                                                <div class="external-event label-purple" data-class="label-purple">
                                                    <i class="ace-icon fa fa-arrows"></i>
                                                    My Event 4
                                                </div>

                                                <div class="external-event label-yellow" data-class="label-yellow">
                                                    <i class="ace-icon fa fa-arrows"></i>
                                                    My Event 5
                                                </div>

                                                <div class="external-event label-pink" data-class="label-pink">
                                                    <i class="ace-icon fa fa-arrows"></i>
                                                    My Event 6
                                                </div>

                                                <div class="external-event label-info" data-class="label-info">
                                                    <i class="ace-icon fa fa-arrows"></i>
                                                    My Event 7
                                                </div>

                                                <label>
                                                    <input type="checkbox" class="ace ace-checkbox" id="drop-remove" />
                                                    <span class="lbl"> Remove after drop</span>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- PAGE CONTENT ENDS --><!--主内容位置-->
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.page-content -->
        </div>
    </div>--%><!-- /.main-content -->
    <div class="main-content">
        <div class="page-content">
            <div class="row">
                <div class="col-xs-12" style="padding-left:5px;">
                    <ul class="nav nav-tabs" role="tablist">
                        <li class="active">
                            <a href="#Index" role="tab" data-toggle="tab"><span style="margin-right: 4px;" class="glyphicon glyphicon-home" aria-hidden="true"></span>首页</a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane active" id="Index">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="footer">
        <div class="footer-inner">
            <div class="footer-content">
						<span class="bigger-120">
							<span class="blue bolder">商店管理系统</span>
							 &copy; 2013-2018
						</span>
            </div>
        </div>
    </div>

    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
        <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
    </a>
</div><!-- /.main-container -->

<!-- basic scripts -->

<!--[if !IE]> -->
<script src="assets/js/jquery-2.1.4.min.js"></script>

<!-- <![endif]-->

<!--[if IE]>
<script src="assets/js/jquery-1.11.3.min.js"></script>
<![endif]-->
<script type="text/javascript">
    if('ontouchstart' in document.documentElement) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
</script>
<script src="assets/js/bootstrap.min.js"></script>

<!-- page specific plugin scripts -->
<script src="assets/js/jquery-ui.custom.min.js"></script>
<script src="assets/js/jquery.ui.touch-punch.min.js"></script>
<script src="assets/js/moment.min.js"></script>
<script src="assets/js/fullcalendar.min.js"></script>
<script src="assets/js/bootbox.js"></script>

<!-- ace scripts -->
<script src="assets/js/ace-elements.min.js"></script>
<script src="assets/js/ace.min.js"></script>

<script src="js/sidebar-menu.js"></script>
<script src="js/bootstrap-tab.js" ></script>

<script type="text/javascript" >
    $(function () {
        $('#menu').sidebarMenu({
            data: [{
                id: '1',
                text: '系统设置',
                icon: 'menu-icon fa fa-tachometer',
                url: 'useritem.jsp',
                menus: [{
                    id: '11',
                    text: '编码管理',
                    icon: 'ace-icon fa fa-book',
                    url: '/wecome.jsp'
                }]
            }, {
                id: '2',
                text: '基础数据',
                icon: 'menu-icon fa fa-pencil-square-o',
                url: '',
                menus: [{
                    id: '21',
                    text: '基础特征',
                    icon: 'icon-glass',
                    url: '/useritem.jsp'
                }, {
                    id: '22',
                    text: '特征管理',
                    icon: 'icon-glass',
                    url: '/BasicData/Features/Index'
                }, {
                    id: '23',
                    text: '物料维护',
                    icon: 'icon-glass',
                    url: '/Model/Index'
                }, {
                    id: '24',
                    text: '站点管理',
                    icon: 'icon-glass',
                    url: '/Station/Index'
                }]
            }, {
                id: '3',
                text: '权限管理',
                icon: 'menu-icon fa fa-bookmark-o',
                url: '',
                menus: [{
                    id: '31',
                    text: '用户管理',
                    icon: 'icon-user',
                    url: '/SystemSetting/User'
                }, {
                    id: '32',
                    text: '角色管理',
                    icon: 'icon-apple',
                    url: '/SystemSetting/Role'
                }, {
                    id: '33',
                    text: '菜单管理',
                    icon: 'icon-list',
                    url: '/SystemSetting/Menu'
                }, {
                    id: '34',
                    text: '部门管理',
                    icon: 'icon-glass',
                    url: '/SystemSetting/Department'
                }]
            }, {
                id: '4',
                text: '订单管理',
                icon: 'icon-envelope',
                url: '',
                menus: [{
                    id: '41',
                    text: '订单查询',
                    icon: 'icon-glass',
                    url: '/Order/Query'
                }, {
                    id: '42',
                    text: '订单排产',
                    icon: 'icon-glass',
                    url: '/Order/PLANTPRODUCT'
                }, {
                    id: '43',
                    text: '订单撤排',
                    icon: 'icon-glass',
                    url: '/Order/cancelPRODUCT'
                }, {
                    id: '44',
                    text: '订单HOLD',
                    icon: 'icon-glass',
                    url: '/Order/hold'
                }, {
                    id: '45',
                    text: '订单删除',
                    icon: 'icon-glass',
                    url: '/Order/delete'
                }, {
                    id: '47',
                    text: '订单插单',
                    icon: 'icon-glass',
                    url: '/Order/insertorder'
                }, {
                    id: '48',
                    text: '订单导入',
                    icon: 'icon-glass',
                    url: '/Order/Import'
                }]
            }]
        });
    });
</script>

<!-- inline scripts related to this page -->
<script type="text/javascript">
    jQuery(function($) {

        /* initialize the external events
            -----------------------------------------------------------------*/

        $('#external-events div.external-event').each(function() {

            // create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
            // it doesn't need to have a start or end
            var eventObject = {
                title: $.trim($(this).text()) // use the element's text as the event title
            };

            // store the Event Object in the DOM element so we can get to it later
            $(this).data('eventObject', eventObject);

            // make the event draggable using jQuery UI
            $(this).draggable({
                zIndex: 999,
                revert: true,      // will cause the event to go back to its
                revertDuration: 0  //  original position after the drag
            });

        });




        /* initialize the calendar
        -----------------------------------------------------------------*/

        var date = new Date();
        var d = date.getDate();
        var m = date.getMonth();
        var y = date.getFullYear();


        var calendar = $('#calendar').fullCalendar({
            //isRTL: true,
            //firstDay: 1,// >> change first day of week

            buttonHtml: {
                prev: '<i class="ace-icon fa fa-chevron-left"></i>',
                next: '<i class="ace-icon fa fa-chevron-right"></i>'
            },

            header: {
                left: 'prev,next today',
                center: 'title',
                right: 'month,agendaWeek,agendaDay'
            },
            events: [
                {
                    title: 'All Day Event',
                    start: new Date(y, m, 1),
                    className: 'label-important'
                },
                {
                    title: 'Long Event',
                    start: moment().subtract(5, 'days').format('YYYY-MM-DD'),
                    end: moment().subtract(1, 'days').format('YYYY-MM-DD'),
                    className: 'label-success'
                },
                {
                    title: 'Some Event',
                    start: new Date(y, m, d-3, 16, 0),
                    allDay: false,
                    className: 'label-info'
                }
            ]
            ,

            /**eventResize: function(event, delta, revertFunc) {

			alert(event.title + " end is now " + event.end.format());

			if (!confirm("is this okay?")) {
				revertFunc();
			}

		},*/

            editable: true,
            droppable: true, // this allows things to be dropped onto the calendar !!!
            drop: function(date) { // this function is called when something is dropped

                // retrieve the dropped element's stored Event Object
                var originalEventObject = $(this).data('eventObject');
                var $extraEventClass = $(this).attr('data-class');


                // we need to copy it, so that multiple events don't have a reference to the same object
                var copiedEventObject = $.extend({}, originalEventObject);

                // assign it the date that was reported
                copiedEventObject.start = date;
                copiedEventObject.allDay = false;
                if($extraEventClass) copiedEventObject['className'] = [$extraEventClass];

                // render the event on the calendar
                // the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
                $('#calendar').fullCalendar('renderEvent', copiedEventObject, true);

                // is the "remove after drop" checkbox checked?
                if ($('#drop-remove').is(':checked')) {
                    // if so, remove the element from the "Draggable Events" list
                    $(this).remove();
                }

            }
            ,
            selectable: true,
            selectHelper: true,
            select: function(start, end, allDay) {

                bootbox.prompt("New Event Title:", function(title) {
                    if (title !== null) {
                        calendar.fullCalendar('renderEvent',
                            {
                                title: title,
                                start: start,
                                end: end,
                                allDay: allDay,
                                className: 'label-info'
                            },
                            true // make the event "stick"
                        );
                    }
                });


                calendar.fullCalendar('unselect');
            }
            ,
            eventClick: function(calEvent, jsEvent, view) {

                //display a modal
                var modal =
                    '<div class="modal fade">\
                      <div class="modal-dialog">\
                       <div class="modal-content">\
                         <div class="modal-body">\
                           <button type="button" class="close" data-dismiss="modal" style="margin-top:-10px;">&times;</button>\
                           <form class="no-margin">\
                              <label>Change event name &nbsp;</label>\
                              <input class="middle" autocomplete="off" type="text" value="' + calEvent.title + '" />\
					 <button type="submit" class="btn btn-sm btn-success"><i class="ace-icon fa fa-check"></i> Save</button>\
				   </form>\
				 </div>\
				 <div class="modal-footer">\
					<button type="button" class="btn btn-sm btn-danger" data-action="delete"><i class="ace-icon fa fa-trash-o"></i> Delete Event</button>\
					<button type="button" class="btn btn-sm" data-dismiss="modal"><i class="ace-icon fa fa-times"></i> Cancel</button>\
				 </div>\
			  </div>\
			 </div>\
			</div>';


                var modal = $(modal).appendTo('body');
                modal.find('form').on('submit', function(ev){
                    ev.preventDefault();

                    calEvent.title = $(this).find("input[type=text]").val();
                    calendar.fullCalendar('updateEvent', calEvent);
                    modal.modal("hide");
                });
                modal.find('button[data-action=delete]').on('click', function() {
                    calendar.fullCalendar('removeEvents' , function(ev){
                        return (ev._id == calEvent._id);
                    })
                    modal.modal("hide");
                });

                modal.modal('show').on('hidden', function(){
                    modal.remove();
                });


                //console.log(calEvent.id);
                //console.log(jsEvent);
                //console.log(view);

                // change the border color just for fun
                //$(this).css('border-color', 'red');

            }

        });


    })
</script>
</body>
</html>

