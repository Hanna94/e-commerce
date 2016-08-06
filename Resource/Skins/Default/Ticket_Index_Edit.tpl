{页面属性}{/页面属性}
<body>
    {页顶导航}{/页顶导航}
    <!-- 内容-->
    <div id="data-list" class="container-fluid">
        <div class="panel panel-default maxW1280 center-block">
            <div class="panel-heading">
                <h4 class="panel-title">工单详情
                <button id="logBtn" class="btn btn-default btn-xs pull-right" data-toggle="modal" data-target="#modal-Log">Log</button>
                <button id="MarkTicket" class="btn btn-default btn-xs pull-right"></button>
                </h4>

            </div>
            <div class="panel-body">

                <!-- 状态 -->
                <div id="edit-stma" class="form-group">
                    <span class="label label-default pull-right">发起</span>
                </div>

                <!-- 发起人 -->
                <div id="edit-from" class="form-group"></div>

                <!-- 记录 -->
                <div id="edit-note" class="form-group">
                    <label>Note</label>
                    <button class="btn btn-default btn-xs pull-right" data-toggle="modal" data-target="#modal-Note"><span class="glyphicon glyphicon-pencil"></span></button>
                    <table class="table table-striped table-bordered table-hover table-condensed">
                        <tbody></tbody>
                    </table>
                </div>

                <!-- 附件 -->
                <div id="edit-att" class="form-group"></div>

                <!-- 反馈 -->
                <div id="edit-exe" class="form-group">
                    <label>Execute</label><button class="btn btn-default btn-xs pull-right" data-toggle="modal" data-target="#modal-Execute"><span class="glyphicon glyphicon-pencil"></span></button>
                    <table class="table table-striped table-bordered table-hover table-condensed">
                        <tbody>
                            <tr>
                                <td>工单进行中...</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <hr />

                <!-- 谈论 -->
                <div id="edit-rep" class="form-group">
                    <label>Reply</label>
                    <form class="form-horizontal" action="javascript:;">
                        <div class="input-group input-group-sm">
                            <textarea rows="1" name="Remark" class="form-control"></textarea>
                            <span class="input-group-btn">
                                <input type="submit" class="btn btn-default" value="提交" />
                                <input type="reset" class="btn btn-default hidden" value="取消" />
                            </span>
                        </div>
                        <span class="text-danger">提示：如果在IE浏览器下排版混乱，且无法使用编辑和删除功能，请酌情使用谷歌、火狐等其他浏览器。</span>
                    </form>
                    <div class="maxH300 mg-t-10">
                        <table class="table table-striped table-condensed">
                            <tbody></tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 编写Note模态框 -->
    <div class="modal fade" id="modal-Note">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button class="close" type="button" data-dismiss="modal">x</button>
                    <h5 class="modal-title">Add Note</h5>
                </div>
                <div class="modal-body">
                    <div class="input-group input-group-sm">
                        <textarea name="Note" cols="30" rows="1" class="form-control"></textarea>
                        <span class="input-group-btn">
                            <input type="submit" class="btn btn-default" data-dismiss="modal" value="提交" />
                        </span>
                    </div>
                    <span class="text-danger">提示：该功能提交后不可更改，请谨慎填写。</span>
                </div>
            </div>
        </div>
    </div>

    <!-- Log模态框 -->
    <div class="modal fade" id="modal-Log">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button class="close" type="button" data-dismiss="modal">x</button>
                    <h5 class="modal-title">操作记录</h5>
                </div>
                <div class="modal-body maxH600">
                    <table class="table table-striped table-bordered table-hover table-condensed">
                        <colgroup>
                            <col width="55">
                            <col width="340">
                            <col>
                        </colgroup>
                        <thead>
                            <tr>
                                <th>用户</th>
                                <th>内容</th>
                                <th>时间</th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!-- 结束/完成工单模态框 -->
    <div class="modal fade" id="modal-Execute">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button class="close" type="button" data-dismiss="modal">x</button>
                    <h5 class="modal-title">工单状态更改</h5>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>请选择完成程度</label>
                        <label class="checkbox-inline">
                            <input type="radio" name="Status" value="完成" checked="checked"/>完成
                        </label>
                        <label class="checkbox-inline">
                            <input type="radio" name="Status" value="结束" />结束
                        </label>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="说点什么..." />
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-default" type="button" data-dismiss="modal">确认</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Log -->
    <template id="tm-log">
        {{#Log}}
        <tr>
            <td>{{Name}}</td>
            <td>{{Remark}}</td>
            <td>{{Date}}</td>
        </tr>
        {{/Log}}
    </template>

    <!-- From -->
    <template id="tm-from">
        {{#Ticket}}
        <label>DataID：{{DataID}}</label><br />
        <label>From：{{Name}}</label><br />
        <label>Sent To：{{SentTo}}</label><br />
        <label>Share To：{{ShareTo}}</label>
        <input name="DataID" type="hidden" value="{{DataID}}" />
        <input name="UID" type="hidden" value="{{UID}}" />
        {{/Ticket}}
    </template>

    <!-- Note -->
    <template id="tm-note">
        {{#Ticket}}
        <tr data-uid="{{UID}}">
            <td>
                <span>{{Note}}</span>&nbsp;&nbsp;
                <span style="font-size: 14px;color: #929292;">By：{{Name}}</span>&nbsp;&nbsp;<i style="font-size: 14px;color: #929292;">{{Date}}</i>
            </td>
        </tr>
        {{/Ticket}}
        {{#ShareTo}}
        <tr data-uid="{{UID}}">
            <td>
                <span>{{Note}}</span>&nbsp;&nbsp;
                <span style="font-size: 14px;color: #929292;">By：{{Name}}</span>&nbsp;&nbsp;<i style="font-size: 14px;color: #929292;">{{Date}}</i>
            </td>
        </tr>
        {{/ShareTo}}
        {{#SentTo}}
        <tr data-uid="{{UID}}">
            <td>
                <span>{{Note}}</span>&nbsp;&nbsp;
                <span style="font-size: 14px;color: #929292;">By：{{Name}}</span>&nbsp;&nbsp;<i style="font-size: 14px;color: #929292;">{{Date}}</i>
            </td>
        </tr>
        {{/SentTo}}
    </template>

    <!-- Attachments -->
    <template id="tm-att">
        <label>Attachments：</label>
        {{#Attachment}}
        <span class="label label-info"><a href="http://erp.v0.xytinc.com{{File}}" style="text-decoration: none;" target="_blank">{{format}}-By{{Name}}</a>&nbsp;&nbsp;<button data-id="{{DataID}}" type="button" class="atMate">x</button></span>
        {{/Attachment}}
        <form action="javascript:;" class="form-inline">
            <div class="form-group">
                <input type="file" id="StrFile" name="StrFile" Method="multipart/form-data" multiple="multiple"/>
            </div> 
            <div class="form-group">
                <button id="fileUpBtn" type="button" class="btn btn-default btn-sm">上传</button>
            </div>
        </form>
    </template>

    <!-- 讨论模板-->
    <template id="tm-reply">
        {{#Reply}}
        <tr>
            <td>
                <input type="hidden" name="UID" value="{{UID}}" />
                <input type="hidden" name="DataID" value="{{DataID}}" />
                <input type="hidden" name="FID" value="{{FID}}" />
                <span>{{Note}}</span>&nbsp;&nbsp;
                <span style="font-size: 14px;color: #929292;">By：{{Name}}</span>&nbsp;&nbsp;<i style="font-size: 14px;color: #929292;">{{Date}}</i>
                <div id="btn-ead" class="poi" style="float: right;">
                    <span class="glyphicon glyphicon-pencil"></span>&nbsp;&nbsp;
                    <span class="glyphicon glyphicon-remove"></span>
                </div>
            </td>
        </tr>
        {{/Reply}}
    </template>

    {页面底部}{/页面底部}
    
    <script src="/Resource/js/mustache.js"></script>
    <script>
        (function(){
            $(function(){
                'use strict';

                var Int_UID = <!-- BEGIN 当前用户ID ATTRIB= --><!-- END 当前用户ID -->,
                    oParam = common.URL.parse(),
                    $dataList = $('#data-list'),
                    $modalLog = $('#modal-Log'),
                    $logBtn = $('#logBtn'),
                    $editStma = $('#edit-stma'),
                    $editFrom = $('#edit-from'),
                    $editNote = $('#edit-note'),
                    $editAtt = $('#edit-att'),
                    $editExe = $('#edit-exe'),
                    $editRep = $('#edit-rep'),
                    $editRepForm = $('#edit-rep').find('form'),
                    $modalNote = $('#modal-Note'),
                    $modalExe = $('#modal-Execute'),
                    tempLog = $('#tm-log').html(),
                    tempFrom = $('#tm-from').html(),
                    tempNote = $('#tm-note').html(),
                    tempAtt = $('#tm-att').html(),
                    tempRep = $('#tm-reply').html(),
                    $resetBtn = $editRepForm.find('input[type="reset"]'),
                    $MarkTicket = $('#MarkTicket'),
                    $modalNote = $('#modal-Note'),
                    TicketID, FromID;

                // 获取工单信息
                function Ref(){
                    $.ajax({
                        url: '/Ticket/API/?Do=Query&UID=' + Int_UID,
                        type: 'get',
                        dataType: 'json',
                        data: {
                            OrderID: oParam.OrderID,
                            DataID: oParam.DataID
                        },
                        success: function(data){
                            var d = data,
                                att = data.Attachment;

                            // 存储工单DataID,收藏工单时可用;工单发起人的UID，做反馈判断时可用;
                            TicketID = d.Ticket.DataID;
                            FromID = d.Ticket.UID;

                            // 根据工单状态，更改Execute，对工单发起人隐藏结束工单的按钮
                            if (FromID === Int_UID) { $editExe.find('button[data-toggle="modal"]').remove(); }
                            if(d.Ticket.Status !== "发起"){
                                $editExe.find('tbody td').text("[该工单已" + d.Ticket.Status + "]");

                                $.each(d.SentTo, function(i, n){
                                    if(n.Note !== null){
                                        var no = ' ' + n.Note + ' <span style="font-size: 14px;color: #929292;">By ' + n.Name + '</span>';
                                        $editExe.find('tbody td').append(no);
                                    }
                                });

                                $editExe.find('button[data-toggle="modal"]').remove();

                                // 如果是工单发起人，则工单在非发起状态下显示评价按钮,
                                if (FromID === Int_UID && d.Ticket.Feedback === "") {
                                    $editExe.find('tbody td').append('<button name="eva" data-val="沮丧" class="btn btn-default btn-xs pull-right" type="button"><span class="glyphicon glyphicon-thumbs-down"></span></button><button name="eva" data-val="赞" class="btn btn-default btn-xs pull-right" type="button"><span class="glyphicon glyphicon-thumbs-up"></span></button>'); 

                                    // 评价按钮绑定事件
                                    $editExe.find('button[name="eva"]').each(function(){
                                        var ts = $(this);
                                        ts.on('click', function(){
                                            $.ajax({
                                                url: '/Ticket/API/?Do=Feedback',
                                                type: 'post',
                                                dataType: 'json',
                                                data: {
                                                    DataID: TicketID,
                                                    UID: FromID,
                                                    Feedback: ts.attr('data-val')
                                                },
                                                success: function(data){
                                                    $editExe.find('button[name="eva"]').remove();
                                                    if (ts.attr('data-val') === "赞") {
                                                        var val = "up";
                                                    }else{
                                                        var val = "down";
                                                    }
                                                    $editExe.find('tbody td').append('<span class="pull-right glyphicon glyphicon-thumbs-' + val + '"></span>');
                                                }
                                            });
                                        });
                                    });
                                }else if (FromID === Int_UID && d.Ticket.Feedback !== "") {
                                    if (d.Ticket.Feedback === "赞") {
                                        $editExe.find('tbody td').append('<span class="pull-right glyphicon glyphicon-thumbs-up"></span>');
                                    }else{
                                        $editExe.find('tbody td').append('<span class="pull-right glyphicon glyphicon-thumbs-down"></span>');
                                    }
                                }

                                // 初始化状态标签
                                switch(d.Ticket.Status){
                                    case "完成":
                                        $editStma.find('span').removeClass().addClass('label label-success pull-right').text("完成");
                                        break;
                                    case "结束":
                                        $editStma.find('span').removeClass().addClass('label label-info pull-right').text("结束");
                                        break;
                                }

                            }

                            // 初始化工单收藏状态
                            if(d.Ticket.Mark){
                                $MarkTicket.empty().append('<span class="glyphicon glyphicon-star"></span>已收藏').attr('data-val', 'UnMarkIt');
                            }else{
                                $MarkTicket.empty().append('<span class="glyphicon glyphicon-star-empty"></span>未收藏').attr('data-val', 'MarkIt');
                            }

                            
                            // 添加一个文件格式的字段进数据
                            $.each(att, function(i){
                                att[i].format = att[i].File.split('.')[1];
                            });
                            
                            $editFrom.html(Mustache.render(tempFrom, d));
                            $editNote.find('tbody').html(Mustache.render(tempNote, d));
                            $editAtt.html(Mustache.render(tempAtt, d));
                            $editRep.find('tbody').html(Mustache.render(tempRep, d));

                            // 绑定删除附件事件
                            $('.atMate').each(function(){
                                var ts = $(this);
                                ts.on('click', function(){
                                    $.ajax({
                                        url: '/Ticket/API/?Do=FileDelete',
                                        dataType: 'json',
                                        type: 'post',
                                        data: {
                                            DataID: ts.attr('data-id')
                                        },
                                        success: function(data){
                                            ts.closest('a').remove();
                                            Ref();
                                        }
                                    });
                                });
                            });

                            // 上传附件绑定
                            $('#fileUpBtn').on('click', function(){
                                var fileName = $('#StrFile').attr('name');
                                common.ajaxFE({
                                    title: '工单附件上传',
                                    URL: '/Ticket/API/?Do=Upload',
                                    FE: 'StrFile',
                                    dataType: 'json',
                                    type: 'post',
                                    data: {
                                        OrderID: oParam.OrderID,
                                        UID: Int_UID,
                                        StrFile: fileName
                                    },
                                    ok: function(data){
                                        common.alert({
                                            type: 'success',
                                            title: '[工单创建]操作：',
                                            msg: data.Message || '失败！提示：' + e
                                        });
                                        Ref();
                                    }
                                });
                            });

                            // 工单状态更改
                            $modalExe.find('.modal-footer button').on('click', function(){
                                var sta = $modalExe.find('input[type="radio"]:checked').val(),
                                    textNote = $modalExe.find('.modal-body input[type="text"]').val();
                                $.ajax({
                                    url: '/Ticket/API/?Do=Result',
                                    type: 'post',
                                    dataType: 'json',
                                    data: {
                                        DataID: TicketID,
                                        OrderID: oParam.OrderID,
                                        UID: Int_UID,
                                        Note: textNote,
                                        Status: sta
                                    },
                                    success: function(data){
                                        Ref();
                                    }
                                });
                            });

                            // 讨论区
                            //提交备注
                            remarkSave(TicketID, $editRep, $editRepForm, tempRep, $resetBtn, Int_UID);

                            //判断备注能否编辑和删除，如果备注的UID符合当前用户UID，则可以编辑或删除，并且绑定事件
                            editAndDel(TicketID, $editRep, $editRepForm, tempRep, $resetBtn, Int_UID);

                            //编辑备注的[取消]按钮事件
                            reset($editRepForm, $resetBtn);
                        }
                    });
                }

                Ref();
                

                // 工单操作记录
                $logBtn.on('click', function(){
                    $.ajax({
                        url: '/Ticket/API/?Do=Query&UID=' + Int_UID,
                        type: 'get',
                        dataType: 'json',
                        data: {
                            OrderID: oParam.OrderID
                        },
                        success: function(data){
                            var d = data;
                            $modalLog.find('tbody').html("").html(Mustache.render(tempLog, d));
                        }
                    });
                });

                // 收藏工单
                $MarkTicket.on('click', function(){
                    var ts = $(this),
                        val = ts.attr('data-val');
                        console.log(val);
                    $.ajax({
                        url: '/Ticket/API/?Do=' + val,
                        type: 'post',
                        dataType: 'json',
                        data: {
                            DataID: TicketID,
                            UID: Int_UID
                        },
                        success: function(data){
                            ts.empty();
                            if(val === "MarkIt"){
                                ts.append('<span class="glyphicon glyphicon-star"></span>已收藏').attr('data-val', 'UnMarkIt');
                            }else if(val === "UnMarkIt"){
                                ts.append('<span class="glyphicon glyphicon-star-empty"></span>未收藏').attr('data-val', 'MarkIt');
                            }
                        },
                        error: function(data, status, e){
                            console.log(e);
                        }
                    });
                });

                // Note操作
                $modalNote.find('input[type="submit"]').on('click', function(){
                    $.ajax({
                        url: '/Ticket/API/?Do=AddNote',
                        dataType: 'json',
                        type: 'post',
                        data: {
                            DataID: TicketID,
                            OrderID: oParam.OrderID,
                            UID: Int_UID,
                            Note: $modalNote.find('textarea').val()
                        },
                        success: function(data){
                            Ref();
                        }
                    });
                });


                //提交备注信息
                function remarkSave(dataID, rediv, reform, retemp, resetBtn, UID){
                    reform.on('submit', function(){
                        common.ajax({
                            title: '提交讨论信息',
                            URL: '/Ticket/API/?Do=ReplySave',
                            type: 'post',
                            data: {
                                DataID: $('#DataIDforEdit').val(),
                                FID: TicketID,
                                UID: UID,
                                Note: reform.find('textarea').val()
                            },
                            good: function(data){
                                common.alert({
                                    type: 'success',
                                    title: '“提交讨论”操作：',
                                    msg: data.Message || '成功！'
                                });
                                //检查是否有隐藏的input标签，如果有就删除（更新备注遗留）
                                if(reform.find('#DataIDforEdit')){
                                    reform.find('#DataIDforEdit').remove();
                                }
                                //如果[取消]按钮是显示的，就隐藏掉
                                if(!resetBtn.is(':hidden')){
                                    resetBtn.attr('class', 'btn btn-default hidden');;
                                }
                                //按钮更改为[提交]
                                reform.find('input[type="submit"]').val('提交');
                                //刷新备注
                                remarkUpdate(dataID, rediv, reform, retemp, resetBtn, UID);
                            }
                        });
                    });
                }

                //更新备注封装
                function remarkUpdate(dataID, rediv, reform, retemp, resetBtn, UID){
                    common.ajax({
                        title: '更新讨论',
                        URL: '/Ticket/API/?Do=Query&UID=' + UID,
                        data: {
                            OrderID: oParam.OrderID
                        },
                        good: function(data){
                            var mes = data;
                            rediv.find('tbody').html(Mustache.render(retemp, mes));
                            reform.find('textarea').val("");
                            //判断备注能否编辑删除
                            editAndDel(dataID, rediv, reform, retemp, resetBtn, UID);
                        }
                    });
                }

                //判断备注能否编辑和删除，如果备注的UID符合当前用户UID，则可以编辑或删除，并且绑定事件
                function editAndDel(dataID, rediv, reform, retemp, resetBtn, UID){
                    var $uidList = rediv.find('table tr');
                    //遍历每条备注的按钮，设置为隐藏
                    $uidList.each(function(){
                        var inputUID = $(this).find('input[name="UID"]').val();
                        $(this).find('#btn-ead').hide();
                        //如果备注的UID符合当前用户UID，则显示编辑和删除按钮
                        if(inputUID == UID){
                            var $thisDiv = $(this).find('#btn-ead'),
                                $thisTr = $(this),
                                $DataID = $thisTr.find('input[name="DataID"]').val();
                            $thisDiv.show();
                            //绑定按钮事件
                            //编辑备注
                            $thisDiv.find('span:eq(0)').on('click', function(){
                                var $cInput = $('<input id="DataIDforEdit" name="DataID" type="hidden" value=' + $DataID + ' />'),
                                    //预防点击多次出现多个OID
                                    $hidinp = reform.find('input[type="hidden"]');
                                    $hidinp ? reform.find('input[type="hidden"]').remove().end().append($cInput) : form.append($cInput);
                                //把备注内容复制到文本域
                                var copyText = $thisTr.find('span:eq(0)').text();
                                reform.find('textarea').val(copyText);
                                //改变提交按钮为[修改]，并显示隐藏的[取消]按钮
                                reform.find('input[type="submit"]').val('修改');
                                resetBtn.attr('class', 'btn btn-default');
                            });
                            //删除备注
                            $thisDiv.find('span:eq(1)').on('click', function(){
                                console.log("hello+4");
                                common.ajax({
                                    title: '删除讨论',
                                    URL: '/Ticket/API/?Do=ReplyDelete',
                                    type: 'post',
                                    data: {
                                        DataID: $(this).closest('td').find('input[name="DataID"]').val(),
                                        UID: $(this).closest('td').find('input[name="UID"]').val(),
                                        FID: $(this).closest('td').find('input[name="FID"]').val()
                                    },
                                    good: function(data){
                                        common.alert({
                                            type: 'success',
                                            title: '“删除评论”操作：',
                                            msg: data.Message || '成功！'
                                        });
                                        //刷新备注
                                        remarkUpdate(dataID, rediv, reform, retemp, resetBtn, UID);
                                    }
                                });
                            });
                        }
                    });
                }

                //编辑备注的[取消]按钮事件
                function reset(reform, resetBtn){
                    reform.find('input[type="reset"]').on('click', function(){
                        //删除掉带有DataID的input标签
                        reform.find('input[type="hidden"]').remove();
                        resetBtn.attr('class', 'btn btn-default hidden');
                        //按钮更改为[提交]
                        reform.find('input[type="submit"]').val('提交');
                    });
                }


            });
        })();        
    </script>
</body>
</html>
