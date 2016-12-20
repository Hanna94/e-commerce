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
                    <select id="ShippingMethod" class="form-control" name="ShippingMethod">
                        <option value="0">不限</option>
                        <option value="AIRLCL">空运</option>
                        <option value="SEALCL">海运</option>
                    </select>
                </div>
                <div class="form-group form-group-sm mg-r-15">
                    <label class="control-label">目标仓库</label>
                    <select id="Warehouse" class="form-control" name="Warehouse">
                        <option value="0">不限</option>
                        <option value="1">广州仓</option>
                        <option value="2">海外仓</option>
                    </select>
                </div>
                <div class="form-group form-group-sm mg-r-15">
                    <label class="control-label">状态</label>
                    <select id="Status" class="form-control" name="Status">
                        <option value="0">不限</option>
                        <option value="1">状态1</option>
                        <option value="2">状态2</option>
                        <option value="3">状态3</option>
                    </select>
                </div>
                <div class="form-group form-group-sm">
                    <input type="text" class="form-control" placeholder="调拨单号 / 货代单号">
                </div>
                <div class="form-group form-group-sm">
                    <button class="btn btn-default btn-sm" type="submit">查询</button>
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
                        <tr data-id="{DataID}">
                            <td><input type="checkbox" value="{DataID}"></td>
                            <td>{ReferenceID}</td>
                            <td>{OrderSign}</td>
                            <td class="status">{Status}</td>
                            <td class="method">{ShippingMethod}</td>
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
            <div class="modal-dialog" style="width: 720px;">
                <div class="modal-content">
                    <form class="form-horizontal">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                            <h4 class="modal-title">设置入库单<small class="mg-l-5 re"></small><small class="mg-l-5 or"></small></h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-group form-group-sm">
                                <label for="set-referenceID" class="control-label col-sm-2">调拨单号</label>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <input id="set-referenceID" type="text" class="form-control" readonly>
                                    </div>
                                </div>
                                <label for="set-order" class="control-label col-sm-2">货代单号</label>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <input id="set-order" type="text" class="form-control" readonly>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group form-group-sm">
                                <label for="set-method" class="control-label col-sm-2">运输方式</label>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <select id="set-method" class="form-control" data-status="{{SkuStatus}}" disabled>
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
                                <label for="set-location" class="control-label col-sm-2">处理点</label>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <select id="set-location" class="form-control" data-status="{{SkuStatus}}" disabled>
                                            <option value="GZ">广州仓</option>
                                        </select>
                                    </div>
                                </div>
                                <label for="set-war" class="control-label col-sm-2">抵达仓库</label>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <select id="set-war" class="form-control" disabled>
                                            <option value="AU">AU</option>
                                            <option value="UK">UK</option>
                                            <option value="DE">DE</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group form-group-sm">
                                <label for="set-status" class="control-label col-sm-2">货代状态</label>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <input id="set-status" type="text" class="form-control" readonly>
                                    </div>
                                </div>
                                <label for="set-data" class="control-label col-sm-2">创建日期</label>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <input id="set-data" type="text" class="form-control" readonly>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group form-group-sm"><hr></div>
                            
                            <ul class="nav nav-tabs mg-b-5">
                                <li class="active"><a href="#nav-product" data-toggle="tab">产品清单</a></li>
                                <li><a href="#nav-box" data-toggle="tab">箱子信息</a></li>
                                <li><a href="#nav-costlist" data-toggle="tab">费用信息</a></li>
                                <li><a href="#nav-remark" data-toggle="tab">备注</a></li>
                            </ul>
                            <div class="tab-content">
                                <div id="nav-product" class="tab-pane fade in active maxH200">
                                    <table class="table table-striped table-bordered table-hover table-condensed">
                                        <thead>
                                            <tr>
                                                <th>Title</th>
                                                <th>FullSku</th>
                                                <th>FullName</th>
                                                <th>数量</th>
                                                <th>重量</th>
                                                <th>规格</th>
                                                <th>申报名称</th>
                                                <th>申报价值</th>
                                            </tr>
                                        </thead>
                                        <tbody></tbody>
                                    </table>
                                </div>
                                <div id="nav-box" class="tab-pane fade maxH200">
                                    <table class="table table-striped table-bordered table-hover table-condensed">
                                        <thead>
                                            <tr>
                                                <th>箱子号</th>
                                                <th>验货号</th>
                                                <th>状态</th>
                                                <th>初始重量</th>
                                                <th>计费重量</th>
                                                <th>体积</th>
                                                <th>时间</th>
                                            </tr>
                                        </thead>
                                        <tbody></tbody>
                                    </table>
                                </div>
                                <div id="nav-costlist" class="tab-pane fade maxH200">
                                    <table class="table table-striped table-bordered table-hover table-condensed">
                                        <thead>
                                            <tr>
                                                <th>单号</th>
                                                <th>业务号</th>
                                                <th>流水号</th>
                                                <th>费用</th>
                                                <th>用途</th>
                                                <th>结算时间</th>
                                            </tr>
                                        </thead>
                                        <tbody></tbody>
                                    </table>
                                </div>
                                <div id="nav-remark" class="tab-pane fade maxH200"></div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        
        <!-- 操作记录 -->
        <div id="modal-log" class="modal fade" tabindex="-1">
            <div class="modal-dialog" style="width: 720px;">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                        <h4 class="modal-title">操作记录<small class="mg-l-5"></small><small class="mg-l-5"></small></h4>
                    </div>
                    <div class="modal-body maxH600"></div>
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

            // 状态渲染
            (function() {
                var StatusOption = {
                    Type : ['Submitted', 'ShippingIn', 'PartShippingIn', 'Confirmed'],
                    Ch   : ['已审核', '已入库', '部分入库', '已交运'],
                    Style: ['label-primary', 'label-info', 'label-warning', 'label-success'],
                    Mode : 'replace'
                };
                var MethodOption = {
                    Type : ['SEALCL', 'AIRLCL', 'SEAZF'],
                    Ch   : ['海运', '空运', '海运自发'],
                    Style: ['label-primary', 'label-info', 'label-warning'],
                    Mode : 'replace'
                };
                var WarOption = {
                    Type : ['AU', 'UK', 'DE'],
                    Style: ['label-primary', 'label-warning', 'label-danger'],
                    Mode : 'replace'
                };
                common.Rendering.All($('#data-list').find('.status'), StatusOption);
                common.Rendering.All($('#data-list').find('.method'), MethodOption);
                common.Rendering.All($('#data-list').find('.war'), WarOption);
            })();
            // 状态渲染 - End

            // 入库单设置模态框
            (function() {
                $('.btn-edit').on('click', function() {
                    var did = $(this).closest('tr').data('id');
                    common.loading.show();

                    // 获取数据
                    $.ajax({
                        url     : '/Logistics/API/?Do=InStoreQuery&DataID=' + did,
                        dataType: "JSON",
                        type    : "GET",
                        success: function(d) {
                            $('#set-referenceID').val(d.ReferenceID);
                            $('#set-order').val(d.OrderSign);
                            $('#set-method').find('option[value=' + d.ShippingMethod + ']').attr('selected', true);
                            $('#set-arrive').val(d.ArriveTime);
                            $('#set-location').val(d.Location);
                            $('#set-war').val(d.Warehouse);
                            $('#set-status').val(d.Status);
                            $('#set-data').val(d.Date);

                            // 拼装参数
                            DataSpell(d);

                            $('#modal-instore-edit').modal('show');
                            common.loading.hide();
                        }
                    });

                    
                });
            })();
            // 入库单设置模态框 - End
            
            // 记录
            (function() {
                $('.btn-log').on('click', function() {
                    var did = $(this).closest('tr').data('id');
                    common.loading.show();

                    // 获取数据
                    $.ajax({
                        url     : '/Logistics/API/?Do=InStoreQuery&DataID=' + did,
                        dataType: "JSON",
                        type    : "GET",
                        success: function(d) {
                            common.Log($('#modal-log .modal-body'), d);
                            $('#modal-log').modal('show');
                            common.loading.hide();
                        }
                    });
                });
            })();
            // 记录 - End

