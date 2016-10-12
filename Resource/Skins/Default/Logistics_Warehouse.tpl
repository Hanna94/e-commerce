{页面属性}{/页面属性}
<body>
	{页顶导航}{/页顶导航}
    <!-- 内容-->
    <article class="container-fluid">
        <header>
            <div class="btn-group btn-group-sm pull-right">
                <button type="button" class="btn btn-default btn-sm btn-download-data">
                    <span class="glyphicon glyphicon-download-alt"></span> 库存导出
                </button>
                <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#take-goods">
                    <span class="glyphicon glyphicon-upload"></span> 收货入库
                </button>
                <button type="button" class="btn btn btn-info btn-sm" data-toggle="modal" data-target="#takeout-goods">
                    <span class="glyphicon glyphicon-upload"></span> 盘点出库
                </button>
                <button type="button" class="btn btn-success btn-sm btn-add-data" data-toggle="modal" data-target="#add-data">
                    <span class="glyphicon glyphicon-plus-sign"></span> 添加数据
                </button>
            </div>
        </header>

        <!-- 数据列表-->
        <table id="data-list" class="table table-hover table-bordered table-striped table-condensed">
            <caption>仓库列表</caption>
            <thead>
                <tr>
                    <th>仓库编号</th>
                    <th>仓库名称</th>
                    <th>仓库编码</th>
					<th>供应商</th>
					<th>仓库类型</th>
					<th>所在地</th>
                    <th>创建时间</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
				<!-- BEGIN 数据列表 ATTRIB= -->
				<tr data-id="{DataID}">
					<td>{DataID}</td>
					<td><a href="Area.aspx?WID={DataID}">{Name}</a></td>
					<td>{Code}</td>
					<td>{Supplier}</td>
					<td>{Type}</td>
					<td>{Location}</td>
					<td>{Date}</td>
                    <td>
                        <a title="编辑" class="btn-edit" href="javascript:;"><span class="glyphicon glyphicon-pencil"></span></a>
                        &nbsp;&nbsp;
                        <a title="推荐物流" class="btn-priority-logistics" href="javascript:;"><span class="glyphicon glyphicon-plane text-success"></span></a>
                        &nbsp;&nbsp;
                        <a title="删除" class="btn-del" href="javascript:;"><span class="glyphicon glyphicon-remove text-danger"></span></a>
                    </td>
				</tr>
				<!-- END 数据列表 -->
            </tbody>
        </table>
    </article>
    
    <!-- 收货入库模态框 -->
    <div id="take-goods" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <form class="form-horizontal" action="javascript:;" method="post" enctype="multipart/form-data">
                    <div class="modal-header">
                        <button class="close" data-dismiss="modal">×</button>
                        <h4 class="modal-title">收货入库</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="tg-upload-Code">仓库列表</label>
                            <div class="col-sm-10">
                                <select name="WID" id="tg-upload-Code" class="form-control"></select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">文件上传</label>
                            <div class="col-sm-10 form-control-static">
                                <input type="file" id="take-goods-file" name="StrFile" accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/octet-stream, application/vnd.ms-excel" value="上传表格完成收货入库" />
                            </div>
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
                        <button class="btn btn-default" type="button" data-dismiss="modal">取消</button>
                        <button class="btn btn-primary" type="submit">确定</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
    <!-- 盘点出库模态框 -->
    <div id="takeout-goods" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <form class="form-horizontal" action="javascript:;" method="post" enctype="multipart/form-data">
                    <div class="modal-header">
                        <button class="close" data-dismiss="modal">×</button>
                        <h4 class="modal-title">盘点出库</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="tog-upload-Code">仓库列表</label>
                            <div class="col-sm-10">
                                <select name="WID" id="tog-upload-Code" class="form-control"></select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">文件上传</label>
                            <div class="col-sm-10 form-control-static">
                                <input type="file" id="takeout-goods-file" name="StrFile" accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/octet-stream, application/vnd.ms-excel" value="上传表格完成盘点出库" />
                            </div>
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
                        <button class="btn btn-default" type="button" data-dismiss="modal">取消</button>
                        <button class="btn btn-primary" type="submit">确定</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- 添加与编辑-->
	<div id="add-data" class="modal fade" tabIndex="-1">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<form  class="form-horizontal" method="post" action="?Do=Save">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
						<h4 class="modal-title">进行仓库设置</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label class="col-sm-2 control-label">仓库编号</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="DataID" ID="DataID" placeholder="仓库编号，系统自动分配" readonly>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">仓库名称</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="Name" ID="Name" placeholder="仓库的命名，中文">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">仓库编码</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="Code" ID="Code" placeholder="产品自定义编码，英文数字，不能带特殊符号，类别GZY">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">仓库供应商</label>
							<div class="col-sm-10">
								<select class="form-control" name="Supplier" ID="Supplier">
									<!-- BEGIN 供应商列表 ATTRIB= -->
									<option value="{供应商名称}">{供应商名称}</option>
									<!-- END 供应商列表 -->
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">仓库类型</label>
							<div class="col-sm-10">
								<select class="form-control" name="Type" ID="Type">
									<option value="自营国内">自营国内</option>
									<option value="合作国内">合作国内</option>
									<option value="合作海外">合作海外</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">仓库所在地</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="Location" ID="Location" placeholder="仓库所在地，英文缩写，如 GZ">
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

    <!-- 推荐物流-->
    <div id="bind-freight" class="modal fade modal-set-del" tabIndex="-1">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <form  class="form-horizontal" action="javascript:;">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                        <h4 class="modal-title">推荐物流</h4>
                    </div>
                    <div class="modal-body span-block">
                        <div class="form-group">
                            <label class="col-sm-2">已推荐物流</label>
                            <div class="col-sm-10 active-freight"></div>
                        </div>
                        <hr>
                        <div class="form-group">
                            <label class="col-sm-2">其余物流</label>
                            <div class="col-sm-10 all-freight"></div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- 收货入库and盘点出库的仓库列表模板 -->
    <template id="temp-Code">
    {{#DataList}}
        <option value="{{DataID}}" name= "{{Type}}">{{Name}}</option>
    {{/DataList}}
    </template>

    {页面底部}{/页面底部}

    <script src="/Resource/js/mustache.js"></script>
    <script>
        (function () {
            'use strict';
            var $addDataPanel = $('#add-data'),
                $dataList = $('#data-list'),
                $tog = $('#tog-upload-Code'),
                $tg = $('#tg-upload-Code'),
                tempCode = $('#temp-Code').html(),
                $togForm = $('#takeout-goods form'),
                $tgForm = $('#take-goods form'),
                $btnDownloadData = $('.btn-download-data'); //库存导出按钮

            //盘点出库和收货入库的列表
            common.ajax({
                title: '仓库列表',
                URL: '/Logistics/Logistics.aspx?Do=List',
                good: function(data){
                    var d = data;
                    $tog.html(Mustache.render(tempCode, d)).find('option[name!="自营国内"]').remove();
                    $tg.html(Mustache.render(tempCode, d)).find('option[name!="自营国内"]').remove();
                    $tog.find('option[value="10"]').prop('selected', true);
                    $tg.find('option[value="10"]').prop('selected', true);
                }
            });

            // 库存导出
            (function(){
                $btnDownloadData.on('click', function(){
                    var ts = $(this);
                    if (confirm('库存导出操作可能需要1~2分钟时间，期间请耐心等待')) {
                        common.loading.show(); // 显示加载图
                        ts.attr('disabled', 'disabled').text('处理中...');
                        $.ajax({
                            url: '/Report/Api/File.aspx?Do=WarehouseStock&WID=10',
                            type: 'GET',
                            success: function(data){
                                common.alertIf({
                                    title: '库存导出',
                                    data: data,
                                    tcb: function(){
                                        common.loading.hide();
                                        ts.removeAttr('disabled').text('库存导出');
                                    }
                                });
                            }
                        });
                    }
                    
                });
            })();

            //出库入库文件上传操作
            (function(){
                //出库文件上传
                $togForm.on('submit', function(){
                    $togForm.on('submit', function(){
                        common.ajaxFE({
                            title: '盘点出库',
                            URL: '/Logistics/Logistics.aspx?Do=SetStockOut',
                            FE: 'takeout-goods-file',
                            type: 'post',
                            data: { WID: $tg.val() },
                            ok: function(data){
                                common.alert({
                                    type: 'success',
                                    title: '“盘点出库文件上传”操作：',
                                    msg: data.Message || '成功！'
                                });
                            }
                        });
                    });
                });
                //入库文件上传
                $tgForm.on('submit', function(){
                    common.ajaxFE({
                        title: '收货入库',
                        URL: '/Logistics/Logistics.aspx?Do=SetStockIn',
                        FE: 'take-goods-file',
                        type: 'post',
                        data: { WID: $tg.val() },
                        ok: function(data){
                            common.alert({
                                type: 'success',
                                title: '“收货入库文件上传”操作：',
                                msg: data.Message || '成功！'
                            });
                        }
                    });
                });

            })();

            // 编辑操作
            $dataList.on('click', '.btn-edit', function() {
                common.ajax({
                    title: '编辑',
                    URL: '?Do=Query&DataID=' + $(this).closest('tr').data('id'),
                    good: function(data) {
                        $addDataPanel.find('#DataID').val(data.DataID);
                        $addDataPanel.find('#Name').val(data.Name);
                        $addDataPanel.find('#Code').val(data.Code);
                        $addDataPanel.find('select[name="Supplier"] option[value="' + data.Supplier + '"]').prop('selected', true);
                        $addDataPanel.find('select[name="Type"] option[value="' + data.Type + '"]').prop('selected', true);
                        $addDataPanel.find('#Location').val(data.Location);
                        $addDataPanel.find('#Date').val(data.Date);
                        $addDataPanel.modal('show');
                    }
                });
            });

            // 物流处理
            (function () {
                var $freightPanel = $('#bind-freight'),
                    $allFreight = $freightPanel.find('.all-freight'),
                    $activeFreight = $freightPanel.find('.active-freight'),
                    freightList, activeList;

                // 追加物流
                function addFreight() {
                    var i = 0,
                        len = freightList.length,
                        pHtml = '',
                        aHtml = '',
                        id;
                    for (; i < len; i++) {
                        id = freightList[i].DataID;
                        if ($.inArray(id, activeList) >= 0) {
                            aHtml += '<span title="点击删除物流" class="label label-danger" data-id="' + id +
                            '"><b>&times; </b>' + freightList[i].Name + '（' + freightList[i].Location + '）</span>&nbsp;';
                            continue;
                        }
                        pHtml += '<span title="点击添加物流" class="label label-success" data-id="' + id +
                            '"><b>+ </b>' + freightList[i].Name + '（' + freightList[i].Location + '）</span>&nbsp;';
                    }
                    $allFreight.html(pHtml);
                    $activeFreight.html(aHtml);
                }

                // 物流设置
                $dataList.on('click', '.btn-priority-logistics', function() {
                    var id = $(this).closest('tr').data('id');
                    if (!freightList) {
                        // 所有物流
                        common.ajax({
                            notload: true,
                            title: '获取所有物流',
                            URL: '/Logistics/Freight.aspx?Do=List',
                            good: function(data) {
                                freightList = data.DataList;
                                getSelfFreight(id);
                            }
                        });
                        return;
                    }
                    getSelfFreight(id);
                });

                // 获取已有物流
                function getSelfFreight(id) {
                    common.ajax({
                        title: '获取自身物流',
                        URL: '?Do=FreightList&DataID=' + id,
                        good: function(data) {
                            activeList = data.DataList.map(function(ele) {
                                return ele.DataID;
                            });;
                            addFreight();
                            $freightPanel.modal('show').data('id', id);
                        }
                    });
                }

                // 添加物流
                $allFreight.on('click', 'span', function() {
                    var id = $(this).data('id');
                    common.ajax({
                        title: '添加物流',
                        URL: '?Do=FreightAdd&DataID=' + $freightPanel.data('id') + '&FID=' + id,
                        good: function (data) {
                            common.alert({
                                type: 'success',
                                title: '“添加物流”操作：',
                                msg: data.Message || '成功！'
                            });
                            activeList.push(id);
                            addFreight();
                        }
                    });
                });

                // 删除物流
                $activeFreight.on('click', 'span', function() {
                    var id = $(this).data('id');
                    common.ajax({
                        title: '删除物流',
                        URL: '?Do=FreightCancel&DataID=' + $freightPanel.data('id') + '&FID=' + id,
                        good: function (data) {
                            common.alert({
                                type: 'success',
                                title: '“删除物流”操作：',
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
        }());
    </script>
</body>
</html>
