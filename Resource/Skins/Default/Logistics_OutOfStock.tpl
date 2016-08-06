{页面属性}{/页面属性}
<body>
    {页顶导航}{/页顶导航}
    
    <!-- 内容-->
    <article class="container-fluid">
        <div class="row">
            <div class="col-sm-6">
                <div id="data-list" class="panel panel-default mg-b-0">
                    <div class="panel-heading">未出库单列表</div>
                    <div class="panel-body">
                        <form id="form-search" class="form-inline" action="?">
                            <div class="form-group form-group-sm">
                                <select class="form-control" name="WID">
                                    <option value="0" title="{Location}">全部仓库</option>
                                    <!-- BEGIN 仓库列表 ATTRIB= -->
                                    <option value="{DataID}" title="{Location}">[{Code}] {Name}</option>
                                    <!-- END 仓库列表 -->
                                </select>
                            </div>
                            <div class="form-group form-group-sm">
                                <select class="form-control" name="FreightID"></select>
                            </div>

                            <div class="input-group input-group-sm">
                                <input type="text" class="form-control" placeholder="Search..." name="KeyWord">
                                <span class="input-group-btn">
                                    <button class="btn btn-default" type="submit"><span class="glyphicon glyphicon-search"></span> 搜索</button>
                                </span>
                            </div>
                        </form>

                        <ul id="nav-modal" class="nav nav-tabs mg-t-10 mg-b-10">
                            <li><a href="?Do=UnShip">待出库</a></li>
                            <li><a href="?Do=Ship">已出库</a></li>
                        </ul>

                        <table class="table table-striped table-bordered table-hover table-condensed mg-b-0">
                            <thead>
                                <tr>
                                    <th><label id="select-all"><input type="checkbox"> 全选</label></th>
                                    <th>处理号 / 挂号</th>
                                    <th>发货仓库</th>
                                    <th>操作</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- BEGIN 数据列表 ATTRIB= -->
                                <tr data-id="{DataID}">
                                    <td><label><input type="checkbox"></label></td>
                                    <td>{InsideOrder} / {TrackingNumber}</td>
                                    <td>{Warehouse}</td>
                                    <td>
                                        <a title="查看" href="?Do=View&DataID={DataID}" target="_blank"><span class="text-success glyphicon glyphicon-eye-open"></span></a>
                                        &nbsp;&nbsp;
                                        <a class="stock-post" title="配货交运" href="javascript:;"><span class="glyphicon glyphicon-qrcode"></span></a>
                                    </td>
                                </tr>
                                <!-- END 数据列表 -->
                            </tbody>
                            <tfoot><tr><td colspan="4"></td></tr></tfoot>
                        </table>
                    </div>
                </div>   
            </div>

            <div class="col-sm-6">
                <div class="panel panel-default">
                    <div class="panel-heading"><button class="btn btn-danger btn-xs btn-submit" type="button">未出库复核提交</button><b class="text-danger pull-right"><span class="glyphicon glyphicon-star"></span>请确认输入法处于英文状态下！</b></div>
                    <div class="panel-body">
                        <form action="javascript:;">
                            <textarea id="InsideOrder" class="form-control" rows="40" name="InsideOrder"></textarea>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </article>

    <!-- 货代-->
    <template id="temp-freight">
        {{#DataList}}
        <option value="{{DataID}}">{{Code}}</option>
        {{/DataList}}
    </template>

    {页面底部}{/页面底部}

    <script src="/Resource/js/order.js"></script>
    <script src="/Resource/js/mustache.js"></script>

    <script>
        (function () {
            'use strict';

            var $txt = $('#InsideOrder'),
                $dataList = $('#data-list'),
                $formSearch = $('#form-search'),
                oParam = common.URL.parse();

            $txt.focus();

            // 提交出库复核
            $('.btn-submit').on('click', function() {
                common.ajax({
                    title: '未出库复核',
                    URL: '/Logistics/Logistics.aspx?Do=SetOutOfStock',
                    type: 'post',
                    data: {
                        InsideOrder: $txt.val()
                    },
                    good: function(data) {
                        common.alert({
                            title: '“提交未出库复核”操作：',
                            type: 'success',
                            msg: data.Message || '成功！',
                            time: 6000,
                            cb: function() {
                                location.reload();
                            }
                        });
                    }
                });
            });

            // 仓库选择
            var $w = $formSearch.find('select[name="WID"]'),
                $f = $formSearch.find('select[name="FreightID"]'),
                htmlFreight = $('#temp-freight').html();

            // 选择仓库获取货代
            $w.on('change', function() {
                var wid = $(this).val();
                if (!+wid) {
                    $f.html('');
                    return;
                }

                common.ajax({
                    title: '获取货代服务',
                    URL: '/Logistics/Logistics.aspx?Do=ServiceList&DataID=' + wid,
                    good: function (data) {
                        $f.html(Mustache.render(htmlFreight, data));
                        if (oParam.FreightID) {
                            $f.find('option[value="' + oParam.FreightID + '"]').prop('selected', true);
                        }
                    }
                });
            });

            var Do = oParam.Do,
                $navModel = $('#nav-modal'),
                $btnSetting = $('.btn-setting');

            if (Do) {
                $navModel.find('a[href="?Do=' + Do +'"]').closest('li').addClass('active');
            } else {
                $navModel.find('li').eq(0).addClass('active');
            }

            // 批量操作的按钮限制
            $dataList.find('tbody').on('change', 'input[type="checkbox"]', function() {
                $btnSetting.prop('disabled', !!!$dataList.find('tbody input:checked').length);
            });

            // 小型分页
            <!-- BEGIN 分页脚本 ATTRIB= -->
            common.miniPaging($dataList.find('tfoot td'), {当前页}, {总条数}, {每页条数}, function(page, size) {
                oParam.Page = page;
                oParam.QueryLimitNumber = size;
                location.search = common.URL.stringify(oParam);
            });
            <!-- END 分页脚本 -->
        }());
    </script>
</body>
</html>
