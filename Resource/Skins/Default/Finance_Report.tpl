{页面属性}{/页面属性}
<body>
    {页顶导航}{/页顶导航}
    <!-- 内容-->
    <div id="data-list" class="container-fluid">
        <ul class="nav nav-tabs">
            <li><a href="?Do=UnExecute">全部</a></li>
            <li><a href="?Do=UnStock">已支付汇总</a></li>
            <li><a href="?Do=Complete">待支付汇总</a></li>
        </ul>
        <div class="tab-content">
            <div class="row">
                <form id="form-search" class="form-inline mg-t-10 mg-b-10" action="?">
                    <div class="col-sm-4">
                        <!-- 供应商查询 -->
                        <div class="form-group form-group-sm">
                            <div class="row">
                                <div class="col-sm-6">
                                    <input class="form-control" type="text" data-sid="" id="SupplierName" readonly="readonly" />
                                </div>
                                <div class="col-sm-6">
                                    <div class="input-group input-group-sm">
                                        <input type="text" class="form-control" id="Supplier-input" placeholder="供应商ID、名称">
                                        <span class="input-group-btn">
                                            <button type="button" class="btn btn-default Supplier-select"><span class="glyphicon glyphicon-search"></span> 搜索</button>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 供应商列表 -->
                        <div class="Supplier-group search-drop maxH300"></div>
                    </div>
                    <div class="col-sm-8 input-group-sm">
                        <input type="text" class="form-control" placeholder="起始时间" name="beforeTime"> ~
                        <input type="text" class="form-control" placeholder="结束时间" name="afterTime">
                        <button type="button" class="btn btn-default btn-sm">搜索</button>
                    </div>
                </form>
            </div>
            <div class="col-sm-12">
                <hr class="mg-t-10 mg-b-10">
            </div>
            <div class="row">
                <div class="col-sm-12 mg-t-10 mg-b-10">
                    <span class="mg-r-20">总金额：15454.55</span>
                    <span class="mg-r-20">已支付：45423.456</span>
                    <span>待支付：4524212</span>
                </div>
                <div class="maxH800 col-sm-12 mg-t-5">
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
                        </colgroup>
                        <thead>
                            <th>编号</th>
                            <th>单号</th>
                            <th>发起人</th>
                            <th>请款说明</th>
                            <th>付款类型</th>
                            <th>总金额</th>
                            <th>状态</th>
                            <th>时间</th>
                            <th>操作</th>
                        </thead>
                        <tbody>
                            <tr>
                                <td>4564561215</td>
                                <td>SDFG415415D</td>
                                <td>杨海平</td>
                                <td>关于[金星CCCC]的付款申请</td>
                                <td>采购/办公/报销</td>
                                <td>45645.545</td>
                                <td>待审核/待支付/完成/取消</td>
                                <td>2016/5/7 20：:41</td>
                                <td><span class="glyphicon glyphicon-eye-open poi"></span></td>
                            </tr>
                        </tbody>
                        <tfoot><tr><td colspan="9"></td></tr></tfoot>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!-- 供应商列表模板 -->
    <template id="temp-supplier">
        {{#DataList}}
        <a data-id="{{DataID}}" class="list-group-item pd-5">{{Name}}</a>
        {{/DataList}}
    </template>

    {页面底部}{/页面底部}

    <script src="/Resource/js/mustache.js"></script>
    
    <script>
        (function(){
            'use strict';

            var $dataList = $('#data-list'),
                $supName = $('#SupplierName'), //供应商存数据的只读文本款
                $supInput = $('#Supplier-input'), //供应商搜索栏输入框
                $supBtn = $('.Supplier-select'), //供应商搜索按钮
                $supList = $('.Supplier-group'), //供应商列表
                tmSupplier = $('#temp-supplier').html(); //供应商列表模板

            // 供应商搜索
            (function(){
                // 获取供应商数据方法
                function getSup(di, kw){
                    di ? di = di : di = '';
                    kw ? kw = kw : kw = '';
                    $.ajax({
                        url: '/Purchase/API/?Do=SupplierQuery&DataID=' + di + '&KeyWord=' + kw,
                        type: 'get',
                        
                        success: function(data){
                            if (data.DataList.length === 0) {
                                $supList.html('<p>无搜索结果！</p>');
                            }else{
                                $supList.html(Mustache.render(tmSupplier, data));
                            }
                        }
                    });
                }

                // 搜索供应商
                $supBtn.on('click', function(){
                    getSup('', $supInput.val());
                });

                // 点击选择供应商
                $supList.on('click', 'a', function(){
                    var ts = $(this);
                    $supName.attr('data-sid', ts.data('id')).val(ts.text());
                    // 点选完供应商清空列表和输入框
                    $supList.empty();
                    $supInput.val('');
                });
            })();

            // 标签页定位
            $dataList.find('.nav a[href="' + location.search.split('&')[0] + '"]').closest('li').addClass('active');

        }());
    </script>
</body>
</html>
