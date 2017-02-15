{页面属性}{/页面属性}
<body>
    {页顶导航}{/页顶导航}
    <!-- 内容-->
    <div class="container-fluid">
        <header>
            <div class="btn-group btn-group-sm pull-right">
                <button class="btn btn-default" data-toggle="modal" data-target="#modal-sell" type="button">创建</button>
                <button class="btn btn-default" type="button">取消</button>
            </div>
        </header>
        <ul class="nav nav-tabs mg-b-5">
            <li><a href="?Do=All">全部</a></li>
            <li><a href="?Do=Doing">进行中</a></li>
            <li><a href="?Do=Complete">已结束</a></li>
            <li><a href="?Do=Cancel">已取消</a></li>
        </ul>
        <form id="form-search" action="?" class="form-inline mg-r-20 mg-b-10">
            <div class="form-group form-group-sm mg-r-15 pull-lift">
                <select class="form-control" name="ShopID" data-default="{TeamID}">
                    <option value="">全部</option>
                    <!-- BEGIN 店铺列表 ATTRIB= -->
                    <option value="{DataID}">{Name}</option>
                    <!-- END 店铺列表 -->
                </select>
                
                <input type="text" class="form-control" name="KeyWord" placeholder="BuyerID">
                <button class="btn btn-default btn-sm" type="submit">查询</button>
            </div>
            <div id="common-sreach" class="form-group"></div>
        </form>
        <div class="row">
            <div class="col-sm-12">
                <table id="data-list" class="table table-striped table-bordered table-hover table-condensed">
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
                        <col width="90px">
                        <col width="50px">
                    </colgroup>
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
                            <td class="orderID">{OrderID}</td>
                            <td>{ShopName}</td>
                            <td>{BuyerID}</td>
                            <td>{OID}</td>
                            <td class="product">{TemplateProduct}</td>
                            <td>{CurrencyID}{Amount}</td>
                            <td>{Types}</td>
                            <td class="exm">{ExecuteMode}</td>
                            <td class="status">{Status}</td>
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

    <!-- 售后单模态框 -->
    <div id="modal-sell" class="modal fade" tabIndex="-1">
        <div class="modal-dialog" style="width:1100px">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                    <h4 class="modal-title">设置售后单<small id="sell-info"></small></h4>
                </div>
                <div class="modal-body">
                    <div id="sell-datalist" class="col-sm-12 hidden">
                        <table class="table table-striped table-bordered table-hover table-condensed">
                            <thead>
                                <tr>
                                    <th>金额</th>
                                    <th>类型</th>
                                    <th>处理方式</th>
                                    <th>状态</th>
                                    <th>时间</th>
                                </tr>
                            </thead>
                            <tbody></tbody>
                        </table>
                    </div>
                    <ul class="nav nav-tabs mg-b-5">
                        <li class="active"><a id="nav-tag-service" href="#nav-sell" data-toggle="tab">售后设置</a></li>
                        <li><a id="nav-tag-order" href="#nav-order" data-toggle="tab">订单详情</a></li>
                        <li><a id="nav-tag-log" href="#nav-log" data-toggle="tab">日志</a></li>
                    </ul>
                    <div class="tab-content">
                        <div id="nav-sell" class="tab-pane fade in active">
                            <form class="form-horizontal" role="form" action="javascript:;">
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
                                                        <option value="account">账号退款</option>
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
                                            <div id="order-list-1st" class="col-sm-12 bd-r hidden">
                                                <div class="maxH150">
                                                    <table class="table table-striped table-bordered table-hover table-condensed">
                                                        <thead>
                                                            <th>仓库 - 运单号</th>
                                                            <th>货代 - 单号</th>
                                                            <th>服务商- 单号</th>
                                                            <th>提审时间</th>
                                                            <th>操作</th>
                                                        </thead>
                                                        <tbody></tbody>
                                                    </table>
                                                </div>
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
                                                    <div class="col-sm-7 maxH150">
                                                        <table id="sell-product-list" class="table table-striped table-bordered table-hover table-condensed cen-th ver-td inputH20 hidden">
                                                            <thead>
                                                                <th>产品</th>
                                                                <th>数量</th>
                                                                <th><span class="glyphicon glyphicon-wrench"></th>
                                                            </thead>
                                                            <tbody></tbody>
                                                        </table>
                                                    </div>
                                                    <div class="col-sm-7">
                                                        <button id="sell-save" class="btn btn-default btn-sm pull-right" type="button">申请重发</button>
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
                                                        <table id="sell-payments" class="table table-striped table-bordered table-hover table-condensed hidden">
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
                                        <div id="sell-remark" class="hidden"></div>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <!-- 订单详情 -->
                        <div id="nav-order" class="tab-pane fade" data-id="">
                            <div class="row">
                                <div id="order-detailed" class="col-sm-8 maxH550">
                                    <p>暂无订单详情信息</p>
                                </div>
                                <div class="col-sm-4">
                                    <div id="order-remark" class="hidden"></div>
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

    {页面底部}{/页面底部}

    <script src="/Resource/js/bootstrap-datetimepicker.js"></script>
    <script src="/Resource/js/bootstrap-datetimepicker.zh-CN.js"></script>
    <script src="/Resource/js/mustache.js"></script>
    <script src="/Resource/js/ZeroClipboard.min.js"></script>
    <script src="/Resource/js/Remark.js"></script>
    <script src="/Resource/js/logistics-module.js"></script>

    <script>
        (function() {
            'use strict';
            var currentUID = <!-- BEGIN 当前用户ID ATTRIB= --><!-- END 当前用户ID -->;

//=========================================== 主页面 ========================================================
            // 检测页面URL是否自带参数，如果有则获取参数直接弹出新建模态框并查询并设置好参数
            (function() {
                var op = common.URL.parse();
                if (op.DataID && op.Types && op.ExecuteMode) {
                    var _t = decodeURI(op.Types);
                    var _e = ModeChange(decodeURI(op.ExecuteMode), true);
                    $('#sell-cause').find('option[value="'+ _t +'"]').prop('selected', true);
                    $('#sell-handle').find('option[value="'+ _e +'"]').prop('selected', true);
                    GetNewData(op.DataID); // 获取交易单数据并遍历

                    // 显示模态框
                    $('#modal-sell').modal('show');
                }
            })(); // 检测页面URL是否自带参数，如果有则获取参数直接弹出新建模态框并查询并设置好参数 - End

            // 编辑售后单
            (function() {
                var editData, editID;
                $('.edit-sell').on('click', function() {
                    var _did = $(this).closest('tr').find('td:first input').val();
                    if (editID != _did) {
                        common.loading.show();
                                $.ajax({
                                    url     : '/CustomerService/API/?Do=AfterSaleQuery',
                                    type    : 'GET',
                                    dataType: 'JSON',
                                    data    : {
                                        DataID: _did
                                    },
                                    success : function(data) {
                                        editData = data;
                                        editID   = data.DataID;
                                        EditSet(data);
                                        // 售后单备注
                                        var sellOption = {
                                            Target : $('#sell-remark'),
                                            Title  : '售后单备注',
                                            DataID : editID,
                                            UID    : currentUID,
                                            HasWarp: false,
                                            SaveURL: '/CustomerService/API/?Do=MessageSave',
                                            GetURL : '/CustomerService/API/?Do=MessageQuery&FID=',
                                            DelURL : '/CustomerService/API/?Do=MessageDelete'
                                        };
                                        Remark(sellOption, data);

                                        common.loading.hide();
                                    }
                                });
                    } else {
                        // 售后单设置
                        EditSet(editData);
                    }
                });
            })();

            // 操作日志
            (function() {
                var currentID;
                $('.sell-log').on('click', function() {
                    var _did = $(this).closest('tr').find('td:first input').val();
                    if (currentID != _did) {
                        $.ajax({
                            url     : '/CustomerService/API/?Do=AfterSaleQuery',
                            type    : 'GET',
                            dataType: 'JSON',
                            data    : {
                                DataID: _did
                            },
                            success: function(data) {
                                currentID = data.DataID;
                                common.Log($('#modal-log .modal-body'), data);
                                $('#modal-log').modal('show');
                            }
                        });
                    } else {
                        $('#modal-log').modal('show');
                    }
                    
                });
            })();

            /**
             * 处理方式转换（自己挖的坑，再深也要填下去QAQ）
             * @param {String}   _m    处理方式
             * @param {Boolean } _type true: 中转英，false：英转中
             */
            function ModeChange(_m, _type) {
                var _mode;
                if (_type) {
                    switch(_m) {
                        case '重发':
                            _mode = 'again';
                        break;
                        case '退款':
                            _mode = 'reimburse';
                        break;
                        case '额外退款':
                            _mode = 'added';
                        break;
                        case '账号退款':
                            _mode = 'account';
                        break;
                    }
                } else {
                    switch(_m) {
                        case 'again':
                            _mode = '重发';
                        break;
                        case 'reimburse':
                            _mode = '退款';
                        break;
                        case 'added':
                            _mode = '额外退款';
                        break;
                        case 'account':
                            _mode = '账号退款';
                        break;
                    }
                }
                
                return _mode;
            }

            /**
             * 设置编辑页面
             * @param {JSON} data 数据
             */
            function EditSet(data) {
                // 隐藏搜索框
                $('#sell-search').closest('div.col-sm-12').addClass('hidden');

                // 设置模态框信息
                $('#sell-info').html(' ' + data.Order.OrderID + ' - ' + data.Order.ShopName + ' - ' + data.Order.BuyerID);

                // 设置DataList历史记录
                DataListHistory(data);

                // 设置选项
                var _mode = ModeChange(data.Order.ExecuteMode, true);
                $('#sell-cause').find('option[value="'+ data.Order.Types +'"]').prop('selected', true);
                $('#sell-handle').find('option[value="'+ _mode +'"]').prop('selected', true);
                $('#sell-handle').prop('disabled', true).attr('title', '编辑模式不允许更改处理方式！');

                if (_mode == 'again') {
                    // 重发模式
                    LogisticsList(data);     // 渲染订单列表
                    SetAddress(data);        // 渲染地址
                    SetProduct(data, false); // 渲染产品列表
                    ProductChange();         // 添加和删除产品的方法
                    // 保存编辑后的售后单 - 重发
                    $('#sell-save').off().on('click', function() {
                        SaveServiceAgain(data.Order.OID, data.DataID); 
                    });
                    TypeChange(); // 切换显示模块
                } else if (_mode == 'reimburse' || _mode == 'added' || _mode == 'account') {
                    // 退款模式
                    LoadReimburse(data, data.Order.ExecuteMode, data.Order.OID);
                    TypeChange(); // 切换显示模块
                }

                // 订单详情
                $('#nav-tag-order').one('click', function() {
                    IfConnection(data.Order.OID);
                });

                // 日志
                $('#nav-tag-log').one('click', function() {
                    common.Log($('#nav-log'), data);
                });

                // 显示备注模块
                $('#sell-remark').hasClass('hidden') && $('#sell-remark').removeClass('hidden');
                $('#order-remark').hasClass('hidden') && $('#order-remark').removeClass('hidden');

                // 显示模态框
                $('#modal-sell').modal('show');
            }
//=========================================== 主页面 - End ==================================================
//=========================================== 模态框方法 ====================================================
            // 搜索交易单并新建售后单
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
            })(); // 搜索交易单并新建售后单 - End

            // 选择后获取订单信息并遍历
            function SelectBtn() {
                $('#order-list').off('click', '.selected').on('click', '.selected', function() {
                    // 判断原因和处理方式是否有选，没有则提示
                    IfSelected($('#sell-cause'), $('#sell-msg-cause'), '原因');
                    IfSelected($('#sell-handle'), $('#sell-msg-handle'), '处理方式');

                    if (!$('#sell-cause').hasClass('fs') && !$('#sell-handle').hasClass('fs')) {
                        var _did = $(this).closest('tr').data('id');
                        GetNewData(_did); // 获取交易单数据并遍历
                    }
                });
            } // 选择后获取订单信息并遍历 - End

            /**
             * 获取交易单数据并遍历
             * @param {String} _did 订单的DataID
             */
            function GetNewData(_did) {
                common.loading.show();
                $.ajax({
                    url     : '/OMS/API/?Do=Query&DataID=' + _did,
                    type    : 'GET',
                    dataType: 'JSON',
                    success : function(d) {
                        // clickNum: 用于隐藏搜索列表的判断值，初始为true，执行过_ModeChange后赋值为fase，为false时不执行点击搜索显示/隐藏按钮
                        var clickNum = true; 
                        _ModeChange(clickNum);
                        $('#sell-handle').off('change').on('change', function() {
                            _ModeChange(clickNum);
                        });
                        function _ModeChange() {
                            switch($('#sell-handle').val()) {
                                case 'again':
                                    SetAddress(d, true);             // 渲染地址
                                    SetProduct(d.DataList[0], true); // 渲染产品
                                    ProductChange();                 // 添加和删除产品的方法

                                    clickNum && $('#search-list-toggle').click(); // 隐藏列表
                                    TypeChange();                     // 处理方式切换
                                    common.loading.hide();

                                    $('#sell-save').off().on('click', function() {
                                        SaveServiceAgain(d.DataList[0].DataID); // 保存售后单 - 重发
                                    });

                                    $('#nav-tag-order').off().on('click', function() {
                                        IfConnection(d.DataList[0].DataID, d.DataList[0]);
                                    });

                                    break;
                                case 'reimburse':
                                case 'added':
                                case 'account':
                                    LoadReimburse(d.DataList[0], $('#sell-handle').val()); // 退款模块加载
                                    clickNum && $('#search-list-toggle').click();     // 隐藏列表
                                    TypeChange();                         // 处理方式切换

                                    $('#nav-tag-order').off().on('click', function() {
                                        IfConnection(d.DataList[0].DataID, d.DataList[0]);
                                    });

                                    common.loading.hide();
                                    break;
                            } // switch - End
                            
                            clickNum = false;
                        }
                    } // success - End
                }); // Ajax - End
            }

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
                    case 'added':
                    case 'account':
                        !$c1st.hasClass('hidden') && $c1st.addClass('hidden');
                        $c2nd.hasClass('hidden') && $c2nd.removeClass('hidden');
                    break;
                    case 'again':
                        $c1st.hasClass('hidden') && $c1st.removeClass('hidden');
                        !$c2nd.hasClass('hidden') && $c2nd.addClass('hidden');
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
             * 编辑时，显示DataList历史
             * @param {JSON} _d 要显示的数据
             */
            function DataListHistory(_d) {
                var _tmpDatalist = '{{#DataList}}'
                                 + '<tr>'
                                    + '<td>{{CurrencyID}}{{AmountPaid}}</td>'
                                    + '<td>{{Types}}</td>'
                                    + '<td>{{ExecuteMode}}</td>'
                                    + '<td class="status">{{Status}}</td>'
                                    + '<td>{{Date}}</td>'
                                 + '</tr>'
                                 + '{{/DataList}}';
                $('#sell-datalist').removeClass('hidden').find('table tbody').html(Mustache.render(_tmpDatalist, _d));

                // 状态渲染
                var statusOption = {Type : ['初始', '进行中', '已结束', '取消'], Mode : 'replace'};
                common.Rendering.All($('#sell-datalist').find('.status'), statusOption);
            }

            /**
             * 遍历运单列表列表 
             * @param {[type]} d [description]
             */
            function LogisticsList(d) {
                // 遍历订单列表
                var _tmpLogisticsList = '{{#Logistics}}'
                                    + '<tr>'
                                      + '<td>{{Warehouse}} - <a name="order-a" href="javascript:;" target="_blank">{{ReferenceID}}</a></td>'
                                      + '<td>{{Freight}} - {{InsideOrder}}</td>'
                                      + '<td>{{ServiceName}} - {{TrackingNumber}}</td>'
                                      + '<td>{{Date}}</td>'
                                      + '<td>'
                                        + '<span class="glyphicon glyphicon-list-alt poi" data-oid="{{ReferenceID}}" data-toggle="modal" data-target="#modal-Logistics-log"></span>'
                                      + '</td>'
                                    + '</tr>'
                                 + '{{/Logistics}}';
                $('#order-list-1st').find('tbody').html(Mustache.render(_tmpLogisticsList, d));
                var optionOrder = {
                     Warehouse: {
                         Ack      : true,
                         Placement: 'top', // 弹出框显示方向，默认bottom
                     }
                };
                common.copy.SkuCopy($('#order-list-1st').find('.copy'), optionOrder);

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
                                    + '<td><input type="text" class="form-control input-sm maxW50" value="{{Quantity}}"></td>'
                                    + '<td><span class="glyphicon glyphicon-remove poi" style="color: red"></span></td>'
                                + '</tr>'
                                + '{{/Product}}'
                                + (_new && '{{/Transaction}}');
                var $spl = $('#sell-product-list');
                $spl.find('tbody').html(Mustache.render(_tmpProduct, _d));
                $spl.hasClass('hidden') && $spl.removeClass('hidden');
                common.copy.SkuCopy($('#sell-product-list').find('.copy'));

                // 编辑状态时，隐藏重发按钮（因为要运单取消才能重发，所以暂时隐藏掉）
                !_new && $('#sell-save').addClass('hidden');
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
                    if (!_tmpText) { return; }
                    _tmpText     = _tmpText.split('[')[1];
                    _tmpText     = _tmpText.split(']');
                    _tmpData.DataID   = _2ndCopyDiv.find('.poi').data('id');
                    _tmpData.FullSKU  = _tmpText[0];
                    _tmpData.FullName = _tmpText[1];
                    _spl.hasClass('hidden') && _spl.removeClass('hidden');
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
             * @param {String} _OID 更新售后单时用到，新建时为空
             */
            function LoadReimburse(_d, _type, _OID) {

                // 渲染交易信息
                if (_d.Payments && _d.Payments.length != 0) {
                    var _sp = $('#sell-payments');
                    var _tmphtml = '{{#Payments}}'
                                 + '<tr>'
                                    + '<td>{{ReferenceID}}</td>'
                                    + '<td>{{Currency}}{{Amount}}</td>'
                                    + '<td>{{Date}}</td>'
                                 + '</tr>'
                                 + '{{/Payments}}';
                    _sp.find('tbody').html(Mustache.render(_tmphtml, _d));
                    $('#sell-currency').text(_d.Payments[0].Currency);
                    _sp.is(':hidden') && _sp.removeClass('hidden');
                }
                
                // 渲染退款信息
                if (_d.Finance && _d.Finance.length != 0) {
                    var _srl = $('#sell-reimburse-list');
                    var _tmphtml = '{{#Finance}}'
                                 + '<tr>'
                                    + '<td>{{Amount}}</td>'
                                    + '<td>{{TrueName}}</td>'
                                    + '<td>{{Status}}</td>'
                                    + '<td>{{Date}}</td>'
                                 + '</tr>'
                                 + '{{/Finance}}';
                    _srl.find('tbody').html(Mustache.render(_tmphtml, _d));
                    $('#sell-currency').text(_d.Order.CurrencyID);
                    _srl.is(':hidden') && _srl.removeClass('hidden');
                }
                
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
                    var _sh = $('#sell-handle').val();
                    if(_sh == 'added' && ($sadd.val() == '' || $sadd.val() == null)) {
                        // 当类型为额外退款时，退款说明必须填写
                        $sadd.addClass('fs');
                    } else if((_sh == 'reimburse' || _sh == 'account') && parseFloat(_amt) > parseFloat((_OID?_d.Order.AmountPaid:_d.AmountOfMoney.Amt))) {
                        // 当类型为退款时，输入金额不能大于订单金额
                        $samt.addClass('fs');
                        alert('退款金额不能大于订单金额！');
                    } else {
                        $sadd.hasClass('fs') && $sadd.removeClass('fs');

                        // 类型参数
                        var _type = ModeChange(_sh, false);

                        // 申请原因拼装
                        var op = {
                                OID           : _d.DataID,
                                Types         : $('#sell-cause').val(),
                                ExecuteMode   : _type,
                                ToBuyerMessage: $sadd.val(),
                                Amount        : parseFloat(_amt),
                                Title         : ''
                        };
                        if (_OID) {
                            op.OID = _OID;
                            _d = _d.Order;
                            op.Title = _d.ShopName + '的买家【' + _d.BuyerID + '】对订单['+ _d.OID +']的'+ _type +'申请';
                        }else {
                            op.Title = _d.Shop + '的买家【' + _d.Buyer + '】对订单['+ _d.DataID +']的'+ _type +'申请';
                        }
                        SaveServiceReimburse(op);
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
                                WebAssign();
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
            function SaveServiceReimburse(op) {
                $.ajax({
                    url     : '/CustomerService/API/?Do=AfterSaleSave',
                    type    : 'POST',
                    dataType: 'JSON',
                    data    : op,
                    success : function(d) {
                        common.alert({
                            type : 'success',
                            title: op.ExecuteMode + '申请：',
                            msg  : d.Message,
                            cb   : function() {
                                d.Ack && WebAssign();
                            }
                        });
                    }
                });
            }

            /**
             * 查看是否需要查询接口 - 订单详情
             * @param {String} OID 订单的OID
             * @param {JSON}   _d  数据
             */
            function IfConnection(OID, _d) {
                common.loading.show();
                // 售后单备注
                var orderOption = {
                    Target : $('#order-remark'),
                    Title  : '订单备注',
                    DataID : OID,
                    UID    : currentUID,
                    HasWarp: false
                };
                if (_d) {
                    OrderDetail(_d);
                    Remark(orderOption, _d);
                    common.loading.hide();
                } else {
                   $.ajax({
                       url     : '/OMS/API/?Do=Query&DataID=' + OID,
                       type    : 'GET',
                       dataType: 'JSON',
                       success : function(data) {
                            $('#nav-order').attr('data-id', data.DataID);
                            OrderDetail(data.DataList[0]);
                            Remark(orderOption, data);
                            common.loading.hide();
                       }
                   }); 
                }
            }

            /**
             * 订单详情
             * @param {Object} Data 数据
             */
            function OrderDetail(Data) {
                var $od = $('#order-detailed');
                // 订单详情
                var tableOrder = $('<table class="table table-striped table-bordered table-hover table-condensed">'
                                   + '<caption>订单详情</caption>'
                                   + '<thead>'
                                     + '<th>订单号</th>'
                                     + '<th>账号</th>'
                                     + '<th>买家</th>'
                                     + '<th>创建时间</th>'
                                     + '<th>状态</th>'
                                     + '<th>出货时间</th>'
                                     + '<th>期望物流</th>'
                                   + '</thead>'
                                   + '<tbody></tbody>'
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
                                    + '<thead>'
                                      + '<th>总额</th>'
                                      + '<th>货币</th>'
                                      + '<th>付款时间</th>'
                                      + '<th>付款状态</th>'
                                      + '<th>支付方式</th>'
                                      + '<th>运费</th>'
                                    + '</thead>'
                                   + '<tbody></tbody>'
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
                                      + '<thead>'
                                        + '<th>流水编号</th>'
                                        + '<th>支付账号</th>'
                                        + '<th>状态</th>'
                                        + '<th>收款账号</th>'
                                        + '<th>金额</th>'
                                      + '</thead>'
                                      + '<tbody></tbody>'
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
                                           + '<th>订单交易号</th>'
                                           + '<th>产品编码</th>'
                                           + '<th>SKU</th>'
                                           + '<th>包含产品</th>'
                                           + '<th>数量</th>'
                                           + '<th>价格</th>'
                                           + '<th>物流商</th>'
                                           + '<th>追踪号</th>'
                                           + '<th>创建时间</th>'
                                         + '</thead>'
                                         + '<tbody></tbody>'
                                       + '</table>');
                var tmpTransaction = '{{#Transaction}}'
                                   + '<tr data-id="{{DataID}}">'
                                     + '<td>{{OrderLineItemID}}</td>'
                                     + '<td>{{ItemID}}</td>'
                                     + '<td>{{SKU}}</td>'
                                     + '<td>'
                                     + '{{#Product}}'
                                     +   '{{Status}}&nbsp;[{{FullSKU}}]&nbsp;{{FullName}}&nbsp;*&nbsp;{{Quantity}}<br>'
                                     + '{{/Product}}'
                                     + '</td>'
                                     + '<td>{{Quantity}}</td>'
                                     + '<td>{{Price}}</td>'
                                     + '<td>{{CarrierUsed}}</td>'
                                     + '<td>{{TrackingNumber}}</td>'
                                     + '<td>{{CreatedTime}}</td>'
                                   + '</tr>'
                                   + '{{/Transaction}}';
                tableTransaction.find('tbody').html(Mustache.render(tmpTransaction, Data));
                $od.append(tableTransaction);

                // 运单信息
                $od.append('<div id="order-logistics"><span class="text-muted mg-b-10">运单信息</span></div>');
                var logOption = {
                    Element  : $('#order-logistics'), // 容器
                    OID      : Data.OrderID,          // OID，和数据两者必须至少存在一个
                    Data     : '',                    // 数据，和OID两者必须至少存在一个
                    Placement: 'top',                 // 弹出框显示位置
                    Mode     : 'append'
                };
                LogisticsModule(logOption);
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
                InfoReset();            // 模态框Info重置
                TagReset();             // 标签页重置
                DataListHistoryReset(); // DataList Table重置
                CanChangeReset();       // 可变动模块重置
                SearchListReset();      // 搜索交易单列表重置
                AgainReset();           // 重发模块重置
                OptionReset();          // 原因和处理方法选项重置
                LogisticsListReset();   // 订单处理记录列表重置
                ReimburseReset();       // 退款模块重置
                ProductReset();         // 产品模块重置
                RemarkReset();          // 备注重置
            }

            // 模态框Info重置
            function InfoReset() {
                $('#sell-info').empty();
            }

            // 标签页重置
            function TagReset() {
                $('#nav-tag-service').click();
                $('#nav-tag-order').off();
                $('#order-detailed').html('<p>暂无订单详情信息。</p>');

                $('#nav-tag-log').off();
                $('#nav-log').html('<p>暂无操作日志信息。</p>');
            }

            // DataList Table重置
            function DataListHistoryReset() {
                var $sd = $('#sell-datalist');
                !$sd.hasClass('hidden') && $sd.addClass('hidden');
            }

            // 可变动模块重置
            function CanChangeReset() {
                var $1st = $('#sell-can-change-1st');
                var $2nd = $('#sell-can-change-2nd');
                !$1st.hasClass('hidden') && $1st.addClass('hidden');
                !$2nd.hasClass('hidden') && $2nd.addClass('hidden');
            }

            // 搜索交易单列表重置
            function SearchListReset() {
                var $dom1 = $('#search-list-toggle');
                var $dom2 = $('#sell-search').closest('div.col-sm-12');
                $('#sell-error').empty();
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
                $('#sell-handle').off().removeAttr('disabled title');
                $('#sell-cause option:first').prop('selected', true);
                $('#sell-handle option:first').prop('selected', true);
            }

            // 订单处理记录列表重置
            function LogisticsListReset() {
                var $dom = $('#order-list-1st');
                !$dom.hasClass('hidden') && $dom.addClass('hidden');
                $dom.find('tbody').empty();
            }
            
            // 退款模块重置
            function ReimburseReset() {
                $('#sell-added').val('');
                $('#sell-amount').val('');
                !$('#sell-reimburse-list').hasClass('hidden') && $('#sell-reimburse-list').addClass('hidden')
            }

            // 产品模块重置
            function ProductReset() {
                $('#common-sreach-2nd input').val('');
                $('#common-sreach-2nd .search-drop').empty();
                $('#sell-save').hasClass('hidden') && $('#sell-save').removeClass('hidden');
            }

            // 备注重置
            function RemarkReset() {
                var $domSell = $('#sell-remark');
                var $domOrder = $('#order-remark');
                !($domSell.hasClass('hidden')) && $domSell.addClass('hidden');
                !($domOrder.hasClass('hidden')) && $domOrder.addClass('hidden');
            }

            
            // 页面渲染
            (function() {
                var _dl = $('#data-list');
                // 单号渲染
                common.Rendering.order(_dl);

                // 处理原因渲染
                var exmOption = {
                    Type : ['退款', '重发', '额外退款'], 
                    Style: ['label-danger', 'label-primary', 'label-warning'],
                    Mode : 'replace'
                };
                common.Rendering.All(_dl.find('.exm'), exmOption);

                // 状态渲染
                var statusOption = {Type : ['初始', '进行中', '已结束', '取消'], Mode : 'replace'};
                common.Rendering.All(_dl.find('.status'), statusOption);

                // 产品渲染
                common.copy.ProductData(_dl.find('.product'));

            })();

            /**
             * 设置URL，用于清除跳转过来的数据尾巴
             */
            function WebAssign() {
                var op = common.URL.parse();
                window.location.search = 'Do=' + op.Do;
            }

            // 标签页定位
            (function() {
                var $formSearch = $('#form-search');
                var op = common.URL.parse();
                var labelOption = {
                    Nav    : $('.nav'),        // 标签页元素
                    Do     : op.Do,            // URL中Do的值；使用common.URL.parse()获取
                    KeyWord: op.KeyWord,       // URL中KeyWord的值；使用common.URL.parse()获取;可能为空
                    Form   : $formSearch       // 搜索框的form元素 
                };
                common.WebCommon(labelOption);

                $formSearch.find('input[name="KeyWord"]').val(decodeURI((op.KeyWord || '').replace(/\++/g, ' ')));
                $formSearch.find('select[name="ShopID"]').find('option[value="' + op.ShopID + '"]').prop('selected', true);
            })();

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