//=========================================== 方法 ============================================================
/**
 * 拼装数据
 * @param {JSON} d 原始数据
 */
function DataSpell(d) {
    var DataSpell = {
        ProductList: [],
        Box        : [],
        CostList   : [],
        Log        : []
    };

    //======================================== 数据拼装 ======================================
    // 清单和箱子
    $.each(d.CaseList, function(idx, el) {
        // 清单数据
        $.each(el.Product, function(index, elent) {
            var SkuNotDitto = true;
            for(var i = 0; i < DataSpell.ProductList.length; i++ ) {
                if (DataSpell.ProductList[i].SKU == elent.SKU) {
                    DataSpell.ProductList[i].Quantity += elent.Quantity;
                    SkuNotDitto = false;
                }
            }
            if (SkuNotDitto) {
                var _tmpP = {
                    SKU          : '', 
                    FullSku      : '', 
                    FullName     : '', 
                    Quantity     : '', 
                    Weight       : '', 
                    Format       : '',
                    DeclaredName : '',
                    DeclaredValue: ''            
                };
                _tmpP.SKU           = elent.SKU;
                _tmpP.FullSku       = elent.FullSku;
                _tmpP.FullName      = elent.FullName;
                _tmpP.Quantity      = elent.Quantity;
                _tmpP.Weight        = elent.Weight;
                _tmpP.Format        = elent.Length + '*' + elent.Width + '*' + elent.Height;
                _tmpP.DeclaredName  = elent.DeclaredName;
                _tmpP.DeclaredValue = elent.DeclaredValue;

                DataSpell.ProductList.push(_tmpP);
            }
        });

        // 箱子数据
        var _tmpB = {
            CaseNo   : '',
            CaseSign : '',
            Status   : '',
            WeightDef: '',
            Weight   : '',
            Volume   : '',
            Date     : ''
        };

        _tmpB.CaseNo    = el.CaseNo;
        _tmpB.CaseSign  = el.CaseSign;
        _tmpB.Status    = el.Status;
        _tmpB.WeightDef = el.WeightDef;
        _tmpB.Weight    = el.Weight;
        _tmpB.Volume    = ((el.Length * el.Width * el.Height) / 1000000).toFixed(3);
        _tmpB.Date      = el.Date;
        DataSpell.Box.push(_tmpB);
    });
    // 清单和箱子 - End
    
    // 费用
    $.each(d.CostList, function(idx, el) {
        var _tmpC = {
            OrderSign : '',
            BusinessID: '',
            CapitalID : '',
            Cost      : '',
            Settlement: '',
            Date      : ''
        };
        _tmpC.OrderSign  = el.OrderSign;
        _tmpC.BusinessID = el.BusinessID;
        _tmpC.CapitalID  = el.CapitalID;
        _tmpC.Cost       = el.Cost;
        _tmpC.Settlement = el.Settlement;
        _tmpC.Date       = el.Date;
        DataSpell.CostList.push(_tmpC);
    });
    // 费用 - End

    // 备注
    $.each(d.Log, function(idx, el) {
        var _tmpL = {
            Name  : '',
            Remark: '',
            Date  : ''
        };
        _tmpL.Name   = el.Name;
        _tmpL.Remark = el.Remark;
        _tmpL.Date   = el.Date;
        DataSpell.Log.push(_tmpL);
    });
    // 备注 - End
    //======================================== 数据拼装 - End ================================
    // 产品清单
    var ProductHTML = '{{#ProductList}}'
                     + '<tr>'
                        + '<td>{{SKU}}</td>'
                        + '<td>{{FullSku}}</td>'
                        + '<td>{{FullName}}</td>'
                        + '<td>{{Quantity}}</td>'
                        + '<td>{{Weight}} KG</td>'
                        + '<td>{{Format}}</td>'
                        + '<td>{{DeclaredName}}</td>'
                        + '<td>{{DeclaredValue}}</td>'
                      + '</tr>'
                      +'{{/ProductList}}';
    $('#nav-product table tbody').html(Mustache.render(ProductHTML, DataSpell));

    // 箱子信息
    var BoxHTML = '{{#Box}}'
                + '<tr>'
                    +'<td>{{CaseNo}}</td>'
                    +'<td>{{CaseSign}}</td>'
                    +'<td>{{Status}}</td>'
                    +'<td>{{WeightDef}}</td>'
                    +'<td>{{Weight}}</td>'
                    +'<td>{{Volume}}</td>'
                    +'<td>{{Date}}</td>'
                + '</tr>'
                + '{{/Box}}';
    $('#nav-box table tbody').html(Mustache.render(BoxHTML, DataSpell));

    // 费用
    var CostListHTML = '{{#CostList}}'
                     + '<tr>'
                        + '<td>{{OrderSign}}</td>'
                        + '<td>{{BusinessID}}</td>'
                        + '<td>{{CapitalID}}</td>'
                        + '<td>{{Cost}}</td>'
                        + '<td>{{Settlement}}</td>'
                        + '<td>{{Date}}</td>'
                     + '</tr>'
                     + '{{/CostList}}';
    $('#nav-costlist table tbody').html(Mustache.render(CostListHTML, DataSpell));

    // 备注
    common.Log($('#nav-remark'), DataSpell);
}
//=========================================== 方法 ============================================================

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
