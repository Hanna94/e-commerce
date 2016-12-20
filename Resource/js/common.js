var common = {};
/**
 * 模拟弹出提示框
 * @author Super
 * @method alert
 * @param {json} option
    type: 信息类型
    title: 加粗重点内容或标题
    msg: 信息内容
    time: 延迟关闭时间 || 3000
    cb: 回调方法
 * @date 2016-01-19 14:03
 * @return {void}
 */
common.alert = function(option) {
    var $alertBox = $('#alert'),
        timeout;

    // 是否存在
    if ($alertBox.length) {
        $alertBox.remove();
    }

    // 渲染
    var sAlert = '<div class="container in fade alert alert-' +
        (option.type || 'danger') +
        ' alert-dismissible" id="alert">' +
        '<button type="button" class="close" data-dismiss="alert" ' +
        '><span>&times;</span></button>' +
        '<strong>' + (option.title ? option.title : '') + '</strong>' + option.msg + '</div>';
    $('body').append(sAlert);
    $alertBox = $('#alert');
    $alertBox.show().on('closed.bs.alert', function() {
        if (option.cb) {
            option.cb();
        }
    });

    // 延时处理
    timeout = setTimeout(function() {
        $alertBox.alert('close');
        clearTimeout(timeout);
    }, option.time || 3000);
};
/**
 * 提示信息组合
 * author  Harry.H
 * @param  {json}     data 
 * @param  {string}   title
 * @param  {number}   time  
 * @param  {Function} tcb   成功时执行的方法
 * @param  {Function} fcb   失败时执行的方法
 * date    2016-09-07
 */
common.alertIf = function(option){
    if (option.data.Ack) {
        common.alert({
            type: 'success',
            title: option.title,
            msg: '成功，系统反馈：' + option.data.Message,
            time: option.time || null,
            cb: option.tcb
        });
    } else {
        common.alert({
            title: option.title,
            msg: '失败，系统反馈：' + option.data.Message,
            cb: option.fcb
        });
    }
}

/**
 * 提示信息模态框
 * @author Super
 * @method alert
 * @param {jquery object} modal 提示框
 * @param {string} title 标题，或重点提示词汇
 * @param {string} msg 主要内容
 * @date 2016-01-19 15:50
 * @return {void}
 */
common.show = function($modal, title, msg) {
    $modal.find('.modal-title').html(title).end().find('.modal-body')
        .html('<span class="text-info">' + msg + '</span>').end().modal('show');
};

/**
 * 获取所有Cookie，返回json对象
 * @author super
 * @method getJson
 * @date 2015-07-12 13:43
 * @retrun {json}
 */
common.cookie = {};
common.cookie.getJson = function() {
    var json = {},
        sCook = document.cookie,
        aCook = sCook.split('; '),
        i = 0,
        len = aCook.length;
    for (; i < len; i++) {
        var aRule = aCook[i].split('=');
        json[aRule[0]] = aRule[1];
    }
    return json;
};

/**
 * 获取Cookie某个key的值
 * @author super
 * @date 2015-07-12 13:46
 * @method getCookie
 * @param {string} key
 * @retrun {string}
 */
common.cookie.getCookie = function(key) {
    return this.getJson()[key];
};

/**
 * 设置Cookie
 * @author super
 * @date 2015-07-12 13:48
 * @method setCookie
 * @param {string} key
 * @param {string} value
 * @param {number} expires
 * @retrun {void}
 */
common.cookie.setCookie = function(key, value, expires) {
    if (!expires) {
        expires = 1;
    }
    var date = new Date();
    date.setDate(date.getDate() + expires);
    document.cookie = key + '=' + value + '; expires=' + date;
};

/**
 * 删除Cookie
 * @author super
 * @date 2015-07-12 13:55
 * @method removeCookie
 * @param {string} key
 * @param {string} value
 * @param {number} expires
 * @retrun {void}
 */
common.cookie.removeCookie = function(key) {
    this.setCookie(key, 0, -1);
};

/**
 * 设置分页
 * @author Super
 * @method setPaging
 * @param {jquery object} $content 容器
 * @param {number} page 当前页数
 * @param {number} count 数据总条数
 * @param {number} size 每页显示几条
 * @param {function} callback 选择页码时触发的方法
 * @date 2015-08-13 17:03
 * @return {void}
 */
common.setPaging = function($content, page, count, size, callback) {
    count = +count;
    size = +size;
    page = +page;
    var iCountPage = Math.ceil(count / size),

        sCount = '<label class="mg-b-0 mg-l-10 mg-r-10">总共：<strong>' + count + '</strong> 条数据</label>',

        sPrev = '<li title="首页" data-page="1"><a href="javascript:;"><span>&laquo;&laquo;</span></a></li>' +
            '<li title="上一页" data-page="' + (page - 1) + '"><a href="javascript:;"><span>&laquo;</span></a></li>',

        sNext = '<li title="下一页" data-page="' + (page + 1) + '"><a href="javascript:;"><span>&raquo;</span></a></li>' +
            '<li title="尾页" data-page="' + iCountPage + '"><a href="javascript:;"><span>&raquo;&raquo;</span></a></li>',

        sSize = '<label class="mg-b-0 mg-l-10 mg-r-10">每页显示&nbsp;<div class="btn-group dropup"><button type="button" ' +
            'class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown">' + size +
            '&nbsp;<span class="caret"></span></button><ul class="dropdown-menu">' +
            '<li data-size="20"><a href="javascript:;">20</a></li><li data-size="30"><a href="javascript:;">30</a></li>' +
            '<li data-size="50"><a href="javascript:;">50</a></li><li data-size="100"><a href="javascript:;">100</a></li></ul>' +
            '</div>&nbsp;条数据</label>',

        goTo = '<span class="input-group input-group-sm">' +
            '<input class="form-control" type="text">' +
            '<span class="input-group-btn">' +
                '<button class="btn btn-default" type="button"><span class="glyphicon glyphicon-share-alt"></span></button>' +
            '</span>',

        sPage = '', i; // 页数指针

    // 页数
    if (page - 5 < 0) {
        for (i = 1; i <= (iCountPage >= 10 ? 10 : iCountPage); i++) {
            sPage += '<li data-page="' + i + '"><a href="javascript:;">' + i + '</a></li>';
        }
    } else if (iCountPage - 5 < page) {
        for (i = (iCountPage - 9 >= 1 ? iCountPage - 9 : 1); i <= iCountPage; i++) {
            sPage += '<li data-page="' + i + '"><a href="javascript:;">' + i + '</a></li>';
        }
    } else {
        for (i = page - 4; i <= page + 5; i++) {
            sPage += '<li data-page="' + i + '"><a href="javascript:;">' + i + '</a></li>';
        }
    }

    // 渲染
    $content.html('<div class="pull-right">' + sSize + '<ul class="pagination pagination-sm valign-m mg-0">' 
        + sPrev + sPage + sNext + '</ul>' + sCount + '</div>');

    var $pagination = $content.find('.pagination'),
        $dropdownMenu = $content.find('.dropdown-menu');

    // 上下页
    if (page <= 1) {
        $pagination.find('li:lt(2)').addClass('disabled');
    }
    if (page >= iCountPage) {
        $pagination.find('li:eq(-1), li:eq(-2)').addClass('disabled');
    }

    // ---- 以下为Ajax局部刷新使用的事件----
    // 点击页码
    $pagination.on('click', 'li', function() {
        var $this = $(this);
        if (!$this.hasClass('disabled') && !$this.hasClass('active')) {
            callback($this.data('page'), size);
        }
    }).find('li[data-page="' + page + '"]').addClass('active');

    // 点击页数
    $dropdownMenu.on('click', 'li', function() {
        var $this = $(this),
            size = $this.data('size');
        if (!$this.hasClass('active')) {
            common.cookie.setCookie('page-size', size);
            callback(1, size);
        }
    }).find('li[data-size="' + size + '"]').addClass('active');
};

