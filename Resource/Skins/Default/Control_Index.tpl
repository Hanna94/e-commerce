{页面属性}{/页面属性}
<body>
	{页顶导航}{/页顶导航}
    <!-- 内容-->
    <article class="container-fluid">
        <header>
            <div class="btn-group pull-right">
                <button id="btn-batch" class="btn btn-default btn-sm" data-toggle="modal" data-target="#edit-status" disabled="disabled"> 批量修改[执行/停止][0]</button>
                <button class="btn btn-success btn-sm btn-add-data" type="button" data-toggle="modal" data-target="#add-data"><span class="glyphicon glyphicon-plus-sign"></span> 添加数据</button>
            </div>
        </header>

        <!-- 数据列表-->
        <form id="status-upload" method="post" action="javascript:;">
            <table id="data-list" class="table table-hover table-bordered table-striped table-condensed">
                <caption>调度计划列表</caption>
                <thead>
                    <tr>
                        <th><input type="checkbox" id="callAll" value="none">&nbsp;&nbsp;计划编码</th>
    					<th>名称</th>
                        <th>所属模块</th>
                        <th>优先级</th>
    					<th>对接店铺</th>
    					<th>循环类型</th>
    					<th>状态</th>
    					<th>操作用户</th>
                        <th>更新时间</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
    				<!-- BEGIN 数据列表 ATTRIB= -->
    				<tr data-id="{DataID}">
    					<td><input data-DataID="{DataID}" type="checkbox" name="Status">&nbsp;&nbsp;{DataID}</td>
    					<td>{Name}</td>
    					<td>{Model}</td>
    					<td>{Level}</td>
    					<td>{ShopID}</td>
    					<td>{Type}</td>
    					<td>{Status}</td>
    					<td>{UID}</td>
    					<td>{Date}</td>
                        <td>
                            <a class="btn-edit" href="javascript:;" title="编辑"><span class="glyphicon glyphicon-pencil"></span></a>
                            &nbsp;&nbsp;
                            <a class="btn-del" href="javascript:;" title="删除"><span class="glyphicon glyphicon-remove text-danger"></span></a>
                        </td>
    				</tr>
    				<!-- END 数据列表 -->
                </tbody>
                <tfoot><tr><td colspan="10"></td></tr></tfoot>
            </table>
        </form>
    </article>

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
                            <label class="radio-inline"><input type="radio" name="Status" value="0" checked="checked">停止执行</label>
                            <label class="radio-inline"><input type="radio" name="Status" value="1">允许执行</label>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button id="edit-confirm" class="btn btn-danger" data-dismiss="modal">确定</button>
                </div>
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
						<h4 class="modal-title">进行调度计划设置</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label class="col-sm-2 control-label">计划编码</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="DataID" ID="DataID" placeholder="计划编码，系统自动分配" readonly>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">计划名称</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="Name" ID="Name" placeholder="必填">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">所在模块分组</label>
							<div class="col-sm-10">
								<select class="form-control" name="Model" ID="Model">
									<!-- BEGIN 模块分组 ATTRIB= -->
									<option value="{分组名称}">{分组名称}</option>
									<!-- END 模块分组 -->
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">优先级</label>
							<div class="col-sm-10">
                                <label class="radio-inline"><input type="radio" name="Level" value="0" checked>普通</label>
                                <label class="radio-inline"><input type="radio" name="Level" value="1">高</label>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">对接店铺</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="ShopID" ID="ShopID" placeholder="对接店铺ID">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">循环方式</label>
							<div class="col-sm-10">
                                <label class="radio-inline"><input type="radio" name="Type" value="0" checked>按间隔循环</label>
                                <label class="radio-inline"><input type="radio" name="Type" value="1">按固定时间循环</label>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">状态</label>
							<div class="col-sm-10">
                                <label class="radio-inline"><input type="radio" name="Status" value="0" checked>停止执行</label>
                                <label class="radio-inline"><input type="radio" name="Status" value="1">允许执行</label>
							</div>
						</div>
                        <div class="form-group type-1">
                            <label class="col-sm-2 control-label">数据起止时间</label>
							<div class="col-sm-4">
                                <!--
                                    min-view：显示的最小时间选择窗
                                    0：秒
                                    1：时
                                    2：日
                                    3：月
                                    4：年
                                    format：显示格式
                                -->
                                <div id="date-time" class="input-group input-group-sm input-group-datetime">
                                    <input id="DataStartTime" class="start-time form-control text-right" name="DataStartTime" type="text" placeholder="起始时间" value="2006-01-01" data-min-view="2" data-format="yyyy-mm-dd">
                                    <span class="input-group-addon">~</span>
                                    <input ID="DataEndTime" class="end-time form-control" name="DataEndTime" type="text" placeholder="终止时间" value="2016-01-01" data-min-view="2" data-format="yyyy-mm-dd">
                                </div>
                            </div>
                        </div>
                        <div class="form-group type-1">
                            <label class="col-sm-2 control-label">数据间隔</label>
                            <div class="col-sm-10">
								<input type="text" class="form-control" name="DataSpace" ID="DataSpace" placeholder="数据间隔">
							</div>
						</div>
						<div class="form-group type-1">
							<label class="col-sm-2 control-label">执行间隔</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="RequestSpace" ID="RequestSpace" placeholder="计划执行间隔">
							</div>
						</div>
						<div class="form-group type-2">
							<label class="col-sm-2 control-label">执行时间</label>
							<div class="col-sm-2">
								<input class="form-control" type="text" name="ExecuteTime" ID="ExecuteTime" placeholder="例如12:30">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">执行API</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="Api" ID="Api" placeholder="">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">操作参数</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="Parameter" ID="Parameter" placeholder="">
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

    {页面底部}{/页面底部}

    <script src="/Resource/js/bootstrap-datetimepicker.js"></script>

    <script>
        (function() {
            'use strict';
            
            // 时间选择插件
            var $dateTime = $('#date-time'),
                $addDataPanel = $('#add-data'),
                $btnAddData = $('.btn-add-data'),
                $type1 = $addDataPanel.find('.type-1'),
                $type2 = $addDataPanel.find('.type-2').hide(),
                $dataList =$('#data-list'),
                $callAll = $('#callAll'),
                $dataForm = $('#status-upload tbody'),
                $batchBtn = $('#btn-batch'),
                $btnConfirm = $('#edit-confirm'),
                $statusModal = $('#edit-status'),
                checkboxNum = 0;

            // 启动自定义插件
            common.date.activePlug($dateTime);

            // 循环方式
            $addDataPanel.find('input[type="radio"][name="Type"]').change(function () {
                if (+$(this).val()) {
                    $type1.hide();
                    $type2.show();
                } else {
                    $type1.show();
                    $type2.hide();
                }
            });

            // 编辑操作
            $('#data-list').on('click', '.btn-edit', function() {
                common.ajax({
                    title: '编辑',
                    URL: '?Do=Query&DataID=' + $(this).closest('tr').data('id'),
                    good: function(data) {

                        $addDataPanel.find('#DataID').val(data.DataID);
                        $addDataPanel.find('#Name').val(data.Name);
                        $addDataPanel.find('#Model option[value="' + data.Model + '"]').prop('selected', true);
                        $addDataPanel.find('input[name="Level"][value="' + data.Level + '"]').prop('checked', true);
                        $addDataPanel.find('#ShopID').val(data.ShopID);
                        $addDataPanel.find('input[name="Type"][value="' + data.Type + '"]').prop('checked', true).change();
                        $addDataPanel.find('input[name="Status"][value="' + data.Status + '"]').prop('checked', true);
                        $addDataPanel.find('#DataStartTime').val(data.DataStartTime);
                        $addDataPanel.find('#DataEndTime').val(data.DataEndTime);
                        $addDataPanel.find('#DataSpace').val(data.DataSpace);
                        $addDataPanel.find('#RequestSpace').val(data.RequestSpace);
                        $addDataPanel.find('#ExecuteTime').val(data.ExecuteTime);
                        $addDataPanel.find('#Api').val(data.Api);
                        $addDataPanel.find('#Parameter').val(data.Parameter);
                        $addDataPanel.find('#Date').val(data.Date);
                        
                        $addDataPanel.modal('show');
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
                });

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
                        url: '/Control/?Do=SetStatus',
                        type: 'post',
                        dataType: 'json',
                        traditional: true,
                        data: {
                            DataID: DID,
                            Status: STA
                        },
                        success: function(data){
                            common.alert({
                                type: 'success',
                                title: '“批量修改状态”操作：',
                                msg: data.Message || '成功！'
                            });
                            setTimeout(reload, 1000);
                        }
                    });

                    //刷新页面
                    function reload(){
                        window.location.reload();
                    }
                });
            })();
            <!-- BEGIN 分页脚本 ATTRIB= -->
            common.showPage({当前页}, {总条数}, {每页条数});
            <!-- END 分页脚本 -->
        }());
    </script>
</body>
</html>
