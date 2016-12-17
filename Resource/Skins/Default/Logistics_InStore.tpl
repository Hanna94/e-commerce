{页面属性}{/页面属性}
<body>
    {页顶导航}{/页顶导航}
    <!-- 内容-->
    <div id="data-list" class="container-fluid">
        <header>
            <div class="btn-group btn-group-sm pull-right">
                <button class="btn btn-default" type="button">下单</button>
                <button class="btn btn-default" type="button">取消</button>
            </div>
            <form action="?" class="form-inline mg-r-20 mg-b-10">
                <div class="form-group form-group-sm mg-r-15">
                    <label class="control-label">物流方式</label>
                    <select id="TeamID" class="form-control" name="TeamID" data-default="{TeamID}">
                        <option value="0">空运</option>
                        <option value="1">海运</option>
                        <option value="2">香港DHL</option>
                    </select>
                </div>
                <div class="form-group form-group-sm mg-r-15">
                    <label class="control-label">目标仓库</label>
                    <select class="form-control" name="TeamID" data-default="{TeamID}">
                        <option value="0">全部</option>
                        <option value="1">广州仓</option>
                        <option value="2">海外仓</option>
                    </select>
                </div>
                <div class="form-group form-group-sm mg-r-15">
                    <label class="control-label">状态</label>
                    <select id="TeamID" class="form-control" name="TeamID" data-default="{TeamID}">
                        <option value="0">全部</option>
                        <option value="1">状态1</option>
                        <option value="2">状态2</option>
                        <option value="3">状态3</option>
                    </select>
                </div>
                <div class="form-group form-group-sm">
                    <input type="text" class="form-control" placeholder="调拨单号 / 货代单号">
                </div>
                <div class="form-group form-group-sm">
                    <button class="btn btn-default btn-sm" type="button">查询</button>
                </div>
            </form>
        </header>
        
        <div class="row">
            <div class="col-sm-12">
                <table class="table table-striped table-bordered table-hover table-condensed">
                    <thead>
                        <th><input id="" type="checkbox"></th>
                        <th>调拨单号</th>
                        <th>货代单号</th>
                        <th>货代状态</th>
                        <th>物流方式</th>
                        <th>处理点</th>
                        <th>抵达仓库</th>
                        <th>交货日期</th>
                        <th>箱数</th>
                        <th>体积重量</th>
                        <th>费用</th>
                        <th>创建时间</th>
                        <th>操作</th>
                    </thead>
                    <tbody>
                        <!-- BEGIN 数据列表 ATTRIB= -->
                        <tr>
                            <td><input type="checkbox" value="{DataID}"></td>
                            <td>{ReferenceID}</td>
                            <td>{OrderSign}</td>
                            <td class="status">{Status}</td>
                            <td class="article">{ShippingMethod}</td>
                            <td>{Location}</td>
                            <td class="war">{Warehouse}</td>
                            <td>{ArriveTime}</td>
                            <td>{CountCase}</td>
                            <td>{CountCBM} CBM<br>{CountWeight} KG</td>
                            <td>{CountCost}</td>
                            <td>{Date}</td>
                            <td>
                                <span class="poi glyphicon glyphicon-pencil mg-r-5 btn-edit" title="编辑"></span>
                                <span class="poi glyphicon glyphicon-list-alt btn-log" title="日志"></span>
                            </td>
                        </tr>
                        <!-- END 数据列表 -->
                    </tbody>
                    <tfoot><tr><td colspan="13"></td></tr></tfoot>
                </table>
            </div>
        </div>

        <!-- 设置入库单 -->
        <div id="modal-instore-edit" class="modal fade" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form class="form-horizontal">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                            <h4 class="modal-title">设置入库单<small class="mg-l-5"></small><small class="mg-l-5"></small></h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-group form-group-sm">
                                <label for="set-referenceID" class="control-label col-sm-2">调拨单号</label>
                                <div class="col-sm-4">
                                    <input id="set-referenceID" type="text" class="form-control" readonly>
                                </div>
                                <label for="set-order" class="control-label col-sm-2">货代单号</label>
                                <div class="col-sm-4">
                                    <input id="set-order" type="text" class="form-control" readonly>
                                </div>
                            </div>
                            <div class="form-group form-group-sm">
                                <label for="set-article" class="control-label col-sm-2">运输方式</label>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <select id="set-article" class="form-control" data-status="{{SkuStatus}}">
                                            <option value=""></option>
                                            <option value="SEALCL">海运</option>
                                            <option value="AIRLCL">空运</option>
                                        </select>
                                    </div>
                                </div>
                                <label for="set-arrive" class="control-label col-sm-2">交货日期</label>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <input id="set-arrive" type="text" class="form-control" readonly>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group form-group-sm">
                                <label for="sku-state" class="control-label col-sm-2">处理点</label>
                                <div class="col-sm-4">
                                    <select id="sku-state" class="form-control" data-status="{{SkuStatus}}">
                                        <option value="GZ">广州仓</option>
                                    </select>
                                </div>
                                <label for="sku-battery" class="control-label col-sm-2">电池</label>
                                <div class="col-sm-4">
                                    <select id="sku-battery" class="form-control">
                                        <option value=""></option>
                                        <option value="带电">带电</option>
                                        <option value="纯电">纯电</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group form-group-sm"><hr></div>
                            <p>此处为SPU公共属性</p>
                            <div class="form-group form-group-sm">
                                <label for="public-spu-declare" class="control-label col-sm-2">申报名称</label>
                                <div class="col-sm-4">
                                    <input id="public-spu-declare" type="text" class="form-control" readonly>
                                </div>
                                <label for="public-spu-usd" class="control-label col-sm-2">申报价值USD</label>
                                <div class="col-sm-4">
                                    <input id="public-spu-usd" type="text" class="form-control" readonly>
                                </div>
                            </div>
                            <div class="form-group form-group-sm">
                                <label for="public-spu-size" class="control-label col-sm-2">尺寸(长宽高)</label>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <input id="public-spu-size" type="text" class="form-control" readonly>
                                        <span class="input-group-addon">cm<sup>3</sup></span>
                                    </div>
                                </div>
                                <label for="public-spu-weight" class="control-label col-sm-2">重量</label>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <input id="public-spu-weight" type="text" class="form-control" readonly>
                                        <span class="input-group-addon">g</span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group form-group-sm">
                                <label for="public-spu-state" class="control-label col-sm-2">状态</label>
                                <div class="col-sm-4">
                                    <input id="public-spu-state" type="text" class="form-control" readonly>
                                </div>
                                <label for="public-spu-battery" class="control-label col-sm-2">电池</label>
                                <div class="col-sm-4">
                                    <input id="public-spu-battery" type="text" class="form-control" readonly>
                                </div>
                            </div>
                        </div>
                        <div class="form-group form-group-sm">
                            <div class="col-sm-12">
                                <hr>
                                <button id="sku-edit-save" class="btn btn-default btn-sm center-block" type="button">保存</button>
                            </div>
                        </div>
                    </form>
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

            // 设置入库单
            $('.btn-edit').on('click', function() {
                $('#modal-instore-edit').modal('show');
            });

            // 状态渲染
            var StatusOption = {
                Type : ['Submitted', 'ShippingIn', 'PartShippingIn', 'Confirmed'],
                Ch   : ['已审核', '已入库', '部分入库', '已交运'],
                Style: ['label-primary', 'label-info', 'label-warning', 'label-success'],
                Mode : 'replace'
            };
            var ArticleOption = {
                Type : ['SEALCL', 'AIRLCL'],
                Ch   : ['海运', '空运'],
                Style: ['label-primary', 'label-info'],
                Mode : 'replace'
            };
            var WarOption = {
                Type : ['AU', 'UK', 'DE'],
                Style: ['label-primary', 'label-warning', 'label-danger'],
                Mode : 'replace'
            };
            common.Rendering.All($('#data-list').find('.status'), StatusOption);
            common.Rendering.All($('#data-list').find('.article'), ArticleOption);
            common.Rendering.All($('#data-list').find('.war'), WarOption);
            // 状态渲染 - End


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

            // 返回顶部按钮
            common.topBtn($('body'));

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
