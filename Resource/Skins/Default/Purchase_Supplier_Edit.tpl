{页面属性}{/页面属性}
<body>
    {页顶导航}{/页顶导航}
    
    <!-- 内容-->
    <div class="maxW800 divCenter">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">供应商的编辑</h3>
            </div>
            <div class="panel-body">
                <form action="javascript:;" class="form-horizontal">
                    <div class="form-group">
                        <label for="SupplierName" class="col-sm-2 control-label">供应商</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="SupplierName" placeholder="请输入名字" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="SupplierContacts" class="col-sm-2 control-label">联系人</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="SupplierContacts" placeholder="请输入联系人" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="SupplierPhone" class="col-sm-2 control-label">电话</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="SupplierPhone" placeholder="请输入电话" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="SupplierLocation" class="col-sm-2 control-label">地址</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="SupplierLocation" placeholder="请输入地址" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="SupplierPaymentInfo" class="col-sm-2 control-label">支付信息</label>
                        <div class="col-sm-10">
                            <input class="SupplierBankName form-control mg-b-5" type="text" placeholder="银行名称(包括支行)">
                            <input class="SupplierAccountName form-control mg-b-5" type="text" placeholder="银行户名(开户人名字)">
                            <input class="SupplierAccountNumber form-control" type="text" placeholder="银行账号">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">备注</label>
                        <div class="col-sm-10">
                            <textarea class="form-control" name="Remark" id="SupplierRemark" rows="10"></textarea>
                        </div>
                    </div>
                </form>
            </div>
            <div class="panel-footer clearfix">
                <button class="btn btn-default pull-right" type="button">提交</button>
            </div>
        </div>
    </div>

    {页面底部}{/页面底部}

    <script>
        (function() {
            'use strict';

            var op = common.URL.parse(),
                $btn = $('.panel-footer'),
                $SupplierName = $('#SupplierName'),
                $SupplierContacts = $('#SupplierContacts'),
                $SupplierPhone = $('#SupplierPhone'),
                $SupplierLocation = $('#SupplierLocation'),
                $SupplierBankName = $('.SupplierBankName'),
                $SupplierAccountName = $('.SupplierAccountName'),
                $SupplierAccountNumber = $('.SupplierAccountNumber'),
                $SupplierRemark = $('#SupplierRemark');

            // 判断为更改或者新建
            if (op.DataID) {
                $.ajax({
                    url: '/Purchase/API/?Do=SupplierQuery&DataID=' + op.DataID,
                    type: 'get',
                    
                    success: function(data){
                        var d = data.DataList[0];
                        $SupplierName.val(d.Name);
                        $SupplierContacts.val(d.Contacts);
                        $SupplierPhone.val(d.Phone);
                        $SupplierLocation.val(d.Location);
                        $SupplierBankName.val(d.BankName);
                        $SupplierAccountName.val(d.AccountName);
                        $SupplierAccountNumber.val(d.AccountNumber);
                        $SupplierRemark.val(d.Remark);
                    }
                });
            }

            // 提交数据
            $btn.on('click', function(){
                // 处理银行账号，去除空格
                var tempSA = $SupplierAccountNumber.val();
                tempSA = tempSA.replace(/\s+/g, '');
                $.ajax({
                    url: '/Purchase/API/?Do=SupplierSave',
                    type: 'post',
                    
                    data: {
                        DataID: op.DataID || null,
                        Name: $SupplierName.val(),
                        Contacts: $SupplierContacts.val(),
                        Phone: $SupplierPhone.val(),
                        Location: $SupplierLocation.val(),
                        BankName: $SupplierBankName.val(),
                        AccountName: $SupplierAccountName.val(),
                        AccountNumber: tempSA,
                        Remark: $SupplierRemark.val()
                    },
                    success: function(data){
                        common.alert({
                            type: 'success',
                            title: '保存供应商',
                            msg: data.Message
                        });
                        setTimeout(function(){
                            window.location.reload();
                        }, 2000);
                    }
                });
            });


        }());
    </script>
</body>
</html>
