{页面属性}{/页面属性}
<body>
    {页顶导航}{/页顶导航}
    
    <!-- 内容-->
    <div id="data-list" class="container-fluid">
        <header>
            <div class="btn-group btn-group-sm pull-right">
                <button id="printWEB" class="btn btn-success" type="button">打印</button>
            </div>
        </header>
        <div id="printTar">
            <table class="table table-striped table-bordered table-hover table-condensed">
                <colgroup>
                    <col>
                    <col>
                    <col>
                    <col>
                    <col>
                </colgroup>
                <tbody></tbody>
                <tfoot></tfoot>
            </table>
        </div>
    </div>

        <template id="tm-Report">
            {{#DataList}}
            <tr>
                <td><img src="{{GalleryURL}}" style="height: 110px; width: auto;"></td>
                <td>[{{ProductID}}]{{ProductSKU}}</td>
                <td>{{ProductName}} * {{Quantity}}</td>
                <td></td>
            </tr>
            {{/DataList}}
        </template>

    {页面底部}{/页面底部}

    <script src="/Resource/js/order.js"></script>
    
    <script>
        (function() {
            'use strict';

            var op = common.URL.parse(),
                $printWEB = $('#printWEB'),
                $printTar = $('#printTar'),
                tmReport = $('#tm-Report').html(),
                tab = 0;
            $.ajax({
                url: '/OMS/API/?Do=QueryPurchase&ShopID=' + op.ShopID,
                type: 'get',
                dataType: 'json',
                success: function(d){

                    $printTar.find('tbody').html(Mustache.render(tmReport, d));
                    // 买家数据处理
                    $.each(d.DataList, function(i, index){
                        $printTar.find('tbody tr:eq('+i+') td:eq(3)').html(index.Buyer);
                    });
                }
            });

            // 打印网页
            $printWEB.on('click', function(){
                // 将表格分成多组
                document.body.innerHTML = document.getElementById('printTar').innerHTML;
                
                window.print();
            });

        }());
    </script>
</body>
</html>
