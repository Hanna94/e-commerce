{页面属性}{/页面属性}
<body>
    {页顶导航}{/页顶导航}
    
    <!-- 内容-->
    <div id="data-list" class="container-fluid">
        <ul class="nav nav-tabs">
            <li><a href="?Do=All">全部</a></li>
            <li><a href="?Do=UnReceive">待收货</a></li>
            <li><a href="?Do=Receive">已收货</a></li>
            <li><a href="?Do=Cancel">取消</a></li>
        </ul>

        <div class="tab-content">
            <div class="tab-pane active">
                <form id="form-filter" class="form-inline mg-t-10 mg-b-10" action="javascript:;">
                    <input class="do" type="hidden" name="Do" value="unconfirmed">
                    
                    <div class="row mg-b-5"> <!-- 第一行-->
                        <div class="col-sm-12">

                            <div class="form-group">
                                <div class="input-group input-group-sm">
                                    <input type="text" class="form-control" placeholder="起始时间 YYYY-MM-DD" name="StartTime"/>
                                </div>
                                <div class="input-group input-group-sm">
                                    ~
                                </div>
                                <div class="input-group input-group-sm">
                                    <input type="text" class="form-control" placeholder="末尾时间 YYYY-MM-DD" name="EndTime"/>
                                </div>
                                <div class="form-group form-group-sm">
                                    <select id="someDays" class="form-control">
                                        <option value="0">全部</option>
                                        <option value="7">最近7天</option>
                                        <option value="15">最近15天</option>
                                        <option value="30">最近30天</option>
                                    </select>
                                </div>
                            </div>

                            <div class="input-group input-group-sm">
                                <input type="text" class="form-control" placeholder="单号/快递单号" name="KeyWord">
                                <span class="input-group-btn">
                                    <button class="btn btn-default" type="submit"><span class="glyphicon glyphicon-search"></span> 搜索</button>
                                </span>
                            </div>
                        </div> 
                    </div> <!-- 第一行-->

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
                        <col>
                        <col>
                        <col width="15%">
                    </colgroup>
                    <thead>
                        <tr>
                            <th>编号</th>
                            <th>单号</th>
                            <th>外部单号</th>
                            <th>应收数量</th>
                            <th>已收数量</th>
                            <th>状态</th>
                            <th>日期</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- BEGIN 数据列表 ATTRIB= -->
                        <tr data-id="{DataID}" data-tag="{Tag}">
                            <td><label class="checkbox-inline"><input type="checkbox">{DataID}</label></td>
                            <td><span class="orderID">{OrderID}</span></td>
                            <td><span class="orderID">{ReferenceID}</span></td>
                            <td>{Quantity}</td>
                            <td>{Receive}</td>
                            <td class="waybill-status"><i>{Status}</i></td>
                            <td>{Date}</td>
                            <td>
                                <span data-id="{DataID}" class="text-success glyphicon glyphicon-eye-open poi"></span>
                                <span data-oid="{OrderID}" class="text-danger glyphicon glyphicon-fire poi"></span>
                            </td>
                        </tr>
                        <!-- END 数据列表 -->
                    </tbody>
                    <tfoot><tr><td colspan="15"></td></tr></tfoot>
                </table>
            </div>
        </div>
    </div>

    <!-- 收货详情模态框-->
    <div id="modal-create" class="modal fade" tabIndex="-1">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <form  class="form-horizontal" method="post" action="javascript:;">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                        <h4 class="modal-title">收货详情</h4>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-sm-12">
                                <table class="table table-striped table-bordered table-hover table-condensed">
                                    <thead>
                                        <th>单号</th>
                                        <th>外部单号</th>
                                        <th>总数量</th>
                                        <th>收货数量</th>
                                        <th>状态</th>
                                    </thead>
                                    <tbody></tbody>
                                </table>
                            </div>
                            <div class="col-sm-12 maxH400">
                                <table class="table table-striped table-bordered table-hover table-condensed">
                                    <thead>
                                        <th>产品SKU</th>
                                        <th>产品名称</th>
                                        <th>应收数量</th>
                                        <th>已收数量</th>
                                        <th>本次收货</th>
                                        <th>操作</th>
                                    </thead>
                                    <tbody></tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    </div>
                </form>
            </div>
        </div>
    </div>



    {页面底部}{/页面底部}
    
    <script src="/Resource/js/order.js"></script>
    
    <script>
        (function() {
            'use strict';

            var op = common.URL.parse();

            // 如果不是待收货页面，则删除检查收货按钮
            if (op.Do != 'UnReceive') {
                $('#data-list tbody span.glyphicon-fire').remove();
            }

            // 查询指定收货单方法
            function eachList($this){
                $.ajax({
                    url: '/Logistics/API/?Do=ReceiveQuery',
                    dataType: 'json',
                    type: 'get',
                    data: {
                        DataID: $this
                    },
                    success: function(data){
                        $('#modal-create tbody:eq(0)').html(Mustache.render(
                            '<tr data-id="{{DataID}}">' +
                            '<td><span class="orderID">{{OrderID}}</span></td>' +
                            '<td><span class="orderID">{{ReferenceID}}</span></td>' +
                            '<td>{{Quantity}}</td>' +
                            '<td>{{Receive}}</td>' +
                            '<td>{{Status}}</td>' +
                            '</tr>', data
                        ));
                        $('#modal-create tbody:eq(1)').html(Mustache.render(
                            '{{#DataList}}<tr data-id="{{DataID}}">' +
                            '<td>{{FullSKU}}</td>' +
                            '<td>{{FullName}}</td>' +
                            '<td>{{Quantity}}</td>' +
                            '<td>{{Receive}}</td>' +
                            '<td><input class="form-control" type="text" /></td>' +
                            '<td><button class="btn btn-success btn-sm" type="button">收货</button></td>' +
                            '</tr>{{/DataList}}', data
                        ));
                        common.Rendering.order($('#modal-create'));
                    }
                });
            }

            // 查询指定收货单
            $('.tab-content table tbody tr').on('click', 'span.glyphicon-eye-open', function(){
                $('#modal-create').modal('show');
                eachList($(this).closest('tr').attr('data-id'));
            });

            // 检查收货单
            $('#data-list tbody span.glyphicon-fire').on('click', function(){
                $.ajax({
                    url: '/Logistics/API/?Do=ReceiveCheck&DataID='
                    + $(this).closest('tr').data('id') + '&OrderID='
                    + $(this).closest('tr').find('.orderID:eq(0)').text(),
                    type: 'post',
                    dataType: 'json',
                    success: function(data) {
                        common.alert({
                            type: 'success',
                            title: '检查收货单',
                            msg: '完成，后台反馈：' + data.Message,
                            cb: function(){
                                location.reload();
                            }
                        });
                    }
                });
            });

            // 确认收货
            $('#modal-create .modal-body tbody:eq(1)').on('click', 'tr button', function(){
                if (parseInt($(this).closest('tr').find('td:eq(2)').text()) <= 
                    parseInt($(this).closest('tr').find('td:eq(3)').text())){
                    if (!confirm('当前已收数量大于应收数量，是否确认提交？')) {
                        $(this).closest('tr').find('input').val('');
                        return;
                    }
                }
                $.ajax({
                    url: '/Logistics/API/?Do=ReceiveProduct',
                    type: 'post',
                    dataType: 'json',
                    data: {
                        DataID: $(this).closest('tr').attr('data-id'),
                        FID: $('#modal-create .modal-body tbody:eq(0) tr').attr('data-id'),
                        Receive: $(this).closest('tr').find('input').val()
                    },
                    success: function(data){
                        if (data.Ack) {
                            common.alert({
                                type: 'success',
                                title: '确认收货/更新数量',
                                msg: '完成，后台反馈：' + data.Message,
                                cb: function(){
                                    eachList($('#modal-create .modal-body tbody:eq(0) tr:eq(0)').attr('data-id'));
                                }
                            });
                        }
                    }
                });
            });

            // 渲染单号
            common.Rendering.order($('#data-list'));

            // 回顶部按钮
            common.topBtn();

            <!-- BEGIN 分页脚本 ATTRIB= -->
            common.showPage({当前页}, {总条数}, {每页条数});
            <!-- END 分页脚本 -->
        }());
    </script>
</body>
</html>
