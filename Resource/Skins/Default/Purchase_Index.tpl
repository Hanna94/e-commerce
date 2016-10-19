{页面属性}{/页面属性}
<body>
    {页顶导航}{/页顶导航}
    
    <!-- 内容-->

    <div id="data-list" class="container-fluid">
        <header>
            <div class="btn-group btn-group-sm pull-right">
                <button  class="stu btn btn-warning btn-sm hide auditBtn" type="button" disabled><span class="glyphicon glyphicon-screenshot"></span> 审核</button>
                <button  class="stu btn btn-danger btn-sm hide reauditBtn" type="button" disabled><span class="glyphicon glyphicon-remove"></span> 取消审核</button>
                <button  class="stu btn btn-primary btn-sm hide repurchaseBtn" type="button" disabled><span class="glyphicon glyphicon-remove"></span> 取消采购</button>
                <a class="mg-l-5" href="?Do=Edit" target="_blank"><button  class="btn btn-success btn-sm" type="button"><span class="glyphicon glyphicon-plus-sign"></span> 新建采购单</button></a>
            </div>
        </header>
        <ul class="nav nav-tabs">
            <li><a href="?Do=All">全部</a></li>
            <li><a href="?Do=UnExecute">待处理</a></li>
            <li><a href="?Do=NoPaid">待付款</a></li>
            <li><a href="?Do=UnStock">待收货</a></li>
            <li><a href="?Do=Complete">已完成</a></li>
            <li><a href="?Do=Cancel">已取消</a></li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane active">
            <form id="form-filter" class="form-inline mg-t-10 mg-b-10" action="?">
                <div class="input-group input-group-sm">
                    <input type="text" class="form-control" placeholder="单号/供应商/联系人名称" name="KeyWord">
                    <span class="input-group-btn">
                        <button class="btn btn-default" type="submit"><span class="glyphicon glyphicon-search"></span> 搜索</button>
                    </span>
                </div>
            </form>
                <table class="table table-striped table-bordered table-hover table-condensed">
                    <colgroup>
                        <col>
                        <col>
                        <col>
                        <col>
                        <col>
                        <col>
                        <col>
                        <col>
                        <col>
                    </colgroup>
                    <thead>
                        <th>编号</th>
                        <th>单号</th>
                        <th>供应商名称</th>
                        <th>供应商备注</th>
                        <th>总金额</th>
                        <th>采购单状态</th>
                        <th>支付状态</th>
                        <th>收货状态</th>
                        <th>时间</th>
                        <th>操作</th>
                    </thead>
                    <tbody>
                        <!-- BEGIN 数据列表 ATTRIB= -->
                        <tr data-did="{DataID}" data-sid="{SupplierID}">
                            <td><input type="checkbox" />{DataID}</td>
                            <td><span class="orderID">{OrderID}</span></td>
                            <td>{SupplierName}</td>
                            <td>
                                <button type="button" class="btn btn-default btn-xs pur-remark" 
                                data-container="body" data-toggle="popover"
                                data-trigger="click" data-content="{SupplierRemark}">
                                <span data-val="in" class="glyphicon glyphicon-tag poi"></button>
                            </td>
                            <td>{Amount}</td>
                            <td>{Status}</td>
                            <td>{PaymentStatus}</td>
                            <td>{ShipStatus}</td>
                            <td>{Date}</td>
                            <td><a href="?Do=Edit&DataID={DataID}" target="_blank"><span class="glyphicon glyphicon-pencil"></span></a></td>
                        </tr>
                        <!-- END 数据列表 -->
                    </tbody>
                    <tfoot><tr><td colspan="10"></td></tr></tfoot>
                </table>
            </div>
        </div>
    </div>

    {页面底部}{/页面底部}

    <script>
        (function() {
            'use strict';

            var op = common.URL.parse(),
                $dataList = $('#data-list'),
                $auditBtn = $('.auditBtn'), //审核按钮
                $reauditBtn = $('.reauditBtn'), //取消审核按钮
                $repurchaseBtn = $('.repurchaseBtn'), //取消采购按钮
                $purRemark = $('.pur-remark'); // 供应商备注浮动框按钮

            // 根据标签页不同，显示不同按钮
            switch (op.Do) {
                case 'UnExecute':  //待处理
                    $auditBtn.removeClass('hide');
                    $repurchaseBtn.removeClass('hide');
                break;
                case 'NoPaid':   //待付款
                    $reauditBtn.removeClass('hide');
                    $repurchaseBtn.removeClass('hide');
                break;
            }

            // 审核/取消审核/取消采购 按钮事件
            (function(){
                var tsDataID;

                // 如果被选中的数量等于1，则解禁按钮
                $dataList.find('tbody').on('change', 'input[type="checkbox"]', function(){
                    var ts = $(this),
                        ckNum = $dataList.find('tbody input:checked').length;
                    tsDataID = ts.closest('tr').data('did');
                    ckNum === 1 ? $('.stu').prop('disabled', false) : $('.stu').prop('disabled', true);
                });

                // 按钮点击事件
                $('.stu').on('click', function(){
                    var ts = $(this);
                    if (ts.is('.auditBtn')) {
                        submitSTU(tsDataID, '待支付', '审核');
                    } else if (ts.is('.reauditBtn')) {
                        submitSTU(tsDataID, '待审核', '撤回审核');
                    } else if (ts.is('.repurchaseBtn')) {
                        submitSTU(tsDataID, '取消', '取消采购');
                    }
                });

                // 设置状态  DID(DataID) STU(待支付/待审核/取消) TIT(审核/取消审核/取消采购)
                function submitSTU(DID, STU, TIT){
                    if (confirm('确认' + TIT + '?')) {
                        $.ajax({
                            url: '/Purchase/API/?Do=SetStatus',
                            type: 'post',
                            dataType: 'json',
                            data: {
                                DataID: DID,
                                Status: STU
                            },
                            success: function(data){
                                if (data.Ack) {
                                    common.alert({
                                        type: 'success',
                                        title: TIT,
                                        msg: '完成，系统反馈：' + data.Message,
                                        cb: function(){location.reload();}
                                    });
                                } else {
                                    common.alert({ title: TIT, msg: '失败，系统反馈：' + data.LogError });
                                }
                            }
                        });
                    }
                }

            })();

            // 采购单、支付、收货状态渲染
            (function(){
                //采购单状态
                var style = ['label-default', 'a1me', 'a1md', 'm2c', '2gve', 'xytg', 'xyts'], //样式
                    purchaseS = ['初始', '待审核', '待支付', '待收货', '完成', '取消'], //采购单状态
                    payS = ['未支付', '部分支付', '完成'], //支付状态
                    getGS = ['未收货', '部分收货', '完成']; //收货状态

                $dataList.find('tr').each(function(){
                    var ts = $(this);
                    renderer(ts, purchaseS, 5);
                    renderer(ts, payS, 6);
                    renderer(ts, getGS, 7);
                });

                // 状态渲染
                function renderer(tar, arr, num){
                    var val = $.trim(tar.find('td:eq(' + num + ')').text()),
                        flag = $.inArray(val, arr),
                        flag = flag > 0 ? flag : 0;
                    tar.find('td:eq(' + num + ')').html('<span class="label ' + style[flag] + '" >' + val + '</span>');
                }

                // 采购单号渲染
                common.Rendering.order($dataList);

            })();

            // 判断备注是否为空，为空则删除
            (function(){
                $purRemark.each(function() {
                    var purRemarkVal = $(this).attr('data-content');
                    if (purRemarkVal == '' || purRemarkVal == null) {
                        $(this).remove();
                    }
                });
            })();

            // 标签页定位
            $dataList.find('.nav a[href="' + location.search.split('&')[0] + '"]').closest('li').addClass('active');

            //启动弹出框
            $("[data-toggle='popover']").popover(); 

            <!-- BEGIN 分页脚本 ATTRIB= -->
            common.showPage({当前页}, {总条数}, {每页条数});
            <!-- END 分页脚本 -->
        }());
    </script>
</body>
</html>
