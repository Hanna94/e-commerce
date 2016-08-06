{页面属性}{/页面属性}
<body>
    {页顶导航}{/页顶导航}
    
    <!-- 内容-->
    <div id="data-list" class="container-fluid">
        <header>
            <div class="btn-group btn-group-sm pull-right">
                <button class="btn btn-success btn-upload-file" data-toggle="modal" data-target="#modal-upload" type="button"><span class="glyphicon glyphicon-upload"></span> 上传</button>



                <!-- 待交运页面-->
                <div class="btn-group btn-group-sm UnStock-panel">
                    <button data-name="UnStock" class="btn btn-default btn-status-alter option-status-alter" type="button" disabled><span class="glyphicon glyphicon-eye-open"></span> <span data-val="待配货">待配货</span></button>
                </div>

                <!-- 待配货页面-->
                <div class="btn-group btn-group-sm default-panel">
                    <button data-name="UnConfirmed" class="btn btn-default btn-status-alter option-status-alter" type="button" disabled><span class="glyphicon glyphicon-eye-open"></span> <span class="option-status-alter" data-val="待审核">待审核</span></button>
                </div>

                <div class="btn-group btn-group-sm execute-panel">
                    <button data-name="" class="btn btn-primary" type="button"><span class="glyphicon glyphicon-transfer"></span> 执行</button>
                </div>

                <!-- 待出库和已出库页面-->
                <div class="btn-group btn-group-sm UpPost-panel">
                    <button data-name="UnPost" class="btn btn-default btn-status-alter" type="button" disabled><span class="glyphicon glyphicon-eye-open"></span> <span class="option-status-alter" data-val="待交运">待交运</span></button>
                </div>

                <div class="btn-group btn-group-sm">
                    <button data-name="OutStock" data-toggle="dropdown" class="btn btn-warning dropdown-toggle btn-status-alter" type="button" disabled><span class="glyphicon glyphicon-flash"></span> 缺货</button>
                    <ul class="dropdown-menu dropdown-menu-right">
                        <li class="option-status-alter" data-val="正常"><a href="javascript:;">有货</a></li>
                        <li class="option-status-alter" data-val="缺货"><a href="javascript:;"><span class="text-danger">缺货</span></a></li>
                    </ul>
                </div>

                <div class="btn-group btn-group-sm">
                    <button data-name="Cancel" data-toggle="dropdown" class="btn btn-danger dropdown-toggle btn-status-alter" type="button" disabled><span class="glyphicon glyphicon-remove"></span> 取消</button>
                    <ul class="dropdown-menu dropdown-menu-right">
                        <li class="option-status-alter" data-val="正常"><a href="javascript:;">正常发货</a></li>
                        <li class="option-cancel-alter" data-val="取消发货"><a href="javascript:;"><span class="text-danger">取消发货</span></a></li>
                    </ul>
                </div>

                <!-- 待结算页面 -->
                <div class="btn-group btn-group-sm UnCostBtn">
                    <button class="btn btn-success btn-upload-ucfile" data-toggle="modal" data-target="#modal-upload-uc" type="button"><span class="glyphicon glyphicon-upload"></span> 上传流水单</button>
                </div>
    
            </div>
        </header>

        <ul class="nav nav-tabs">
            <li><a href="?Do=AllShip">全部</a></li>
            <li><a href="?Do=UnDistribution">待配货</a></li>
            <li><a href="?Do=UnPost">待交运</a></li>
            <li><a href="?Do=UnOutStock">待出库</a></li>
			<li><a href="?Do=OutStock">已出库</a></li>
            <li><a href="?Do=CutOff">截单</a></li>
            <li><a href="?Do=Cancel">取消</a></li>
            <li><a href="?Do=UnCost">待结算</a></li>
			<li><a href="?Do=UnTracking">无挂号</a></li>
        </ul>

        <div class="tab-content">
            <div class="tab-pane active">
                <form id="form-search" class="form-inline mg-t-10 mg-b-10" action="?">
                    <input class="do" type="hidden" name="Do" value="unpost">

                    <div class="form-group form-group-sm">
                        <select class="form-control" name="WID">
                            <option value="0" title="{Location}">全部仓库</option>
                            <!-- BEGIN 仓库列表 ATTRIB= -->
                            <option value="{DataID}" title="{Location}">[{Code}] {Name}</option>
                            <!-- END 仓库列表 -->
                        </select>
                    </div>
                    <div class="form-group form-group-sm">
                        <select class="form-control" name="FreightID"></select>
                    </div>

                    <div class="form-group form-group-sm">
                        <select class="form-control" name="WaybillType">
                            <option value="0">所有运单</option>
                            <option value="1">可合并运单</option>
                            <option value="2">可拆分运单</option>
                            <option value="" disabled="disabled">----------------------</option>
                            <option value="3">可执行方案</option>
                        </select>
                    </div>

                    <div class="btn-group btn-group-sm UnStock-panel">
                        <button data-toggle="dropdown" class="btn btn-default dropdown-toggle" type="button"><span class="glyphicon glyphicon-th-list"></span> 操作</button>
                        <ul class="dropdown-menu">
                            <li><a class="download-waybill" href="javascript:;">下载运单</a></li>
                            <li><a href="javascript:;">预报运单</a></li>
                            <li><a class="merge-waybill" href="javascript:;">合并运单</a></li>
                        </ul>
                    </div>

                    <div class="form-group">
                        <div id="selectDropdown" class="dropdown">
                            <label class="btn btn-default" style="height: 30px; width: 50px;" data-toggle="dropdown"></label>
                            <ul class="dropdown-menu pd-l-5 pd-r-5" style="min-width: 100%;">
                                <li><span data-val="0" class="btn btn-default uliHW"></span></li>
                                <li><span data-val="1" class="btn spC33 uliHW"></span></li>
                                <li><span data-val="2" class="btn spC9C uliHW"></span></li>
                                <li><span data-val="3" class="btn spF96 uliHW"></span></li>
                                <li><span data-val="4" class="btn spFF0 uliHW"></span></li>
                                <li><span data-val="5" class="btn sp3C3 uliHW"></span></li>
                                <li><span data-val="6" class="btn sp9CF uliHW"></span></li>
                                <li><span data-val="7" class="btn sp999 uliHW"></span></li>
                            </ul>
                        </div>
                    </div>

                    <div class="input-group input-group-sm">
                        <input type="text" class="form-control" placeholder="Search..." name="KeyWord">
                        <span class="input-group-btn">
                            <button class="btn btn-default" type="submit"><span class="glyphicon glyphicon-search"></span> 搜索</button>
                        </span>
                    </div>
                </form>
                <div>
                    <table class="table table-striped table-bordered table-hover table-condensed">
                        <thead>
                            <tr>
                                <th><label id="select-all"><input type="checkbox"> 全选</label></th>
                                <th>运单号</th>
                                <th class="war-stutes">发货仓库</th>
                                <th>货代</th>

                                <th>服务</th>
                                <th>售价</th>
                                <th>店铺</th>
                                
                                <th>买家ID</th>
                                <th>商品</th>
                                <th>地址</th>

                                <th>买家留言</th>
                                <th>状态</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- BEGIN 数据列表 ATTRIB= -->
                            <tr data-id="{DataID}" data-orderid="{OrderID}" data-tag="{Tag}">
                                <td>
                                    <label><input type="checkbox"></label>
                                    <div class="dropdown signDropdown">
                                        <label class="btn btn-default" style="height: 20px; width: 20px;" data-toggle="dropdown"></label>
                                        <ul class="dropdown-menu pd-l-5 pd-r-5" style="min-width: 100%;">
                                            <li><span data-val="0" class="btn btn-default uliHW"></span></li>
                                            <li><span data-val="1" class="btn spC33 uliHW"></span></li>
                                            <li><span data-val="2" class="btn spC9C uliHW"></span></li>
                                            <li><span data-val="3" class="btn spF96 uliHW"></span></li>
                                            <li><span data-val="4" class="btn spFF0 uliHW"></span></li>
                                            <li><span data-val="5" class="btn sp3C3 uliHW"></span></li>
                                            <li><span data-val="6" class="btn sp9CF uliHW"></span></li>
                                            <li><span data-val="7" class="btn sp999 uliHW"></span></li>
                                        </ul>
                                    </div>
                                </td>
                                <td class="orderID">{OrderID}</td>
                                <td class="warehouse-status"><i class="hidden">{Warehouse}</i></td>

                                <td>{Freight}</td>
                                <td>{Service}</td>
                                <td>{Amt} <span class="label currency">{Currency}</span></td>

                                <td>{Shop}</td>
                                <td>{Buyer}</td>
                                <td>{SKU}</td>

                                <td>{Address}</td>
                                <td>{BuyerMessage}</td>
                                <td class="waybill-status"><i class="hidden">{Status}</i></td>

                                <td>
                                    <a title="查看" href="?Do=EDIT&DataID={DataID}" target="_blank"><span class="text-success glyphicon glyphicon-eye-open"></span></a>
                                    &nbsp;&nbsp;
                                    <a class="stock-post" title="配货交运" href="javascript:;" ><span class="glyphicon glyphicon-qrcode"></span></a>
                                    &nbsp;&nbsp;
                                    <span data-toggle="modal" class="glyphicon glyphicon-fullscreen poi" style="color: rgb(255, 73, 18);" title="拆单"></span>
                                </td>
                            </tr>
                            <!-- END 数据列表 -->
                        </tbody>
                        <tfoot><tr><td colspan="13"></td></tr></tfoot>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!-- 配货交运-->
    <div id="Stock-Post" class="modal fade" tabIndex="-1">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <form class="form-horizontal" method="post" action="javascript:;">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                        <h4 class="modal-title">配货交运 <small class="orderID"></small><small class="buyer"></small></h4>
                    </div>
                    <div class="modal-body">
                        <table class="table table-hover table-bordered table-condensed table-striped mg-b-0">
                            <tbody>
                                <tr>
                                    <td><select class="form-control input-sm" name="Wrehouse"></select></td>
                                    <td><select class="form-control input-sm" name="Freight"></select></td>
                                    <td colspan="2"><select class="form-control input-sm" name="Service" id="Service"></select></td>
                                </tr>
                                <tr>
                                    <th>国家</th>
                                    <th>留言</th>
                                    <th>期望物流</th>
                                    <th>价格</th>
                                </tr>
                                <tr>
                                    <td class="state"></td>
                                    <td class="text-danger BuyerMessage"></td>
                                    <td class="ShippingService"></td>
                                    <td class="AmountPaid"></td>
                                </tr>
                            </tbody>
                        </table>

                        <div id="product" class="maxH400 mg-t-20"></div>
                        <hr />
                        <div id="remark" class="maxH300 mg-t-10">
                            <label>备注</label>
                            <table class="table table-striped table-condensed">
                                <tbody></tbody>
                            </table>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" data-guide="-1" class="btn btn-default pull-left btn-flag">上一个</button>
                        <button type="button" data-guide="1" class="btn btn-default pull-left btn-flag">下一个</button>
                        <button type="button" class="btn btn-danger btn-xs btn-cancel-stock">取消选择库存</button>
                        <button type="submit" class="btn btn-primary">提交</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- 商品拆分 -->
    <div id="modal-split" class="modal fade" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button class="close" type="button" data-dismiss="modal">x</button>
                    <h4 class="modal-title">商品拆分<small></small></h4>
                </div>
                <div class="modal-body">
                    <form action="javascript:;" class="form-horizontal">
                        <div class="form-group">
                            <div class="col-sm-12 goodsList maxH300"></div>
                        </div>

                        <hr>
                            <div class="row">
                                <div class="parcelList col-sm-10 maxH200">
                                    <table class="table table-hover table-bordered table-condensed table-striped">
                                        <thead>
                                            <th>包裹</th>
                                            <th>商品名</th>
                                            <th>数量</th>
                                        </thead>
                                        <tbody></tbody>
                                    </table>
                                </div>
                                <div class="col-sm-2">
                                    <button id="packBtn" type="button" class="btn btn-default btn-xs mg-b-5 mg-r-5">打包</button>
                                    <button id="reBtn" type="button" class="btn btn-default btn-xs">再玩一次！</button>
                                </div>
                            </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default submitBtn">提交</button>
                </div>
            </div>
        </div>
    </div>

    <!-- 上传文件模态框-->
    <div id="modal-upload" class="modal fade" tabIndex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <form  class="form-horizontal" method="post" action="/Logistics/Logistics.aspx?Do=LogisticsUpload" enctype="multipart/form-data">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                        <h4 class="modal-title">上传物流单</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group form-group-sm">
                            <div class="col-sm-6">
                                <select id="upload-wid" class="form-control" name="WID"></select>
                            </div>
                            <div class="col-sm-6">
                                <select id="upload-fid" class="form-control" name="FreightID"></select>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-12">
                                <input class="form-control-static" type="file" id="logisticsUpload" name="StrFile" accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/octet-stream, application/vnd.ms-excel" value="上传物流单">
                            </div>
                            <div class="col-sm-12">
                                <p class="help-block">
                                    <strong class="text-info">提示：</strong><a href="##">请点击这里下载Excel模板。</a>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                        <button type="button" class="btn btn-primary submit">确定</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- 上传流水文件模态框-->
    <div id="modal-upload-uc" class="modal fade" tabIndex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <form  class="form-inline" method="post" action="/Logistics/Logistics.aspx?Do=LogisticsUpload" enctype="multipart/form-data">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                        <h4 class="modal-title">上传流水单</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group form-group-sm">
                            <select id="modal-freight" class="form-control" name="FreightID"></select>
                        </div>
                        <div class="form-group">
                            <input class="form-control-static" type="file" id="ucUpload" name="StrFile" accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/octet-stream, application/vnd.ms-excel" value="上传物流单">
                        </div>
                        <div class="form-group">
                            <div class="col-sm-12">
                                <p class="help-block">
                                    <strong class="text-info">提示：</strong><a href="##">请点击这里下载Excel模板。</a>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                        <button type="button" class="btn btn-primary submit">确定</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <template id="temp-strok-post-sku">
        {{#Product}}
        <div class="item mg-b-20" data-id="{{SkuID}}" data-sum="{{Quantity}}">
            <h5 class="name" title="{{SKU}}">{{Name}} * {{Quantity}}
                <small class="pd-l-20 text-info">{{Size}}cm<sup>3</sup> <span class="pd-l-20 text-success">{{Weight}}g</span></small>
            </h5>
            <hr class="mg-t-0 mg-b-5">
        </div>
        {{/Product}}
    </template>

    <template id="temp-strok-mess">
        {{#Product}}
         <div class="row mg-b-5">
             <div class="col-sm-1">
                 <input type="checkbox" id="{{DataID}}">
             </div>
             <div class="col-sm-4" title="{{SKU}}">
                 <label for="{{DataID}}">{{Name}}</label>
             </div>
             <div class="col-sm-1 text-muted">
                 {{Size}}
             </div>
             <div class="col-sm-1 text-muted">
                 {{Weight}}g
             </div>
             <div class="col-sm-2 text-muted">
                 {{InsideNo}}
             </div>
             <div class="col-sm-2">
                 <input class="form-control input-sm" type="text" value="0">
             </div>
             <div class="col-sm-1 stock">{{Quantity}}</div>
         </div>
        {{/Product}}
    </template>

    <!-- 仓库-->
    <template id="temp-wrehouse">
        {{#DataList}}
        <option value="{{DataID}}">{{Code}}</option>
        {{/DataList}}
    </template>

    <!-- 货代-->
    <template id="temp-freight">
        {{#DataList}}
        <option value="{{DataID}}">{{Code}}</option>
        {{/DataList}}
    </template>

    <!-- 物流方式-->
    <template id="temp-service">
        {{#Service}}
        <option value="{{DataID}}">[{{Code}}] {{Name}}</option>
        {{/Service}}
    </template>

    <!-- 买家留言与备注模板-->
    <template id="temp-remark">
        {{#Message}}
        <tr>
            <td>
                <input type="hidden" id="UID" name="UID" value="{{UID}}" />
                <input type="hidden" id="DataID" name="DataID" value="{{DataID}}" />
                <span>{{Remark}}</span>&nbsp;&nbsp;
                <span style="font-size: 14px;color: #929292;">By：{{UserName}}</span>&nbsp;&nbsp;<i style="font-size: 14px;color: #929292;">{{Date}}</i>
            </td>
        </tr>
        {{/Message}}
    </template>

    {页面底部}{/页面底部}

    <script src="/Resource/js/Logistics.js"></script>
    <script src="/Resource/js/mustache.js"></script>

    <script>
        (function () {
            'use strict';

            var arrWrehouse,
                $dataList = $('#data-list'),
                $modalStockPost = $('#Stock-Post'),
                $formStockPost = $modalStockPost.find('form'),
                htmlWrehouse = $('#temp-wrehouse').html(),
                htmlStrokMess = $('#temp-strok-mess').html(),
                $wrehouse = $formStockPost.find('select[name="Wrehouse"]'),
                htmlStrokPost = $('#temp-strok-post-sku').html(),
                $freight = $formStockPost.find('select[name="Freight"]'),
                htmlFreight = $('#temp-freight').html(),
                $service = $('#Service'),
                htmlService = $('#temp-service').html(),
                $tagTransaction = $modalStockPost.find('#product'),
                freightList,
                oParam = common.URL.parse(),
                $formSearch = $('#form-search'),
                $remark = $('#remark'),
                tempRemark = $('#temp-remark').html();

            // 初始化页面
            $formSearch.find('.do').val(oParam.Do);
            $formSearch.find('input[type="text"]').val(decodeURI((oParam.KeyWord || '').replace(/\++/g, ' ')));

            // 颜色筛选
            (function(){
                var colorStyle = ['btn-default', 'spC33', 'spC9C', 'spF96', 'spFF0', 'sp3C3', 'sp9CF', 'sp999'],
                    $selDD = $('#selectDropdown');

                // 列表颜色标签初始化
                $dataList.find('tbody tr').each(function(){
                    var ts = $(this);
                    ts.find('label.btn').attr('class', 'btn ' + colorStyle[ts.data('tag')]);
                });

                // 查询按钮颜色初始化
                if (oParam.Tag) {
                    $selDD.find('label').attr('class', 'btn ' + colorStyle[oParam.Tag]);
                } else {
                    $selDD.find('label').attr('class', 'btn ' + colorStyle[0]);
                }

                // 颜色查询按钮样式设置和添加掩藏传值标签
                $selDD.find('.uliHW').on('click', function(){
                    var ts = $(this);
                    $selDD.find('label').attr('class', ts.attr('class'));
                    $formSearch.find('input[name="Tag"]').remove().end().append('<input type="hidden" name="Tag" value="' + ts.data('val') + '">');
                });

                // 订单标记颜色绑定事件
                $('.signDropdown .uliHW').on('click', function(){
                    var ts = $(this);
                    $.ajax({
                        url: '/Logistics/API/?Do=SetTag',
                        type: 'post',
                        data: {
                            DataID: ts.closest('tr').data('id'),
                            Tag: ts.data('val')
                        }
                    });
                    ts.closest('.signDropdown').find('label').attr('class', ts.attr('class'));
                });
            })();

            // 上传物流单
            (function(){
                var $modalUpload = $('#modal-upload'),
                    $submitBtn = $modalUpload.find('.modal-footer .submit');
                $submitBtn.on('click', function(){
                    common.ajaxFE({
                        URL: '/Logistics/Logistics.aspx?Do=LogisticsUpload',
                        type: 'post',
                        FE: 'logisticsUpload',
                        data: {
                            WID: $('#upload-wid').val(),
                            FreightID: $('#upload-fid').val()
                        },
                        ok: function(data){
                            if (data.Ack) {
                                common.alert({
                                    type: 'success',
                                    title: '上传物流单',
                                    msg: '成功。系统反馈：' + data.Message
                                });
                            } else {
                                common.alert({
                                    title: '上传物流单',
                                    msg: '失败。系统反馈：' + data.LogError
                                });
                            }
                        }
                    });
                });

            })();

            // 上传流水单
            (function(){
                var $UnCostBtn = $('#UnCostBtn'), //流水单按钮div
                    $btnUcfile = $('.btn-upload-ucfile'), //打开上传流水模态框按钮
                    $modalUC = $('#modal-upload-uc'), //上传模态框
                    $modalfreight = $('#modal-freight'); //下拉列表
                    
                //打开模态框获取货代数据
                $btnUcfile.on('click', function(){
                    $.ajax({
                        url: '/Logistics/Logistics.aspx?Do=FreightAll',
                        dataType: 'json',
                        type: 'get',
                        success: function(data){
                            $modalfreight.html(Mustache.render(htmlFreight, data));
                        }
                    });
                });

                //提交数据
                $modalUC.on('click', '.modal-footer .submit', function(){
                    common.ajaxFE({
                        URL: '/Logistics/Logistics.aspx?Do=LogisticsCost',
                        title: '上传物流单',
                        dataType: 'json',
                        type: 'post',
                        FE: 'ucUpload',
                        data: {
                            FreightID: $modalfreight.val()
                        },
                        ok: function(data){
                            console.log(data);
                            if (data.Ack) {
                                common.alert({
                                    type: 'success',
                                    title: '上传流水单',
                                    msg: '成功。系统反馈：' + data.Message,
                                    cb: function(){
                                        location.reload();
                                    }
                                });
                            } else {
                                common.alert({
                                    title: '上传流水单',
                                    msg: '失败。系统反馈：' + data.LogError
                                });
                            }
                        }
                    });
                });
                
            })();

            // 获取单条数据
            function getSingleData(guide) {
                common.ajax({
                    notload: true,
                    title: '获取单条数据',
                    URL: '/Logistics/Logistics.aspx?Do=LogisticsQuery&Guide=' + guide + '&DataID=' + $modalStockPost.data('id'),
                    good: function(data) {
                        $modalStockPost.data('id', data.DataID);
                        initStockPost(data);
                        
                        // 获取备注信息
                        $remark.find('tbody').html(""); // 每次打开清空记录
                        $.each(data.Order, function(i, val){
                            $.ajax({
                                url: '/OMS/Order.aspx?Do=Query&DataID=' + val.OID,
                                dataType: 'json',
                                type: 'get',
                                success: function(data){
                                    var mes = data.DataList[0];
                                    $remark.find('tbody').append(Mustache.render(tempRemark, mes));
                                }
                            });
                        });
                    }
                });

            }

            // 获取仓库货代
            function getFreight(id, cb) {
                common.ajax({
                    title: '获取货代服务',
                    URL: '/Logistics/Logistics.aspx?Do=ServiceList&DataID=' + id,
                    good: function (data) {
                        cb(data);
                    }
                });
            }

            // 初始化配货交运面板
            function initStockPost(data) {
                // 基本信息
                var product = data.Product,
                    i = 0, len = product.length,
                    pIDs = '',
                    logistics = data.Logistics;
                $modalStockPost.find('.state').text(data.Address.ShipToCountry);
                $modalStockPost.find('.ShippingService').text(data.Order[0].ShippingService);
                $modalStockPost.find('.AmountPaid').text(data.Order[0].Currency + data.Order[0].AmountPaid);
                $modalStockPost.find('.BuyerMessage').html(data.Order[0].BuyerCheckoutMessage);
                $modalStockPost.find('.orderID').text(logistics.OrderID);
                $modalStockPost.find('.buyer').text(' [' + logistics.Buyer + ']');

                // 配货交运单号高亮
                common.Rendering.order($modalStockPost);

                // 仓库
                $wrehouse.html(Mustache.render(htmlWrehouse, arrWrehouse));

                // SKU
                $modalStockPost.find('.auto-append').remove();
                $tagTransaction.html(Mustache.render(htmlStrokPost, data));

                // 货代与服务
                $modalStockPost.data('FreightID', logistics.FreightID);
                $modalStockPost.data('FreightServiceID', logistics.FreightServiceID);

                // 获取产品库存
                for (; i < len; i++) {
                    pIDs += ',' + product[i].SkuID;
                }

                // 产品对应的库存信息
                common.ajax({
                    notload: true,
                    title: '获取产品库存',
                    URL: '/Logistics/Logistics.aspx?Do=GetStockBySkuIDs',
                    type: 'post',
                    data: {
                        DataID: pIDs.substr(1)
                    },
                    good: function(data) {
                            var i = 0,
                            dataList,
                            len = data.DataList.length,
                            stock = data.Stock[0],
                            meet = true; // 默认库存满足产品个数

                        for (; i < len; i++) {
                            // 排序
                            dataList = data.DataList[i];
                            dataList.Product = dataList.Product.sort(function(a, b) {
                                return a.Quantity - b.Quantity;
                            });

                            $tagTransaction.find('.item[data-id="' + dataList.SkuID + '"]').append(Mustache.render(htmlStrokMess, dataList));
                        }

                        // 自动选择库存
                        $tagTransaction.find('.item').each(function() {
                            var $this = $(this),
                                sum = +$this.data('sum'),
                                $row = $this.find('.row'),
                                count = 0;

                            $row.each(function() {
                                count += +$(this).find('.stock').text();
                            });

                            if (sum > count) {
                                return meet = false;
                            }
                        });

                        // 满足时帮忙勾上库存编码
                        if (meet) {
                            autoSelect();
                        }

                        // 是否有推荐库存
                        if (stock) {
                            $wrehouse.find('option[value="' + stock.WID + '"]').text(stock.Code + ' [' + stock.Quantity + ']');
                        }

                        // 智能判断仓库
                        if (logistics.WID) {
                            $wrehouse.find('option[value="' + logistics.WID + '"]').prop('selected', true);
                        } else if (stock) {
                            $wrehouse.find('option[value="' + stock.WID + '"]').prop('selected', true);
                        }

                        $wrehouse.change();
                    }
                });

                $modalStockPost.modal('show');
            }

            // 自动选择库存
            function autoSelect() {
                $tagTransaction.find('.item').each(function() {
                    var $this = $(this),
                        sum = +$this.data('sum'),
                        $row = $this.find('.row'),
                        count = 0;

                    $row.each(function() {
                        var $that = $(this),
                            $inputText = $that.find('input[type="text"]'),
                            $inputCheckbox = $that.find('input[type="checkbox"]'),
                            max = +$that.find('.stock').text();

                        // 库存大于总数，并且count为0
                        if (max >= sum && !count) {
                            $inputText.val(sum);
                            $inputCheckbox.prop('checked', true);
                            return false;

                        } if (count + max <= sum) {
                            $inputText.val(max);
                            $inputCheckbox.prop('checked', true);

                        } else {
                            $inputText.val(sum - count).change();
                            $inputCheckbox.prop('checked', true);
                            return false;
                        }
                    });
                });
            }

            
            // 获取产品选择的库存与数量
            function getStockData() {
                var stock = [];

                $tagTransaction.find('.item input[type="checkbox"]:checked').each(function() {
                    var $this = $(this);

                    stock.push({
                        SKUID: $this.closest('.item').data('id'),
                        StockID: $this.attr('id'),
                        Quantity: $this.closest('.row').find('input[type="text"]').val()
                    });
                });

                return stock;
            }

            switch(oParam.Do) {
                case 'UnDistribution':
                    $dataList.find('.UnStock-panel').remove();
                    $dataList.find('.UpPost-panel').remove();

                    // 配货交运
                    $dataList.on('click', '.stock-post', function() {
                        var $this = $(this).closest('tr'),
                            id = $this.data('id');
                        
                        $modalStockPost.data('id', id);

                        // 获取所有仓库信息
                        if (!arrWrehouse) {
                            common.ajax({
                                notload: true,
                                title: '获取所有仓库信息',
                                URL: '/Logistics/Logistics.aspx?Do=List',
                                good: function (data) {
                                    arrWrehouse = data;
                                    getSingleData(0);
                                }
                            });
                            return;
                        }

                        getSingleData(0);
                    });

                    // 选择仓库获取货代
                    $wrehouse.on('change', function () {
                        getFreight($(this).val(), function(data) {
                            freightList = data.DataList;
                            $freight.html(Mustache.render(htmlFreight, data));

                            // 是否有默认货代
                            if ($modalStockPost.data('FreightID')) {
                                $freight.find('option[value="' + $modalStockPost.data('FreightID') + '"]').prop('selected', true);    
                            }

                            $freight.change();
                        });
                    });

                    // 选择货代获取服务
                    $freight.on('change', function () {
                        var id = $(this).val(),
                            i = 0, len = freightList.length,
                            obj;
                        for(; i < len; i++) {
                            obj = freightList[i];
                            if (obj.DataID === +id) {
                                $service.html(Mustache.render(htmlService, obj));
                                // 是否有默认服务
                                if ($modalStockPost.data('FreightServiceID')) {
                                    $service.find('option[value="' + $modalStockPost.data('FreightServiceID') + '"]').prop('selected', true);    
                                }
                                return;
                            }
                        }
                    });

                    // 提交配货交运
                    $formStockPost.on('submit', function() {
                        // 检测数量不能超过发货数量、可以少于
                        var validate = true,
                            lis = '';
                        $tagTransaction.find('.item').each(function() {
                            var $this = $(this),
                                sum = +$this.data('sum'),
                                $stock = $this.find('input[type="checkbox"]:checked').closest('.row'),
                                count = 0;

                            $stock.each(function() {
                                count += +$(this).find('input[type="text"]').val();
                            });

                            if (sum < count) {
                                lis += '<li>' + $this.find('.name').text() + '</li>';
                            }
                        });

                        if (lis) {
                            common.alert({
                                title: '“提交配货交运”操作：',
                                msg: '以下产品发货数量超额：<ol>' + lis + '</ol>',
                                time: 10 * 1000
                            });
                        } else {
                            common.ajax({
                                title: '提交配货交运',
                                URL: '/Logistics/Logistics.aspx?Do=Stock',
                                type: 'post',
                                data: JSON.stringify({
                                    DataID: $modalStockPost.data('id'),
                                    WID: $wrehouse.val(),
                                    FreightServiceID: $service.val(),
                                    Stock: getStockData()
                                }),
                                good: function(data) {
                                    common.alert({
                                        type: 'success',
                                        title: '“提交配货交运”操作：',
                                        msg: data.Message || '成功！',
                                        time: 1000,
                                        cb: function() {
                                            getSingleData(1);
                                        }
                                    });
                                }
                            });
                        }
                    });

                    // 限制数量不能超过库存
                    $tagTransaction.on('change', 'input[type="text"]', function() {
                        var $this = $(this),
                            max = +$this.closest('div').next().text(),
                            val = $this.val().replace(/[^\d]+/g, '') || 1,
                            val = val > max ? max : val;
                        $this.val(val);
                    });

                    // 下一个与上一个
                    $modalStockPost.find('.btn-flag').on('click', function () {
                        getSingleData($(this).data('guide'));
                    });

                    // 取消选择库存
                    $modalStockPost.find('.btn-cancel-stock').on('click', function() {
                        $tagTransaction.find('input[type="checkbox"]').prop('checked', false);
                    });

                    // 执行方案
                    (function(){
                        var tempArr = [],
                            timeNum = 0;
                        $('header .execute-panel').on('click', function(){
                            if ($dataList.find('input:checked').length < 1) {
                                getArr(1);
                            } else {
                                getArr(0);
                            }
                        });

                        function getArr(num){
                            tempArr = [];
                            var temp = num === 1 ? 'input' : 'input:checked';
                            $dataList.find('tbody ' + temp).each(function(i){
                                tempArr[i] = $(this).closest('tr').data('id');
                            });
                            successively();
                        }

                        function successively(){
                            $.ajax({
                                url: '/Logistics/API/?Do=ProjectExecute',
                                type: 'post',
                                dataType: 'json',
                                data: { DataID: tempArr[timeNum] },
                                success: function(data){
                                    if (timeNum < tempArr.length - 1 && data.Ack) {
                                        timeNum++;
                                        setTimeout(successively, 100);
                                    } else if (timeNum === tempArr.length - 1 && data.Ack) {
                                        common.alert({
                                            type: 'success',
                                            title: '执行方案',
                                            msg: '完成，反馈信息：' + data.Message
                                        });
                                    } else {
                                        common.alert({
                                            title: '执行方案',
                                            msg: '出错，反馈信息：' + data.Message
                                        });
                                    }
                                }
                            });
                        }
                    })();

                    // 拆包
                    (function(){
                        var $modalSplit = $('#modal-split'), //拆包模态框
                            $goodsList = $modalSplit.find('.goodsList'), //商品列表
                            $parcelList = $modalSplit.find('.parcelList'), //包裹列表
                            $packBtn = $modalSplit.find('#packBtn'), //打包按钮
                            $reBtn = $modalSplit.find('#reBtn'), //拆包按钮
                            $submitBtn = $modalSplit.find('.submitBtn'), //提交按钮
                            $parTable = $parcelList.find('tbody'), //包裹表格
                            tempJSON = {}; //初始化JSON
                            
                        // 点击列表页的拆分按钮
                        $dataList.find('.glyphicon-fullscreen').on('click', function(){
                            $modalSplit.modal('show'); // 显示面板
                            // 初始化面板
                            var DID = $(this).closest('tr').data('id');
                            getData(DID);

                        });

                        //获取数据初始化面板
                        function getData(DID){
                            $.ajax({
                                url: '/Logistics/Logistics.aspx?Do=LogisticsQuery&Guide=0&DataID=' + DID,
                                type: 'get',
                                dataType: 'json',
                                success: function(data){
                                    var d = data;
                                    tempJSON = {}; //初始化JSON
                                    tempJSON.DataList = []; //初始化商品数组
                                    $goodsList.empty();
                                    $parTable.empty();
                                    $modalSplit.find('.modal-title small').text(' ' + d.Logistics.OrderID);
                                    $modalSplit.attr('data-orderID', d.Logistics.OrderID);
                                    $modalSplit.attr('data-dataID', d.DataID);
                                    tempJSON.OrderID = d.Logistics.OrderID; //JSON数据里orderID

                                    // 同一商品有多件拆开显示
                                    $.each(d.Product, function(index, tar){
                                        for(var i = 0; i < tar.Quantity; i++){
                                            $goodsList.append('<div class="checkbox"><label><input data-sid="' + tar.SkuID + '" type="checkbox">' + tar.Name + '</label></div>');
                                        }
                                    });
                                }
                            });
                        }

                        // 打包按钮
                        $packBtn.on('click', function(){
                            // 如果没有选择，则默认为全选
                            if ($goodsList.find('input:checked').length < 1) {
                                assVal($goodsList.find('input[type="checkbox"]'), 1);
                            }else{
                                assVal($goodsList.find('input:checked'), 1);
                            }
                        });

                        // 组装数据方案封装 target=要遍历的选项（全部/被选中） par=是否执行添加到包裹表格（0=否，1=是）
                        function assVal(target, par){
                            var len = tempJSON.DataList.length;
                            tempJSON.DataList[len] = [];

                            // 遍历选项
                            target.each(function(){
                                var leng = tempJSON.DataList[len].length,
                                    num;

                                // 如果产品数组不为空，则遍历判断是否有重复
                                if (leng > 0) {
                                    // 循环判断是否有重复，如有就数量+1，并且给num赋值
                                    for(var i = 0; i < leng; i++){
                                        if (tempJSON.DataList[len][i].SkuID === $(this).data('sid')) {
                                            tempJSON.DataList[len][i].Quantity++;
                                            num = 1;
                                        }
                                    }
                                    if (num !== 1) {
                                        tempJSON.DataList[len].push({ 'SkuID' : $(this).data('sid'), 'Name' : $(this).closest('label').text(), 'Quantity' : 1});
                                    }
                                } else {
                                    // 如果没有数据，就添加一条
                                    tempJSON.DataList[len][0] = { 'SkuID' : $(this).data('sid'), 'Name' : $(this).closest('label').text(), 'Quantity' : 1};
                                }
                            }); // 遍历选项-- END

                            // 判断是否执行打包
                            if (par === 1) { addPack(target);}

                        } // 组装数据方案封装 -- END

                        // 商品打包
                        function addPack(target){

                            // 包裹处理
                            var len = tempJSON.DataList.length,
                                leng = tempJSON.DataList[len - 1].length;
                            $.each(tempJSON.DataList[len - 1], function(i, k){
                                // 如果为第一条记录则添加rowspan
                                if (i === 0) {
                                    $parTable.append('<tr><td rowspan="' + leng + '">包裹 - ' + len + '</td><td>' + k.Name + '</td><td>' + k.Quantity + '</td></tr>');
                                } else {
                                    $parTable.append('<tr><td>' + k.Name + '</td><td>' + k.Quantity + '</td></tr>');
                                }
                            });

                            // 商品列表处理
                            target.closest('label').remove(); // 已经被打包的就移除

                            //重新来过按钮
                            $reBtn.on('click', function(){
                                var DID = $modalSplit.attr('data-dataID'); // 获取初始化面板所用DataID
                                getData(DID); // 初始化面板
                            });
                        }

                        // 提交数据
                        $submitBtn.on('click', function(){
                            // 如果提交时，还有商品未选择，则打包成一个
                            if ($goodsList.find('input[type="checkbox"]').length > 0) {
                                assVal($goodsList.find('input[type="checkbox"]'), 0);
                            };

                            $.ajax({
                                url: '/Logistics/Logistics.aspx?Do=LogisticsUnpack',
                                type: 'post',
                                dataType: 'json',
                                data: JSON.stringify(tempJSON),
                                success: function(data){
                                    if (data.Ack) {
                                        common.alert({
                                            type: 'success',
                                            title: '拆单',
                                            msg: '成功，后台反馈：' + data.Message,
                                            cb: function(){
                                                $modalSplit.modal('hide'); // 关闭面板
                                            }
                                        });
                                    } else {
                                        common.alert({
                                            title: '拆单',
                                            msg: '失败，后台反馈：' + data.Message
                                        });
                                    }
                                    
                                }
                            });
                        });

                    })();
                    
                break;

                case 'UnPost':
                    $dataList.find('.default-panel').remove();
                    $dataList.find('.UpPost-panel').remove();
                    $dataList.find('.execute-panel').remove();

                    // 下载运单
                    $('.download-waybill').on('click', function() {
                        var id = $w.val();
                        if (!+id) {
                            common.alert({
                                title: '“下载运单”操作：',
                                msg: '请先指定仓库与货代！'
                            });
                            return;
                        }

                        common.ajax({
                            title: '下载运单',
                            URL: '/Logistics/Logistics.aspx?Do=LogisticsDownload',
                            type: 'post',
                            data: {
                                DataID: common.getChecked($dataList.find('tbody'), 'tr', 'data-id') || undefined,
                                WID: id,
                                FreightID: $f.val()
                            },
                            good: function(data) {
                                location.href = data.File;
                            },
                            bad: function(data) {
                                if (data.File) {
                                    location.href = data.File;
                                }
                            }
                        });
                    });

                    // 合并运单
                    $('.merge-waybill').on('click', function() {
                        var id = $w.val();
                        if (!+id) {
                            common.alert({
                                title: '“合并运单”操作：',
                                msg: '请先指定仓库与货代！'
                            });
                            return;
                        }

                        common.ajax({
                            title: '合并运单',
                            URL: '/Logistics/Logistics.aspx?Do=LogisticsMerged',
                            type: 'post',
                            data: {
                                DataID: common.getChecked($dataList.find('tbody'), 'tr', 'data-id') || undefined,
                                WID: id,
                                FreightID: $f.val(),
                                WaybillType: $waybill.val()
                            },
                            good: function(data) {
                                location.reload();
                            }
                        });
                    });
                break;

                case 'UnOutStock':
                    $dataList.find('.UnStock-panel').remove();
                    $dataList.find('.default-panel').remove();
                    $dataList.find('.execute-panel').remove();
                break;

                case 'OutStock':
                    $dataList.find('.UnStock-panel').remove();
                    $dataList.find('.default-panel').remove();
                    $dataList.find('.execute-panel').remove();
                break;

                default:
                    $dataList.find('.UnStock-panel').remove();
                    $dataList.find('.UpPost-panel').remove();
                    $dataList.find('.execute-panel').remove();
                break;
            }

            var $w = $formSearch.find('select[name="WID"]'),
                $f = $formSearch.find('select[name="FreightID"]'),
                $waybill = $formSearch.find('select[name="WaybillType"]'),
                $upW = $('#modal-upload #upload-wid'),
                $upF = $('#modal-upload #upload-fid');

            // 公共部分
            // 选择仓库获取货代
            $w.on('change', function() {
                var wid = $(this).val();
                if (!+wid) {
                    $f.html('');
                    return;
                }

                getFreight(wid, function(data) {
                    $f.html(Mustache.render(htmlFreight, data));
                    if (oParam.FreightID) {
                        $f.find('option[value="' + oParam.FreightID + '"]').prop('selected', true);
                    }
                });
            });

            // 上传附件
            $('.btn-upload-file').on('click', function() {
                if (!arrWrehouse) {
                    common.ajax({
                        notload: true,
                        title: '获取所有仓库信息',
                        URL: '/Logistics/Logistics.aspx?Do=List',
                        good: function (data) {
                            arrWrehouse = data;
                            $upW.html(Mustache.render(htmlWrehouse, arrWrehouse)).change();
                        }
                    });
                }
            });
            $upW.on('change', function() {
                getFreight($(this).val(), function(data) {
                    $upF.html(Mustache.render(htmlFreight, data));
                });
            });

            // 取消发货按钮，一次只能取消一条订单
            var $btnChangeStatus = $dataList.find('header .btn-status-alter'),
                $optionChangeCencel = $dataList.find('header .option-cancel-alter'),
                checkedLen;
                
            $dataList.find('tbody').on('change', 'input[type="checkbox"]', function() {
                checkedLen = $dataList.find('tbody input[type="checkbox"]:checked').length;
            });

            $optionChangeCencel.on('click', function(){
                if(checkedLen > 1){
                    alert("为防止误操作，[取消发货]只能单个操作");
                    return;
                }
                var OrderID = $dataList.find('tbody input[type="checkbox"]:checked').closest('tr').data('orderid');
                common.ajax({
                    title: '取消发货',
                    URL: '/Logistics/Logistics.aspx?Do=Cancel&OrderID=' + OrderID,
                    good: function(data){
                        common.alert({
                            type: 'success',
                            title: '“取消发货”操作：',
                            msg: (data.Message || '成功！') + '<br>3秒后自动刷新！',
                            cb: function () {
                                location.reload();
                            }
                        });
                    }
                });
            });
            
            // 初始化
            (function() {
                // 获取页面是否有仓库与货代筛选条件
                if (oParam.WID) {
                    $w.find('option[value="' + oParam.WID + '"]').prop('selected', true);
                }

                $waybill.find('option[value="' + oParam.WaybillType + '"]').prop('selected', true);
                $w.change();

                // 设置运单状态
                $dataList.find('.waybill-status').each(function() {
                    var $this = $(this);
                    $this.html(common.order.setWaybillStatus($this.text())); 
                });

                //设置仓库颜色
                $dataList.find('.warehouse-status').each(function(){
                    var $this = $(this);
                    $this.html(common.order.setWarehouse($this.text()));
                });

                // 运单号时间高亮
                common.Rendering.order($dataList);

                //Packstation packstation Postnummer三个地址字段加上背景色
                $dataList.find('tbody tr').each(function(){
                    var ts = $(this),
                        add = ts.find('td:eq(9)').text();
                    ts.find('td:eq(9)').html(add.replace(/(Packstation|packstation|Postnummer)/, '<span class="bg-primary">$1</span>'));

                });
            }());

            <!-- BEGIN 分页脚本 ATTRIB= -->
            common.showPage({当前页}, {总条数}, {每页条数});
            <!-- END 分页脚本 -->
        }());
    </script>
</body>
</html>
