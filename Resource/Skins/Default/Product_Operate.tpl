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
                    <!-- 数据表 -->
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
                                    <td>
                                        <a class="btn-sku-see btn btn-default btn-xs" title="查看该SKU概况">
                                            <span class="poi glyphicon glyphicon-eye-open"></span>
                                        </a>
                                    </td>
                                </tr>
                            <!-- END 数据列表 -->
                            </tbody>
                            <tfoot><tr><td colspan="2"></td></tr></tfoot>
                        </table>
                    </div>
                    <!-- 数据图 -->
                    <div class="col-sm-9">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">#3232H2O233-默认款水货-Def的图表</h4>
                            </div>
                            <div class="panel-body">
                                <div class="row">
                                    <!-- 表格 -->
                                    <div class="col-sm-12">
                                        <table id="sku-list" class="table table-bordered table-condensed">
                                            <tbody>
                                                <tr>
                                                    <td><strong>总金额</strong></td>
                                                    <td class="text-muted">122.33GBP</td>
                                                    <td><strong>总单数</strong></td>
                                                    <td class="text-muted">12</td>
                                                    <td><strong>均价</strong></td>
                                                    <td class="text-muted">25.44GBP</td>
                                                </tr>
                                                <tr>
                                                    <td><strong>总库存</strong></td>
                                                    <td class="text-muted">17</td>
                                                    <td><strong>本地仓</strong></td>
                                                    <td class="text-muted">12</td>
                                                    <td><strong>海外仓</strong></td>
                                                    <td class="text-muted">UK：2，DE：0，AU：0</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <!-- 近30日售出情况报表 -->
                                    <div class="col-sm-12">
                                        <div id="echarts-last-30-days-sell" class="pull-left" style="width: 100%; height: 250px;"></div>
                                    </div>
                                    <!-- 本月售出情况报表 -->
                                    <!-- <div class="col-sm-12">
                                        <div id="echarts-current-month-sell" class="pull-left" style="width: 100%; height: 250px;"></div>
                                    </div> -->
                                    <!-- 近30日每天在线报表 -->
                                    <div class="col-sm-12">
                                        <div id="echarts-last-30-days-online" class="pull-left" style="width: 100%; height: 250px;"></div>
                                    </div>
                                    <!-- 近30日每天库存报表 -->
                                    <div class="col-sm-12">
                                        <div id="echarts-last-30-stock" class="pull-left" style="width: 100%; height: 500px;"></div>
                                    </div>
                                    <!-- 产品运营情况两层饼图 -->
                                    <div class="col-sm-6">
                                        <div id="echarts-operate" class="pull-left" style="width: 100%; height: 500px;"></div>
                                    </div>
                                    <!-- 产品各账号分布情况饼图 -->
                                    <div class="col-sm-6">
                                        <div id="echarts-account" class="pull-left" style="width: 100%; height: 500px;"></div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    {页面底部}{/页面底部}
    <script src="/Resource/js/echarts.common.min.js"></script>
    <script src="/Resource/js/mustache.js"></script>
    <script>
        (function() {
            'use strict';

            var $dataList = $('#data-list');
            var last30Day = Last30Days();

// ==================================================== 图表 ============================================== //

            // 近30日售出情况报表
            (function() {
                
                // 柱线复合图配置
                var barLineOption = {
                    tooltip: {
                        trigger: 'axis'
                    },
                    toolbox: {},
                    title: {
                        text: '近30日售出情况报表'
                    },
                    legend: {
                        data: ['金额', '订单数']
                    },
                    xAxis: {
                        type: 'category',
                        data: last30Day
                    },
                    yAxis: [
                        {
                            type: 'value',
                            name: '金额',
                            axisLabel: {
                                formatter: '${value}'
                            }
                        },
                        {
                            type: 'value',
                            name: '订单数',
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
                            for (var i = 0; i < 30; i++) {
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
                            for (var i = 0; i < 30; i++) {
                                res.push(Math.floor(Math.random() * 90));
                            }
                            return res;
                        })()
                    }]
                };

                var $eLast30DaysSell = echarts.init($('#echarts-last-30-days-sell')[0]);
                $eLast30DaysSell.setOption(barLineOption);

            })();

            // 本月售出情况报表
            // (function() {
            //     // 计算当前月的天数
            //     var currentDate = new Date();
            //     var currentYear = currentDate.getFullYear();
            //     var currentMonth = currentDate.getMonth() + 1;
            //     var maxDay = new Date(currentYear,currentMonth,0).getDate();
            //     var months = [];
            //     for(var i = 1; i <= maxDay; i++) {
            //         months.push(i + '日');
            //     }
            // })();

            // 近30日每天在线报表
            (function() {
                
                // 柱线复合图配置
                var barLineOption = {
                    tooltip: {
                        trigger: 'axis'
                    },
                    toolbox: {},
                    title: {
                        text: '近30日每天在线报表'
                    },
                    legend: {
                        data: ['Listing', '在线库存']
                    },
                    xAxis: {
                        type: 'category',
                        data: last30Day
                    },
                    yAxis: [
                        {
                            type: 'value',
                            name: 'Listing',
                            axisLabel: {
                                formatter: '${value}'
                            }
                        },
                        {
                            type: 'value',
                            name: '库存',
                            axisLabel: {
                                formatter: '{value} 件'
                            }
                        }
                    ],
                    series: [{
                        name: 'Listing',
                        type: 'bar',
                        data: (function() {
                            var res = [];
                            for (var i = 0; i < 30; i++) {
                                res.push(Math.floor(Math.random() * 3200));
                            }
                            return res;
                        })()
                    }, {
                        name: '在线库存',
                        type: 'line',
                        yAxisIndex: 1,
                        data: (function() {
                            var res = [];
                            for (var i = 0; i < 30; i++) {
                                res.push(Math.floor(Math.random() * 70));
                            }
                            return res;
                        })()
                    }]
                };

                var $eLast30DaysOnline = echarts.init($('#echarts-last-30-days-online')[0]);
                $eLast30DaysOnline.setOption(barLineOption);
            })();

            // 近30日每天库存报表
            (function() {
                var option = {
                    tooltip : {
                        trigger: 'axis',
                        axisPointer : {
                            type : 'shadow'
                        }
                    },
                    title: {
                        text: '近30日每天库存报表'
                    },
                    legend: {
                        data:['本地仓','UK','DE','AU']
                    },
                    grid: {
                        left: '3%',
                        right: '4%',
                        bottom: '3%',
                        containLabel: true
                    },
                    xAxis : [
                        {
                            type : 'category',
                            data : last30Day
                        }
                    ],
                    yAxis : [
                        {
                            type : 'value'
                        }
                    ],
                    series : [

                        {
                            name:'本地仓',
                            type:'bar',
                            stack: '库存',
                            data: (function() {
                                var res = [];
                                for (var i = 0; i < 30; i++) {
                                    res.push(Math.floor(Math.random() * 500));
                                }
                                return res;
                            })()
                        },
                        {
                            name:'UK',
                            type:'bar',
                            stack: '库存',
                            data: (function() {
                                var res = [];
                                for (var i = 0; i < 30; i++) {
                                    res.push(Math.floor(Math.random() * 500));
                                }
                                return res;
                            })()
                        },
                        {
                            name:'DE',
                            type:'bar',
                            stack: '库存',
                            data: (function() {
                                var res = [];
                                for (var i = 0; i < 30; i++) {
                                    res.push(Math.floor(Math.random() * 500));
                                }
                                return res;
                            })()
                        },
                        {
                            name:'AU',
                            type:'bar',
                            stack: '库存',
                            data: (function() {
                                var res = [];
                                for (var i = 0; i < 30; i++) {
                                    res.push(Math.floor(Math.random() * 500));
                                }
                                return res;
                            })()
                        }
                    ]
                };

                var $eLast30DaysStock = echarts.init($('#echarts-last-30-stock')[0]);
                $eLast30DaysStock.setOption(option);
            })();

            // 产品运营情况两层饼图
            (function() {
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
                    title: {
                        text: '产品运营情况'
                    },
                    series:[
                        {
                            name: '资金汇总',
                            type: 'pie',
                            selectedMode: 'single',
                            radius: [0, '40%'],
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
                            radius: ['50%', '75%'],
                            data: [
                                {value: 148991.7, name: '成交费'},
                                {value: 10666, name: '功能费'},
                                {value: 101085.5, name: '手续费'},
                                {value: 18823.04, name: '汇差'},
                                {value: 23528.81, name: '汇损'},
                                {value: 624446.2, name: '商品成本'},
                                {value: 61184.52, name: '调拨'},
                                {value: 448929.4, name: '运费'},
                                {value: 47057.61, name: '预扣净利'},
                                {value: 39214.68, name: '预扣售后'},
                                {value: 135406.4, name: '毛利'}
                            ]
                        }
                    ]
                };

                var $eOperate = echarts.init($('#echarts-operate')[0]);
                $eOperate.setOption(pieNestOption);
            })();

            // 产品各账号分布情况饼图
            (function() {
                var option = {
                    title : {
                        text: '南丁格尔玫瑰图',
                        subtext: '纯属虚构',
                        x:'center'
                    },
                    tooltip : {
                        trigger: 'item',
                        formatter: "{a} <br/>{b} : {c} ({d}%)"
                    },
                    legend: {
                        x : 'center',
                        y : 'bottom',
                        data:['rose1','rose2','rose3','rose4','rose5','rose6','rose7','rose8']
                    },
                    toolbox: {
                        show : true,
                        feature : {
                            mark : {show: true},
                            dataView : {show: true, readOnly: false},
                            magicType : {
                                show: true,
                                type: ['pie', 'funnel']
                            },
                            restore : {show: true},
                            saveAsImage : {show: true}
                        }
                    },
                    calculable : true,
                    series : [
                        {
                            name:'半径模式',
                            type:'pie',
                            radius : [20, 110],
                            roseType : 'radius',
                            label: {
                                normal: {
                                    show: false
                                },
                                emphasis: {
                                    show: true
                                }
                            },
                            lableLine: {
                                normal: {
                                    show: false
                                },
                                emphasis: {
                                    show: true
                                }
                            },
                            data:[
                                {value:10, name:'rose1'},
                                {value:5, name:'rose2'},
                                {value:15, name:'rose3'},
                                {value:25, name:'rose4'},
                                {value:20, name:'rose5'},
                                {value:35, name:'rose6'},
                                {value:30, name:'rose7'},
                                {value:40, name:'rose8'}
                            ]
                        }
                    ]
                };


                var $eAccount = echarts.init($('#echarts-account')[0]);
                $eAccount.setOption(option);
            })();

