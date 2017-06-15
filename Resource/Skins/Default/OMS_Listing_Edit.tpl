{页面属性}{/页面属性}
<body>
    {页顶导航}{/页顶导航}
    
    <!-- 内容-->

    <div class="row">
        <div class="col-sm-6 col-lg-6">
            <!-- Item -->
            <div class="col-sm-12">
                <div id="list-item" class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">Item</h4>
                    </div>
                    <div class="panel-body">
                        <table class="table">
                            <tbody></tbody>
                        </table>
                    </div>
                </div>
            </div>

            <!-- Ship -->
            <div class="col-sm-12 col-lg-12">
                <div id="list-ship" class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">货代服务</h4>
                    </div>
                    <div class="panel-body">
                        <table class="table">
                            <thead>
                                <th>货代</th>
                                <th>金额</th>
                                <th>预期时间</th>
                                <th>是否免运费</th>
                            </thead>
                            <tbody></tbody>
                        </table>
                    </div>
                </div>
            </div>

            <!-- InternationalShip -->
            <div class="col-sm-12 col-lg-12">
                <div id="list-internationalship" class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">国际货代服务</h4>
                    </div>
                    <div class="panel-body">
                        <table class="table">
                            <thead>
                                <th>货代</th>
                                <th>金额</th>
                                <th>附加费用</th>
                            </thead>
                            <tbody></tbody>
                        </table>
                    </div>
                </div>
            </div>

        </div>

        <div class="col-lg-6 col-sm-6">
            <!-- Selling -->
            <div class="col-sm-6 col-lg-6">
                <div id="list-selling" class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">Selling</h4>
                    </div>
                    <div class="panel-body">
                        <table class="table">
                            <tbody></tbody>
                        </table>
                    </div>
                </div>
            </div>

            <!-- ShipToLocation -->
            <div class="col-sm-6 col-lg-6">
                <div id="list-shiptolocation" class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">国际派送范围</h4>
                    </div>
                    <div class="panel-body">
                        <p></p>
                    </div>
                </div>
            </div>

            <!-- SKU -->
            <div class="col-sm-12 col-lg-12">
                <div id="list-sku" class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">SKU</h4>
                    </div>
                    <div class="panel-body">
                        <table class="table">
                            <thead>
                                <th>SKU</th>
                                <th>货币金额</th>
                                <th>售出数量</th>
                                <th>在线数量</th>
                                <th>促销开始时间</th>
                                <th>促销结束时间</th>
                                <th>原价</th>
                            </thead>
                            <tbody></tbody>
                        </table>
                    </div>
                </div>
            </div>
            
        </div>

    </div>

    <!-- 图片模态框 -->
    <div class="modal fade" id="imgModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                
            </div>
        </div>
    </div>

    <!-- item -->
    <template id="temp-item">
        {{#Item}}
        <tr><td colspan="5"><a href="{{ViewItemURL}}" target="_blank">{{Title}}</td></tr>
        <tr><td rowspan="2"><img src="{{GalleryURL-Small}}"></td><td>ShopID:</td><td>{{ShopID}}</td><td>ShopName:</td><td>{{ShopName}}</td></tr>
        <tr><td>Country:</td><td>{{Country}}</td><td>RelistParentID:</td><td>{{RelistParentID}}</td></tr>
        {{/Item}}
    </template>

    <!-- Selling -->
    <template id="temp-selling">
        {{#Selling}}
        <tr><td>StartPrice:</td><td><span class="currency label">{{CurrencyID}}</span>{{StartPrice}}</td></tr>
        <tr><td>PayPalEmailAddress:</td><td>{{PayPalEmailAddress}}</td></tr>
        {{/Selling}}
    </template>

    <!-- ShipToLocation -->
    <template id="temp-shiptolocation">
        {{#ShipToLocation}}
            {{ShipToLocation}},
        {{/ShipToLocation}}
    </template>

    <!-- SKU -->
    <template id="temp-sku">
        {{#SKU}}
        <tr>
            <td>{{SKU}}</td>
            <td>{{StartPrice}}</td>
            <td>{{QuantitySold}}</td>
            <td>{{QuantityActive}}</td>
            <td>{{PromotionalStartTime}}</td>
            <td>{{PromotionalEndTime}}</td>
            <td>{{PromotionalOriginalPrice}}</td>
        </tr>
        {{/SKU}}
    </template>

    <!-- Ship -->
    <template id="temp-ship">
        {{#Ship}}
        <tr>
            <td>{{ShippingService}}</td>
            <td><span class="currency label">{{ShippingServiceCostCurrencyID}}</span>{{ShippingServiceCost}}</td>
            <td>{{ShippingTimeMin}}~{{ShippingTimeMax}}</td>
            <td data-val="{{FreeShipping}}"></td>
        </tr>
        {{/Ship}}
    </template>

    <!-- InternationalShip -->
    <template id="temp-internationalship">
        {{#InternationalShip}}
        <tr>
            <td>{{ShippingService}}</td>
            <td><span class="currency label">{{ShippingServiceCostCurrencyID}}</span>{{ShippingServiceCost}}</td>
            <td><span class="currency label">{{ShippingServiceCostCurrencyID}}</span>{{ShippingServiceAdditionalCost}}</td>
        </tr>
        {{/InternationalShip}}
    </template>

    {页面底部}{/页面底部}

    <script src="/Resource/js/mustache.js"></script>
    <script>
        (function() {
            'use strict';

            var op = common.URL.parse(),
                $lsItem = $('#list-item'), 
                tempItem = $('#temp-item').html(),
                $lsCategory = $('#list-category'), 
                tempCategory = $('#temp-category').html(),
                $lsSelling = $('#list-selling'), 
                tempSelling = $('#temp-selling').html(),
                $lsShipToLocation = $('#list-shiptolocation'), 
                tempShipToLocation = $('#temp-shiptolocation').html(),
                $lsSKU = $('#list-sku'), 
                tempSKU = $('#temp-sku').html(),
                $lsShip = $('#list-ship'), 
                tempShip = $('#temp-ship').html(),
                $lsInternationalShip = $('#list-internationalship'), 
                tempInternationalShip = $('#temp-internationalship').html(),
                $imgModal = $('#imgModal');

            // 获取数据
            $.ajax({
                url: '/OMS/API/?Do=ItemQuery&DataID=' + op.DataID + '&ItemID=' + op.ItemID,
                type: 'get',
                
                success: function(data){
                    var d = data;
                    $lsItem.find('tbody').html(Mustache.render(tempItem, d));
                    $lsSelling.find('tbody').html(Mustache.render(tempSelling, d));
                    $lsShipToLocation.find('.panel-body p').html(Mustache.render(tempShipToLocation, d));
                    $lsSKU.find('tbody').html(Mustache.render(tempSKU, d));
                    $lsShip.find('tbody').html(Mustache.render(tempShip, d));
                    $lsInternationalShip.find('tbody').html(Mustache.render(tempInternationalShip, d));

                    // 加载图片
                    $imgModal.find('.modal-content').html('<img src="' + d.Item.GalleryURL + '" />');

                    // 显示大图
                    $lsItem.find('tbody img').on('click', function(){
                        $imgModal.modal('show');
                    });

                    // 渲染货代的免运费
                    $lsShip.find('tbody tr').each(function(){
                        var ts = $(this),
                            YN = ts.find('td:last').attr('data-val');
                        if (YN === 'True') {
                            ts.find('td:last').text('是');
                        }else{
                            ts.find('td:last').text('否');
                        }
                    });

                    // 货币渲染
                    $('.row .currency').each(function () {
                        var ts = $(this);
                        ts.addClass('label-' + common.order.amtCurrency($.trim(ts.text())));
                    });

                }
            });

            
        }());
    </script>
</body>
</html>