/*
 * 微型分页条
 */
common.miniPaging = function($content, page, count, size, callback) {
    count = +count;
    page = +page;
    size = +size;
    var iCountPage = Math.ceil(count / size),

        sCount = '<label class="mg-b-0 mg-l-10 mg-r-10">总共：<strong>' + count + '</strong> 条数据</label>',

        sPrev = '<li title="首页" data-page="1"><a href="javascript:;"><span>&laquo;&laquo;</span></a></li>' +
            '<li title="上一页" data-page="' + (page - 1) + '"><a href="javascript:;"><span>&laquo;</span></a></li>',

        sNext = '<li title="下一页" data-page="' + (page + 1) + '"><a href="javascript:;"><span>&raquo;</span></a></li>' +
            '<li title="尾页" data-page="' + iCountPage + '"><a href="javascript:;"><span>&raquo;&raquo;</span></a></li>';

    // 渲染
    $content.html('<ul class="pagination pagination-sm valign-m mg-0">' 
        + sPrev + sNext + '</ul>' + sCount);

    var $pagination = $content.find('.pagination');

    // 上下页
    if (page <= 1) {
        $pagination.find('li:lt(2)').addClass('disabled');
    }
    if (page >= iCountPage) {
        $pagination.find('li:eq(-1), li:eq(-2)').addClass('disabled');
    }

    // ---- 以下为Ajax局部刷新使用的事件----
    // 点击页码
    $pagination.on('click', 'li', function() {
        var $this = $(this);
        if (!$this.hasClass('disabled') && !$this.hasClass('active')) {
            callback($this.data('page'), size);
        }
    });
};

/**
 * URL-GET参数
 */
common.URL = {};
/*
 * 将GIT参数转换成JSON对象
 */
common.URL.parse = function (url) {
    var json = {},
        search = url && url.substr(1) || location.search.substr(1),
        arr = search.split('&'),
        i = 0,
        len = arr.length,
        key,
        val;
    for (; i < len; i++) {
        key = arr[i].split('=')[0];
        val = arr[i].split('=')[1];
        if (!key || !val) {continue;}

        // 判断是否存在
        json[key] = json[key] ? json[key] + ',' + val : val;

    }
    return json;
};

/*
 * 将JSON对象转换成GIT参数
 */
common.URL.stringify = function (json) {
    var search = '';
    for (var key in json) {
        search += '&' + key + '=' + json[key];
    }
    return '?' + search.substr(1);
};

/* 
 * 加载图片
 */
common.loading = {};
common.loading.self = $('#loading');
common.loading.show = function () {
    this.self.fadeIn();
};
common.loading.hide = function () {
    this.self.fadeOut();
};
common.loading.self.on('click', function () {
    $(this).fadeOut();
});

/**
 * 设置分页
 */
common.showPage = function (active, count, size, type) {
    var oParam = common.URL.parse(),
        $dataList = $('#data-list');

    if (type == 'mini') {
        common.miniPaging($dataList.find('tfoot td'), active || 1, count, size, function(page, size) {
            oParam.Page = page;
            oParam.QueryLimitNumber = size;
            location.search = common.URL.stringify(oParam);
        });
    } else {
        common.setPaging($dataList.find('tfoot td'), active || 1, count, size, function(page, size) {
            oParam.Page = page;
            oParam.QueryLimitNumber = size;
            location.search = common.URL.stringify(oParam);
        });
    }
    
};

/*
 * 时间格式化
 */
common.date = {};
common.date.format = function (tag, now) {
    var d = now || new Date(),
        year = d.getFullYear(),
        month = common.date.addZero(d.getMonth() + 1),
        day = common.date.addZero(d.getDate()),
        hours = common.date.addZero(d.getHours()),
        minutes = common.date.addZero(d.getMinutes()),
        second = common.date.addZero(d.getSeconds()),
        date = year + '-' + month + '-' + day,
        time = hours + ':' + minutes + ':' + second,
        full = date + ' ' + time;

    switch (tag) {
        case 0:
            return +d;
        break;

        case 1:
            return date;
        break;
        
        case 2:
            return time;
        break;

        default:
            return full;
        break;
    }
};
common.date.addZero = function (text) {
    return ('0' + text).substr(-2);
}

/*
 * 时间选择插件
 */
// 需要在页面加载
// <script src="/Resource/js/bootstrap-datetimepicker.js"></script>
common.date.activePlug = function($dateGroup) {
    $dateGroup.find('input').each(function() {
        var $this = $(this);
        $this.datetimepicker({
            format: $this.data('format'),
            minView: $this.data('min-view'),
            autoclose: true
        });
    });

    // 堤防页面不止一个时间段控件
    $dateGroup.each(function () {
        var $this = $(this),
            $startTime = $this.find('.start-time'),
            $endTime = $this.find('.end-time'); 

        $startTime.on('change', function() {
            $endTime.datetimepicker('setStartDate', $startTime.val());
        });

        $endTime.on('change', function() {
            $startTime.datetimepicker('setEndDate', $endTime.val());
        });
    });
};