// ==================================================== 图表 ============================================== //
// 
// ==================================================== 公共方法 ========================================== //

            /**
             * 算出最近30天的日期
             * @return {Array} [返回最近30天的日期数组]
             */
            function Last30Days() {
                var daysNumber = [];
                var currentDate = new Date();
                var currentYear = currentDate.getFullYear();
                var currentMonth = currentDate.getMonth() + 1;
                var currentDay = currentDate.getDate();

                for(var i = 0; i < 30; i++) {
                    currentDay = currentDay - 1;
                    if (currentDay == 0) {
                        currentMonth -= 1;
                        currentDay = _GetLastMaxDay(currentYear, currentMonth);
                    }
                    daysNumber.push(currentMonth + '.' + currentDay);
                }
                return daysNumber.reverse();
            }

            /**
             * 当天数减到1时调用的方法，自动算出上一个月最大天数，如果是1月则换成上一年的12月
             * @param  {Number} cYear  [当前年]
             * @param  {Number} cMonth [当前月]
             * @return {Number} lastMonthMaxDay [上一个月最大天数]
             */
            function _GetLastMaxDay(cYear, cMonth) {
                if (cMonth == 0) {
                    cMonth = 12;
                    cYear -= 1;
                }
                var lastMonthMaxDay = new Date(cYear, cMonth, 0).getDate();
                return lastMonthMaxDay;
            }

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
// ==================================================== 公共方法 ========================================== //
            // 标签页定位
            var isDo = location.search.split('&')[0];
            isDo = isDo.split('=')[0] == '?Do' ? isDo : '?Do=Sold';
            $('.nav a[href="' + isDo + '"]').closest('li').addClass('active');

            <!-- BEGIN 分页脚本 ATTRIB= -->
            common.showPage({当前页}, {总条数}, {每页条数}, 'mini');
            <!-- END 分页脚本 -->
        })();
    </script>
</body>
</html>