{页面属性}{/页面属性}
<body>
    {页顶导航}{/页顶导航}
    <!-- 内容-->
    <article class="container-fluid">
        <header>
            <div class="btn-group btn-group-sm pull-right">
                <button class="btn btn-success" data-toggle="modal" data-target="#modal-upload"><span class="glyphicon glyphicon-upload"></span> 上传附件</button>
                <button class="btn btn-success btn-add-data" data-toggle="modal" data-target="#add-data"><span class="glyphicon glyphicon-plus-sign"></span> 添加数据</button>
            </div>
        </header>

        <!-- 数据列表-->
        <table id="data-list" class="table table-hover table-bordered table-striped table-condensed">
            <caption>贷代列表</caption>
            <thead>
                <tr>
                    <th>数据编号</th>
                    <th>货代编码</th>
                    <th>货代名称</th>
                    <th>位置代码</th>
                    <th>创建时间</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
                <!-- BEGIN 数据列表 ATTRIB= -->
                <tr data-id="{DataID}">
                    <td>{DataID}</td>
                    <td><a href="Service.aspx?FID={DataID}">{Code}</a></td>
                    <td>{Name}</td>
                    <td>{Location}</td>
                    <td>{Date}</td>
                    <td>
                        <a title="编辑" class="btn-edit" href="javascript:;"><span class="glyphicon glyphicon-pencil"></span></a>
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
                        <h4 class="modal-title">新增/编辑贷代</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">数据编号</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="DataID" ID="DataID" placeholder="数据编号，系统自动分配" readonly>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">货代编码</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="Code" ID="Code" placeholder="货代编码">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">货代名称</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="Name" ID="Name" placeholder="货代的命名，中文">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">位置代码</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="Location" ID="Location" placeholder="位置代码，2位字符">
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
                                <input class="form-control-static" type="file" name="StrFile" accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/octet-stream, application/vnd.ms-excel" value="上传附件">
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
                        <button type="submit" class="btn btn-primary">确定</button>
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
                        $addDataPanel.find('#Location').val(data.Location);
                        $addDataPanel.find('#Date').val(data.Date);

                        $addDataPanel.modal('show');
                    }
                });
            });
        }());
    </script>
</body>
</html>