/*
 * 订单相关处理方法
 */
common.order = {};
common.order.style = ['primary', 'success', 'info', 'warning', 'danger'];

common.order.ADC = function(active, array) {
    return (this.style[$.inArray(active, array)] || 'default');
}

/*
 * 货币单位装换
 */
common.order.amtCurrency = function (active) {
    return this.ADC(active, ['GBP', 'USD', 'EUR', 'AUD', 'CAD']);
}

/*
 * 国家装换
 */ 
common.order.setState = function (active) {
    return this.ADC(active, ['GB', 'DE', 'US', 'AU', 'IE']);
}

/*
 * 产品状态装换
 */
common.order.proStatus = function (active) {
    return this.ADC(active, ['全部', '销售', '0', '清仓', '下架']);
}

/*
 * 仓库代码装换
 */
common.order.warehouseCode = function (active) {
    return this.ADC(active, ['XYTG', 'A1MD', 'A1ME', '2GVE', 'GZYE']);
}

// 订单状态转换
common.order.setStatus = function(status) {
    var state = $.isArray(status) ? status : status.split(','),
        result = '',
        style = ['default', 'info', 'lightseagreen', 'cadetblue'];

    // 是否发货
    if ('已' === state[3][0]) {
        result = ' <span class="label label-success">' + state[3] + '</span>';
    } else {
        for (var i = 0; i < 4; i++) {
            if (!result && '待' === state[i][0]) {
                result = ' <span class="label label-' + style[i] + '">' + state[i] + '</span>';
            }
        }
    }

    // 阻止与缺货
    if ('正常' !== state[5] && '正常' !== state[6]) {
        result = ' <span class="label label-warning">' + state[5] + '</span>' + result;
    } else if ('正常' !== state[5]) {
        result = ' <span class="label label-warning">' + state[5] + '</span>' + result;
    } else if ('正常' !== state[6]) {
        result = ' <span class="label label-warning">' + state[6] + '</span>' + result;
    }

    // 是否取消发货
    if ('正常' !== state[4]) {
        result = ' <span class="label label-danger">' + state[i] + '</span>' + result;
    }

    return result.substr(1);
};

// 运单状态转换
common.order.setWaybillStatus = function(st) {
    var style = ['default', 'default',  'info', 'lightseagreen', 'cadetblue', 'success', 'warning', 'warning', 'danger'],
        txt = ['初始', '截单', '已配货', '已交运', '已出库', '已妥投', '已取消', '异常', '退件'],
        status = ['', 'CutOff', 'Stock', 'Post', 'OutStock', 'Delivered', 'Cancel', 'Return', 'Exception'],
        flag = $.inArray($.trim(st), status),
        flag = flag > 0 ? flag : 0;

    return '<span class="label label-' + style[flag] + '">' + txt[flag] + '</span>';
};

//运单仓库颜色
common.order.setWarehouse = function(war){
    var style = ['label-default', 'a1me', 'a1md', 'm2c', '2gve', 'xytg', 'xyts'],
        warehouse = ['', 'A1ME', 'A1MD', 'M2C', '2GVE', 'XYTG', 'XYTS'],
        flag = $.inArray($.trim(war), warehouse),
        flag = flag > 0 ? flag : 0;
    return '<span class="label ' + style[flag] + '" >' + war + '</span>';
};

// 随机返回一个背景颜色
common.order.getRandomStyle = function() {
    return 'label label-' + ['default', 'info', 'lightseagreen', 'cadetblue', 'success', 'warning', 'danger'][Math.floor(Math.random()  * 7)];
};

/**
 * 搜索
 */
common.formSearch = function () {
    var $formSearch = $('#form-search'),
        oParam = common.URL.parse();
        
    $formSearch.find('input[type="text"]').val(decodeURI((oParam.KeyWord || '').replace(/\++/g, ' ')));
    
    $formSearch.find('select').on('change', function () {
        $formSearch.submit();
    }).find('option[value="' + decodeURI(oParam.Selected) + '"]').prop('selected', true);
}

/**
 * 组装AJAX
 *
 * [JSON] item
 * [String] title: 操作名称
 * [String] URL: 请求路径
 * [JSON] data: 请求携带的参数
 * [String] type: 请求类型，默认get
 * [boolean] notload: 是否显示加载图，默认true
 * [Function] good: 成功并且状态为true执行的方法
 * [Function] bad: 成功并且状态为false执行的方法
 * [Function] error: 失败执行的方法
 */
common.ajax = function (item) {
    if (!item.notload) {
        common.loading.show();
    }

    $.ajax({
        url: item.URL,
        data: item.data || {},
        type: item.type || 'get',
        success: function(data) {
            data = JSON.parse(data);

            // console.info(data);
            common.loading.hide();
            
            if (data.Ack) {
                item.good && item.good(data);
            } else {
                item.bad && item.bad(data);
                common.alert({
                    title: '“' + item.title + '”操作：',
                    msg: data.Message || '失败！'
                });
            }
        },
        error: function() {
            common.loading.hide();
            item.error && item.error();
            common.alert({
                title: '“' + item.title + '”操作：',
                msg: '数据或后台出错，请稍后再试！'
            });
        }
    });
};

/*
 * 文件上传用AJAX
 * @author Harry
 * @date 2016-05-03 15:23
 * [String] title：操作名称
 * [String] URL：请求路径
 * [JSON] data：请求携带的参数
 * [String] type：请求类型，默认为get
 * [String] dataType：返回数据格式，默认为json
 * [boolean] notload：是否显示加载图，默认为false
 * [String] FE：fileElementId，要上传的文件域的ID
 * [Function] ok：成功并且状态为true执行的方法
 * [Function] no：成功并且状态为false执行的方法
 * [Function] er：失败执行的方法
 */
common.ajaxFE = function(fe){
    //开始执行时显示加载图
    if (!fe.notload) {
        common.loading.show();
    }
    $.ajaxFileUpload({
        url: fe.URL,
        title: fe.title,
        data: fe.data || {},
        type: fe.type || 'get',
        dataType: fe.dataType || 'json',
        fileElementId: fe.FE,
        success: function(data, status, e){
            //执行完成后隐藏加载图
            common.loading.hide();

            if(data.Ack){
                fe.ok && fe.ok(data);
            }else{
                fe.no && fe.no(data);
                common.alert({
                    title: '“' + fe.title + '”操作：',
                    msg: data.Message || '失败！提示：' + e
                });
                console.log(data);
            }
        },
        error: function(data, status, e){
            console.log(e);
            common.loading.hide();
            fe.er && fe.er();
            common.alert({
                title: '“' + fe.title + '”操作：',
                msg: '数据或后台出错，请稍后再试！提示：' + e
            });
        }
    });
}

