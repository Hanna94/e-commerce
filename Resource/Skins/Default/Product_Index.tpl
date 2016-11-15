{页面属性}{/页面属性}
<body>
	{页顶导航}{/页顶导航}
    <!-- 内容-->
    <article class="container-fluid">
        <header>
            <div class="btn-group btn-group-sm pull-right">
                <button id="btn-batch" class="btn btn-default hide" type="button" disabled>批量操作</button>
                <button class="btn btn-default" type="button" disabled>导出报表</button>
                <button id="add-spu-data" class="btn btn-default" type="button">添加数据</button>
            </div>
            <form id="form-search" action="?" class="form-inline pull-right pull-right mg-r-20">
                <input id="url-do" name="Do" type="hidden" value="All">
                <input id="url-tag" name="TagID" type="hidden" value="">
                <div class="form-group form-group-sm">
                    <select id="TeamID" class="form-control" name="TeamID" data-default="{TeamID}">
                        <option value = "-1">未分配</option>
                        <option value = "0">所有团队</option>
                        <!-- BEGIN 销售团队 ATTRIB= -->
                        <option value="{DataID}">{Name}</option>
                        <!-- END 销售团队 -->
                    </select>
                </div>
                <div class="form-group form-group-sm mg-l-20">
                    <div class="input-group input-group-sm">
                        <input type="text" class="form-control" placeholder="Search..." name="KeyWord">
                        <span class="input-group-btn">
                            <button class="btn btn-default" type="submit">查询</button>
                        </span>
                    </div>
                </div>
            </form>
        </header>

        <ul class="nav nav-tabs">
            <li><a href="?Do=All">全部</a></li>
            <li><a href="?Do=Sold">在售</a></li>
            <li><a href="?Do=Mark">收藏</a></li>
            <li><a href="?Do=Clearance">清仓</a></li>
            <li><a href="?Do=End">下架</a></li>
        </ul>

        <div class="tab-content">
            <div class="tab-pane active">
                <div class="tags mg-10">
                    <!-- BEGIN TAG列表 ATTRIB= -->
                    <span class="label label-default poi btn-tag" data-id='{DataID}'>{Name}</span>
                    <!-- END TAG列表 -->
                </div>
                <!-- 数据列表-->
                <table id="data-list" class="table table-hover table-bordered table-striped table-condensed">
                    <thead>
                        <tr>
                            <th><label id="select-all"><input type="checkbox"> 编号</label></th>
                            <th>SPU Setup</th>
                            <th>SKU Setup</th>
                            <th>尺寸(cm)</th>
                            <th>毛重(g)</th>
                            <th>申报</th>
                            <th>日期-时间</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    <tbody>
        				<!-- BEGIN 数据列表 ATTRIB= -->
        				<tr data-id="{DataID}" data-spuid="{SpuID}">
                            <td><input type="checkbox" value="{DataID}"> {DataID}</td>
                            <td>
                                <a title="编辑SPU" class="btn-spu-edit poi" data-code="{SpuCode}">[{SpuCode}]&nbsp;{SpuName}</a>
                                <a title="款式设置" class="btn-set-style btn btn-default btn-xs pull-right" data-spuname="{SpuName}">
                                    <span class="glyphicon glyphicon-edit"></span>
                                </a>
                            </td>
                            <td><span class="label sku-status">{SkuStatus}</span>&nbsp;<span class="poi copy" data-clipboard-text="{FullSKU}" title="点击复制该SKU">[{FullSKU}]</span>&nbsp;{FullName}</td>
                            <td>{Size}</td>
                            <td>{Weight}</td>
                            <td>{DeclareName}&nbsp;&nbsp;{DeclareValue}</td>
                            <td>{Date}</td>
                            <td>
                                <a class="btn-sku-attr btn btn-default btn-xs" title="SKU属性"><span class="poi glyphicon glyphicon-sort-by-attributes"></span></a>
                                <a class="btn-collect btn btn-default btn-xs" title="收藏"><span class="poi glyphicon glyphicon-star"></span></a>
                                <a class="btn-log btn btn-default btn-xs" title="日志"><span class="poi glyphicon glyphicon-list-alt"></span></a>
                            </td>
        				</tr>
        				<!-- END 数据列表 -->
                    </tbody>
                    <tfoot><tr><td colspan="8"></td></tr></tfoot>
                </table>
            </div>
        </div>
    </article>

    <!-- 模态框 编辑SPU -->
    <div class="modal fade modal-nav" id="modal-edit-spu" tabindex="-1"></div>

    <!-- 设置款式 -->
    <div class="modal fade" id="modal-set-style" tabindex="-1">
        <div class="modal-dialog" style="width: 1200px;">
            <div class="modal-content">
                <div class="modal-header">
                    <button class="close" type="button" data-dismiss="modal">x</button>
                    <h4 class="modal-title"></h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">增加Sku</label>
                            <div class="col-sm-10">
                                <div class="input-group input-group-sm">
                                    <input id="modal-sku-add" class="form-control" type="text" placeholder="每个Sku用英文逗号分隔，e.g. S,M,L,XL,XXL">
                                    <span class="input-group-btn">
                                        <button id="modal-btn-sku-add" class="btn btn-default" type="button">添加</button>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </form>
                    
                    <div class="maxH400">
                        <form class="form-horizontal">
                            <table class="table table-striped table-bordered table-hover table-condensed">
                                <thead>
                                    <th>Product ID</th>
                                    <th>Product Sku</th>
                                    <th>Product Name</th>
                                    <th>SKU Code</th>
                                    <th>中文名</th>
                                    <th>SKU 状态</th>
                                    <th>操作</th>
                                </thead>
                                <tbody class="form-group-sm"></tbody>
                            </table>
                        </form>
                    </div>

                </div>
            </div>
        </div>
    </div>
    
    <!-- SKU设置模态框 -->
    <div id="modal-sku-edit" class="modal fade" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <form class="form-horizontal">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                        <h4 class="modal-title">SKU设置</h4>
                    </div>
                    <div class="modal-body">
                        <p>如果属性跟SPU一致，则无需重复填写，仅需填写与SPU不一致的部分。</p>
                        <div class="form-group form-group-sm">
                            <label for="sku-declare" class="control-label col-sm-2">申报名称</label>
                            <div class="col-sm-4">
                                <input id="sku-declare" type="text" class="form-control">
                            </div>
                            <label for="sku-usd" class="control-label col-sm-2">申报价值USD</label>
                            <div class="col-sm-4">
                                <input id="sku-usd" type="text" class="form-control">
                            </div>
                        </div>
                        <div class="form-group form-group-sm">
                            <label for="sku-size" class="control-label col-sm-2">尺寸(长宽高)</label>
                            <div class="col-sm-4">
                                <div class="input-group">
                                    <input id="sku-size" type="text" class="form-control" placeholder="格式：长*宽*高">
                                    <span class="input-group-addon">cm<sup>3</sup></span>
                                </div>
                            </div>
                            <label for="sku-weight" class="control-label col-sm-2">重量</label>
                            <div class="col-sm-4">
                                <div class="input-group">
                                    <input id="sku-weight" type="text" class="form-control">
                                    <span class="input-group-addon">g</span>
                                </div>
                            </div>
                        </div>
                        <div class="form-group form-group-sm">
                            <label for="sku-state" class="control-label col-sm-2">状态</label>
                            <div class="col-sm-4">
                            <select id="sku-state" class="form-control" data-status="{{SkuStatus}}">
                                    <option value=""></option>
                                    <option value="销售">销售</option>
                                    <option value="清仓">清仓</option>
                                    <option value="下架">下架</option>
                                </select>
                            </div>
                            <label for="sku-battery" class="control-label col-sm-2">电池</label>
                            <div class="col-sm-4">
                                <select id="sku-battery" class="form-control">
                                    <option value=""></option>
                                    <option value="带电">带电</option>
                                    <option value="纯电">纯电</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group form-group-sm"><hr></div>
                        <p>此处为SPU公共属性</p>
                        <div class="form-group form-group-sm">
                            <label for="public-spu-declare" class="control-label col-sm-2">申报名称</label>
                            <div class="col-sm-4">
                                <input id="public-spu-declare" type="text" class="form-control" readonly>
                            </div>
                            <label for="public-spu-usd" class="control-label col-sm-2">申报价值USD</label>
                            <div class="col-sm-4">
                                <input id="public-spu-usd" type="text" class="form-control" readonly>
                            </div>
                        </div>
                        <div class="form-group form-group-sm">
                            <label for="public-spu-size" class="control-label col-sm-2">尺寸(长宽高)</label>
                            <div class="col-sm-4">
                                <div class="input-group">
                                    <input id="public-spu-size" type="text" class="form-control" readonly>
                                    <span class="input-group-addon">cm<sup>3</sup></span>
                                </div>
                            </div>
                            <label for="public-spu-weight" class="control-label col-sm-2">重量</label>
                            <div class="col-sm-4">
                                <div class="input-group">
                                    <input id="public-spu-weight" type="text" class="form-control" readonly>
                                    <span class="input-group-addon">g</span>
                                </div>
                            </div>
                        </div>
                        <div class="form-group form-group-sm">
                            <label for="public-spu-state" class="control-label col-sm-2">状态</label>
                            <div class="col-sm-4">
                                <input id="public-spu-state" type="text" class="form-control" readonly>
                            </div>
                            <label for="public-spu-battery" class="control-label col-sm-2">电池</label>
                            <div class="col-sm-4">
                                <input id="public-spu-battery" type="text" class="form-control" readonly>
                            </div>
                        </div>
                    </div>
                    <div class="form-group form-group-sm">
                        <div class="col-sm-12">
                            <hr>
                            <button id="sku-edit-save" class="btn btn-default btn-sm center-block" type="button">保存</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- 批量操作-->
    <div id="batch-panel" class="modal fade" tabIndex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <form  class="form-horizontal" method="post" action="javascript:;">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                        <h4 class="modal-title">进行产品设置</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">产品状态</label>
                            <div class="col-sm-10">
                                <label class="radio-inline"><input type="radio" name="Status" value="销售">销售</label>
                                <label class="radio-inline"><input type="radio" name="Status" value="清仓">清仓</label>
                                <label class="radio-inline"><input type="radio" name="Status" value="下架">下架</label>
                            </div>
                        </div>
                        <input type="hidden" name="DataID" id="DataID">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">授权团队</label>
                            <div class="col-sm-10">
                                <select class="form-control" name="TeamID" ID="TeamID"></select>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="reset" class="btn btn-default" data-dismiss="modal">取消</button>
                        <button type="submit" class="btn btn-primary">确定</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <div id="modal-log" class="modal fade" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                    <h4 class="modal-title">操作日志</h4>
                </div>
                <div class="modal-body">
                    <div class="maxH400">
                        <table class="table table-striped table-condensed">
                            <colgroup>
                                <col width="60px">
                                <col>
                                <col width="90px">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>操作人</th>
                                    <th>记录</th>
                                    <th>时间</th>
                                </tr>
                            </thead>
                            <tbody></tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- SPU 设置模态框模板 -->
    <template id="tmp-spu-modal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button class="close" type="button" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">{{title}}</h4>
                </div>
                <div class="modal-body">
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#spu-nav-basic" data-toggle="tab">基本</a></li>
                        <li class="{{hide}}"><a href="#spu-nav-tag" data-toggle="tab">Tag设置</a></li>
                        <li class="{{hide}}"><a href="#spu-nav-accredit" data-toggle="tab">产品授权</a></li>
                        <li class="{{hide}}"><a href="#spu-nav-remark" data-toggle="tab">备注</a></li>
                        <li class="{{hide}}"><a href="#spu-nav-log" data-toggle="tab">日志</a></li>
                    </ul>
                    <div class="tab-content">
                        <!-- 基本 -->
                        <div class="tab-pane fade in active" id="spu-nav-basic">
                            <form class="form-horizontal mg-t-10" action="javascript:;">
                                <div class="form-group form-group-sm">
                                    <label class="col-sm-2 control-label" for="basic-spu-code">SPU Code</label>
                                    <div class="col-sm-4">
                                        <input id="basic-spu-code" type="text" class="form-control" placeholder="添加24小时后不能修改" {{readonly}}>
                                    </div>
                                </div>
                                <div class="form-group form-group-sm">
                                    <label class="col-sm-2 control-label" for="basic-spu-name">SPU Name</label>
                                    <div class="col-sm-4">
                                        <input id="basic-spu-name" type="text" class="form-control">
                                    </div>
                                    <div class="col-sm-6">
                                        <button id="btn-is-same" class="btn btn-sm" type="button">重复性检测</button>
                                    </div>
                                </div>
                                <div class="form-group form-group-sm">
                                    <label class="col-sm-2 control-label" for="basic-spu-declare">申报名称</label>
                                    <div class="col-sm-4">
                                        <input id="basic-spu-declare" type="text" class="form-control">
                                    </div>
                                    <label class="col-sm-2 control-label" for="basic-spu-usd">申报价值USD</label>
                                    <div class="col-sm-4">
                                        <input id="basic-spu-usd" type="text" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group form-group-sm">
                                    <label class="col-sm-2 control-label" for="basic-spu-size">尺寸(长宽高)</label>
                                    <div class="col-sm-4">
                                        <div class="input-group">
                                            <input id="basic-spu-size" type="text" class="form-control" placeholder="格式：长*宽*高">
                                            <span class="input-group-addon">cm<sup>3</sup></span>
                                        </div>
                                    </div>
                                    <label class="col-sm-2 control-label" for="basic-spu-weight">重量</label>
                                    <div class="col-sm-4">
                                        <div class="input-group">
                                            <input id="basic-spu-weight" type="text" class="form-control">
                                            <span class="input-group-addon">g</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group form-group-sm">
                                    <label class="col-sm-2 control-label" for="basic-spu-state">状态</label>
                                    <div class="col-sm-4">
                                        <input id="basic-spu-state" type="text" class="form-control" readonly>
                                    </div>
                                    <label class="col-sm-2 control-label" for="basic-spu-battery">电池</label>
                                    <div class="col-sm-4">
                                        <select id="basic-spu-battery" class="form-control">
                                            <option value="">不适用</option>
                                            <option value="带电">带电</option>
                                            <option value="纯电">纯电</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group form-group-sm">
                                    <div class="col-sm-12">
                                        <hr>
                                        <button id="spu-edit-save" class="btn btn-default btn-sm center-block" type="button">保存</button>
                                    </div>
                                </div>
                            </form>
                        </div>

                        <!-- TAG -->
                        <div class="tab-pane fade row" id="spu-nav-tag">
                            <div class="col-xs-5">
                                <div class="panel panel-info all-tag">
                                    <div class="panel-heading">未关联TAG</div>
                                    <div class="panel-body list-group pd-0 maxH400"></div>
                                </div>
                            </div>

                            <div class="col-xs-2 text-center">
                                <p class="text-success">
                                    点击左边，进行TAG关联
                                    <br>
                                    <span class="glyphicon glyphicon-arrow-right"></span>
                                </p>
                                <hr>
                                <p class="text-danger">
                                    <span class="glyphicon glyphicon-arrow-left"></span>
                                    <br>
                                    点击右边，取消TAG关联
                                </p>
                            </div>

                            <div class="col-xs-5">
                                <div class="panel panel-success active-tag">
                                    <div class="panel-heading">已关联TAG</div>
                                    <div class="panel-body list-group pd-0 maxH400"></div>
                                </div>
                            </div>
                        </div>
                        <!-- 授权 -->
                        <div class="tab-pane fade" id="spu-nav-accredit">
                            <form  class="form-horizontal" action="javascript:;">
                                <div class="modal-body span-block">
                                    <div class="form-group">
                                        <label class="col-sm-2">已授权团队</label>
                                        <div class="col-sm-10 active-accredit-team"></div>
                                    </div>
                                    <hr>
                                    <div class="form-group">
                                        <label class="col-sm-2">其余团队</label>
                                        <div class="col-sm-10 all-accredit-team"></div>
                                    </div>
                                </div>
                            </form>
                        </div>

                        <!-- 备注 -->
                        <div class="tab-pane fade" id="spu-nav-remark">
                            <div id="panel-remark">
                                <form class="form-horizontal" action="javascript:;">
                                    <div class="input-group input-group-sm">
                                        <textarea rows="1" name="Remark" class="form-control"></textarea>
                                        <span class="input-group-btn">
                                            <input type="submit" class="btn btn-default" value="提交" />
                                            <input type="reset" class="btn btn-default hidden" value="取消" />
                                        </span>
                                    </div>
                                    <span class="text-danger">提示：如果在IE浏览器下排版混乱，且无法使用编辑和删除功能，请酌情使用谷歌、火狐等其他浏览器。</span>
                                </form>
                                <div class="maxH300 mg-t-10">
                                    <table class="table table-striped table-condensed">
                                        <tbody></tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <!-- 日志 -->
                        <div class="tab-pane fade" id="spu-nav-log">
                            <div class="maxH400">
                                <table class="table table-striped table-condensed">
                                    <colgroup>
                                        <col width="60px">
                                        <col>
                                        <col width="90px">
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th>操作人</th>
                                            <th>记录</th>
                                            <th>时间</th>
                                        </tr>
                                    </thead>
                                    <tbody></tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </template>

    <template id="temp-accredit-team">
        <option>请选择</option>
        {{#DataList}}
        <option value="{{DataID}}">{{Name}}</option>
        {{/DataList}}
    </template>

    <!-- 买家留言与备注模板-->
    <template id="tmp-remark">
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

    <!-- 款式设置模板 -->
    <template id="tmp-set-style">
        {{#DataList}}
        <tr data-id="{{DataID}}">
            <td>{{DataID}}</td>
            <td>{{FullSKU}}</td>
            <td>{{FullName}}</td>
            <td><input class="form-control" name="code" value="{{SkuCode}}"></td>
            <td><input class="form-control" name="style" value="{{Style}}"></td>
            <td>
                <select class="form-control" name="status" data-status="{{SkuStatus}}">
                    <option value=""></option>
                    <option value="销售">销售</option>
                    <option value="清仓">清仓</option>
                    <option value="下架">下架</option>
                </select>
            </td>
            <td>
                <a class="btn btn-default btn-sm mg-l-5 modal-btn-sku-update" title="更新本条信息">
                    <span class="glyphicon glyphicon glyphicon-repeat"></span>
                </a>
                <a class="btn btn-default btn-sm mg-l-5 modal-btn-sku-attr" title="打开设置SKU属性的窗口">
                    <span class="glyphicon glyphicon-sort-by-attributes"></span>
                </a>
                <a class="btn btn-default btn-sm mg-l-5 modal-btn-collect" title="收藏">
                    <span class="glyphicon glyphicon-star"></span>
                </a>
            </td>
        </tr>
        {{/DataList}}
    </template>

    <template id="tmp-spu-log">
        {{#Log}}
        <tr>
            <td>{{Name}}</td>
            <td>{{Remark}}</td>
            <td>{{Date}}</td>
        </tr>
        {{/Log}}
    </template>

    {页面底部}{/页面底部}

    <script src="/Resource/js/mustache.js"></script>
    <script src="/Resource/js/ZeroClipboard.min.js"></script>

    <script>
        (function () {
            'use strict';

            var oParam = common.URL.parse(),
                $dataList = $('#data-list'),
                $batchPanel = $('#batch-panel'),
                $btnBatch = $('.btn-batch'),
                tagList, tagActiveList,
                tempAccreditTeam = $('#temp-accredit-team').html(),
                editId, AccreditList, spuid;

            var $btnBatch = $('#btn-batch'); // 批量操作按钮
            var $modalSpu = $('#modal-edit-spu'); // SPU编辑模态框
            var tmpSpuModal = $('#tmp-spu-modal').html(); //SPU模态框模板

            // 批量操作
            (function() {
                // 批量操作的按钮限制
                $dataList.find('tbody').on('change', 'input[type="checkbox"]', function() {
                    $('#btn-batch').prop('disabled', !!!$dataList.find('tbody input:checked').length);
                });
                // 批量点击时，获取选中的SPU
                $('#btn-batch').on('click', function () {
                    if (!AccreditList) {
                        getAllTeam(function (data) {
                            // 初始化批量处理的授权团队
                            $batchPanel.find('#TeamID').html(Mustache.render(tempAccreditTeam, data));
                            initBatchPanel();
                            $batchPanel.modal('show');
                        });
                        return;
                    }

                    initBatchPanel();
                    $batchPanel.modal('show');
                });
                // 初始化批量操作
                function initBatchPanel() {
                    $batchPanel.find('#DataID').val(common.getChecked($dataList.find('tbody'), 'tr', 'data-id'));
                    $batchPanel.find('input[type="radio"]').prop('checked', false);
                    $batchPanel.find('#TeamID option:eq(0)').prop('selected', true);
                }
                // 提交批量处理
                $batchPanel.find('form').on('submit', function () {
                    common.ajax({
                        title: '批量',
                        URL: '/Product/Product.aspx?Do=SetStatus',
                        type: 'post',
                        data: $(this).serialize(),
                        good: function (data) {
                            common.alert({
                                type: 'success',
                                title: '“批量”操作：',
                                msg: data.Message || '成功！',
                                cb: function () {
                                    location.reload();
                                }
                            });
                            $batchPanel.modal('hide');
                        }
                    });
                    return false;
                });
            })();

            // 获取所有授权团队
            function getAllTeam(cb) {
                common.ajax({
                    notload: true,
                    title: '获取所有授权团队',
                    URL: '/User/User.aspx?Do=ListTeam',
                    good: function(data) {
                        AccreditList = data.DataList;
                        cb(data);
                    }
                });
            }

// ================================================ SPU部分 =================================================
            // SPU 设置
            (function () {
                // 添加SPU
                $('#add-spu-data').on('click', function() {
                    // 重置DataID
                    spuid = '';

                    // 加载模板
                    var addSpu = {'title': '添加Spu', 'hide': 'hide', 'readonly': ''};
                    $modalSpu.html(Mustache.render(tmpSpuModal, addSpu));

                    // 禁止保存按钮
                    $modalSpu.find('#spu-edit-save').attr('disabled', true);

                    // SPU检测
                    CheckSpuIfSame(0);

                    // 激活保存按钮
                    ActivationSaveBtn();

                    $modalSpu.modal('show');
                });

                // 编辑SPU
                $dataList.on('click', '.btn-spu-edit', function() {
                    spuid = $(this).closest('tr').data('spuid');
                    editId = $(this).closest('tr').data('id');

                    // 检测SPU重复
                    CheckSpuIfSame(1, spuid);

                    // 获取SPU数据
                    GetSpuData(false);

                });

                // 列表上的日志按钮
                $dataList.on('click', '.btn-log', function() {
                    // 渲染日志列表
                    var _dataID = $(this).closest('tr').data('id');
                    var log = GetLog(_dataID);
                    if (log) {
                        $('#modal-log tbody').html(Mustache.render($('#tmp-spu-log').html(), log));
                    }
                    $('#modal-log').modal('show');
                });

                /**
                 * 检测SPU Name 和SPU Code 是否重复
                 * @param number type    -[type = 0]代表新建，[type = 1]代表更新
                 * @param number _spuid  -就是SPUID
                 */
                function CheckSpuIfSame(type, _spuid) {
                    $modalSpu.on('click', '#btn-is-same', function() {
                        var _name = $modalSpu.find('#basic-spu-name').val();
                        var _code = $modalSpu.find('#basic-spu-code').val();
                        var _condition;
                        var _point = '';
                        if (type == 0) {
                            _condition = _code && _name ? true : false;
                            _point = 'SPU Code 和 ';
                        } else if (type == 1) {
                            _condition = _name ? true : false;
                        }

                        if (_condition) {
                            common.ajax({
                                title: 'SPU检测',
                                URL: '/Product/Product.aspx?Do=SpuCheck&Name=' + _name + '&SPU=' + _code + '&DataID=' + _spuid,
                                good: function(d) {
                                    common.alert({
                                        type: 'success',
                                        title: '检测无重复，可以使用！',
                                        time: 500,
                                        msg: '',
                                        cb: function(){
                                            $modalSpu.find('#spu-edit-save').removeAttr('disabled');
                                        }
                                    });
                                },
                                bad: function(d) {
                                    $modalSpu.find('#spu-edit-save').attr('disabled', true);
                                }
                            });    
                        } else {
                            alert(_point + 'SPU Name 不能为空。');
                        }
                    });
                }

                // 更新SPU数据
                // 激活保存按钮
                function ActivationSaveBtn() {
                    $('#spu-edit-save').on('click', function() {
                        // 获取用户填写的spu信息
                        var spuData = GetUserInput('SPU信息保存');
                        // 更新SPU数据
                        SpuSave(spuData);
                    });
                }
                
                // 获取用户填写的spu信息
                function GetUserInput(title){
                    // 检查产品尺寸输入是否符合格式，不符合强制转换
                    var sizeString = SizeCheck($modalSpu.find('#basic-spu-size'));
                    
                    var spuData = {
                        'Title': title,
                        'DataID': spuid,
                        'Code': $modalSpu.find('#basic-spu-code').val(),
                        'Name': $modalSpu.find('#basic-spu-name').val(),
                        'Declare': $modalSpu.find('#basic-spu-declare').val(),
                        'Usd': $modalSpu.find('#basic-spu-usd').val(),
                        'Size': sizeString,
                        'Weight': $modalSpu.find('#basic-spu-weight').val(),
                        'State': $modalSpu.find('#basic-spu-state').val(),
                        'Battery': $modalSpu.find('#basic-spu-battery').val()
                    };
                    return spuData;
                }

                // 获取SPU信息
                function GetSpuData(isShow){
                    common.ajax({
                        notload: true,
                        title: '编辑',
                        URL: '/Product/Product.aspx?Do=SpuQuery&DataID=' + spuid,
                        good: function(data) {
                            tagActiveList = data.DataList ? data.DataList.map(function (ele) {
                                return ele.TAGID;
                            }) : [];

                            // 计算创建的时间戳
                            var createDate = new Date(data.Date);
                            createDate = createDate.getTime();

                            // 当前时间戳
                            var currentDate = new Date();
                            currentDate = currentDate.getTime();

                            // 如果时间超过24小时，就让spu Code 只读
                            var restriction = (currentDate - createDate)/(1000 * 60 * 60)
                            restriction >= 24 ? restriction = 'readonly' : restriction = '';

                            // 加载模板
                            var editModalLoad = {'title': '编辑SPU', 'hide': '', 'readonly': restriction};
                            $modalSpu.html(Mustache.render(tmpSpuModal, editModalLoad));

                            //从上到下：添加关联tag、取消关联tag、添加授权团队、取消授权团队
                            addTag();
                            cancelTag();
                            addAccredit();
                            cancelAccredit();
                            // 激活更新按钮
                            ActivationSaveBtn();
                            if (!tagList) {
                                // 获取所有TAG
                                common.ajax({
                                    notload: true,
                                    title: '获取所有TAG',
                                    URL: '/Product/Tag.aspx?Do=List',
                                    good: function (data) {
                                        tagList = data.DataList;
                                        appendtagList();
                                    }
                                });
                            } else {
                                appendtagList(editId);
                            }

                            // 授权团队
                            setSelfTeam(spuid);

                            $modalSpu.find('#basic-spu-code').val(data.SPU);
                            $modalSpu.find('#basic-spu-name').val(data.Name);
                            $modalSpu.find('#basic-spu-declare').val(data.DeclareName);
                            $modalSpu.find('#basic-spu-usd').val(data.DeclareValue);
                            $modalSpu.find('#basic-spu-size').val(data.Size);
                            $modalSpu.find('#basic-spu-weight').val(data.Weight);
                            $modalSpu.find('#basic-spu-state').val(data.Status);
                            $modalSpu.find('#basic-spu-battery option[value="' + data.Battery + '"]').attr('selected', true);

                            // 渲染备注列表及加载方法
                            SetRemark(editId);

                            // 渲染日志列表
                            var log = GetLog(editId);
                            if (log) {
                                $modalSpu.find('#spu-nav-log tbody').html(Mustache.render($('#tmp-spu-log').html(), log));
                            }

                            // 默认第一个标签页显示
                            if (!isShow) {
                                $modalSpu.find('.nav-tabs a[href="#spu-nav-basic"]').tab('show');
                                $modalSpu.modal('show');
                            }
                        }
                    });
                }

                // 渲染TAG列表
                function appendtagList () {
                    var i = 0,
                        len = tagList.length,
                        all = '',
                        active = '',
                        tag;

                    for (; i < len; i++) {
                        tag = tagList[i];
                        if ($.inArray(tag.TAGID, tagActiveList) >= 0) {
                            active += '<a data-id="' +
                            tag.TAGID + '" href="javascript:;" class="list-group-item">' +
                            tag.TAGName + '</a>';
                            continue;
                        }
                        all += '<a data-id="' +
                            tag.TAGID + '" href="javascript:;" class="list-group-item">' +
                            tag.TAGName + '</a>';
                    }

                    $modalSpu.find('.all-tag .list-group').html(all);
                    $modalSpu.find('.active-tag .list-group').html(active);
                }

                // 添加关联操作
                function addTag() {
                    $modalSpu.find('.all-tag .list-group').on('click', 'a', function() {
                        var $this = $(this);
                        common.ajax({
                            title: '添加关联',
                            URL: '/Product/Product.aspx?Do=TAGAdd&DataID=' + spuid + '&TAGID=' + $this.data('id'),
                            good: function(data) {
                                common.alert({
                                    type: 'success',
                                    title: '“添加关联”操作：',
                                    msg: data.Message || '成功！'
                                });
                                $modalSpu.find('.active-tag .list-group').prepend($this);
                            }
                        });
                    });
                }
                
                // 取消关联操作
                function cancelTag() {
                    $modalSpu.find('.active-tag .list-group').on('click', 'a', function() {
                        var $this = $(this);
                        common.ajax({
                            title: '取消关联',
                            URL: '/Product/Product.aspx?Do=TAGCancel&DataID=' + spuid + '&TAGID=' + $this.data('id'),
                            good: function(data) {
                                common.alert({
                                    type: 'success',
                                    title: '“取消关联”操作：',
                                    msg: data.Message || '成功！'
                                });
                                $modalSpu.find('.all-tag .list-group').prepend($this);
                            }
                        });
                    });
                }

                // 授权团队
                // 授权团队列表
                var activeList;

                // 追加授权团队
                function addFreight() {
                    var i = 0,
                        len = AccreditList.length,
                        pHtml = '',
                        aHtml = '',
                        id;
                    for (; i < len; i++) {
                        id = AccreditList[i].DataID;
                        if ($.inArray(id, activeList) >= 0) {
                            aHtml += '<span title="点击取消授权团队" class="poi label label-danger" data-id="' + id +
                            '"><b>&times; </b>' + AccreditList[i].Name + '</span>&nbsp;';
                            continue;
                        }
                        pHtml += '<span title="点击添加授权团队" class="poi label label-success" data-id="' + id +
                            '"><b>+ </b>' + AccreditList[i].Name + '</span>&nbsp;';
                    }
                    $('#spu-nav-accredit').find('.all-accredit-team').html(pHtml);
                    $('#spu-nav-accredit').find('.active-accredit-team').html(aHtml);
                }

                // 授权团队设置
                function setSelfTeam(id) {
                    if (!AccreditList) {
                        getAllTeam(function () {
                            getSelfTeam(id);
                        });
                        return;
                    }
                    
                    getSelfTeam(id);
                }

                // 获取自身已授权团队
                function getSelfTeam(id) {
                    common.ajax({
                        title: '获取已授权团队',
                        URL: '/Product/Product.aspx?Do=TeamList&DataID=' + id,
                        good: function(data) {
                            activeList = data.DataList.map(function(ele) {
                                return ele.TeamID;
                            });;
                            addFreight();
                        }
                    });
                }

                // 添加授权团队
                function addAccredit() {
                    $('#spu-nav-accredit').find('.all-accredit-team').on('click', 'span', function() {
                        var id = $(this).data('id');
                        common.ajax({
                            title: '添加授权团队',
                            URL: '/Product/Product.aspx?Do=TeamAdd&DataID=' + spuid + '&TeamID=' + id,
                            good: function (data) {
                                common.alert({
                                    type: 'success',
                                    title: '“添加授权团队”操作：',
                                    msg: data.Message || '成功！'
                                });
                                activeList.push(id);
                                addFreight();
                            }
                        });
                    });
                }

                // 取消授权团队
                function cancelAccredit() {
                    $('#spu-nav-accredit').find('.active-accredit-team').on('click', 'span', function() {
                        var id = $(this).data('id');
                        common.ajax({
                            title: '取消授权团队',
                            URL: '/Product/Product.aspx?Do=TeamCancel&DataID=' + spuid + '&TeamID=' + id,
                            good: function (data) {
                                common.alert({
                                    type: 'success',
                                    title: '“取消授权团队”操作：',
                                    msg: data.Message || '成功！'
                                });
                                activeList = activeList.filter(function(ele) {
                                    return ele !== id;
                                });
                                addFreight();
                            }
                        });
                    });
                }

                // 保存和更新SPU设置
                function SpuSave (parameter) {
                    common.ajax({
                        title: parameter.Title,
                        URL: ' /Product/Product.aspx?Do=SpuSave',
                        type: 'POST',
                        data: {
                            DataID: parameter.DataID,
                            SPU: parameter.Code,
                            Name: parameter.Name,
                            DeclareName: parameter.Declare,
                            DeclareValue: parameter.Usd,
                            Size: parameter.Size,
                            Weight: parameter.Weight,
                            Status: parameter.State,
                            Battery: parameter.Battery
                        },
                        good: function(d){
                            common.alert({
                                title: parameter.Title,
                                type: 'success',
                                msg: '完成，系统反馈：' + d.Message,
                                cb: function(){
                                    location.reload();
                                }
                            });
                        }
                    });
                }

                // 获取日志记录
                function GetLog(id) {
                    var _log;
                    $.ajax({
                        url: '/Product/Api/?Do=SkuQuery&DataID=' + id,
                        type: 'GET',
                        dataType: 'JSON',
                        async: false,
                        success: function(d) {
                            if (typeof(d) == 'object') {
                                _log = d;
                            } else {
                                _log = false;
                            }
                        }
                    });
                    return _log;
                }

                // 设置备注方法
                function SetRemark(dataDataID){
                    var currentUID = <!-- BEGIN 当前用户ID ATTRIB= --><!-- END 当前用户ID -->;
                    var $msgRemark = $('#spu-nav-remark');
                    var $msgForm = $msgRemark.find('form');
                    var tempRemark = $('#tmp-remark').html();
                    var $remarkBtn = $msgForm.find('input[type="reset"]');
                    var urlUp = '/Product/Api/?Do=MessageSave&FID=' + dataDataID;
                    var urlGet = '/Product/Api/?Do=MessageQuery&FID=' + dataDataID;
                    var urlDel = '/Product/Api/?Do=MessageDelete&FID=' + dataDataID;

                    // 移除绑定事件
                    $msgForm.unbind();
                    $remarkBtn.unbind();

                    // 更新备注
                    common.remarkUpdate(dataDataID, $msgRemark, $msgForm, tempRemark, $remarkBtn, currentUID, urlUp, urlGet, urlDel);

                    //提交备注
                    common.remarkSave(dataDataID, $msgRemark, $msgForm, tempRemark, $remarkBtn, currentUID, urlUp, urlGet, urlDel);

                    //判断备注能否编辑和删除，如果备注的UID符合当前用户UID，则可以编辑或删除，并且绑定事件
                    common.editAndDel(dataDataID, $msgRemark, $msgForm, tempRemark, $remarkBtn, currentUID, urlUp, urlGet, urlDel);

                    //编辑备注的[取消]按钮事件
                    common.reset($msgForm, $remarkBtn);
                }

            }());
// ================================================ SPU部分 =================================================
// 
// ================================================ SKU部分 =================================================

            // 款式
            (function() {
                // 设置款式模态框
                var $modalSetStyle = $('#modal-set-style'); 
                // 属性设置模态框
                var $modalSkuEdit = $('#modal-sku-edit');
                // 设置款式的按钮
                var $setStyleBtn = $('.btn-set-style'); 
                // 设置款式的数据模态框
                var tmpSetStyle = $('#tmp-set-style').html(); 
                var skuID;
                var spuID;

                // 打开和遍历SKU数据到模态框
                $setStyleBtn.on('click', function() {
                    // 获取SpuCode
                    var spuName = $(this).data('spuname');
                    skuID = $(this).closest('tr').data('id');
                    spuID = $(this).closest('tr').data('spuid');

                    // 获取SKU数据
                    GetSkuData(spuID, spuName);

                    // 打开模态框
                    $modalSetStyle.modal('show');
                });

                // 添加SKU
                $('#modal-btn-sku-add').on('click', function() {
                    SkuAdd();
                });

                // 遍历SKU设置页面
                $('.btn-sku-attr').on('click', function() {
                    // 获取ID
                    skuID = $(this).closest('tr').data('id');

                    // 获取SPU和SKU信息
                    GetSpuAndSkuData(skuID);

                    $modalSkuEdit.modal('show');
                });

                // 更新SKU设置
                $('#sku-edit-save').on('click', function() {
                    var sizeString = SizeCheck($('#sku-size'));
                    var skuAttr = {
                        'DataID': skuID,
                        'Mode': 'Full',
                        'Sku': $modalSkuEdit.data('sku'),
                        'Style': $modalSkuEdit.data('style'),
                        'DeclareName': $('#sku-declare').val(),
                        'DeclareValue': $('#sku-usd').val(),
                        'Size': sizeString,
                        'Weight': $('#sku-weight').val(),
                        'Status': $('#sku-state').val(),
                        'Battery': $('#sku-battery').val()
                    };

                    // 更新SKU数据
                    SkuUpdate(skuAttr);

                });

                // 设置款式的模态框里面打开设置属性的模态框（喵喵喵？）
                function ActivationSpuToSkuBtn() {
                    $('.modal-btn-sku-attr').on('click', function() {
                        $modalSetStyle.modal('hide');

                        // 获取和遍历SKU和SPU的数据
                        GetSpuAndSkuData(skuID);

                        $modalSkuEdit.modal('show');
                    });
                }

                // 获取SPU和SKU的信息
                function GetSpuAndSkuData(skuid) {
                    $.ajax({
                        url: '/Product/Api/?Do=SkuQuery&DataID=' + skuid,
                        type: 'GET',
                        dataType: 'JSON',
                        success: function(spuData) {
                            // 遍历数据
                            $modalSkuEdit.attr('data-sku', spuData.Sku.SkuCode);
                            $modalSkuEdit.attr('data-style', spuData.Sku.Style);
                            $('#sku-declare').val(spuData.Sku.DeclareName);
                            $('#sku-usd').val(spuData.Sku.DeclareValue);
                            $('#sku-size').val(spuData.Sku.Size);
                            $('#sku-weight').val(spuData.Sku.Weight);
                            $('#sku-battery').val(spuData.Sku.Battery);
                            
                            $('#public-spu-declare').val(spuData.Spu.SpuDeclareName);
                            $('#public-spu-usd').val(spuData.Spu.SpuDeclareValue);
                            $('#public-spu-size').val(spuData.Spu.SpuSize);
                            $('#public-spu-weight').val(spuData.Spu.SpuWeight);
                            $('#public-spu-state').val(spuData.Basic.Status);
                            $('#public-spu-battery').val(spuData.Spu.SpuBattery);

                            $('#sku-state').val(spuData.Basic.Status);
                        }
                    });
               }

                // 获取SKU数据的方法
                function GetSkuData(spuid, spuName) {
                    // 获取款式数据
                    $.ajax({
                        url: '/Product/Product.aspx?Do=SpuGetSkuList&DataID=' + spuid,
                        type: 'get',
                        dataType: 'json',
                        success: function(d){
                            if (spuName) {
                                // 更改模态框的标题
                                $modalSetStyle.find('.modal-title').html('设置 <span class="text-primary">'+ spuName +'</span> 的款式');
                            }
                            // 遍历数据
                            $modalSetStyle.find('tbody').html(Mustache.render(tmpSetStyle, d));
                            // 遍历状态
                            $modalSetStyle.find('select').each(function(){
                                var _status = $(this).data('status');
                                $(this).find('option[value="'+ _status +'"]').attr('selected', true);
                            });

                            // 激活SKU基本信息更新按钮
                            ActivationSkuUpdateBtn();

                            // 激活款式设置到属性设置的按钮
                            ActivationSpuToSkuBtn();
                        }
                    });
                }

                // 添加SKU的方法
                function SkuAdd() {
                    var _skuString = $('#modal-sku-add').val();
                    common.ajax({
                        title: '添加SKU',
                        URL: '/Product/Product.aspx?Do=SkuCreate',
                        type: 'POST',
                        data: {
                            DataID: spuID,
                            Sku: _skuString
                        },
                        good: function(d) {
                            common.alert({
                                type: 'success',
                                title: 'SKU添加',
                                time: 1000,
                                msg: '成功，' + d.Message,
                                cb: function() {
                                    // 成功后刷新数据
                                    GetSkuData(spuID);
                                }
                            });
                        }
                    });
                }

                // 激活更新按钮 - 更新基本信息
                function ActivationSkuUpdateBtn() {
                    // 更新SKU - Basic
                    $('.modal-btn-sku-update').on('click', function() {
                        var thisTr = $(this).closest('tr');
                        var skuID = thisTr.data('id');
                        var skuAttr = {
                            'DataID': skuID,
                            'Mode': 'Basic',
                            'Sku': thisTr.find('input[name="code"]').val(),
                            'Style': thisTr.find('input[name="style"]').val(),
                            'Status': thisTr.find('select[name="status"]').val()
                        };

                        // 更新SKU
                        SkuUpdate(skuAttr);
                    });
                }

                /**
                 * 更新SKU的方法
                 * @param Json  D    Data Json
                 */
                function SkuUpdate(D) {
                    common.ajax({
                        title: 'SKU信息更新',
                        URL: '/Product/Product.aspx?Do=SkuSave',
                        type: 'POST',
                        data: D,
                        good: function(d) {
                            common.alert({
                                type: 'success',
                                title: 'SKU信息更新成功，',
                                msg: d.Message,
                                cb: function() {
                                    if (D.Mode == 'Full') {
                                        window.location.reload();
                                    }
                                }
                            });
                        }
                    });
                }

            })();

// ================================================ SKU部分 =================================================

// ================================================ 公共方法 ================================================
            
            /**
             * 检查产品尺寸输入是否符合格式，不符合强制转换
             * @param Object input 尺寸的输入框
             */
            function SizeCheck(input) {
                var val = input.val();
                var valArray = val.split('*');
                valArray = valArray.sort(function(a, b){return b - a});
                var loopNum = 3 - valArray.length;
                if (loopNum > 0) {
                    for(var i = 0; i < loopNum; i++) {
                        valArray.push(0);
                    }
                }
                var sizeString = valArray.join('*');
                return sizeString;
            }

// ================================================ 公共方法 =================================================
            // 产品状态
            (function () {
                var $formSearch = $('#form-search'),
                    $buttons = $formSearch.find('.btn-group[data-toggle="buttons"]'),
                    status = common.URL.parse().Status,
                    status = +status >= 0 ? status : 1;

                $buttons.find('input[value="' + status + '"]').prop('checked', true).closest('.btn').addClass('active');

                $buttons.find('.btn').on('click', function () {
                    $buttons.find('input').prop('checked', false);
                    $(this).find('input').prop('checked', true);
                    $formSearch.submit();
                });

                $dataList.find('.status span').each(function () {
                    var $this = $(this);
                    $this.addClass('label-' + common.order.proStatus($this.text()));
                });
            }());

            // SPU Setup 如果为空，就删除该td内的内容
            (function() {
                var $spuCode = $dataList.find('.btn-spu-edit');
                $spuCode.each(function() {
                        if (!$(this).data('code')) {
                        $(this).closest('td').empty();
                    }
                });
            })();

            // 列表SKU可复制
            (function() {
                ZeroClipboard.config({swfPath: '/Resource/flash/ZeroClipboard.swf'});
                var $copyTarget = $dataList.find('.copy');
                var clip = new ZeroClipboard($copyTarget);

                // 添加鼠标滑过效果
                $copyTarget.on({
                    mousemove: function() {$(this).addClass('bg-primary')},
                    mouseout: function() {$(this).removeClass('bg-primary')}
                });
            })();

            // 搜索
            (function(){
                var $formSearch = $('#form-search');
                var $urlTag = $('#url-tag');
                var $btnTag = $('.btn-tag');
                var tagID = oParam.TagID;

                $urlTag.val(tagID);
                $formSearch.find('#url-do').val(oParam.Do);
                $formSearch.find('input[type="text"]').val(decodeURI((oParam.KeyWord || '').replace(/\++/g, ' ')));
                $formSearch.find('select').find('option[value="' + decodeURI(oParam.Selected) + '"]').prop('selected', true);
                $formSearch.find('select option[value="' + (oParam.TeamID || $formSearch.find('select').data('default')) + '"]').prop('selected', true);

                //Tag标签渲染
                $btnTag.each(function() {
                    var _thisTagID = $(this).data('id');
                    if (_thisTagID == tagID) {
                        $(this).removeClass('label-default').addClass('label-success');
                    }
                });

                // Tag标签点击事件
                $btnTag.on('click', function() {
                    var _tagID = $(this).data('id');
                    $urlTag.val(_tagID);
                    $formSearch.submit();
                });
            })();

            // 列表销售/清仓/下架渲染
            (function() {
                var $skuStatusSpan = $('.sku-status');
                var _skuStatus = ['销售', '清仓', '下架'];
                var _skuStyle = ['success', 'warning', 'danger'];
                $skuStatusSpan.each(function() {
                    $(this).addClass('label-' + _skuStyle[$.inArray($(this).text(), _skuStatus)]);
                });
            })();

            // 标签页定位
            $('.nav a[href="' + location.search.split('&')[0] + '"]').closest('li').addClass('active');

            <!-- BEGIN 分页脚本 ATTRIB= -->
            common.showPage({当前页}, {总条数}, {每页条数});
            <!-- END 分页脚本 -->
        }());
    </script>
</body>
</html>
