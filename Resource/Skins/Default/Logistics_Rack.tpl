{页面属性}{/页面属性}
<body>
    {页顶导航}{/页顶导航}
    <!-- 内容-->
    <article class="container-fluid">
        <header>
            <button type="button" class="btn btn-success btn-sm btn-add-data pull-right" data-toggle="modal" data-target="#add-data"><span class="glyphicon glyphicon-plus-sign"></span> 添加数据</button>
        </header>

        <!-- 数据列表-->
        <table id="data-list" class="table table-hover table-bordered table-striped table-condensed">
            <caption>{位置} 库位列表</caption>
            <thead>
                <tr>
                    <th>库位编号</th>
                    <th>库区编号</th>
                    <th>库位编码</th>
                    <th>库位名称</th>
                    <th>库位状态</th>
                    <th>创建时间</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
                <!-- BEGIN 数据列表 ATTRIB= -->
                <tr data-id="{DataID}">
                    <td>{DataID}</td>
                    <td>{FID}</td>
                    <td>{Code}</td>
                    <td><a href="Tray.aspx?WID={WID}&FID={DataID}">{Name}</a></td>
                    <td>{Status}</td>
                    <td>{Date}</td>
                    <td>
                        <a title="编辑" class="btn-edit" href="javascript:;"><span class="glyphicon glyphicon-pencil"></span></a>
                        &nbsp;&nbsp;
                        <a 删除 class="btn-del" href="javascript:;"><span class="glyphicon glyphicon-remove text-danger"></span></a>
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
                <form  class="form-horizontal" method="post" action="?Do=Save&WID={WID}&FID={FID}">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                        <h4 class="modal-title">[{位置}] 进行库位设置</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">库位编号</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="DataID" ID="DataID" placeholder="库位编号，系统自动分配" readonly>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">库位编码</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="Code" ID="Code" placeholder="库位编码，系统自动分配" readonly>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">库位名称</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="Name" ID="Name" placeholder="库位的命名，中文">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">库位状态</label>
                            <div class="col-sm-10">
                                <select class="form-control" name="Status" ID="Status">
                                    <option value="正常">正常</option>
                                    <option value="禁止">禁止</option>
                                    <option value="删除">删除</option>
                                </select>
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
            var $addDataPanel = $('#add-data'),
                $dataList = $('#data-list');

            // 编辑操作
            $dataList.on('click', '.btn-edit', function() {
                common.ajax({
                    title: '编辑',
                    URL: '?Do=Query&DataID=' + $(this).closest('tr').data('id'),
                    good: function(data) {
                        $addDataPanel.find('#DataID').val(data.DataID);
                        $addDataPanel.find('#Code').val(data.Code);
                        $addDataPanel.find('#Name').val(data.Name);
                        $addDataPanel.find('select[name="Status"] option[value="' + data.Status + '"]').prop('selected', true);
                        $addDataPanel.find('#Date').val(data.Date);

                        $addDataPanel.modal('show');
                    }
                });
            });
        }());
    </script>
</body>
</html>
