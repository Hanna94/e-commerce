{页面属性}{/页面属性}
<body>
	{页顶导航}{/页顶导航}
    <!-- 内容-->
    <article class="container-fluid">
        <div class="row">
            <div class="col-lg-3 col-md-4 col-sm-5">
                <div class="panel panel-default">
                    <div class="panel-heading">产品搜索</div>
                    <div class="panel-body">
                        <form id="form-search" action="javascript:;" class="form-horizontal">
                            <div class="form-group form-group-sm">
                                <label class="col-sm-2 control-label">仓库</label>
                                <div class="col-sm-10">
                                    <div class="input-group input-group-sm">
                                        <select class="form-control" name="WID" ID="WID">
                                            <option value="0">全部</option>
                                            <!-- BEGIN 仓库列表 ATTRIB= -->
                                            <option value="{ID}">[{代码}]{所在地}  {名称}</option>
                                            <!-- END 仓库列表 -->
                                        </select>
                                        <div class="input-group-btn">
                                            <button type="button" class="btn btn-default btn-confirm-warehouse">
                                                <span class="glyphicon glyphicon-eye-open"></span> 确定
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group form-group-sm">
                                <label class="col-sm-2 control-label">产品</label>
                                <div class="col-sm-10">
                                    <div class="input-group input-group-sm">
                                        <input type="text" class="form-control">
                                        <div class="input-group-btn">
                                            <button type="submit" class="btn btn-default">
                                                <span class="glyphicon glyphicon-search"></span> 搜索
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>

                        <!-- 待识别按钮-->
                        <button class="btn btn-warning btn-xs pull-right btn-discern" type="button">待识别</button>

                        <!-- 收藏与搜索-->
                        <ul class="nav nav-tabs">
                            <li><a href="#collect" data-toggle="tab"><span class="glyphicon glyphicon-star"></span> 收藏</a></li>
                            <li class="active"><a href="#result" data-toggle="tab">搜索结果</a></li>
                        </ul>

                        <div class="tab-content mg-t-10">
                            <div id="collect" class="tab-pane">
                                <p class="text-danger">有待开发...</p>
                            </div>
                            <div id="result" class="tab-pane active">
                                <ul class="list-group"></ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-9 col-md-8 col-sm-7">
                <div id="data-list" class="panel panel-default">
                    <div class="panel-heading">“所有”的库存信息</div>

                    <!-- 数据列表-->
                    <table class="table table-hover table-bordered table-striped table-condensed">
                        <thead>
                            <tr>
                                <th>仓库代码/所在地</th>
                                <th>库存编码</th>
                                <th>库存SKU</th>
                                <th>尺寸</th>
                                <th>重量</th>
                                <th>实际库存</th>
                                <th>冻结库存</th>
                                <th>可用库存</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- BEGIN 数据列表 ATTRIB= -->
                            <tr data-id="{DataID}">
                                <td title="{Name}" class="label-set"><span class="code label">{Code}</span> <span class="state label">{Location}</span></td>
                                <td>{InsideNo}</td>
                                <td>{SKU}</td>
                                <td>{Size}</td>
                                <td>{Weight}</td>
                                <td>{AllQuantity}</td>
                                <td>{LockQuantity}</td>
                                <td>{Quantity}</td>
                                <td><span data-id="{DataID}" class="glyphicon glyphicon-list-alt poi" title="库存日志"></span></td>
                            </tr>
                            <!-- END 数据列表 -->
                        </tbody>
                        <tfoot><tr><td colspan="9"></td></tr></tfoot>
                    </table>
                </div>
            </div>
        </div>
    </article>

    <!-- 库存信息-->
    <template id="temp-stock-list">
        {{#DataList}}
        <tr data-id="{{DataID}}">
            <td title="{{Name}}" class="label-set"><span class="code label">{{Code}}</span> <span class="state label">{{Location}}</span></td>
            <td>{{InsideNo}}</td>
            <td>{{SKU}}</td>
            <td>{{Size}}</td>
            <td>{{Weight}}</td>
            <td>{{AllQuantity}}</td>
            <td>{{LockQuantity}}</td>
            <td>{{Quantity}}</td>
            <td><span data-id="{{DataID}}" class="glyphicon glyphicon-list-alt poi" title="库存日志"></span></td>
        </tr>
        {{/DataList}}
    </template>

    <template id="temp-search-result">
        {{#DataList}}
        <li class="list-group-item pd-5" data-id="{{DataID}}">
            <div class="row">
                <div class="col-xs-9 name">{{Name}}</div>
                <div class="col-xs-3 text-right">
                    <div class="btn-group btn-group-xs">
                        <button class="btn btn-success" title="收藏" type="button">
                            <span class="glyphicon glyphicon-star-empty"></span>
                        </button>
                        <button class="btn-look btn btn-default" title="查看" type="button">
                            <span class="glyphicon glyphicon-eye-open"></span>
                        </button>
                    </div>
                </div>
            </div>
        </li>
        {{/DataList}}
        <li class="list-group-item">分页</li>
    </template>
    
    {页面底部}{/页面底部}
    <script src="/Resource/js/mustache.js"></script>

    <script>
        var $dataList = $('#data-list'),
            tempStockList = $('#temp-stock-list').html(),
            tempSearchResult = $('#temp-search-result').html(),
            $formSearch = $('#form-search'),
            $warehouseSelect = $formSearch.find('select'),
            $result = $('#result');

        // 选择仓库点击确定
        $formSearch.find('.btn-confirm-warehouse').on('click', function () {
            var wid = $warehouseSelect.val();
            if (+wid) {
                common.ajax({
                    title: '搜索仓库库存',
                    URL: '/Logistics/Logistics.aspx?Do=StockByWID&DataID=' + wid,
                    good: function(data) {
                        renderList(data, $warehouseSelect.find('option:selected').text());
                    }
                });
            } else {
                getStockList(1, $dataList.find('tfoot .dropdown-menu .active').data('size'));
            }
        });

        // 获取团队库存信息
        function getStockList (page, size) {
            common.ajax({
                title: '获取库存信息',
                URL: '/Logistics/Logistics.aspx?Do=GetStockByTeamID&Page=' + page + '&QueryLimitNumber=' + size,
                good: function (data) {
                    renderList(data, '所有');
                }
            });
        }

        // 获取仓库库存信息
        function getWarehouseStock(page, size) {
            common.ajax({
                title: '搜索仓库库存',
                URL: '/Logistics/Logistics.aspx?Do=StockByWID&DataID=' + $warehouseSelect.val() + '&Page=' + page + '&QueryLimitNumber=' + size,
                good: function(data) {
                    renderList(data, $warehouseSelect.find('option:selected').text());
                }
            });
        }

        // 渲染数据
        function renderList(data, title) {
            $dataList.find('.panel-heading').text('“' + title + '”的库存信息');
            if (!data.DataList.length) {
                common.alert({
                    type: 'success',
                    title: '“获取库存信息”操作：',
                    msg: data.Message || '暂无数据！'
                });
                return;
            }
            // 插入冻结库存的数据
            $dataList.find('tbody').html(Mustache.render(tempStockList, data));
            $dataList.find('.label-set').each(function() {
                var $this = $(this);
                    $state = $this.find('.state'),
                    $code = $this.find('.code');
                $state.addClass('label-' + common.order.setState($state.text()));
                $code.addClass('label-' + common.order.warehouseCode($code.text()));
            });
            if (data.Page) {
                common.setPaging(
                    $dataList.find('tfoot td'),
                    data.Page,
                    data.QueryDatas,
                    data.QueryLimitNumber,
                    function(page, size) {
                        if (+$warehouseSelect.val()) {
                            getWarehouseStock(page, size);
                        } else {
                            getStockList(page, size);
                        }
                    }
                );
            } else {
                $dataList.find('tfoot td').html('');
            }
        }

        // 待识别按钮
        $formSearch.closest('div').find('.btn-discern').on('click', function() {
            common.ajax({
                title: '获取待识别库存信息',
                URL: '/Logistics/Logistics.aspx?Do=GetStockBySkuID&DataID=0',
                good: function(data) {
                    renderList(data, '待识别');
                }
            });
        });

        // 点击产品产品库存
        $result.on('click', '.btn-look', function () {
            var $listGroupItem = $(this).closest('.list-group-item');
            common.ajax({
                title: '获取产品库存信息',
                URL: '/Logistics/Logistics.aspx?Do=GetStockBySkuID&DataID=' + $listGroupItem.data('id'),
                good: function(data) {
                    renderList(data, $listGroupItem.find('.name').text());
                }
            });
        });

        // 搜索产品
        $formSearch.on('submit', function () {
            getProductList(1, 20, $formSearch.find('input[type="text"]').val());
        });

        // 获取产品信息
        function getProductList (page, size, keyword) {
            common.ajax({
                title: '搜索产品',
                URL: '/Product/Product.aspx?Do=FullSku&KeyWord=' +
                    keyword + '&page=' + page +
                    '&size=' + size,

                good: function(data) {
                    $result.html(Mustache.render(tempSearchResult, data));
                    common.miniPaging(
                        $result.find('li:eq(-1)'),
                        data.Page,
                        data.QueryDatas,
                        data.QueryLimitNumber,
                        function(page, size) {
                            getProductList (page, size, keyword);
                        }
                    );
                }
            });
        }

        // 初始化页面
        (function () {
            $dataList.find('.label-set').each(function() {
                var $this = $(this);
                    $state = $this.find('.state'),
                    $code = $this.find('.code');
                $state.addClass('label-' + common.order.setState($state.text()));
                $code.addClass('label-' + common.order.warehouseCode($code.text()));
            });

            // ajax分页
            <!-- BEGIN 分页脚本 ATTRIB= -->
            common.setPaging(
                $dataList.find('tfoot td'),
                {当前页},
                {总条数},
                {每页条数},
                function(page, size) {
                    getStockList (page, size);
                }
            );
            <!-- END 分页脚本 -->
        }());
    </script>
</body>
</html>
