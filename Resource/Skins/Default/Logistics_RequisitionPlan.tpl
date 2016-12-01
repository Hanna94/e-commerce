{页面属性}{/页面属性}
<body>
    {页顶导航}{/页顶导航}
    <!-- 内容-->
    <div id="data-list" class="container-fluid">
        <header>
            <div class="btn-group btn-group-sm pull-right">
                <button id="btn-create-plan" class="btn btn-default" type="button">创建调拨计划</button>
                <button class="btn btn-default" type="button">提审</button>
                <button class="btn btn-default" type="button">取消</button>
            </div>
            <form action="?" class="form-inline pull-right pull-right mg-r-20">
                <div class="form-group form-group-sm">
                    <select id="TeamID" class="form-control" name="TeamID" data-default="{TeamID}">
                        <option value="0">空运</option>
                        <option value="1">海运</option>
                        <option value="2">香港DHL</option>
                    </select>
                </div>
                <div class="form-group form-group-sm mg-l-20">
                    <div class="input-group input-group-sm">
                        <input type="text" class="form-control" placeholder="单号/产品名称/产品SKU">
                        <span class="input-group-btn">
                            <button class="btn btn-default" type="button">查询</button>
                        </span>
                    </div>
                </div>
            </form>
        </header>
    
        <ul class="nav nav-tabs">
            <li><a href="?Do=All">全部</a></li>
            <li><a href="?Do=Start">初始</a></li>
            <li><a href="?Do=Verify">提审</a></li>
            <li><a href="?Do=Ongoing">在途</a></li>
            <li><a href="?Do=Complete">完成</a></li>
            <li><a href="?Do=Cancel">取消</a></li>
        </ul>

        <div class="tab-content mg-t-5">
            <div class="tab-pane active">
                <div class="maxH800">
                    <table class="table table-striped table-bordered table-hover table-condensed">
                        <thead>
                            <th><input id="" type="checkbox"></th>
                            <th>调拨计划单号</th>
                            <th>发起人</th>
                            <th>调拨方式</th>
                            <th>调拨方向</th>
                            <th>Sku数量</th>
                            <th>提审时间</th>
                            <th>预期抵达</th>
                            <th>完成时间</th>
                            <th>状态</th>
                            <th>创建时间</th>
                            <th>操作</th>
                        </thead>
                        <tbody>
                            <!-- BEGIN 数据列表 ATTRIB= -->
                            <tr data-id="{DataID}" data-order="{OrderID}">
                                <td><input type="checkbox" value="{DataID}"></td>
                                <td>{OrderID}</td>
                                <td>{Name}</td>
                                <td>{Types}</td>
                                <td>{OutStock} - {InStock}</td>
                                <td>{Quantity}</td>
                                <td>{VerifyDate}</td>
                                <td>{ArrivalDate}</td>
                                <td>{InStockDate}</td>
                                <td>{Status}</td>
                                <td>{Date}</td>
                                <td>
                                    <span class="btn-edit-plan poi glyphicon glyphicon-pencil mg-r-5" title="编辑"></span>
                                    <span class="btn-log poi glyphicon glyphicon-list-alt" title="日志"></span>
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

    <!-- 设置调拨计划模态框 -->
    <div id="modal-plan-edit" data-id="0" class="modal fade" tabindex="-1" data-backdrop="static">
        <div class="modal-dialog" style="width:800px">
            <div class="modal-content">
                <div class="modal-header">
                    <button class="close" type="button" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">设置调拨计划</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <!-- input部分 -->
                        <div class="form-group form-group-sm">
                            <label class="control-label col-sm-2">计划单号</label>
                            <div class="col-sm-4">
                                <input name="modal-plan-order" type="text" class="form-control" readonly>
                            </div>
                            <label class="control-label col-sm-2">发起人</label>
                            <div class="col-sm-4">
                                <input name="modal-plan-name" type="text" class="form-control" readonly>
                            </div>
                        </div>
                        <div class="form-group form-group-sm">
                            <label class="control-label col-sm-2">调拨方式</label>
                            <div class="col-sm-4">
                                <select name="modal-plan-types" class="form-control">
                                    <option value="海运">海运</option>
                                    <option value="空运" selected>空运</option>
                                    <option value="香港DHL">香港DHL</option>
                                </select>
                            </div>
                            <label class="control-label col-sm-2">预期抵达</label>
                            <div class="col-sm-4">
                                <input name="modal-plan-arrival" type="text" class="form-control">
                            </div>
                        </div>
                        <div class="form-group form-group-sm">
                            <label class="control-label col-sm-2">调出仓库</label>
                            <div class="col-sm-4">
                                <select name="modal-plan-out" class="form-control"></select>
                            </div>
                            <label class="control-label col-sm-2">调入仓库</label>
                            <div class="col-sm-4">
                                <select name="modal-plan-in" class="form-control"></select>
                            </div>
                        </div>
                        <div class="form-group form-group-sm">
                            <label class="control-label col-sm-2">状态</label>
                            <div class="col-sm-4">
                                <input name="modal-plan-state" type="text" class="form-control" readonly>
                            </div>
                            <label class="control-label col-sm-2">创建日期</label>
                            <div class="col-sm-4">
                                <input name="modal-plan-creation" type="text" class="form-control" readonly>
                            </div>
                        </div>
                        <!-- input部分 End -->
                        <!-- 产品调拨 -->
                        <div class="row">
                            <div class="col-sm-12">
                                <h5 style="border-bottom: #CCC solid 1px; font-weight: bold;">调拨产品</h5>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group form-group-sm">
                                    <div class="col-sm-12 maxH250">
                                        <table class="table table-striped table-bordered table-hover table-condensed">
                                            <colgroup>
                                                <col width="50px">
                                                <col>
                                                <col width="70px">
                                                <col width="10px">
                                            </colgroup>
                                            <thead class="cen-th">
                                                <tr>
                                                    <th>SkuID</th>
                                                    <th>Product</th>
                                                    <th>Quantity</th>
                                                    <th><span class="glyphicon glyphicon-wrench"></span></th>
                                                </tr>
                                            </thead>
                                            <tbody class="ver-td inputH20"></tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <div class="input-group input-group-sm">
                                            <input id="input-search" class="form-control" type="text" placeholder="产品ID / 产品名称 / 产品Sku">
                                            <span class="input-group-btn">
                                                <input type="button" class="btn btn-default btn-search" value="搜索" />
                                                <input type="button" class="btn btn-default btn-empty" value="清空列表" />
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div id="product-search-result" class="list-group col-sm-12 no-select maxH200"></div>
                            </div>
                        </div>
                    <!-- 产品调拨 End -->
                    </form>
                </div>
                <div class="modal-footer">
                    <button id="modal-plan-btn-save" class="btn btn-default btn-sm">保存</button>
                </div>
            </div>
        </div>
    </div>
    
    <!-- 添加产品到调拨列表的tr -->
    <template id="temp-product-add-tr">
        <tr data-id="{{id}}">
            <td>{{id}}</td>
            <td>[{{SKU}}] {{skuName}} </td>
            <td><input class="form-control" type="text" name="modal-plan-quantity" value="0"></td>
            <td><span class="btn-remove glyphicon glyphicon-remove text-danger poi"></span></td>
        </tr>
    </template>
    
    <!-- 渲染产品搜索列表 -->
    <template id="temp-product-search">
        {{#DataList}}
        <a class="list-group-item pd-5 poi" data-id="{{DataID}}" data-sku="{{FullSKU}}" data-name="{{Name}}">[{{Status}}] {{Name}} [{{FullSKU}}]</a>
        {{/DataList}}
    </template>
    {页面底部}{/页面底部}

    <script src="/Resource/js/bootstrap-datetimepicker.js"></script>
    <script src="/Resource/js/bootstrap-datetimepicker.zh-CN.js"></script>
    <script src="/Resource/js/mustache.js"></script>

    <script>
        (function() {
            'use strict';
//=========================================== 模态框方法 ====================================================
            (function() {

                var $modalPlan    = $('#modal-plan-edit');
                var $modalOrder   = $modalPlan.find('input[name="modal-plan-order"]');
                var $modalName    = $modalPlan.find('input[name="modal-plan-name"]');
                var $modalTypes   = $modalPlan.find('select[name="modal-plan-types"]');
                var $modalArrival = $modalPlan.find('input[name="modal-plan-arrival"]');
                var $modalOutW    = $modalPlan.find('select[name="modal-plan-out"]');
                var $modalInW     = $modalPlan.find('select[name="modal-plan-in"]');
                var $modalState   = $modalPlan.find('input[name="modal-plan-state"]');
                var $modalCreate  = $modalPlan.find('input[name="modal-plan-creation"]');

                var $modalSearchList = $('#product-search-result');

                $modalArrival.datetimepicker({
                    format         : 'yyyy-mm-dd',
                    minView        : 2,
                    language       : 'zh-CN',
                    pickerPosition : 'bottom-left',
                    autoclose      : true
                });

                // 遍历仓库下拉
                GetWarehouse($modalOutW, $modalInW);

                // 搜索产品
                $('.btn-search').on('click', function() { SearchProduct($('#input-search').val()) });
                $('.btn-empty').on('click', function() { $('#product-search-result').empty() });
                // 调拨产品列表添加功能
                $modalSearchList.on('click', 'a', function() { ProductAdd($(this), $modalPlan.find('tbody')) });

                // 调拨产品列表删除功能
                    // 新建
                $('#btn-create-plan').click(function() {
                    $('.btn-remove').on('click', function() { ProductRemove($(this)) });
                    $modalPlan.modal('show');
                });
                    // 编辑
                $('.btn-edit-plan').click(function() {
                    var _DataID = $(this).closest('tr').data('id');
                    $modalPlan.attr('data-id', _DataID);
                    $('.btn-remove').on('click', function() {
                        ProductRemove($(this), $(this).closest('tr').data('id'), $modalOrder.val()); 
                    });
                    
                    // 渲染模态框数据
                    var planData = GetPlanData(_DataID);
                    $modalOrder.val(planData.OrderID);
                    $modalName.val(planData.TrueName);
                    _CW($modalTypes, planData.Types);
                    $modalArrival.val(planData.ArrivalDate);
                    _CW($modalOutW, planData.OutWID);
                    _CW($modalInW, planData.InWID);
                    $modalState.val(planData.Status);
                    $modalCreate.val(planData.Date);

                    $modalPlan.modal('show');
                });

                // 数据检测和转换
                $modalPlan.find('tbody tr input').on('change', function() {
                    var val = CheckValue($(this).val());
                    $(this).val(val);
                });

                // 保存计划
                $('#modal-plan-btn-save').on('click', function() {
                    var obj = new Object();
                    obj.da = $modalPlan;
                    obj.mo = $modalPlan;
                    obj.or = $modalOrder;
                    obj.na = $modalName;
                    obj.ty = $modalTypes;
                    obj.ar = $modalArrival;
                    obj.ou = $modalOutW;
                    obj.in = $modalInW;
                    PlanSave(obj);
                });
                

                // 模态框关闭时，清除所有参数
                $modalPlan.on('hidden.bs.modal', function() {
                    $(this).find('form')[0].reset();
                    $(this).find('tbody').empty();
                    $('#product-search-result').empty();
                });

            })();

            /**
             * 获取调拨计划的数据
             * @param {String} _id 调拨计划的ID
             */
            function GetPlanData(_id) {
                var dataJSON;
                $.ajax({
                    url: '/Logistics/API/?Do=RequisitionPlanQuery&DataID=' + _id,
                    type: 'GET',
                    dataType: 'JSON',
                    async: false,
                    success: function(d) {
                        dataJSON = d;
                    }
                });

                return dataJSON;
            }

            /**
             * 遍历仓库下拉
             * @param {Object} _so 调出仓库的select
             * @param {Object} _si 调入仓库的select
             */
            function GetWarehouse(_so, _si) {
                var template =   '{{#DataList}}'
                                +'<option value="{{DataID}}">{{Name}}</option>'
                                +'{{/DataList}}';
                $.ajax({
                    url: 'http://erp.v0.xytinc.com/Logistics/API/?Do=List',
                    type: 'GET',
                    dataType: 'JSON',
                    success: function(d) {
                        _so.html(Mustache.render(template, d));
                        _si.html(Mustache.render(template, d));

                        // 设置出入库默认值
                        _so.find('option[value="10"]').attr('selected', true);
                        _si.find('option[value="6"]').attr('selected', true);
                    }
                });
            }

            /**
             * 搜索产品，并渲染到列表
             * @param {String} kw 查询的关键字
             */
            function SearchProduct(kw) {
                kw ? kw = kw : kw = '';
                $.ajax({
                    url: '/Product/Product.aspx?Do=FullSku&KeyWord=' + kw + '&QueryLimitNumber=50',
                    type: 'GET',
                    dataType: 'JSON',
                    success: function(d){
                        if (d.DataList.length === 0) {
                            $('#product-search-result').html('<p>并没有这种产品！</p>')
                        }else{
                            $('#product-search-result').html(Mustache.render($('#temp-product-search').html(), d));
                        }
                    }
                });
            }

            /**
             * 为新添加的调拨产品绑定事件
             * @param {Object} _$ 新添加的产品的tr
             */
            function BindRemoveEvent(_$) {
                _$.on('click', '.btn-remove', function() { ProductRemove($(this)) });
                _$.on('change', 'input', function() {
                    var val = CheckValue($(this).val());
                    $(this).val(val);
                })
            }

            /**
             * 添加调拨产品列表中的产品
             * @param {Object} _$ 被点击的a标签
             * @param {Object} _t 产品列表的tbody
             */
            function ProductAdd(_$, _t) {
                var tempHTML = $('#temp-product-add-tr').html();
                var skuJSON  = {
                    id: _$.data('id'),
                    SKU: _$.data('sku'),
                    skuName: _$.data('name')
                };
                var productList = ProductList(_t);

                if (productList.indexOf(skuJSON.id) < 0) {
                    _t.prepend(Mustache.render(tempHTML, skuJSON));
                    BindRemoveEvent(_t.find('tr[data-id="' + skuJSON.id + '"]'));
                } else {
                    var val = CheckValue(_t.find('tr[data-id="'+skuJSON.id+'"] input').val()) + 1;
                    _t.find('tr[data-id="'+skuJSON.id+'"] input').val(val);
                }
            }

            /**
             * 移除调拨产品列表中的产品
             * @param {Object} _$  被点击的按钮
             * @param {Number} _id 要删除的产品的id
             * @param {String} _or 要删除的orderID(新建计划时为空)
             */
            function ProductRemove(_$, _id, _or) {
                var skuId = _$.closest('tr').data('skuid');

                // _or是否存在为新建或者更新的区分
                if(_or) {
                    common.ajax({
                        URL: '/Logistics/API/?Do=RequisitionPlanDeleteProduct',
                        type: 'POST',
                        dataType: 'JSON',
                        data: {
                            OrderID: _or,
                            DataID: _id
                        },
                        good: function(d) {
                            common.alert({
                                type: 'success',
                                title: '已移除',
                                time: 1000,
                                msg: d.Message,
                                cb: function() {
                                    _$.closest('tr').remove();
                                }
                            });
                        }
                    });
                } else {
                    _$.closest('tr').remove();
                }
            }

            /**
             * 保存调拨计划
             * @param {Object} obj 模态框对象
             */
            function PlanSave(obj) {
                var dataJSON = {
                    'DataID'     : parseInt(obj.da.data('id')),
                    'OrderID'    : obj.or.val(),
                    'OutWID'     : parseInt(obj.ou.val()),
                    'InWID'      : parseInt(obj.in.val()),
                    'Types'      : obj.ty.val(),
                    'ArrivalDate': obj.ar.val(),
                    'Product'    : JSON.stringify(PieceProductJSON(obj.mo.find('table')))
                };

                common.ajax({
                    URL: '/Logistics/API/?Do=RequisitionPlanSave',
                    type: 'POST',
                    dataType: 'JSON',
                    data: dataJSON,
                    good: function(d) {
                        common.alert({
                            type: 'success',
                            msg: d.Message,
                            time: 2000,
                            cb: function() {
                                // location.reload();
                                cl(dataJSON);
                            }
                        });
                    }
                });
                
            }

            /**
             * 收集已经添加的产品的ID
             * @param {Object} _t     [已添加的产品列表]
             * return {Array}  tArray [返回已添加的产品id的数组]
             */
            function ProductList(_t) {
                var tArray = [];
                _t.children('tr').each(function(index, e) {
                    tArray.push($(this).data('id'));
                });
                return tArray;
            }

            /**
             * 检测并转换输入的产品数量
             * @param {String} val 输入的值
             * return {Number} val 转换后的值
             */
            function CheckValue(val) {
                val = parseInt(val);
                if (!isNaN(val)) {
                    val = Math.abs(val);
                } else {
                    val = 0;
                }
                return val;
            }

            /**
             * 拼装产品列表JSON
             * @param {Object} _tb          添加的产品列表
             * return JSON     productJSON  返回一个拼装好的JSON
             */
            function PieceProductJSON(_tb) {
                var productJSON = {'product': []};

                _tb.find('tbody tr').each(function(index, el) {
                    var temp = {'SkuID': $(this).data('id'), 'Quantity': CheckValue($(this).find('input').val())};
                    productJSON.product.push(temp);
                });

                return productJSON;
            }

            /**
             * 用于遍历select
             * @param  {Object} _$  需要遍历的select元素
             * @param  {String} _id 要显示的选项的值
             */
            function _CW(_$, _id) {
                _$.find('option[selected="selected"]').removeAttr('selected');
                cl(_$.find('option[selected="selected"]').length);
                _$.find('option[value ="' + _id + '"]').attr('selected', true);
                cl(_id);
            }
//=========================================== 模态框方法 ====================================================

//=========================================== 页面基本功能 ====================================================
            
            // 标签页定位
            (function() {
                var op = location.search.split('&');
                var isDo = location.search.split('&')[0];
                var $formSearch = $('#form-search');
                isDo = isDo.split('=')[0] == '?Do' ? isDo : '?Do=All';
                $('.nav a[href="' + isDo + '"]').closest('li').addClass('active');

                $formSearch.find('input[type="text"]').val(decodeURI((op.KeyWord || '').replace(/\++/g, ' ')));
                $formSearch.find('select').find('option[value="' + decodeURI(op.Selected) + '"]').prop('selected', true);
                $formSearch.find('select option[value="' + (op.TeamID || $formSearch.find('select').data('default')) + '"]').prop('selected', true);
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
