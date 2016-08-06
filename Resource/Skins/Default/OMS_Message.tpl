{页面属性}{/页面属性}
<body>
	{页顶导航}{/页顶导航}
    <!-- 内容-->
    <article class="container-fluid">
        <header class="mg-b-10">
            <form id="form-filter" class="form-inline mg-t-10 mg-b-10" action="javascript:;" method="post">
                    <input class="do" type="hidden" name="Do" value="null">
                    <div class="dropdown input-group">
                        <button id="openTab" class="btn btn-default btn-xs" type="button">批量打开标签页</button>
                    </div>
                    <div class="input-group">
                        <div class="btn-group btn-group-xs" data-toggle="buttons">
                            <!-- BEGIN 店铺列表 ATTRIB= -->
                            <label class="btn btn-default">
                                <input type="checkbox" name="ShopID" value="{DataID}" autocomplete="off">{Name}
                            </label>
                            <!-- END 店铺列表 -->
                        </div>
                    </div>

                    <div class="form-group form-group-sm">
                        <!-- BEGIN 所在团队 ATTRIB= -->
                        <select id="TeamID" class="form-control" name="TeamID" data-default="{TeamID}" {Admin}>
                        <!-- END 所在团队 -->
    
                            <option value="0">所有团队</option>
                            <!-- BEGIN 销售团队 ATTRIB= -->
                            <option value="{DataID}">{Name}</option>
                            <!-- END 销售团队 -->
                        </select>
                    </div>

                    <div class="input-group input-group-sm">
                        <input type="text" class="form-control" placeholder="Search..." name="KeyWord">
                        <span class="input-group-btn">
                            <button class="btn btn-default" type="submit"><span class="glyphicon glyphicon-search"></span> 搜索</button>
                        </span>
                    </div>

                    <div class="dropdown input-group">
                        <button id="dropdownMenu" class="btn dropdown-toggle" type="button" data-toggle="dropdown"><span class="glyphicon glyphicon-list"></span>操作</button>
                        <ul class="dropdown-menu">
                            <li><a href="javascript:;">标记为星标邮件</a></li>
                            <li><a href="javascript:;">标记为已处理邮件</a></li>
                            <li><a href="javascript:;">标记为紧急邮件</a></li>
                        </ul>
                    </div>

                </form>
        </header>

        <div id="Toolbox" class="Toolbox mg-b-10">
            <div class="panel-collapse">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">站内信</a>
                    </h4>
                </div>
                <ul id="collapseOne" class="list-group collapse in">
                    <li id="Star" class="list-group-item"><a href="?Do=Star">星标邮件</a></li>
                    <li id="UnExecute" class="list-group-item bg-title"><a href="?Do=UnExecute">待处理邮件</a></li>
                    <li id="Crash" class="list-group-item"><a href="?Do=Crash">紧急邮件</a></li>
                    <li id="Ask" class="list-group-item"><a href="?Do=Ask">买家邮件</a></li>
                    <li id="Base" class="list-group-item"><a href="?Do=Base">平台邮件</a></li>
                    <li id="Send" class="list-group-item"><a href="?Do=Send">发件箱</a></li>
                </ul>
            </div>
        </div>

        <div id="data-list" class="infoList">
            <table class="table table-striped table-bordered table-hover table-condensed">
                <colgroup>
                    <col width="20px">
                    <col>
                    <col width="60px">
                    <col>
                    <col>
                    <col width="80px">
                    <col width="80px">
                    <col width="40px">
                    <col width="100px">
                </colgroup>
                <thead>
                    <th><input id="callAll" type="checkbox" /></th>
                    <th>编号</th>
                    <th>店铺名</th>
                    <th>发件人</th>
                    <th>标题</th>
                    <th>收信时间</th>
                    <th>入库时间</th>
                    <th>星标</th>
                    <th>状态</th>
                </thead>
                <tbody>
                    <!-- BEGIN 数据列表 ATTRIB= -->
                    <tr data-id="{DataID}">
                        <td><input data-dataid="{DataID}" type="checkbox"></td>
                        <td>{MessageID}</td>
                        <td>{ShopName}</td>
                        <td>{Sender}</td>
                        <td><a href="?Do=Edit&DataID={DataID}&MessageID={MessageID}" target="_blank">{Subject}</a></td>
                        <td>{ReceiveDate}</td>
                        <td>{Date}</td>
                        <td><span data-star="{Star}" class="glyphicon glyphicon-star"></span></td>
                        <td>
                        <span data-val="{ResponseEnabled}" class="glyphicon glyphicon-check" title="能否回应"></span>
                        <span data-val="{Read}" class="glyphicon glyphicon-envelope" title="是否已读"></span>
                        <span data-val="{Replied}" class="glyphicon glyphicon-share" title="是否已经回复"></span>
                        <span data-val="{Executes}" class="glyphicon glyphicon-refresh" title="是否已经处理"></span>
                        <span data-val="{Crash}" class="glyphicon glyphicon-fire" title="是否为紧急邮件"></span>
                        </td>
                    </tr>
                    <!-- END 数据列表 -->
                </tbody>
                <tfoot><tr><td colspan="9"></td></tr></tfoot>
            </table>
        </div>

        <!-- 批量标记模态框 -->
        <div id="msg-status" class="modal fade" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button class="close" type="button" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">选择一个状态</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">状态</label>
                            <div class="col-sm-10">
                                <label class="radio-inline"><input type="radio" name="Status" value="True" checked="checked">标记</label>
                                <label class="radio-inline"><input type="radio" name="Status" value="False">取消标记</label>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button id="msg-confirm" class="btn btn-danger" data-dismiss="modal">确定</button>
                    </div>
                </div>
            </div>
        </div>

    </article>
    
    {页面底部}{/页面底部}

    <script>
        $(function(){
            'use strict';

            var oParam = common.URL.parse(),
                $callAll = $('#callAll'),
                $formFilter = $('#form-filter'),
                $toolbox = $('#Toolbox'),
                $dataList = $('#data-list'),
                $dropMenu = $('.dropdown-menu'),
                $msgSta = $('#msg-status'),
                $msgBtn = $('#msg-confirm'),
                $openTab = $('#openTab'),
                shopID = oParam.ShopID || [];

            // 根据选项改变背景色
            (function(){
                if (oParam.Do) {
                    $('#collapseOne').find('.bg-title').removeClass('bg-title');
                    $('#' + oParam.Do).addClass('bg-title');
                }
            })();

            // 根据浏览器宽度自适应
            (function(){
                function wthChange(){
                    var wth = document.documentElement.clientWidth || document.body.clientWidth,
                        DLH = $dataList[0].offsetHeight;
                    $toolbox[0].style.height = DLH + 'px';
                    $dataList[0].style.width = (wth - 170) + 'px';
                }
                wthChange();
                window.onresize = function(){
                    wthChange();
                }
            })();

            // 星标与状态初始化
            (function(){
                var trArr = $dataList.find('tbody tr');
                trArr.each(function(){
                    var ts = $(this),
                        lastSpan = ts.find('td:last-child span'),
                        starSpan = ts.find('td:eq(7) span');
                    if (lastSpan.eq(1).attr('data-val') === 'False') {ts.find('td:eq(4)').attr('style', 'font-weight:800;')}
                    if (starSpan.attr('data-star') === 'True') { starSpan.attr('style', 'color: rgba(252, 145, 80 ,1)'); }
                    lastSpan.each(function(){
                        var tss = $(this);
                        if (tss.attr('data-val') === 'True') { tss.attr('style', 'color: rgba(252, 145, 80 ,1)'); }
                    });
                });
            })();

            // 搜索
            $formFilter.find('.do').val(oParam.Do);
            $formFilter.find('input[type="text"]').val(decodeURI((oParam.KeyWord || '').replace(/\++/g, ' ')));
            $formFilter.find('select option[value="' + (oParam.TeamID || $formFilter.find('select').data('default')) + '"]').prop('selected', true);

            if (shopID && -1 !== shopID.indexOf(',')) {
                shopID = shopID.split(',');
            }

            for (var i = 0, len = shopID.length; i < len; i++) {
                $formFilter.find('input[type="checkbox"][value="' + shopID[i] + '"]').closest('.btn').button('toggle');
            }

            $formFilter.on('submit', function() {
                location.search = common.URL.stringify(common.URL.parse('?' + $formFilter.serialize()));
            });

            //点击全选按钮时
            $callAll.on('click', function(){
                var $ts = $(this);
                if($ts.val() !== 'all'){
                    $ts.val('all');
                    $('#data-list').find('tbody input[type="checkbox"]').prop('checked', true);
                }else{
                    $ts.val('none');
                    $('#data-list').find('tbody input[type="checkbox"]').prop('checked', false);
                }
            });

            (function(){
                //批量打开标签页
                $openTab.on('click', function(){
                    var hrefArr = [],
                        DID = [],
                        num = 0;
                    // 把选中的URL存进数组
                    $dataList.find('input[type="checkbox"]').each(function(){
                        if($(this).prop('checked')&&$(this).attr('id') !== 'callAll'){
                            hrefArr[num] = $(this).closest('tr').find('a').attr('href');
                            DID[num] = $(this).closest('tr').attr('data-id');
                            num++;
                        }
                    });

                    // 批量打开标签页
                    num = 0;
                    openTab();
                    function openTab(){
                        if (hrefArr.length <= num) {
                            readOption();
                        }else{
                            window.open(hrefArr[num], 'newTab' + num);
                            num++;
                            setTimeout(openTab, 500);
                        }
                    }

                    // 批量设置已读状态方法
                    function readOption(){
                        $.ajax({
                            url: '/OMS/API/?Do=SetMessageStatus',
                            type: 'post',
                            dataType: 'json',
                            traditional: true,
                            data: {
                                DataID: DID,
                                Status: 'Read',
                                Value: 'True'
                            },
                            success: function(data){
                                setTimeout(function(){
                                    window.location.reload();
                                }, 1000);
                            }
                        });
                    }
                    
                });
            })();


            // 更改状态
            (function(){
                var mtr = $dataList.find('tr');

                // 点击标题更改邮件为已读
                mtr.each(function(){
                    var ts = $(this);
                    ts.find('a').on('click', function(){
                        $.ajax({
                            url: '/OMS/API/?Do=SetMessageStatus',
                            type: 'post',
                            dataType: 'json',
                            data: {
                                DataID: ts.attr('data-id'),
                                Status: 'Read',
                                Value: 'True'
                            },
                            success: function(data){
                                ts.find('td:last span:eq(1)').attr('data-val', 'True').attr('style', 'color: rgba(252, 145, 80 ,1)').end().find('td:eq(4)').attr('style', 'color: rgba(252, 145, 80 ,1)');
                                ts.removeAttr('style');
                            }
                        });
                    });
                });

                //点击操作
                $dropMenu.find('a').each(function(){
                    var ts = $(this);
                    ts.on('click', function(){
                        $msgSta.modal('show');
                        switch (ts.text()){
                            case '标记为星标邮件':
                                $msgSta.attr('data-sta', 'Star');
                                $msgSta.attr('data-tit', '标记为星标邮件');
                            break;
                            case '标记为已处理邮件':
                                $msgSta.attr('data-sta', 'Executes');
                                $msgSta.attr('data-tit', '标记为已处理邮件');
                            break;
                            case '标记为紧急邮件':
                                $msgSta.attr('data-sta', 'Crash');
                                $msgSta.attr('data-tit', '标记为紧急邮件');
                            break;
                        }
                    });
                });

                // 确认标记
                $msgBtn.on('click', function(){
                    var DID = [],
                        STA = null,
                        num = 0;
                    //DataID 数组获取
                    $dataList.find('input[type="checkbox"]').each(function(){
                        if($(this).prop('checked')){
                            DID[num] = $(this).attr('data-dataid');
                            num++;
                        }
                    });
                    //Status 获取
                    $msgSta.find('input[type="radio"]').each(function(){
                        STA = $(this).prop('checked')?$(this).val():STA;
                    });
                    // 提交数据
                    changeStatus($msgSta.attr('data-tit'), DID, $msgSta.attr('data-sta'), STA)
                });

                // 批量更改状态方法封装
                function changeStatus(tit ,did, sta, val){
                    $.ajax({
                        url: '/OMS/API/?Do=SetMessageStatus',
                        type: 'post',
                        dataType: 'json',
                        traditional: true,
                        data: {
                            DataID: did,
                            Status: sta,
                            Value: val
                        },
                        success: function(data){
                            common.alert({
                                type: 'success',
                                title: tit,
                                msg: tit + '成功！'
                            });
                            setTimeout(reload, 1000);
                        }
                    });
                }

                //刷新页面
                function reload(){
                    window.location.reload();
                }

                
            })();

            // 返回顶部按钮
            common.topBtn();

            <!-- BEGIN 分页脚本 ATTRIB= -->
            common.showPage({当前页}, {总条数}, {每页条数});
            <!-- END 分页脚本 -->
        });
    </script>
</body>
</html>
