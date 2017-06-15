{页面属性}{/页面属性}
<body>
    {页顶导航}{/页顶导航}
    <!-- 内容-->
    <div id="data-list" class="container-fluid">
        <div class="panel panel-default maxW1280 center-block">
            <div class="panel-heading">
                <h4 class="panel-title">工单系统</h4>
            </div>
            <div class="panel-body">
                <!-- 工单编写 -->
                <div class="container">

                    <!-- 工单详情 -->
                    <form id="word-from" class="form-horizontal" action="javascript:;">
                        <!-- 工单号 -->
                        <div class="form-group orderid">
                            <label data-id="orderID"></label>
                        </div>
                        <hr />

                        <!-- 召唤 -->
                        <div class="form-group atList">
                        <label><button class="btn btn-default btn-xs" data-toggle="collapse" data-target="#shareList"><span class="glyphicon glyphicon-circle-arrow-down"></span></button>&nbsp;&nbsp;Send To:</label>
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

                        <!-- 工单模板选择 -->
                        <!-- 待定 -->
                </div>
            </div>
            <div class="panel-footer clearfix">
                <button id="work-btn" class="btn btn-default pull-right" type="button">提交</button>
            </div>
        </div>
    </div>

    <!-- Note Template -->
    <template id="word-leave">
        
    </template>

    {页面底部}{/页面底部}

    <script>
        (function(){
            'use strict';

            var Int_UID = <!-- BEGIN 当前用户ID ATTRIB= --><!-- END 当前用户ID -->,
                $orderid = $('.orderid').find('label'),
                $workForm = $('#word-from'),
                $workSend = $('#work-send'),
                $sendPromptDiv = $('.prompt-send'),
                $atList = $('.atList'),
                $workShare = $('#work-share'),
                $sharePromptDiv = $('.prompt-share'),
                $shareList = $('.shareList'),
                $note = $('.noteLite'),
                $workBtn = $('#work-btn'),
                allMenbers = [],    //成员数组
                allpounds = [],     //团队数组
                keySelect = null,   //按键定位
                setHeight = null;   //滚动条高度

            // 获取团队数据
            common.ajax({
                title: '获取团队数据',
                URL: '/user/API/?Do=GetDivisionList',
                good: function(data){
                    var d = data;
                    //遍历团队，添加进数组
                    $.each(d.DataList, function(i, n){
                        allpounds[i] = n.Name;
                    });
                }
            });

            // 获取成员数据
            common.ajax({
                title: '获取成员数据',
                URL: '/user/API/?Do=GetUserList',
                good: function(data){
                    var d = data;
                    //遍历成员，添加进数组
                    $.each(d.DataList, function(i, n){
                        allMenbers[i] = n.TrueName;
                    });
                }
            });

            //获取工单号
            $.ajax({
                url: '/Ticket/API/?Do=Post',
                data: { UID: Int_UID },
                type: 'post',
                
                success: function(data){
                    var d = data.OrderID;
                    $orderid.text("工单号：" + d);
                    $orderid.attr("data-val", d);
                }
            });

            // 工单创建提交时序列化文本
            var workJson = function(){
                var postjson = {},
                    $hidPost = $workForm.find('input[name="PostName"]'),
                    $hidShare = $workForm.find('input[name="ShareName"]');
                postjson.OrderID = $orderid.data('val');
                postjson.UID = Int_UID;
                postjson.SentTo = [];
                postjson.ShareTo = [];
                postjson.Note = $note.find('textarea').val();
                $hidPost.each(function(i){
                    var ts = $(this);
                    postjson.SentTo.push({Name : ts.val()});
                });
                $hidShare.each(function(i){
                    var ts = $(this);
                    postjson.ShareTo.push({Name : ts.val()});
                });
                return JSON.stringify(postjson);
            };

            // 提交
            $workBtn.on('click', function(){
                
                // 文本内容上传
                var textJson = workJson(),
                    fileName = $('#StrFile').attr('name');
                $.ajax({
                    type: 'post',
                    url: '/Ticket/API/?Do=Create',
                    data: textJson,
                    success: function(data, status, e){
                        // 文本上传成功后上传文件
                        common.ajaxFE({
                            title: '工单附件上传',
                            URL: '/Ticket/API/?Do=Upload',
                            FE: 'StrFile',
                            
                            type: 'post',
                            data: {
                                OrderID: $orderid.data('val'),
                                UID: Int_UID,
                                StrFile: fileName
                            },
                            ok: function(data, status, e){
                                common.alert({
                                    type: 'success',
                                    title: '[工单创建]操作：',
                                    msg: data.Message || '失败！提示：' + e
                                });
                                setTimeout(function() {
                                    location.href="/Ticket/?Do=MyTicket";
                                }, 1000);
                            },
                            no: function(data, status, e){
                                console.log("这里是no" + e);
                            }
                        });
                    },
                    error: function(data, status, e){
                        console.log(e);
                    }
                });

            });

            // SendTo模块召唤处理
            common.at.inputCheck($workSend, $atList, $workForm, $sendPromptDiv, keySelect, setHeight, allMenbers, allpounds, "PostName");
            common.at.keydownFun($workSend, $atList, $workForm, $sendPromptDiv, keySelect, setHeight, "PostName");
            common.at.removeMate($atList, $workForm);

            // shareTo模块召唤处理
            common.at.inputCheck($workShare, $shareList, $workForm, $sharePromptDiv, keySelect, setHeight, allMenbers, allpounds, "ShareName");
            common.at.keydownFun($workShare, $shareList, $workForm, $sharePromptDiv, keySelect, setHeight, "ShareName");
            common.at.removeMate($shareList, $workForm);
            
        })();
    </script>
</body>
</html>
