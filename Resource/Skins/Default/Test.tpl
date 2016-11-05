{页面属性}{/页面属性}
<body>
    {页顶导航}{/页顶导航}
    <!-- 内容-->
    <div id="data-list" class="container-fluid">
        <header>
            <div class="btn-group btn-group-sm pull-right">
                <button class="btn btn-default" type="button">批量操作</button>
                <button class="btn btn-default" type="button">导出报表</button>
                <button class="btn btn-default" type="button">添加数据</button>
            </div>
            <form action="?" class="form-inline pull-right pull-right mg-r-20">
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
                        <input type="text" class="form-control" />
                        <span class="input-group-btn">
                            <button class="btn btn-default" type="button">查询</button>
                        </span>
                    </div>
                </div>
            </form>
        </header>
    
        <ul class="nav nav-tabs">
            <li class="active"><a href="?Do=All">全部</a></li>
            <li><a href="?Do=All">在售</a></li>
            <li><a href="?Do=All">收藏</a></li>
            <li><a href="?Do=All">清仓</a></li>
            <li><a href="?Do=All">下架</a></li>
        </ul>

        <div class="tab-content">
            <div class="tab-pane active">
                <div class="tags mg-10">
                    <span class="label label-primary poi">tag-1</span>
                    <span class="label label-primary poi">tag-2</span>
                    <span class="label label-primary poi">tag-3</span>
                    <span class="label label-primary poi">tag-4</span>
                </div>

                <div class="maxH800">
                    <table class="table table-striped table-bordered table-hover table-condensed">
                        <thead>
                            <th>编日</th>
                            <th>SPU Setup</th>
                            <th>SKU Setup</th>
                            <th>尺寸(cm)</th>
                            <th>毛重(g)</th>
                            <th>申报</th>
                            <th>日期-时间</th>
                            <th>操作</th>
                        </thead>
                        <tbody>
                            <tr>
                                <td><input type="checkbox" value="13">13 </td>
                                <td>C0242</td>
                                <td>销售DH1604孕妇蕾丝婚纱 Halloween</td>
                                <td>22*33*44</td>
                                <td>125.2</td>
                                <td></td>
                                <td>2016-10-22 16:36</td>
                                <td>
                                    <span id="btn-edit" class="poi glyphicon glyphicon-pencil mg-r-5" data-toggle="modal" href="#add-data"></span>
                                    <span id="btn-collect" class="poi glyphicon glyphicon-star mg-r-5"></span>
                                    <span id="btn-log" class="poi glyphicon glyphicon-list-alt"></span>
                                    <!-- <a title="编辑" class="btn-edit" data-toggle="modal" href="#add-data"><span class="glyphicon glyphicon-pencil"></span></a>
                                    &nbsp;&nbsp;
                                    <a title="授权团队" class="btn-accredit-team" href="javascript:;"><span class="glyphicon glyphicon-user text-success"></span></a>
                                    &nbsp;&nbsp;
                                    <a title="删除" class="btn-del" href="javascript:;"><span class="glyphicon glyphicon-remove text-danger"></span></a> -->
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div class="mg-t-5">
            <div class="pull-left">
                <p>模态框暂存</p>
                <div class="btn-group">
                    <button class="btn btn-default" data-toggle="modal" data-target="#modal-edit-spu">编辑SPU</button>
                    <button class="btn btn-default" data-toggle="modal" data-target="#modal-set-style">设置XXX的款式</button>
                    <button class="btn btn-default" data-toggle="modal" data-target="#modal-set-attr">设置Product SKU XXX的属性</button>
                </div>
            </div>
            <!-- 柱线混合 -->
            <div id="bar-line" class="pull-left" style="width: 1200px; height: 250px;"></div>
            <!-- 嵌套环形 -->
            <div id="pie-nest" class="pull-left" style="width: 1200px; height: 700px;"></div>
        </div>

        <!-- 模态框 编辑SPU -->
        <div class="modal fade modal-nav" id="modal-edit-spu" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button class="close" type="button" data-dismiss="modal">x</button>
                        <h4 class="modal-title">编辑SPU</h4>
                    </div>
                    <div class="modal-body">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#spu-nav-basic" data-toggle="tab">基本</a></li>
                            <li><a href="#spu-nav-tag" data-toggle="tab">Tag设置</a></li>
                            <li><a href="#spu-nav-accredit" data-toggle="tab">产品授权</a></li>
                            <li><a href="#spu-nav-remark" data-toggle="tab">备注</a></li>
                            <li><a href="#spu-nav-log" data-toggle="tab">日志</a></li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane fade in active" id="spu-nav-basic">
                                <form class="form-horizontal mg-t-10" action="javascript:;">
                                    <div class="form-group form-group-sm">
                                        <label class="col-sm-2 control-label" for="basic-spu-code">SPU Code</label>
                                        <div class="col-sm-4">
                                            <input id="basic-spu-code" type="text" class="form-control">
                                        </div>
                                    </div>
                                    <div class="form-group form-group-sm">
                                        <label class="col-sm-2 control-label" for="basic-spu-name">SPU Name</label>
                                        <div class="col-sm-4">
                                            <input id="basic-spu-name" type="text" class="form-control">
                                        </div>
                                    </div>
                                    <div class="form-group form-group-sm">
                                        <label class="col-sm-2 control-label" for="basic-spu-declare">申报名称</label>
                                        <div class="col-sm-4">
                                            <input id="basic-spu-declare" type="text" class="form-control">
                                        </div>
                                        <label class="col-sm-2 control-label" for="basic-spu-usd">申报价值USD</label>
                                        <div class="col-sm-4">
                                            <input id="basic-spu-usd" type="text" class="form-control">
                                        </div>
                                    </div>
                                    <div class="form-group form-group-sm">
                                        <label class="col-sm-2 control-label" for="basic-spu-size">尺寸</label>
                                        <div class="col-sm-4">
                                            <input id="basic-spu-size" type="text" class="form-control">
                                        </div>
                                        <label class="col-sm-2 control-label" for="basic-spu-weight">重量</label>
                                        <div class="col-sm-4">
                                            <input id="basic-spu-weight" type="text" class="form-control">
                                        </div>
                                    </div>
                                    <div class="form-group form-group-sm">
                                        <label class="col-sm-2 control-label" for="basic-spu-state">状态</label>
                                        <div class="col-sm-4">
                                            <input id="basic-spu-state" type="text" class="form-control">
                                        </div>
                                        <label class="col-sm-2 control-label" for="basic-spu-battery">电池</label>
                                        <div class="col-sm-4">
                                            <input id="basic-spu-battery" type="text" class="form-control">
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="tab-pane fade" id="spu-nav-tag"></div>
                            <div class="tab-pane fade" id="spu-nav-accredit"></div>
                            <div class="tab-pane fade" id="spu-nav-remark"></div>
                            <div class="tab-pane fade" id="spu-nav-log"></div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button id="modal-edit-spu-btn" class="btn btn-default" type="button">保存</button>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- 模态框 设置款式 -->
        <div class="modal fade" id="modal-set-style" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button class="close" type="button" data-dismiss="modal">x</button>
                        <h4 class="modal-title">设置XXX的款式</h4>
                    </div>
                    <div class="modal-body">
                        <table class="table table-striped table-bordered table-hover table-condensed">
                            <thead>
                                <th>Product ID</th>
                                <th>Product SKU</th>
                                <th>Product Name</th>
                                <th>SKU Code</th>
                                <th>说明</th>
                                <th>SKU 状态</th>
                                <th>操作</th>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>1427</td>
                                    <td>C02420-XXL</td>
                                    <td>DH1604孕妇蕾丝婚纱加大</td>
                                    <td>XXL</td>
                                    <td>加加大</td>
                                    <td></td>
                                    <td>
                                        <span class="glyphicon glyphicon-sort-by-attributes mg-l-5 poi" title="属性"></span>
                                        <span class="glyphicon glyphicon-star mg-l-5 poi" title="收藏"></span>
                                        <span class="glyphicon glyphicon-list-alt mg-l-5 poi" title="日志"></span>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button id="modal-set-style-btn" class="btn btn-default" type="button">保存</button>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- 模态框 设置属性 -->
        <div class="modal fade" id="modal-set-attr" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button class="close" type="button" data-dismiss="modal">x</button>
                        <h4 class="modal-title">设置Product SKU XXX的属性</h4>
                    </div>
                    <div class="modal-body"></div>
                    <div class="modal-footer">
                        <button id="modal-set-attr-btn" class="btn btn-default" type="button">保存</button>
                    </div>
                </div>
            </div>
        </div>

    </div>
    {页面底部}{/页面底部}
    <script src="/Resource/js/echarts.common.min.js"></script>
    <script>
        (function() {
            var $barLine = echarts.init($('#bar-line')[0]);
            var $pieNest = echarts.init($('#pie-nest')[0]);

            // 计算当前月的天数
            var currentDate = new Date();
            var currentYear = currentDate.getFullYear();
            var currentMonth = currentDate.getMonth() + 1;
            var maxDay = new Date(currentYear,currentMonth,0).getDate();
            var months = [
                '1日', '2日', '3日', '4日', '5日', '6日', '7日', '8日', '9日', '10日', 
                '11日', '12日', '13日', '14日', '15日', '16日', '17日', '18日', '19日', '20日',
                '21日', '22日', '23日', '24日', '25日', '26日', '27日', '28日'
            ];

            switch(maxDay){
                case 29:
                    months.push('29日');
                break;
                case 30:
                    months.push('29日', '30日');
                break;
                case 31:
                    months.push('29日', '30日', '31日');
                break;
            }

            // 柱线复合图配置
            var barLineOption = {
                tooltip: {
                    trigger: 'axis'
                },
                toolbox: {},
                title: {
                    text: '测试图表'
                },
                legend: {
                    data: ['金额', '订单数']
                },
                xAxis: {
                    type: 'category',
                    data: months
                },
                yAxis: [
                    {
                        type: 'value',
                        name: '金额',
                        max: 2500,
                        min: 0,
                        axisLabel: {
                            formatter: '${value}'
                        }
                    },
                    {
                        type: 'value',
                        name: '订单数',
                        max: 100,
                        min: 0,
                        axisLabel: {
                            formatter: '{value} 件'
                        }
                    }
                ],
                series: [{
                    name: '金额',
                    type: 'bar',
                    data: (function() {
                        var res = [];
                        for (var i = 0; i < maxDay; i++) {
                            res.push(Math.floor(Math.random() * 2200));
                        }
                        return res;
                    })()
                }, {
                    name: '订单数',
                    type: 'line',
                    yAxisIndex: 1,
                    data: (function() {
                        var res = [];
                        for (var i = 0; i < maxDay; i++) {
                            res.push(Math.floor(Math.random() * 70));
                        }
                        return res;
                    })()
                }]
            };

            // 各类随机参数
            var platform = randomNum(); // 平台费用
            var platformArray = randomPart(platform, 3); 
            var finance = randomNum(); // 财务费用
            var financeArray = randomPart(finance, 2); 
            var goods = randomNum(); // 商品费用
            var goodsArray = randomPart(goods, 1); 
            var logistics = randomNum(); // 物流成本
            var logisticsArray = randomPart(logistics, 2); 
            var market = randomNum(); // 销售毛利
            var marketArray = randomPart(market, 3); 

            var partSumArray = [
                148991.7, 10666, 101085.5, 18823.04, 23528.81, 624446.2, 
                61184.52, 448929.4, 47057.61, 39214.68, 135406.4
                ];
            var SumArray = [260743.2, 42351.85, 624446.2, 510113.92, 221678.69];
            var percentPart = sumPercent(partSumArray);
            var percentSum = sumPercent(SumArray);


            // 嵌套环形图配置
            var pieNestOption = {
                tooltip:{
                    trigger:'item',
                    formatter:'{a} <br/>{b}: {c} ({d}%)'
                },
                legend:{},
                series:[
                    {
                        name: '资金汇总',
                        type: 'pie',
                        selectedMode: 'single',
                        radius: [0, '30%'],
                        label: {
                            normal: {
                                position: 'inner'
                            }
                        },
                        labelLine: {
                            normal: {
                                show: false
                            }
                        },
                        data:[
                            {value: 260743.2, name: '平台', selected: true},
                            {value: 42351.85, name: '财务'},
                            {value: 624446.2, name: '商品'},
                            {value: 510113.92, name: '物流'},
                            {value: 221678.69, name: '销售'}
                        ]
                    },
                    {
                        name: '资金汇总',
                        type: 'pie',
                        radius: ['35%', '55%'],
                        data: [
                            {value: 148991.7, name: '成交费：'+ partSumArray[0] + '(' + percentPart[0] + ')'},
                            {value: 10666, name: '功能费：'+ partSumArray[1] + '(' + percentPart[1] + ')'},
                            {value: 101085.5, name: '手续费：'+ partSumArray[2] + '(' + percentPart[2] + ')'},
                            {value: 18823.04, name: '汇差：'+ partSumArray[3] + '(' + percentPart[3] + ')'},
                            {value: 23528.81, name: '汇损：'+ partSumArray[4] + '(' + percentPart[4] + ')'},
                            {value: 624446.2, name: '商品成本：'+ partSumArray[5] + '(' + percentPart[5] + ')'},
                            {value: 61184.52, name: '调拨：'+ partSumArray[6] + '(' + percentPart[6] + ')'},
                            {value: 448929.4, name: '运费：'+ partSumArray[7] + '(' + percentPart[7] + ')'},
                            {value: 47057.61, name: '预扣净利：'+ partSumArray[8] + '(' + percentPart[8] + ')'},
                            {value: 39214.68, name: '预扣售后：'+ partSumArray[9] + '(' + percentPart[9] + ')'},
                            {value: 135406.4, name: '毛利：'+ partSumArray[10] + '(' + percentPart[10] + ')'}
                        ]
                    }
                ]
            };

            $barLine.setOption(barLineOption); // 柱线复合图
            $pieNest.setOption(pieNestOption); // 嵌套环形图 
            console.log(JSON.stringify(pieNestOption));
            // 随机金额
            function randomNum(){
                return parseInt(Math.random() * 10000);
            }

            /**
             * 随机分值
             * @param  number sum 总金额
             * @param  number num 要拆分成几个数
             * @return array      返回一个数据，数组内数据总和为sum
             */
            function randomPart(sum, num) {
                var sumArray = [];
                var _sum = sum;
                var _tmp;
                for (var i = 0; i < num - 1; i++) {
                    do{
                        _tmp = _sum - parseInt(Math.random() * 10000);
                    }
                    while(_tmp < 0 || _tmp > _sum);
                    _sum -= _tmp;
                    sumArray.push(_tmp);
                }
                sumArray.push(_sum);
                return sumArray;
            }

            /**
             * 每项的百分比（因为插件的百分比只显示在浮层上）
             * @param  array sumArray 各项的数组
             * @return array          百分比字符串的数组
             */
            function sumPercent(sumArray) {
                var sum = 0;
                var percentArray = [];
                // 计算数组的和
                for (var i = 0; i < sumArray.length; i++) {
                    sum += sumArray[i];
                }
                for (var i = 0; i < sumArray.length; i++) {
                    var _tmp = Math.round(sumArray[i] / sum * 10000) / 100 + '%';
                    percentArray.push(_tmp);
                }
                return percentArray;
            }
        })();
    </script>
</body>
</html>
