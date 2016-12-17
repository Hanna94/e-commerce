{页面属性}{/页面属性}
<body>
    {页顶导航}{/页顶导航}
    
    <!-- 内容-->
    <div id="data-list" class="container-fluid">
        <header>
            <div class="btn-group btn-group-sm pull-right">
                <button data-toggle="modal" data-target="#modal-create" class="btn btn-success btn-modal-create" type="button"><span class="glyphicon glyphicon-plus-sign"></span> 手工建单</button>

                <button data-toggle="modal" data-target="#modal-upload" class="btn btn-success amazon-order" type="button"><span class="glyphicon glyphicon-upload"></span> Amazon订单</button>

                <div class="btn-group btn-group-sm hidden">
                    <button data-name="Confirmed" class="btn btn-default btn-status-alter option-status-alter" type="button" disabled><span class="glyphicon glyphicon-eye-open"></span> <span data-val="已审核">审核</span></button>
                </div>

                <div class="btn-group btn-group-sm hidden">
                    <button data-name="OutStock" data-toggle="dropdown" class="btn btn-warning dropdown-toggle btn-status-alter" type="button" disabled><span class="glyphicon glyphicon-flash"></span> 缺货</button>
                    <ul class="dropdown-menu dropdown-menu-right">
                        <li class="option-status-alter" data-val="正常"><a href="javascript:;">有货</a></li>
                        <li class="option-status-alter" data-val="缺货"><a href="javascript:;"><span class="text-danger">缺货</span></a></li>
                    </ul>
                </div>

                <div class="btn-group btn-group-sm hidden">
                    <button data-name="Cancel" data-toggle="dropdown" class="btn btn-danger dropdown-toggle btn-status-alter" type="button" disabled><span class="glyphicon glyphicon-remove"></span> 取消</button>
                    <ul class="dropdown-menu dropdown-menu-right">
                        <li class="option-status-alter" data-val="正常"><a href="javascript:;">正常发货</a></li>
                        <li class="option-status-alter" data-val="取消发货"><a href="javascript:;"><span class="text-danger">取消发货</span></a></li>
                    </ul>
                </div>
            </div>
        </header>

        <ul class="nav nav-tabs">
            <li><a href="?Do=All">全部</a></li>
            <li><a href="?Do=UnConfirmed">待处理</a></li>
			<li><a href="?Do=Distribution">已配货</a></li>
			<li><a href="?Do=Post">已交运</a></li>
			<li><a href="?Do=UnShip">待发货</a></li>
			<li><a href="?Do=Ship">已派送</a></li>
			<li><a href="?Do=CancelOrder">已取消</a></li>
            <li><a href="?Do=OutOfStock">缺货</a></li>
        </ul>

        <div class="tab-content">
            <div class="tab-pane active">
                <form id="form-filter" class="form-inline mg-t-10 mg-b-10" method="post" action="javascript:;">
                    <input class="do" type="hidden" name="Do" value="unconfirmed">
                    
                    <div class="row"> <!-- 第一行-->
                        <div class="col-sm-12">
                            <div class="input-group">
                                <button id="openTab" class="btn btn-default btn-xs" type="button">批量打开</button>
                            </div>

                            <div class="input-group">
                                <div class="btn-group btn-group-xs" data-toggle="buttons">
                                    <!-- BEGIN 店铺列表 ATTRIB= -->
                                    <label class="btn btn-default btn-shop">
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

                            <div class="form-group">
                                <div id="selectDropdown" class="dropdown">
                                    <label class="btn btn-default" style="height: 30px; width: 50px;" data-toggle="dropdown"></label>
                                    <ul class="dropdown-menu pd-l-5 pd-r-5" style="min-width: 100%;">
                                        <li><span data-val="0" class="btn btn-default uliHW"></span></li>
                                        <li><span data-val="1" class="btn spC33 uliHW"></span></li>
                                        <li><span data-val="2" class="btn spC9C uliHW"></span></li>
                                        <li><span data-val="3" class="btn spF96 uliHW"></span></li>
                                        <li><span data-val="4" class="btn spFF0 uliHW"></span></li>
                                        <li><span data-val="5" class="btn sp3C3 uliHW"></span></li>
                                        <li><span data-val="6" class="btn sp9CF uliHW"></span></li>
                                        <li><span data-val="7" class="btn sp999 uliHW"></span></li>
                                    </ul>
                                </div>
                            </div>

                            <div class="input-group input-group-sm">
                                <input type="text" class="form-control" placeholder="Search..." name="KeyWord">
                                <span class="input-group-btn">
                                    <button class="btn btn-default" type="submit"><span class="glyphicon glyphicon-search"></span> 搜索</button>
                                </span>
                            </div>
                            <div class="input-group input-group-sm">
                                <button id="SearchTwoBTN" class="btn btn-default btn-xs" data-toggle="collapse" data-target="#SearchTwo" type="button"><span class="glyphicon glyphicon-chevron-down"></span></button>
                            </div>
                        </div> 
                    </div> <!-- 第一行-->

                    <div id="SearchTwo" class="row collapse fade pd-t-5"> <!-- 第二行-->
                        <div class="col-sm-12"> 

                            <div class="form-group">
                                <div class="input-group input-group-sm">
                                    <input type="text" class="form-control" placeholder="起始时间 YYYY-MM-DD" name="StartTime"/>
                                </div>
                                <div class="input-group input-group-sm">
                                    ~
                                </div>
                                <div class="input-group input-group-sm">
                                    <input type="text" class="form-control" placeholder="末尾时间 YYYY-MM-DD" name="EndTime"/>
                                </div>
                                <div class="form-group form-group-sm">
                                    <select id="someDays" class="form-control">
                                        <option value="0">全部</option>
                                        <option value="7">最近7天</option>
                                        <option value="15">最近15天</option>
                                        <option value="30">最近30天</option>
                                    </select>
                                </div>
                            </div>

                            <div id="countrySelect" class="form-group">
                                <div class="input-group-sm div-re">
                                    <input class="form-control" name="Country" type="text" placeholder="收货国家" />
                                    <div class="prompt prompt-send hidden">
                                        <ul class="list-group">
                                            <li class="list-group-item poi">United Kingdom</li>
                                            <li class="list-group-item poi">Australia</li>
                                            <li class="list-group-item poi">Germany</li>
                                            <li class="list-group-item poi">United States</li>
                                            <li class="list-group-item poi">Other</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            
                            <div id="common-sreach" class="form-group"></div>
                        </div>
                    </div> <!-- 第二行-->

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
                        <col>
                    </colgroup>
                    <thead>
                        <tr>
                            <th><label id="select-all"><input type="checkbox"> 全选</label></th>
                            <th>图片</th>
                            <th>金额</th>
                            <th>账号</th>
                            <th>买家ID</th>
                            <th>收货人</th>
                            <th>SKU</th>
                            <th>下单时间</th>
                            <th>地址</th>
                            <th>买家备注</th>
                            <th>订单新增时间</th>
                            <th>状态</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- BEGIN 数据列表 ATTRIB= -->
                        <tr data-id="{DataID}" data-tag="{Tag}">
                            <td><label class="checkbox-inline"><input type="checkbox">{DataID}</label>
                                <div class="dropdown signDropdown">
                                    <label class="btn btn-default" style="height: 20px; width: 20px;" data-toggle="dropdown"></label>
                                    <ul class="dropdown-menu pd-l-5 pd-r-5" style="min-width: 100%;">
                                        <li><span data-val="0" class="btn btn-default uliHW"></span></li>
                                        <li><span data-val="1" class="btn spC33 uliHW"></span></li>
                                        <li><span data-val="2" class="btn spC9C uliHW"></span></li>
                                        <li><span data-val="3" class="btn spF96 uliHW"></span></li>
                                        <li><span data-val="4" class="btn spFF0 uliHW"></span></li>
                                        <li><span data-val="5" class="btn sp3C3 uliHW"></span></li>
                                        <li><span data-val="6" class="btn sp9CF uliHW"></span></li>
                                        <li><span data-val="7" class="btn sp999 uliHW"></span></li>
                                    </ul>
                                </div>
                            </td>
                            <td>{Pic}</td>
                            <td>{Amt} <span class="label currency">{Currency}</span></td>
                            <td>{Shop}</td>
                            <td>{Buyer}</td>
                            <td>{Name}</td>
                            <td>{SKU}</td>
                            <td>{CreatedTime}</td>
                            <td title="{Address}"><span class="label state">{Country}</span></td>
                            <td>{BuyerMessage}</td>
                            <td>{Date}</td>
                            <td class="waybill-status"><i class="hidden">{Status}</i></td>
                            <td>
                                <!-- BEGIN 编辑功能 ATTRIB= -->
                                <a title="编辑" href="?Do=Edit&DataID={DataID}" target="_blank"><span class="glyphicon glyphicon-pencil"></span></a>
                                <!-- END 编辑功能 -->

                                <!-- BEGIN 查看功能 ATTRIB= -->
                                <a title="查看" href="?Do=View&DataID={DataID}" target="_blank"><span class="text-success glyphicon glyphicon-eye-open"></span></a>
                                <!-- END 查看功能 -->
                            </td>
                        </tr>
                        <!-- END 数据列表 -->
                    </tbody>
                    <tfoot><tr><td colspan="15"></td></tr></tfoot>
                </table>
            </div>
        </div>
    </div>

    <!-- 上传文件模态框-->
    <div id="modal-upload" class="modal fade" tabIndex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                    <h4 class="modal-title">Amazon订单</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <div class="col-sm-12">
                            <input id="amazon-order" class="form-control-static" type="file" name="StrFile" accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/octet-stream, application/vnd.ms-excel" value="上传">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button id="amazon-order-upload" type="button" class="btn btn-primary">确定</button>
                </div>
            </div>
        </div>
    </div>

    <!-- 手工建单模态框-->
    <div id="modal-create" class="modal fade" tabIndex="-1">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <form  class="form-horizontal" method="post" action="javascript:;">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                        <h4 class="modal-title">手工建单</h4>
                    </div>
                    <div class="modal-body">
                        <input type="hidden" name="DataID" value="0">
                        <div class="form-group form-group-sm">
                            <label class="col-sm-2 control-label">店铺</label>
                            <div class="col-sm-4">
                                <input class="form-control" name="Shop" type="text" tabindex="1">
                            </div>
                            <label class="col-sm-2 control-label">买家</label>
                            <div class="col-sm-4">
                                <input class="form-control" name="Buyer" type="text" tabindex="2">
                            </div>
                        </div>
                        <div class="form-group form-group-sm">
                            <label class="col-sm-2 control-label">留言</label>
                            <div class="col-sm-10">
                                <textarea class="form-control" name="Message" rows="1" tabindex="3"></textarea>
                            </div>
                        </div>

                        <h4>地址信息</h4>
                        <hr>
                        <div class="form-group form-group-sm">
                            <label for="Name" class="col-xs-2 control-label">收件人</label>
                            <div class="col-xs-4">
                                <input type="text" class="form-control Name" name="Name" placeholder="收件人" tabindex="4">
                            </div>
                            <label for="State" class="col-xs-2 control-label">省份/州</label>
                            <div class="col-xs-4">
                                <input type="text" class="form-control State" name="State" placeholder="省份" tabindex="8">
                            </div>
                        </div>

                        <div class="form-group form-group-sm">
                            <label for="Street1" class="col-xs-2 control-label">地址1</label>
                            <div class="col-xs-4">
                                <input type="text" class="form-control Street1" name="Street1" placeholder="地址1" tabindex="5">
                            </div>
                            <label for="ZIP" class="col-xs-2 control-label">邮编</label>
                            <div class="col-xs-4">
                                <input type="text" class="form-control ZIP" name="ZIP" placeholder="邮编" tabindex="9">
                            </div>
                        </div>

                        <div class="form-group form-group-sm">
                            <label for="Street2" class="col-xs-2 control-label">地址2</label>
                            <div class="col-xs-4">
                                <input type="text" class="form-control Street2" name="Street2" placeholder="地址2" tabindex="6">
                            </div>
                            <label for="Country" class="col-xs-2 control-label">国家</label>
                            <div class="col-xs-4">
                                <input type="text" class="form-control Country" name="Country" placeholder="国家" tabindex="10">
                            </div>
                        </div>

                        <div class="form-group form-group-sm">
                            <label for="City" class="col-xs-2 control-label">城市</label>
                            <div class="col-xs-4">
                                <input type="text" class="form-control City" name="City" placeholder="城市" tabindex="7">
                            </div>
                            <label for="Phone" class="col-xs-2 control-label">联系电话</label>
                            <div class="col-xs-4">
                                <input type="text" class="form-control Phone" name="Phone" placeholder="联系电话" tabindex="11">
                            </div>
                        </div>

                        <h4>产品 <button class="btn btn-success btn-xs pull-right btn-add-product" type="button">添加产品</button></h4>
                        <hr>
                        <div class="product maxH400"></div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                        <button type="submit" class="btn btn-primary">确定</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- 手工建单模板-->
    <template id="temp-add-product">
        <div class="form-group form-group-sm">
            <label class="col-xs-2 control-label">SKU</label>
            <div class="col-xs-4">
                <input type="text" class="form-control sku" placeholder="SKU">
            </div>
            <label class="col-xs-2 control-label">数量</label>
            <div class="col-xs-2">
                <input type="text" class="form-control sum" placeholder="数量" value="1">
            </div>
            <div class="col-xs-1">
                <a class="btn btn-link btn-xs btn-remove" type="button" title="删除产品"><span class="glyphicon glyphicon-remove text-danger"></span></a>
            </div>
        </div>
    </template>

    {页面底部}{/页面底部}

    <script src="/Resource/js/order.js"></script>
    <script src="/Resource/js/mustache.js"></script>
    <script src="/Resource/js/ZeroClipboard.min.js"></script>
    
    <script>
        (function() {
            'use strict';

            var $dataList = $('#data-list'),
                $formFilter = $('#form-filter'),
                oParam = common.URL.parse(),
                $openTab = $('#openTab'), //批量打开编辑页面的按钮
                $confBtn = $dataList.find('button[data-name="Confirmed"]'),
                shopID = oParam.ShopID,
                $selDD = $('#selectDropdown'), //选择需要查询的颜色的按钮
                $amazonOrder = $('.amazon-order'), //上传Amazon订单的按钮
                $amazonOrderUpload = $('#amazon-order-upload'); //上传Amazon订单的确定按钮

            $formFilter.find('.do').val(oParam.Do);
            $formFilter.find('input[name="KeyWord"]').val(decodeURI((oParam.KeyWord || '').replace(/\++/g, ' ')));
            $formFilter.find('select option[value="' + (oParam.TeamID || $formFilter.find('select').data('default')) + '"]').prop('selected', true);

            (function(){
                //批量打开标签页
                $openTab.on('click', function(){
                    var hrefArr = [], DID = [], num = 0;
                    // 把选中的URL存进数组
                    $dataList.find('input[type="checkbox"]').each(function(){
                        if($(this).prop('checked')&&$(this).closest('label').attr('id') !== 'select-all'){
                            hrefArr[num] = $(this).closest('tr').find('a[title="编辑"]').attr('href');
                            DID[num] = $(this).closest('tr').attr('data-id');
                            num++;
                        }
                    });

                    // 批量打开标签页
                    num = 0;
                    openTab();
                    function openTab(){
                        if (hrefArr.length <= num) {
                            alert('批量打开编辑页完成，共打开' + num + '个页面。');
                        }else{
                            window.open(hrefArr[num], 'newTab' + num);
                            num++;
                            setTimeout(openTab, 500);
                        }
                    }
                });
            })();

            // 账号查询
            if (shopID) {
                shopID = shopID.split(',');
                for (var i = 0, len = shopID.length; i < len; i++) {
                    $formFilter.find('input[type="checkbox"][value="' + shopID[i] + '"]').closest('.btn').toggleClass('btn-success').button('toggle');
                }
            }

            // 账号按下改变颜色
            $formFilter.find('.btn-shop').on('click', function(){
                $(this).toggleClass('btn-success');
            });

            (function(){
                var colorStyle = ['btn-default', 'spC33', 'spC9C', 'spF96', 'spFF0', 'sp3C3', 'sp9CF', 'sp999'];

                // 列表颜色标签初始化
                $dataList.find('tbody tr').each(function(){
                    var ts = $(this);
                    ts.find('label.btn').attr('class', 'btn ' + colorStyle[ts.data('tag')]);
                });

                // 查询按钮颜色初始化
                if (oParam.Tag) {
                    $selDD.find('label').attr('class', 'btn ' + colorStyle[oParam.Tag]);
                }
                // 颜色查询按钮样式设置和添加掩藏传值标签
                $selDD.find('.uliHW').on('click', function(){
                    var ts = $(this);
                    $selDD.find('label').attr('class', ts.attr('class'));
                    $formFilter.find('input[name="Tag"]').remove().end().append('<input type="hidden" name="Tag" value="' + ts.data('val') + '">');
                });

                // 订单标记颜色绑定事件
                $('.signDropdown .uliHW').on('click', function(){
                    var ts = $(this);
                    $.ajax({
                        url: '/OMS/Order.aspx?Do=SetTag',
                        type: 'post',
                        data: {
                            DataID: ts.closest('tr').data('id'),
                            Tag: ts.data('val')
                        }
                    });
                    ts.closest('.signDropdown').find('label').attr('class', ts.attr('class'));
                });
            })();

            // 第二层搜索栏折叠按钮
            if (oParam.StartTime || oParam.Country) { 
                $('#SearchTwo').collapse('show');
                $('input[name="StartTime"]').val(oParam.StartTime);
                if (oParam.EndTime) { $('input[name="EndTime"]').val(oParam.EndTime); }
            }
            $('#SearchTwoBTN').on('click', function(){
                $(this).find('span').toggleClass('glyphicon-chevron-up').toggleClass('glyphicon-chevron-down');
            });

            // 时间搜索，最近7、15、30天
            (function(){
                var getDate = new Date(), T, Y, M, D,
                    $sd = $('#someDays');

                // 下拉列表初始化
                if (oParam.StartTime && oParam.EndTime) {
                    // 如果为时间段搜索则显示时间段
                    $sd.append('<option value= "-1" selected="selected">时间段</option>');
                } else if (oParam.StartTime){
                    // 如果为最近7、15、30天的搜索则显示下拉内容
                    var opTime = new Date(oParam.StartTime),
                        tempT = new Date(getDate.getFullYear()+'-'+(getDate.getMonth()+1)+'-'+getDate.getDate()),
                        selTime = ((tempT.getTime()) - opTime.getTime())/86400000;
                    // 如果不是固定的最近天数则输出最近天数
                    selTime === (7 || 15 || 30) ? $sd.find('option[value="' + selTime + '"]').prop('selected', true) : selTime === 0 ? selTime : $sd.append('<option value= "-1" selected="selected">最近' + selTime + '天</option>');
                }
                    
                
                    
                $sd.on('change', function(){
                    console.log($(this).val());
                    T = new Date(getDate.getTime() - ($(this).val()*86400000)),
                    Y = T.getFullYear(), M = T.getMonth() + 1, D = T.getDate();
                    $('input[name="StartTime"]').val(Y+'-'+M+'-'+D);
                    $formFilter.submit();
                });
            })();

            //第二层，国家搜索按钮
            (function(){
                var $countrySelect = $('#countrySelect');

                //国家输入框初始化
                if (oParam.Country) {
                    var tmCou = oParam.Country.replace('+', ' ');
                    $countrySelect.find('input').val(tmCou);
                }

                // 点击输入框显示下拉框
                $countrySelect.find('input').on('click', function(){
                    $countrySelect.find('div.prompt').removeClass('hidden');
                });
                // 输入内容移除下拉框，删除内容显示下拉框
                $countrySelect.find('input')[0].oninput = function(){
                    if ($(this).val() !== '' && $(this).val() !== null) {
                        $countrySelect.find('div.prompt').addClass('hidden');
                    }else{
                        $countrySelect.find('div.prompt').removeClass('hidden');
                    }
                }
                // 点击选项填充内容，然后隐藏下拉
                $countrySelect.find('li').on('click', function(){
                    $countrySelect.find('input').val($(this).text());
                    $countrySelect.find('div.prompt').addClass('hidden');
                });

            })();

            $formFilter.on('submit', function() {
                location.search = common.URL.stringify(common.URL.parse('?' + $formFilter.serialize()));
            });

            // 手工建单
            var tempAddProduct = $('#temp-add-product').html(),
                $modalCreate = $('#modal-create'),
                $product = $modalCreate.find('.product'),
                $createForm = $modalCreate.find('form'),
                $btnModalCreate = $('.btn-modal-create'),
                $btnAddProduct = $modalCreate.find('.btn-add-product');

            // 初始化，建单
            $btnModalCreate.on('click', function() {
                $createForm[0].reset();
                $product.html();
                $btnAddProduct.click();
            });

            // 添加产品
            $btnAddProduct.on('click', function() {
                if (!$product.find('.form-group').length) {
                    $product.append(tempAddProduct);
                    return;
                }

                var count = 0;

                $product.find('.form-group').each(function() {
                    var $this = $(this),
                        sku = $this.find('.sku').val(),
                        sum = +$this.find('.sum').val();
                    if (!sku || !sum) {
                        count++;
                    }
                });

                if (!count) {
                    $product.append(tempAddProduct);
                }
            });

            // 删除产品
            $product.on('click', '.btn-remove', function() {
                $(this).closest('.form-group').remove();
            });

            // 设置订单状态
            $dataList.find('.waybill-status').each(function() {
                var $this = $(this);
                $this.html(common.order.setStatus($this.text())); 
            });

            // 提交建单
            $createForm.on('submit', function() {
                var data = {
                    Address: {},
                    Transactions: []
                };

                data.DataID = $createForm.find('input[name="DataID"]').val();
                data.Buyer = $createForm.find('input[name="Buyer"]').val();
                data.Shop = $createForm.find('input[name="Shop"]').val();
                data.Message = $createForm.find('textarea[name="Message"]').val();

                data.Address.Name = $createForm.find('input[name="Name"]').val();
                data.Address.Street1 = $createForm.find('input[name="Street1"]').val();
                data.Address.Street2 = $createForm.find('input[name="Street2"]').val();
                data.Address.City = $createForm.find('input[name="City"]').val();
                data.Address.State = $createForm.find('input[name="State"]').val();
                data.Address.ZIP = $createForm.find('input[name="ZIP"]').val();
                data.Address.Country = $createForm.find('input[name="Country"]').val();
                data.Address.Phone = $createForm.find('input[name="Phone"]').val();

                $product.find('.form-group').each(function() {
                    var $this = $(this),
                        sku = $this.find('.sku').val(),
                        sum = +$this.find('.sum').val();
                    if (sku && sum) {
                        data.Transactions.push({
                            SKU: sku,
                            Quantity: sum
                        });
                    }
                });

                common.ajax({
                    title: '手工建单',
                    URL: '/OMS/Order.aspx?Do=Save',
                    type: 'post',
                    data: JSON.stringify(data),
                    good: function(data) {
                        $modalCreate.modal('hide');

                        common.alert({
                            title: '“手工建单”操作：',
                            type: 'success',
                            msg: data.Message || '成功！',
                            time: 5000,
                            cb: function() {
                                location.reload();
                            }
                        });
                    }
                });
            });

            // Amazon订单
            (function(){
                $amazonOrderUpload.on('click', function(){
                    common.ajaxFE({
                        title: 'Amazon订单',
                        type: 'POST',
                        URL: '/OMS/Api/?Do=UpLoadAmazonOrder',
                        FE: 'amazon-order',
                        data: {ShopID : 20},
                        ok: function(data, status, e){
                            common.alertIf({
                                data: data,
                                title: 'Amazon订单',
                                time: 2000,
                                tcb: function(){
                                    $('#modal-upload').modal('hide');
                                }
                            });
                        }
                    });
                });
            })();

            // 回顶部按钮
            common.topBtn();

            // 搜索方法
            var option = {
                inForm : true,
                isLimit: false,
                mode   : true,
                SkuID  : oParam.SkuID || false
            };
            common.SkuSearch($('#common-sreach'), option);

            // 初始化页面
            oParam.SkuID && (function(){
                $(document).ready(function() {
                    $('#SearchTwo').collapse('show');
                    $('#SearchTwoBTN').find('span').toggleClass('glyphicon-chevron-up').toggleClass('glyphicon-chevron-down');
                });
                
            })();

            // 限制审核按钮只在[待处理订单]分页显示
            oParam.Do !== 'UnConfirmed' ? $confBtn.closest('div').addClass('hidden') : $confBtn.closest('div').removeClass('hidden');
            oParam.Do !== 'UnConfirmed' ? $amazonOrder.addClass('hidden') : $amazonOrder.removeClass('hidden');

            <!-- BEGIN 分页脚本 ATTRIB= -->
            common.showPage({当前页}, {总条数}, {每页条数});
            <!-- END 分页脚本 -->
        }());
    </script>
</body>
</html>
