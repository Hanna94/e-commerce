// 所有订单，待审核订单，待配货订单引用JavaScript
(function () {
    'use strict';

    var $dataList = $('#data-list'),
        $btnChangeStatus = $dataList.find('header .btn-status-alter'),
        $optionChangeStatus = $dataList.find('header .option-status-alter');

    // 批量操作的按钮限制
    $dataList.find('tbody').on('change', 'input[type="checkbox"]', function() {
        $btnChangeStatus.prop('disabled', !!!$dataList.find('tbody input:checked').length);
    });

    // 批量标记
    $optionChangeStatus.on('click', function() {
        var $option = $(this),
            Do = $option.closest('div').find('button').data('name'),
            title = $option.text(),
            val = $option.data('val');

        if (!confirm('确定进行标记为【' + title + '】？')) {return;}

        common.ajax({
            URL: '/OMS/Order.aspx?Do=' + Do,
            type: 'post',
            title: '批量标记为【' + title + '】',
            data: {
                OMSType: val,
                DataID: common.getChecked($dataList.find('tbody'), 'tr', 'data-id')
            },
            good: function (data) {
                common.alert({
                    type: 'success',
                    title: '“批量标记”操作：',
                    msg: (data.Message || '成功！') + '<br>3秒后自动刷新！',
                    cb: function () {
                        location.reload();
                    }
                });
            }
        });

        if(Do === 'Confirmed'){
            setTimeout(function(){
                location.reload();
            }, 3000);
        }
        
    });

    // 货币单位渲染
    $dataList.find('.currency').each(function () {
        var $this = $(this);
        $this.addClass('label-' + common.order.amtCurrency($.trim($this.text())));
    });

    // 订单状态渲染
    $dataList.find('.status').each(function () {
        var $this = $(this);
        $this.html(common.order.setStatus($this.text()));
    });

    // 国家渲染
    $dataList.find('.state').each(function () {
        var $this = $(this);
        $this.addClass('label-' + common.order.setState($.trim($this.text())));
    });

    // 标签页定位
    $dataList.find('.nav a[href="' + location.search.split('&')[0] + '"]').closest('li').addClass('active');
}());
