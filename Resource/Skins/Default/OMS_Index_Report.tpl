{页面属性}{/页面属性}
<body>
    {页顶导航}{/页顶导航}
    
    <!-- 内容-->
    <div id="data-list" class="container-fluid">
            <header>
                <div class="btn-group btn-group-sm pull-right">
                    <button id="printWEB" class="btn btn-success" type="button">打印</button>

                    <div class="btn-group btn-group-sm hidden">
                        <button data-name="Confirmed" class="btn btn-default btn-status-alter option-status-alter" type="button" disabled=""><span class="glyphicon glyphicon-eye-open"></span> <span data-val="已审核">审核</span></button>
                    </div>

                    <div class="btn-group btn-group-sm hidden">
                        <button data-name="OutStock" data-toggle="dropdown" class="btn btn-warning dropdown-toggle btn-status-alter" type="button" disabled=""><span class="glyphicon glyphicon-flash"></span> 缺货</button>
                        <ul class="dropdown-menu dropdown-menu-right">
                            <li class="option-status-alter" data-val="正常"><a href="javascript:;">有货</a></li>
                            <li class="option-status-alter" data-val="缺货"><a href="javascript:;"><span class="text-danger">缺货</span></a></li>
                        </ul>
                    </div>

                    <div class="btn-group btn-group-sm hidden">
                        <button data-name="Cancel" data-toggle="dropdown" class="btn btn-danger dropdown-toggle btn-status-alter" type="button" disabled=""><span class="glyphicon glyphicon-remove"></span> 取消</button>
                        <ul class="dropdown-menu dropdown-menu-right">
                            <li class="option-status-alter" data-val="正常"><a href="javascript:;">正常发货</a></li>
                            <li class="option-status-alter" data-val="取消发货"><a href="javascript:;"><span class="text-danger">取消发货</span></a></li>
                        </ul>
                    </div>
                </div>
            </header>

            <div class="tab-content">
                <div class="tab-pane active">
                    <form id="form-filter" class="form-inline mg-t-10 mg-b-10" action="javascript:;">
                        <input class="do" type="hidden" name="Do" value="unconfirmed">

                        <div class="input-group">
                            <div class="btn-group btn-group-xs" data-toggle="buttons">
                                <!-- BEGIN 店铺列表 ATTRIB= -->
                                <label class="btn btn-default">
                                    <input type="checkbox" name="ShopID" value="{DataID}" autocomplete="off">{Name}
                                </label>
                                 <!-- END 店铺列表 -->
                             </div>
                        </div>

                        <div class="form-group form-group-sm">
                            <!-- BEGIN 所在团队 ATTRIB= -->
                            <select id="TeamID" class="form-control" name="TeamID" data-default="{TeamID}" {Admin}>
                            <!-- END 所在团队 -->
                                <option value="0">所有团队</option>
                                <!-- BEGIN 销售团队 ATTRIB= -->
                                <option value="{DataID}">{Name}</option>
                                <!-- END 销售团队 -->
                             </select>

                        </div>

                        <div class="input-group input-group-sm">
                            <input type="text" class="form-control" placeholder="Search..." name="KeyWord">
                            <span class="input-group-btn">
                                <button class="btn btn-default" type="submit"><span class="glyphicon glyphicon-search"></span> 搜索</button>
                            </span>
                        </div>
                    </form>
                    <div id="printTar" class="maxH800">
                        <table class="table table-striped table-bordered table-hover table-condensed">
                            <colgroup>
                                <col width="20%">
                                <col width="10%">
                                <col>
                                <col>
                                <col>
                            </colgroup>
                            <tbody>
                                <!-- BEGIN 数据列表 ATTRIB= -->
                                <tr data-id="{DataID}" style="page-break-before:always;">
                                    <td><img src="{Pic}" style="height: 110px; width: auto;"></td>
                                    <td>{Amt} <span class="label currency">{Currency}</span></td>
                                    <td>[{Shop}] {Buyer}<br />[{Country}] {Name}</td>
                                    <td>{SKU}</td>
                                    <td>{CreatedTime}</td>
                                </tr>
                                <!-- END 数据列表 -->
                            </tbody>
                            <tfoot></tfoot>
                        </table>
                    </div>
                </div>
            </div>
        </div>

    {页面底部}{/页面底部}

    <script src="/Resource/js/order.js"></script>
    
    <script>
        (function() {
            'use strict';

            var $printWEB = $('#printWEB'),
                tab = 0;

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
