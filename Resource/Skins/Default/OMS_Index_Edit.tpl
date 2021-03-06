{页面属性}{/页面属性}
<body>
    {页顶导航}{/页顶导航}
    <!-- 内容-->
    <article id="main-article" class="container-fluid">
        <div id="panel-transaction" class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">交易信息<span id="AfterSale" class="glyphicon glyphicon-new-window poi pull-right"></span></h3>

            </div>
            <table class="table table-striped table-bordered table-hover table-condensed">
                <colgroup>
                    <col width="100px">
                    <col width="100px">
                    <col width="180px">
                    <col>
                    <col width="50px">
                    <col>
                    <col>
                    <col>
                    <col width="100px">
                </colgroup>
                <thead>
                    <tr>
                        <th>订单交易号</th>
                        <th>产品编码</th>
                        <th>SKU</th>
                        <th>包含产品</th>
                        <th>数量</th>
                        <th>价格</th>
                        <th>物流商</th>
                        <th>追踪号</th>
                        <th>创建时间</th>
                    </tr>
                </thead>
                <tbody></tbody>
                <tfoot class="hidden">
                    <tr>
                        <td colspan="11">
                            <div class="btn-group btn-group-sm">
                                <button class="btn btn-default" type="button">提交</button>
                                <button data-toggle="modal" data-target="#sku-discern" class="btn btn-info" type="button" title="识别"><span class="glyphicon glyphicon-link"></span></button>
                            </div>
                        </td>
                    </tr>
                </tfoot>
            </table>
        </div>

        <div class="row">
            <!-- 联系地址-->
            <div class="col-lg-4 col-sm-6">
                <div id="contact-address" class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">联系地址</h3>
                    </div>
                    <div class="panel-body">
                        <ul class="nav nav-tabs mg-b-20">
                            <li><a href="#eBay" data-toggle="tab">eBay</a></li>
                            <li class="active"><a href="#paypal" data-toggle="tab">PayPal</a></li>
                        </ul>

                        <div class="tab-content">

                            <div id="eBay" class="tab-pane">
                                <form class="form-horizontal" action="javascript:;">
                                    <input class="DataID" name="DataID" type="hidden">
                                    <input class="OID" name="OID" type="hidden">
                                    <div class="form-group form-group-sm">
                                        <label for="Name" class="col-xs-2 control-label">收件人</label>
                                        <div class="col-xs-10">
                                            <input type="text" class="form-control Name" name="Name" placeholder="收件人">
                                        </div>
                                    </div>
                                    <div class="form-group form-group-sm">
                                        <label for="Street1" class="col-xs-2 control-label">地址1</label>
                                        <div class="col-xs-10">
                                            <input type="text" class="form-control Street1" name="Street1" placeholder="地址1">
                                        </div>
                                    </div>
                                    <div class="form-group form-group-sm">
                                        <label for="Street2" class="col-xs-2 control-label">地址2</label>
                                        <div class="col-xs-10">
                                            <input type="text" class="form-control Street2" name="Street2" placeholder="地址2">
                                        </div>
                                    </div>
                                    <div class="form-group form-group-sm">
                                        <label for="City" class="col-xs-2 control-label">城市</label>
                                        <div class="col-xs-10">
                                            <input type="text" class="form-control City" name="City" placeholder="城市">
                                        </div>
                                    </div>
                                    <div class="form-group form-group-sm">
                                        <label for="State" class="col-xs-2 control-label">省份</label>
                                        <div class="col-xs-10">
                                            <input type="text" class="form-control State" name="State" placeholder="省份">
                                        </div>
                                    </div>
                                    <div class="form-group form-group-sm">
                                        <label for="ZIP" class="col-xs-2 control-label">邮编</label>
                                        <div class="col-xs-10">
                                            <input type="text" class="form-control ZIP" name="ZIP" placeholder="邮编">
                                        </div>
                                    </div>
                                    <div class="form-group form-group-sm">
                                        <label for="Country" class="col-xs-2 control-label">国家</label>
                                        <div class="col-xs-10">
                                            <input type="text" class="form-control Country" name="Country" placeholder="国家">
                                        </div>
                                    </div>
                                    <div class="form-group form-group-sm">
                                        <label for="Phone" class="col-xs-2 control-label">联系电话</label>
                                        <div class="col-xs-10">
                                            <input type="text" class="form-control Phone" name="Phone" placeholder="联系电话">
                                        </div>
                                    </div>
                                    <div class="form-group form-group-sm btn-box">
                                        <div class="col-sm-offset-2 col-xs-10">
                                            <div class="btn-group">
                                                <button type="submit" class="btn btn-default btn-sm">提交</button>
                                                <button id="btn-ebay-address-copy" type="button" class="btn btn-default btn-sm">复制地址</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>

                            <div id="paypal" class="tab-pane active">
                                <form class="form-horizontal" action="javascript:;">
                                    <input class="DataID" name="DataID" type="hidden">
                                    <input class="TID" name="TID" type="hidden">
                                    <div class="form-group form-group-sm">
                                        <label for="Name" class="col-xs-2 control-label">收件人</label>
                                        <div class="col-xs-10">
                                            <input type="text" class="form-control Name" name="Name" placeholder="收件人">
                                        </div>
                                    </div>
                                    <div class="form-group form-group-sm">
                                        <label for="Street1" class="col-xs-2 control-label">地址1</label>
                                        <div class="col-xs-10">
                                            <input type="text" class="form-control Street1" name="Street1" placeholder="地址1">
                                        </div>
                                    </div>
                                    <div class="form-group form-group-sm">
                                        <label for="Street2" class="col-xs-2 control-label">地址2</label>
                                        <div class="col-xs-10">
                                            <input type="text" class="form-control Street2" name="Street2" placeholder="地址2">
                                        </div>
                                    </div>
                                    <div class="form-group form-group-sm">
                                        <label for="City" class="col-xs-2 control-label">城市</label>
                                        <div class="col-xs-10">
                                            <input type="text" class="form-control City" name="City" placeholder="城市">
                                        </div>
                                    </div>
                                    <div class="form-group form-group-sm">
                                        <label for="State" class="col-xs-2 control-label">省份</label>
                                        <div class="col-xs-10">
                                            <input type="text" class="form-control State" name="State" placeholder="省份">
                                        </div>
                                    </div>
                                    <div class="form-group form-group-sm">
                                        <label for="ZIP" class="col-xs-2 control-label">邮编</label>
                                        <div class="col-xs-10">
                                            <input type="text" class="form-control ZIP" name="ZIP" placeholder="邮编">
                                        </div>
                                    </div>
                                    <div class="form-group form-group-sm">
                                        <label for="Country" class="col-xs-2 control-label">国家</label>
                                        <div class="col-xs-10">
                                            <input type="text" class="form-control Country" name="Country" placeholder="国家">
                                        </div>
                                    </div>
                                    <div class="form-group form-group-sm">
                                        <label for="Phone" class="col-xs-2 control-label">联系电话</label>
                                        <div class="col-xs-10">
                                            <input type="text" class="form-control Phone" name="Phone" placeholder="联系电话">
                                        </div>
                                    </div>
                                    <div class="form-group form-group-sm btn-box">
                                        <div class="col-sm-offset-2 col-xs-10">
                                            <div class="btn-group">
                                                <button type="submit" class="btn btn-default btn-sm">提交</button>
                                                <button id="btn-paypal-address-copy" type="button" class="btn btn-default btn-sm">复制地址</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>

                        </div>
                    </div>

                </div>
            </div>

            <!-- 金额与订单状态-->
            <div class="col-lg-2 col-sm-6">
                <div class="row">
                    <div class="col-lg-12 col-md-12">
                        <div id="status" class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">订单状态</h3>
                            </div>
                            <div class="panel-body"></div>
                        </div>
                    </div> 

                    <div class="col-lg-12 col-md-12">
                        <div id="panel-amt" class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">金额</h3>
                            </div>
                            <div class="panel-body"></div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 买家留言与备注-->
            <div class="col-lg-6 col-sm-6">
                <div id="buyer-remark"></div>

                <div id="buyer-message" class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">买家留言</h3>
                    </div>
                    <div class="panel-body">
                        <span class="text-danger"></span>
                    </div>
                </div>
            </div>

            <!-- 运单信息 -->
            <div id="panel-order" class="col-lg-8 col-smd-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">运单信息</h3>
                    </div>
                    <table class="table table-striped table-bordered table-hover table-condensed">
                        <thead>
                            <tr>
                                <th>仓库\运单号</th>
                                <th>货代\单号</th>
                                <th>服务商\单号</th>
                                <th>提审时间</th>
                                <th>日志</th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                    </table>
                </div>
            </div>

            <!-- 支付流水与交易信息-->
            <div class="col-lg-8 col-md-12 col-sm-12">
                <div id="panel-payments" class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">支付流水</h3>
                    </div>
                    <table class="table table-striped table-bordered table-hover table-condensed">
                        <thead>
                            <tr>
                                <th>流水编号</th>
                                <th>支付账号</th>
                                <th>状态</th>
                                <th>收款账号</th>
                                <th>金额</th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                    </table>
                </div>

                <div id="panel-details" class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">订单详情</h3>
                    </div>
                    <table class="table table-striped table-bordered table-hover table-condensed">
                        <thead>
                            <tr>
                                <th>订单号</th>
                                <th>账号</th>
                                <th>订单创建时间</th>
                                <th>状态</th>
                                <th>买家</th>
                                <th>出货时间</th>
                                <th>期望物流</th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                    </table>
                </div>
            </div>
        </div>

        <!-- 查看运单Log模态框 -->
        <div class="modal fade" id="modal-log" tabIndex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button class="close" type="button" data-dismiss="modal">x</button>
                        <h4 class="modal-title">运单操作记录</h4>
                    </div>
                    <div class="modal-body">
                        <div class="maxH800">
                            <table class="table table-hover table-bordered table-condensed table-striped">
                                <thead>
                                    <tr>
                                        <th>用户名</th>
                                        <th>操作记录</th>
                                        <th>操作时间</th>
                                    </tr>
                                </thead>
                                <tbody></tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </article>



    <!-- SKU-识别-->
    <div id="sku-discern" class="modal fade" tabIndex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="javascript:;" class="form-horizontal">
                    <div class="modal-header">
                        <button class="close" data-dismiss="modal"><span>&times;</span></button>
                        <h4 class="modal-title">SKU识别</h4>
                    </div>
                    <div class="modal-body"></div>
                    <div class="modal-footer">
                        <button type="reset" class="btn btn-default" data-dismiss="modal">取消</button>
                        <button type="submit" class="btn btn-primary">提交</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- 新建售后单选择框 -->
    <div class="modal fade" id="serviceModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button class="close" data-dismiss="modal">x</button>
                    <h4 class="modal-title">新建售后单 - 跳转</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" action="javascript:;">
                        <div class="form-group form-group-sm mg-b-5">
                            <label for="sell-cause" class="control-label col-sm-2">原因</label>
                            <div class="col-sm-4">
                                <select id="sell-cause" class="form-control customer-service-cause"></select>
                            </div>
                            <div class="col-sm-6">
                                <p id="sell-msg-cause" class="text-danger"></p>
                            </div>
                        </div>
                        <div class="form-group form-group-sm">
                            <label for="sell-handle" class="control-label col-sm-2">处理方式</label>
                            <div class="col-sm-4">
                                <select id="sell-handle" class="form-control">
                                    <option value="">请选择</option>
                                    <option value="退款">退款</option>
                                    <option value="重发">重发</option>
                                    <option value="额外退款">额外退款</option>
                                    <option value="账号退款">账号退款</option>
                                </select>
                            </div>
                            <div class="col-sm-6">
                                <p id="sell-msg-handle" class="text-danger"></p>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button id="service-jump" type="button" class="btn btn-default btn-sm">跳转</button>
                </div>
            </div>
        </div>
    </div>

    <!-- SKU识别-->
    <template id="temp-discern">
        {{#Transaction}}
        <div class="form-group form-group-sm" data-id="{{DataID}}">
            <div class="col-sm-6">
                <input type="text" class="form-control sku" placeholder="SKU" value="{{SKU}}">
            </div>
            <div class="col-sm-3">
                <input type="text" class="form-control quantity" placeholder="数量" value="{{Quantity}}">
            </div>
            <div class="col-sm-3">
                <div class="btn-group btn-group-sm">
                    <button type="button" class="save-sku btn btn-default">保存</button>
                    <button type="button" class="single-discern btn btn-info"><span class="glyphicon glyphicon-link"></span></button>
                </div>
            </div>
        </div>
        {{/Transaction}}
    </template>
    
    <!-- 金额-->
    <template id="temp-amt">
        <ul class="pd-l-10">
        {{#AmountOfMoney}}
            <li><strong>总额：</strong><span class="text-primary">{{Amt}}</span></li>
            <li><strong>货币：</strong><span class="label set-currency">{{Currency}}</span></li>
            <li><strong>付款时间：</strong><span class="text-primary">{{PaidTime}}</span></li>
            <li><strong>付款状态：</strong><span class="text-primary">{{eBayPaymentStatus}}</span></li>
            <li><strong>支付方式：</strong><span class="text-primary">{{PaymentMethod}}</span></li>
            <li><strong>运费：</strong><span class="text-primary">{{ShippingServiceCost}}</span></li>
        {{/AmountOfMoney}}
        </ul>
    </template>

    <!-- 支付方式模板-->
    <template id="temp-payments">
        {{#Payments}}
        <tr>
            <td>{{ReferenceID}}</td>
            <td>{{BuyerEmail}}</td>
            <td>{{Status}}</td>
            <td>{{ReceiverBusiness}}</td>
            <td><span class="label set-currency">{{Currency}}</span> {{Amount}}</td>
        </tr>
        {{/Payments}}
    </template>

    <!-- 交易信息模板-->
    <template id="temp-transaction">
        {{#Transaction}}
        <tr data-id="{{DataID}}">
            <td>{{OrderLineItemID}}</td>
            <td>{{ItemID}}</td>
            <td><input class="form-control input-sm sku" type="text" value="{{SKU}}"></td>
            <td>
                {{#Product}}
                    <p><div class="copy"><span class="poi mg-r-5" data-status="{{Status}}" data-clipboard-text="{{FullSKU}}" data-id="{{DataID}}" title="点击复制该SKU">[{{FullSKU}}]</span>{{FullName}} * {{Quantity}}</div></p>
                {{/Product}}
            </td>
            <td><input class="form-control input-sm quantity" type="text" value="{{Quantity}}"></td>
            <td>{{Price}}</td>
            <td>{{CarrierUsed}}</td>
            <td>{{TrackingNumber}}</td>
            <td>{{CreatedTime}}</td>
        </tr>
        {{/Transaction}}
    </template>

     <!-- 订单详情模板-->
    <template id="temp-details">
        <tr>
            <td>{{OrderID}}</td>
            <td>{{Shop}}</td>
            <td>{{#BaseStatus}}{{CreatedTime}}{{/BaseStatus}}</td>
            <td>{{#BaseStatus}}{{OrderStatus}}{{/BaseStatus}}</td>
            <td>{{Buyer}}</td>
            <td>{{#BaseStatus}}{{ShippedTime}}{{/BaseStatus}}</td>
            <td class="text-danger">{{#BaseStatus}}{{ShippingService}}{{/BaseStatus}}</td>
        </tr>
    </template>

    <!-- 运单信息模板 -->
    <template id="temp-order">
        {{#Logistics}}
        <tr>
            <td>{{Warehouse.Code}}<br><a name="order-a" href="javascript:;" target="_blank">{{OrderID}}</a></td>
            <td>{{Freight.ISP}}<br>{{Freight.InsideOrder}}</td>
            <td>{{Freight.Service.Support}}<br>{{Freight.Service.TrackingNumber}}</td>
            <td>{{CreatedDate}}</td>
            <td><span class="glyphicon glyphicon-list-alt poi" data-oid="{{OrderID}}" data-toggle="modal" data-target="#modal-log"></span></td>
        </tr>
        {{/Logistics}}
    </template>

    <!-- 操作记录模板  -->
    <template id="temp-log">
        {{#Log}}
        <tr>
            <td>{{Name}}</td>
            <td>{{Remark}}</td>
            <td>{{Date}}</td>
        </tr>
        {{/Log}}
    </template>

    {页面底部}{/页面底部}

    <script src="/Resource/js/mustache.js"></script>
    <script src="/Resource/js/ZeroClipboard.min.js"></script>
    <script src="/Resource/js/Remark.js"></script>
    <script src="/Resource/js/logistics-module.js"></script>
    <script src="/Resource/js/customer-service-option.js"></script>
    <script>
        (function () {
            'use strict';
            var currUID = <!-- BEGIN 当前用户ID ATTRIB= --><!-- END 当前用户ID -->;

            // 加载Flash按钮
            ZeroClipboard.config({swfPath: '/Resource/flash/ZeroClipboard.swf'});

            // 修改订单状态类型
            function statusTypeTransition(state) {
                var type1 = ['待审核', '已审核'],
                    type2 = ['待配货', '已配货'],
                    type3 = ['待交运', '已交运'],
                    type4 = ['待发货', '已发货'],
                    type5 = ['正常', '取消'],
                    type6 = ['正常', '阻止发货'],
                    type7 = ['正常', '缺货'];

                return [
                    type1[state.OMSType1],
                    type2[state.OMSType2],
                    type3[state.OMSType3],
                    type4[state.OMSType4],
                    type5[state.OMSType5],
                    type6[state.OMSType6],
                    type7[state.OMSType7]
                ];
            }

            // 获取已识别的SKUID
            function getDiscernID($dID) {
                var ids = '';
                $dID.each(function () {
                    ids += ',' + $(this).data('id');
                });
                return ids.substr(1);
            }

            
            // SKU识别返回处理
            function disposeDiscern($fg, data) {
                var fgHTML = '', len = data.DataList.length, i = 0, item;
                $fg.find('.col-sm-12').remove();
                if (len) {
                    fgHTML = '<div class="col-sm-12 return-flag" data-id="' + data.SkuID + '">';
                    for (; i < len; i++) {
                        item = data.DataList[i];
                        fgHTML += '<p class="form-control-static text-success">' + item.ProductName + ' * ' + item.Quantity + '</p>';
                    }
                    fgHTML += '</div>';
                } else {
                    fgHTML = '<div class="col-sm-12"><p class="form-control-static text-danger">' + data.Message + '</p></div>';
                }

                $fg.append(fgHTML);
            }

            var oParam = common.URL.parse(),
                $contactAddress = $('#contact-address'),
                $eBayAddress = $contactAddress.find('#eBay form'),
                $paypalAddress = $contactAddress.find('#paypal form'),
                $status = $('#status'),
                $buyerMessage = $('#buyer-message'),
                $panelAmt = $('#panel-amt'),
                tempAmt = $('#temp-amt').html(),
                $panelPayments = $('#panel-payments'),
                tempPayments = $('#temp-payments').html(),
                $panelTransaction = $('#panel-transaction'),
                tempTransaction = $('#temp-transaction').html(),
                $panelDetails = $('#panel-details'),
                tempDetails = $('#temp-details').html(),
                $panelRemark = $('#panel-remark'),
                $panelRemarkForm = $panelRemark.find('form'),
                $panelRemarktext = $panelRemark.find('textarea'),
                tempRemark = $('#temp-remark').html(),
                tempDiscern = $('#temp-discern').html(),
                $panelSKUDiscern = $('#sku-discern'),
                $resetBtn = $panelRemarkForm.find('input[type="reset"]'),
                $panelOrder = $('#panel-order'),
                tempOrder = $('#temp-order').html(),
                $modalLog = $('#modal-log'),
                tempLog = $('#temp-log').html();

            // 获取运单信息
            function GetOrderInfo(_o) {
                var ourl = "/logistics/API/?Do=LogisticsList&ReferenceID=" + _o;
                $.ajax({
                    url: ourl,
                    type: 'get',
                    dataType: 'json',
                    success: function(data){
                        var d = data,
                            url = "/Logistics/?Do=EDIT&OrderID=" + d.Logistics[0].OrderID;
                        $panelOrder.find('tbody').html(Mustache.render(tempOrder, d));
                        $panelOrder.find('tbody a').attr('href', url);
                        $panelOrder.find('tbody tr').each(function(i, n){
                            var ts = $(this);
                            ts.on('click', 'td:last span', function(){
                                $modalLog.find('tbody').html(Mustache.render(tempLog, d.Logistics[i]));
                            });
                        });
                        // var logOption = {
                        //     Element  : $('#panel-order>div.panel'), // 容器
                        //     OID      : '',                          // OID，和数据两者必须至少存在一个
                        //     Data     : data,                        // 数据，和OID两者必须至少存在一个
                        //     Placement: 'top',                       // 弹出框显示位置
                        //     Style    : 'table',                     // 显示样式
                        //     DateShow : true,
                        //     Mode     : 'append'
                        // };
                        // LogisticsModule(logOption);
                    },
                    error: function(data, status, e){
                        console.log("发生错误：" + e);
                    }
                });
            }


            // 初始化
            // 获取当前订单详情
            common.ajax({
                title: '获取订单内容',
                URL: '/OMS/API/?Do=Query&DataID=' + oParam.DataID,
                good: function (data) {
                    var d = data.DataList[0],
                        eBayAddress = d.Address.eBay,
                        paypalAddress = d.Address.PayPal;
                    $status.find('.panel-body').html(common.order.setStatus(statusTypeTransition(d.OMSType)));
                    $buyerMessage.find('.text-danger').html(d.BuyerMessage);
                    $panelAmt.find('.panel-body').html(Mustache.render(tempAmt, d));
                    $panelPayments.find('tbody').html(Mustache.render(tempPayments, d));
                    $panelTransaction.find('tbody').html(Mustache.render(tempTransaction, d));
                    $panelDetails.find('tbody').html(Mustache.render(tempDetails, d));

                    // 备注模块
                    var remarkOption = {
                        Target : $('#buyer-remark'),
                        DataID : oParam.DataID,
                        UID    : currUID,
                        HasWarp: false,
                        Title  : '备注'
                    };
                    Remark(remarkOption, data);

                    // 设置跳转售后
                    $('#AfterSale').attr({'data-val': d.DataID, 'title': '创建订单[' + d.DataID + ']的售后单'});

                    // 获取订单信息
                    GetOrderInfo(d.OrderID);

                    // SKU识别
                    $panelSKUDiscern.find('.modal-body').html(Mustache.render(tempDiscern, d));

                    //隐藏编辑和删除按钮
                    $panelRemark.find('table tr').each(function(){
                        $(this).find('div:eq(0)').hide();
                    });

                    // 运单中SKU可复制
                    var option = {
                        Link: {Ack: true},
                        Warehouse: {Ack: true, Placement: 'left'},
                        Label: {Ack: true}
                    };
                    common.copy.SkuCopy($panelTransaction.find('.copy'), option);

                    // 如果是查看订单
                    if (oParam.Do !== 'Edit') {
                        $panelTransaction.find('input').prop('readonly', true)    
                    }

                    $('#main-article .set-currency').each(function () {
                        var $this = $(this);
                        $this.addClass('label-' + common.order.amtCurrency($.trim($this.text())));
                    });

                    // ebay地址
                    $eBayAddress.find('.OID').val(oParam.DataID);
                    $eBayAddress.find('.DataID').val(eBayAddress.DataID);
                    $eBayAddress.find('.Name').val(eBayAddress.Name);
                    $eBayAddress.find('.Street1').val(eBayAddress.Street1);
                    $eBayAddress.find('.Street2').val(eBayAddress.Street2);
                    $eBayAddress.find('.City').val(eBayAddress.City);
                    $eBayAddress.find('.State').val(eBayAddress.State);
                    $eBayAddress.find('.ZIP').val(eBayAddress.ZIP);
                    $eBayAddress.find('.Country').val(eBayAddress.Country);
                    $eBayAddress.find('.Phone').val(eBayAddress.Phone);
                    AddressCopyBtn(eBayAddress, 'ebay');

                    // paypal地址
                    $paypalAddress.find('.TID').val(paypalAddress.DataID);
                    $paypalAddress.find('.DataID').val(paypalAddress.DataID);
                    $paypalAddress.find('.Name').val(paypalAddress.Name);
                    $paypalAddress.find('.Street1').val(paypalAddress.Street1);
                    $paypalAddress.find('.Street2').val(paypalAddress.Street2);
                    $paypalAddress.find('.City').val(paypalAddress.City);
                    $paypalAddress.find('.State').val(paypalAddress.State);
                    $paypalAddress.find('.ZIP').val(paypalAddress.ZIP);
                    $paypalAddress.find('.Country').val(paypalAddress.Country);
                    $paypalAddress.find('.Phone').val(paypalAddress.Phone);
                    AddressCopyBtn(paypalAddress, 'paypal');
                }
            });

            /**
             * 拼装并复制地址到剪切板
             * @param JSON    address 地址信息
             * @param String  type    地址信息
             */
            function AddressCopyBtn(address, type) {
                if (address.length != 0) {
                    var _data = address;
                    var $btn = $('#btn-' + type + '-address-copy');
                    // 用ebay的电话取代paypal的电话
                    if (type == 'paypal') {
                        _data.Phone = $eBayAddress.find('.Phone').val();
                    }

                    var _address = [];
                    _address.push(_data.Name, _data.Street1, _data.Street2, 
                                _data.City, _data.State, _data.ZIP, 
                                _data.Country, _data.Phone);

                    // 删除数组中空元素
                    for(var i = 0; i < _address.length; i++) {
                        if (_address[i].length == 0) {
                            _address.splice(i, 1);
                            i--;
                        }
                    }

                    // 把删除空元素后的数组组合成字符串,提供复制
                    var copy = _address.join(',');
                    var clip = new ZeroClipboard($btn);
                    clip.on('copy', function() {
                        clip.setText(copy);
                    });
                }
            }

            // 编辑订单
            if (oParam.Do === 'Edit') {
                $panelTransaction.find('tfoot').removeClass('hidden');
                $contactAddress.find('.btn-box').removeClass('hidden');

                // 修改eBay地址
                $eBayAddress.on('submit', function() {
                    common.ajax({
                        title: '修改eBay地址',
                        URL: '/OMS/Order.aspx?Do=UpdateAddress',
                        type: 'post',
                        data: $eBayAddress.serialize(),
                        good: function (data) {
                            
                            common.alert({
                                type: 'success',
                                title: '“修改eBay地址”操作：',
                                msg: data.Message || '成功！'
                            });
                        }
                    });
                });

                // 修改paypal地址
                $paypalAddress.on('submit', function() {
                    common.ajax({
                        title: '修改paypal地址',
                        URL: '/OMS/Order.aspx?Do=UpdatePayPalAddress',
                        type: 'post',
                        data: $paypalAddress.serialize(),
                        good: function (data) {
                            common.alert({
                                type: 'success',
                                title: '“修改paypal地址”操作：',
                                msg: data.Message || '成功！'
                            });
                        }
                    });
                });


                // 修改交易信息
                $panelTransaction.find('.btn-default').on('click', function() {
                    $panelTransaction.find('tbody tr').each(function () {
                        var $this = $(this),
                            sku = $this.find('.sku').val(),
                            quantity = $this.find('.quantity').val(),
                            dataID = $this.data('id');

                        common.ajax({
                            title: '修改交易信息',
                            URL: '/OMS/Order.aspx?Do=UpdateTransaction',
                            type: 'post',
                            data: {
                                DataID: dataID,
                                OID: oParam.DataID,
                                SKU: sku,
                                Quantity: quantity
                            },
                            good: function (data) {
                                common.alert({
                                    type: 'success',
                                    title: '“修改交易信息”操作：',
                                    msg: data.Message || '成功！'
                                });

                                // 同步识别窗口
                                $panelSKUDiscern.find('.form-group[data-id="' + dataID + '"]').find('.sku').val(sku).end()
                                    .find('.quantity').val(quantity);
                            }
                        });
                    });
                });
                
                // SKU识别
                $panelSKUDiscern.on('click', '.single-discern', function () {
                    var $formGroup = $(this).closest('.form-group');
                    common.ajax({
                        title: 'SKU识别',
                        URL: '/Product/Product.aspx?Do=SKU',
                        type: 'post',
                        data: {
                            SKU: $formGroup.find('input:eq(0)').val()
                        },
                        good: function(data) {
                            disposeDiscern($formGroup, data);
                        }
                    });
                });

                // 修改SKU
                $panelSKUDiscern.on('click', '.save-sku', function () {
                    var $this = $(this).closest('.form-group'),
                        sku = $this.find('.sku').val(),
                        quantity = $this.find('.quantity').val(),
                        dataID = $this.data('id');

                    common.ajax({
                        title: '修改SKU',
                        URL: '/OMS/Order.aspx?Do=UpdateTransaction',
                        type: 'post',
                        data: {
                            DataID: dataID,
                            OID: oParam.DataID,
                            SKU: sku,
                            Quantity: quantity
                        },
                        good: function(data) {
                            common.alert({
                                type: 'success',
                                title: '“修改SKU”操作：',
                                msg: data.Message || '成功！'
                            });

                            // 同步交易信息
                            $panelTransaction.find('tbody tr[data-id="' + dataID + '"]').find('.sku').val(sku).end()
                                .find('.quantity').val(quantity);
                        }
                    });
                });

                // SKU识别保存
                $panelSKUDiscern.find('form').on('submit', function () {
                    var $formGroup = $panelSKUDiscern.find('.form-group'),
                        $returnFlag = $panelSKUDiscern.find('.return-flag');

                    if ($returnFlag.length) {
                        $formGroup.each(function() {
                            var $this = $(this),
                                $returnFlag = $this.find('.return-flag');
                                
                            common.ajax({
                                title: '保存SKU',
                                URL: '/OMS/Order.aspx?Do=UpdateSKU',
                                type: 'post',
                                data: {
                                    DataID: $this.data('id'),
                                    OID: oParam.DataID,
                                    SKUID: getDiscernID($returnFlag)
                                },
                                good: function (data) {
                                    common.alert({
                                        type: 'success',
                                        msg: data.Message || '成功！'
                                    });
                                    $panelSKUDiscern.modal('hide');
                                }
                            });
                        });
                    } else {
                        $panelSKUDiscern.modal('hide');
                    }
                });
            } else {
                // 查看
                $panelTransaction.find('tfoot').remove();
                $contactAddress.find('input').prop('readonly', true).end().find('.btn-box').remove();
                $panelRemark.find('textarea').prop('readonly', true).end().find('input').remove();
                $panelRemarkForm.remove();
            }



            // 新建售后单方法
            $('#AfterSale').on('click', function() {
                var did = $(this).data('val');
                // 点击跳转按钮时触发
                $('#service-jump').off().on('click', function() {
                    var sc = IfSelected($('#sell-cause'), $('#sell-msg-cause'), '售后原因');
                    var sh = IfSelected($('#sell-handle'), $('#sell-msg-handle'), '处理方式');
                    if (sc && sh) {
                        var serviceHref = '/CustomerService/?Do=Doing'
                                        + '&DataID=' + did
                                        + '&Types=' + $('#sell-cause').val()
                                        + '&ExecuteMode=' + $('#sell-handle').val();
                        window.open(serviceHref);
                        $('#serviceModal').modal('hide');
                    }
                    
                });

                $('#serviceModal').modal('show');
            }); // 新建售后单方法 - End

            /**
             * 判断是否已经选择
             * @param {Object} _se   select元素
             * @param {Object} _msg  提示框
             * @param {String} _text 提示文本
             */
            function IfSelected(_se, _msg, _text) {
                var _re;
                if (_se.val() == '' || _se.val() == null) {
                    _se.addClass('fs');
                    _msg.text('请先选择' + _text);
                    _re = false;
                } else if(_se.hasClass('fs')) {
                    _se.removeClass('fs');
                    _msg.empty();
                    _re = true;
                } else {
                    _re = true;
                }
                return _re;
            }

        }());
    </script>
</body>
</html>
