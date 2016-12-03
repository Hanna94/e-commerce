{页面属性}{/页面属性}
<body>
    {页顶导航}{/页顶导航}
    <!-- 内容-->
    <div id="data-list" class="container-fluid">
        <header>
            <div class="btn-group btn-group-sm pull-right">
                <button class="btn btn-default" type="button" data-toggle="modal" data-target="#modal-plan-edit">创建调拨计划</button>
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
            <li class="active"><a href="?Do=All">全部</a></li>
            <li><a href="?Do=All">初始</a></li>
            <li><a href="?Do=All">提审</a></li>
            <li><a href="?Do=All">在途</a></li>
            <li><a href="?Do=All">完成</a></li>
            <li><a href="?Do=All">取消</a></li>
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
                            <tr>
                                <td><input type="checkbox" value="13"></td>
                                <td>REP160812XXX001 {OrderID}</td>
                                <td>姚丽丽 {Name}</td>
                                <td>空运/海运/香港DHL {Types}</td>
                                <td>广州仓 - UK仓 {OutStock} - {InStock}</td>
                                <td>3 {Quantity}</td>
                                <td>2016-11-23 {VerifyDate}</td>
                                <td>2016-12-10 {ArrivalDate}</td>
                                <td>2016-12-12 {InstockDate}</td>
                                <td>完成 {Status}</td>
                                <td>2016-11-16 {Date}</td>
                                <td>
                                    <span class="poi glyphicon glyphicon-pencil mg-r-5" title="编辑"></span>
                                    <span class="poi glyphicon glyphicon-list-alt" title="日志"></span>
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
    <div id="modal-plan-edit" class="modal fade" tabindex="-1" data-backdrop="static">
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
                                    <option value="">空运</option>
                                    <option value="">海运</option>
                                    <option value="">香港DHL</option>
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
                                <select name="modal-plan-out" class="form-control">
                                    <option value="">广州仓</option>
                                    <option value="">海运</option>
                                    <option value="">香港DHL</option>
                                </select>
                            </div>
                            <label class="control-label col-sm-2">调入仓库</label>
                            <div class="col-sm-4">
                                <select name="modal-plan-in" class="form-control">
                                    <option value="">广州仓</option>
                                    <option value="">海运</option>
                                    <option value="">香港DHL</option>
                                </select>
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
                                            <tbody class="ver-td inputH20">
                                                <tr data-skuid="3155">
                                                    <td>3155</td>
                                                    <td>[C00247] SADFASDFASDF </td>
                                                    <td><input class="form-control" type="text" name="modal-plan-quantity"></td>
                                                    <td><span class="btn-remove glyphicon glyphicon-remove text-danger poi"></span></td>
                                                </tr>
                                                <tr data-skuid="3155">
                                                    <td>3155</td>
                                                    <td>[C00247] SADFASDFASDF </td>
                                                    <td><input class="form-control" type="text" name="modal-plan-quantity"></td>
                                                    <td><span class="btn-remove glyphicon glyphicon-remove text-danger poi"></span></td>
                                                </tr>
                                                <tr data-skuid="3155">
                                                    <td>3155</td>
                                                    <td>[C00247] SADFASDFASDF  DFASDFASDF DFASDFASDF</td>
                                                    <td><input class="form-control" type="text" name="modal-plan-quantity"></td>
                                                    <td><span class="btn-remove glyphicon glyphicon-remove text-danger poi"></span></td>
                                                </tr>
                                                <tr data-skuid="3155">
                                                    <td>3155</td>
                                                    <td>[C00247] SADFASDFASDF </td>
                                                    <td><input class="form-control" type="text" name="modal-plan-quantity"></td>
                                                    <td><span class="btn-remove glyphicon glyphicon-remove text-danger poi"></span></td>
                                                </tr>
                                                <tr data-skuid="3155">
                                                    <td>3155</td>
                                                    <td>[C00247] SADFASDFASDF </td>
                                                    <td><input class="form-control" type="text" name="modal-plan-quantity"></td>
                                                    <td><span class="btn-remove glyphicon glyphicon-remove text-danger poi"></span></td>
                                                </tr>
                                                <tr data-skuid="3155">
                                                    <td>3155</td>
                                                    <td>[C00247] SADFASDFASDF </td>
                                                    <td><input class="form-control" type="text" name="modal-plan-quantity"></td>
                                                    <td><span class="btn-remove glyphicon glyphicon-remove text-danger poi"></span></td>
                                                </tr>
                                                <tr data-skuid="3155">
                                                    <td>3155</td>
                                                    <td>[C00247] SADFASDFASDF </td>
                                                    <td><input class="form-control" type="text" name="modal-plan-quantity"></td>
                                                    <td><span class="btn-remove glyphicon glyphicon-remove text-danger poi"></span></td>
                                                </tr>
                                                <tr data-skuid="3155">
                                                    <td>3155</td>
                                                    <td>[C00247] SADFASDFASDF </td>
                                                    <td><input class="form-control" type="text" name="modal-plan-quantity"></td>
                                                    <td><span class="btn-remove glyphicon glyphicon-remove text-danger poi"></span></td>
                                                </tr>
                                                <tr data-skuid="3155">
                                                    <td>3155</td>
                                                    <td>[C00247] SADFASDFASDF </td>
                                                    <td><input class="form-control" type="text" name="modal-plan-quantity"></td>
                                                    <td><span class="btn-remove glyphicon glyphicon-remove text-danger poi"></span></td>
                                                </tr>
                                                <tr data-skuid="3155">
                                                    <td>3155</td>
                                                    <td>[C00247] SADFASDFASDF </td>
                                                    <td><input class="form-control" type="text" name="modal-plan-quantity"></td>
                                                    <td><span class="btn-remove glyphicon glyphicon-remove text-danger poi"></span></td>
                                                </tr>
                                                <tr data-skuid="3155">
                                                    <td>3155</td>
                                                    <td>[C00247] SADFASDFASDF </td>
                                                    <td><input class="form-control" type="text" name="modal-plan-quantity"></td>
                                                    <td><span class="btn-remove glyphicon glyphicon-remove text-danger poi"></span></td>
                                                </tr>
                                                <tr data-skuid="3155">
                                                    <td>3155</td>
                                                    <td>[C00247] SADFASDFASDF </td>
                                                    <td><input class="form-control" type="text" name="modal-plan-quantity"></td>
                                                    <td><span class="btn-remove glyphicon glyphicon-remove text-danger poi"></span></td>
                                                </tr>
                                                <tr data-skuid="3155">
                                                    <td>3155</td>
                                                    <td>[C00247] SADFASDFASDF </td>
                                                    <td><input class="form-control" type="text" name="modal-plan-quantity"></td>
                                                    <td><span class="btn-remove glyphicon glyphicon-remove text-danger poi"></span></td>
                                                </tr>

                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <div class="input-group input-group-sm">
                                            <input class="form-control input-search" type="text" placeholder="产品ID / 产品名称 / 产品Sku">
                                            <span class="input-group-btn">
                                                <input type="button" class="btn btn-default btn-search" value="搜索" />
                                                <input type="button" class="btn btn-default btn-empty" value="清空列表" />
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div id="product-search-result" class="list-group col-sm-12 maxH200">
                                    <a class="list-group-item pd-5 poi" data-skuid="111" data-sku="sdas" data-name="SADFAqweF">[销售] SADFASDFASDF [sb233-Def]</a>
                                    <a class="list-group-item pd-5 poi" data-skuid="112" data-sku="sdas" data-name="SADFASDFASDF">[销售] SADFASDFASDF [sb233-Def]</a>
                                    <a class="list-group-item pd-5 poi" data-skuid="113" data-sku="sdas" data-name="SADFASDFASDF">[销售] SADFASDFASDF [sb233-Def]</a>
                                    <a class="list-group-item pd-5 poi" data-skuid="114" data-sku="sdas" data-name="SADFASDFASDF">[销售] SADFASDFASDF [sb233-Def]</a>
                                    <a class="list-group-item pd-5 poi" data-skuid="115" data-sku="sdas" data-name="S1234ASDFASDF">[销售] SADFASDFASDF [sb233-Def]</a>
                                    <a class="list-group-item pd-5 poi" data-skuid="116" data-sku="sdas" data-name="SADFASDFASDF">[销售] SADFASDFASDF [sb233-Def]</a>
                                    <a class="list-group-item pd-5 poi" data-skuid="117" data-sku="sdas" data-name="SADerfwASDF">[销售] SADFASDFASDF [sb233-Def]</a>
                                    <a class="list-group-item pd-5 poi" data-skuid="118" data-sku="sdas" data-name="SADFAqweDF">[销售] SADFASDFASDF [sb233-Def]</a>
                                    <a class="list-group-item pd-5 poi" data-skuid="119" data-sku="sdas" data-name="SADFASDFASDF">[销售] SADFASDFASDF [sb233-Def]</a>
                                    <a class="list-group-item pd-5 poi" data-skuid="120" data-sku="sdas" data-name="SADFASDFASDF">[销售] SADFASDFASDF [sb233-Def]</a>
                                    <a class="list-group-item pd-5 poi" data-skuid="121" data-sku="sdas" data-name="SADasdfSDFASDF">[销售] SADFASDFASDF [sb233-Def]</a>
                                    <a class="list-group-item pd-5 poi" data-skuid="122" data-sku="sdas" data-name="SADFASDFASDF">[销售] SADFASDFASDF [sb233-Def]</a>
                                </div>
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
        <tr data-skuid="{{skuId}}">
            <td>{{skuId}}</td>
            <td>[{{SKU}}] {{skuName}} </td>
            <td><input class="form-control" type="text" name="modal-plan-quantity"></td>
            <td><span class="btn-remove glyphicon glyphicon-remove text-danger poi"></span></td>
        </tr>
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

                var $modalPlan = $('#modal-plan-edit');
                var $modalOrder = $modalPlan.find('input[name="modal-plan-order"]');
                var $modalName = $modalPlan.find('input[name="modal-plan-name"]');
                var $modalTypes = $modalPlan.find('input[name="modal-plan-types"]');
                var $modalArrival = $modalPlan.find('input[name="modal-plan-arrival"]');

                var $modalSearchList = $('#product-search-result');

                $modalArrival.datetimepicker({
                    format: 'yyyy-mm-dd',
                    minView: 2,
                    language: 'zh-CN',
                    pickerPosition: "bottom-left",
                    autoclose: true
                });

                // 调拨产品列表添加功能
                $modalSearchList.on('click', 'a', function() { ProductAdd($(this), $modalPlan.find('tbody')) });
                // 调拨产品列表删除功能
                $('.btn-remove').on('click', function() { ProductRemove($(this)) });

            })();

            /**
             * 为新添加的调拨产品绑定事件
             * @param {Object} _$ 新添加的产品的tr
             */
            function BindRemoveEvent(_$) {
                _$.on('click', '.btn-remove', function() { ProductRemove($(this)) });
            }

            /**
             * 添加调拨产品列表中的产品
             * @param {Object} _$ 被点击的a标签
             * @param {Object} _t 产品列表的tbody
             */
            function ProductAdd(_$, _t) {
                var tempHTML = $('#temp-product-add-tr').html();
                var skuJSON = {
                    skuId: _$.data('skuid'),
                    SKU: _$.data('sku'),
                    skuName: _$.data('name')
                };

                // common.ajax({
                //     URL: '',
                //     type: 'POST',
                //     dataType: 'JSON',
                //     data: {  },
                //     good: function(d) {
                //         common.alert({
                //             title: '添加产品',
                //             type: 'success',
                //             time: 500,
                //             msg: '完成：' + d.Message,
                //             cb: function() {
                //                 _t.prepend(Mustache.render(tempHTML, skuJSON));
                //             }
                //         });
                //     }
                // });

                // 测试用代码
                cl(skuJSON);
                _t.prepend(Mustache.render(tempHTML, skuJSON));
                BindRemoveEvent(_t.find('tr[data-skuid="' + skuJSON.skuId + '"]'));
            }

            /**
             * 移除调拨产品列表中的产品
             * @param {Object} _$ 被点击的按钮
             */
            function ProductRemove(_$) {
                var skuId = _$.closest('tr').data('skuid');

                // common.ajax({
                //     URL: '',
                //     type: 'POST',
                //     dataType: 'JSON',
                //     data: {  },
                //     good: function(d) {
                //         common.alert({
                //             title: '移除产品',
                //             type: 'success',
                //             time: 500,
                //             msg: '完成：' + d.Message,
                //             cb: function() {
                //                 _$.closest('tr').remove();
                //             }
                //         });
                //     }
                // });
                
                // 测试用代码
                cl(skuId);
                _$.closest('tr').remove();
            }
//=========================================== 模态框方法 ====================================================

//=========================================== 页面基本功能 ====================================================
            
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
            // (function() {
            //     <!-- BEGIN 分页脚本 ATTRIB= -->
            //     common.showPage({当前页}, {总条数}, {每页条数});
            //     <!-- END 分页脚本 -->
            // })();

//=========================================== 页面基本功能 ====================================================
        })();
    </script>
</body>
</html>
