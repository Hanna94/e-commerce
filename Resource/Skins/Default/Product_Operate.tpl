{页面属性}{/页面属性}
<body>
    {页顶导航}{/页顶导航}
    <!-- 正文外围 -->
    <div class="container-fluid">
        <header>
            <!-- 按钮预留 -->
            <!-- <div class="btn-group btn-group-sm pull-right">
                <button id="btn-batch" class="btn btn-default hide" type="button" disabled>批量操作</button>
                <button class="btn btn-default" type="button" disabled>导出报表</button>
                <button id="add-spu-data" class="btn btn-default" type="button">添加数据</button>
            </div> -->
            <form id="form-search" action="?" class="form-inline pull-right pull-right mg-r-20">
                <input id="url-do" name="Do" type="hidden" value="All">
                <input id="url-tag" name="TagID" type="hidden" value="">
                <div class="form-group form-group-sm">
                    <select id="TeamID" class="form-control" name="TeamID" data-default="{TeamID}">
                        <option value = "-1">未分配</option>
                        <option value = "0">所有团队</option>
                        <!-- BEGIN 销售团队 ATTRIB= -->
                        <option value="{DataID}">{Name}</option>
                        <!-- END 销售团队 -->
                    </select>
                </div>
                <div class="form-group form-group-sm mg-l-20">
                    <div class="input-group input-group-sm">
                        <input type="text" class="form-control" placeholder="SkuID / Name / Sku" name="KeyWord">
                        <span class="input-group-btn">
                            <button class="btn btn-default" type="submit">查询</button>
                        </span>
                    </div>
                </div>
            </form>
        </header>
        
        <ul class="nav nav-tabs">
            <li><a href="?Do=All">全部</a></li>
            <li><a href="?Do=Sold">在售</a></li>
            <li><a href="?Do=Mark">收藏</a></li>
            <li><a href="?Do=Clearance">清仓</a></li>
            <li><a href="?Do=End">下架</a></li>
        </ul>

        <div class="tab-content">
            <div class="tab-pane active">
                <div class="tags mg-10">
                    <!-- BEGIN TAG列表 ATTRIB= -->
                    <span class="label label-default poi btn-tag" data-id='{DataID}'>{Name}</span>
                    <!-- END TAG列表 -->
                </div>
                <!-- 数据列表-->
                <div class="row">
                    <div class="col-sm-3">
                        <table id="data-list" class="table table-hover table-bordered table-striped table-condensed">
                            <colgroup>
                                <col>
                                <col width="40px">
                            </colgroup>
                            <thead>
                                <th>Sku</th>
                                <th>操作</th>
                            </thead>
                            <tbody>
                            <!-- BEGIN 数据列表 ATTRIB= -->
                                <tr data-id="{DataID}">
                                    <td>{SkuStatus}{FullSKU}{FullName}</td>
                                    <td></td>
                                </tr>
                            <!-- END 数据列表 -->
                            </tbody>
                            <tfoot><tr><td colspan="2"></td></tr></tfoot>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    {页面底部}{/页面底部}
    <script src="/Resource/js/mustache.js"></script>
    <script>
        (function() {
            'use strict';

            var $dataList = $('#data-list');

            // 标签页定位
            $('.nav a[href="' + location.search.split('&')[0] + '"]').closest('li').addClass('active');

            <!-- BEGIN 分页脚本 ATTRIB= -->
            common.showPage({当前页}, {总条数}, {每页条数}, 'mini');
            <!-- END 分页脚本 -->
        })();
    </script>
</body>
</html>