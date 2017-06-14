{页面属性}{/页面属性}
<body>
    {页顶导航}{/页顶导航}
    <!-- 内容-->
    <div id="data-list" class="container-fluid">
       <header>
            <div class="btn-group btn-group-sm pull-right">
                <button id="btn-batch" class="btn btn-default btn-sm" data-toggle="modal" data-target="#edit-status" disabled="disabled"> 批量修改[执行/停止][0]</button>
                <button type="button"  class="btn btn-default" data-target="#newPrecept" data-toggle="modal">新建方案</button>
            </div>
        </header>
        <form action="" method="post">
                <div id="selectProduct" class="form-group">
                    <div class="input-group input-group-sm col-sm-4 col-lg-4">
                        <input type="text" class="form-control" placeholder="Search..." name="KeyWord">
                        <span class="input-group-btn">
                            <button class="btn btn-default" type="submit"><span class="glyphicon glyphicon-search"></span> 搜索</button>
                        </span>
                    </div>
                </div>
        </form>
        <form action="javascript:;" class="form-inline mg-b-10">
            <div class="form-group">
                <div id="common-sreach" class="form-group"></div>
                <button id="scheme-config" type="button" class="btn btn-default btn-sm">配置</button>
            </div>
        </form>
        
        <form id="status-upload" method="post" action="javascript:;">
            <div class="maxH800">
               <table class="table table-striped table-bordered table-hover table-condensed">
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
                   </colgroup>
                   <thead>
                        <tr>
                            <th><input type="checkbox" id="callAll" value="none">&nbsp;&nbsp;全选</th>
                            <th>物流方案</th>
                            <th>产品</th>
                            <th>目的地</th>
                            <th>仓库</th>
                            <th>货代</th>
                            <th>服务</th>
                            <th>状态</th>
                            <th>创建时间</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- BEGIN 数据列表 ATTRIB= -->
                        <tr data-val="{DataID}">
                            <td><input data-DataID="{DataID}" type="checkbox" name="Status">&nbsp;&nbsp;{DataID}</td>
                            <td>{OrderID}</td>
                            <td>{SkuID}&nbsp;&nbsp;{ProductName}</td>
                            <td>{country}</td>
                            <td>{WarehouseName}</td>
                            <td>{FreightName}</td>
                            <td>{Service}</td>
                            <td>{Status}</td>
                            <td>{Date}</td>
                            <td><span class="glyphicon glyphicon-eye-open poi"></span></td>
                        </tr>
                        <!-- END 数据列表  -->
                    </tbody>
                    <tfoot><tr><td colspan="10"></td></tr></tfoot>
                </table>
            </div>
        </form>
    </div>

    <!-- 状态修改 -->
    <div id="edit-status" class="modal fade" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button class="close" type="button" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">选择一个状态</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">状态</label>
                        <div class="col-sm-10">
                            <label class="radio-inline"><input type="radio" name="Status" value="停止" checked="checked">停止执行</label>
                            <label class="radio-inline"><input type="radio" name="Status" value="执行">允许执行</label>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button id="edit-confirm" class="btn btn-danger" data-dismiss="modal">确定</button>
                </div>
            </div>
        </div>
    </div>

    <!-- 新建方案模态框 -->
    <div class="modal fade" id="newPrecept" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button class="close" type="button" data-dismiss="modal">x</button>
                    <h4 class="modal-title">物流方案</h4>
                </div>
                <div class="modal-body">
                    <form action="javascript:;" class="form-horizontal">
                        <div id="precept" class="form-group">
                            <label class="col-sm-2 control-label" >产品</label>
                            <div class="col-sm-10">
                                <input id="selectPrecept" type="text" class="form-control" placeholder="输入中文或SKU查找产品" />
                                <div class="prompt prompt-send hidden">
                                    <ul class="list-group"></ul>
                                </div>
                            </div>
                        </div>
                        <div id="bourn" class="form-group">
                            <label class="col-sm-2 control-label">目的地</label>
                            <div class="col-sm-10">
                                <input id="selectState" class="form-control" type="text" placeholder="查找国家" />
                                <div class="prompt prompt-send hidden">
                                    <ul class="list-group"></ul>
                                </div>
                            </div>
                            <!-- <div class="col-sm-6">
                                <textarea class="form-control" id="selectStateArea" rows="5" style="width:100%"></textarea>
                            </div> -->
                        </div>
                        <div class="form-group">
                            <div class="col-sm-12">
                                <table class="table table-bordered table-condensed table-striped">
                                    <thead>
                                        <tr>
                                            <th>仓库</th>
                                            <th>货代</th>
                                            <th>服务</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>
                                                <select name="WName" id="WName" class="form-control input-sm"></select>
                                            </td>
                                            <td>
                                                <select name="FName" id="FName" class="form-control input-sm"></select>
                                            </td>
                                            <td>
                                                <select name="Service" id="Service" class="form-control input-sm"></select>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button id="confirm" class="btn btn-default" type="button" data-dismiss="modal">确定</button>
                </div>
            </div>
        </div>
    </div>

    <!-- 物流方案配置模态框 -->
    <div class="modal fade" id="schemeConfig" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button class="close" type="button" data-dismiss="modal">x</button>
                    <h4 class="modal-title">物流方案配置</h4>
                </div>
                <div class="modal-body maxH500">
                    <div class="row">
                        <div class="col-sm-12">
                            <button class="addStock btn btn-default btn-xs pull-right" type="button">增加仓库</button>
                        </div>
                    </div>
                    <hr>
                    <table class="table table-bordered table-condensed table-striped">
                        <caption>广州仓<button class="btn btn-default btn-xs pull-right">增加国家</button></caption>
                        <thead>
                            <th>国家</th>
                            <th>货代</th>
                            <th>服务</th>
                            <th>终端</th>
                            <th>状态</th>
                            <th>费用</th>
                            <th>操作</th>
                        </thead>
                        <tbody>
                            <tr>
                                <td>China</td>
                                <td colspan="5"></td>
                                <td>开关、新增</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>货代</td>
                                <td>服务</td>
                                <td>终端</td>
                                <td>状态</td>
                                <td>费用</td>
                                <td>操作</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>货代</td>
                                <td>服务</td>
                                <td>终端</td>
                                <td>状态</td>
                                <td>费用</td>
                                <td>操作</td>
                            </tr>
                        </tbody>
                    </table>
                    <table class="table table-bordered table-condensed table-striped">
                        <caption>广州仓<button class="btn btn-default btn-xs pull-right">增加国家</button></caption>
                        <thead>
                            <th>国家</th>
                            <th>货代</th>
                            <th>服务</th>
                            <th>终端</th>
                            <th>状态</th>
                            <th>费用</th>
                            <th>操作</th>
                        </thead>
                        <tbody>
                            <tr>
                                <td>China</td>
                                <td colspan="5"></td>
                                <td>开关、新增</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>货代</td>
                                <td>服务</td>
                                <td>终端</td>
                                <td>状态</td>
                                <td>费用</td>
                                <td>操作</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>货代</td>
                                <td>服务</td>
                                <td>终端</td>
                                <td>状态</td>
                                <td>费用</td>
                                <td>操作</td>
                            </tr>
                        </tbody>
                    </table>
                    <table class="table table-bordered table-condensed table-striped">
                        <caption>广州仓<button class="btn btn-default btn-xs pull-right">增加国家</button></caption>
                        <thead>
                            <th>国家</th>
                            <th>货代</th>
                            <th>服务</th>
                            <th>终端</th>
                            <th>状态</th>
                            <th>费用</th>
                            <th>操作</th>
                        </thead>
                        <tbody>
                            <tr>
                                <td>China</td>
                                <td colspan="5"></td>
                                <td>
                                    <button class="btn btn-default btn-xs" type="button">新增</button>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>货代</td>
                                <td>服务</td>
                                <td>终端</td>
                                <td>状态</td>
                                <td>费用</td>
                                <td>
                                    <div class="switch" data-on="success" data-off="warning">
                                        <input type="checkbox" checked />
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>货代</td>
                                <td>服务</td>
                                <td>终端</td>
                                <td>状态</td>
                                <td>费用</td>
                                <td>
                                    <div class="switch" data-on="success" data-off="warning">
                                        <input type="checkbox" checked />
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="modal-footer">
                    <button id="confirm" class="btn btn-default" type="button" data-dismiss="modal">确定</button>
                </div>
            </div>
        </div>
    </div>

    <!-- 搜索栏搜索结果列表 -->
    <template id="temp-search">
        {{#DataList}}
        <tr data-val="{{DataID}}">
            <td><input data-DataID="{{DataID}}" type="checkbox" name="Status">&nbsp;&nbsp;{{DataID}}</td>
            <td>{OrderID}</td>
            <td>{SkuID}&nbsp;&nbsp;{ProductName}</td>
            <td>{country}</td>
            <td>{WarehouseName}</td>
            <td>{FreightName}</td>
            <td>{Service}</td>
            <td>{Status}</td>
            <td>{Date}</td>
            <td><span class="glyphicon glyphicon-eye-open"></span></td>
        </tr>
        {{/DataList}}
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

    {页面底部}{/页面底部}
    
    <script src="/Resource/js/mustache.js"></script>
    <script src="/Resource/js/ZeroClipboard.min.js"></script>
    <script src="/Resource/js/bootstrap-switch.min.js"></script>
    <script>
        (function(){
            'use strict';

            var 
                // Int_UID = <!-- BEGIN 当前用户ID ATTRIB= --><!-- END 当前用户ID -->,
                $dataList = $('#data-list'),
                $selectProduct = $('#selectProduct'),
                $callAll = $('#callAll'),
                $dataForm = $('#status-upload tbody'),
                $batchBtn = $('#btn-batch'),
                $btnConfirm = $('#edit-confirm'),
                $statusModal = $('#edit-status'),
                $modalNewPrecept = $('#newPrecept'),
                $modalNewPreceptForm = $('#newPrecept').find('form'),
                $precept = $('#precept'),
                $bourn = $('#bourn'),
                $selectPrecept = $('#selectPrecept'),
                $selectState = $('#selectState'),
                $selectStateArea = $('#selectStateArea'),
                $preceptList = $precept.find('.prompt'),
                $bournList = $bourn.find('.prompt'),
                $seleceW = $('#WName'),
                $seleceF = $('#FName'),
                $seleceS = $('#Service'),
                tempW = $('#temp-wrehouse').html(),
                tempF = $('#temp-freight').html(),
                tempS = $('#temp-service').html(),
                $conf = $('#confirm'),
                bournArr = [],
                keySelect = null,
                setHeight = null,
                Freight,
                checkboxNum = 0,
                oParam = common.URL.parse();

            // 物流方案配置
            let schemeConfig = {
                // 打开模态框
                OpenModal: function() {
                    $('.switch input').bootstrapSwitch({
                        size: 'mini'
                    });
                    $('#schemeConfig').modal("show");
                },
                // 获取数据
                ProjectConQuery: function() {
                    let skuID = $('#common-sreach input[name="SkuID"]').val();
                    if (!skuID) {
                        alert('请先搜索需要配置的产品。');
                        return false;
                    }
                    common.loading.show();
                    $.ajax({
                        url: '/Logistics/Api/?Do=ProjectConQuery&SkuID=' + skuID,
                        type: 'GET',
                        success: function(data) {
                            schemeConfig.RenderList(data);
                        }
                    });
                },
                // 提交数据
                PostDate: function() {},
                // 渲染物流方案列表
                RenderList: function(data) {
                    common.loading.hide();
                    schemeConfig.OpenModal();
                    // let template = 
                },
                // 增加仓库
                AddStock: function() {},
                // 增加国家
                AddCountry: function() {},
                // 绑定事件
                AttachEvent: function() {
                    $('#scheme-config').on('click', function() {
                        schemeConfig.ProjectConQuery();
                    });
                } 
            };
            schemeConfig.AttachEvent();

            // 产品筛选
            $selectPrecept[0].oninput = function(){
                var ts = $(this);
                // 获取产品的数据
                $.ajax({
                    url: '/Product/API/?Do=SkuSearch&KeyWord=' + ts.val(),
                    dataType: 'json',
                    type: 'get',
                    success: function(data){
                        var d = data;

                        // 让UL显示，清空UL内容
                        $preceptList.removeClass('hidden').find('ul').html("");

                        var fragment = document.createDocumentFragment();
                        $.each(d.DataList, function(i, n){
                            var newPLi = $('<li class="list-group-item" data-val="' + n.DataID + '">' + n.FullName + ' ' + n.FullSKU + '</li>')[0];
                            fragment.appendChild(newPLi);
                        });
                        $preceptList.find('ul')[0].appendChild(fragment);

                        if(ts.val() === null || ts.val() === ""){
                            $preceptList.addClass('hidden');
                        }
                        mouseEvent($selectPrecept, $preceptList, 'SKUID');
                    }
                });
            }

            // 国家筛选
            $selectState[0].oninput = function(){
                var ts = $(this);
                // 获取所有国家的数据
                $.ajax({
                    url: '/Plus/API/?Do=GetCountry&Name=' + ts.val(),
                    dataType: 'json',
                    type: 'get',
                    success: function(data){
                        var d = data;

                        // 让UL显示，清空UL内容
                        $bournList.removeClass('hidden').find('ul').html("");

                        var fragment = document.createDocumentFragment();
                        $.each(d.Datalist, function(i, n){
                            var newSLi = $('<li class="list-group-item" data-val="' + n.DataID + '">' + n.Name + '</li>')[0];
                            fragment.appendChild(newSLi);
                        });
                        $bournList.find('ul')[0].appendChild(fragment);

                        if(ts.val() === null || ts.val() === ""){
                            $bournList.addClass('hidden');
                        }
                        mouseEvent($selectState, $bournList, 'CountryID', 0, $selectStateArea);
                    }
                });
            }

            // 获取所有仓库信息
            getW();
            function getW(){
                common.ajax({
                    notload: true,
                    title: '获取所有仓库信息',
                    URL: '/Logistics/Logistics.aspx?Do=List',
                    good: function (data) {
                        var d = data;
                        $seleceW.html(Mustache.render(tempW, d));

                        // 判断是否有默认值
                        if ($modalNewPrecept.data('W')) {
                            $seleceW.find('option[value="'+ $modalNewPrecept.data('W') +'"]').prop('selected', true);
                        }
                        $seleceW.change();
                    }
                });
            }

            //通过仓库改变获取货代信息
            $seleceW.on('change', function(){
                var didF = $seleceW.val();
                $.ajax({
                    url: '/Logistics/Logistics.aspx?Do=ServiceList&DataID=' + didF,
                    type: 'get',
                    dataType: 'json',
                    success: function(data){
                        Freight = data;
                        $seleceF.html(Mustache.render(tempF, Freight));
                        // 判断是否有默认值
                        if ($modalNewPrecept.data('F')) {
                            $seleceF.find('option[value="'+ $modalNewPrecept.data('F') +'"]').prop('selected', true);
                        }
                        $seleceF.change();
                    }
                });
            });

            // 通过货代改变服务
            $seleceF.on('change', function(){
                var didS = parseInt($seleceF.val());
                $.each(Freight.DataList, function(i, n){
                    if (n.DataID === didS) {
                        $seleceS.html(Mustache.render(tempS, n));

                        // 判断是否有默认值
                        if ($modalNewPrecept.data('S')) {
                            $seleceS.find('option[value="'+ $modalNewPrecept.data('S') +'"]').prop('selected', true);
                            // 获取完默认值之后删除模态框自定义值
                            $modalNewPrecept.removeAttr('data-W');
                            $modalNewPrecept.removeAttr('data-F');
                            $modalNewPrecept.removeAttr('data-S');
                        }
                    }
                });
            });


            // 每次关闭模态框清空数据
            $modalNewPrecept.on('click', '.close', function(){
                $modalNewPreceptForm.find('input[type="hidden"]').remove();
                $selectPrecept.val('');
                $selectState.val('');
                $selectStateArea.val('');
            });

            // 创建/更改物流方案
            $conf.on('click', function(){
                console.log($selectState.val());
                var title = $modalNewPrecept.attr('data-val') ? "物流方案修改" : "物流方案创建";
                $.ajax({
                    url: '/Logistics/API/?Do=ProjectSave',
                    dataType: 'json',
                    type: 'post',
                    data: {
                        DataID: $modalNewPreceptForm.find('input[name="DataID"]').val(),
                        SKUID: $modalNewPreceptForm.find('input[name="SKUID"]').val(),
                        CountryID: $modalNewPreceptForm.find('input[name="CountryID"]').val(),
                        WID: $seleceW.val(),
                        FreightID: $seleceF.val(),
                        ServiceID: $seleceS.val(),
                        Status: $modalNewPreceptForm.find('input[name="Status"]').val()
                    },
                    success: function(data){
                        console.log(data.LogError);
                        if (data.Ack) {
                            common.alert({
                                type: 'success',
                                title: title,
                                msg:  '成功，系统反馈：' + data.Message,
                                cb: function(){
                                    $modalNewPreceptForm.find('input[type="hidden"]').remove();
                                    location.reload();
                                }
                            });
                        }else{
                            common.alert({
                                title: title,
                                msg:  '失败，系统反馈：' + data.LogError
                            });
                        }
                        
                    }
                });
            });

            // 获取指定物流方案
            $dataList.on('click', '.glyphicon-eye-open', function(){
                var ts = $(this),
                    did = ts.closest('tr').data('val');
                    $.ajax({
                        url: '/Logistics/API/?Do=GetProject&DataID=' + did,
                        dataType: 'json',
                        type: 'post',
                        success: function(data){
                            var d = data.Project;
                            $modalNewPreceptForm.find('input[type="hidden"]').remove();
                            $modalNewPrecept.modal('show');
                            $selectPrecept.val(d.Product.FullName + ' ' +d.Product.FullSKU);
                            $selectStateArea.val(d.CountryName);
                            $modalNewPrecept.data('W', d.Warehouse.WID);
                            $modalNewPrecept.data('F', d.Freight.FreightID);
                            $modalNewPrecept.data('S', d.Service.ServiceID);
                            getW();
                            $modalNewPreceptForm.find('.checkbox-inline').each(function(){
                                var ts = $(this);
                                ts.find('input').removeAttr('checked');
                                d.Status === '执行' ? ts.find('input[value="执行"]').prop('checked', true) : ts.find('input[value="停止"]').prop('checked', true);
                            });
                            $modalNewPreceptForm.append('<input name="DataID" type="hidden" value="' + d.DataID + '" />');
                            $modalNewPreceptForm.append('<input name="SKUID" type="hidden" value="' + d.Product.SKUID + '" />');
                            $modalNewPreceptForm.append('<input name="CountryID" type="hidden" value="' + d.CountryID + '" />');
                        }
                    });
            });

            // 批量修改方法
            (function(){
                //批量按钮禁用/启用方法
                function batchBtn(){
                    $dataList.find('input[type="checkbox"]').each(function(){
                        $(this).prop('checked') === true ? checkboxNum++ : checkboxNum;
                    });
                    checkboxNum > 0?$batchBtn.removeAttr('disabled').attr('class', 'btn btn-warning btn-sm'):$batchBtn.attr('disabled', 'disabled').attr('class', 'btn btn-default btn-sm');
                    $batchBtn.text('批量修改[执行/停止][' + checkboxNum + ']');
                    checkboxNum = 0;
                }

                //遍历单选按钮
                $dataList.find('tbody input[type="checkbox"]').each(function(){
                    $(this).on('click', function(){
                        batchBtn();
                    });
                });

                //点击全选按钮时
                $callAll.on('click', function(){
                    var $ts = $(this);
                    if($ts.val() !== 'all'){
                        $ts.val('all');
                        $('#data-list').find('tbody input[type="checkbox"]').prop('checked', true);
                    }else{
                        $ts.val('none');
                        $('#data-list').find('tbody input[type="checkbox"]').prop('checked', false);
                    }
                    batchBtn();
                })

                //批量修改状态
                $btnConfirm.on('click', function(){
                    var DID = [],
                        STA = null,
                        num = 0;
                    //DataID 数组获取
                    $dataForm.find('input[name="Status"]').each(function(){
                        if($(this).prop('checked')){
                            DID[num] = $(this).attr('data-dataid');
                            num++;
                        }
                    });
                    //Status 获取
                    $statusModal.find('input[type="radio"]').each(function(){
                        STA = $(this).prop('checked')?$(this).val():STA;
                    });

                    //提交数据
                    $.ajax({
                        url: '/Logistics/API/?Do=SetProject',
                        type: 'post',
                        dataType: 'json',
                        traditional: true,
                        data: {
                            DataID: DID,
                            Status: STA
                        },
                        success: function(data){
                            if (data.Ack) {
                                common.alert({
                                    type: 'success',
                                    title: '批量修改状态',
                                    msg: '成功，系统反馈：' + data.Message,
                                    cb: function(){
                                        reload();
                                    }
                                });
                            }else{
                                common.alert({
                                    title: '批量修改状态',
                                    msg: '失败，系统反馈：' + data.LogError
                                });
                            }
                            
                            
                        },
                        error: function(data, status, e){
                            console.log(e);
                        }
                    });

                    //刷新页面
                    function reload(){
                        window.location.reload();
                    }
                });
            })();

            // 鼠标经过/点击事件
            function mouseEvent(inputSelect, Spinner, name, stu, texta){
                Spinner.find('li').each(function(){
                    var ts = $(this);
                    ts.on({
                        mouseover:function(){
                            Spinner.find('li').removeClass('active');
                            ts.addClass('active');
                        },
                        mouseout:function(){
                            Spinner.find('li').removeClass('active');
                            keySelect = null;
                            setHeight = null;
                        },
                        click:function(){
                            if (stu === 1) {
                                texta.val(texta.val() + Spinner.find('.active').text() + '\n');
                                inputSelect.val('');
                            }else {
                                inputSelect.val(Spinner.find('.active').text());
                            }
                            $modalNewPreceptForm.find('input[name="'+ name +'"]').remove();
                            $modalNewPreceptForm.append('<input name="' + name + '" type="hidden" value="' + Spinner.find('.active').attr('data-val') + '" />');
                            Spinner.addClass('hidden');
                        }
                    });
                });
            }

            // 键盘上下键选择
            keydownFun($selectPrecept, $preceptList, keySelect, setHeight, 'SKUID');
            keydownFun($selectState, $bournList, keySelect, setHeight, 'CountryID', 0, $selectStateArea);
            function keydownFun(inputSelect, Spinner, keySelect, setHeight, name, stu, texta){
                inputSelect.keydown(function(e){
                    e = event || window.event;
                    // 按键事件
                    if(e.keyCode === 38){
                        if(keySelect === null){
                            keySelect = 0;
                            Spinner.find('li').removeClass('active').eq(keySelect).addClass('active');
                        }else{
                            keySelect === 0 ? keySelect = 0 : keySelect--;
                            Spinner.find('li').removeClass('active').eq(keySelect).addClass('active');
                        }

                    }else if(e.keyCode === 40){

                        if(keySelect === null){
                            keySelect = 0;
                            Spinner.find('li').removeClass('active').eq(keySelect).addClass('active');
                        }else{
                            keySelect === Spinner.find('li').length-1 ? keySelect = Spinner.find('li').length-1 : keySelect++;
                            Spinner.find('li').removeClass('active').eq(keySelect).addClass('active');
                        }

                    }else if(e.keyCode === 13){
                        if (stu === 1) {
                            texta.val(texta.val() + Spinner.find('.active').text() + '\n');
                            inputSelect.val('');
                        }else {
                            inputSelect.val(Spinner.find('.active').text());
                        }
                        
                        if (name !== undefined) {
                            $modalNewPreceptForm.find('input[name="'+ name +'"]').remove();
                            $modalNewPreceptForm.append('<input name="' + name + '" type="hidden" value="' + Spinner.find('.active').attr('data-val') + '" />');
                        }
                        Spinner.addClass('hidden');
                        keySelect = null;
                        setHeight = null;
                    }else if(e.keyCode === 8){
                        keySelect = null;
                        setHeight = null;
                    }

                    // 滚动条事件
                    if(keySelect > 2 && keySelect < Spinner.find('li').length-3){
                        if(e.keyCode === 40){
                            setHeight += 41;
                            Spinner.scrollTop(setHeight);
                        }else if(e.keyCode === 38){
                            setHeight -= 41;
                            Spinner.scrollTop(setHeight);
                        }
                    }else if(keySelect <= 2){
                        setHeight = 0;
                        Spinner.scrollTop(setHeight);
                    }else if(keySelect >= Spinner.find('li').length-3){
                        setHeight = (keySelect-2) * 41;
                        Spinner.scrollTop(setHeight);
                    }
                });
            }

            // 搜索方法
            var option = {
                inForm : true,
                isLimit: false,
                mode   : true,
                SkuID  : oParam.SkuID || false
            };
            common.SkuSearch($('#common-sreach'), option);

            <!-- BEGIN 分页脚本 ATTRIB= -->
            common.showPage({当前页}, {总条数}, {每页条数});
            <!-- END 分页脚本 -->        
        })();
    </script>
    
</body>
</html>
