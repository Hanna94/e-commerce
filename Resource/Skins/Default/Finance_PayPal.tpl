{页面属性}{/页面属性}
<body>
    {页顶导航}{/页顶导航}
    
    <!-- 内容-->

    <div id="data-list" class="container-fluid">
        <header>
            <div class="btn-group btn-group-sm pull-right">
                <a href="?Do=Edit" target="_blank"><button  class="btn btn-success btn-sm" type="button"><span class="glyphicon glyphicon-plus-sign"></span> 新建采购单</button></a>
            </div>
        </header>
        <ul class="nav nav-tabs">
            <li><a href="?Do=All">所有流水</a></li>
            <li><a href="?Do=InCome">收入流水</a></li>
            <li><a href="?Do=Refund">支出流水</a></li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane active">
                <form id="form-filter" class="form-inline mg-t-10 mg-b-10" action="javascript:;">
                    <input class="do" type="hidden" name="Do" value="InCome">

                    <div class="input-group">
                        <div class="btn-group btn-group-xs" data-toggle="buttons">
                            <!-- BEGIN 店铺列表 ATTRIB= -->
                            <label class="btn btn-default">
                                <input type="checkbox" name="ShopID" value="{DataID}" autocomplete="off">{Alias}
                            </label>
                            <!-- END 店铺列表 -->
                        </div>
                    </div>

                    <div class="input-group input-group-sm">
                        <input type="text" class="form-control" placeholder="Search..." name="KeyWord">
                        <span class="input-group-btn">
                            <button class="btn btn-default" type="submit"><span class="glyphicon glyphicon-search"></span> 搜索</button>
                        </span>
                    </div>
                </form>
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
                        <col>
                        <col>
                    </colgroup>
                    <thead>
                        <th><input id="callAll" type="checkbox" />全选</th>
                        <th>单号</th>
                        <th>PayPal账号</th>
                        <th>金额</th>
                        <th>买家名称</th>
                        <th>付款人</th>
                        <th>付款账号</th>
                        <th>付款时间</th>
                        <th>付款备注</th>
                        <th>交易入库时间</th>
                        <th>操作</th>
                    </thead>
                    <tbody>
                        <!-- BEGIN 数据列表 ATTRIB= -->
                        <tr data-did="{DataID}" data-sid="{SupplierID}">
                            <td><input type="checkbox" />{DataID}</td>
                            <td>{TransactionID}</td>
                            <td>[{ShopName}] {ReceiverEmail}</td>
                            <td><span class="label currency">{CurrencyCode}</span> {Amt}</td>
                            <td>{Buyer}</td>
                            <td>{Name}</td>
                            <td>{Email}</td>
                            <td>{OrderTime}</td>
                            <td>{Note}</td>
                            <td>{Date}</td>
                            <td><a href="?Do=Edit&DataID={DataID}&TransactionID={TransactionID}" target="_blank"><span class="glyphicon glyphicon-pencil"></span></a></td>
                        </tr>
                        <!-- END 数据列表 -->
                    </tbody>
                    <tfoot><tr><td colspan="12"></td></tr></tfoot>
                </table>
            </div>
        </div>
    </div>

    {页面底部}{/页面底部}

    <script>
        (function() {
            'use strict';

            var $dataList = $('#data-list'),
                oParam = common.URL.parse(),
                $formFilter = $('#form-filter'),
                shopID = oParam.ShopID || [];

            if (shopID && -1 !== shopID.indexOf(',')) {
                shopID = shopID.split(',');
            }

            for (var i = 0, len = shopID.length; i < len; i++) {
                $formFilter.find('input[type="checkbox"][value="' + shopID[i] + '"]').closest('.btn').button('toggle');
            }

            $formFilter.on('submit', function() {
                location.search = common.URL.stringify(common.URL.parse('?' + $formFilter.serialize()));
            });

            // 货币单位渲染
            common.Rendering.currency($dataList);

            // 标签页定位
            $dataList.find('.nav a[href="' + location.search.split('&')[0] + '"]').closest('li').addClass('active');

            <!-- BEGIN 分页脚本 ATTRIB= -->
            common.showPage({当前页}, {总条数}, {每页条数});
            <!-- END 分页脚本 -->
        }());
    </script>
</body>
</html>