/**
 * 获取选择的复选框
 */
common.getChecked = function($box, parent, attr) {
    var $ele = $box.find('input[type="checkbox"]:checked'),
        result = '';
        
    if (parent) {
        $ele = $ele.closest(parent);
    }

    $ele.each(function() {
        result += ',' + $(this).attr(attr);
    });

    return result.substr(1);
};

/*
 * 设置尺寸模型
 * 暂时支持单个，需要支持多模型，那么得改
 */
common.setSizeModel = function($sizeGroup) {
    var $sizeInputs = $sizeGroup.find('.size-input'),
        $wholeInput = $sizeGroup.find('.whole-input');

    $sizeInputs.on('change', function () {
        $wholeInput.val(
            $sizeInputs.eq(0).val() + '*' +
            $sizeInputs.eq(1).val() + '*' +
            $sizeInputs.eq(2).val()
        );
    });

    $wholeInput.on('change', function() {
        var arr = $(this).val().split('*');
        if (arr.length) {
            $sizeInputs.eq(0).val(arr[0]);
            $sizeInputs.eq(1).val(arr[1]);
            $sizeInputs.eq(2).val(arr[2]);
        }
    });
};

/**
 * 初始化页面
 */
common.init = function () {
    // 遍历渲染菜单
    var i = 0,
        menu_len = Arr_Menu.length,
        menu_html = '';
    for (; i < menu_len; i++) {
        menu_html += '<li><a href="javascript:;">' + Arr_Menu[i][0] +
            '</a><div>' + Arr_Menu[i][1] +
            (Arr_Menu[i][2] ? '<h5 class="text-danger"><span class="glyphicon glyphicon-volume-up"></span> 公告</h5><p class="text-info">' +
                Arr_Menu[i][2] + '</p>' : '') + '</div></li>';
    }
    $('#nav-list').html(menu_html);

    // 当前日期
    var $time = $('#user-mess').find('time');
    setInterval(function () {
        $time.html(common.date.format());
    }, 1000);

    // 删除操作
    $('#data-list').on('click', '.btn-del', function() { // 删除按钮
        if (confirm('确定进行删除操作？')) {
            // 执行删除操作
            location.search = '?Do=Del&DataID=' + $(this).closest('tr').data('id') + '&' + location.search.substr(1);
        }
    });

    // 重置表单
    $('.btn-add-data').on('click', function () {
        $('#add-data form')[0].reset();
    });

    // 全选
    var $selectAll = $('#select-all input');
    $selectAll.on('change', function () {
        $selectAll.closest('table').find('tbody input[type="checkbox"]').prop('checked', $selectAll.prop('checked')).change();
    });
};

common.init();

/**
 * 备注方法封装
 * @author Harry
 * @date 2016-05-03 15:23
 * [dataID]:就是dataID
 * [rediv]:包裹整个备注的div
 * [reform]:备注提交框的form
 * [retemp]:备注的记录输出模板
 * [resetBtn]:修改备注时出现的重置按钮
 * [UID]:当前登录用户的UID
 * [uploadURL]:提交接口，如没有传入参数则使用默认
 * [getdataURL]:获取接口，如没有传入参数则使用默认
 * [deleteURL]:删除接口，如没有传入参数则使用默认
 */

// 所有方法再封装一次
common.remarkFunction = function(dataID, rediv, reform, retemp, resetBtn, UID, uploadURL, getdataURL, deleteURL) {
    // 更新备注封装
    common.remarkUpdate(dataID, rediv, reform, retemp, resetBtn, UID, uploadURL, getdataURL, deleteURL);
    // 提交备注信息
    common.remarkSave(dataID, rediv, reform, retemp, resetBtn, UID, uploadURL, getdataURL, deleteURL);
    // 判断备注能否编辑和删除，如果备注的UID符合当前用户UID，则可以编辑或删除，并且绑定事件
    common.editAndDel(dataID, rediv, reform, retemp, resetBtn, UID, uploadURL, getdataURL, deleteURL);
    // 编辑备注的[取消]按钮事件
    common.reset(reform, resetBtn);
}

//提交备注信息
common.remarkSave = function(dataID, rediv, reform, retemp, resetBtn, UID, uploadURL, getdataURL, deleteURL){
    reform.find('input[type="submit"]').on('click', function(){
        common.ajax({
            title: '提交备注信息',
            URL: uploadURL || '/OMS/Order.aspx?Do=MessageSave',
            type: 'post',
            data: {
                DataID: reform.find('#DataIDforEdit').val()?reform.find('#DataIDforEdit').val():null,
                OID: dataID, 
                FID: dataID,
                Remark: reform.find('textarea').val(),
                Content: reform.find('textarea').val()
            },
            good: function(data){
                common.alert({
                    type: 'success',
                    title: '“提交备注”操作：',
                    msg: data.Message || '成功！'
                });
                //检查是否有隐藏的input标签，如果有就删除（更新备注遗留）
                if(reform.find('#DataIDforEdit')){
                    reform.find('#DataIDforEdit').remove();
                }
                //如果[取消]按钮是显示的，就隐藏掉
                if(!resetBtn.is(':hidden')){
                    resetBtn.attr('class', 'btn btn-default hidden');;
                }
                //按钮更改为[提交]
                reform.find('input[type="submit"]').val('提交');
                //刷新备注
                common.remarkUpdate(dataID, rediv, reform, retemp, resetBtn, UID, uploadURL, getdataURL, deleteURL);
            }
        });
    });
}

//更新备注封装
common.remarkUpdate = function(dataID, rediv, reform, retemp, resetBtn, UID, uploadURL, getdataURL, deleteURL){
    $.ajax({
        url: getdataURL || '/OMS/Order.aspx?Do=Query&DataID=' + dataID,
        type: 'get',
        dataType: 'json',
        success: function(data){
            var mes;
            if (getdataURL) {
                mes = data;
            }else{
                mes = data.DataList[0];
            }
            rediv.find('tbody').html(Mustache.render(retemp, mes));
            rediv.find('tr').each(function() {
                var isLink = LinkChange($(this).find('span:eq(0)').text());
                $(this).find('span:eq(0)').html(isLink);
            });
            reform.find('textarea').val("");
            //判断备注能否编辑删除
            common.editAndDel(dataID, rediv, reform, retemp, resetBtn, UID, uploadURL, getdataURL, deleteURL);
        }
    });
}

