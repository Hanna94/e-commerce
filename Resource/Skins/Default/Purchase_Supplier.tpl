{页面属性}{/页面属性}
<body>
    {页顶导航}{/页顶导航}
    
    <!-- 内容-->
    <div id="data-list" class="container-fluid">
        <header>
            <div class="btn-group btn-group-sm pull-right mg-b-10">
                <a href="?Do=Edit" target="_blank"><button class="btn btn-default" type="button">新建供应商</button></a>
            </div>
        </header>
        <table class="table table-striped table-bordered table-hover table-condensed">
            <colgroup>
                <col>
                <col>
                <col>
                <col>
                <col>
                <col>
                <col>
                <col>
                <col>
            </colgroup>
            <thead>
                <th>编号</th>
                <th>供应商</th>
                <th>联系人</th>
                <th>电话</th>
                <th>地址</th>
                <th>银行信息</th>
                <th>备注</th>
                <th>时间</th>
                <th>操作</th>
            </thead>
            <tbody>
                <!-- BEGIN 数据列表 ATTRIB= -->
                <tr>
                    <td>{DataID}</td>
                    <td>{Name}</td>
                    <td>{Contacts}</td>
                    <td>{Phone}</td>
                    <td>{Location}</td>
                    <td>
                        <button type="button" class="btn btn-default btn-xs" 
                        data-container="body" data-toggle="popover" data-html="true"
                        data-trigger="click" data-placement="left"
                        data-content="银行：{BankName}<br/>户名：{AccountName}<br/>账号：{AccountNumber}">
                        <span data-val="in" class="glyphicon glyphicon-tag poi"></button>
                    </td>
                    <td>
                        <button id="supplier-remark" type="button" class="btn btn-default btn-xs supplier-remark" 
                        data-container="body" data-toggle="popover"
                        data-trigger="click" data-placement="left"
                        data-content="{Remark}">
                        <span data-val="in" class="glyphicon glyphicon-tag poi"></button>
                    </td>
                    <td>{Date}</td>
                    <td><a href="?Do=Edit&DataID={DataID}" target="_blank"><span class="glyphicon glyphicon-pencil"></span></a></td>
                </tr>
                <!-- END 数据列表 -->
            </tbody>
            <tfoot><tr><td colspan="10"></td></tr></tfoot>
        </table>
    </div>

    {页面底部}{/页面底部}

    <script>
        $(function() {
            'use strict';

            var $dataList = $('#data-list');
            var $supRemark = $('.supplier-remark'); // 备注标签button

            // 判断备注信息是否为空，为空则删除标签
            $supRemark.each(function() {
                var supRemarkVal = $(this).attr('data-content');
                if (supRemarkVal == '' || supRemarkVal == null) {
                    $(this).remove();
                }
            });

            //启动浮动框
            $("[data-toggle='popover']").popover();

            <!-- BEGIN 分页脚本 ATTRIB= -->
            common.showPage({当前页}, {总条数}, {每页条数});
            <!-- END 分页脚本 -->
        });

    </script>
</body>
</html>
