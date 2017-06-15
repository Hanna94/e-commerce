{页面属性}{/页面属性}
<body>
    {页顶导航}{/页顶导航}
    
    <!-- 内容-->
    <div id="data-list" class="container-fluid">
        <div class="row">

            <!-- 基本信息 -->
            <div id="pa-BasicInfo" class="col-sm-12">
                <div class="panel panel-default">
                    <div class="panel-heading clearfix">
                        <div class="row">
                            <h3 class="panel-title col-sm-6">基本信息</h3>
                            <span id="pa-LogBtn" class="glyphicon glyphicon-file mg-r-10 pull-right poi" title="历史记录"></span>
                        </div>
                    </div>
                    <table class="table table-hover table-bordered table-condensed table-striped t1">
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
                            <col>
                            <col>
                            <col>
                            <col>
                            <col>
                            <col>
                            <col>
                        </colgroup>
                        <thead>
                            <th>DataID</th>
                            <th>TransactionID</th>
                            <th>ShopID</th>
                            <th>ShopName</th>
                            <th>ReceiverID</th>
                            <th>PayerID</th>
                        </thead>
                        <tbody></tbody>
                    </table>
                    <table class="table table-hover table-bordered table-condensed table-striped t2">
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
                            <col>
                            <col>
                            <col>
                            <col>
                            <col>
                            <col>
                            <col>
                        </colgroup>
                        <thead>
                            <th>CountryCode</th>
                            <th>ParentTransactionID</th>
                            <th>ReceiptID</th>
                            <th>InvNum</th>
                            <th>Custom</th>
                            <th>Correlationid</th>
                        </thead>
                        <tbody></tbody>
                    </table>
                    <table class="table table-hover table-bordered table-condensed table-striped t3">
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
                            <col>
                            <col>
                            <col>
                            <col>
                            <col>
                            <col>
                            <col>
                        </colgroup>
                        <thead>
                            <th>Subject</th>
                            <th>Note</th>
                            <th>ClosingDate</th>
                            <th>Multiitem</th>
                            <th>Date</th>
                        </thead>
                        <tbody></tbody>
                    </table>
                </div>
            </div>
            <!-- 基本信息 -->

            <div class="col-lg-6 col-sm-6">
                <div class="row">
                    <!-- 状态 -->
                    <div id="pa-Status" class="col-sm-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">状态</h3>
                            </div>
                            <table class="table table-hover table-bordered table-condensed table-striped">
                                <colgroup>
                                    <col>
                                    <col>
                                </colgroup>
                                <tbody></tbody>
                            </table>
                        </div>
                    </div>
                    <!-- 状态 -->

                    <!-- 产品列表 -->
                    <div id="pa-Product" class="col-sm-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">产品列表</h3>
                            </div>
                            <table class="table table-hover table-bordered table-condensed table-striped">
                                <tbody></tbody>
                            </table>
                        </div>
                    </div>
                    <!-- 产品列表 -->
                </div>
            </div>

            <div class="col-lg-6 col-sm-6">
                <div class="row">
                    <!-- 买家信息 -->
                    <div id="pa-Buyer" class="col-sm-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">买家信息</h3>
                            </div>
                            <table class="table table-hover table-bordered table-condensed table-striped">
                                <colgroup>
                                    <col>
                                    <col>
                                    <col>
                                    <col>
                                    <col>
                                    <col>
                                </colgroup>
                                <thead>
                                    <th>BuyerID</th>
                                    <th>BID</th>
                                    <th>Name</th>
                                    <th>FirstName</th>
                                    <th>LastName</th>
                                </thead>
                                <tbody></tbody>
                            </table>
                        </div>
                    </div>
                    <!-- 买家信息 -->

                    <!-- 地址 -->
                    <div id="pa-Address" class="col-sm-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">地址</h3>
                            </div>
                            <table class="table table-hover table-bordered table-condensed table-striped">
                                <thead>
                                    <th>DataID</th>
                                    <th>TID</th>
                                    <th>AddressOwner</th>
                                    <th>AddressStatus</th>
                                </thead>
                                <tbody></tbody>
                            </table>
                        </div>
                    </div>
                    <!-- 地址 -->

                    <!-- 交易信息 -->
                    <div id="pa-Money" class="col-sm-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">交易信息</h3>
                            </div>
                            <table class="table table-hover table-bordered table-condensed table-striped">
                                <thead>
                                    <th>Amt</th>
                                    <th>NetAmt</th>
                                    <th>Currency Code</th>
                                    <th>Fee Amt</th>
                                    <th>Shipping Amt</th>
                                    <th>Settle Amt</th>
                                    <th>Sales Tax</th>
                                    <th>Exchangerate</th>
                                </thead>
                                <tbody></tbody>
                            </table>
                        </div>
                    </div>
                    <!-- 交易信息 -->
                </div>
            </div>
            
        </div>
    </div>

    <!-- 记录模态框 -->
    <div id="pa-LogModal" class="modal fade" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button class="close" type="button" data-dismiss="modal">x</button>
                    <h4 class="modal-title">记录</h4>
                </div>
                <div class="modal-body">
                    <table class="table table-hover table-bordered table-condensed table-striped">
                        <thead>
                            <th>DataID</th>
                            <th>UID</th>
                            <th>Name</th>
                            <th>Date</th>
                        </thead>
                        <tbody></tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!-- 记录历史 -->
    <template id="tm-Log">
        {{#LogMessage}}
        <tr><td>{{DataID}}</td><td>{{UID}}</td><td>{{Name}}</td><td>{{Date}}</td></tr>
        <tr><td colspan="4" style="word-break:break-word;">{{Remark}}</td></tr>
        {{/LogMessage}}
    </template>

    <!-- 基本信息 -->
    <template id="tm-BasicInfo-1">
        <tr><td>{{DataID}}</td><td>{{TransactionID}}</td><td>{{ShopID}}</td><td>{{ShopName}}</td><td>{{ReceiverID}}</td><td>{{PayerID}}</td></tr>
    </template>

    <template id="tm-BasicInfo-2">
        <tr><td>{{CountryCode}}</td><td>{{ParentTransactionID}}</td><td>{{ReceiptID}}</td><td>{{InvNum}}</td><td>{{Custom}}</td><td>{{Correlationid}}</td></tr>
    </template>

    <template id="tm-BasicInfo-3">
        <tr><td>{{Subject}}</td><td>{{Note}}</td><td>{{ClosingDate}}</td><td>{{Multiitem}}</td><td>{{Date}}</td></tr>
    </template>

    <!-- 状态 -->
    <template id="tm-Status">
        {{#Status}}
        <tr><td>Types:</td><td>{{Types}}</td></tr>
        <tr><td>PayerStatus:</td><td>{{PayerStatus}}</td></tr>
        <tr><td>TransactionType:</td><td>{{TransactionType}}</td></tr>
        <tr><td>PaymentType:</td><td>{{PaymentType}}</td></tr>
        <tr><td>OrderTime:</td><td>{{OrderTime}}</td></tr>
        <tr><td>PaymentStatus:</td><td>{{PaymentStatus}}</td></tr>
        <tr><td>ProtectionEligibility:</td><td>{{ProtectionEligibility}}</td></tr>
        <tr><td>ProtectionEligibilityType:</td><td>{{ProtectionEligibilityType}}</td></tr>
        <tr><td>PendingReason:</td><td>{{PendingReason}}</td></tr>
        <tr><td>ReasonCode:</td><td>{{ReasonCode}}</td></tr>
        {{/Status}}
    </template>

    <!-- 买家 -->
    <template id="tm-Buyer">
        {{#Buyer}}
        <tr><td>{{BuyerID}}</td><td>{{BID}}</td><td>{{Name}}</td><td>{{FirstName}}</td><td>{{LastName}}</td></tr>
        {{/Buyer}}
    </template>

    <!-- 地址 -->
    <template id="tm-Address">
        {{#Address}}
        <tr><td>{{DataID}}</td><td>{{TID}}</td><td>{{AddressOwner}}</td><td>{{AddressStatus}}</td></tr>
        <tr><td><strong>地址1：</strong></td><td colspan="3">{{Add1}}</td></tr>
        <tr><td><strong>地址2：</strong></td><td colspan="3">{{Add2}}</td></tr>
        {{/Address}}
    </template>
    <!-- 地址 -->
    
    <!-- 交易信息 -->
    <template id="tm-Money">
        {{#Money}}
        <tr><td>{{Amt}}</td><td>{{NetAmt}}</td><td>{{CurrencyCode}}</td><td>{{FeeAmt}}</td><td>{{ShippingAmt}}</td><td>{{SettleAmt}}</td><td>{{SalesTax}}</td><td>{{Exchangerate}}</td></tr>
        <tr><td><strong>ReceiverBusiness</strong></td><td colspan="7">{{ReceiverBusiness}}</td></tr>
        <tr><td><strong>ReceiverEmail</strong></td><td colspan="7">{{ReceiverEmail}}</td></tr>
        <tr><td><strong>Email</strong></td><td colspan="7">{{Email}}</td></tr>
        {{/Money}}
    </template>
    <!-- 交易信息 -->

    <!-- 产品 -->
    <template id="tm-Product">
        {{#Product}}
        <tr><td colspan="6"><strong>{{Name}}</strong></td></tr>
        <tr><td colspan="2"><strong>eBayTransactionID</strong></td><td colspan="4">{{eBayTransactionID}}</td></tr>
        <tr><td><strong>DataID</strong></td><td>{{DataID}}</td><td><strong>ItemID</strong></td><td>{{ItemID}}</td><td><strong>MPN</strong></td><td>{{MPN}}</td></tr>
        <tr><td><strong>Quantity</strong></td><td>{{Quantity}}</td><td><strong>ShippingAMT</strong></td><td>{{ShippingAMT}}</td><td><strong>Amt</strong></td><td>{{Amt}}</td></tr>
        <tr><td><strong>OptionsName</strong></td><td>{{OptionsName}}</td><td><strong>OptionsValue</strong></td><td>{{OptionsValue}}</td><td><strong>Date</strong></td><td>{{Date}}</td></tr>
        {{/Product}}
    </template>
    <!-- 产品 -->

    {页面底部}{/页面底部}

    <script src="/Resource/js/mustache.js"></script>
    <script>
        (function() {
            'use strict';
            
            var op = common.URL.parse(),
                $paLogBtn = $('#pa-LogBtn'), //记录按钮
                $paLogModal = $('#pa-LogModal'), //记录模态框
                tmLog = $('#tm-Log').html(), //记录模板
                $paBasicInfo = $('#pa-BasicInfo'), //基本信息
                tmBasicInfo1 = $('#tm-BasicInfo-1').html(), //基本信息模板1
                tmBasicInfo2 = $('#tm-BasicInfo-2').html(), //基本信息模板2
                tmBasicInfo3 = $('#tm-BasicInfo-3').html(), //基本信息模板3
                $paStatus = $('#pa-Status'), //状态
                tmStatus = $('#tm-Status').html(), //状态模板
                $paBuyer = $('#pa-Buyer'), //买家
                tmBuyer = $('#tm-Buyer').html(), //买家模板
                $paAddress = $('#pa-Address'), //地址
                tmAddress = $('#tm-Address').html(), //地址模板
                $paMoney = $('#pa-Money'), //地址
                tmMoney = $('#tm-Money').html(), //地址模板
                $paProduct = $('#pa-Product'), //产品
                tmProduct = $('#tm-Product').html(); //产品模板

            // 获取数据
            $.ajax({
                url: '/Finance/API/?Do=PayPalQuery&TransactionID=' + op.TransactionID + '&DataID=' + op.DataID,
                
                type: 'get',
                success: function(d){
                    $paBasicInfo.find('.t1 tbody').html(Mustache.render(tmBasicInfo1, d)); //基本信息
                    $paBasicInfo.find('.t2 tbody').append(Mustache.render(tmBasicInfo2, d)); //基本信息
                    $paBasicInfo.find('.t3 tbody').append(Mustache.render(tmBasicInfo3, d)); //基本信息
                    $paStatus.find('tbody').html(Mustache.render(tmStatus, d)); //状态
                    $paBuyer.find('tbody').html(Mustache.render(tmBuyer, d)); //买家

                    //地址拼合
                    var ad = d.Address,
                        Add1 = [ad.Name, ad.Street1, ad.Street2, ad.City, ad.State, ad.ZIP, ad.Country, ad.Phone],
                        Add2 = [ad.SecondaryName, ad.SecondaryStreet1, ad.SecondaryStreet2, ad.SecondaryCity, ad.SecondaryState, ad.SecondaryZIP, ad.SecondaryCountry, ad.SecondaryPhone];
                    for(var i = 0; i < 7; i++){
                        var inNum1 = Add1.indexOf(''),
                            inNum2 = Add2.indexOf('');
                        if (inNum1 !== -1) {Add1.splice(inNum1, 1);}
                        if (inNum2 !== -1) {Add2.splice(inNum2, 1);}
                    }
                    d.Address.Add1 = Add1.join(', ');
                    d.Address.Add2 = Add2.join(', ');
                    $paAddress.find('tbody').html(Mustache.render(tmAddress, d)); //地址

                    $paMoney.find('tbody').html(Mustache.render(tmMoney, d)); //交易信息
                    $paProduct.find('tbody').html(Mustache.render(tmProduct, d)); //产品

                    $paLogBtn.on('click', function(){
                        $paLogModal.find('tbody').html(Mustache.render(tmLog, d)); //产品
                        $paLogModal.modal('show');
                    });
                }

            });

        }());
    </script>
</body>
</html>
