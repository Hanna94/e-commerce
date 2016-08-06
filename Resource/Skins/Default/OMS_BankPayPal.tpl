{页面属性}{/页面属性}
<body>
	{页顶导航}{/页顶导航}
    <!-- 内容-->
    <article class="container-fluid">
        <header>
            <button class="btn btn-success btn-sm pull-right btn-add-data" type="button" data-toggle="modal" data-target="#add-data"><span class="glyphicon glyphicon-plus-sign"></span> 添加数据</button>
        </header>

        <!-- 数据列表-->
        <table id="data-list" class="table table-hover table-bordered table-striped table-condensed">
            <caption>PayPal 账户管理</caption>
            <thead>
                <tr>
                    <th>帐户编号</th>
                    <th>别称</th>
                    <th>账户名称</th>
					<th>商户代码</th>
					<th>状态</th>
                    <th>创建时间</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
				<!-- BEGIN 数据列表 ATTRIB= -->
				<tr data-id="{DataID}">
					<td>{DataID}</td>
					<td>{Alias}</td>
					<td>{Name}</td>
					<td>{ReceiverID}</td>
					<td>{Status}</td>
					<td>{Date}</td>
                    <td>
                        <a title="编辑" class="btn-edit" href="javascript:;"><span class="glyphicon glyphicon-pencil"></span></a>
                        &nbsp;&nbsp;
                        <a class="btn-test" href="javascript:;" title="测试"><span class="glyphicon glyphicon-question-sign text-success"></span></a>
                        &nbsp;&nbsp;
                        <a title="删除" class="btn-del" href="javascript:;"><span class="glyphicon glyphicon-remove text-danger"></span></a>
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
				<form  class="form-horizontal" method="post" action="?Do=Save">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
						<h4 class="modal-title">进行PayPal账户设置</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label class="col-sm-2 control-label">账户编号</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="DataID" ID="DataID" placeholder="账户编号，系统自动分配" readonly>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">账户别名</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="Alias" ID="Alias" placeholder="自定义代码，用于系统里显示">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">账户名称</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="Name" ID="Name" placeholder="电子邮箱">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">商家账号(代码)</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="ReceiverID" ID="ReceiverID" placeholder="请从PayPal网站查询">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">ApiUserName</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="ApiUserName" ID="ApiUserName">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">ApiPassWord</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="ApiPassWord" ID="ApiPassWord">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">ApiSignature</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="ApiSignature" ID="ApiSignature">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">账户状态</label>
							<div class="col-sm-10">
                                <label class="radio-inline"><input type="radio" name="Status" value="正常" checked>正常</label>
                                <label class="radio-inline"><input type="radio" name="Status" value="停止">停止</label>
                                <label class="radio-inline"><input type="radio" name="Status" value="备用">备用</label>
								<label class="radio-inline"><input type="radio" name="Status" value="过期">过期</label>
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

    <script>
        (function () {
            'use strict';
            
            var $dataList = $('#data-list'),
                $addDataPanel = $('#add-data');
            // 测试
            $dataList.on('click', '.btn-test', function () {
                common.ajax({
                    title: '测试账号',
                    URL: '?Do=Test&DataID=' + $(this).closest('tr').data('id'),
                    good: function(data) {
                        common.alert({
                            type: 'success',
                            title: '“测试账号”操作：',
                            msg: data.Message || '成功！',
                            time: 10 * 1000
                        });
                    }
                });
            });

            // 编辑操作
            $dataList.on('click', '.btn-edit', function() {
                common.ajax({
                    title: '编辑',
                    URL: '?Do=Query&DataID=' + $(this).closest('tr').data('id'),
                    good: function(data) {
                        $addDataPanel.find('#DataID').val(data.DataID);
                        $addDataPanel.find('#Alias').val(data.Alias);
                        $addDataPanel.find('#Name').val(data.Name);
                        $addDataPanel.find('#ReceiverID').val(data.ReceiverID);
                        $addDataPanel.find('#ApiUserName').val(data.ApiUserName);
                        $addDataPanel.find('#ApiPassWord').val(data.ApiPassWord);
                        $addDataPanel.find('#ApiSignature').val(data.ApiSignature);
                        $addDataPanel.find('input[type="Status"][value="' + data.Status + '"]').prop('checked', true);
                        $addDataPanel.find('#Date').val(data.Date);
                        
                        $addDataPanel.modal('show');
                    }
                });
            });
        }());
    </script>
</body>
</html>