//判断备注能否编辑和删除，如果备注的UID符合当前用户UID，则可以编辑或删除，并且绑定事件
common.editAndDel = function(dataID, rediv, reform, retemp, resetBtn, UID, uploadURL, getdataURL, deleteURL){
    var $uidList = rediv.find('table tr');
    //遍历每条备注的按钮，设置为隐藏
    $uidList.each(function(){
        var inputUID = $(this).find('#UID').val();
        $(this).find('#btn-ead').hide();
        //如果备注的UID符合当前用户UID，则显示编辑和删除按钮
        if(inputUID == UID){
            var $thisDiv = $(this).find('#btn-ead'),
                $thisTr = $(this),
                $DataID = $thisTr.find('#DataID').val();
            $thisDiv.show();
            //绑定按钮事件
            //编辑备注
            $thisDiv.find('span:eq(0)').on('click', function(){
                var $cInput = $('<input id="DataIDforEdit" name="DataID" type="hidden" value=' + $DataID + ' />'),
                    //预防点击多次出现多个OID
                    $hidinp = reform.find('input[type="hidden"]');
                    $hidinp ? reform.find('input[type="hidden"]').remove().end().append($cInput) : form.append($cInput);
                //把备注内容复制到文本域
                var copyText = $thisTr.find('span:eq(0)').text();
                reform.find('textarea').val(copyText);
                //改变提交按钮为[修改]，并显示隐藏的[取消]按钮
                reform.find('input[type="submit"]').val('修改');
                resetBtn.attr('class', 'btn btn-default');
            });
            //删除备注
            $thisDiv.find('span:eq(1)').on('click', function(){
                common.ajax({
                    title: '删除备注',
                    URL: deleteURL || '/OMS/Order.aspx?Do=MessageDelete',
                    type: 'post',
                    data: { 
                        DataID: $DataID,
                        FID: dataID
                    },
                    good: function(data){
                        common.alert({
                            type: 'success',
                            title: '“删除备注”操作：',
                            msg: data.Message || '成功！'
                        });
                        //刷新备注
                        common.remarkUpdate(dataID, rediv, reform, retemp, resetBtn, UID, uploadURL, getdataURL, deleteURL);
                    }
                });
            });
        }
    });
}

//编辑备注的[取消]按钮事件
common.reset = function(reform, resetBtn){
    reform.find('input[type="reset"]').on('click', function(){
        //删除掉带有DataID的input标签
        reform.find('input[type="hidden"]').remove();
        resetBtn.attr('class', 'btn btn-default hidden');
        //按钮更改为[提交]
        reform.find('input[type="submit"]').val('提交');
    });
}

/**
 * 链接转换为a标签
 * @param {String} _str 备注内容
 */
function LinkChange(_str) {
    _str = _str.replace(/\[\[\[(.*)]]]/g, ' 【<a href="$1" target="_blank">附加链接</a>】 ');
    return _str;
}

/**
 * 召唤方法封装
 * @author Harry
 * @date 2016-05-21 15:18
 * [inputSelect]:筛选成员或组织的输入框
 * [atList]:显示召唤标签的div
 * [atForm]:表单的from标签
 * [Spinner]:隐藏的用于显示召唤列表的DIV
 * [keySelect]:键盘事件使用的参数，用于保存按键光标所在位置，初始为空
 * [setHeight]:召唤下拉列表的滚动条高度参数，初始为空
 * [MenbersArr]:成员的数据，数组格式
 * [poundsArr]:团队的数据，数组格式
 * [atOrShare]:用来区分是at还是share
 */
common.at = {}; 
common.at.inputCheck = function(inputSelect, atList, atForm, Spinner, keySelect, setHeight, MenbersArr, poundsArr, atOrShare){
    // 判断输入框输入内容是否正确，以及绑定下拉列表的鼠标事件
    inputSelect[0].oninput = function(){
        keySelect = null; //每次输入，重置按键定位为null
        atForm.find('.text-danger').html("");
        var ts = $(this),
            matePound = /^#.*/,
            mateAt = /^@.*/;

        // 判断输入为@或者#或者提示输入错误
        if(mateAt.test(ts.val())){
            common.at.dataFilter(Spinner, MenbersArr, ts);
        }else if(matePound.test(ts.val())){
            common.at.dataFilter(Spinner, poundsArr, ts);
        }else if(ts.val() === null || ts.val() === ""){
            atForm.find('.text-danger').html("");
            Spinner.removeClass('hidden').find('ul').html("");
            keySelect = null;
            setHeight = null;
        }else{
            Spinner.removeClass('hidden').find('ul').html("");
            inputSelect.siblings('.text-danger').html("请先输入@或者#来查找个人或者部门。");
        }

        // 鼠标经过/点击事件
        Spinner.find('li').each(function(){
            var ts = $(this);
            ts.on({
                mouseover:function(){
                    Spinner.find('li').removeClass('active');
                    ts.addClass('active');
                },
                mouseout:function(){
                    Spinner.find('li').removeClass('active');
                    keySelect = null;
                    setHeight = null;
                },
                click:function(){
                    common.at.addFun(inputSelect, atList, atForm, Spinner, atOrShare);
                    common.at.removeMate(atList, atForm);
                }
            });
        });
    }
}

//数据筛选封装
common.at.dataFilter = function(Spinner, arr, obj){
    var tempArr = [],
        tempIndex = 0;
    //字符串检测
    $.each(arr, function(i, n){
        if(n.indexOf(obj.val().substr(1)) !== -1){
            tempArr[tempIndex] = n;
            tempIndex++;
        }
    });

    // 让UL显示，清空UL内容
    Spinner.removeClass('hidden').find('ul').html("");

    var fragment = document.createDocumentFragment();
    $.each(tempArr, function(i, n){
        var newLi = $('<li class="list-group-item">' + n + '</li>')[0];
        fragment.appendChild(newLi);
    });
    Spinner.find('ul')[0].appendChild(fragment);
}

