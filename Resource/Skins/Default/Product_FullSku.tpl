{页面属性}{/页面属性}
<body>
	{页顶导航}{/页顶导航}
    <!-- 内容-->
    <article class="container-fluid">
        <header>
            <form id="form-search" class="form-inline" action="?">
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
            <caption>产品中心</caption>
            <thead>
                <tr>
                    <th><label id="select-all"><input type="checkbox"> 产品编号</label></th>
                    <th>产品编码(SKU)</th>
                    <th>产品名称</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
				<!-- BEGIN 数据列表 ATTRIB= -->
				<tr data-id="{DataID}">
                    <td><label class="checkbox-inline"><input type="checkbox"> {DataID}</label></td>
					<td>{FullSKU}</td>
					<td>{Name}</td>
                    <td>
                        <a title="编辑" class="btn-edit" data-toggle="modal" href="#add-data"><span class="glyphicon glyphicon-pencil"></span></a>
                        &nbsp;&nbsp;
                        <a title="删除" class="btn-del" href="javascript:;"><span class="glyphicon glyphicon-remove text-danger"></span></a>
                    </td>
				</tr>
				<!-- END 数据列表 -->
            </tbody>
            <tfoot><tr><td colspan="7"></td></tr></tfoot>
        </table>
    </article>

    <!-- 添加与编辑-->
	<div id="add-data" class="modal fade modal-nav" tabIndex="-1">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<form  class="form-horizontal" method="post" action="?Do=Save">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
						<h4 class="modal-title">增加 Sold-SKU</h4>
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
                                    <label class="col-sm-2 control-label">产品名称</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="Name" ID="Name" placeholder="中文名称" readonly>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">销售SKU</label>
                                    <div class="col-sm-10">
										<textarea rows="4" name="OMSSKU" ID="OMSSKU"  class="form-control" placeholder="产品自定义编码，英文数字，不能带特殊符号"></textarea>
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
                                        <div class="panel-body list-group pd-0"></div>
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
                                        <div class="panel-body list-group pd-0"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
					</div>
					<div class="modal-footer">
						<button type="reset" class="btn btn-default" data-dismiss="modal">取消</button>
						<button type="submit" class="btn btn-primary">提交</button>
					</div>
				</form>
			</div>
		</div>
	</div>

    <!-- 批量操作-->
    <div id="batch-panel" class="modal fade" tabIndex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <form  class="form-horizontal" method="post" action="?Do=Save">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                        <h4 class="modal-title">进行产品设置</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">产品状态</label>
                            <div class="col-sm-10">
                                <select class="form-control" name="Status" ID="Status">
                                    <option value="">请选择</option>
                                    <option value="销售">销售</option>
                                    <option value="清仓">清仓</option>
                                    <option value="下架">下架</option>
                                </select>
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
                <form  class="form-horizontal" method="post" action="?Do=Up" enctype="multipart/form-data">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                        <h4 class="modal-title">上传附件</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <div class="col-sm-12">
                                <input id="StrFileUp" class="form-control-static" type="file" name="StrFile" accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/octet-stream, application/vnd.ms-excel" value="上传附件">
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
                        <button type="button" class="btn btn-primary">确定</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    {页面底部}{/页面底部}

    <script>
        (function () {
            'use strict';

            var $addDataPanel = $('#add-data'),
                $dataList = $('#data-list'),
                $batchPanel = $('#batch-panel'),
                $btnBatch = $('.btn-batch'),
                // 关联操作
                $tag = $addDataPanel.find('.tag'),
                tagList, tagActiveList,
                $allTagPanel = $addDataPanel.find('.all-tag .list-group'),
                $activeTagPanel = $addDataPanel.find('.active-tag .list-group'),
                editId;

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
                        tag.TAGID + '" href="javascript:;" class="list-group-item pd-5">' +
                        tag.TAGName + '</a>';
                        continue;
                    }
                    all += '<a data-id="' +
                        tag.TAGID + '" href="javascript:;" class="list-group-item pd-5">' +
                        tag.TAGName + '</a>';
                }

                $allTagPanel.html(all);
                $activeTagPanel.html(active);
            }

            // 上传附件
            $('#modal-upload .modal-footer').on('click', '.btn-primary', function() {
                common.ajaxFE({
                    URL: '?Do=Up',
                    title: '上传附件',
                    type: 'post',
                    FE: 'StrFileUp'
                });
            });

            // 添加数据
            $('.btn-add-data').on('click', function () {
                $tag.prev().find('a').tab('show');
                $tag.addClass('disabled');
            });
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
                        $addDataPanel.find('#Category option[value="' + data.Category + '"]').prop('selected', true);
                        $addDataPanel.find('#State option[value="' + data.State + '"]').prop('selected', true);
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
                            title: '关联TAG：',
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

            // 批量操作的按钮限制
            $dataList.find('tbody').on('change', 'input[type="checkbox"]', function() {
                $btnBatch.prop('disabled', !!!$dataList.find('tbody input:checked').length);
            });

            // 搜索框
            common.formSearch();

            <!-- BEGIN 分页脚本 ATTRIB= -->
            common.showPage({当前页}, {总条数}, {每页条数});
            <!-- END 分页脚本 -->
        }());
    </script>
</body>
</html>
