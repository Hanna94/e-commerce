{页面属性}{/页面属性}
<body>
    {页顶导航}{/页顶导航}
    
    <!-- 内容-->
    <div id="pruchase-edit" class="maxW1280 divCenter">
        <form action="javascript:;" class="form-horizontal">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">采购单的编辑</h3>
                </div>
                <div class="panel-body">
                    <!-- 供应商查询 -->
                    <div class="form-group form-group-sm">
                        <label class="col-xs-12 col-sm-2 control-label">选择供应商</label>
                        <div class="col-xs-12 col-sm-3">
                            <div class="input-group">
                                <input class="form-control" type="text" data-sid="" id="SupplierName" readonly="readonly" />
                                <span class="input-group-btn">
                                    <a href="javescriot:;" target="_blank" class="btn btn-default btn-sm" type="button">查看</a>
                                </span>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4">
                            <div class="input-group input-group-sm">
                                <input type="text" class="form-control" id="Supplier-input" placeholder="供应商ID、名称">
                                <span class="input-group-btn">
                                    <button type="button" class="btn btn-default Supplier-select"><span class="glyphicon glyphicon-search"></span> 搜索</button>
                                </span>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-3 remind">
                            <span class="text-danger hidden">此供应商信息不完整，请补充后提交！</span>
                        </div>
                    </div>
                    
                    <!-- 供应商列表 -->
                    <div class="Supplier-group maxH300"></div>
                    
                    <hr class="mg-t-5 mg-b-10">
                     <!-- 金额 -->
                    <div id="payAmount" class="col-sm-12">
                        <table class="table table-striped table-bordered table-hover table-condensed">
                            <tbody>
                                <tr>
                                    <td class="text-def"></td>
                                    <td class="text-success"></td>
                                    <td class="text-danger"></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <!-- 申请支付 -->
                    <div id="payApply" class="col-sm-12">
                         <hr class="mg-t-5 mg-b-10">
                         <div class="row">
                             <div class="col-sm-8">
                                 <table class="table table-striped table-bordered table-hover table-condensed">
                                    <colgroup>
                                        <col>
                                        <col>
                                        <col width="300px">
                                        <col>
                                        <col>
                                        <col>
                                    </colgroup>
                                    <thead>
                                        <th>单号</th>
                                        <th>申请人</th>
                                        <th>请款说明</th>
                                        <th>金额</th>
                                        <th>状态</th>
                                        <th>时间</th>
                                    </thead>
                                    <tbody></tbody>   
                                 </table>
                             </div>
                             <div class="col-sm-4">
                                 <div class="form-group form-group-sm">
                                     <label for="Amount" class="col-sm-2 control-label">金额</label>
                                     <div class="col-sm-10">
                                         <div class="input-group">
                                             <input id="Amount" type="text" class="form-control" />
                                             <span class="input-group-btn">
                                                 <button id="AmountBtn" class="btn btn-default btn-sm" type="button">申请支付</button>
                                             </span>
                                         </div>
                                     </div>
                                 </div>
                             </div>
                         </div>
                    </div>

                    <!-- 折扣金额和运费金额 -->
                    <div class="col-sm-12">
                        <hr class="mg-t-5 mg-b-10">
                        <div class="form-group form-group-sm">
                            <label for="AmountSaved" class="col-sm-1 control-label">折扣金额</label>
                            <div class="col-sm-2">
                                <input id="AmountSaved" type="text" class="form-control" />
                            </div>
                            <label for="ShipCost" class="col-sm-1 control-label">运费金额</label>
                            <div class="col-sm-2">
                                <input id="ShipCost" type="text" class="form-control" />
                            </div>
                        </div>
                    </div>
                    
                    <!-- 代采购产品列表 -->
                    <div class="col-sm-6">
                        <div class="form-group form-group-sm">
                            <label class="col-sm-2 control-label">待采购产品</label>
                            <div class="product-group col-sm-10 maxH300">
                                <table class="table table-striped table-bordered table-hover table-condensed">
                                    <colgroup>
                                        <col>
                                        <col>
                                        <col width="60px">
                                        <col width="80px">
                                        <col width="40px">
                                    </colgroup>
                                    <thead>
                                        <th>SKU</th>
                                        <th>产品名</th>
                                        <th>数量</th>
                                        <th>价格</th>
                                        <th>操作</th>
                                    </thead>
                                    <tbody></tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <div class="col-sm-6">
                                <div class="input-group input-group-sm">
                                    <input class="form-control input-search" type="text" class="form-control" placeholder="中文名、SKU">
                                    <span class="input-group-btn">
                                        <input type="button" class="btn btn-default btn-search" value="搜索" />
                                        <input type="button" class="btn btn-default btn-empty" value="清空列表" />
                                    </span>
                                </div>
                            </div>
                            <p class="form-control-static p-search-res"></p>
                        </div>
                        <div class="product-search-result list-group col-sm-12 maxH400"></div>
                    </div>

                    <!-- 快递信息 -->
                    <div id="ShippingCarrier" class="col-sm-12">
                        <hr class="mg-t-5 mg-b-10">
                        <div class="row">
                            <div class="col-sm-6">
                                <table class="table table-striped table-bordered table-hover table-condensed">
                                    <thead>
                                        <th>单号</th>
                                        <th>备注</th>
                                        <th>时间</th>
                                    </thead>
                                    <tbody></tbody>
                                </table>
                            </div>
                            <div class="col-sm-2">
                                <div class="form-group">
                                    <select class="form-control expSel"></select>
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <input class="form-control order" type="text" placeholder="快递单号"/></input>
                                <input class="form-control remark" type="text" placeholder="备注"/></input>
                            </div>
                            <div class="col-sm-1">
                                <button class="btn btn-default btn-sm expBtn" type="button" >提交</button>
                            </div>
                        </div>
                    </div>
                    
                    
                    <!-- 备注 -->
                    <div class="col-sm-12">
                        <hr class="mg-t-5 mg-b-10">
                        <div id="purchaseRemark" class="form-group">
                            <div id="replaceForm" class="col-sm-12">
                                <div class="input-group input-group-sm">
                                    <textarea rows="1" name="Remark" class="form-control"></textarea>
                                    <span class="input-group-btn">
                                        <input type="submit" class="btn btn-default" value="提交" />
                                        <input type="reset" class="btn btn-default hidden" value="取消" />
                                    </span>
                                </div>
                                <span class="text-danger"></span>
                            </div>
                            <div class="maxH300 col-sm-12 mg-t-10">
                                <table class="table table-striped table-condensed">
                                    <tbody></tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel-footer clearfix">
                    <button class="btn btn-default pull-right" type="button">提交</button>
                </div>
            </div>
        </form>
    </div>

    <!-- 供应商列表模板 -->
    <template id="temp-supplier">
        {{#DataList}}
        <a data-id="{{DataID}}" data-integrality="{{integrality}}" class="list-group-item pd-5">{{Name}}</a>
        {{/DataList}}
    </template>

    <!-- 产品列表模板 -->
    <template id="temp-product">
        {{#DataList}}
        <a data-id="{{DataID}}" data-sku="{{FullSKU}}" class="list-group-item pd-5">[{{Status}}] <span class="pname">{{Name}}</span> <span class="psku">[{{FullSKU}}]</span></a>
        {{/DataList}}
    </template>

    <!-- 申请支付列表 -->
    <template id="temp-PayApply">
        {{#Finance}}
        <tr>
            <td>{{OrderID}}</td>
            <td>{{TrueName}}</td>
            <td>{{Title}}</td>
            <td>{{Amount}}</td>
            <td>{{Status}}</td>
            <td>{{Date}}</td>
        </tr>
        {{/Finance}}
    </template>

    <!-- 初始化产品模板 初始状态-->
    <template id="temp-init-product">
        {{#Product}}
        <tr class="{{SkuID}}" data-sid="{{SkuID}}">
            <td><span class="sku"></span>{{ProductSKU}}</td>
            <td><span class="name">{{ProductName}}</span></td>
            <td><input class="number form-control input-xs" type="text" placeholder="数量" value="{{Quantity}}"></td>
            <td><input class="price form-control" type="text" placeholder="价格" value="{{Price}}"></td>
            <td><span data-sta="edit" class="btn-remove glyphicon glyphicon-remove text-danger poi"></span></td>
        </tr>
        {{/Product}}
    </template>

    <!-- 初始化产品模板 非初始状态-->
    <template id="temp-notinit-product">
        {{#Product}}
        <tr class="{{SkuID}}" data-sid="{{SkuID}}">
            <td><span class="sku"></span>{{ProductSKU}}</td>
            <td><span class="name">{{ProductName}}</span></td>
            <td>{{Quantity}}</td>
            <td>{{Price}}</td>
        </tr>
        {{/Product}}
    </template>

    <!-- 新增产品到商品-->
    <template id="temp-add-product">
        <tr>
            <td><span class="sku"></span></td>
            <td><span class="name"></span></td>
            <td><input class="number form-control input-xs" type="text" placeholder="数量" value="1"></td>
            <td><input class="price form-control" type="text" placeholder="价格" ></td>
            <td><span data-sta="add" class="btn-remove glyphicon glyphicon-remove text-danger poi"></span></td>
        </tr>
    </template>

    <!-- 编辑商品-->
    <template id="temp-edit-goods">
        {{#DataList}}
        <div data-id="{{DataID}}" class="{{DataID}} form-group form-group-sm mg-b-5">
            <label class="col-sm-7 control-label">
                <a class="btn-remove" title="移除" data-sta="edit" href="javascript:;"><span class="glyphicon glyphicon-remove text-danger"></span></a> <span class="name">{{Name}} [{{Sku}}]</span>
            </label>
            <div class="col-sm-3">
                <input class="number form-control" type="text" placeholder="数量" value="{{Quantity}}">
            </div>
        </div>
        {{/DataList}}
    </template>

    <!-- 备注模板-->
    <template id="temp-remark">
        {{#MessageData}}
        <tr>
            <td>
                <input type="hidden" id="UID" name="UID" value="{{UID}}" />
                <input type="hidden" id="DataID" name="DataID" value="{{DataID}}" />
                <span>{{Content}}</span>&nbsp;&nbsp;
                <span style="font-size: 14px;color: #929292;">By：{{TrueName}}</span>&nbsp;&nbsp;<i style="font-size: 14px;color: #929292;">{{Date}}</i>
                <div id="btn-ead" class="poi" style="float: right;">
                    <span class="glyphicon glyphicon-pencil"></span>&nbsp;&nbsp;
                    <span class="glyphicon glyphicon-remove"></span>
                </div>
            </td>
        </tr>
        {{/MessageData}}
    </template>

    {页面底部}{/页面底部}

    <script src="/Resource/js/mustache.js"></script>

    <script>
        (function() {
            'use strict';

            var op = common.URL.parse(),
                $PE = $('#pruchase-edit'),
                $supName = $('#SupplierName'), //供应商存数据的只读文本款
                $supInput = $('#Supplier-input'), //供应商搜索栏输入框
                $supBtn = $('.Supplier-select'), //供应商搜索按钮
                $supList = $('.Supplier-group'), //供应商列表
                tmSupplier = $('#temp-supplier').html(), //供应商列表模板
                $payAmount = $('#payAmount'), //金额模块
                $AmountSaved = $('#AmountSaved'), //折扣金额
                $ShipCost = $('#ShipCost'), //运费金额
                $proSelRes = $('.product-search-result'),
                tmProduct = $('#temp-product').html(),
                tmAddPro = $('#temp-add-product').html(),
                tmEditGoo = $('#temp-edit-goods').html(),
                $inputSearch = $PE.find('.input-search'),
                $payApply = $('#payApply'), //申请支付的整个DIV
                $Amount = $('#Amount'), //申请金额的输入框
                $AmountBtn = $('#AmountBtn'), //申请金额按钮
                tmPayApply = $('#temp-PayApply').html(), //申请资金列表的模板
                $btnSearch = $PE.find('.btn-search'), //产品搜索按钮
                $btnEmpty = $PE.find('.btn-empty'), //产品列表清空按钮
                $pResult = $('.p-search-res'), //搜索到的产品显示
                $productSearchResult = $PE.find('.product-search-result'),
                $productGroup = $PE.find('.product-group'), //已选择的产品表格
                tmInitProduct = $('#temp-init-product').html(), //编辑采购单时初始化产品模板
                $purchaseRemark = $('#purchaseRemark'), //包裹整个备注的div
                $remarkForm = $('#replaceForm'), //备注的Form标签替代
                $remarkTextarea = $remarkForm.find('textarea'), //备注的输入框
                tmRemark = $('#temp-remark').html(), //备注输出模板
                $resetBtn = $remarkForm.find('input[type="reset"]'), //重置按钮
                Int_UID = <!-- BEGIN 当前用户ID ATTRIB= --><!-- END 当前用户ID -->, //当前登录用户的UID
                uploadURL = '/Purchase/API/?Do=MessageSave', //保存和更新备注的接口
                getdataURL = '/Purchase/API/?Do=MessageQuery&FID=' + op.DataID, //获取备注的接口
                deleteURL = '/Purchase/API/?Do=MessageDelete', //删除备注的接口
                $remarkList = $purchaseRemark.find('tbody'); //初始化用备注输出表格

            // 如果采购单列表为进入编辑，则初始化显示数据
            if (op.DataID) {
                // 获取采购单数据
                $.ajax({
                    url: '/Purchase/API/?Do=Query',
                    type: 'get',
                    dataType: 'json',
                    data: {
                        DataID: op.DataID
                    },
                    success: function(d){
                        // 数据处理,去除金额里面的逗号
                        d.Order.AmountSaved = d.Order.AmountSaved.replace(',', '');
                        d.Order.ShipCost = d.Order.ShipCost.replace(',', '');
                        for (var i in d.Product) {
                            d.Product[i].Price = d.Product[i].Price.replace(',', '');
                        }

                        //存储dataID和OrderID
                        $('body').append('<input id="dataSave" type="hidden" data-DataID="' + d.DataID + '" data-OrderID="' + d.Order.OrderID + '" >');

                        // 供应商
                        $supName.val(d.Supplier.Name);
                        $supName.attr('data-sid', d.Supplier.DataID);
                        console.log(d.Supplier.Contacts);
                        if (d.Supplier.Contacts == "B2C代付") {
                            checkPaymentInfo(false, d.Supplier.DataID);
                        } else if (d.Supplier.BankName == '' || d.Supplier.AccountName == ''
                            || d.Supplier.AccountNumber == '') {
                            checkPaymentInfo(true, d.Supplier.DataID);
                        } else {
                            checkPaymentInfo(false, d.Supplier.DataID);
                        }

                        // 申请支付
                        $payApply.find('tbody').html(Mustache.render(tmPayApply, d));

                        //总金额、已支付、待支付
                        $payAmount.find('.text-def').text('总金额：' + d.Order.Amount);
                        $payAmount.find('.text-success').text('已支付：');
                        $payAmount.find('.text-danger').text('待支付：');

                        // 快递
                        // SCU = ShippingCarrierUsed
                        var num, tempHtml = '',
                            SCUArray = d.ShippingCarrierUsed.split(',');
                        for (var num in SCUArray) {
                            tempHtml += '<option value=' + SCUArray[num] + '>' + SCUArray[num] + '</option>'
                        }
                        $('.expSel').html(tempHtml);

                        $('#ShippingCarrier tbody').html(Mustache.render(
                            '{{#Waybill}}<tr>' +
                            '<td>{{ShipmentTrackingNumber}}</td>' +
                            '<td>{{Remark}}</td><td>{{Date}}</td></tr>{{/Waybill}}', d));

                        // 产品
                        if(d.Order.Status != '初始') {
                            $productGroup.find('thead tr:eq(0) th:last').remove(); //删除操作一列
                            $btnSearch.closest('div.col-sm-6').remove(); //删除搜索按钮
                            $AmountSaved.attr('readonly', 'readonly');  //折扣金额改为只读
                            $ShipCost.attr('readonly', 'readonly'); //运费金额改为只读
                            $productGroup.find('tbody')
                            .html(Mustache.render($('#temp-notinit-product').html(), d));
                        } else {
                            $productGroup.find('tbody').html(Mustache.render(tmInitProduct, d));
                        }

                        // 折扣和运费金额
                        $AmountSaved.val(d.Order.AmountSaved);
                        $ShipCost.val(d.Order.ShipCost);
                    }
                });
                
            }else{
                //如果为新建采购单，则备注只保留一个输入框
                $remarkForm.empty().append('<textarea rows="3" name="Remark" class="form-control"></textarea>');
                $remarkTextarea = $remarkForm.find('textarea');

                //如果为新建采购单，则删除申请支付的模块，因为新建采购单时没有采购单ID
                $payApply.remove();
                //如果为新建采购单，则删除快递模块
                $('#ShippingCarrier').remove();
            }

            //支付性信息完整性判断
            function checkPaymentInfo (judge, dataid) {
                if (judge) {
                    $('.remind span').removeClass('hidden');
                    $AmountBtn.attr({disabled: 'disabled', title: '此供应商信息不完整，请补充后提交！'});
                } else {
                    $('.remind span').addClass('hidden');
                    $AmountBtn.removeAttr('disabled');
                }
                $supName.next().find('a')
                .attr('href', '/Purchase/Supplier.aspx?Do=Edit&DataID=' + dataid);
            }

            // 获取供应商数据方法
            function getSup(di, kw){
                di ? di = di : di = '';
                kw ? kw = kw : kw = '';
                $.ajax({
                    url: '/Purchase/API/?Do=SupplierQuery&DataID=' + di + '&KeyWord=' + kw,
                    type: 'get',
                    dataType: 'json',
                    success: function(data){
                        if (data.DataList.length === 0) {
                            $supList.html('<p>无搜索结果！</p>');
                        }else{
                            data.DataList.forEach(function(val) {
                                val.integrality = val.Contacts != "B2C代付" && (val.BankName == '' ||
                                val.AccountName == '' || val.AccountNumber == '') ? true : false;
                            });
                            $supList.html(Mustache.render(tmSupplier, data));
                        }
                    }
                });
            }

            // 搜索供应商
            $supBtn.on('click', function(){
                getSup('', $supInput.val());
            });

            // 点击选择供应商
            $supList.on('click', 'a', function(){
                var ts = $(this);
                $supName.attr('data-sid', ts.data('id')).val(ts.text());
                // 点选完供应商清空列表和输入框
                if (ts.data('integrality') == true) {
                    checkPaymentInfo(true, ts.data('id'));
                } else {
                    checkPaymentInfo(false, ts.data('id'));
                }
                $supList.empty();
                $supInput.val('');
            });

            // 搜索产品
            $btnSearch.on('click', function(){
                selectProduct($inputSearch.val());
            });

            // 清空产品列表
            $btnEmpty.on('click', function(){
                $proSelRes.empty();
                $pResult.empty();
                $inputSearch.val('');
            });

            // 获取产品数据方法
            function selectProduct(kw){
                kw ? kw = kw : kw = '';
                $.ajax({
                    url: '/Product/Product.aspx?Do=FullSku&KeyWord=' + kw + '&QueryLimitNumber=50',
                    type: 'get',
                    dataType: 'json',
                    success: function(data){
                        var d = data;
                        if (d.DataList.length === 0) {
                            $proSelRes.html('<p>并没有这种产品！</p>')
                        }else{
                            $proSelRes.html(Mustache.render(tmProduct, d));
                            if (kw) {
                                $pResult.text('搜索到的产品数：' + d.Quantity);
                            }else{
                                $pResult.text('搜索到的产品数：50');
                            }
                        }
                    }
                });
            }

            // 点击添加产品
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
                    $addProduct = $(tmAddPro);
                    $addProduct.attr('class', $this.data('id')).attr('data-sid', $this.data('id'));
                    $addProduct.find('.name').text($this.find('.pname').text());
                    $addProduct.find('.sku').text($this.data('sku'));
                    $productGroup.find('tbody').append($addProduct);
                    $productGroup.animate({scrollTop: $productGroup.scrollTop() + $productGroup.height()});
                }
            });

            // 移除产品
            $productGroup.on('click', '.btn-remove', function () {
                var $formGroup = $(this).closest('tr');
                console.log($(this).data('sta'));
                if ($(this).data('sta') !== 'add') {
                    common.ajax({
                        title: '移除产品',
                        URL: '/Purchase/API/?Do=ProductDelete',
                        type: 'post',
                        data: {
                            SkuID: $formGroup.data('sid'),
                            FID: op.DataID
                        },
                        good: function(data) {
                            common.alert({
                                type: 'success',
                                title: '“移除产品”操作：',
                                msg: data.Message || '成功！'
                            });
                        }
                    });
                }
                
                $formGroup.slideUp(function () {
                    $formGroup.remove();
                });
            });

            // 申请支付
            $AmountBtn.on('click', function(){
                var type = 'Purchase',
                    title = '关于【' + $supName.val() + '】的【' + $productGroup.find('tbody tr:eq(0) td:eq(1)').text() + '】等的付款申请';
                $.ajax({
                    url: '/Finance/API/?Do=Create',
                    type: 'post',
                    dataType: 'json',
                    data: {
                        ReferenceID: $('#dataSave').attr('data-OrderID'),
                        Type: 'Purchase',
                        Title: title,
                        Amount: $Amount.val()
                    },
                    success: function(data){
                        if (data.Ack) {
                            common.alert({
                                type: 'success',
                                title: '申请支付操作：',
                                msg: '成功！',
                                cb: function(){
                                    location.reload();
                                }
                            });
                        }else {
                            common.alert({
                                title: '申请支付操作：',
                                msg: data.Message
                            });
                        }
                        
                    }
                });
            });


            // 提交创建表单
            $PE.find('.panel-footer button').on('click', function () {
                // 组装数据
                var productJson = {};
                    productJson.Product = [];
                $productGroup.find('tbody tr').each(function(i, n){
                    var ts = $(this),
                        temp = {"SkuID": ts.data('sid'), "Quantity": parseFloat(ts.find('.number').val()), "Price": parseFloat(ts.find('.price').val())};
                    productJson.Product.push(temp);
                });

                // 提交数据
                $.ajax({
                    url: '/Purchase/API/?Do=Save',
                    type: 'post',
                    dataType: 'json',
                    data: {
                        DataID: op.DataID || null,
                        SupplierID: $supName.data('sid'),
                        AmountSaved: $AmountSaved.val(),
                        ShipCost: $ShipCost.val(),
                        Product: JSON.stringify(productJson)
                    },
                    success: function(data){
                        $.ajax({
                            url: '/Purchase/API/?Do=MessageSave',
                            type: 'post',
                            data: {
                                DataID: op.DataID || null,
                                FID: data.DataID,
                                Content: $remarkTextarea.val() || null
                            },
                            success: function(msgData){
                                common.alert({
                                    type: 'success',
                                    title: '保存采购单',
                                    msg: '成功，' + data.Message,
                                    cb: function(){
                                        window.location.href = '?Do=Edit&DataID=' + data.DataID;
                                    }
                                });
                            }
                        });
                    }
                });
            });

            // 提交快递信息
            $('#ShippingCarrier .expBtn').on('click', function(){
                $.ajax({
                    url: '/Purchase/API/?Do=WaybillSave',
                    type: 'post',
                    dataType: 'json',
                    data: {
                        DataID: op.DataID,
                        ShippingCarrierUsed: $('#ShippingCarrier .expSel').val(),
                        ShipmentTrackingNumber: $('#ShippingCarrier .order').val(),
                        Remark: $('#ShippingCarrier .remark').val()
                    },
                    success: function(data){
                        common.alert({
                            type: 'success',
                            title: '快递信息',
                            msg: '提交成功，系统反馈：' + data.Message,
                            cb: function(){
                                window.location.reload();
                            }
                        });
                    }
                });
            });

            // 备注
            (function(){
                if (op.DataID) {
                    // 初始化和更新备注
                    common.remarkUpdate(op.DataID, $purchaseRemark, $remarkForm, tmRemark, $resetBtn, Int_UID, uploadURL, getdataURL, deleteURL);

                    //提交备注
                    common.remarkSave(op.DataID, $purchaseRemark, $remarkForm, tmRemark, $resetBtn, Int_UID, uploadURL, getdataURL, deleteURL);

                    //判断备注能否编辑和删除，如果备注的UID符合当前用户UID，则可以编辑或删除，并且绑定事件
                    common.editAndDel(op.DataID, $purchaseRemark, $remarkForm, tmRemark, $resetBtn, Int_UID, uploadURL, getdataURL, deleteURL);

                    //编辑备注的[取消]按钮事件
                    common.reset($remarkForm, $resetBtn);
                }
            })();
            


        }());
    </script>
</body>
</html>
