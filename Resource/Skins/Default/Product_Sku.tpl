{页面属性}{/页面属性}
<body>
	{页顶导航}{/页顶导航}
    <!-- 内容-->
    <article class="container-fluid">
        <header>
            <div class="btn-group btn-group-sm pull-right">
                <button type="button" class="btn btn-success btn-batch" data-toggle="modal" data-target="#batch-panel" disabled><span class="glyphicon glyphicon-indent-left"></span> 批量操作</button>
                <button type="button" class="btn btn-success btn-add-data" data-toggle="modal" data-target="#add-data"><span class="glyphicon glyphicon-plus-sign"></span> 添加数据</button>
            </div>
        </header>

        <!-- 数据列表-->
        <table id="data-list" class="table table-hover table-bordered table-striped table-condensed">
            <caption>[ {SPU} - {Code} ]的款式(SKU)列表</caption>
            <thead>
                <tr>
                    <th><label id="select-all"><input type="checkbox"> 全选</label></th>
					<th>图片</th>
                    <th>款式编号</th>
                    <th>款式编码(SKU)</th>
                    <th>款式名称</th>
                    <th>电池</th>
                    <th>尺寸</th>
                    <th>重量</th>
					<th>状态</th>
                    <th>创建时间</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
				<!-- BEGIN 数据列表 ATTRIB= -->
				<tr data-id="{DataID}">
                    <td><label><input type="checkbox"></label></td>
					<td><img src={Pic}></td>
					<td>{DataID}</td>
					<td>{SKU}</td>
                    <td>{Style}</td>
					<td>{Battery}</td>
                    <td>{Size}</td>
                    <td>{Weight}</td>
					<td>{Status}</td>
					<td>{Date}</td>
                    <td>
                        <a class="btn-edit" href="javascript:;" title="编辑"><span class="glyphicon glyphicon-pencil"></span></a>
                        &nbsp;&nbsp;
                        <a class="btn-bind-freight" href="javascript:;" title="绑定货代服务"><span class="glyphicon glyphicon-plane text-success"></span></a>
                        &nbsp;&nbsp;
                        <a class="btn-del" href="javascript:;" title="删除"><span class="glyphicon glyphicon-remove text-danger"></span></a>
                    </td>
				</tr>
				<!-- END 数据列表 -->
            </tbody>
        </table>
    </article>

    <!-- 添加与编辑-->
	<div id="add-data" class="modal fade" tabIndex="-1">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<form  class="form-horizontal" method="post" action="?Do=Save&SPUID={SPUID}" enctype="multipart/form-data">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
						<h4 class="modal-title">对[ {SPU} ]进行款式设置</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label class="col-sm-2 control-label">款式编号</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="DataID" ID="DataID" placeholder="款式编号，系统自动分配" readonly>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">款式编码(SKU)</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="SKU" ID="SKU" placeholder="款式自定义编码，英文数字，不能带特殊符号">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">款式名称</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="Style" ID="Style" placeholder="中文名称">
							</div>
						</div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">申报名称</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" name="DeclareName" ID="DeclareName" placeholder="申报名称">
                            </div>

                            <label class="col-sm-2 control-label">申报价值</label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" name="DeclareValue" ID="DeclareValue" placeholder="申报价值">
                            </div>
                            <div class="col-sm-1">
                                <p class="form-control-static text-danger"><span class="label label-danger">USD</span></p>
                            </div>
                        </div>
                        <div id="form-group-size" class="form-group">
                            <label class="col-sm-2 control-label">尺寸</label>
                            <div class="col-sm-10">
                                <div class="row">
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control size-input" placeholder="长，单位厘米/cm">
                                    </div>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control size-input" placeholder="宽，单位厘米/cm">
                                    </div>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control size-input" placeholder="高，单位厘米/cm">
                                    </div>
                                </div>
                                <input type="hidden" class="form-control whole-input" name="Size" ID="Size">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">重量</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="Weight" ID="Weight" placeholder="重量，单位为克">
                            </div>
                        </div>
						<div class="form-group">
							<label class="col-sm-2 control-label">款式状态</label>
							<div class="col-sm-4">
								<select class="form-control" name="State" ID="State">
									<option value="">请选择</option>
									<option value="销售">销售</option>
									<option value="清仓">清仓</option>
									<option value="下架">下架</option>
								</select>
							</div>
                            <label class="col-sm-2 control-label">电池</label>
                            <div class="col-sm-4">
                                <select class="form-control" name="Battery" ID="Battery">
                                    <option value="">无</option>
                                    <option value="带电">带电</option>
                                    <option value="纯电">纯电</option>
                                </select>
                            </div>
						</div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">产品图片</label>
                            <div class="col-sm-10">
                                <input class="form-control-static" name="StrFile" type="file" multiple>
                            </div>
                        </div>
                        <div class="form-group thumb">
                            <label class="col-sm-2 control-label">缩略图</label>
                            <div class="col-sm-10">
                                <ul></ul>
                                <button class="btn btn-danger btn-xs batch-del-pic" type="button" disabled>批量删除图片</button>
                            </div>
                        </div>
						<div class="form-group">
							<label class="col-sm-2 control-label">更新时间</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="Date" ID="Date" placeholder="系统自动处理" readonly>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
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
                        <h4 class="modal-title">批量操作</h4>
                    </div>
                    <div class="modal-footer">
                        <button type="reset" class="btn btn-default" data-dismiss="modal">取消</button>
                        <button type="button" class="btn btn-danger btn-batch-del-sku">批量删除</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- 绑定货代-->
    <div id="bind-freight" class="modal fade modal-set-del" tabIndex="-1">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <form  class="form-horizontal" action="javascript:;">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                        <h4 class="modal-title">绑定货代</h4>
                    </div>
                    <div class="modal-body span-block">
                        <div class="form-group">
                            <label class="col-sm-2">已绑货代</label>
                            <div class="col-sm-10 active-freight"></div>
                        </div>
                        <hr>
                        <div class="form-group">
                            <label class="col-sm-2">其余货代</label>
                            <div class="col-sm-4">
                                <div class="list-group">
                                    <a href="javascript:;" class="list-group-item" data-id="11">12</a>
                                    <a href="javascript:;" class="list-group-item" data-id="11">21</a>
                                    <a href="javascript:;" class="list-group-item" data-id="11">12</a>
                                    <a href="javascript:;" class="list-group-item" data-id="11">11</a>
                                </div>
                            </div>
                            <div class="col-sm-6 all-freight"></div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- 货代列表-->
    <template id="temp-freight">
        {{#DataList}}
        <a href="javascript:;" data-id="{{DataID}}" class="list-group-item pd-5">{{Name}}</a>
        {{/DataList}}
    </template>

    {页面底部}{/页面底部}

    <script src="/Resource/js/mustache.js"></script>
    <script>
        (function () {
            'use strict';
            
            var $dataList = $('#data-list'),
                $addDataPanel = $('#add-data'),
                $thumb = $addDataPanel.find('.thumb'),
                $btnDelThumb = $thumb.find('button'),
                $batchPanel = $('#batch-panel'),
                $btnBatch = $('.btn-batch'),
                editID;

            // 设置尺寸机制
            common.setSizeModel($('#form-group-size'));

            // 重置表单
            $('.btn-add-data').on('click', function () {
                $btnDelThumb.prop('disabled', true);
                $thumb.find('ul').empty();
            });

            // 编辑操作
            $dataList.on('click', '.btn-edit', function() {
                editID = $(this).closest('tr').data('id');
                common.ajax({
                    title: '编辑',
                    URL: '?Do=Query&SPUID={SPUID}&DataID=' + editID,
                    good: function(data) {
                        var imgs_html = '';
                        $addDataPanel.find('#DataID').val(data.DataID);
                        $addDataPanel.find('#SKU').val(data.SKU);
                        $addDataPanel.find('#Style').val(data.Name);
                        $addDataPanel.find('#DeclareName').val(data.DeclareName);
                        $addDataPanel.find('#DeclareValue').val(data.DeclareValue);
                        $addDataPanel.find('#Size').val(data.Size).change();
                        $addDataPanel.find('#Weight').val(data.Weight);

                        $addDataPanel.find('#State option[value="' + data.State + '"]').prop('selected', true);
                        $(data.DataList).each(function () {
                            imgs_html += '<li class="text-center" data-id="' + this.DataID + '">' +
                                '<span title="点击删除图片">&times;</span>' +
                                '<label>' +
                                '<img src="' + this.Pic + '"><br>' +
                                '<input type="checkbox" name="thumb">' +
                                '</label></li>';
                        });
                        $btnDelThumb.prop('disabled', true);
                        $thumb.find('ul').html(imgs_html);
                        $addDataPanel.find('#Date').val(data.Date);

                        $addDataPanel.modal('show');
                    }
                });
            });
            // 单张图片删除
            $thumb.on('click', 'span', function() {
                if (confirm('您确定要删除该图片？')) {
                    var $li = $(this).closest('li');
                    common.ajax({
                        title: '删除图片',
                        URL: '?Do=DelPic&SPUID={SPUID}&SKUID=' + editID + '&DataID=' + $li.data('id'),
                        good: function (data) {
                            common.alert({
                                type: 'success',
                                title: '“删除图片”操作：',
                                msg: data.Message || '成功！'
                            });
                            $li.remove();
                        }
                    });
                }
            // 图片选择框
            }).on('change', 'input', function() {
                $btnDelThumb.prop('disabled', !!!$thumb.find('input:checked').length);
            });
            // 批量删除图片
            $btnDelThumb.on('click', function () {
                if (confirm('您确定要删除这些图片？')) {
                    var $lis = $thumb.find('input:checked').closest('li');
                    
                    common.ajax({
                        title: '批量删除图片',
                        URL: '?Do=DelPic&SPUID={SPUID}&SKUID=' + editID + '&DataID=' + common.getChecked($thumb, 'li', 'data-id'),
                        good: function (data) {
                            common.alert({
                                type: 'success',
                                title: '“批量删除图片”操作：',
                                msg: data.Message || '成功！'
                            });
                            $lis.remove();
                            $btnDelThumb.prop('disabled', true);
                        }
                    });
                }
            });
            // 批量删除SKU
            $batchPanel.find('.btn-batch-del-sku').on('click', function () {
                if (confirm('您确定要删除这些SKU？')) {
                    common.ajax({
                        title: '批量删除SKU',
                        URL: '?Do=Del&SPUID={SPUID}&DataID=' + common.getChecked($dataList.find('tbody'), 'tr', 'data-id'),
                        good: function (data) {
                            common.alert({
                                type: 'success',
                                title: '“批量删除SKU”操作：',
                                msg: data.Message || '成功！'
                            });
                            $batchPanel.modal('hide');
                        }
                    });
                }
            });
            $dataList.find('tbody').on('change', 'input[type="checkbox"]', function() {
                $btnBatch.prop('disabled', !!!$dataList.find('tbody input:checked').length);
            });

            // 货代处理
            (function () {
                var $freightPanel = $('#bind-freight'),
                    $allFreight = $freightPanel.find('.all-freight'),
                    $activeFreight = $freightPanel.find('.active-freight'),
                    tempFreight = $('#temp-freight').html(),
                    freightList = false, serviceList = [], activeIDs = [], activeList = [];

                // 追加货代
                function addService() {
                    var i = 0,
                        len = serviceList.length,
                        pHtml = '',
                        aHtml = '',
                        id;
                    for (; i < len; i++) {
                        id = serviceList[i].DataID;
                        if ($.inArray(id, activeIDs) >= 0) {
                            continue;
                        }
                        pHtml += '<span title="点击添加货代" class="label label-success" data-id="' + id +
                            '"><b>+ </b>' + serviceList[i].Name + '（' + serviceList[i].Code + '）</span>&nbsp;';
                    }

                    for (i = 0, len = activeList.length; i < len; i++) {
                        aHtml += '<span title="点击删除货代" class="label label-danger" data-id="' + activeList[i].DataID +
                        '"><b>&times; </b>' + activeList[i].Name + '（' + activeList[i].Code + '）</span>&nbsp;';
                    }

                    $allFreight.html(pHtml);
                    $activeFreight.html(aHtml);
                }

                // 选择货代
                $freightPanel.find('.list-group').on('click', 'a', function () {
                    var $this = $(this);
                    if ($this.hasClass('active')) {return;}
                    $freightPanel.find('.list-group a').removeClass('active');
                    $this.addClass('active');

                    common.ajax({
                        title: '选择货代',
                        URL: '/Logistics/Logistics.aspx?Do=ServiceListByFreightID&DataID=' + $this.data('id'),
                        good: function(data) {
                            serviceList = data.DataList;
                            addService();
                        }
                    });
                });

                // 货代设置
                $dataList.on('click', '.btn-bind-freight', function() {
                    var id = $(this).closest('tr').data('id');
                    getSelfService(id);
                    if (!freightList) {
                        // 所有货代
                        common.ajax({
                            title: '获取所有货代',
                            URL: '/Logistics/Freight.aspx?Do=List',
                            good: function(data) {
                                freightList = true;
                                $freightPanel.find('.list-group').html(Mustache.render(tempFreight, data));
                            }
                        });
                    }
                });

                // 获取已有货代服务
                function getSelfService(id) {
                    common.ajax({
                        title: '获取自身货代服务',
                        URL: '/Product/Product.aspx?Do=ServiceList&DataID=' + id,
                        good: function(data) {
                            activeIDs = data.DataList.map(function(ele) {
                                return ele.DataID;
                            });
                            activeList = data.DataList;
                            $freightPanel.modal('show').data('id', id);
                            addService();
                        }
                    });
                }

                // 添加货代服务
                $allFreight.on('click', 'span', function() {
                    var id = $(this).data('id');
                    common.ajax({
                        title: '添加货代服务',
                        URL: '/Product/Product.aspx?Do=ServiceAdd&DataID=' + $freightPanel.data('id') + '&ServiceID=' + id,
                        good: function (data) {
                            common.alert({
                                type: 'success',
                                title: '“添加货代服务”操作：',
                                msg: data.Message || '成功！'
                            });
                            activeIDs.push(id);
                            serviceList.map(function (ele) {
                                console.log(ele.id, id);
                                if (ele.DataID === id) {
                                    activeList.push(ele);
                                }
                            });
                            addService();
                        }
                    });
                });

                // 删除货代服务
                $activeFreight.on('click', 'span', function() {
                    var id = $(this).data('id');
                    common.ajax({
                        title: '删除货代服务',
                        URL: '/Product/Product.aspx?Do=ServiceCancel&DataID=' + $freightPanel.data('id') + '&ServiceID=' + id,
                        good: function (data) {
                            common.alert({
                                type: 'success',
                                title: '“删除货代服务”操作：',
                                msg: data.Message || '成功！'
                            });
                            activeIDs = activeIDs.filter(function(ele) {
                                return ele !== id;
                            });
                            activeList = activeList.filter(function (ele) {
                                return ele.DataID !== id;
                            });
                            addService();
                        }
                    });
                });
            }());
        }());
    </script>
</body>
</html>
