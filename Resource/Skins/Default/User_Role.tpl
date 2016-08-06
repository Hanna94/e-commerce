{页面属性}{/页面属性}
<body>
	{页顶导航}{/页顶导航}
    <!-- 内容-->
    <article class="container-fluid">
        <header>
            <div class="btn-group btn-group-sm pull-right">
                <button type="button" class="btn btn-success btn-add-data" data-toggle="modal" data-target="#add-data"><span class="glyphicon glyphicon-plus-sign"></span> 添加数据</button>
            </div>
        </header>

        <!-- 数据列表-->
        <table id="data-list" class="table table-hover table-bordered table-striped table-condensed">
            <caption>角色列表</caption>
            <thead>
                <tr>
                    <th>角色编号</th>
                    <th>角色名称</th>
                    <th>状态</th>
					<th>说明</th>
                    <th>更新时间</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
				<!-- BEGIN 数据列表 ATTRIB= -->
				<tr data-id="{DataID}">
					<td>{DataID}</td>
					<td>{Name}</td>
					<td>{Status}</td>
					<td>{Remark}</td>
					<td>{Date}</td>
                    <td>
                        <a class="btn-edit" href="javascript:;" title="编辑"><span class="glyphicon glyphicon-pencil"></span></a>
                        &nbsp;&nbsp;
                        <a class="btn-power" href="javascript:;" title="权限设置"><span class="glyphicon glyphicon-user text-success"></span></a>
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
				<form  class="form-horizontal" method="post" action="?Do=Save">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
						<h4 class="modal-title">进行角色设置</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label class="col-sm-2 control-label">角色编号</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="DataID" ID="DataID" placeholder="角色编号，系统自动分配" readonly>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">角色名称</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="RoleName" ID="RoleName" placeholder="角色编号，系统自动分配">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">角色状态</label>
							<div class="col-sm-10">
                                <label class="radio-inline"><input type="radio" name="State" value="正常" checked>正常</label>
                                <label class="radio-inline"><input type="radio" name="State" value="禁止">禁止</label>
                                <label class="radio-inline"><input type="radio" name="State" value="删除">删除</label>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">角色说明</label>
							<div class="col-sm-10">
								<textarea rows="4" class="form-control" placeholder="此角色的备注" name="Remark" ID="Remark"></textarea>
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

    <!-- 权限设置-->
    <div id="power-set" class="modal fade modal-set-del" tabIndex="-1">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <form  class="form-horizontal" action="javascript:;">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                        <h4 class="modal-title">进行权限设置</h4>
                    </div>
                    <div class="modal-body span-block">
                        <div class="form-group">
                            <label class="col-sm-2">已有权限</label>
                            <div class="col-sm-10 active-power"></div>
                        </div>
                        <hr>
                        <div class="form-group">
                            <label class="col-sm-2">未授权限</label>
                            <div class="col-sm-10 all-power"></div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
    {页面底部}{/页面底部}
    <script>
        (function() {
            'use strict';
            
            var $powerPanel = $('#power-set'),
                $addDataPanel = $('#add-data'),
                $allPower = $powerPanel.find('.all-power'),
                $activePower = $powerPanel.find('.active-power'),
                powerList, activeList;

            // 追加权限
            function addPower() {
                var i = 0,
                    len = powerList.length,
                    pHtml = '',
                    aHtml = '',
                    id;
                for (; i < len; i++) {
                    id = powerList[i].DataID;
                    if ($.inArray(id, activeList) >= 0) {
                        aHtml += '<span title="点击删除权限" class="label label-danger" data-id="' + id +
                        '"><b>&times; </b>' + powerList[i].Remark + '</span>&nbsp;';
                        continue;
                    }
                    pHtml += '<span title="点击添加权限" class="label label-success" data-id="' + id +
                        '"><b>+ </b>' + powerList[i].Remark + '</span>&nbsp;';
                }
                $allPower.html(pHtml);
                $activePower.html(aHtml);
            }

            // 权限设置
            $('#data-list').on('click', '.btn-power', function() {
                var id = $(this).closest('tr').data('id');
                if (!powerList) {
                    // 所有权限
                    common.ajax({
                        notload: true,
                        title: '获取所有权限',
                        URL: '/user/power.aspx?Do=List',
                        good: function(data) {
                            powerList = data.DataList;
                            getSelfPower(id);
                        }
                    });
                    return;
                }

                getSelfPower(id);
            });

            // 获取自身权限
            function getSelfPower(id) {
                common.ajax({
                    title: '获取自身权限',
                    URL: '?Do=Correlation&DataID=' + id,
                    good: function(data) {
                        activeList = data.DataList.map(function(ele) {
                            return ele.PowerID;
                        });;
                        addPower();
                        $powerPanel.modal('show').data('id', id);
                    }
                });
            }

            // 添加权限
            $allPower.on('click', 'span', function() {
                var id = $(this).data('id');
                common.ajax({
                    title: '添加权限',
                    URL: '?Do=AddPower&DataID=' + $powerPanel.data('id') + '&PowerID=' + id,
                    good: function (data) {
                        common.alert({
                            type: 'success',
                            title: '“添加权限”操作：',
                            msg: data.Message || '成功！'
                        });
                        activeList.push(id);
                        addPower();
                    }
                });
            });

            // 删除权限
            $activePower.on('click', 'span', function() {
                var id = $(this).data('id');
                common.ajax({
                    title: '删除权限',
                    URL: '?Do=CancelPower&DataID=' + $powerPanel.data('id') + '&PowerID=' + id,
                    good: function (data) {
                        common.alert({
                            type: 'success',
                            title: '“删除权限”操作：',
                            msg: data.Message || '成功！'
                        });
                        activeList = activeList.filter(function(ele) {
                            return ele !== id;
                        });
                        addPower();
                    }
                });
            });

            // 编辑操作
            $('#data-list').on('click', '.btn-edit', function() {
                common.ajax({
                    title: '编辑',
                    URL: '?Do=Query&DataID=' + $(this).closest('tr').data('id'),
                    good: function(data) {
                        $addDataPanel.find('#DataID').val(data.DataID);
                        $addDataPanel.find('#RoleName').val(data.RoleName);
                        $addDataPanel.find('#PowerType option[value="' + data.PowerType + '"]').prop('selected', true);
                        $addDataPanel.find('#Remark').val(data.Remark);
                        $addDataPanel.find('#Date').val(data.Date);

                        $addDataPanel.modal('show');
                    }
                });
            });
        }());
    </script>
</body>
</html>
