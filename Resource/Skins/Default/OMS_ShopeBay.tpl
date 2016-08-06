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
            <caption>eBay 店铺管理</caption>
            <thead>
                <tr>
                    <th>店铺编号</th>
                    <th>别称</th>
                    <th>账号名称</th>
					<th>店铺邮箱</th>
					<th>OOS设置</th>
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
					<td>{Mail}</td>
					<td>{OutOfStock}</td>
					<td>{Date}</td>
                    <td>
                        <a title="编辑" class="btn-edit" href="javascript:;"><span class="glyphicon glyphicon-pencil"></span></a>
                        &nbsp;&nbsp;
                        <a class="btn-accredit" href="javascript:;" title="账号授权"><span class="glyphicon glyphicon-user text-success"></span></a>
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
						<h4 class="modal-title">进行eBay店铺设置</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label class="col-sm-2 control-label">店铺编号</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="DataID" ID="DataID" placeholder="店铺编号，系统自动分配" readonly>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">店铺别名</label>
							<div class="col-sm-10">
                                <input type="text" class="form-control" name="Name" ID="Name" placeholder="填登录账号的名称，不是店铺名称">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">账号名称</label>
                            <div class="col-sm-10">
								<input type="text" class="form-control" name="Alias" ID="Alias" placeholder="自定义店铺别名，用于系统里显示">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">店铺邮箱</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="Mail" ID="Mail" placeholder="店铺里绑定的邮箱">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">OutOfStock</label>
							<div class="col-sm-10">
                                <label class="radio-inline"><input type="radio" name="OutOfStock" value="0" checked>不使用</label>
                                <label class="radio-inline"><input type="radio" name="OutOfStock" value="1">使用</label>
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

    <!-- 账号授权-->
    <div id="accredit-case" class="modal fade" tabIndex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                    <h4 class="modal-title">账号授权结果</h4>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">授权失败</button>
                    <button type="submit" class="btn btn-primary">授权成功</button>
                </div>
            </div>
        </div>
    </div>

    {页面底部}{/页面底部}

    <script>
        (function () {
            'use strict';
            
            var $dataList = $('#data-list'),
                $addDataPanel = $('#add-data'),
                $accreditCase = $('#accredit-case'),
                SessionID, DataID;

            // 账号授权
            $dataList.on('click', '.btn-accredit', function () {
                var newWin = open('/Loading.aspx');
                DataID = $(this).closest('tr').data('id');

                common.ajax({
                    title: '测试账号',
                    URL: '?Do=GetSessionID&DataID=' + DataID,
                    good: function(data) {
                        newWin.location = data.Url;
                        SessionID = data.SessionID;
                        $accreditCase.modal('show');
                    },
                    bad: function() {newWin.close();},
                    error: function() {newWin.close();}
                });
            });

            // 授权成功后
            $accreditCase.find('button[type="submit"]').on('click', function() {
                $accreditCase.modal('hide');
                common.ajax({
                    title: '账号授权',
                    URL: '?Do=GetToken&DataID=' + DataID + '&SessionID=' + SessionID,
                    good: function(data) {
                        common.alert({
                            type: 'success',
                            title: '“账号授权”操作：',
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
                        $addDataPanel.find('#Mail').val(data.Mail);
                        $addDataPanel.find('input[name="OutOfStock"][value="' + data.OutOfStock + '"]').prop('checked', true);
                        $addDataPanel.find('#Date').val(data.Date);
                        
                        $addDataPanel.modal('show');
                    }
                });
            });
        }());
    </script>
</body>
</html>
