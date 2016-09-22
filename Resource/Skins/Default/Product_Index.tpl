{页面属性}{/页面属性}
<body>
	{页顶导航}{/页顶导航}
    <!-- 内容-->
    <article class="container-fluid">
        <header>
            <form id="form-search" class="form-inline" action="?">
                <div class="btn-group btn-group-xs" data-toggle="buttons">
                    <label class="btn btn-primary">
                        <input type="radio" name="Status" value="0" autocomplete="off">全部
                    </label>
                    <label class="btn btn-success">
                        <input type="radio" name="Status" value="1" autocomplete="off">销售
                    </label>
                    <label class="btn btn-warning">
                        <input type="radio" name="Status" value="2" autocomplete="off">清仓
                    </label>
                    <label class="btn btn-danger">
                        <input type="radio" name="Status" value="3" autocomplete="off">下架
                    </label>
                </div>

                &nbsp;&nbsp;
                
                <div class="form-group form-group-sm">
                    <select id="TeamID" class="form-control" name="TeamID" data-default="{TeamID}">
						<option value = "-1">未分配</option>
                        <option value = "0">所有团队</option>
                        <!-- BEGIN 销售团队 ATTRIB= -->
                        <option value="{DataID}">{Name}</option>
                        <!-- END 销售团队 -->
                    </select>
                </div>

                &nbsp;&nbsp;

                <div class="input-group input-group-sm">
                    <input type="text" class="form-control" placeholder="Search..." name="KeyWord">
                    <span class="input-group-btn">
                        <button class="btn btn-default" type="submit"><span class="glyphicon glyphicon-search"></span> 搜索</button>
                    </span>
                </div>

                <div class="btn-group btn-group-sm pull-right">
                    <button type="button" class="btn btn-success btn-batch" data-toggle="modal" data-target="#batch-panel" disabled><span class="glyphicon glyphicon-indent-left"></span> 批量操作</button>
                    <button type="button" class="btn btn-success btn-upload" data-toggle="modal" data-target="#modal-upload"><span class="glyphicon glyphicon-upload"></span> 上传SPU</button>
                    <button type="button" class="btn btn-success btn-add-data" data-toggle="modal" data-target="#add-data"><span class="glyphicon glyphicon-plus-sign"></span> 添加数据</button>
                </div>
            </form>
        </header>

        <!-- 数据列表-->
        <table id="data-list" class="table table-hover table-bordered table-striped table-condensed">
            <caption>产品(SPU)列表</caption>
            <thead>
                <tr>
                    <th><label id="select-all"><input type="checkbox"> 全选</label></th>
                    <th>产品编号</th>
                    <th>产品编码(SPU)</th>
                    <th>产品名称</th>
                    <th>创建时间</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
				<!-- BEGIN 数据列表 ATTRIB= -->
				<tr data-id="{DataID}">
                    <td><label><input type="checkbox"></label></td>
					<td>{DataID}</td>
					<td><a href=SKU.aspx?SPUID={DataID}>{SPU}</a></td>
					<td class="status"><span class="label label-">{Status}</span> {Name}</td>
                    <td>{Date}</td>
                    <td>
                        <a title="编辑" class="btn-edit" data-toggle="modal" href="#add-data"><span class="glyphicon glyphicon-pencil"></span></a>
                        &nbsp;&nbsp;
                        <a title="授权团队" class="btn-accredit-team" href="javascript:;"><span class="glyphicon glyphicon-user text-success"></span></a>
                        &nbsp;&nbsp;
                        <a title="删除" class="btn-del" href="javascript:;"><span class="glyphicon glyphicon-remove text-danger"></span></a>
                    </td>
				</tr>
				<!-- END 数据列表 -->
            </tbody>
            <tfoot><tr><td colspan="6"></td></tr></tfoot>
        </table>
    </article>

    <!-- 添加与编辑-->
	<div id="add-data" class="modal fade modal-nav" tabIndex="-1">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<form  class="form-horizontal" method="post" action="?Do=Save">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
						<h4 class="modal-title">进行SPU设置</h4>
					</div>
					<div class="modal-body">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#basic" data-toggle="tab">基本</a></li>
                            <li class="tag disabled"><a href="#tag" data-toggle="tab">关联</a></li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="basic">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">产品编号</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="DataID" ID="DataID" placeholder="产品编号，系统自动分配" readonly>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">产品编码(SPU)</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="SPU" ID="SPU" placeholder="产品自定义编码，英文数字，不能带特殊符号">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">产品名称</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="Name" ID="Name" placeholder="中文名称">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">产品状态</label>
                                    <div class="col-sm-10">
                                        <label class="radio-inline"><input type="radio" name="Status" value="销售">销售</label>
                                        <label class="radio-inline"><input type="radio" name="Status" value="清仓">清仓</label>
                                        <label class="radio-inline"><input type="radio" name="Status" value="下架">下架</label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">更新时间</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="Date" ID="Date" placeholder="系统自动处理" readonly>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane row" id="tag">
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
                        </div>
					</div>
					<div class="modal-footer">
						<button type="reset" class="btn btn-default" data-dismiss="modal">取消</button>
						<button type="submit" class="btn btn-primary" disabled>提交</button>
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

    <!-- 上传文件模态框-->
    <div id="modal-upload" class="modal fade" tabIndex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <form  class="form-horizontal" method="post" action="Product.aspx?Do=Upload" enctype="multipart/form-data">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                        <h4 class="modal-title">上传附件</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <div class="col-sm-12">
                                <input class="form-control-static" type="file" name="StrFile" accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/octet-stream, application/vnd.ms-excel" value="上传附件">
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
                        <button type="submit" class="btn btn-primary">确定</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- 授权团队-->
    <div id="accredit-team" class="modal fade modal-set-del" tabIndex="-1">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <form  class="form-horizontal" action="javascript:;">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                        <h4 class="modal-title">授权团队</h4>
                    </div>
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
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <template id="temp-accredit-team">
        <option>请选择</option>
        {{#DataList}}
        <option value="{{DataID}}">{{Name}}</option>
        {{/DataList}}
    </template>

    {页面底部}{/页面底部}

    <script src="/Resource/js/mustache.js"></script>

    <script>
        (function () {
            'use strict';

            var oParam = common.URL.parse(),
                $addDataPanel = $('#add-data'),
                $dataList = $('#data-list'),
                $batchPanel = $('#batch-panel'),
                $btnBatch = $('.btn-batch'),
                // 关联操作
                $tag = $addDataPanel.find('.tag'),
                tagList, tagActiveList,
                $allTagPanel = $addDataPanel.find('.all-tag .list-group'),
                $activeTagPanel = $addDataPanel.find('.active-tag .list-group'),
                tempAccreditTeam = $('#temp-accredit-team').html(),
                editId, AccreditList;

            // 添加数据
            $('.btn-add-data').on('click', function () {
                $tag.prev().find('a').tab('show');
                $tag.addClass('disabled');
            });

            // 批量操作的按钮限制
            $dataList.find('tbody').on('change', 'input[type="checkbox"]', function() {
                $btnBatch.prop('disabled', !!!$dataList.find('tbody input:checked').length);
            });
            // 批量点击时，获取选中的SPU
            $btnBatch.on('click', function () {
                if (!AccreditList) {
                    getAllTeam(function (data) {
                        // 初始化批量处理的授权团队
                        $batchPanel.find('#TeamID').html(Mustache.render(tempAccreditTeam, data));
                        initBatchPanel();
                    });
                    return;
                }

                initBatchPanel();
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
                    URL: '?Do=SetStatus',
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

            // TAG关联
            (function () {
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

                    $allTagPanel.html(all);
                    $activeTagPanel.html(active);
                }

                // 关联操作限制
                $tag.on('click', function () {
                    return !$tag.hasClass('disabled');
                });
                $dataList.on('click', '.btn-edit', function() {
                    editId = $(this).closest('tr').data('id');
                    // 编辑操作
                    common.ajax({
                        title: '编辑',
                        URL: '?Do=Query&DataID=' + editId,
                        good: function(data) {
                            tagActiveList = data.DataList ? data.DataList.map(function (ele) {
                                return ele.TAGID;
                            }) : [];

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
                                appendtagList();
                            }

                            $addDataPanel.find('#DataID').val(data.DataID);
                            $addDataPanel.find('#SPU').val(data.SPU);
                            $addDataPanel.find('#Name').val(data.Name);

                            $addDataPanel.find('input[name="Status"][value="' + data.Status + '"]').prop('checked', true);
                            
                            $addDataPanel.find('#Date').val(data.Date);

                            $addDataPanel.modal('show');
                        }
                    });
                    // 开放关联操作
                    $tag.prev().find('a').tab('show');
                    $tag.removeClass('disabled');
                });
                // 添加关联操作
                $allTagPanel.on('click', 'a', function() {
                    var $this = $(this);
                    common.ajax({
                        title: '添加关联',
                        URL: '?Do=TAGAdd&DataID=' + editId + '&TAGID=' + $this.data('id'),
                        good: function(data) {
                            common.alert({
                                type: 'success',
                                title: '“添加关联”操作：',
                                msg: data.Message || '成功！'
                            });
                            $activeTagPanel.prepend($this);
                        }
                    });
                });
                // 取消关联操作
                $activeTagPanel.on('click', 'a', function() {
                    var $this = $(this);
                    common.ajax({
                        title: '取消关联',
                        URL: '?Do=TAGCancel&DataID=' + editId + '&TAGID=' + $this.data('id'),
                        good: function(data) {
                            common.alert({
                                type: 'success',
                                title: '“取消关联”操作：',
                                msg: data.Message || '成功！'
                            });
                            $allTagPanel.prepend($this);
                        }
                    });
                });
            }());

            // SPU检测
            (function() {
                $addDataPanel.on('blur', '#Name', function() {
                    $.ajax({
                        url: '/Product/Product.aspx?Do=SpuCheck&Name=' + $(this).val(),
                        type: 'get',
                        dataType: 'json',
                        success: function(d) {
                            common.alertIf({
                                title: 'SPU检测',
                                data: d,
                                time: 1000,
                                tcb: function(){
                                    $addDataPanel.find('button[type="submit"]').removeAttr('disabled');
                                },
                                fcb: function(){
                                    $addDataPanel.find('button[type="submit"]').attr('disabled', 'disabled');
                                }
                            });
                        }
                    });
                });
            })();
            // 授权团队
            (function () {
                var $panelAccreditTeam = $('#accredit-team'),
                    $allAccredit = $panelAccreditTeam.find('.all-accredit-team'),
                    $activeAccredit = $panelAccreditTeam.find('.active-accredit-team'),
                    activeList;
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
                            aHtml += '<span title="点击取消授权团队" class="label label-danger" data-id="' + id +
                            '"><b>&times; </b>' + AccreditList[i].Name + '</span>&nbsp;';
                            continue;
                        }
                        pHtml += '<span title="点击添加授权团队" class="label label-success" data-id="' + id +
                            '"><b>+ </b>' + AccreditList[i].Name + '</span>&nbsp;';
                    }
                    $allAccredit.html(pHtml);
                    $activeAccredit.html(aHtml);
                }

                // 授权团队设置
                $dataList.on('click', '.btn-accredit-team', function() {
                    var id = $(this).closest('tr').data('id');
                    if (!AccreditList) {
                        getAllTeam(function () {
                            getSelfTeam(id);
                        });
                        return;
                    }
                    
                    getSelfTeam(id);
                });

                // 获取自身已授权团队
                function getSelfTeam(id) {
                    common.ajax({
                        title: '获取已授权团队',
                        URL: '?Do=TeamList&DataID=' + id,
                        good: function(data) {
                            activeList = data.DataList.map(function(ele) {
                                return ele.TeamID;
                            });;
                            addFreight();
                            $panelAccreditTeam.modal('show').data('id', id);
                        }
                    });
                }

                // 添加授权团队
                $allAccredit.on('click', 'span', function() {
                    var id = $(this).data('id');
                    common.ajax({
                        title: '添加授权团队',
                        URL: '?Do=TeamAdd&DataID=' + $panelAccreditTeam.data('id') + '&TeamID=' + id,
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

                // 取消授权团队
                $activeAccredit.on('click', 'span', function() {
                    var id = $(this).data('id');
                    common.ajax({
                        title: '取消授权团队',
                        URL: '?Do=TeamCancel&DataID=' + $panelAccreditTeam.data('id') + '&TeamID=' + id,
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
            }());

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

            // 搜索框
            (function(){
                 // common.formSearch();  
                var $formSearch = $('#form-search'),
                    oParam = common.URL.parse();
                    
                $formSearch.find('input[type="text"]').val(decodeURI((oParam.KeyWord || '').replace(/\++/g, ' ')));
                $formSearch.find('select').find('option[value="' + decodeURI(oParam.Selected) + '"]').prop('selected', true);
                $formSearch.find('select option[value="' + (oParam.TeamID || $formSearch.find('select').data('default')) + '"]').prop('selected', true);
            })();

            <!-- BEGIN 分页脚本 ATTRIB= -->
            common.showPage({当前页}, {总条数}, {每页条数});
            <!-- END 分页脚本 -->
        }());
    </script>
</body>
</html>
