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

                <button class="btn btn-success btn-sm pull-right btn-add-data" type="button" data-toggle="modal" data-target="#add-data"><span class="glyphicon glyphicon-plus-sign"></span> 添加数据</button>
            </form>
        </header>

        <!-- 数据列表-->
        <table id="data-list" class="table table-hover table-bordered table-striped table-condensed">
            <caption>权限列表</caption>
            <thead>
                <tr>
                    <th>权限编码</th>
                    <th>所属模块</th>
                    <th>说明</th>
                    <th>更新时间</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
				<!-- BEGIN 数据列表 ATTRIB= -->
				<tr data-id="{DataID}">
					<td>{DataID}</td>
					<td>{所属模块}</td>
					<td>{Remark}</td>
					<td>{Date}</td>
                    <td>
                        <a class="btn-edit" href="javascript:;" title="编辑"><span class="glyphicon glyphicon-pencil"></span></a>
                        &nbsp;&nbsp;
                        <a class="btn-del" href="javascript:;" title="删除"><span class="glyphicon glyphicon-remove text-danger"></span></a>
                    </td>
				</tr>
				<!-- END 数据列表 -->
            </tbody>
            <tfoot><tr><td colspan="5"></td></tr></tfoot>
        </table>
    </article>

    <!-- 添加与编辑-->
	<div id="add-data" class="modal fade" tabIndex="-1">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<form  class="form-horizontal" method="post" action="?Do=Save">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
						<h4 class="modal-title">进行权限设置</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label class="col-sm-2 control-label">权限编码</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="PowerID" ID="PowerID" placeholder="权限编码，系统自动分配" readonly>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">所在模块分组</label>
							<div class="col-sm-10">
								<select class="form-control" name="PowerType" ID="PowerType">
									<!-- BEGIN 模块分组 ATTRIB= -->
									<option value="{分组名称}">{分组名称}</option>
									<!-- END 模块分组 -->
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">权限说明</label>
							<div class="col-sm-10">
								<textarea rows="4" ID="Remark" name="Remark" class="form-control" placeholder="此权限的备注"></textarea>
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
        (function() {
            'use strict';
            
            var $addDataPanel = $('#add-data'),
                $dataList = $('#data-list');

            // 编辑操作
            $dataList.on('click', '.btn-edit', function() {
                common.ajax({
                    title: '编辑',
                    URL: '?Do=Query&DataID=' + $(this).closest('tr').data('id'),
                    good: function(data) {
                        $addDataPanel.find('#PowerID').val(data.DataID);
                        $addDataPanel.find('#PowerType option[value="' + data.PowerType + '"]').prop('selected', true);
                        $addDataPanel.find('#Remark').val(data.Remark);
                        $addDataPanel.find('#Date').val(data.Date);

                        $addDataPanel.modal('show');
                    }
                });
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
