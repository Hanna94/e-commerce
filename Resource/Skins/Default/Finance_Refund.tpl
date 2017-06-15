{页面属性}{/页面属性}
<body>
    {页顶导航}{/页顶导航}
    <!-- 内容-->
    <div class="container-fluid">
        <header>
            <div class="btn-group btn-group-sm pull-right">
                <button id="service-cancel" class="btn btn-success btn-sm" type="button"><span class="glyphicon glyphicon-remove"></span> 撤销售后单</button>
            </div>
        </header>
        <ul class="nav nav-tabs">
            <li><a href="?Do=All">全部</a></li>
            <li><a href="?Do=UnExecute">待处理</a></li>
            <li><a href="?Do=Complete">已完成</a></li>
            <li><a href="?Do=Cancel">已取消</a></li>
        </ul>
        <div class="tab-content">
            <form id="form-search" class="form-inline mg-t-10 mg-b-10" action="?">
                <div class="input-group input-group-sm">
                    <input type="text" class="form-control" placeholder="请款说明 / 售后单号" name="KeyWord">
                    <span class="input-group-btn">
                        <button class="btn btn-default" type="submit"><span class="glyphicon glyphicon-search"></span> 搜索</button>
                    </span>
                </div>
                <div class="form-group" id="product-search"></div>
            </form>
            <div class="maxH800 mg-t-5">
                <table id="data-list" class="table table-striped table-bordered table-hover table-condensed">
                    <thead>
                        <th>编号</th><th>售后单号</th><th>申请人</th><th>售后单说明</th><th>订单总金额</th><th>售后金额</th><th>状态</th><th>时间</th><th>操作</th>
                    </thead>
                    <tbody>
                        <!-- BEGIN 数据列表 ATTRIB= -->
                        <tr data-id="{DataID}">
                            <td><label class="checkbox-inline"><input type="checkbox">{DataID}</label></td>
                            <td class="orderID">{ReferenceID}</td>
                            <td>{ApplyName}</td>
                            <td class="title">{Title}</td>
                            <td><span class="label currency">{CurrencyID}</span> {Amt}</td>
                            <td><span class="label currency">{CurrencyID}</span> {ExecuteAmt}</td>
                            <td class="status">{Status}</td>
                            <td>{Date}</td>
                            <td>
                                <span class="btn-edit glyphicon glyphicon-eye-open poi" title="查看"></span>
                                <span class="btn-log glyphicon glyphicon-list-alt poi" title="日志"></span>
                            </td>
                        </tr>
                        <!-- END 数据列表 -->
                    </tbody>
                    <tfoot><tr><td colspan="9"></td></tr></tfoot>
                </table>
            </div>
        </div>
    </div>
    
    <!-- 请款单详情模态框 -->
    <div id="modal-refund" class="modal fade" tabIndex="-1">
        <div class="modal-dialog" style="width:1100px">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                    <h4 class="modal-title">处理售后请款单<small id="refund-title"></small></h4>
                </div>
                <div class="modal-body">
                    <ul class="nav nav-tabs mg-b-5">
                        <li class="active"><a id="nav-tag-service" href="#nav-refund" data-toggle="tab">售后请款</a></li>
                        <li><a id="nav-tag-order" href="#nav-order" data-toggle="tab">订单详情</a></li>
                        <li><a id="nav-tag-log" href="#nav-log" data-toggle="tab">日志</a></li>
                    </ul>
                    <div class="tab-content">
                        <div id="nav-refund" class="tab-pane fade in active">
                            <div class="row">
                                <!-- 左边栏 -->
                                <div class="col-sm-8">

                                    <!-- 售后单信息 -->
                                    <div id="refund-info" class="col-sm-12 bd-r">
                                        <div class="form-horizontal">
                                            <div id="service-info" class="form-group">
                                                <label class="col-sm-3 control-label">售后单说明：</label>
                                                <div class="col-sm-9">
                                                    <p class="form-control-static"></p>
                                                </div>
                                            </div>
                                        </div>
                                        <hr class="mg-b-5">
                                    </div>

                                    <!-- 请款单列表 -->
                                    <div id="refund-list" class="col-sm-12 maxH300 bd-r">
                                        <table class="table table-striped table-bordered table-hover table-condensed">
                                            <thead><th>金额</th><th>申请人</th><th>状态</th><th>申请时间</th><th>操作</th></thead>
                                            <tbody></tbody>
                                        </table>
                                        <hr class="mg-b-5">
                                    </div>
                                    
                                    <div class="col-sm-12 bd-r">
                                        <div class="row">
                                            <!-- PayPal本地数据列表 -->
                                            <div id="paypal-local-list" class="col-sm-12 maxH300">
                                                <table class="table table-striped table-bordered table-hover table-condensed">
                                                    <caption>PayPal本地数据</caption>
                                                    <thead><th>交易</th><th>金额</th><th>时间</th></thead>
                                                    <tbody></tbody>
                                                </table>
                                            </div>

                                            <!-- PayPal远程数据列表 -->
                                            <div id="paypal-online-list" class="col-sm-12 maxH300 hidden">
                                                <table class="table table-striped table-bordered table-hover table-condensed">
                                                    <caption>PayPal远程数据</caption>
                                                    <thead><th>交易号</th><th>时间</th><th>状态</th><th>买家</th><th>金额</th></thead>
                                                    <tbody></tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- 右边栏 -->
                                <div class="col-sm-4">
                                    <div id="refund-remark"></div>
                                </div>
                            </div>
                        </div>
                        <!-- 订单详情 -->
                        <div id="nav-order" class="tab-pane fade" data-id="">
                            <div class="row">
                                <div id="order-detailed" class="col-sm-8 maxH550">
                                    <p>暂无订单详情信息</p>
                                </div>
                                <div class="col-sm-4">
                                    <div id="order-remark"></div>
                                </div>
                            </div>
                            
                        </div>
                        <!-- 日志 -->
                        <div id="nav-log" class="tab-pane fade">
                            <p>暂无操作日志信息</p>
                        </div>
                    </div> 
                </div>
            </div>
        </div>
    </div>

    <!-- 操作日志模态框 -->
    <div id="modal-log" class="modal fade" tabIndex="-1">
        <div class="modal-dialog" style="width: 1080px;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                    <h4 class="modal-title">操作日志</h4>
                </div>
                <div class="modal-body"></div>
            </div>
        </div>
    </div>
    
    <!-- 模态框请款单列表模板 -->
    <template id="template-refund">
        {{#Order}}
        <tr data-did="{{DataID}}" data-status="{{Status}}">
          <td>{{CurrencyCode}} {{ExecuteAmt}}</td><td>{{ApplyName}}</td><td>{{Status}}</td><td>{{Date}}</td>
          <td>
            <div class="btn-group">
              <button type="button" class="btn btn-default btn-xs btn-perform" 
              data-toggle="popover" data-html="true" data-container="body" data-placement="left" 
              data-content="
                <div class=&quot;row maxW400&quot;>
                  <div class=&quot;col-sm-12&quot;>
                    <form class=&quot;form-horizontal&quot; action=&quot;javascript:;&quot;>
                      <label class=&quot;col-sm-4 control-label&quot;>TransactionID</label>
                      <div class=&quot;col-sm-8&quot;>
                        <p class=&quot;form-control-static&quot;>{{TransactionID}}</p>
                      </div>
                      <label class=&quot;col-sm-4 control-label&quot;>Amt</label>
                      <div class=&quot;col-sm-8&quot;>
                        <p class=&quot;form-control-static&quot;>{{CurrencyCode}} {{Amt}}</p>
                      </div>
                      <label class=&quot;col-sm-4 control-label&quot;>ExecuteAmt</label>
                      <div class=&quot;col-sm-6&quot;>
                        <p class=&quot;form-control-static&quot;>{{CurrencyCode}} {{ExecuteAmt}}</p>
                      </div>
                      <div class=&quot;col-sm-2&quot;>
                        <button id=&quot;popover-btn-perform-{{DataID}}&quot; data-did=&quot;{{DataID}}&quot; type=&quot;button&quot; class=&quot;btn btn-default btn-sm&quot;>执行</button>
                      </div>
                    </form>
                  </div>
                  <div class=&quot;col-sm-12&quot;>
                    <hr class=&quot;mg-b-5&quot;>
                    <form class=&quot;form-horizontal&quot; action=&quot;javascript:;&quot;>
                        <label class=&quot;col-sm-4 control-label&quot;>{{Types}}</label>
                        <div class=&quot;col-sm-8&quot;>
                            <p class=&quot;form-control-static&quot;>{{CurrencyCode}} {{ExecuteAmt}}</p>
                        </div>
                        <label class=&quot;col-sm-4 control-label&quot;>退款说明</label>
                        <div class=&quot;col-sm-8&quot;>
                            <p class=&quot;form-control-static&quot;>{{ToBuyerMessage}}</p>
                        </div>
                    </form>
                    <div id=&quot;result-list-{{DataID}}&quot; class=&quot;hidden&quot;>
                        <table class=&quot;table table-striped table-bordered table-hover table-condensed&quot;>
                            <thead><th>Project</th><th>Values</th></thead>
                            <tbody></tbody>
                        </table>
                    </div>
                  </div>
                  <div class=&quot;col-sm-12&quot;>
                    <small>* 按X可关闭执行框，按Esc可关闭执行框以及售后请款单窗口。</small>
                  </div>
                </div>
              ">执行</button>
              <button type="button" class="btn btn-default btn-xs btn-update" title="更新PayPal远程数据">远程</button>
              <button type="button" class="btn btn-default btn-xs btn-cancel" title="撤销请款单">撤销</button>
            </div>
          </td>
        </tr>
        {{/Order}}
    </template>

    {页面底部}{/页面底部}
    <script src="/Resource/js/ZeroClipboard.min.js"></script>
    <script src="/Resource/js/Remark.js"></script>
    <script src="/Resource/js/mustache.js"></script>
    <script src="/Resource/js/logistics-module.js"></script>
    <script>
        $(function(){
            'use strict';

            var op = common.URL.parse();
            var $datalist = $('#data-list');
            var currentUID = <!-- BEGIN 当前用户ID ATTRIB= --><!-- END 当前用户ID -->;

            // ===================================== 售后请款单模态框 ====================================================
            (function() {
                // 点击查看按钮
                var currentDataID;
                $datalist.on('click', '.btn-edit', function() {
                    var thisDataID = $(this).closest('tr').data('id');
                    // 模态框内容加载
                    thisDataID != currentDataID && ModalLoad(thisDataID);
                    currentDataID = thisDataID;
                    common.loading.show();
                    // 打开模态框
                    $('#modal-refund').modal('show');
                    common.loading.hide();
                });
            })();

            /**
             * 模态框内容加载
             * @param {String} DataID 售后请款单的DataID
             */
            function ModalLoad(DataID) {
                // 请款模块加载
                RefundLoad(DataID);
            }

            // 请款模块加载
            function RefundLoad(DataID) {
                // 获取售后请款单数据
                $.ajax({
                    url     : '/Finance/API/?Do=RefundQuery&DataID=' + DataID,
                    type    : 'GET',
                    
                    success : function(data) {
                        // 售后单信息
                        $('#service-info p').text(data.Order.Title);
                        // 请款单列表
                        $('#refund-list tbody').html(Mustache.render($('#template-refund').html(), data));
                        $("[data-toggle='popover']").popover();
                        // 按Esc键或X键可关闭弹出框
                        $(document).keydown(function(e) {
                            e = event || window.event;
                            (e.keyCode == 88 || e.keyCode == 27) && $(".popover").popover('hide');
                        });
                        // 绑定请款单操作按钮事件
                        var _do = data.Order;
                        RefundOperation({
                            DataID       : _do.DataID, 
                            OrderID      : _do.OrderID,
                            TransactionID: _do.TransactionID, 
                            OID          : _do.OID
                        });

                        // PayPal本地数据列表
                        var PayPalLocalTemplate = '{{#PayPalTransaction}}'
                                                  + '<tr>'
                                                    + '<td>{{TransactionID}}</td><td>{{CurrencyCode}} {{Amt}}</td><td>{{OrderTime}}</td>'
                                                  + '</tr>'
                                                + '{{/PayPalTransaction}}';
                        $('#paypal-local-list tbody').html(Mustache.render(PayPalLocalTemplate, data));

                        // 订单详情模块加载
                        $('#nav-tag-order').one('click', function() {
                            common.loading.show();
                            $.ajax({
                                url     : '/OMS/API/?Do=Query&DataID=' + data.Order.OID,
                                type    : 'GET',
                                
                                success : function(data_o) {
                                     $('#nav-order').attr('data-id', data_o.DataID);
                                     // 订单详情
                                     OrderDetailedLoad(data_o.DataList[0]);
                                     // 订单备注
                                     var orderOption = {
                                         Target : $('#order-remark'),
                                         Title  : '订单备注',
                                         DataID : data.Order.OID,
                                         UID    : currentUID,
                                         HasWarp: false
                                     };
                                     Remark(orderOption, data_o);
                                     common.loading.hide();
                                }
                            }); 
                        });

                        // 售后单备注
                        var sellOption = {
                            Target : $('#refund-remark'),
                            Title  : '售后单备注',
                            DataID : data.Order.CustomerServiceID,
                            UID    : currentUID,
                            HasWarp: false,
                            SaveURL: '/CustomerService/API/?Do=MessageSave',
                            GetURL : '/CustomerService/API/?Do=MessageQuery&FID=',
                            DelURL : '/CustomerService/API/?Do=MessageDelete'
                        };
                        Remark(sellOption);

                        // 操作日志
                        $('#nav-tag-log').one('click', function() {
                            common.Log($('#nav-log'), data);
                        });
                    }
                });
            }
            // 订单详情模块加载
            function OrderDetailedLoad(Data) {
                    var $od = $('#order-detailed');
                    // 订单详情
                    var tableOrder = $('<table class="table table-striped table-bordered table-hover table-condensed">'
                                       + '<caption>订单详情</caption>'
                                       + '<thead><th>订单号</th><th>账号</th><th>买家</th><th>创建时间</th><th>状态</th><th>出货时间</th><th>期望物流</th></thead><tbody></tbody>'
                                     + '</table>');
                    var tmpOrder = '<tr>'
                                   + '<td>{{OrderID}}</td>'
                                   + '<td>{{Shop}}</td>'
                                   + '<td>{{Buyer}}</td>'
                                   + '{{#BaseStatus}}'
                                   + '<td>{{CreatedTime}}</td>'
                                   + '<td>{{OrderStatus}}</td>'
                                   + '<td>{{ShippedTime}}</td>'
                                   + '<td class="text-danger">{{ShippingService}}</td>'
                                   + '{{/BaseStatus}}'
                                 + '</tr>';
                    tableOrder.find('tbody').html(Mustache.render(tmpOrder, Data));
                    $od.html(tableOrder);
                    // 金额信息
                    var tableAmount = $('<table class="table table-striped table-bordered table-hover table-condensed">'
                                        + '<caption>金额信息</caption>'
                                        + '<thead><th>总额</th><th>货币</th><th>付款时间</th><th>付款状态</th><th>支付方式</th><th>运费</th></thead><tbody></tbody>'
                                      + '</table>');
                    var tmpAmount = '{{#AmountOfMoney}}'
                                  + '<tr>'
                                    + '<td>{{Amt}}</td>'
                                    + '<td>{{Currency}}</td>'
                                    + '<td>{{PaidTime}}</td>'
                                    + '<td>{{eBayPaymentStatus}}</td>'
                                    + '<td>{{PaymentMethod}}</td>'
                                    + '<td>{{ShippingServiceCost}}</td>'
                                  + '</tr>'
                                  + '{{/AmountOfMoney}}';
                    tableAmount.find('tbody').html(Mustache.render(tmpAmount, Data));
                    $od.append(tableAmount);
                    // 支付流水
                    var tablePayments = $('<table class="table table-striped table-bordered table-hover table-condensed">'
                                          + '<caption>支付流水</caption>'
                                          + '<thead><th>流水编号</th><th>支付账号</th><th>状态</th><th>收款账号</th><th>金额</th></thead><tbody></tbody>'
                                        + '</table>');
                    var tmpPayments = '{{#Payments}}'
                                    + '<tr>'
                                      + '<td>{{ReferenceID}}</td>'
                                      + '<td>{{BuyerEmail}}</td>'
                                      + '<td>{{Status}}</td>'
                                      + '<td>{{ReceiverBusiness}}</td>'
                                      + '<td><span class="label set-currency">{{Currency}}</span> {{Amount}}</td>'
                                    + '</tr>'
                                    + '{{/Payments}}';
                    tablePayments.find('tbody').html(Mustache.render(tmpPayments, Data));              
                    $od.append(tablePayments);
                    // 交易信息
                    var tableTransaction = $('<table class="table table-striped table-bordered table-hover table-condensed">'
                                             + '<caption>交易信息</caption>'
                                             + '<thead>'
                                               + '<th>订单交易号</th><th>产品编码</th><th>SKU</th><th colspan="2">包含产品</th>'
                                             + '</thead>'
                                             + '<tbody class="t-1"></tbody>'
                                             + '<thead>'
                                               + '<th>创建时间</th><th>价格</th><th>物流商</th><th>追踪号</th><th>数量</th>'
                                             + '</thead>'
                                             + '<tbody class="t-2"></tbody>'
                                           + '</table>');
                    var tmpTransaction_1 = '{{#Transaction}}'
                                         + '<tr>'
                                           + '<td>{{OrderLineItemID}}</td>'
                                           + '<td>{{ItemID}}</td>'
                                           + '<td>{{SKU}}</td>'
                                           + '<td colspan="2">'
                                           + '{{#Product}}'
                                           +   '[{{FullSKU}}]{{FullName}} * {{Quantity}}'
                                           + '{{/Product}}'
                                           + '</td>'
                                         + '</tr>'
                                         + '{{/Transaction}}';
                    var tmpTransaction_2 = '{{#Transaction}}'
                                         + '<tr>'
                                           + '<td>{{CreatedTime}}</td>'
                                           + '<td>{{Price}}</td>'
                                           + '<td>{{CarrierUsed}}</td>'
                                           + '<td>{{TrackingNumber}}</td>'
                                           + '<td>{{Quantity}}</td>'
                                         + '</tr>'
                                         + '{{/Transaction}}';
                    tableTransaction.find('tbody.t-1').html(Mustache.render(tmpTransaction_1, Data));
                    tableTransaction.find('tbody.t-2').html(Mustache.render(tmpTransaction_2, Data));
                    $od.append(tableTransaction);

                    // 运单信息
                    $od.append('<div id="order-logistics"><span class="text-muted mg-b-10">运单信息</span></div>');
                    var logOption = {
                        Element  : $('#order-logistics'), // 容器
                        OID      : Data.OrderID,          // OID，和数据两者必须至少存在一个
                        Data     : '',                    // 数据，和OID两者必须至少存在一个
                        Placement: 'top',                 // 弹出框显示位置
                        Style    : 'table',               // 显示样式
                        DateShow : true,
                        Mode     : 'append'
                    };
                    LogisticsModule(logOption);
            }

            // 绑定请款单操作按钮事件
            function RefundOperation(Data) {
                var $refundlist = $('#refund-list');
                var status = $refundlist.find('tbody tr').data('status');
                var canOperation = status != '已取消' && status != '已完成';
                // 执行
                $refundlist.off('click', '.btn-perform').on('click', '.btn-perform', function() {
                    var btnID = '#popover-btn-perform-' + Data.DataID;
                    canOperation ? $(btnID).off().on('click', function() {
                        common.loading.show();
                        $.ajax({
                            url: '/Finance/API/?Do=RefundExecute',
                            type: 'POST',
                            
                            data: {
                                DataID: Data.DataID
                            },
                            success: function(data) {
                                console.log(data);
                                common.loading.hide();
                                common.alertIf({
                                    data : data,
                                    title: '执行售后请款单',
                                    tcb  : function() {
                                        // 隐藏并销毁弹出框
                                        $('#modal-refund [data-toggle="popover"]').popover('destroy');
                                        // 执行成功后，刷新模态框
                                        RefundLoad(Data.DataID);
                                        // 模态框关闭后刷新页面
                                        $('#modal-refund').one('hidden.bs.modal', function() {
                                            window.location.reload();
                                        });
                                        
                                    }
                                });
                            }
                        });
                    }) : $(btnID).prop('disabled', true);
                });
                // 打开模态框直接获取paypal远程数据，按远程按钮可刷新数据
                GetPayPalData(Data);
                $refundlist.off('click', '.btn-update').on('click', '.btn-update', function() {
                    GetPayPalData(Data);
                });
                // 撤销
                canOperation ? $refundlist.off('click', '.btn-cancel').on('click', '.btn-cancel', function() {
                    if (confirm('确定撤销该售后请款单？')) {
                        common.loading.show();
                        $.ajax({
                            url     : '/Finance/API/?Do=RefundCancel',
                            type    : 'POST',
                            
                            data    : {
                                OrderID: Data.OrderID,
                                DataID : Data.DataID
                            },
                            success : function(data) {
                                common.alertIf({
                                    data : data,
                                    title: '撤销售后请款单',
                                    tcb  : function() {
                                        window.location.reload();
                                    }
                                });
                                common.loading.hide();
                            }
                        });
                    }
                }) : $refundlist.find('.btn-cancel').prop('disabled', true);
            }

            // 获取远程PayPal数据
            function GetPayPalData(Data) {
                $('#paypal-online-list').find('tbody').empty().html('<tr><td colspan="5">数据加载中...</td></tr>')
                                        .end().removeClass('hidden');
                $.ajax({
                    url     : '/OMS/API/PayPal.aspx?Do=SearchTransaction&TransactionID=' + Data.TransactionID,
                    type    : 'GET',
                    
                    success : function(data) {
                        // PayPal远程数据列表
                        var PayPalOnlineTemplate = '{{#DataList}}'
                                                  + '<tr>'
                                                    + '<td>{{TransactionID}}</td><td>{{OrderTime}}</td><td>{{PaymentStatus}}</td>'
                                                    + '<td>{{Name}}</td><td>{{CurrencyCode}} {{Amt}}</td>'
                                                  + '</tr>'
                                                + '{{/DataList}}';
                        $('#paypal-online-list').find('tbody').html(Mustache.render(PayPalOnlineTemplate, data));
                    },
                    error: function(q, w, e) {
                        console.log('远程数据加载失败。。。');
                        console.log('原因：' + e);
                    }
                });
            }

            // ===================================== 售后请款单模态框 - End ==============================================
            
            // ===================================== 主页面 ==============================================================
            (function() {
                // 产品搜索
                var searchOption = {
                    inForm   : true,              // 是否在form中
                    isLimit  : false,             // 是否迷你模式
                    mode     : true,              // 是否是完整搜索
                    SkuID    : op.SkuID || false, // 搜索框初始化，使用是时需要有var op = common.URL.parse();
                    placement: 'bottom'           // 库存显示位置，默认为下。非必要
                };
                common.SkuSearch($('#product-search'), searchOption);
                // 单号渲染
                common.Rendering.order($datalist);
                // 货币渲染
                common.Rendering.currency($datalist);
                // 状态渲染
                var StatusOption = {
                    Type : ['待处理', '已完成', '已取消'],                     // 状态类型
                    Style: ['label-default', 'label-success', 'label-danger'], // 状态样式，有默认可不填
                    Mode : 'replace'
                }
                common.Rendering.All($('#data-list .status'), StatusOption);
                // 标签页定位
                var labelOption = {
                    Nav    : $('.nav'),        // 标签页元素
                    Do     : op.Do,            // URL中Do的值；使用common.URL.parse()获取
                    KeyWord: op.KeyWord,       // URL中KeyWord的值；使用common.URL.parse()获取;可能为空
                    Form   : $('#form-search') // 搜索框的form元素 
                };
                common.WebCommon(labelOption);
                // 操作记录
                $('#data-list').on('click', '.btn-log', function() {
                    $.ajax({
                        url        : '/Finance/API/?Do=RefundQuery&DataID=' + $(this).closest('tr').data('id'),
                        type       : 'GET',
                        dataType   : 'JSON',
                        success : function(data) {
                            common.Log($('#modal-log .modal-body'), data);
                            $('#modal-log').modal('show');
                        }
                    });
                    
                });

                // 撤销售后请款单
                $('#service-cancel').on('click', function() {
                    if($('#data-list input:checked').length != 1) {
                        alert('每次只支持撤销一条申请。');
                    }else {

                        if (confirm('确定撤销该售后请款单？')) {
                            common.loading.show();
                            $.ajax({
                                url     : '/Finance/API/?Do=RefundCancel',
                                type    : 'POST',
                                
                                data    : {
                                    DataID : $('#data-list input:checked').closest('tr').data('id')
                                },
                                success : function(data) {
                                    common.alertIf({
                                        data : data,
                                        title: '撤销售后请款单',
                                        tcb  : function() {
                                            window.location.reload();
                                        }
                                    });
                                    common.loading.hide();
                                }
                            });
                        }
                    }
                });
                
                // 当模态框关闭时，重置模态框
                (function() {
                    $('#modal-refund').on('hidden.bs.modal', function() { ModalReset(); });
                })();
                // 模态框重置
                function ModalReset() {
                    TagReset();      // 标签页重置
                    PayPalReset();   // PayPal远程数据列表重置
                }
                // 标签页重置
                function TagReset() {
                    $('#nav-tag-service').click();
                    $('#nav-tag-order').off();
                    $('#order-detailed').html('<p>暂无订单详情信息。</p>');
                    $('#nav-tag-log').off();
                    $('#nav-log').html('<p>暂无操作日志信息。</p>');
                }
                // PayPal远程数据列表重置
                function PayPalReset() {
                    $('#paypal-online-list').addClass('hidden').find('tbody').empty();
                }

                // 渲染额外退款
                !function() {
                    $('#data-list .title').each(function(index, element) {
                        var text = $(element).text();
                        text = text.replace('额外退款', '<span class="label label-danger">额外退款</span>');
                        $(element).html(text);
                    });
                }();

                // 分页
                <!-- BEGIN 分页脚本 ATTRIB= -->
                common.showPage({当前页}, {总条数}, {每页条数});
                <!-- END 分页脚本 -->
            })();
            // ===================================== 主页面 -End =========================================================
        });
    </script>
</body>
</html>