// 选择后添加标签和隐藏的传值input
common.at.addFun = function(inputSelect, atList, atForm, Spinner, atOrShare){
    var wsVal = inputSelect.val(),
        atType, mateStyle,
        val = Spinner.find('.active').text();
    if(wsVal.charAt(0) === "@"){
            mateStyle = "label-info";
            atType = "@";
        }else{
            mateStyle = "label-primary";
            atType = "#";
        }
        if(atList.find('span[data-val="' + val + '"]').length !== 0){
            common.alert({
                title: val,
                msg: " 已经存在，不可重复添加!"
            });
        }else if(val === null || val === ""){
            return;
        }else{
            $('<span class="label ' + mateStyle + ' mg-r-5" data-val="' + val + '">' + val + '&nbsp;&nbsp;<button type="button" class="atMate">x</button></span>').appendTo(atList);
            $('<input type="hidden" name="' + atOrShare + '" data-val="' + val + '" value="' + atType + val + '" />').appendTo(atForm);
            atForm.find('.text-danger').html("");
            Spinner.removeClass('hidden').find('ul').html("");
            inputSelect.val("");
            keySelect = null;
            setHeight = null;
        }
}

// 键盘上下键选择
common.at.keydownFun = function(inputSelect, atList, atForm, Spinner, keySelect, setHeight, atOrShare){
    inputSelect.keydown(function(e){
        e = event || window.event;
        // 按键事件
        if(e.keyCode === 38){
            if(keySelect === null){
                keySelect = 0;
                Spinner.find('li').removeClass('active').eq(keySelect).addClass('active');
            }else{
                keySelect === 0 ? keySelect = 0 : keySelect--;
                Spinner.find('li').removeClass('active').eq(keySelect).addClass('active');
            }

        }else if(e.keyCode === 40){

            if(keySelect === null){
                keySelect = 0;
                Spinner.find('li').removeClass('active').eq(keySelect).addClass('active');
            }else{
                keySelect === Spinner.find('li').length-1 ? keySelect = Spinner.find('li').length-1 : keySelect++;
                Spinner.find('li').removeClass('active').eq(keySelect).addClass('active');
            }

        }else if(e.keyCode === 13){
            common.at.addFun(inputSelect, atList, atForm, Spinner, atOrShare);
            common.at.removeMate(atList, atForm);
            keySelect = null;
            setHeight = null;
        }else if(e.keyCode === 8){
            keySelect = null;
            setHeight = null;
        }

        // 滚动条事件
        if(keySelect > 2 && keySelect < Spinner.find('li').length-3){
            if(e.keyCode === 40){
                setHeight += 41;
                Spinner.scrollTop(setHeight);
            }else if(e.keyCode === 38){
                setHeight -= 41;
                Spinner.scrollTop(setHeight);
            }
        }else if(keySelect <= 2){
            setHeight = 0;
            Spinner.scrollTop(setHeight);
        }else if(keySelect >= Spinner.find('li').length-3){
            setHeight = (keySelect-2) * 41;
            Spinner.scrollTop(setHeight);
        }
    });
}

// 绑定标签删除事件
common.at.removeMate = function(atList, atForm){
    atList.find('span').each(function(){
        var ts = $(this),
        val = ts.data('val');
        ts.find('.atMate').on('click', function(){
            atForm.find('input[data-val="' + val + '"]').remove();
            ts.remove();
        });
    });
}

// 返回顶部按钮
common.topBtn = function(winDiv){
    winDiv = winDiv?winDiv:$('body');
    $('footer').before('<div id="topBtn"></div>');
    var $topBtn = $('#topBtn');
    $topBtn.addClass('topBtn topBtnColor02 poi').html('<span class="glyphicon glyphicon-eject"></span>');
    $topBtn.on({
        click: function(){ winDiv.scrollTop(0)},
        mouseover: function(){ $(this).removeClass('topBtnColor02').addClass('topBtnColor07'); },
        mouseout: function(){ $(this).removeClass('topBtnColor07').addClass('topBtnColor02'); }
    });
}

/**
 * 渲染方法封装
 * @author Harry
 * @date 2016-07-05 18:04
 * [tagDiv]: 目标所在的div
 */

common.Rendering = {};

// 货币渲染
common.Rendering.currency = function(tagDiv){
    tagDiv.find('.currency').each(function () {
        var ts = $(this);
        ts.addClass('label-' + common.order.amtCurrency($.trim(ts.text())));
    });
}

//单号渲染
common.Rendering.order = function(tagDiv){
    tagDiv.find('.orderID').each(function() {
        var $this = $(this),
            before = $this.text();
        $this.html(before.replace(/(\d{8}|\d{6})/ig, '<span class="label label-success">$1</span>'));
    }); 
}

// var option = {
//     Type : ['', 'XX1', 'XX2', 'XX3'],                                 // 状态类型
//     Ch   : ['中文1', '中文2', '中文3'],
//     Style: ['label-default', 'label-xxx', 'label-xxx2', 'label-xx3'] // 状态样式，有默认可不填
//     Mode : prepend(前插) / append(后插) / replace(替换)
//}

// 万用渲染方法
common.Rendering.All = function(_$, op) {
    // 默认渲染样式
    var defaultStyle = ['label-default', 'label-primary', 'label-success', 'label-info', 'label-warning', 'label-danger'];

    if(op && op.Type.length != 0) {
        _$.each(function(ind, el) {
            var tempLabel = $('<span></span>').addClass('label mg-r-5 mg-l-5');
            var text = $(this).text();
            var index = op.Type.indexOf(text);
            text == '' ? text = '初始' : text;
            if (index != -1) {
                tempLabel.addClass((op.Style && op.Style[index]) || defaultStyle[index]).text(op.Ch ? op.Ch[index] : op.Type[index]);
                switch(op.Mode) {
                    case 'prepend':
                        $(this).prepend(tempLabel);
                        break;
                    case 'append':
                        $(this).append(tempLabel);
                        break;
                    case 'replace':
                        $(this).html(tempLabel);
                        break;
                }
            }
        });
    }
}

// 调试用输出
var cl = function(content){
    console.log(content);
}

/**
 * SKU系列方法的封装
 * @author Harry
 * @date   2016-12-06 15:57
 */

common.copy = {};

/**
 * SKU系列方法封装
 * @param {Object} _$ 需要复制的主体
 * @param {JSON}   op 配置参数
 */

// 需要的DOM结构
// <div class="copy">
//     <span class="poi mg-r-5" data-clipboard-text="{{FullSKU}}" data-id="{{DataID}}" title="点击复制该SKU">[{{FullSKU}}]</span>
//     {{FullName}} * {{Quantity}}
// </div>

