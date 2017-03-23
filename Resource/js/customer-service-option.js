/**
 * 售后单售后原因专用
 * 需要把需要遍历的select的class设置一个customer-service-cause
 * 并且在页面加载js文件
 * <script src="/Resource/js/customer-service-option.js"></script>
 */
!function(target) {
    var cause = [
            "", "仓库错漏发", "物流商错发", "物流商丢包", "物流商找不到货", 
            "供应商错漏发", "运输损坏", "质量问题", "质检失误", "描述失误", 
            "买家原因", "缺货", "关税问题", "运费", "采购失误", 
            "Size不符", "物流延迟", "其它原因"
        ];
    var template = '';
    $.each(cause, function(index, event) {
        template += '<option value="' + event + '">' + (index == 0 ? '请选择' : event) + '</option>';
    });
    target.html(template);
}($('.customer-service-cause'));

