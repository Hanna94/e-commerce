{页面属性}{/页面属性}
<body>
    {页顶导航}{/页顶导航}
    <!-- 内容-->
    <div id="data-list" class="container-fluid">
        <header>
            <form action="?" class="form-inline">
                <div class="form-group">
                    <select id="team" class="form-control" name="team">
                        <option value="1">拉姆</option>
                        <option value="2">蕾姆</option>
                    </select>
                    <select id="warehouse" name="warehouse" class="form-control">
                        <option value="1">拉姆</option>
                        <option value="2">蕾姆</option>
                    </select>
                    <button id="tw-select" class="btn btn-default" type="button">查询</button>
                </div>
                <div class="form-group mg-l-20">
                    <select name="wnum" id="wnum" class="form-control">
                        <option value="20">20</option>
                        <option value="30">30</option>
                        <option value="40">40</option>
                    </select>
                    <button class="btn btn-default" type="button">查询</button>
                </div>
                <div class="form-group mg-l-20">
                    <div class="input-group">
                        <input type="text" class="form-control" />
                        <span class="input-group-btn">
                            <button class="btn btn-default" type="button">查询</button>
                        </span>
                    </div>
                </div>
            </form>
        </header>
        <div class="maxH800 mg-t-5">
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
                </colgroup>
                <thead>
                    <th>产品名称</th>
                    <th>SPU</th>
                    <th>库存SKU</th>
                    <th>仓库</th>
                    <th>库存编码</th>
                    <th>库存数量</th>
                    <th>产品尺寸</th>
                    <th>重量</th>
                </thead>
                <tbody>
                    <!-- BEGIN 数据列表 ATTRIB= -->
                    <tr>
                        <td>asdfasdf</td>
                        <td>asdfasdf</td>
                        <td>asdfasdf</td>
                        <td>asdfasdf</td>
                        <td>asdfasdf</td>
                        <td>asdfasdf</td>
                        <td>asdfasdf</td>
                        <td>asdfasdf</td>
                    </tr>
                    <!-- END 数据列表  -->
                </tbody>
                <tfoot><tr><td colspan="8"></td></tr></tfoot>
            </table>
        </div>
    </div>
    {页面底部}{/页面底部}
    
    <script>
        (function(){
            'use strict';

            <!-- BEGIN 分页脚本 ATTRIB= -->
            common.showPage({当前页}, {总条数}, {每页条数});
            <!-- END 分页脚本 -->
        }());
    </script>
</body>
</html>
