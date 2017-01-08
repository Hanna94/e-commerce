{页面属性}{/页面属性}
<body>
    {页顶导航}{/页顶导航}
    <!-- 内容-->
    <div id="data-list" class="container-fluid">
        <header>
            <div class="btn-group btn-group-sm pull-right">
                <button class="btn btn-default" data-toggle="modal" data-target="#modal-sell" type="button">创建</button>
                <button class="btn btn-default" type="button">取消</button>
            </div>
        </header>
        <ul class="nav nav-tabs mg-b-5">
            <li class="active"><a href="?Do=All">全部</a></li>
            <li><a href="?Do=Doing">进行中</a></li>
            <li><a href="?Do=Complete">已结束</a></li>
            <li><a href="?Do=Cancel">已取消</a></li>
        </ul>        
        <form action="?" class="form-inline mg-r-20 mg-b-10">
            <div class="form-group form-group-sm mg-r-15 pull-lift">
                <select id="TeamID" class="form-control" name="TeamID" data-default="{TeamID}">
                    <option value="0">WZA</option>
                    <option value="1">WZB</option>
                    <option value="2">WZC</option>
                </select>
                <input type="text" class="form-control" placeholder="BuyerID">
                <button class="btn btn-default btn-sm" type="submit">查询</button>
            </div>
            <div id="common-sreach" class="form-group"></div>
        </form>
        <div class="row">
            <div class="col-sm-12">
                <div class="maxH800">
                    <table class="table table-striped table-bordered table-hover table-condensed">
                        <thead>
                            <th><input id="" type="checkbox"></th>
                            <th>单号</th>
                            <th>账号</th>
                            <th>买家ID</th>
                            <th>订单</th>
                            <th>产品</th>
                            <th>金额</th>
                            <th>原因</th>
                            <th>处理方式</th>
                            <th>状态</th>
                            <th>创建时间</th>
                            <th>操作</th>
                        </thead>
                        <tbody>
                            <!-- BEGIN 数据列表 ATTRIB= -->
                            <tr>
                                <td><input type="checkbox" value="{DataID}"></td>
                                <td>{OrderID}</td>
                                <td>{ShopName}</td>
                                <td>{BuyerID}</td>
                                <td>{OID}</td>
                                <td>{SkuID}{FullSku}{FullName}{Quantity}</td>
                                <td>{CurrencyID}{Amount}</td>
                                <td>{Types}</td>
                                <td>{ExecuteMode}</td>
                                <td>{Status}</td>
                                <td>{Date}</td>
                                <td>
                                    <span class="poi edit-sell glyphicon glyphicon-pencil mg-r-5" title="编辑"></span>
                                    <span class="poi sell-log glyphicon glyphicon-list-alt" title="日志"></span>
                                </td>
                            </tr>
                            <!-- END 数据列表 -->
                        </tbody>
                        <tfoot><tr><td colspan="12"></td></tr></tfoot>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!-- 售后单模态框 -->
    <div id="modal-sell" class="modal fade" tabIndex="-1">
        <div class="modal-dialog" style="width:1100px">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                    <h4 class="modal-title">设置售后单<small id="sell-info"></small></h4>
                </div>
                <div class="modal-body">
                    <ul class="nav nav-tabs mg-b-5">
                        <li class="active"><a href="#nav-sell" data-toggle="tab">售后设置</a></li>
                        <li><a href="#nav-order" data-toggle="tab">订单详情</a></li>
                        <li><a href="#nav-log" data-toggle="tab">日志</a></li>
                    </ul>
                    <div class="tab-content">
                        <div id="nav-sell" class="tab-pane fade in active">
                            <form class="form-horizontal" role="form">
                            <!-- 售后设置 -->
                                <div class="row">
                                    <div class="col-sm-8">
                                        <div class="col-sm-12 bd-r">
                                            <div id="sell-search" class="form-group form-group-sm mg-b-5">
                                                <label class="control-label col-sm-2">查询订单</label>
                                                <div class="col-sm-4">
                                                    <div class="input-group">
                                                        <input type="text" class="form-control" placeholder="订单号 / BuyerID">
                                                        <span class="input-group-btn">
                                                            <button id="btn-search" class="btn btn-default btn-sm" type="button">查询</button>
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6">
                                                    <button id="search-list-toggle" class="btn btn-default btn-sm hidden" type="button">
                                                        <span class="glyphicon glyphicon-chevron-down"></span>
                                                    </button>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-sm-12 maxH200">
                                                    <table id="order-list" class="table table-striped table-bordered table-hover table-condensed hidden">
                                                        <thead>
                                                            <th>订单号</th>
                                                            <th>账号</th>
                                                            <th>产品</th>
                                                            <th>金额</th>
                                                            <th>交易时间</th>
                                                            <th>选择</th>
                                                         </thead>
                                                         <tbody></tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <hr class="mg-b-5">
                                        </div>
                                        <div class="col-sm-12 bd-r">
                                            <div class="form-group form-group-sm mg-b-5">
                                                <label for="sell-cause" class="control-label col-sm-2">原因</label>
                                                <div class="col-sm-4">
                                                    <select id="sell-cause" class="form-control">
                                                        <option value="">请选择</option>
                                                        <option value="仓库漏发">仓库漏发</option>
                                                        <option value="物流商错发">物流商错发</option>
                                                        <option value="供应商错发">供应商错发</option>
                                                        <option value="物流问题">物流问题</option>
                                                        <option value="质量问题">质量问题</option>
                                                        <option value="描述失误">描述失误</option>
                                                        <option value="买家原因">买家原因</option>
                                                        <option value="缺货">缺货</option>
                                                        <option value="关税退回">关税退回</option>
                                                        <option value="运费">运费</option>
                                                    </select>
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
                                                        <option value="reimburse">退款</option>
                                                        <option value="again">重发</option>
                                                        <option value="added">额外退款</option>
                                                    </select>
                                                </div>
                                                <div class="col-sm-6">
                                                    <p id="sell-msg-handle" class="text-danger"></p>
                                                </div>
                                            </div>
                                            <hr class="mg-b-5">
                                        </div>
                                        <!-- 可变动模块 -->
                                        <div id="sell-can-change-1st" class="hidden">
                                            <div id="order-list-1st" class="col-sm-12 maxH150 bd-r hidden">
                                                <table class="table table-striped table-bordered table-hover table-condensed">
                                                    <thead>
                                                        <th>订单号</th>
                                                        <th>产品</th>
                                                        <th>状态</th>
                                                        <th>时间</th>
                                                    </thead>
                                                    <tbody></tbody>
                                                </table>
                                                <hr class="mg-b-5">
                                            </div>
                                            <div class="col-sm-12 bd-r">
                                                <div class="row">
                                                    <div id="sell-address" class="col-sm-5">
                                                        <div class="form-group form-group-sm mg-b-5">
                                                            <label class="control-label col-sm-4">收件人</label>
                                                            <div class="col-sm-8">
                                                                <input type="text" name="Name" class="form-control">
                                                            </div>
                                                        </div>
                                                        <div class="form-group form-group-sm mg-b-5">
                                                            <label class="control-label col-sm-4">地址1</label>
                                                            <div class="col-sm-8">
                                                                <input type="text" name="Street1" class="form-control">
                                                            </div>
                                                        </div>
                                                        <div class="form-group form-group-sm mg-b-5">
                                                            <label class="control-label col-sm-4">地址2</label>
                                                            <div class="col-sm-8">
                                                                <input type="text" name="Street2" class="form-control">
                                                            </div>
                                                        </div>
                                                        <div class="form-group form-group-sm mg-b-5">
                                                            <label class="control-label col-sm-4">城市</label>
                                                            <div class="col-sm-8">
                                                                <input type="text" name="City" class="form-control">
                                                            </div>
                                                        </div>
                                                        <div class="form-group form-group-sm mg-b-5">
                                                            <label class="control-label col-sm-4">省份</label>
                                                            <div class="col-sm-8">
                                                                <input type="text" name="State" class="form-control">
                                                            </div>
                                                        </div>
                                                        <div class="form-group form-group-sm mg-b-5">
                                                            <label class="control-label col-sm-4">邮编</label>
                                                            <div class="col-sm-8">
                                                                <input type="text" name="ZIP" class="form-control">
                                                            </div>
                                                        </div>
                                                        <div class="form-group form-group-sm mg-b-5">
                                                            <label class="control-label col-sm-4">国家</label>
                                                            <div class="col-sm-8">
                                                                <input type="text" name="Country" class="form-control">
                                                            </div>
                                                        </div>
                                                        <div class="form-group form-group-sm mg-b-5">
                                                            <label class="control-label col-sm-4">联系电话</label>
                                                            <div class="col-sm-8">
                                                                <input type="text" name="Phone" class="form-control">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-7" style="height: 70px;">
                                                        <div class="row">
                                                            <div id="common-sreach-2nd" class="col-sm-9"></div>
                                                            <div class="col-sm-3">
                                                                <button id="btn-add-product" class="btn btn-default btn-sm" type="button">添加</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-7 maxH200">
                                                        <table id="sell-product-list" class="table table-striped table-bordered table-hover table-condensed cen-th ver-td inputH20">
                                                            <thead>
                                                                <th>产品</th>
                                                                <th>数量</th>
                                                                <th><span class="glyphicon glyphicon-wrench"></th>
                                                            </thead>
                                                            <tbody></tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- 可变动模块 -->
                                        <div id="sell-can-change-2nd" class="hidden">
                                            <div class="col-sm-12 bd-r">
                                                <div class="row">
                                                    <div class="col-sm-6 maxH200">
                                                        <table id="sell-reimburse-list" class="table table-striped table-bordered table-hover table-condensed hidden">
                                                            <thead>
                                                                <th>金额</th>
                                                                <th>申请人</th>
                                                                <th>状态</th>
                                                                <th>时间</th>
                                                            </thead>
                                                            <tbody></tbody>
                                                        </table>
                                                    </div>
                                                    <div class="col-sm-6">
                                                        <div class="form-group form-group-sm">
                                                            <label class="control-label col-sm-3">退款说明</label>
                                                            <div class="col-sm-9">
                                                                <input id="sell-added" type="text" class="form-control" placeholder="给买家的说明，额外退款时必填，限定英文。">
                                                            </div>
                                                        </div>
                                                        <div class="form-group form-group-sm">
                                                            <label id="sell-currency" class="control-label col-sm-3"></label>
                                                            <div class="col-sm-9">
                                                                <div class="input-group">
                                                                    <input id="sell-amount" type="text" class="form-control ime" placeholder="金额">
                                                                    <span class="input-group-btn">
                                                                        <button id="sell-application" class="btn btn-default btn-sm" type="button">申请</button>
                                                                    </span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <hr class="mg-t-5">
                                            </div>
                                            <div class="col-sm-12 bd-r">
                                                <div class="row">
                                                    <div class="col-sm-6">
                                                        <table id="sell-payments" class="table table-striped table-bordered table-hover table-condensed">
                                                            <thead>
                                                                <th>交易号</th>
                                                                <th>金额</th>
                                                                <th>时间</th>
                                                            </thead>
                                                            <tbody></tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div id="panel-remark" class="panel panel-default">
                                            <div class="panel-heading">
                                                <h3 class="panel-title">备注</h3>
                                            </div>
                                            <div class="panel-body">
                                                <form class="form-horizontal" action="javascript:;">
                                                    <div class="input-group input-group-sm">
                                                        <textarea rows="1" name="Remark" class="form-control"></textarea>
                                                        <span class="input-group-btn">
                                                            <input type="submit" class="btn btn-default" value="提交" />
                                                            <input type="reset" class="btn btn-default hidden" value="取消" />
                                                        </span>
                                                    </div>
                                                    <span class="text-danger">提示：如需要在备注中加入链接地址，请使用三层英文中括号包裹链接，如：[[[http://erp.v0.xytinc.com]]]。</span>
                                                </form>
                                                <div class="maxH300 mg-t-10">
                                                    <table class="table table-striped table-condensed">
                                                        <tbody></tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-12 bd-t pd-t-5">
                                        <button id="sell-save" class="btn btn-default btn-sm center-block" type="button">保存</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <!-- 订单详情 -->
                        <div id="nav-order" class="tab-pane fade">
                            qwerqwerqw
                        </div>
                        <!-- 日志 -->
                        <div id="nav-log" class="tab-pane fade">
                            adsfasdfas
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    {页面底部}{/页面底部}

    <script src="/Resource/js/bootstrap-datetimepicker.js"></script>
    <script src="/Resource/js/bootstrap-datetimepicker.zh-CN.js"></script>
    <script src="/Resource/js/mustache.js"></script>
    <script src="/Resource/js/ZeroClipboard.min.js"></script>

    <script>
        (function() {
            'use strict';

//=========================================== 主页面 ========================================================
            // 编辑售后单
            (function() {
                $('.edit-sell').on('click', function() {
                    common.loading.show();
                    var _DataID = $(this).closest('tr').find('td:first input').val();
                    $.ajax({
                        url     : '/CustomerService/API/?Do=AfterSaleQuery',
                        type    : 'GET',
                        dataType: 'JSON',
                        data    : {
                            DataID: _DataID
                        },
                        success : function(data) {
                            // 隐藏搜索框
                            $('#sell-search').closest('div').addClass('hidden');

                            // 设置模态框信息
                            $('#sell-info').html(' ' + data.Order.OrderID + ' - ' + data.Order.ShopName + ' - ' + data.Order.BuyerID);

                            // 设置选项
                            var _mode;
                            switch(data.Order.ExecuteMode) {
                                case '重发':
                                    _mode = 'again';
                                break;
                                case '退款':
                                    _mode = 'reimburse';
                                break;
                                case '额外退款':
                                    _mode = 'added';
                                break;
                            }
                            $('#sell-handle').find('option[value="'+ _mode +'"]').prop('selected', true);
                            $('#sell-cause').find('option[value="'+ data.Order.Types +'"]').prop('selected', true);

                            if (_mode == 'again') {
                                // 重发模式
                                OrderList(data);  // 渲染订单列表
                                SetAddress(data); // 渲染地址
                                SetProduct(data); //渲染产品
                                ProductChange();  // 添加和删除产品的方法
                                // 保存编辑后的售后单 - 重发
                                $('#sell-save').off().on('click', function() {
                                    SaveServiceAgain(data.Order.OID, data.DataID); 
                                });
                            } else if (_mode == 'reimburse' || _mode == 'added') {
                                // 退款模式
                                
                            }

                            // 显示模态框
                            $('#modal-sell').modal('show');
                            common.loading.hide();
                        }
                    });
                });
            })();            
//=========================================== 主页面 - End ==================================================
//=========================================== 模态框方法 ====================================================
            // 搜索交易单
            (function() {
                var $search = $('#sell-search');
                var template = '{{#DataList}}<tr data-id="{{DataID}}">'
                                + '<td>{{DataID}}</td>'
                                + '<td>{{Shop}}</td>'
                                + '<td>'
                                + '{{#Transaction}}'
                                    + '{{#Product}}'
                                    + '<div class="copy">'
                                        + '<span class="poi mg-r-5" data-clipboard-text="{{FullSKU}}" data-id="{{DataID}}" title="点击复制该SKU">[{{FullSKU}}]</span>{{FullName}} * {{Quantity}}'
                                    + '</div>'
                                    + '{{/Product}}'
                                + '{{/Transaction}}'
                                + '</td>'
                                + '<td>{{#AmountOfMoney}}{{Currency}}{{Amt}}{{/AmountOfMoney}}</td>'
                                + '<td>{{Date}}</td>'
                                + '<td><span class="glyphicon glyphicon-check poi selected"></span></td>'
                             + '</tr>{{/DataList}}';
                var option = {
                     Warehouse: {Ack: true},
                     Label: {Ack: true}
                };
                $('#btn-search').on('click', function() {
                    common.loading.show();
                    $.ajax({
                        url     : '/OMS/API/?Do=List&QueryLimitNumber=20&KeyWord=' + $search.find('input').val(),
                        type    : 'GET',
                        dataType: 'JSON',
                        success : function(d) {
                            // 是否有搜到相应数据
                            if (!d.Ack) {
                                var msg = '<span id="sell-error" class="mg-l-20 text-danger">' + d.Message + '</span>';
                                $('#search-list-toggle').after(msg);
                                common.loading.hide();
                                return;
                            } else {
                                $('#sell-error').remove();
                            }

                            $('#order-list').find('tbody').html(Mustache.render(template, d));
                            common.copy.SkuCopy($('#order-list').find('.copy'), option);
                            $('#order-list').removeClass('hidden');
                            _TableToggle(); // 显示隐藏与显示按钮
                            SelectBtn();    // 选择后获取订单信息并遍历
                            common.loading.hide();
                        }
                    });
                });
            })(); // 搜索交易单 - End

            // 选择后获取订单信息并遍历
            function SelectBtn() {
                $('#order-list').off('click', '.selected').on('click', '.selected', function() {
                    
                    // 判断原因和处理方式是否有选，没有则提示
                    IfSelected($('#sell-cause'), $('#sell-msg-cause'), '原因');
                    IfSelected($('#sell-handle'), $('#sell-msg-handle'), '处理方式');

                    if (!$('#sell-cause').hasClass('fs') && !$('#sell-handle').hasClass('fs')) {
                        common.loading.show();
                        $.ajax({
                            url     : '/OMS/Order.aspx?Do=Query&DataID=' + $(this).closest('tr').data('id'),
                            type    : 'GET',
                            dataType: 'JSON',
                            success : function(d) {
                                switch($('#sell-handle').val()) {
                                    case 'again':
                                        SetAddress(d, true);             // 渲染地址
                                        SetProduct(d.DataList[0], true); //渲染产品
                                        ProductChange();                 // 添加和删除产品的方法

                                        $('#search-list-toggle').click(); // 隐藏列表
                                        TypeChange();                     // 处理方式切换
                                        common.loading.hide();

                                        $('#sell-save').off().on('click', function() {
                                            SaveServiceAgain(d.DataList[0].DataID); // 保存售后单 - 重发
                                        });

                                    break;
                                    case 'reimburse':
                                        LoadReimburse(d.DataList[0], '退款'); //退款模块加载
                                        $('#search-list-toggle').click();     // 隐藏列表
                                        TypeChange();                         // 处理方式切换
                                        common.loading.hide();
                                    break;
                                    case 'added':
                                        LoadReimburse(d.DataList[0], '额外退款'); //退款模块加载
                                        $('#search-list-toggle').click();         // 隐藏列表
                                        TypeChange();                             // 处理方式切换
                                        common.loading.hide();
                                    break;
                                } // switch - End
                            } // success - End
                        }); // Ajax - End
                    } // if - End
                });
            } // 选择后获取订单信息并遍历 - End

            /**
             * 判断是否已经选择
             * @param {Object} _se   select元素
             * @param {Object} _msg  提示框
             * @param {String} _text 提示文本
             */
            function IfSelected(_se, _msg, _text) {
                if (_se.val() == '' || _se.val() == null) {
                    _se.addClass('fs');
                    _msg.text('请先选择' + _text);
                } else if(_se.hasClass('fs')) {
                    _se.removeClass('fs');
                    _msg.empty();
                }
            }

            /**
             * 处理方式切换
             */
            function TypeChange() {
                var $c1st = $('#sell-can-change-1st');
                var $c2nd = $('#sell-can-change-2nd');
                switch($('#sell-handle').val()) {
                    case 'reimburse':
                        !$c1st.hasClass('hidden') && $c1st.addClass('hidden');
                        $c2nd.hasClass('hidden') && $c2nd.removeClass('hidden');
                    break;
                    case 'again':
                        $c1st.hasClass('hidden') && $c1st.removeClass('hidden');
                        !$c2nd.hasClass('hidden') && $c2nd.addClass('hidden');
                    break;
                    case 'added':
                        !$c1st.hasClass('hidden') && $c1st.addClass('hidden');
                        $c2nd.hasClass('hidden') && $c2nd.removeClass('hidden');
                    break;
                }
            }

            /**
             * 显示和隐藏订单列表
             */
            function _TableToggle() {
                var _slt = $('#search-list-toggle');
                var _sltsp =  _slt.find('span');
                _sltsp.hasClass('glyphicon-chevron-up') && _sltsp.removeClass('glyphicon-chevron-up')
                                                                 .addClass('glyphicon-chevron-down');
                _slt.hasClass('hidden') && _slt.removeClass('hidden');
                _slt.off().on('click', function() {
                    if (_sltsp.hasClass('glyphicon-chevron-down')) {
                        _sltsp.removeClass('glyphicon-chevron-down')
                              .addClass('glyphicon-chevron-up');
                        $('#order-list').addClass('hidden');
                    } else {
                        _sltsp.removeClass('glyphicon-chevron-up')
                              .addClass('glyphicon-chevron-down');
                        $('#order-list').removeClass('hidden');
                    }
                });
            }

            /**
             * 遍历订单处理列表
             * @param {[type]} d [description]
             */
            function OrderList(d) {
                // 遍历订单列表
                var _tmpOrderList = '<tr>'
                                    + '{{#Order}}'
                                    + '<td>{{OID}}</td>'
                                    + '{{/Order}}'
                                    + '<td>'
                                    + '{{#Product}}'
                                    + '<div class="copy">'
                                        + '<span class="poi mg-r-5" data-clipboard-text="{{FullSKU}}" data-id="{{DataID}}" title="点击复制该SKU">[{{FullSKU}}]</span>{{FullName}} * {{Quantity}}'
                                    + '</div>'
                                    + '{{/Product}}'
                                    + '</td>'
                                    + '{{#Order}}'
                                    + '<td>{{Status}}</td>'
                                    + '<td>{{Date}}</td>'
                                    + '{{/Order}}'
                                  + '</tr>';
                $('#order-list-1st').find('tbody').html(Mustache.render(_tmpOrderList, d));
                var optionOrder = {
                     Warehouse: {
                         Ack      : true,
                         Placement: 'top', // 弹出框显示方向，默认bottom
                     },
                };
                common.copy.SkuCopy($('#order-list-1st').find('.copy'), optionOrder);

                TypeChange();
                $('#order-list-1st').hasClass('hidden') && $('#order-list-1st').removeClass('hidden');

            }

            /**
             * 渲染地址
             * @param {JSON}    _d   数据
             * @param {Boolean} _new 用于区别是否是新建售后单
             */
            function SetAddress(_d, _new) {
                var $sellAdd = $('#sell-address');
                var sellAddress;
                // 区别新建售后单和编辑售后单
                if (_new) {
                    var sellOrderID = _d.DataList[0].OrderID;
                    var sellPhone = _d.DataList[0].Address.eBay.Phone;
                    if (sellOrderID.indexOf('XYT') != -1 || sellOrderID.indexOf('OMS') != -1) {
                        sellAddress = _d.DataList[0].Address.eBay;
                    } else {
                        sellAddress = _d.DataList[0].Address.PayPal;
                    }
                } else {
                    sellAddress = _d.Address;
                }
                
                $sellAdd.find('input[name="Name"]').val(sellAddress.Name);
                $sellAdd.find('input[name="Street1"]').val(sellAddress.Street1);
                $sellAdd.find('input[name="Street2"]').val(sellAddress.Street2);
                $sellAdd.find('input[name="City"]').val(sellAddress.City);
                $sellAdd.find('input[name="State"]').val(sellAddress.State);
                $sellAdd.find('input[name="ZIP"]').val(sellAddress.ZIP);
                $sellAdd.find('input[name="Country"]').val(sellAddress.Country);
                $sellAdd.find('input[name="Phone"]').val(sellPhone || sellAddress.Phone);
            }

            /**
             * 遍历产品列表
             * @param {JSON}    _d   数据
             * @param {Boolean} _new 判断是新建或是编辑售后单
             */
            function SetProduct(_d, _new) {
                // 遍历产品列表
                var _tmpProduct = (_new && '{{#Transaction}}')
                                + '{{#Product}}'
                                + '<tr data-id="{{DataID}}">'
                                    + '<td>'
                                    + '<div class="copy">'
                                        + '<span class="poi mg-r-5" data-clipboard-text="{{FullSKU}}" data-id="{{DataID}}" title="点击复制该SKU">[{{FullSKU}}]</span>{{FullName}}'
                                    + '</div>'
                                    + '</td>'
                                    + '<td><input type="text" class="form-control input-sm maxW50" value="1"></td>'
                                    + '<td><span class="glyphicon glyphicon-remove poi" style="color: red"></span></td>'
                                + '</tr>'
                                + '{{/Product}}'
                                + (_new && '{{/Transaction}}');
                $('#sell-product-list').find('tbody').html(Mustache.render(_tmpProduct, _d));
                common.copy.SkuCopy($('#sell-product-list').find('.copy'));
            }

            /**
             * 添加和删除产品的方法
             */
            function ProductChange() {
                var _2nd = $('#common-sreach-2nd');
                var _spl = $('#sell-product-list');
                var _tmpProduct ='<tr data-id="{{DataID}}">'
                                    + '<td>'
                                        + '<div class="copy">'
                                            + '<span class="poi mg-r-5" data-clipboard-text="{{FullSKU}}" data-title="点击复制该SKU">[{{FullSKU}}]</span>{{FullName}}'
                                        + '</div>'
                                    + '</td>'
                                    + '<td><input type="text" class="form-control input-sm maxW50" value="1"></td>'
                                    + '<td><span class="glyphicon glyphicon-remove poi" style="color: red"></span></td>'
                                + '</tr>';
                // add product
                $('#btn-add-product').off().on('click', function() {
                    var _2ndCopyDiv = _2nd.find('.copy');
                    // 添加时检测是否有相同产品
                    if (_spl.find('tbody tr[data-id="' + _2ndCopyDiv.find('.poi').data('id') + '"]').length != 0) {
                        alert('已选产品，请勿重复。');
                        return;
                    }

                    var _tmpData = {
                        DataID  : '',
                        FullSKU : '',
                        FullName: ''
                    };

                    // 切割字符串获得FullSKU和FullName
                    var _tmpText = _2ndCopyDiv.text();
                    _tmpText     = _tmpText.split('[')[1];
                    _tmpText     = _tmpText.split(']');
                    _tmpData.DataID   = _2ndCopyDiv.find('.poi').data('id');
                    _tmpData.FullSKU  = _tmpText[0];
                    _tmpData.FullName = _tmpText[1];

                    _spl.find('tbody').prepend(Mustache.render(_tmpProduct, _tmpData));
                });

                // remove product
                _spl.find('tbody').on('click', '.glyphicon-remove', function() {
                    $(this).closest('tr').remove();
                });
            }
            /**
             * 退款模块加载
             * @param {JSON}   _d      数据
             * @param {String} _type   类型
             * @param {String} _DataID 更新售后单时用到，新建时为空
             */
            function LoadReimburse(_d, _type, _DataID) {
                var _tmphtml = '{{#Payments}}'
                             + '<tr>'
                                + '<td>{{ReferenceID}}</td>'
                                + '<td>{{Currency}}{{Amount}}</td>'
                                + '<td>{{Date}}</td>'
                             + '</tr>'
                             + '{{/Payments}}';
                $('#sell-payments').find('tbody').html(Mustache.render(_tmphtml, _d));
                $('#sell-currency').text(_d.AmountOfMoney.Currency);
                // 输入金额
                $('#sell-application').off().on('click', function() {
                    var _amt = $('#sell-amount').val();
                    var $sadd = $('#sell-added');
                    var $samt = $('#sell-amount');
                    
                    // 重置输入框样式
                    $sadd.hasClass('fs') && $sadd.removeClass('fs');
                    $samt.hasClass('fs') && $samt.removeClass('fs');

                    // 检测金额输入的是不是符合规范的数字
                    var reg = /^(([0-9]+)|(([0]|[1-9][0-9]*)\.[0-9]*[1-9]+))$/;
                    if (!reg.test(_amt)) {
                        $samt.addClass('fs');
                        alert('金额输入不规范！');
                        return;
                    }
                    
                    if($('#sell-handle').val() == 'added' && ($sadd.val() == '' || $sadd.val() == null)) {
                        // 当类型为额外退款时，退款说明必须填写
                        $sadd.addClass('fs');
                    } else if($('#sell-handle').val() == 'reimburse' && parseFloat(_amt) > parseFloat(_d.AmountOfMoney.Amt)) {
                        // 当类型为退款时，输入金额不能大于订单金额
                        $samt.addClass('fs');
                        alert('退款金额不能大于订单金额！');
                    } else {
                        $sadd.hasClass('fs') && $sadd.removeClass('fs');

                        var title = _d.Shop + '的买家【' + _d.Buyer + '】对订单['+ _d.DataID +']的'+ _type +'申请';
                        var op = {
                                ReferenceID   : '',
                                ToBuyerMessage: $sadd.val(),
                                Amount        : parseFloat(_amt),
                                Title         : title
                        };
                        if (_DataID) {
                            op.ReferenceID = _DataID;
                            SaveReimburse(op);
                        }else {
                            SaveServiceReimburse(_d.DataID, op);
                        }
                    }


                });
            }
            /**
             * 保存售后单 - 重发
             * @param {String} _OID    OID
             * @param {String} _DataID 更新售后单时用到，新建时为空
             */
            function SaveServiceAgain(_OID, _DataID) {
                common.loading.show();
                // 产品
                var productJson         = {};
                    productJson.Product = [];
                $('#sell-product-list').find('tbody tr').each(function(i, n){
                    var ts   = $(this);
                    var temp = {"SkuID": ts.data('id'), "Quantity": parseInt(ts.find('.maxW50').val())};
                    productJson.Product.push(temp);
                });

                // 保存数据
                var $sellAdd = $('#sell-address');
                $.ajax({
                    url     : '/CustomerService/API/?Do=AfterSaleSave',
                    type    : 'POST',
                    dataType: 'JSON',
                    data: {
                        DataID     : _DataID,
                        OID        : _OID,
                        Types      : $('#sell-cause').val(),
                        ExecuteMode: '重发',
                        Name       : $sellAdd.find('input[name="Name"]').val(),
                        Street1    : $sellAdd.find('input[name="Street1"]').val(),
                        Street2    : $sellAdd.find('input[name="Street2"]').val(),
                        City       : $sellAdd.find('input[name="City"]').val(),
                        State      : $sellAdd.find('input[name="State"]').val(),
                        ZIP        : $sellAdd.find('input[name="ZIP"]').val(),
                        Country    : $sellAdd.find('input[name="Country"]').val(),
                        Phone      : $sellAdd.find('input[name="Phone"]').val(),
                        Product    : JSON.stringify(productJson)
                    },
                    success: function(data) {
                        common.loading.hide();
                        common.alert({
                            type : 'success',
                            title: '保存售后单：',
                            msg  : data.Message,
                            cb   : function() {
                                // window.location.reload();
                            }
                        });
                    }
                });
                
            }

            /**
             * 保存售后单 - 退款
             * @param {String} _OID OID
             * @param {JSON}   op   要传递的参数
             */
            function SaveServiceReimburse(_OID, op) {
                switch($('#sell-handle').val()) {
                    case 'reimburse':
                        var _type = '退款';
                    break;
                    case 'added':
                        var _type = '额外退款';
                    break;
                }

                $.ajax({
                    url     : '/CustomerService/API/?Do=AfterSaleSave',
                    type    : 'POST',
                    dataType: 'JSON',
                    data: {
                        OID        : _OID,
                        Types      : $('#sell-cause').val(),
                        ExecuteMode: _type
                    },
                    success: function(data) {
                        op.ReferenceID = data.OrderID;
                        SaveReimburse(op);
                    }
                });
            }

            /**
             * 保存退款
             * @param {JSON} op 要传递的参数
             */
            function SaveReimburse(op) {
                $.ajax({
                    url     : '/Finance/API/?Do=RefundCreate',
                    dataType: 'JSON',
                    type    : 'POST',
                    data    : op,
                    success: function(d) {
                        common.alert({
                            type: 'success',
                            title: '退款申请：',
                            msg: d.Message,
                            cb: function() {
                                d.Ack && window.location.reload();
                            }
                        });
                    }
                });
            }


//=========================================== 模态框方法 ====================================================

//=========================================== 页面基本功能 ==================================================
            // 搜索方法
            (function() {
                var op = common.URL.parse();
                var option = {
                    inForm : true,
                    isLimit: false,
                    mode   : true,
                    SkuID  : op.SkuID || false
                };
                var option2nd = {
                    inForm   : true,
                    isLimit  : false,
                    mode     : true,
                    SkuID    : op.SkuID || false,
                    placement: 'top'
                };
                common.SkuSearch($('#common-sreach'), option);
                common.SkuSearch($('#common-sreach-2nd'), option2nd);
            })();

            // 当模态框关闭时，重置模态框
            (function() {
                $('#modal-sell').on('hidden.bs.modal', function() { ModalReset(); });
            })();
            

            // 模态框重置
            function ModalReset() {
                $('#sell-info').empty();
                var $1st = $('#sell-can-change-1st');
                var $2nd = $('#sell-can-change-2nd');
                !$1st.hasClass('hidden') && $1st.addClass('hidden');
                !$2nd.hasClass('hidden') && $2nd.addClass('hidden');
                SearchReset();
                AgainReset();
                OptionReset();
                OrderListReset();
                ReimburseReset();
                ProductReset();
                RemarkReset();
            }

            // 搜索交易单列表重置
            function SearchReset() {
                var $dom1 = $('#search-list-toggle');
                var $dom2 = $('#sell-search').closest('div');
                $dom2.hasClass('hidden') && $dom2.removeClass('hidden');
                $('#sell-search input').val('');
                !$dom1.hasClass('hidden') && $dom1.addClass('hidden');
                $('#order-list').addClass('hidden');
            }

            // 重发模块重置
            function AgainReset() {
                var $dom = $('#common-sreach-2nd');
                $dom.find('input[name="SkuID"]').val('');
                $dom.find('label').empty();
            }

            // 原因和处理方法选项重置
            function OptionReset() {
                $('#sell-cause option:first').prop('selected', true);
                $('#sell-handle option:first').prop('selected', true);
            }

            // 订单处理记录列表重置
            function OrderListReset() {
                var $dom = $('#order-list-1st');
                !$dom.hasClass('hidden') && $dom.addClass('hidden');
                $dom.find('tbody').empty();
            }
            
            // 退款模块重置
            function ReimburseReset() {
                $('#sell-added').val('');
                $('#sell-amount').val('');
            }

            // 产品模块重置
            function ProductReset() {
                $('#common-sreach-2nd input').val('');
                $('#common-sreach-2nd .search-drop').empty();
            }

            // 备注重置
            function RemarkReset() {
                var $dom = $('#panel-remark');
                $dom.find('textarea[name="Remark"]').val('');
                $dom.find('tbody').empty();
            }

            // 标签页定位
            // (function() {
            //     var op = location.search.split('&');
            //     var isDo = location.search.split('&')[0];
            //     var $formSearch = $('#form-search');
            //     isDo = isDo.split('=')[0] == '?Do' ? isDo : '?Do=Sold';
            //     $('.nav a[href="' + isDo + '"]').closest('li').addClass('active');

            //     $formSearch.find('input[type="text"]').val(decodeURI((op.KeyWord || '').replace(/\++/g, ' ')));
            //     $formSearch.find('select').find('option[value="' + decodeURI(op.Selected) + '"]').prop('selected', true);
            //     $formSearch.find('select option[value="' + (op.TeamID || $formSearch.find('select').data('default')) + '"]').prop('selected', true);
            // })();

            // 列表页脚分页
            (function() {
                <!-- BEGIN 分页脚本 ATTRIB= -->
                common.showPage({当前页}, {总条数}, {每页条数});
                <!-- END 分页脚本 -->
            })();

//=========================================== 页面基本功能 ====================================================
        })();
    </script>
</body>
</html>
