{页面属性}{/页面属性}
<body>
    {页顶导航}{/页顶导航}
    
    <article class="container-fluid">   
        <div class="row">
            <div class="col-sm-6">
                <div id="panel-product-list" class="panel panel-default">
                    <div class="panel-heading">
                        产品    
                        <button class="btn btn-success btn-add-data btn-xs pull-right" type="button" data-toggle="modal" data-target="#add-data"><span class="glyphicon glyphicon-plus-sign"></span> 创建商品</button>
                    </div>
                    <div class="panel-body">
                        <form class="form-inline" action="javascript:;">
                            <div class="input-group input-group-sm">
                                <input type="text" class="form-control" placeholder="中文名称、SKU">
                                <div class="input-group-btn">
                                    <button class="btn btn-default" type="submit"><span class="glyphicon glyphicon-search"></span> 搜索</button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <table class="table table-striped table-bordered table-hover table-condensed">
                        <colgroup>
                            <col width="80%">
                            <col>
                        </colgroup>
                        <thead>
                            <tr>
                                <th><label id="select-all"><input type="checkbox">名称</label></th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                        <tfoot><tr><td colspan="2"></td></tr></tfoot>
                    </table>
                </div>
            </div>

            <div class="col-sm-6">
                <div id="panel-goods-list" class="panel panel-default">
                    <div class="panel-heading">商品</div>
                    <div class="panel-body">
                        <form class="form-inline pull-left" action="javascript:;">
                            <div class="input-group input-group-sm">
                                <input type="text" class="form-control" placeholder="中文名称、SKU">
                                <span class="input-group-btn">
                                    <button class="btn btn-default" type="submit"><span class="glyphicon glyphicon-search"></span> 搜索</button>
                                </span>
                            </div>
                        </form>

                        <div class="btn-group pull-right">
                            <div class="btn-group">
                                <!-- BEGIN 所在团队 ATTRIB= -->
                                <button id="goods-filter" data-default="{TeamID}" class="btn btn-success btn-sm dropdown-toggle" type="button" data-toggle="dropdown" {Admin}><span class="title">查看所有商品</span> <span class="caret"></span></button>
                                <!-- END 所在团队 -->
                                <ul class="dropdown-menu dropdown-menu-right">
                                    <li data-id="0"><a href="javascript:;">查看所有商品</a></li>
                                    <li data-id="-1"><a href="javascript:;">查看待分配商品</a></li>
                                    <!-- BEGIN 销售团队 ATTRIB= -->
                                    <li data-id="{DataID}"><a href="javascript:;">查看{Name}商品</a></li>
                                    <!-- END 销售团队 -->
                                </ul>
                            </div>
                        </div>

                    </div>
                    <table class="table table-striped table-bordered table-hover table-condensed">
                        <colgroup>
                            <col width="80%">
                        </colgroup>
                        <thead>
                            <tr>
                                <th>名称</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                        <tfoot><tr><td colspan="2"></td></tr></tfoot>
                    </table>
                </div>
            </div>
        </div>
    </article>

    <!-- 添加与编辑-->
    <div id="add-data" class="modal fade" tabIndex="-1">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <form class="form-horizontal form-save" action="javascript:;">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                        <h4 class="modal-title">刊登SKU设置</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group form-group-sm">
                            <label class="col-sm-2 control-label" for="Name" title="用于Post Item时使用的 Listing Sku 的最后一段， 例如 EP_W06_01_01_XXX 中的XXX">商品SKU</label>
                            <div class="col-sm-3">
                                <input class="form-control" type="text" id="Name" placeholder="商品SKU">
                            </div>
                            <label class="col-sm-2 control-label" for="Remark">商品说明</label>
                            <div class="col-sm-3">
                                <textarea id="Remark" rows="1" class="form-control"></textarea>
                            </div>
                        </div>
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#tab-cp" data-toggle="tab">CP(本地仓)</a></li>
                            <li><a href="#tab-ep" data-toggle="tab">EP(英国仓)</a></li>
                            <li><a href="#tab-dp" data-toggle="tab">DP(德国仓)</a></li>
                            <li><a href="#tab-ap" data-toggle="tab">AP(澳洲仓)</a></li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane fade in active" id="tab-cp">
                                <div class="form-group form-group-sm">
                                    <div class="col-sm-12">
                                        <p class="form-control-static text-danger">该商品包含以下产品：CP</p>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="tab-ep">
                                <div class="form-group form-group-sm">
                                    <div class="col-sm-12">
                                        <p class="form-control-static text-danger">该商品包含以下产品：EP</p>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="tab-dp">
                                <div class="form-group form-group-sm">
                                    <div class="col-sm-12">
                                        <p class="form-control-static text-danger">该商品包含以下产品：DP</p>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="tab-ap">
                                <div class="form-group form-group-sm">
                                    <div class="col-sm-12">
                                        <p class="form-control-static text-danger">该商品包含以下产品：AP</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="product-group maxH300"></div>

                        <h5>产品查询：</h5>
                        <hr class="mg-t-5 mg-b-10">
                        <div class="form-group">
                            <div class="col-sm-4">
                                <div class="input-group input-group-sm">
                                    <input class="form-control input-search" type="text" class="form-control" placeholder="中文名、SKU">
                                    <span class="input-group-btn">
                                        <button type="button" class="btn btn-default btn-search"><span class="glyphicon glyphicon-search"></span> 搜索</button>
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="product-search-result list-group maxH300"></div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                        <button type="submit" class="btn btn-primary">提交</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- 产品列表-->
    <template id="temp-product-list">
        {{#DataList}}
        <tr>
            <td><label class="checkbox-inline"><input data-id="{{DataID}}" data-sku="{{FullSKU}}" type="checkbox"><input class="input-none copy-txt" type="text" value="{{FullName}}" readonly> <input class="input-none copy-txt" value="{{FullSKU}}" readonly></label></td>
            <td>
                <a title="查看" href="javascript:;"><span class="glyphicon glyphicon-eye-open text-success"></span></a>
            </td>
        </tr>
        {{/DataList}}
    </template>

    <!-- 商品列表-->
    <template id="temp-goods-list">
        {{#DataList}}
        <tr data-id="{{DataID}}">
            <td>
                <div class="row">
                    <div class="col-sm-4">
                        <label class="checkbox-inline"><input data-id="{{DataID}}" type="checkbox">
                            {{ListingSku}}
                            {{^ProductID}}<span class="label label-danger">NONE</span>{{/ProductID}}
                        </label>
                    </div>
                    <div class="col-sm-8 text-right">
                        {{Remark}}
                    </div>
                </div>
            </td>
            <td>
                <a class="btn-edit" title="编辑" href="javascript:;"><span class="glyphicon glyphicon-pencil"></span></a>
                &nbsp;&nbsp;
                <a title="查看" href="javascript:;"><span class="glyphicon glyphicon-eye-open text-success"></span></a>
                &nbsp;&nbsp;
                <a class="btn-remove" title="下架" href="javascript:;"><span class="glyphicon glyphicon-ban-circle text-danger"></span></a>
            </td>
        </tr>
        {{/DataList}}
    </template>

    <!-- 新增产品到商品-->
    <template id="temp-add-product">
        <div>
            <label class="col-sm-7 control-label">
                <a class="btn-remove" title="移除" href="javascript:;"><span class="glyphicon glyphicon-remove text-danger"></span></a> <span class="name"></span>
            </label>
            <div class="col-sm-3">
                <input class="number form-control" type="text" placeholder="数量" value="1">
            </div>
        </div>
    </template>

    <!-- 编辑商品-->
    <template id="temp-edit-goods">
        {{#DataList}}
        <div data-id="{{DataID}}" class="{{DataID}} form-group form-group-sm mg-b-5">
            <label class="col-sm-7 control-label">
                <a class="btn-remove" title="移除" href="javascript:;"><span class="glyphicon glyphicon-remove text-danger"></span></a> <span class="name">{{Name}} [{{Sku}}]</span>
            </label>
            <div class="col-sm-3">
                <input class="number form-control" type="text" placeholder="数量" value="{{Quantity}}">
            </div>
        </div>
        {{/DataList}}
    </template>

    <!-- 创建商品的产品搜索-->
    <template id="temp-search-product">
        {{#DataList}}
        <a data-id="{{DataID}}" data-sku={{FullSKU}} class="list-group-item pd-5">{{FullName}} [{{FullSKU}}]</a>
        {{/DataList}}
    </template>

    {页面底部}{/页面底部}

    <script src="/Resource/js/mustache.js"></script>

    <script>
        (function () {
            var tempProductList = $('#temp-product-list').html(),
                $panelProductList = $('#panel-product-list'),
                tempGoodsList = $('#temp-goods-list').html(),
                $panelGoodsList = $('#panel-goods-list'),
                tempEditGoods = $('#temp-edit-goods').html(),
                $goodsFilter = $panelGoodsList.find('#goods-filter');

            $panelProductList.find('tbody').on('click', 'tr td:first-child .copy-txt', function() {
                var $this = $(this);
                $this.select();
                $this.focus();
                return true;
            });

            // 产品
            function initProductList (page, size, keyword) {
                common.ajax({
                    title: '初始化产品',
                    URL: '/Product/API/?Do=SkuSearch&Page=' + page + '&QueryLimitNumber=' + size + '&KeyWord=' + keyword,
                    good: function (data) {
                        $panelProductList.find('tbody').html(Mustache.render(tempProductList, data));
                        ajaxShowPage({
                            panel: $panelProductList.find('tfoot td'),
                            active: page,
                            count: data.QueryDatas,
                            size: data.QueryLimitNumber,
                            cb: function(page, size) {
                                initProductList (page, size, keyword);
                            }
                        });
                    }
                });
            }

            // 商品
            function initGoodsList(page, size, keyword) {
                common.ajax({
                    title: '初始化商品',
                    URL: '/Product/Product.aspx?Do=OmsSku&Page=' + page + '&QueryLimitNumber=' + size + '&KeyWord=' + keyword + '&TeamID=' + $goodsFilter.next().find('.active').data('id'),
                    good: function (data) {
                        $panelGoodsList.find('tbody').html(Mustache.render(tempGoodsList, data));
                        ajaxShowPage({
                            panel: $panelGoodsList.find('tfoot td'),
                            active: page,
                            count: data.QueryDatas,
                            size: data.QueryLimitNumber,
                            cb: function(page, size) {
                                initGoodsList (page, size, keyword);
                            }
                        });
                    }
                });
            }

            /**
             * 设置AJAX分页
             */
            function ajaxShowPage (json) {
                common.setPaging(json.panel, json.active, json.count, json.size, json.cb);
            };

            // 初始化
            initProductList(1, 20, '');
            initGoodsList(1, 20, '');

            var $productForm = $panelProductList.find('form'),
                $productInput = $productForm.find('input'),
                $goodsForm = $panelGoodsList.find('form'),
                $goodsInput = $goodsForm.find('input');

            // 产品与商品数据列表
            $productForm.on('submit', function () {
                initProductList(1, 20, $productInput.val());
            });
            $goodsForm.on('submit', function () {
                initGoodsList(1, 20, $goodsInput.val());
            });

            // 创建商品
            var $addData = $('#add-data'),
                $productGroup = $addData.find('.product-group'),
                tempAddProduct = $('#temp-add-product').html(),
                tempSearchProduct = $('#temp-search-product').html(),
                $inputSearch = $addData.find('.input-search'),
                $btnSearch = $addData.find('.btn-search'),
                $productSearchResult = $addData.find('.product-search-result');

            // 点击创建，初始化列表
            $panelProductList.find('.btn-add-data').on('click', function () {
                $addData.removeData('id');
                $productGroup.empty();
                $panelProductList.find('tbody input[type="checkbox"]:checked').each(function () {
                    var $this = $(this),
                        $addProduct = $(tempAddProduct);

                    $addProduct.data('id', $this.data('id'));
                    $addProduct.attr('class', $this.data('id') + ' form-group form-group-sm mg-b-5');
                    $addProduct.find('.name').text($this.closest('td').text());
                    $addProduct.find('.sku').val($this.data('sku'));
                    $productGroup.append($addProduct);
                });
            });
            // 搜索产品
            $btnSearch.on('click', function () {
                funSearchProduct();
            });
            $inputSearch.on('keydown', function(e) {
                if (e.keyCode === 13) {
                    funSearchProduct();
                    return false;
                }
            });
            function funSearchProduct() {
                common.ajax({
                    title: '搜索产品',
                    URL: '/Product/API/?Do=SkuSearch&KeyWord=' + $inputSearch.val(),
                    good: function (data) {
                        $productSearchResult.html(Mustache.render(tempSearchProduct, data));
                    }
                });
            }
            // 移除产品
            $productGroup.on('click', '.btn-remove', function () {
                var $formGroup = $(this).closest('.form-group');
                common.ajax({
                    title: '移除产品',
                    URL: '/Product/Product.aspx?Do=OmsSkuCancel',
                    type: 'post',
                    data: {
                        SkuID: $formGroup.data('id'),
                        DataID: $addData.data('id')
                    },
                    good: function(data) {
                        common.alert({
                            type: 'success',
                            title: '“移除产品”操作：',
                            msg: data.Message || '成功！'
                        });
                    }
                })
                $formGroup.slideUp(function () {
                    $formGroup.remove();
                });
            });
            // 点击产品
            $productSearchResult.on('click', 'a', function () {
                var $this = $(this),
                    id = $this.data('id'),
                    $exist = $productGroup.find('.' + id),
                    number = +$exist.find('.number').val(),
                    $addProduct;

                // 如果已经存在
                if ($exist.length) {
                    $exist.find('.number').val(number ? ++number : 1);

                } else {
                    $addProduct = $(tempAddProduct);
                    $addProduct.data('id', $this.data('id'));
                    $addProduct.attr('class', $this.data('id') + ' form-group form-group-sm mg-b-5');
                    $addProduct.find('.name').text($this.text());
                    $addProduct.find('.sku').val($this.data('sku'));
                    $productGroup.append($addProduct);
                    $productGroup.animate({scrollTop: $productGroup.scrollTop() + $productGroup.height()});
                }
            });
            // 提交创建表单
            $addData.find('.form-save').on('submit', function () {
                // 组装数据
                var product = [];
                $productGroup.find('.form-group').each(function () {
                    var $this = $(this),
                        SKUID = $this.data('id'),
                        Quantity = +$this.find('.number').val() || 1;
                    product.push({
                        SKUID: SKUID,
                        Quantity: Quantity
                    });
                });

                common.ajax({
                    title: '创建商品',
                    URL: '/Product/Product.aspx?Do=SaveOmsSku',
                    type: 'post',
                    data: JSON.stringify({
                        DataID: $addData.data('id'),
                        Name: $addData.find('#Name').val(),
                        Remark: $addData.find('#Remark').val(),
                        Product: product
                    }),
                    good: function (data) {
                        $addData.modal('hide');
                        common.alert({
                            type: 'success',
                            title: '“创建商品”操作：',
                            msg: data.Message || '成功！'
                        });
                    }
                });
            });

            // 商品编辑
            $panelGoodsList.on('click', '.btn-edit', function () {
                var id = $(this).closest('tr').data('id');
                common.ajax({
                    title: '编辑商品',
                    URL: '/Product/Product.aspx?Do=GetOmsSku&DataID=' + id,
                    good: function (data) {
                        $productGroup.html(Mustache.render(tempEditGoods, data));
                        $addData.find('#Name').val(data.ListingSku);
                        $addData.find('#Remark').val(data.Remark);
                        $addData.data('id', id);
                        $addData.modal('show');
                     }
                });
            });

            // 商品下架
            $panelGoodsList.on('click', '.btn-remove', function () {
                var $tr = $(this).closest('tr');
                if (confirm('是否确定商品下架？')) {
                    common.ajax({
                        title: '商品下架',
                        URL: '/Product/Product.aspx?Do=OmsSkuDelete',
                        data: {
                            DataID: $tr.data('id')
                        },
                        good: function (data) {
                            $tr.remove();
                            common.alert({
                                type: 'success',
                                title: '“商品下架”操作：',
                                msg: data.Message || '成功！'
                            });
                         }
                    });
                }
            });

            // 初始化商品过滤
            $goodsFilter.find('.title').text($goodsFilter.next().find('li[data-id="' + $goodsFilter.data('default') + '"]').addClass('active').text());

            // 商品过滤
            $goodsFilter.next().find('li').on('click', function() {
                $goodsFilter.next().find('li').removeClass('active');
                $goodsFilter.find('.title').text($(this).addClass('active').text());
                initGoodsList(1, 20, '');
            });
        }());
    </script>
</body>
</html>
