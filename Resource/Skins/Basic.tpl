<!-- 此为基准模版，请使用标准 UTF-8 编码 -->

[页面属性]<!DOCTYPE html>
<html lang="cmn-Hans">
<head>
	<meta charset="utf-8">
	<title>{标题}</title>
	<link rel="shortcut icon" href="/Resource/Images/favicon.ico">
    <link href="/Resource/css/bootstrap.css" rel="stylesheet">
	<link href="/Resource/css/bt-theme.css" rel="stylesheet">
	<link href="/Resource/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
    <link href="/Resource/css/main.css" rel="stylesheet">
	<link href="/Resource/css/jquery-ui.min.css" rel="stylesheet">
    <script src="/Resource/js/jquery.js"></script>
    <script src="/Resource/js/mustache.js"></script>
</head>
[/页面属性]

[页顶导航]
    <!-- 头部-->
    <header>
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container-fluid">

                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#nav-menu-list">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>

                    <a class="navbar-brand pd-5" href="javascript:;"><img alt="XYT" src="/Resource/Images/logo.png"></a>
                    <p class="navbar-text">迅易通 <small>xytinc.com</small></p>
                </div>

                <div class="collapse navbar-collapse" id="nav-menu-list">
                    <!-- 菜单列表-->
                    <ul id="nav-list" class="nav navbar-nav"></ul>

                    <!-- 用户信息，与网站操作-->
                    <ul id="user-mess" class="nav navbar-nav navbar-right">
                        <li><a href="javascript:;"><span class="glyphicon glyphicon-user"></span>：<strong>{UID}</strong></a></li>
                        <!-- <li><a href="javascript:;"><button id="basic-magBtn" type="button" class="btn btn-default btn-xs" data-toggle="modal" data-target="#basic-modal"><span class="glyphicon glyphicon-envelope"></span> 0</button></a></li>
                        <li><a href="javascript:;"><button id="create-magBtn" type="button" class="btn btn-default btn-xs" data-toggle="modal" data-target="#create-modal"><span class="glyphicon glyphicon-plus" title="新建工单"></span></button></a></li> -->
                        <li><a href="javascript:;"><time></time></a></li>
                        <li title="设置" class="dropdown">
                            <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-cog"></span></a>
                            <ul class="dropdown-menu dropdown-menu-right">
                                <li><a href="#">个人信息</a></li>
                                <li><a href="/User/SetPassWord.aspx">修改密码</a></li>
                                <li class="divider"></li>
                                <li><a href="/Logout.aspx">退出</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>

            <!-- 面包屑-->
            <ol class="breadcrumb">
                <li><span class="glyphicon glyphicon-send"></span></li>
                <li>{模型}</li>
                <li><a href={功能地址}>{功能}</a></li>
                <li class="active">{操作}</li>
            </ol>
        </nav>
    </header>

    <div style="margin-top: 100px;"></div>

    <!-- 加载图片-->
    <div id="loading">
        <img src="/Resource/Images/loading.gif">
    </div>
    
    <!-- 消息列表模态框 -->
    <div id="basic-modal" class="modal fade" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button class="close" type="button" data-dismiss="modal">x</button>
                    <h4 class="modal-title">消息列表</h4>
                </div>
                <div class="modal-body maxH800">
                    <table class="table table-striped table-bordered table-hover table-condensed">
                        <thead>
                            <tr>
                                <th>编号</th>
                                <th>消息</th>
                                <th>时间</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!-- 新建工单 -->
    <div id="create-modal" class="modal fade" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button class="close" type="button" data-dismiss="modal">x</button>
                    <h4 class="modal-title">新建工单</h4>
                </div>
                <div class="modal-body">
                    <div style="width: 250px; margin: 0 auto;">
                        <!-- 工单详情 -->
                        <form id="word-from" class="form-horizontal" action="javascript:;">
                            <!-- 工单号 -->
                            <div class="form-group orderid">
                                <label data-id="orderID"></label>
                            </div>
                            <hr />

                            <!-- 召唤 -->
                            <div class="form-group atList">
                            <label><span data-toggle="collapse" data-target="#shareList" class="glyphicon glyphicon-circle-arrow-down poi"></span>&nbsp;&nbsp;Send To:</label>
                            </div>
                            <div class="form-group formMinheight">
                                <input id="work-send" class="form-control" type="text" placeholder="@一个人或者#一个组织" style="width:250px;" />
                                <div class="prompt prompt-send hidden" style="width:250px;">
                                    <ul class="list-group"></ul>
                                </div>
                                <span class="text-danger"></span>
                            </div>

                            <div id="shareList" class="collapse">
                            <hr />
                                <!-- 分享 -->
                                <div class="form-group shareList">
                                <label>Share To:</label>
                                </div>
                                <div class="form-group formMinheight">
                                    <input id="work-share" class="form-control" type="text" placeholder="@一个人或者#一个组织" style="width:250px;" />
                                    <div class="prompt prompt-share hidden" style="width:250px;">
                                        <ul class="list-group"></ul>
                                    </div>
                                    <span class="text-danger"></span>
                                </div>
                                <hr />
                            </div>

                            <!-- Note -->
                            <div class="form-group noteLite">
                                <label>Note:</label>
                                <textarea class="form-control" name="note" rows="5" style="width:250px;"></textarea>
                            </div>
                            <hr />


                            <!-- 附件 -->
                            <div class="form-group attachments">
                                <label>Attachments:</label>
                            </div>
                            <div class="form-group attachments">
                                <input type="file" id="StrFile" name="StrFile" multiple="multiple" />
                            </div>
                        </form>
                    </div>
                </div>
                <div class="panel-footer clearfix">
                    <button id="work-btn" class="btn btn-default pull-right" type="button">提交</button>
                </div>
            </div>
        </div>
    </div>

    <!-- 消息列表 -->
    <template id="temp-basic">
        {{#DataList}}
        <tr>
            <td>{{DataID}}</td>
            <td>{{Remark}}</td>
            <td>{{Date}}</td>
            <td data-val="{{DataID}}"><a href="{{Url}}" target="_blank"><span class="glyphicon glyphicon-eye-open poi" title="点击查看这条消息"></span></a>&nbsp;&nbsp;<span class="glyphicon glyphicon-ok poi" style="color: rgb(108, 198, 95);" title="我知道了"></span></td>
        </tr>
        {{/DataList}}
    </template>
[/页顶导航]

[页面底部]
    <footer class="text-center hidden"><iframe ID="__Sys_Rpc_MiniCall__"  name="__Sys_Rpc_MiniCall__"></iframe></footer>
    <script src="/Resource/js/jquery.js"></script>
    <script src="/Resource/js/bootstrap.js"></script>
    <script src="/Resource/js/validate.js"></script>
    <script src="/Resource/js/Menu.js"></script>
    <script src="/Resource/js/common.js"></script>
    <script src="/Resource/js/ajaxfileupload.js"></script>

    <script>
        $(function(){
            'use strict';

            // var I_UID = {UID};
            // // 获取未确认的消息条数， 每10秒一次
            // (function(){
            //     var $userMess = $('#user-mess');
            //     function getMes(){
            //         $.ajax({
            //             url: '/message/API/?Do=GetCount',
            //             type: 'get',
            //             dataType: 'json',
            //             data: {
            //                 UID: I_UID
            //             },
            //             success: function(data){
            //                 $userMess.find('li:eq(1) button').html('<span class="glyphicon glyphicon-envelope"></span> ' + data.Count);
            //             }
            //         });
            //     }
            //     // 先执行一次后，之后每10秒获取一次
            //     getMes();
            //     // setInterval(getMes, 10000); //暂时暂停这项功能
            // })();

            // 消息列表
            // (function(){
            //     var $BasicModal = $('#basic-modal'),
            //         $spanEyes = $BasicModal.find('tbody .glyphicon-eye-open'),
                    
            //         $BasicMagBtn = $('#basic-magBtn'),
            //         tempBasic = $('#temp-basic').html();

            //     // 获取未确认的消息列表
            //     $BasicMagBtn.on('click', function(){
            //         $.ajax({
            //             url: '/message/API/?Do=GetList',
            //             dataType: 'json',
            //             type: 'get',
            //             data: {
            //                 UID: I_UID
            //             },
            //             success: function(data){
            //                 $BasicModal.find('tbody').html(Mustache.render(tempBasic, data));

            //                 // 确定消息
            //                 var $spanOk = $BasicModal.find('tbody .glyphicon-ok'),
            //                     $spanOpen = $BasicModal.find('tbody .glyphicon-eye-open');
            //                 $BasicModal.find('tbody tr').each(function(){
            //                     var ts = $(this),
            //                         did = $.trim(ts.find('td:eq(0)').text());

            //                     // 确认消息
            //                     ts.find('.glyphicon-ok').on('click', function(){
            //                         $.ajax({
            //                             url: '/message/API/?Do=Confirm',
            //                             type: 'post',
            //                             data: {
            //                                 DataID: did,
            //                                 UID: I_UID
            //                             },
            //                             success: function(data){
            //                                 common.alert({
            //                                     type: 'success',
            //                                     title: '确认消息',
            //                                     msg: data.message || '成功。',
            //                                     cb: function(){
            //                                        ts.closest('tr').remove(); 
            //                                     }
            //                                 });
            //                             }
            //                         });
            //                     });

            //                     // 查看消息
            //                     ts.find('.glyphicon-eye-open').on('click', function(){
            //                         $.ajax({
            //                             url: '/message/API/?Do=Confirm',
            //                             type: 'post',
            //                             data: {
            //                                 DataID: did,
            //                                 UID: I_UID
            //                             },
            //                             success: function(data){
            //                                     ts.closest('tr').remove(); 
            //                             }
            //                         });
            //                     });
            //                 });
            //             }
            //         });
            //     });
            // })();

            // 新建工单
            // (function(){
            //     var $orderid = $('.orderid').find('label'),
            //         $workForm = $('#word-from'),
            //         $workSend = $('#work-send'),
            //         $sendPromptDiv = $('.prompt-send'),
            //         $atList = $('.atList'),
            //         $workShare = $('#work-share'),
            //         $sharePromptDiv = $('.prompt-share'),
            //         $shareList = $('.shareList'),
            //         $note = $('.noteLite'),
            //         $workBtn = $('#work-btn'),
            //         allMenbers = [],    //成员数组
            //         allpounds = [],     //团队数组
            //         keySelect = null,   //按键定位
            //         setHeight = null;   //滚动条高度

            //     // 获取团队数据
            //     common.ajax({
            //         title: '获取团队数据',
            //         URL: '/user/API/?Do=GetDivisionList',
            //         good: function(data){
            //             var d = data;
            //             //遍历团队，添加进数组
            //             $.each(d.DataList, function(i, n){
            //                 allpounds[i] = n.Name;
            //             });
            //         }
            //     });

            //     // 获取成员数据
            //     common.ajax({
            //         title: '获取成员数据',
            //         URL: '/user/API/?Do=GetUserList',
            //         good: function(data){
            //             var d = data;
            //             //遍历成员，添加进数组
            //             $.each(d.DataList, function(i, n){
            //                 allMenbers[i] = n.TrueName;
            //             });
            //         }
            //     });

            //     //获取工单号
            //     $.ajax({
            //         url: '/Ticket/API/?Do=Post',
            //         data: { UID: I_UID },
            //         type: 'post',
            //         dataType: 'json',
            //         success: function(data){
            //             var d = data.OrderID;
            //             $orderid.text("工单号：" + d);
            //             $orderid.attr("data-val", d);
            //         }
            //     });

            //     // 工单创建提交时序列化文本
            //     var workJson = function(){
            //         var postjson = {},
            //             $hidPost = $workForm.find('input[name="PostName"]'),
            //             $hidShare = $workForm.find('input[name="ShareName"]');
            //         postjson.OrderID = $orderid.data('val');
            //         postjson.UID = I_UID;
            //         postjson.SentTo = [];
            //         postjson.ShareTo = [];
            //         postjson.Note = $note.find('textarea').val();
            //         $hidPost.each(function(i){
            //             var ts = $(this);
            //             postjson.SentTo.push({Name : ts.val()});
            //         });
            //         $hidShare.each(function(i){
            //             var ts = $(this);
            //             postjson.ShareTo.push({Name : ts.val()});
            //         });
            //         return JSON.stringify(postjson);
            //     };

            //     // 提交
            //     $workBtn.on('click', function(){
                    
            //         // 文本内容上传
            //         var textJson = workJson(),
            //             fileName = $('#StrFile').attr('name');
            //         $.ajax({
            //             type: 'post',
            //             url: '/Ticket/API/?Do=Create',
            //             data: textJson,
            //             success: function(data, status, e){
            //                 // 文本上传成功后上传文件
            //                 common.ajaxFE({
            //                     title: '工单附件上传',
            //                     URL: '/Ticket/API/?Do=Upload',
            //                     FE: 'StrFile',
            //                     dataType: 'json',
            //                     type: 'post',
            //                     data: {
            //                         OrderID: $orderid.data('val'),
            //                         UID: I_UID,
            //                         StrFile: fileName
            //                     },
            //                     ok: function(data, status, e){
            //                         common.alert({
            //                             type: 'success',
            //                             title: '[工单创建]操作：',
            //                             msg: data.Message || '失败！提示：' + e
            //                         });
            //                         setTimeout(function() {
            //                             location.href="/Ticket/?Do=MyTicket";
            //                         }, 1000);
            //                     },
            //                     no: function(data, status, e){
            //                         console.log("这里是no" + e);
            //                     }
            //                 });
            //             },
            //             error: function(data, status, e){
            //                 console.log(e);
            //             }
            //         });

            //     });

            //     if ($workSend.length > 0) { //如果获取元素为空，则不执行召唤程序
            //         // SendTo模块召唤处理
            //         common.at.inputCheck($workSend, $atList, $workForm, $sendPromptDiv, keySelect, setHeight, allMenbers, allpounds, "PostName");
            //         common.at.keydownFun($workSend, $atList, $workForm, $sendPromptDiv, keySelect, setHeight, "PostName");
            //         common.at.removeMate($atList, $workForm);

            //         // shareTo模块召唤处理
            //         common.at.inputCheck($workShare, $shareList, $workForm, $sharePromptDiv, keySelect, setHeight, allMenbers, allpounds, "ShareName");
            //         common.at.keydownFun($workShare, $shareList, $workForm, $sharePromptDiv, keySelect, setHeight, "ShareName");
            //         common.at.removeMate($shareList, $workForm);
            //     }

            // })();

        });
    </script>
[/页面底部]

[模式弹窗]
<!DOCTYPE html>
<html lang="cmn-Hans">
    <head>
        <meta charset="utf-8">
        <title>{标题}</title>
        <link rel="shortcut icon" href="/Resource/Images/favicon.ico">
        <link href="/Resource/css/bootstrap.css" rel="stylesheet">
    </head>
    <body>
        <div id="message" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                        <h4 class="modal-title">{标题}</h4>
                    </div>
                    <div class="modal-body">
                        <ol class="text-info">
                            {消息内容}
                        </ol>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">返回</button>
                    </div>
                </div>
            </div>
        </div>
        <script src="/Resource/js/jquery.js"></script>
        <script src="/Resource/js/bootstrap.js"></script>
        <script>
            $(function () {
                var $mess = $('#message');
                $mess.modal({ // 自动弹出
                    show: true,
                    backdrop: false
                }).on('hidden.bs.modal', function (e) { // 关闭事件
                    history.back();
                });
            });
        </script>
    </body>
</html>
[/模式弹窗]

