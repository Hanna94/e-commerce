{页面属性}{/页面属性}
<body>
    {页顶导航}{/页顶导航}
    <!-- 内容-->
    <article class="container-fluid">
        <header class="btn-group pull-right">
            <button class="btn btn-primary btn-sm btn-sortable"><span class="glyphicon glyphicon-sort"></span> 拖动排序</button>
            <button class="btn btn-warning btn-sm btn-sortable-confirm hide"><span class="glyphicon glyphicon-ok"></span> 确认</button>
            <button class="btn btn-success btn-sm btn-add-data" data-toggle="modal" data-target="#add-data"><span class="glyphicon glyphicon-plus-sign"></span> 添加数据</button>
        </header>

        <!-- 数据列表-->
        <table id="data-list" class="table table-hover table-bordered table-striped table-condensed">
            <caption>贷代服务列表</caption>
            <thead>
                <tr>
                    <th>数据编号</th>
                    <th>服务编码</th>
                    <th>服务名称</th>
                    <th>重量限制</th>
                    <th>尺寸限制</th>
                    <th>是否带电</th>
                    <th>末端服务商</th>
                    <th>创建时间</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody id="tbody-sortable">
                <!-- BEGIN 数据列表 ATTRIB= -->
                <tr data-id="{DataID}" class="ui-state-default">
                    <td>{DataID}</td>
                    <td>{Code}</td>
                    <td>{Name}</td>
                    <td>{LimitWeight}</td>
                    <td>{LimitSize}</td>
                    <td>{Battery}</td>
                    <td>{Support}</td>
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
        <div class="modal-dialog">
            <div class="modal-content">
                <form  class="form-horizontal" method="post" action="?Do=Save&FID={FID}">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                        <h4 class="modal-title">新增/编辑贷代服务</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">数据编号</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="DataID" ID="DataID" placeholder="数据编号，系统自动分配" readonly>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">服务编码</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="Code" ID="Code" placeholder="服务编码">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">服务名称</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="Name" ID="Name" placeholder="货代服务的命名，中文">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">重量限制</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="LimitWeight" ID="LimitWeight" placeholder="单位为克/g">
                            </div>
                        </div>
                        <div id="form-group-size" class="form-group">
                            <label class="col-sm-2 control-label">尺寸限制</label>
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
                                <input type="hidden" class="form-control whole-input" name="LimitSize" ID="LimitSize">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-10 col-sm-offset-2">
                                <label class="checkbox-inline"><input type="checkbox" id="Battery" name="Battery" value="1"> 带电</label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">末端服务商</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="Support" ID="Support" placeholder="末端服务商">
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

    <script src="/Resource/js/jquery-ui.min.js"></script>
    <script>
        (function () {
            'use strict';
            var $addDataPanel = $('#add-data'),
                $dataList = $('#data-list'),
                $sortableBtn = $('.btn-sortable'), // 排序按钮
                $sortableCancelBtn = $('.btn-sortable-confirm'); // 确认排序按钮

            $sortableBtn.on('click', function() {
                $('#tbody-sortable').sortable();
                $('#tbody-sortable').disableSelection();
                $(this).addClass('hide');
                $sortableCancelBtn.removeClass('hide');
            });

            $sortableCancelBtn.on('click', function() {
                $('#tbody-sortable').unbind();
                $(this).addClass('hide');
                $sortableBtn.removeClass('hide');
            });

            // 设置
            common.setSizeModel($('#form-group-size'));

            // 编辑操作
            $dataList.on('click', '.btn-edit', function() {
                common.ajax({
                    title: '编辑',
                    URL: '?Do=Query&DataID=' + $(this).closest('tr').data('id'),
                    good: function(data) {
                        $addDataPanel.find('#DataID').val(data.DataID);
                        $addDataPanel.find('#Code').val(data.Code);
                        $addDataPanel.find('#Name').val(data.Name);
                        $addDataPanel.find('#LimitWeight').val(data.LimitWeight);
                        $addDataPanel.find('#LimitSize').val(data.LimitSize).change();

                        $addDataPanel.find('#Battery').prop('checked', !!data.Battery);
                        $addDataPanel.find('#Support').val(data.Support);
                        $addDataPanel.find('#Date').val(data.Date);

                        $addDataPanel.modal('show');
                    }
                });
            });
        }());
    </script>
</body>
</html>
