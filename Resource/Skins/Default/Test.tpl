{页面属性}{/页面属性}
<body>
    {页顶导航}{/页顶导航}
    <!-- 内容-->
    <div id="data-list" class="container-fluid">
        <header>
            <div class="btn-group btn-group-sm pull-right">
                <button class="btn btn-default" type="button">下单</button>
                <button class="btn btn-default" type="button">取消</button>
            </div>
            <form action="?" class="form-inline mg-r-20 mg-b-10">
                <div class="form-group form-group-sm mg-r-15">
                    <label class="control-label">物流方式</label>
                    <select id="TeamID" class="form-control" name="TeamID" data-default="{TeamID}">
                        <option value="0">空运</option>
                        <option value="1">海运</option>
                        <option value="2">香港DHL</option>
                    </select>
                </div>
                <div class="form-group form-group-sm mg-r-15">
                    <label class="control-label">目标仓库</label>
                    <select class="form-control" name="TeamID" data-default="{TeamID}">
                        <option value="0">全部</option>
                        <option value="1">广州仓</option>
                        <option value="2">海外仓</option>
                    </select>
                </div>
                <div class="form-group form-group-sm mg-r-15">
                    <label class="control-label">状态</label>
                    <select id="TeamID" class="form-control" name="TeamID" data-default="{TeamID}">
                        <option value="0">全部</option>
                        <option value="1">状态1</option>
                        <option value="2">状态2</option>
                        <option value="3">状态3</option>
                    </select>
                </div>
                <div class="form-group form-group-sm">
                    <input type="text" class="form-control" placeholder="调拨单号 / 货代单号">
                </div>
                <div class="form-group form-group-sm">
                    <button class="btn btn-default btn-sm" type="button">查询</button>
                </div>
            </form>
        </header>
        
        <div class="row">
            <div class="col-sm-12">
                <div class="maxH800">
                    <table class="table table-striped table-bordered table-hover table-condensed">
                        <thead>
                            <th><input id="" type="checkbox"></th>
                            <th>调拨单号</th>
                            <th>货代单号</th>
                            <th>货代状态</th>
                            <th>物流方式</th>
                            <th>处理点</th>
                            <th>抵达仓库</th>
                            <th>交货日期</th>
                            <th>箱数</th>
                            <th>体积重量</th>
                            <th>费用</th>
                            <th>创建时间</th>
                            <th>操作</th>
                        </thead>
                        <tbody>
                            <!-- BEGIN 数据列表 ATTRIB= -->
                            <tr>
                                <td><input type="checkbox" value="13"></td>
                                <td>{ReferenceID}</td>
                                <td>{OrderSign}</td>
                                <td>{State}</td>
                                <td>{ShippingMethod}</td>
                                <td>{Location}</td>
                                <td>{Warehouse}</td>
                                <td>{ArriveTime}</td>
                                <td>{CountCase}</td>
                                <td>{CountCBM}<br>{CountWeight}</td>
                                <td>{CountCost}</td>
                                <td>{Date}</td>
                                <td>
                                    <span class="poi glyphicon glyphicon-pencil mg-r-5" title="编辑"></span>
                                    <span class="poi glyphicon glyphicon-list-alt" title="日志"></span>
                                </td>
                            </tr>
                            <!-- END 数据列表 -->
                        </tbody>
                        <tfoot><tr><td colspan="13"></td></tr></tfoot>
                    </table>
                </div>
            </div>
        </div>

    {页面底部}{/页面底部}

    <script src="/Resource/js/bootstrap-datetimepicker.js"></script>
    <script src="/Resource/js/bootstrap-datetimepicker.zh-CN.js"></script>
    <script src="/Resource/js/mustache.js"></script>
    <script src="/Resource/js/ZeroClipboard.min.js"></script>

    <script>
        (function() {
            'use strict';
//=========================================== 模态框方法 ====================================================

        
//=========================================== 模态框方法 ====================================================

//=========================================== 页面基本功能 ====================================================
            
            // 标签页定位
            // (function() {
            //     var op = location.search.split('&');
            //     var isDo = location.search.split('&')[0];
            //     var $formSearch = $('#form-search');
            //     isDo = isDo.split('=')[0] == '?Do' ? isDo : '?Do=Sold';
            //     $('.nav a[href="' + isDo + '"]').closest('li').addClass('active');

            //     $formSearch.find('input[type="text"]').val(decodeURI((op.KeyWord || '').replace(/\++/g, ' ')));
            //     $formSearch.find('select').find('option[value="' + decodeURI(op.Selected) + '"]').prop('selected', true);
            //     $formSearch.find('select option[value="' + (op.TeamID || $formSearch.find('select').data('default')) + '"]').prop('selected', true);
            // })();

            // 列表页脚分页
            // (function() {
            //     <!-- BEGIN 分页脚本 ATTRIB= -->
            //     common.showPage({当前页}, {总条数}, {每页条数});
            //     <!-- END 分页脚本 -->
            // })();

//=========================================== 页面基本功能 ====================================================
        })();
    </script>
</body>
</html>
