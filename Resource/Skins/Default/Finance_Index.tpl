{页面属性}{/页面属性}
<body>
    {页顶导航}{/页顶导航}
    <!-- 内容-->
    <div id="data-list" class="container-fluid">
        <header>
            <div class="btn-group btn-group-sm pull-right">
                <button  class="btn btn-info btn-sm hide" type="button" disabled="disabled"><span class="glyphicon glyphicon-screenshot"></span> 审核</button>
                <button  class="btn btn-danger btn-sm hide" type="button" disabled="disabled"><span class="glyphicon glyphicon-remove"></span> 取消</button>
                <button  class="btn btn-success btn-sm" type="button"><span class="glyphicon glyphicon-plus-sign"></span> 新建付款单</button>
            </div>
        </header>
        <ul class="nav nav-tabs">
            <li><a href="?Do=All">全部</a></li>
            <li><a href="?Do=UnConfirmed">待审核</a></li>
            <li><a href="?Do=UnPaid">待支付</a></li>
            <li><a href="?Do=Complete">已完成</a></li>
            <li><a href="?Do=Cancel">已取消</a></li>
        </ul>
        <div class="tab-content">
            <form id="form-search" class="form-inline mg-t-10 mg-b-10" action="?">
                <div class="input-group input-group-sm">
                    <input type="text" class="form-control" placeholder="Search..." name="time">
                </div>
                <div class="input-group input-group-sm">
                    <input type="text" class="form-control" placeholder="Search..." name="KeyWord">
                    <span class="input-group-btn">
                        <button class="btn btn-default" type="submit"><span class="glyphicon glyphicon-search"></span> 搜索</button>
                    </span>
                </div>
            </form>
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
                        <!-- BEGIN 数据列表 ATTRIB= -->
                        <tr data-id="{DataID}">
                            <td><label class="checkbox-inline"><input type="checkbox">{DataID}</label></td>
                            <td class="orderID">{OrderID}</td>
                            <td>{ApplyName}</td>
                            <td>{Title}</td>
                            <td>{Type}</td>
                            <td>{Amount}</td>
                            <td>{Status}</td>
                            <td>{Date}</td>
                            <td>
                                <a href="/Finance/?Do=Edit&OrderID={OrderID}&DataID={DataID}" target="_blank"><span class="glyphicon glyphicon-eye-open poi"></span></a>
                                <span data-oid="{OrderID}" class="text-danger glyphicon glyphicon-fire poi"></span>
                            </td>
                        </tr>
                        <!-- END 数据列表 -->
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

            var op = common.URL.parse(),
                $dataList = $('#data-list'),
                $AuditBtn = $('.glyphicon-screenshot').closest('button'), //审核按钮
                $CancelBtn = $('.glyphicon-remove').closest('button'); //取消按钮

            //按钮判断
            if (op.Do === 'UnConfirmed') {
                $AuditBtn.removeClass('hide');
                $CancelBtn.removeClass('hide');
            } else if (op.Do === 'UnPaid') {
                $AuditBtn.addClass('hide');
                $CancelBtn.removeClass('hide');
            } else {
                $AuditBtn.addClass('hide');
                $CancelBtn.addClass('hide');
            }

            // 如果不是待支付标签页，则删除检查按钮
            if (op.Do != 'UnPaid') {
                $dataList.find('tbody .glyphicon-fire').remove();
            }
            // 点击检查按钮
            $dataList.find('.glyphicon-fire').on('click', function() {
                $.ajax({
                    url: '/Finance/API/?Do=PaymentCheck&OrderID=' + $(this).closest('tr')
                        .find('.orderID').text(),
                    type: 'post',
                    
                    success: function(data) {
                        common.alert({
                            type: 'success',
                            title: '检查支付',
                            msg: '完成，后台反馈：' + data.Message,
                            cb: function(){
                                location.reload();
                            }
                        });
                    }
                });
            });

            // 状态渲染
            (function(){
                // 单号时间高亮
                $dataList.find('.orderID').each(function() {
                    var $this = $(this),
                        before = $this.text();
                    $this.html(before.replace(/(\d{8}|\d{6})/ig, '<span class="label label-success">$1</span>'));
                }); 

                //状态
                var style = ['label-default', 'a1me', 'a1md', 'm2c', '2gve', 'xytg', 'xyts'], //样式
                    applyPay = ['待审核', '待支付', '完成', '取消']; //Finance

                $dataList.find('tr').each(function(){
                    var ts = $(this);
                    renderer(ts, applyPay, 6);

                });

                // 状态渲染
                function renderer(tar, arr, num){
                    var val = $.trim(tar.find('td:eq(' + num + ')').text()),
                        flag = $.inArray(val, arr),
                        flag = flag > 0 ? flag : 0;
                    tar.find('td:eq(' + num + ')').html('<span class="label ' + style[flag] + '" >' + val + '</span>');
                }

            })();

            (function(){
                var DID;
                //审核和取消按钮，没在有记录选中的情况下不可点击, 并且只有1条记录的时候可以点击
                $dataList.find('input[type="checkbox"]').on('change', function(){
                    var ts = $(this),
                        num = 0;
                        
                    $dataList.find('input[type="checkbox"]').each(function(){
                        $(this).prop('checked') === true ? num++ : num
                    });
                    if (num === 1) {
                        $AuditBtn.removeAttr('disabled');
                        $CancelBtn.removeAttr('disabled');
                        DID = ts.closest('tr').data('id');
                    } else {
                        $AuditBtn.attr('disabled', 'disabled');
                        $CancelBtn.attr('disabled', 'disabled');
                    }
                });

                $AuditBtn.on('click', function(){
                    if (confirm('是否确定审核？')) {
                        conBtn(DID, 'Confirmed', '审核操作：');
                    } 
                });

                $CancelBtn.on('click', function(){
                    if (confirm('是否确定取消？')) {
                        conBtn(DID, 'Cancel', '取消操作：');
                    } 
                });

                //审核和取消按钮ajax封装
                function conBtn(did, urlType, tit){
                    $.ajax({
                        url:'/Finance/API/?Do=' + urlType,
                        type: 'post',
                        data: { DataID: did},
                        success: function(data){
                            common.alert({
                                type: 'success',
                                title: tit,
                                msg: data.Message || '成功！',
                                cb: function(){
                                    location.reload();
                                }
                            });
                        }
                    });
                }
            })();

            


            // 标签页定位
            $dataList.find('.nav a[href="' + location.search.split('&')[0] + '"]').closest('li').addClass('active');

            <!-- BEGIN 分页脚本 ATTRIB= -->
            common.showPage({当前页}, {总条数}, {每页条数});
            <!-- END 分页脚本 -->
        }());
    </script>
</body>
</html>