// var option = {
//      Link: {
//          Ack  : true, 
//          Title: 'new page' // 鼠标悬浮显示的文字，默认“打开页面”
//      },
//      Warehouse: {
//          Ack      : true,
//          Placement: 'left', // 弹出框显示方向，默认bottom
//      },
//      Label: {
//          Ack: true
//      },
//      Limit: {
//          Ack: true
//      }
// };
// 
common.copy.SkuCopy = function(_$, op) {
    ZeroClipboard.config({swfPath: '/Resource/flash/ZeroClipboard.swf'});
    var _tar   = _$.find('.poi');
    var _skuID = _tar.data('id');
    var clip   = new ZeroClipboard(_tar);

    // 添加鼠标滑过效果
    _tar.on({
        mousemove: function() {$(this).addClass('bg-primary')},
        mouseout: function() {$(this).removeClass('bg-primary')}
    });

    // 默认渲染样式
    var defaultStyle = ['label-default', 'label-primary', 'label-warning', 'label-danger'];
    var defaultType  = ['', '销售', '清仓', '下架'];

    // 是否有参数传入
    if (_skuID && (op && !(op.Limit && op.Limit.Ack))) {

        // 添加并渲染标签
        if(op.Label && op.Label.Ack) {
            _$.each(function(ind, el) {
                var tempLabel = $('<span></span>').addClass('label mg-r-5');
                var text      = $(this).find('.poi').data('status');
                var index     = defaultType.indexOf(text);
                text == '' ? text = '初始' : text;
                if (index != -1) {
                    tempLabel.addClass(defaultStyle[index]).text(text);
                    $(this).prepend(tempLabel);
                }
            });
        } // 添加并渲染标签 - End

        // 显示库存
        if (op.Warehouse.Ack) {
            _$.each(function(ind, el) {
                var _th = $(this);
                var _switch = 0; // 初始为0，表示新建，当获取过一次接口后，设置为1，点击时不再获取接口。

                // 设置弹出框
                var tempSpan = $('<span></span>').addClass('glyphicon poi glyphicon-home mg-l-5')
                                                 .attr({
                                                    'title'         : '库存',
                                                    'style'         : 'color: rgb(61, 129, 190)',
                                                    'data-container': 'body',
                                                    'data-toggle'   : 'popover',
                                                    'data-html'     : 'true',
                                                    'data-trigger'  : 'click',
                                                    'data-placement': op.Warehouse.Placement || 'bottom'
                                                 });
                _th.append(tempSpan);


                _th.find('span.glyphicon-home').on('click', function() {
                    var _sth = $(this);
                    if (_switch == 0 && (_skuID != 0 && _skuID != null && _skuID != '')) {
                        _switch = 1;
                        common.copy.UpdateStock(tempSpan, _skuID, false);
                    } // if - End

                    //启动弹出框，并且设置弹出框完全渲染后的调用方法
                }).popover().on('shown.bs.popover', function() {
                    var popID = $(this).attr('aria-describedby');
                    $('#' + popID).find('.glyphicon-time').attr('onclick', 'common.copy.UpdateStock(' + popID + ', ' + _skuID + ', true)');
                });;
                
                
            });
        } // 显示库存 - End

        // 弹出新窗口
        if (op.Link && op.Link.Ack) {
            _$.each(function(ind, el) {
                var tempSpan = $('<span></span>').addClass('glyphicon glyphicon-certificate');
                var tempA = $('<a></a>').attr({
                                                'title' : op.Link.Title || '打开页面',
                                                'href'  : '/Product/?Do=All&SkuID=' + _skuID,
                                                'target': '_blank'
                                                });
                tempA.append(tempSpan);
                $(this).append('&nbsp;').append(tempA);
            });
        } // 弹出新窗口 - End

    } // 是否有参数传入 - End
} // common.copy.SkuCopy - End

/**
 * 更新库存
 * @param {Object} _$     需要更新的主题：新建时为整个table，更新时为tbody
 * @param {Number} _skuID SKU的DataID
 * @param {String} update 用于判断是否是更新
 */
common.copy.UpdateStock = function(_$, _skuID, update) {
    $.ajax({
        url: '/Logistics/Logistics.aspx?Do=GetStockBySkuID&DataID=' + _skuID,
        type: 'GET',
        dataType: 'JSON',
        async: false,
        success: function(d) {
            var ds = d.DataList;
            var now = new Date();
            var nowTime = now.getHours() + ':' + now.getMinutes() + ':' + now.getSeconds();

            if (update) {
                $(_$).find('.popover-content span[name="time"]').html(nowTime);
                $(_$).find('.popover-content table tbody').html(common.copy.LoopStock(ds));
            } else {
                _$.attr({
                    'data-content'  : '<span class="pull-right mg-b-5">获取时间：'
                                    + '<span class="glyphicon glyphicon-time text-danger mg-r-5 poi" title="刷新库存" '
                                    + 'onclick=""></span><span name="time">' + nowTime + '</span></span>'
                                    + '<table class="table table-bordered table-condensed">'
                                    + '<thead>'
                                        + '<tr>'
                                            + '<th>仓库</th><th>库存编码</th><th>在库</th><th>冻结</th><th>可用</th>' 
                                        + '</tr>'
                                    + '</thead>'
                                    + '<tbody>'
                                    + common.copy.LoopStock(ds)
                                    + '</tbody>'
                                  + '</table>'
                });
            }

        }
    });
}

/**
 * 遍历库存
 * @param {JSON}   ds 库存数据
 * return {String}    拼接好的元素字符串
 */
common.copy.LoopStock = function(ds) {
    var tempTr = '';
    for(var i = 0; i < ds.length; i++) {
        tempTr += '<tr>'
                    + '<td>' + ds[i].Name
                    + '<td>' + ds[i].InsideNo
                    + '</td><td>' + ds[i].AllQuantity
                    + '</td><td>' + ds[i].LockQuantity
                    + '</td><td>' + ds[i].Quantity + '</td>' 
                + '</tr>';
    }
    return tempTr;
}



/**
 * 搜索方法封装
 * @param {Object}  _$      搜索方法最外部div
 * @param {boolean} inForm  是否有外部form
 * @param {boolean} isLimit 是否是迷你搜索框
 * @param {String}  mode    是否是完整搜索
 */

