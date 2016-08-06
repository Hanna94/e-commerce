{页面属性}{/页面属性}
<body>
	{页顶导航}{/页顶导航}
    <!-- 内容-->
    <article class="container-fluid">
        <div id="data-list">
            <table class="table table-striped table-bordered table-hover table-condensed">
                <colgroup>
                    <col>
                    <col>
                    <col>
                    <col>
                    <col>
                </colgroup>
                <thead>
                    <th>SKU</th>
                    <th>产品名称</th>
                    <th>7天</th>
                    <th>15天</th>
                    <th>30天</th>
                </thead>
                <tbody></tbody>   
            </table>
        </div>
    </article>

    <!-- 表格模板 -->
    <template id="temp-table">
        {{#Day_30}}
        <tr>
            <td>{{OmsSKU}}</td>
            <td>{{ProductName}}</td>
            <td>0</td>
            <td>0</td>
            <td>{{Quantity}}</td>
        </tr>
        {{/Day_30}}
    </template>
    
    {页面底部}{/页面底部}
    
    <script src="/Resource/js/mustache.js"></script>
    <script>
    $(function(){
        'use strict';

        var op = common.URL.parse(),
            $dataList = $('#data-list table tbody'),
            tempTable = $('#temp-table').html();
        // 获取数据
        $.ajax({
            url: '/Report/API/?Do=ProductSale&ProductID=' + op.ProductID + '&Guide=' + op.Guide,
            dataType: 'json',
            type: 'get',
            success: function(data){
                var d = data;
                $dataList.html(Mustache.render(tempTable, d));

                $dataList.find('tr').each(function(){
                    var ts = $(this),
                        sel = ts.find('td:eq(0)').text();
                    // day07
                    $.each(d.Day_07, function(i, n){
                        if (n.OmsSKU === sel) {
                            ts.find('td:eq(2)').text(n.Quantity);
                        }
                    });
                    // day15
                    $.each(d.Day_15, function(i, n){
                        if (n.OmsSKU === sel) {
                            ts.find('td:eq(3)').text(n.Quantity);
                        }
                    });
                });
            }
        });

        // 返回顶部按钮
        common.topBtn();
    });
        
    </script>
</body>
</html>
