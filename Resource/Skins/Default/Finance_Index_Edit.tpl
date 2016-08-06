{页面属性}{/页面属性}
<body>
    {页顶导航}{/页顶导航}
    <!-- 内容-->
    <div id="data-list" class="container-fluid maxW1280 divCenter">
        <div class="row">
            <div id="Fin-Finance" class="col-sm-12">
                <table class="table table-striped table-bordered table-hover table-condensed">
                    <thead>
                        <th>编号</th>
                        <th>单号</th>
                        <th>发起人</th>
                        <th>请款说明</th>
                        <th>付款类型</th>
                        <th>总金额</th>
                        <th>状态</th>
                        <th>时间</th>
                    </thead>
                    <tbody></tbody>
                </table>
            </div>
            <div id="Fin-PaymentList" class="col-sm-12">
                <table class="table table-striped table-bordered table-hover table-condensed">
                    <thead>
                        <th>支付单号</th>
                        <th>银行信息</th>
                        <th>金额</th>
                        <th>付款人</th>
                        <th>付款单据</th>
                        <th>状态</th>
                        <th>时间</th>
                        <th>操作</th>
                    </thead>
                    <tbody></tbody>
                </table>
            </div>
            <div id="Fin-Payment" class="col-sm-12">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="row">
                            <div id="Fin-Payment" class="col-sm-6">
                                <form class="form-horizontal" action="javascript:;" method="post" enctype="multipart/form-data">
                                    <div class="form-group">
                                        <label for="" class="control-label col-sm-2">金额：</label>
                                        <div class="col-sm-10">
                                            <input id="Fin-Amount" type="text" name="Amount" class="form-control" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-sm-2">单据：</label>
                                        <div class="col-sm-10">
                                            <input class="form-control" type="file" id="StrFile-Payment" name="StrFile" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="" class="control-label col-sm-2"></label>
                                        <div class="col-sm-10">
                                            <button class="btn btn-default" type="button">保存</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div id="Fin-Supplier" class="col-sm-6">
                                <table class="table table-striped table-bordered table-hover table-condensed">
                                    <caption>供应商财务信息</caption>
                                    <tbody></tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div id="Fin-Product" class="col-sm-8">
                <table class="table table-striped table-bordered table-hover table-condensed">
                    <thead>
                        <th>编号</th>
                        <th>产品SKU/Name</th>
                        <th>数量</th>
                        <th>单价</th>
                        <th>单项汇总</th>
                    </thead>
                    <tbody></tbody>
                </table>
            </div>
            <div id="Fin-Amount" class="col-sm-3 pull-right">
                <table class="table table-striped table-bordered table-hover table-condensed">
                    <thead>
                        <th>项目名称</th>
                        <th>费用</th>
                    </thead>
                    <tbody></tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- 图片模态框 -->
    <div id="imgModal" class="modal fade" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content"></div>
        </div>
    </div>

    <!-- Finance啥来着 -->
    <template id="tm-Finance">
        {{#Finance}}
        <tr>
            <td>{{DataID}}</td><td class="orderID">{{OrderID}}</td><td>{{ApplyName}}</td><td>{{Title}}</td>
            <td>{{Type}}</td><td>{{Amount}}</td><td>{{Status}}</td><td>{{Date}}</td>
        </tr>
        {{/Finance}}
    </template>

    <!-- 供应商财务信息 -->
    <template id="tm-Supplier">
        {{#Supplier}}
        <tr><td>开户银行</td><td>{{BankName}}</td></tr>
        <tr><td>开户名</td><td>{{AccountName}}</td></tr>
        <tr><td>账号</td><td>{{AccountNumber}}</td></tr>
        {{/Supplier}}
        {{#Finance}}
        <tr><td>需支付金额</td><td>{{Amount}}</td></tr>
        {{/Finance}}
    </template>

    <!-- 产品模板 -->
    <template id="tm-Product">
        {{#Product}}
        <tr>
            <td>{{DataID}}</td>
            <td>[{{ProductSKU}}] {{ProductName}}</td>
            <td>{{Quantity}}</td>
            <td>{{Price}}</td>
            <td>{{collect}}</td>
        </tr>
        {{/Product}}
    </template>

    <!-- 折扣&运费 -->
    <template id="tm-Amount">
        {{#Order}}
        <tr><td>折扣</td><td>{{AmountSaved}}</td></tr>
        <tr><td>运费</td><td>{{ShipCost}}</td></tr>
        {{/Order}}
    </template>
    
    <!-- 支付单 -->
    <template id="tm-PaymentList">
        {{#Payment}}
        <tr data-oid="{{OrderID}}">
            <td>{{OrderID}}</td>
            <td>银行：{{BankName}}<br/ >用户名：{{AccountName}}<br />卡号：{{AccountNumber}}</td>
            <td>{{Amount}}</td>
            <td>{{TrueName}}</td>
            <td><img class="poi" data-url="{{File}}" src="{{File}}" alt="支付单据" title="点击查看详情" style="width: auto; height:20px;"/></td>
            <td>{{Status}}</td>
            <td>{{Date}}</td>
            <td><span class="glyphicon glyphicon-remove poi" style="color: rgb(255, 68, 60);"></span></td>
        </tr>
        {{/Payment}}
    </template>

    {页面底部}{/页面底部}

    <script src="/Resource/js/mustache.js"></script>
    
    <script>
        (function(){
            'use strict';

            var op = common.URL.parse(), //获取链接数据
                $dataList = $('#data-list'),
                $FinFinance = $('#Fin-Finance'), //Finance列表
                tmFinance = $('#tm-Finance').html(), //Finance列表数据模板
                $FinSupplier = $('#Fin-Supplier'), //供应商信息表
                tmSupplier = $('#tm-Supplier').html(), //供应商信息模板
                $FinProduct = $('#Fin-Product'), //产品列表
                tmProduct = $('#tm-Product'), //产品列表数据模板
                $FinAmount = $('#Fin-Amount'), //折扣和运费列表
                tmAmount = $('#tm-Amount').html(), //折扣和运费数据模板
                $FinPaymentList = $('#Fin-PaymentList'), //支付单
                tmPaymentList = $('#tm-PaymentList').html(), //支付单模板
                $FinPayment = $('#Fin-Payment'), //上传单据模块
                $imgModal = $('#imgModal'); //图片模态框

            // 获取数据
            $.ajax({
                url: '/Finance/API/?Do=Query&OrderID=' + op.OrderID + '&DataID=' + op.DataID,
                type: 'get',
                dataType: 'json',
                success: function(data){
                    var d = data;
                    $FinFinance.find('tbody').html(Mustache.render(tmFinance, d)); //Finance
                    $FinSupplier.find('tbody').html(Mustache.render(tmSupplier, d)); //供应商信息表

                    //供应商账号渲染
                    (function(){
                        var tempVal = $FinSupplier.find('tbody tr:eq(2) td:eq(1)').text(),
                            tempStr = '', tempNum;
                        for(var i = 1; i < 99; i++){
                            tempNum = tempVal.substr((i-1)*4, 4);
                            if (i%2 === 0) {tempNum = '<span class="label label-success">' + tempNum + '</span>'}
                            if (tempNum.length < 4) {i = 100;}
                            tempStr += tempNum;
                        }
                        $FinSupplier.find('tbody tr:eq(2) td:eq(1)').html(tempStr);
                    })();

                    // 产品列表
                    var col = 0;
                    $.each(d.Product, function(i, index){
                        index.collect = index.Quantity * parseInt(index.Price.replace(',', ''));
                        col += index.collect;
                    });
                    $FinProduct.find('tbody').html(Mustache.render(tmProduct.html(), d))
                    .append('<tr><td colspan="5" class="text-right">所有项目汇总：' + col + '</td></tr>');

                    $FinAmount.find('tbody').html(Mustache.render(tmAmount, d)); //折扣与运费

                    // 支付单
                    $FinPaymentList.find('tbody').html(Mustache.render(tmPaymentList, d));

                    // 支付单据大图显示
                    $FinPayment.find('tbody img').on('click', function(){
                        $imgModal.find('.modal-content').empty().html('div.<img src="' + $(this).data('url') + '" />');
                        $imgModal.modal('show');
                    });

                    // 取消支付单按钮
                    $FinPaymentList.find('tbody .glyphicon-remove').on('click', function(){
                        if (confirm('是否确认取消？')) {
                            PaymentCancel($(this).closest('tr').data('oid'));
                        };
                    });

                    //状态渲染
                    Rendering();

                }
            });

            // 取消指定的支付单
            function PaymentCancel(OID){
                $.ajax({
                    url: '/Finance/API/?Do=PaymentCancel',
                    type: 'post',
                    dataType: 'json',
                    data: { OrderID: OID },
                    success: function(data){
                        if (data.Ack) {
                            common.alert({
                                type: 'success',
                                title: '取消支付单',
                                msg: '成功，系统反馈：' + data.Message,
                                cb: function(){
                                    location.reload();
                                }
                            });
                        } else {
                            common.alert({
                                title: '取消支付单',
                                msg: '失败，系统反馈：' + data.Message
                            });
                        }
                        
                    }
                });
            }

            // 状态渲染封装
            function Rendering(){
                // 单号时间高亮
                $dataList.find('.orderID').each(function() {
                    var $this = $(this),
                        before = $this.text();
                    $this.html(before.replace(/(\d{8}|\d{6})/ig, '<span class="label label-success">$1</span>'));
                }); 

                //状态
                var style = ['label-default', 'a1me', 'a1md', 'm2c', '2gve', 'xytg', 'xyts'], //样式
                    applyPay = ['待审核', '待支付', '完成', '取消'], //Finance
                    pay = ['未支付', '部分支付', '完成']; //支付

                $('#Fin-test tr').each(function(){
                    var ts = $(this);
                    renderer(ts, applyPay, 6);

                });
                $FinFinance.find('tr').each(function(){
                    var ts = $(this);
                    renderer(ts, applyPay, 6);

                });

                // 状态渲染
                function renderer(tar, arr, num){
                    var val = $.trim(tar.find('td:eq(' + num + ')').text()),
                        flag = $.inArray(val, arr),
                        flag = flag > 0 ? flag : 0;
                    tar.find('td:eq(' + num + ')').html('<span class="label ' + style[flag] + '" >' + val + '</span>');
                }

            }

            // 单据上传
            $FinPayment.find('button').on('click', function(){
                console.log(233);
                common.ajaxFE({
                    title: '单据上传',
                    URL: '/Finance/API/?Do=PaymentCreate',
                    FE: 'StrFile-Payment',
                    dataType: 'json',
                    type: 'post',
                    data: {
                        FID: op.DataID,
                        Amount: $('#Fin-Amount').val()
                    },
                    ok: function(data, status, e){
                        common.alert({
                            type: 'success',
                            title: '[单据上传]操作：',
                            msg: data.Message,
                            cb: function(){
                                location.reload();
                            }
                        });
                    },
                    no: function(data, status, e){
                        console.log("单据上传失败：" + e);
                    }
                });
            });


        }());
    </script>
</body>
</html>