// 参考参数
// var option = {
//     inForm : true,
//     isLimit: true,
//     mode   : true
// };
// 
// 需要的DOM结构
// <div id="XXXX"></div> 其实什么元素都行，只要能做容器就好
// 如果不是迷你模式，需要在页面添加引入
// <script src="/Resource/js/ZeroClipboard.min.js"></script>
common.SkuSearch = function(_$, op) {
    // 样式及结构
    var tempHTML;
    if(!op.inForm) {
        tempHTML = $('<form></form>').addClass('form-inline');
    }else {
        tempHTML = _$;
    }

    tempHTML.html('<input name="SkuID" type="hidden">'
                + '<div class="row">'
                    + '<div class="col-sm-12 input-group-sm">'
                        + '<input type="text" class="form-control" placeholder="ID / SKU / Name">'
                        + '<div class="list-group maxH200 search-drop hidden"></div>'
                        + '<label class="label-control mg-l-10"></label>'
                    + '</div>'
                + '</div>'
    );

    _$.append(tempHTML);
    // 样式及结构 - End
    
    // 列表模板
    var tempA = '{{#DataList}}'
              + '<a data-id="{{DataID}}" data-sku="{{FullSKU}}" data-status="{{Status}}" class="list-group-item pd-5 poi">'
                + '<span data-status="{{Status}}" class="l-status">[{{Status}}]</span>'
                + '<span data-sku="{{FullSKU}}" class="l-sku">[{{FullSKU}}]</span>'
                + '<span data-name="{{FullName}}" class="l-name mg-l-5">{{FullName}}</span>'
              + '</a>'
              + '{{/DataList}}';
    // 列表模板 - End

    // 搜索事件
    var _list = _$.find('.search-drop');
    // 限制搜索下拉的宽度跟输入框一致
    _$.find('input[type="text"]').one('focus', function() {
        _list.width(_$.find('input[type="text"]').outerWidth(true));
    });
    // 每当用户输入时检测接口
    _$[0].oninput = function() {
        var _input = _$.find('input[type="text"]').val();
        $.ajax({
            url: '/Product/API/?Do=SkuSearch&Mode=' + (op.mode ? 'Full' : '') + '&QueryLimitNumber=100&Page=3&KeyWord=' + _input,
            type: 'GET',
            dataType: 'JSON',
            success: function(d) {
                
                // 如果输入框为空，则清空列表
                if(_input == '' || _input == null) {
                    _list.empty();
                    _$.find('input[type="hidden"]').val('');
                    return;
                }

                // 遍历列表
                _list.html(Mustache.render(tempA, d));
                // 添加背景色
                _list.find('a:odd').css('background-color', '#DDDDDD');
                // 显示列表
                _list.removeClass('hidden');
                // 绑定添加sku的按钮
                _AddSkuBtn(_$, _list, op.isLimit);

            }
        });
    }

    // 手动关闭搜索下拉
    $(document).keydown(function(e) {
        e = event || window.event;
        if (e.keyCode === 27) {
            _list.empty();
        }
    });

    // 初始化页面label
    if (op.SkuID) {
        InitialSetUp(_$, op);
    }
    // 初始化页面label - End

} // 搜索方法封装 - End

/**
 * 绑定添加sku的按钮 - common.SkuSearch 的私有方法
 * @param  {Object} _$      搜索方法最外部div
 * @param  {Object} _l      搜索出的列表
 * @param  {Object} isLimit 是否是迷你搜索框
 */
// 必要插件 
// <script src="/Resource/js/ZeroClipboard.min.js"></script>
function _AddSkuBtn(_$, _l, isLimit) {
    _$.find('.list-group a').each(function(ind, el) {
        $(this).on('click', function() {
            // 销毁原有的弹出框
            $('.popover').popover('destroy');

            // 插入隐藏值
            _$.find('input[name="SkuID"]').val($(this).data('id'));

            // 拼装数据
            var _d = {
                data: {
                    DataID  : $(this).data('id'),
                    Status  : $(this).data('status'),
                    FullSKU : $(this).find('.l-sku').data('sku'),
                    FullName: $(this).find('.l-name').data('name')
                }
            };
            if (isLimit) {
                _$.find('input[type="text"]').val($(this).find('.l-name').text());
            } else {
                renderLabel(_$, _d);
            }
            _l.empty();
        });
    });
}

/**
 * 渲染label标签
 * @param  {Object} _$ 搜索方法最外部div
 * @param  {JSON}   _d 参数
 */
function renderLabel(_$, _d) {
    var tmpHtml = '{{#data}}'
                + '<div class="copy">'
                    + '<span class="poi mg-r-5" data-status="{{Status}}" data-clipboard-text="{{FullSKU}}" data-id="{{DataID}}" title="点击复制该SKU">'
                        + '[{{FullSKU}}]'
                    + '</span>{{FullName}}'
                + '</div>'
                + '{{/data}}';

    // 渲染搜索方法的label渲染
    _$.find('label.label-control').one('DOMNodeInserted', function() {
        var option = {
             Link: {Ack  : true},
             Warehouse: {Ack : true},
             Label: {Ack : true}
        };
        common.copy.SkuCopy(_$.find('.copy'), option);
    });

    _$.find('label').html(Mustache.render(tmpHtml, _d));
}

/**
 * 初始化页面label标签
 * @param {Object} _$ 搜索方法最外部div
 * @param {JSON}   op 配置参数
 */
function InitialSetUp(_$, op) {
    $.ajax({
        url: '/Product/API/?Do=SkuSearch&Mode=' + (op.mode ? 'Full' : '') + '&QueryLimitNumber=100&Page=3&KeyWord=' + op.SkuID,
        type: 'GET',
        dataType: 'JSON',
        success: function(d) {
            var ds = d.DataList[0];
            var _d = {
                data: {
                    DataID  : ds.DataID,
                    Status  : ds.Status,
                    FullSKU : ds.FullSKU,
                    FullName: ds.FullName
                }
            };

            _$.find('input[type="text"]').val(ds.FullSKU);
            // 渲染label标签
            renderLabel(_$, _d);
        }
    });
}

/**
 * 操作记录封装
 * @param {Object} _$ 要插入记录的容器
 * @param {[type]} d  要遍历的数据
 */
common.Log = function(_$, d) {
    var LogHTML = '<table class="table table-striped table-bordered table-hover table-condensed">'
                 + '<thead>'
                    + '<tr>'
                        + '<th>操作人</th>'
                        + '<th>操作记录</th>'
                        + '<th>时间</th>'
                    + '</tr>'
                 + '</thead>'
                 + '<tbody>'
                    + '{{#Log}}'
                    + '<tr>'
                        + '<td>{{Name}}</td>'
                        + '<td>{{Remark}}</td>'
                        + '<td>{{Date}}</td>'
                    + '</tr>'
                    + '{{/Log}}'
                 + '</tbody>';
    _$.html(Mustache.render(LogHTML, d));
}