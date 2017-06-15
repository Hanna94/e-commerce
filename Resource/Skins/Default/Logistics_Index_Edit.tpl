{页面属性}{/页面属性}
<body>
    {页顶导航}{/页顶导航}
    <!-- 内容-->
    <article id="main-article" class="container-fluid">

        <!-- 货代 -->
        <div id="log-forwarder" class="row">
            <div class="col-lg-12 col-md-12">
                <img src="" alt="货代" class="img-thumbnail pull-left" style="width: auto; height: 124px;" />
                <ul class="list-group pull-left"></ul>
            </div>
        </div>

        <hr />

        <!-- 运单进度 -->
        <div class="row">
            <div class="col-sm-2">
                <span class="label label-success">
                    <span class="glyphicon glyphicon-eye-open"></span> 确认订单
                </span>
            </div>
            <div class="col-sm-4 text-center" >
                <span class="label label-success">
                    <span class="glyphicon glyphicon-barcode"></span> 交接出库
                </span>
            </div>
            <div class="col-sm-4 text-center">
                <span class="label label-default">
                    <span class="glyphicon glyphicon-plane"></span> 派送中
                </span>
            </div>
            <div class="col-sm-2 text-right">
                <span class="label label-default">
                    <span class="glyphicon glyphicon-thumbs-up"></span> 妥投
                </span>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 col-lg-12">
                <div class="progress progress-striped">
                    <div class="progress-bar progress-bar-info" style="width:50%;"></div>
                </div>
            </div>
        </div>

        <hr />

        <div class="row">
            <!-- 地址和订单 -->
            <div id="log-addressAndOrder" class="col-lg-8 col-md-12">
                <ul class="list-group">
                    <li class="list-group-item"><span class="label label-default">地址</span>&nbsp;&nbsp;</li>
                    <li class="list-group-item"><span class="label label-default">订单</span>&nbsp;&nbsp;</li>
                </ul>
            </div>

            <!-- 备注 -->
            <div class="col-lg-4 col-md-12">
                <div id="log-remark" class="panel panel-default clearfix pd-5" style="height: 123px;">
                    <div class="pull-left" style="max-height: 113px; overflow: auto; width: 70%;">
                        <table class="table table-striped table-condensed">
                            <tbody></tbody>
                        </table>
                    </div>
                    <form class="form-horizontal" action="javascript:;">
                        <div class="input-group input-group-sm pull-left" style="width: 30%;">
                            <textarea rows="3" name="Remark" class="form-control" style="height: 113px;"></textarea>
                            <span class="input-group-btn" >
                                <input type="submit" class="btn btn-default" value="提交" style="height: 113px;" />
                                <input type="reset" class="btn btn-default hidden" value="取消" style="height: 113px;" />
                            </span>
                        </div>
                    </form>
                </div>
            </div>
            
            <!-- 产品信息 -->
            <div id="log-product" class="col-lg-6 col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">产品</h3>
                    </div>
                    <table class="table table-bordered table-condensed">
                        <thead>
                            <tr>
                                <th>产品SKU</th>
                                <th>库存编码</th>
                                <th>品名</th>
                                <th>数量</th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                    </table>
                </div>
            </div>

            <!-- 资金 -->
            <div class="col-lg-3 col-md-6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">资金</h3>
                    </div>
                    <table class="table table-bordered table-condensed">
                        <tbody>
                            <tr>
                                <td><strong>总运费</strong></td>
                                <td>18.00&nbsp;&nbsp;<span class="label label-primary">CNY</span></td>
                            </tr>
                            <tr>
                                <td><strong>运费/挂号</strong></td>
                                <td>18.00&nbsp;&nbsp;<span class="label label-primary">CNY</span></td>
                            </tr>
                            <tr>
                                <td><strong>其他</strong></td>
                                <td>18.00&nbsp;&nbsp;<span class="label label-primary">CNY</span></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- 其他汇总 -->
            <div class="col-lg-3 col-md-6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">其他汇总</h3>
                    </div>
                    <table class="table table-bordered table-condensed">
                        <tbody>
                            <tr>
                                <td><strong>其他汇总</strong></td>
                                <td>18.00&nbsp;&nbsp;<span class="label label-primary">CNY</span></td>
                            </tr>
                            <tr>
                                <td><strong>处理费</strong></td>
                                <td>6.00&nbsp;&nbsp;<span class="label label-primary">CNY</span></td>
                            </tr>
                            <tr>
                                <td><strong>边远费</strong></td>
                                <td>3.00&nbsp;&nbsp;<span class="label label-primary">CNY</span></td>
                            </tr>
                            <tr>
                                <td><strong>税费</strong></td>
                                <td>9.00&nbsp;&nbsp;<span class="label label-primary">CNY</span></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

        </div>
    </article>

    <!-- 单号 -->
    <template id="tm-forwarder">
        {{#Logistics}}
        <li class="list-group-item"><a href="javascript:;">{{OrderID}}</a></li>
        <li class="list-group-item"><a href="javascript:;">{{InsideOrder}}</a>&nbsp;&nbsp;<span class="label label-info">{{FreightServiceCode}}</span></li>
        <li class="list-group-item"><a href="javascript:;">{{TrackingNumber}}</a>&nbsp;&nbsp;<span class="label label-info">{{FreightServiceSupport}}</span></li>
        {{/Logistics}}
    </template>

    <!-- 买家信息 -->
    <template id="tm-address">
        {{#Address}}
        <p class="text-info mg-t-10">
        {{ShipToName}},&nbsp;{{ShipToStreet1}},&nbsp;{{ShipToStreet2}},&nbsp;{{ShipToCity}},&nbsp;{{ShipToState}},&nbsp;{{ShipToZIP}},&nbsp;{{ShipToCountry}},&nbsp;{{ShipToPhone}}
        </p>
        {{/Address}}
    </template>

    <!-- 订单信息 -->
    <template id="tm-order">
        <span class="text-info">
        {{DataID}},&nbsp;
        {{#Logistics}}
        {{Buyer}},&nbsp;
        {{/Logistics}}
        {{#Order}}
        {{Shop}},&nbsp;{{AmountPaid}}<span class="label label-primary">{{Currency}}</span>,&nbsp;
        {{/Order}}
        {{#Logistics}}
        {{Date}}
        {{/Logistics}}
        </span>
    </template>

    <!-- 产品信息 -->
    <template id="tm-product">
        {{#Product}}
        <tr>
            <td>{{SKU}}</td>
            <td>{{SkuID}}</td>
            <td>{{Name}}</td>
            <td>{{Quantity}}</td>
        </tr>
        {{/Product}}
    </template>

    <!-- 备注 -->
    <template id="tm-remark">
        {{#Message}}
        <tr>
            <td>
                <input type="hidden" id="UID" name="UID" value="{{UID}}" />
                <input type="hidden" id="DataID" name="DataID" value="{{DataID}}" />
                <span>{{Remark}}</span>&nbsp;&nbsp;
                <span style="font-size: 14px;color: #929292;">By：{{UserName}}</span>&nbsp;&nbsp;<i style="font-size: 14px;color: #929292;">{{Date}}</i>
                <div id="btn-ead" class="poi" style="float: right;">
                    <span class="glyphicon glyphicon-pencil"></span>&nbsp;&nbsp;
                    <span class="glyphicon glyphicon-remove"></span>
                </div>
            </td>
        </tr>
        {{/Message}}
    </template>

    {页面底部}{/页面底部}

    <script src="/Resource/js/mustache.js"></script>
    <script>
        (function(){
            'use strict';

            var oParam = common.URL.parse(),
                $forwarder = $('#log-forwarder'),
                $forwarderImg = $forwarder.find('img'),
                tempForwarder = $('#tm-forwarder').html(),
                $addAndOrd = $('#log-addressAndOrder'),
                tempAdd = $('#tm-address').html(),
                tempOrd = $('#tm-order').html(),
                $product = $('#log-product'),
                tempPro = $('#tm-product').html(),
                $remark = $('#log-remark'),
                tempMa = $('#tm-remark').html(),
                $remarkForm = $remark.find('form'),
                Int_UID = <!-- BEGIN 当前用户ID ATTRIB= --><!-- END 当前用户ID -->,
                $remarkBtn = $remarkForm.find('input[type="reset"]'),
                remarkID,
                urlIf = oParam.DataID ? "DataID=" + oParam.DataID : "OrderID=" + oParam.OrderID;
            
            // 获取当前运单信息

            common.ajax({
                title: '获取运单内容',
                URL: '/Logistics/Logistics.aspx?Do=LogisticsQuery&' + urlIf,
                good: function(data){
                    var d = data;
                    $forwarder.find('ul').html(Mustache.render(tempForwarder, d));
                    $addAndOrd.find('li:eq(0)').append(Mustache.render(tempAdd, d));
                    $addAndOrd.find('li:eq(1)').append(Mustache.render(tempOrd, d));
                    $product.find('tbody').html(Mustache.render(tempPro, d));

                    //判断货代图片
                    var ferid = d.Logistics.FreightID,
                        isp, imgURL;
                    if(ferid == 1){
                        isp = 'SFC';
                    }else if(ferid == 2){
                        isp = 'CNE';
                    }else if(ferid == 3||ferid == 4||ferid == 5||ferid == 6||ferid == 7){
                        isp = 'CK1';
                    }else{
                        isp = 0;
                    }

                    //添加货代图片的URL,如果没有货代，删除img标签
                    if(isp != 0){
                        imgURL = '/Resource/Images/forwarder/' + isp + '.jpg';
                        $forwarderImg.attr('src', imgURL);
                    }else{
                        $forwarderImg.remove();
                    }
                    

                    //从订单信息获取备注
                    remarkID = d.Order[0].ReferenceID;
                    $.ajax({
                        url: '/OMS/API/?Do=Query&OrderID=' + remarkID,
                        
                        type: 'get',
                        success: function(data, status, e){
                            var md = data.DataList[0];
                            $remark.find('tbody').html(Mustache.render(tempMa, md));
                            //提交备注
                            common.remarkSave(remarkID, $remark, $remarkForm, tempMa, $remarkBtn, Int_UID);

                            //判断备注能否编辑和删除，如果备注的UID符合当前用户UID，则可以编辑或删除，并且绑定事件
                            common.editAndDel(remarkID, $remark, $remarkForm, tempMa, $remarkBtn, Int_UID);

                            //编辑备注的[取消]按钮事件
                            common.reset($remarkForm, $remarkBtn);
                        },
                        error: function(data, status, e){
                            console.log(e);
                        }
                    });
                }
            });
        })();
    </script>

</body>
</html>
