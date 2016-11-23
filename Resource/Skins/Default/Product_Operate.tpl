{页面属性}{/页面属性}
<body>
    {页顶导航}{/页顶导航}
    <!-- 正文外围 -->
    <div class="container-fluid">
        <header>
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
                <!-- 数据列表-->
                <div class="row mg-t-5">
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
                    <div id="echarts" class="col-sm-9">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">点选左边Sku查看该Sku概况</h4>
                            </div>
                            <div class="panel-body">
                                <div id="echarts-area" class="row hide">
                                    <!-- 表格 -->
                                    <div class="col-sm-12">
                                        <table id="sku-list" class="table table-bordered table-condensed">
                                            <tbody></tbody>
                                        </table>
                                    </div>
                                    <!-- 近30日售出情况报表 -->
                                    <div class="col-sm-12">
                                        <div id="echarts-last-30-days-sell" class="pull-left" style="width: 100%; height: 250px;">
                                            <p>资料空缺，无法显示。</p>
                                        </div>
                                    </div>
                                    <!-- 近30日每天在线报表 -->
                                    <div class="col-sm-12">
                                        <div id="echarts-last-30-days-online" class="pull-left" style="width: 100%; height: 250px;">
                                            <p>资料空缺，无法显示。</p>
                                        </div>
                                    </div>
                                    <!-- 近30日每天库存报表 -->
                                    <div class="col-sm-12">
                                        <div id="echarts-last-30-stock" class="pull-left" style="width: 100%; height: 500px;">
                                            <p>资料空缺，无法显示。</p>
                                        </div>
                                    </div>
                                    <!-- 产品运营情况两层饼图 -->
                                    <div class="col-sm-6">
                                        <div id="echarts-operate" class="pull-left" style="width: 100%; height: 500px;">
                                            <p>资料空缺，无法显示。</p>
                                        </div>
                                    </div>
                                    <!-- 产品各账号分布情况饼图 -->
                                    <div class="col-sm-6">
                                        <div id="echarts-account" class="pull-left" style="width: 100%; height: 500px;">
                                            <p>资料空缺，无法显示。</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <template id="temp-Statements">
        {{#Statements}}
        <tr>
            <td><strong>Amount</strong></td>
            <td class="text-muted">{{Amount}}</td>
            <td><strong>SoldPlatform</strong></td>
            <td class="text-muted">{{SoldPlatform}}</td>
            <td><strong>BankFee</strong></td>
            <td class="text-muted">{{BankFee}}</td>
        </tr>
        <tr>
            <td><strong>Exchange</strong></td>
            <td class="text-muted">{{Exchange}}</td>
            <td><strong>Purchase</strong></td>
            <td class="text-muted">{{Purchase}}</td>
            <td><strong>Logistics</strong></td>
            <td class="text-muted">{{Logistics}}</td>
        </tr>
        <tr>
            <td><strong>Allocation</strong></td>
            <td class="text-muted">{{Allocation}}</td>
            <td><strong>Profit</strong></td>
            <td class="text-muted">{{Profit}}</td>
            <td><strong>Quantity</strong></td>
            <td class="text-muted">{{Quantity}}</td>
        </tr>
        {{/Statements}}
    </template>

    {页面底部}{/页面底部}
    <script src="/Resource/js/echarts.common.min.js"></script>
    <script src="/Resource/js/mustache.js"></script>
    <script>
        (function() {
            'use strict';

            var $dataList = $('#data-list');
            var last30Day = Last30Days();

            // 图表数据
            var eData;

            // 查看SKU概况
            (function() {
                $('.btn-sku-see').on('click', function() {

                    // 报表
                    common.ajax({
                        title: '加载SKU数据',
                        URL: '/Report/Api/?Do=SkuSaleAnalyze&SkuID=' + $(this).closest('tr').data('id'),
                        type: 'GET',
                        good: function(d) {
                            if (d.Basic.length == 0) {
                                $('#echarts').find('.panel-title').text('该Sku基本资料不全。');
                            } else {
                                $('#echarts').find('.panel-title').text('[' + d.Basic.SkuID + '][' + d.Basic.FullSKU + ']' + d.Basic.FullName);
                            }
                            $('#echarts-area').removeClass('hide');
                            eData = DataProcess(d);
                            Last30DaysSell(eData);
                            Last30DaysOnline(eData);
                            Last30DaysStock(eData);
                            Operate(eData);
                            Account(eData);
                            $('#sku-list').find('tbody').html(Mustache.render($('#temp-Statements').html(), d))
                        }
                    });

                });
            })();

// ==================================================== 图表 ============================================== //

            // 近30日售出情况报表
            function Last30DaysSell(eData) {
                
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
                        data: ['关联订单金额', '售出包裹数量']
                    },
                    xAxis: {
                        type: 'category',
                        data: eData.SSDate
                    },
                    yAxis: [
                        {
                            type: 'value',
                            name: '金额',
                            axisLabel: {
                                formatter: '£{value}'
                            }
                        },
                        {
                            type: 'value',
                            name: '包裹量',
                            axisLabel: {
                                formatter: '{value}'
                            }
                        }
                    ],
                    series: [{
                        name: '关联订单金额',
                        type: 'bar',
                        data: eData.SSAmount
                    }, {
                        name: '售出包裹数量',
                        type: 'line',
                        yAxisIndex: 1,
                        data: eData.SSQuantity
                    }]
                };

                var $eLast30DaysSell = echarts.init($('#echarts-last-30-days-sell')[0]);
                $eLast30DaysSell.setOption(barLineOption);

            }

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
            function Last30DaysOnline(eData) {
                
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
                        data: eData.SLDate
                    },
                    yAxis: [
                        {
                            type: 'value',
                            name: '库存',
                            axisLabel: {
                                formatter: '{value} 件'
                            }
                        },
                        {
                            type: 'value',
                            name: 'Listing',
                            axisLabel: {
                                formatter: '{value}'
                            }
                        }
                    ],
                    series: [
                        {
                            name: '在线库存',
                            type: 'line',
                            yAxisIndex: 1,
                            data: eData.SLStock
                        },
                        {
                            name: 'Listing',
                            type: 'bar',
                            data: eData.SLQuantity
                        }
                    ]
                };

                var $eLast30DaysOnline = echarts.init($('#echarts-last-30-days-online')[0]);
                $eLast30DaysOnline.setOption(barLineOption);
            }

            // 近30日每天库存报表
            function Last30DaysStock(eData) {
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
                        data: ['本地仓', 'UK仓', 'DE仓', 'AU仓', '调拨库存']
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
                            data : eData.SSTDate
                        }
                    ],
                    yAxis : [
                        {
                            type : 'value'
                        }
                    ],
                    series : eData.SStock
                };

                var $eLast30DaysStock = echarts.init($('#echarts-last-30-stock')[0]);
                $eLast30DaysStock.setOption(option);
            }

            // 产品运营情况两层饼图
            function Operate(eData) {

                // 嵌套环形图配置
                var pieNestOption = {
                    tooltip:{
                        trigger:'item',
                        formatter:'{b}: ￥{c} ({d}%)'
                    },
                    legend:{},
                    title: {
                        text: '产品运营情况'
                    },
                    series:[
                        {
                            // name: '资金汇总',
                            type: 'pie',
                            selectedMode: 'single',
                            radius: [0, '35%'],
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
                            data: eData.StatementsInside
                        },
                        {
                            // name: '资金汇总',
                            type: 'pie',
                            radius: ['40%', '63%'],
                            data: eData.StatementsExternal
                        }
                    ]
                };

                var $eOperate = echarts.init($('#echarts-operate')[0]);
                $eOperate.setOption(pieNestOption);
            }

            // 产品在各账号分布情况饼图
            function Account(eData) {
                // 嵌套环形图配置
                var pieNestOption = {
                    tooltip:{
                        trigger:'item',
                        formatter:'{b}: {c} ({d}%)'
                    },
                    legend:{},
                    title: {
                        text: '产品在各账号分布情况'
                    },
                    series:[
                        {
                            type: 'pie',
                            selectedMode: 'single',
                            radius: [0, '33%'],
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
                            data: eData.DQuantitySum
                        },
                        {
                            type: 'pie',
                            radius: ['40%', '60%'],
                            data: eData.DQuantity
                        }
                    ]
                };

                var $eAccount = echarts.init($('#echarts-account')[0]);
                $eAccount.setOption(pieNestOption);
            }

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

            // 把字符串数据转换为数值 dcf = Data Change Float; dci = Data Change Int
            function dcf(data) {
                data = data == '' ? '0' : data;
                return parseFloat(data.replace(',', '')); 
            }
            function dci(data) {
                data = data == '' ? '0' : data;
                return parseInt(data.replace(',', ''));
            }

            /**
             * 处理获取到的数据
             * @param {Object} data 获取到的数据
             */
            function DataProcess(data) {
                var optionData = {
                    "SkuID": 0,
                    "FullSKU": "",
                    "FullName": "",
                    "TeamID": 0,
                    'StatementsInside': [],
                    'StatementsExternal': [],
                    'SSAmount': [],
                    'SSQuantity': [],
                    'SSDate': [],
                    'SLQuantity': [],
                    'SLStock': [],
                    'SLQuantitySold': [],
                    'SLDate': [],
                    'DAccount': [],
                    'DSite': [],
                    'DItem': [],
                    'DItemSum': [],
                    'DQuantity': [],
                    'DQuantitySum': [],
                    'DQuantitySold': [],
                    'DQuantitySoldSum': [],
                    'SSTDate': [],
                    'SStock': [
                        {
                            'name': '本地仓',
                            'type': 'bar',
                            'stack': '库存',
                            'data': []
                        },
                        {
                            'name': 'UK仓',
                            'type': 'bar',
                            'stack': '库存',
                            'data': []
                        },
                        {
                            'name': 'DE仓',
                            'type': 'bar',
                            'stack': '库存',
                            'data': []
                        },
                        {
                            'name': 'AU仓',
                            'type': 'bar',
                            'stack': '库存',
                            'data': []
                        },
                        {
                            'name': '调拨库存',
                            'type': 'bar',
                            'stack': '库存',
                            'data': []
                        }
                    ]
                };

                if (data.Basic.length != 0) {
                    optionData.SkuID = data.Basic.SkuID;
                    optionData.FullSKU = data.Basic.FullSKU;
                    optionData.FullName = data.Basic.FullName;
                    optionData.TeamID = data.Basic.TeamID;
                }
                
                optionData.StatementsInside.push(
                    {
                        'value': (dcf(data.Statements.SoldPlatform) + dcf(data.Statements.BankFee)
                                    + dcf(data.Statements.Exchange)).toFixed(2),
                        'name': '平台',
                        'selected': true
                    },
                    {
                        'value': dcf(data.Statements.Purchase),
                        'name': '采购'
                    },
                    {
                        'value': (dcf(data.Statements.Logistics) + dcf(data.Statements.Allocation)).toFixed(2),
                        'name': '物流'
                    },
                    {
                        'value': dcf(data.Statements.Profit),
                        'name': '毛利'
                    }
                );
                optionData.StatementsExternal.push(
                    {
                        'value': dcf(data.Statements.SoldPlatform),
                        'name': '成交费'
                    },
                    {
                        'value': dcf(data.Statements.BankFee),
                        'name': '手续费'
                    },
                    {
                        'value': dcf(data.Statements.Exchange),
                        'name': '汇损'
                    },
                    {
                        'value': dcf(data.Statements.Purchase),
                        'name': '采购'
                    },
                    {
                        'value': dcf(data.Statements.Logistics),
                        'name': '运输'
                    },
                    {
                        'value': dcf(data.Statements.Allocation),
                        'name': '调拨'
                    },
                    {
                        'value': dcf(data.Statements.Profit),
                        'name': '毛利'
                    }
                );

                if (data.SkuListing.length != 0) {
                    for(var i = 0; i < 30; i++) {
                        optionData.SLQuantity.push(data.SkuListing[i].Quantity);
                        optionData.SLStock.push(data.SkuListing[i].Stock);
                        optionData.SLQuantitySold.push(data.SkuListing[i].QuantitySold);
                        optionData.SLDate.push(data.SkuListing[i].Month + '.' + data.SkuListing[i].Day);
                        
                    }
                }

                if (data.SkuSale.length != 0) {
                    for(var i = 0; i < 30; i++) {
                        optionData.SSAmount.push(dcf(data.SkuSale[i].Amount));
                        optionData.SSQuantity.push(data.SkuSale[i].Quantity);
                        optionData.SSDate.push(data.SkuSale[i].Month + '.' + data.SkuSale[i].Day);
                    }
                }

                if (data.SkuStock.length != 0) {
                    for(var i = 0; i < 30; i++) {
                        optionData.SSTDate.push(data.SkuStock[i].Month + '.' + data.SkuStock[i].Day);
                        optionData.SStock[0].data.push(dci(data.SkuStock[i].Local));
                        optionData.SStock[1].data.push(dci(data.SkuStock[i].UK));
                        optionData.SStock[2].data.push(dci(data.SkuStock[i].DE));
                        optionData.SStock[3].data.push(dci(data.SkuStock[i].AU));
                        optionData.SStock[4].data.push(dci(data.SkuStock[i].Allocation));
                    }
                }
                    
                if (data.Distribution.length) {
                    for(var j = 0; j < data.Distribution.length; j++) {
                        // 账号判断是否存在，如果已经存在，则叠加数量；不存在则插入账号并新增一个数量
                        data.Distribution[j].Account == '' ? data.Distribution[j].Account = 'OTHER' : data.Distribution[j].Account;
                        var _index = optionData.DAccount.indexOf(data.Distribution[j].Account);
                        if(_index != -1) {
                            optionData.DItemSum[_index] += dci(data.Distribution[j].Item);
                            optionData.DQuantitySum[_index].value += dci(data.Distribution[j].Quantity);
                            optionData.DQuantitySoldSum[_index] += dci(data.Distribution[j].QuantitySold);
                        } else {
                            optionData.DAccount.push(data.Distribution[j].Account);
                            optionData.DItemSum.push(dci(data.Distribution[j].Item));
                            optionData.DQuantitySum.push(
                                {
                                    'value': dci(data.Distribution[j].Quantity),
                                    'name': data.Distribution[j].Account,
                                    'selected': j == 0 ? true : false
                                }
                            );
                            optionData.DQuantitySoldSum.push(dci(data.Distribution[j].QuantitySold));
                        }

                        optionData.DSite.push(data.Distribution[j].Site);
                        optionData.DItem.push(data.Distribution[j].Item);
                        optionData.DQuantity.push(
                            {
                                'value': data.Distribution[j].Quantity,
                                'name': data.Distribution[j].Account + '-' + data.Distribution[j].Site
                            }
                        );
                        optionData.DQuantitySold.push(data.Distribution[j].QuantitySold);
                    }
                }
                
                return optionData;
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
            (function() {
                // 标签页定位
                var op = location.search.split('&');
                var isDo = location.search.split('&')[0];
                var $formSearch = $('#form-search');
                isDo = isDo.split('=')[0] == '?Do' ? isDo : '?Do=Sold';
                $('.nav a[href="' + isDo + '"]').closest('li').addClass('active');

                $formSearch.find('input[type="text"]').val(decodeURI((op.KeyWord || '').replace(/\++/g, ' ')));
                $formSearch.find('select').find('option[value="' + decodeURI(op.Selected) + '"]').prop('selected', true);
                $formSearch.find('select option[value="' + (op.TeamID || $formSearch.find('select').data('default')) + '"]').prop('selected', true);
            })();
            

            <!-- BEGIN 分页脚本 ATTRIB= -->
            common.showPage({当前页}, {总条数}, {每页条数}, 'mini');
            <!-- END 分页脚本 -->
        })();
    </script>
</body>
</html>