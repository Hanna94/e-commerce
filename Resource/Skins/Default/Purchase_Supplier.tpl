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
                    <td><span data-val="in" class="glyphicon glyphicon-zoom-in poi"></span><span class="PaymentFold hide"><br/>银行名称：{BankName}<br/>银行户名：{AccountName}<br/>银行账号：{AccountNumber}</span></td>
                    <td><span data-val="in" class="glyphicon glyphicon-zoom-in poi"></span><span class="RemarkFold hide"><br/>{Remark}</span></td>
                    <td>{Date}</td>
                    <td><a href="?Do=Edit&DataID={DataID}" target="_blank"><span class="glyphicon glyphicon-pencil"></span></a></td>
                </tr>
                <!-- END 数据列表 -->
            </tbody>
        </table>
    </div>

    {页面底部}{/页面底部}

    <script>
        $(function() {
            'use strict';

            var $dataList = $('#data-list');

            // 显示和隐藏银行信息和备注
            $dataList.find('tbody tr').each(function(){
                // 银行信息
                funFold($(this).find('td:eq(5) .glyphicon'), '.PaymentFold');
                // 备注
                funFold($(this).find('td:eq(6) .glyphicon'), '.RemarkFold');
            });

            // 显示与隐藏方法
            function funFold(tar, cla){
                tar.on('click', function(){
                    if ($(this).attr('data-val') === 'in') {
                        $(this).removeClass('glyphicon-zoom-in').addClass('glyphicon-zoom-out').attr('data-val', 'out').closest('td').find(cla).removeClass('hide');
                    }else{
                        $(this).removeClass('glyphicon-zoom-out').addClass('glyphicon-zoom-in').attr('data-val', 'in').closest('td').find(cla).addClass('hide');
                    }
                });
            }


        });
    </script>
</body>
</html>
