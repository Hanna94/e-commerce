{页面属性}{/页面属性}
<body>
    {页顶导航}{/页顶导航}
    <!-- 内容-->
    <div id="data-list" class="container-fluid">
        <header>
            <div class="btn-group pull-right">
                <a href="?Do=Create"><button class="btn btn-default">新建工单</button></a>
            </div>
        </header>

        <ul class="nav nav-tabs">
            <li class="dropdown MyTicket"><a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown">发出<i class="caret"></i></a>
                <ul class="dropdown-menu">
                    <li><a href="?Do=MyTicket">全部</a></li>
                    <li><a href="?Do=MyTicket&Complete=true">完成</a></li>
                    <li><a href="?Do=MyTicket&Complete=false">未完成</a></li>
                </ul>
            </li>
            <li class="Received"><a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown">收到<i class="caret"></i></a>
                <ul class="dropdown-menu">
                    <li><a href="?Do=Received">全部</a></li>
                    <li><a href="?Do=Received&Complete=true">完成</a></li>
                    <li><a href="?Do=Received&Complete=false">未完成</a></li>
                </ul>
            </li>
            <li class="Marks"><a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown">收藏<i class="caret"></i></a>
                <ul class="dropdown-menu">
                    <li><a href="?Do=Marks">全部</a></li>
                    <li><a href="?Do=Marks&Complete=true">完成</a></li>
                    <li><a href="?Do=Marks&Complete=false">未完成</a></li>
                </ul>
            </li>
        </ul>
        <div class="tab-control">
            <div class="tab-pane fade in active">
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
                        <col width="5%">
                    </colgroup>
                    <thead>
                        <tr>
                            <th>编号</th>
                            <th>工单号</th>
                            <th>内容</th>
                            <th>状态</th>
                            <th>发起人</th>
                            <th>被分享人</th>
                            <th>反馈</th>
                            <th>时间</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- BEGIN 数据列表 ATTRIB= -->
                        <tr data-id="{DataID}" data-orderid="{OrderID}">
                            <td>{DataID}</td>
                            <td>{OrderID}</td>
                            <td>{Note}</td>
                            <td>{Status}</td>
                            <td>{PostName}</td>
                            <td>{ShareName}</td>
                            <td>{Feedback}</td>
                            <td>{Date}</td>
                            <td><a href="?Do=Edit&OrderID={OrderID}" target="_blank"><span class="glyphicon glyphicon-eye-open"></span></a></td>
                        </tr>
                        <!-- END 数据列表  -->
                    </tbody>
                    <tfoot><tr><td colspan="9"></td></tr></tfoot>
                </table>
            </div>
        </div>
    </div>
    {页面底部}{/页面底部}
    
    <script>
        (function(){
            'use strict';

            var oParam = common.URL.parse(),
                $dataList = $('#data-list');

            // 初始化标签页
             $dataList.find('.nav-tabs li[class*="' + oParam.Do + '"]').addClass('active');

            <!-- BEGIN 分页脚本 ATTRIB= -->
            common.showPage({当前页}, {总条数}, {每页条数});
            <!-- END 分页脚本 -->
        })();
    </script>
</body>
</html>
