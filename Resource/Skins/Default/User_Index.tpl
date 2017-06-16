{页面属性}{/页面属性}
<body>
	{页顶导航}{/页顶导航}
    <!-- 内容-->
    <article class="container-fluid">
        <header>
            <ul class="nav nav-tabs">
                <li class="active"><a data-toggle="tab" href="">全部(All)</a></li>
                <li class=""><a data-toggle="tab" href="">在职(InService)</a></li>
                <li class=""><a data-toggle="tab" href="">离岗(TimeOff)</a></li>
                <li class=""><a data-toggle="tab" href="">离职(Dimission)</a></li>
            </ul>
            
        </header>

        <!-- 数据列表-->
        <table id="data-list" class="table table-hover table-bordered table-striped table-condensed">
            <caption>
                <form id="form-search" class="form-inline" action="?">
                    <div class="input-group input-group-sm">
                        <input class="form-control" placeholder="Search..." name="KeyWord">
                        <span class="input-group-btn">
                            <button class="btn btn-default" type="submit"><span class="glyphicon glyphicon-search"></span> 搜索</button>
                        </span>
                    </div>
                    <button class="btn btn-success btn-sm pull-right btn-add-data" type="button" data-toggle="modal" data-target="#add-data"><span class="glyphicon glyphicon-plus-sign"></span> 添加数据</button>
                </form>
            </caption>
            <thead>
                <tr>
                    <th>用户编号</th>
                    <th>名称（登录名）</th>
                    <th>姓名</th>
					<th>刊登代码</th>
					<th>邮箱</th>
					<th>手机</th>
					<th>状态</th>
                    <th>更新时间</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
				<!-- BEGIN 数据列表 ATTRIB= -->
				<tr data-id="{DataID}">
					<td>{DataID}</td>
					<td>{Name}</td>
					<td>{TrueName}</td>
					<td>{Code}</td>
					<td>{Mail}</td>
					<td>{Mobile}</td>
					<td>{Status}</td>
					<td>{Date}</td>
                    <td>
                        <a title="编辑" class="btn-edit" href="javascript:;"><span class="glyphicon glyphicon-pencil"></span></a>
                        &nbsp;&nbsp;
                        <a class="btn-role" href="javascript:;" title="角色设置"><span class="glyphicon glyphicon-user text-success"></span></a>
                    </td>
				</tr>
				<!-- END 数据列表 -->
            </tbody>
            <tfoot><tr><td colspan="9"></td></tr></tfoot>
        </table>
    </article>

    <!-- 添加与编辑-->
	<div id="add-data" class="modal fade" tabIndex="-1">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<form  class="form-horizontal" method="post" action="Api/?Do=Save" autocomplete="off">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
						<h4 class="modal-title">进行用户设置</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label class="col-sm-2 control-label">用户编号</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="DataID" ID="DataID" placeholder="用户编号，系统自动分配" readonly>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">用户名称</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="UserName" ID="UserName" placeholder="英文名称、用于登陆和显示">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">登陆密码</label>
							<div class="col-sm-10">
								<input type="PassWord" class="form-control" name="PassWord" ID="PassWord" placeholder="登录密码，增加用户时必填，编辑用户时不修改密码请留空" autocomplete="off">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">姓名</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="TrueName" ID="TrueName">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">刊登代码</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="Code" ID="Code" placeholder="数字">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">电子邮箱</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="Mail" ID="Mail" placeholder="请填写企业邮箱">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">手机</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="Mobile" ID="Mobile">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">用户状态</label>
							<div class="col-sm-10">
                                <label class="radio-inline"><input type="radio" name="State" value="正常" checked>正常</label>
                                <label class="radio-inline"><input type="radio" name="State" value="禁止">禁止</label>
                                <label class="radio-inline"><input type="radio" name="State" value="删除">删除</label>
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

    <!-- 角色设置-->
    <div id="role-set" class="modal fade modal-set-del" tabIndex="-1">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <form  class="form-horizontal" action="javascript:;">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                        <h4 class="modal-title">进行角色设置</h4>
                    </div>
                    <div class="modal-body span-block">
                        <div class="form-group">
                            <label class="col-sm-2">已有角色</label>
                            <div class="col-sm-10 active-role"></div>
                        </div>
                        <hr>
                        <div class="form-group">
                            <label class="col-sm-2">未授角色</label>
                            <div class="col-sm-10 all-role"></div>
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
        (function () {
            'use strict';
            
            var $addDataPanel = $('#add-data'),
                $dataList = $('#data-list'),
                $rolePanel = $('#role-set'),
                $allRole = $rolePanel.find('.all-role'),
                $activeRole = $rolePanel.find('.active-role'),
                roleList, activeList;

            // 追加角色
            function addRole() {
                var i = 0,
                    len = roleList.length,
                    pHtml = '',
                    aHtml = '',
                    id;
                for (; i < len; i++) {
                    id = roleList[i].DataID;
                    if ($.inArray(id, activeList) >= 0) {
                        aHtml += '<span title="点击删除角色" class="label label-danger" data-id="' + id +
                        '"><b>&times; </b>' + roleList[i].Name + '</span>&nbsp;';
                        continue;
                    }
                    pHtml += '<span title="点击添加角色" class="label label-success" data-id="' + id +
                        '"><b>+ </b>' + roleList[i].Name + '</span>&nbsp;';
                }
                $allRole.html(pHtml);
                $activeRole.html(aHtml);
            }

            // 角色设置
            $('#data-list').on('click', '.btn-role', function() {
                var id = $(this).closest('tr').data('id');
                if (!roleList) {
                    // 所有角色
                    $.ajax({ 
                        type: 'GET',
                        url: 'Api/?Do=GetRoleList', 
                        success: function(data){
                            roleList = data.DataList;
                            getSelfRole(id);                                              
                        },
                        error:function(data){               
                            console.log(data);
                        }                 
                    });  
                    return;
                }

                getSelfRole(id);
            });

            // 获取自身权限
            function getSelfRole(id) {
                $.ajax({ 
                    type: 'GET',
                    url: 'Api/?Do=Correlation&DataID=' + id, 
                    // contentType: "application/json;charset=utf-8",
                    success: function(data){
                        activeList = data.DataList.map(function(ele) {
                            return ele.RoleID;
                        });
                        addRole();
                        $rolePanel.modal('show').data('id', id);                                              
                    },
                    error:function(data){               
                        console.log(data);
                    }                 
                }); 
            }

            // 添加角色
            $allRole.on('click', 'span', function() {
                var id = $(this).data('id');
                $.ajax({ 
                    type: 'GET',
                    url: 'Api/?Do=AddRole&DataID=' + $rolePanel.data('id') + '&RoleID=' + id, 
                    success: function(data){
                        common.alert({
                            type: 'success',
                            title: '“添加角色”操作：',
                            msg: data.Message || '成功！'
                        });
                        activeList.push(id);
                        addRole();                                             
                    },
                    error:function(data){               
                        console.log(data);
                    }                 
                }); 
            });


            // 编辑操作
            $dataList.on('click', '.btn-edit', function() {
                $.ajax({
                    type: 'GET',
                    url: '/user/API/?Do=Query&DataID=' + $(this).closest('tr').data('id'),
                    success: function(data){
                        $addDataPanel.find('#DataID').val(data.DataID);
                        $addDataPanel.find('#UserName').val(data.UserName);
                        $addDataPanel.find('#TrueName').val(data.TrueName);
                        $addDataPanel.find('#Code').val(data.Code);
                        $addDataPanel.find('#Mail').val(data.Mail);
                        $addDataPanel.find('#Mobile').val(data.Mobile);
                        $addDataPanel.find('input[name="State"][value="' + data.State + '"]').prop('checked', true);
                        $addDataPanel.find('#Date').val(data.Date);

                        $addDataPanel.modal('show');                                              
                    },
                    error:function(data){               
                        console.log(data);
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
