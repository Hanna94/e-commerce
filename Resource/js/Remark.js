// 数据格式
// var op = {
//     Target : $('#xxx'),
//     DataID : 123,    // 要更新的单号
//     UID    : 'Harry',
//     HasWarp: true,
//     Title  : 'XXXX',
//     Tip    : '提示：如需要在备注中加入链接地址，请使用三层英文中括号包裹链接，如：[[[http://erp.v0.xytinc.com]]]。',
//     SaveURL: '/OMS/Order.aspx?Do=MessageSave',
//     GetURL : '/OMS/Order.aspx?Do=MessageSave',
//     DelURL : '/OMS/Order.aspx?Do=MessageSave'
// };
// 
// 页面所需加载文件
// <script src="/Resource/js/Remark.js"></script>
// 

/**
 * 备注方法封装、外部调用方法
 * @param {JSON} op        配置信息
 * @param {JSON} addedData 现有数据
 */
function Remark(op, addedData) {
    // 加载备注的DOM结构
    RemarkDOMLoad(op);
    // 加载备注信息列表
    MessageListLoad(op, addedData);
    // 新建备注信息
    NewMessage(op);
    // 编辑备注信息
    UpdateMessage(op);

}

// 加载备注的DOM结构
function RemarkDOMLoad(op) {
    var warpDOM = $(
              '<div class="panel panel-default">'
              + '<div class="panel-heading">'
                + '<span class="panel-title">' + op.Title + '</span>'
              + '</div>'
              + '<div class="panel-body"></div>'
            + '</div>'
        ); 
    var basicDOM = $(
            '<form class="form-horizontal" action="javascript:;">'
            + '<div class="input-group input-group-sm">'
              + '<input type="text" name="Remark" class="form-control _i_remark_input">'
              + '<span class="input-group-btn">'
                + '<button type="button" class="btn btn-default _b_remark_btn_upload">提交</button>'
                + '<button type="button" class="btn btn-default _b_remark_btn_edit hidden">修改</button>'
                + '<button type="reset" class="btn btn-default _b_remark_btn_cancel hidden">取消</button>'
              + '</span>'
              + '<button type="button" class="_b_remark_tip btn btn-default btn-xs pull-right"'
                + 'data-container="body" data-toggle="popover" data-placement="bottom"'
                + 'data-trigger="hover"'
                + 'data-content="' + (op.Tip || '如需要在备注中加入链接地址，请使用三层英文中括号包裹链接，如：[[[http://erp.v0.xytinc.com]]]。') + '"'
                + 'href="javascript:;"><span class="glyphicon glyphicon-question-sign"></span>'
              + '</button>'
            + '</div>'
          + '</form>'
          + '<div class="maxH300 mg-t-10">'
            + '<table class="table table-striped table-condensed _t_remark_list">'
              + '<tbody></tbody>'
            + '</table>'
          + '</div>'
        );
    basicDOM.find('._b_remark_tip').popover(); // 启动弹出框
    // 是否有自带外层
    if (!op.HasWarp) {
        warpDOM.find('.panel-body').html(basicDOM);
        op.Target.html(warpDOM);
    } else {
        op.Target.html(basicDOM);
    }
}

// 新建备注信息
function NewMessage(op) {
    op.Target.find('._b_remark_btn_upload').on('click', function() {
        MessageSave(op);
    });
}

// 编辑备注信息
function UpdateMessage(op) {
    op.Target.find('._b_remark_btn_edit').on('click', function() {
        MessageSave(op);
    });
    op.Target.find('._b_remark_btn_cancel').on('click', function() {
        op.Target.find('form ._i_remark_hidden').remove();
        _BtnChange(op, false);
    });
}

// 加载编辑备注信息方法
function MessageEdit(op) {
    // 编辑方法
    op.Target.find('._s_remark_edit').on('click', function() {
        // 获取要编辑备注的内容，转换后填入输入框
        var _input  = op.Target.find('._i_remark_input');
        var _tr     = $(this).closest('tr');
        var _tmpVal = _tr.find('._s_remark_message').html();
        _tmpVal = LinkReversalChange(_tmpVal);
        _input.val(_tmpVal);
        // 更改按钮组为编辑状态
        _BtnChange(op, true);
        // 添加编辑备注的ID
        _AddInput(op, _tr.data('id'));
    });
    
    // 删除方法
    op.Target.find('._s_remark_delete').on('click', function() {
        MessageDelete(op, $(this).closest('tr').data('id'));
    });

}
// 编辑备注时的按钮组切换
function _BtnChange(op, Ack) {
    if (Ack) {
        // 转成编辑
        op.Target.find('._b_remark_btn_upload').addClass('hidden');
        op.Target.find('._b_remark_btn_edit').removeClass('hidden');
        op.Target.find('._b_remark_btn_cancel').removeClass('hidden');
    } else {
        // 转成新建
        op.Target.find('._b_remark_btn_upload').removeClass('hidden');
        op.Target.find('._b_remark_btn_edit').addClass('hidden');
        op.Target.find('._b_remark_btn_cancel').addClass('hidden');
    }
}
// 添加编辑备注的ID
function _AddInput(op, _did) {
    var current = op.Target.find('._i_remark_hidden');
    if (current.length == 0 || current.val() != _did) {
        var _f = op.Target.find('form');
        _f.find('._i_remark_hidden').remove();
        _f.append('<input class="_i_remark_hidden" type="hidden" value="'+ _did +'">');
    }
}

// 保存备注信息
function MessageSave(op) {
    common.loading.show();
    var _did = op.Target.find('._i_remark_hidden');
    $.ajax({
        url     : op.SaveURL || '/OMS/API/?Do=MessageSave',
        type    : 'POST',
        dataType: 'JSON',
        data    : {
            DataID : _did?_did.val():null,
            FID    : op.DataID,
            Content: op.Target.find('._i_remark_input').val()
        },
        success    : function(data){
            common.loading.hide();
            common.alertIf({
                title: '备注',
                data : data,
                time : 1000,
                tcb  : function() {
                    if (_did) {
                        // 保存后删除编辑ID
                        _did.remove();
                        // 保存后切换按钮组
                        _BtnChange(op, false);
                    }

                    // 加载备注信息列表
                    MessageListLoad(op);
                }
            });
        }
    });
}

// 删除备注信息
function MessageDelete(op, _did) {
    $.ajax({
        url     : op.DelURL || '/OMS/API/?Do=MessageDelete',
        type    : 'POST',
        dataType: 'JSON',
        data    : { 
            DataID: _did,
            FID   : op.DataID
        },
        success : function(data){
            common.alertIf({
                title: '删除备注',
                data : data,
                time : 1000,
                tcb  : MessageListLoad(op)
            });
        }
    });
}

// 加载备注信息列表
function MessageListLoad(op, addedData) {
    if (addedData) {
        _MessageListLoad(op, addedData);
    }else {
        $.ajax({
            url     : op.GetURL ? (op.GetURL + op.DataID) : '/OMS/API/?Do=Query&DataID=' + op.DataID,
            type    : 'GET',
            dataType: 'JSON',
            success : function(data){
                _MessageListLoad(op, data);
            }
        });
    }
}
function _MessageListLoad(op, _d) {
    // 判断数据是否有外层包裹
    var mes;
    _d.DataList ? mes = _d.DataList[0] : mes = _d;
    // 存储备注列表模板
    var tmpList = RemarkTemplate();
    // 加载备注信息列表
    op.Target.find('._t_remark_list tbody').html(Mustache.render(tmpList, mes));
    // 转换备注信息中的链接 & 删除非该用户备注的操作按钮
    op.Target.find('._t_remark_list tbody tr').each(function() {
        // 转换备注信息中的链接
        var isLink = LinkChange($(this).find('._s_remark_message').text());
        $(this).find('._s_remark_message').html(isLink);
        // 删除非该用户备注的操作按钮
        var _tsUID = parseInt($(this).data('uid'));
        _tsUID != op.UID && $(this).find('._d_remark_btn').remove();
    });
    // 清空输入框
    op.Target.find('._i_remark_input').val("");

    // 加载备注信息编辑方法
    MessageEdit(op);
}

// 备注模板
function RemarkTemplate() {
    var tmp = '{{#MessageList}}'
            + '<tr data-uid="{{UID}}" data-id="{{DataID}}">'
                + '<td>'
                    + '<span class="_s_remark_message">{{Content}}</span>'
                    + '<span class="remarkFontStyle" style="display: block;">{{TrueName}}'
                        + '<i class="mg-l-5">{{Date}}</i>'
                        + '<div class="poi pull-right _d_remark_btn">'
                            + '<span class="glyphicon glyphicon-pencil _s_remark_edit"></span>'
                            + '<span class="glyphicon glyphicon-remove _s_remark_delete mg-l-5"></span>'
                        + '</div>'
                    + '</span>'
                + '</td>'
            + '</tr>'
            + '{{/MessageList}}';
    return tmp;
}

/**
 * 链接转换为a标签，以及反转换方法
 * @param {String} _str 备注内容
 */
function LinkChange(_str) {
    _str = _str.replace(/\[\[\[(.*)]]]/g, ' 【<a href="$1" target="_blank">附加链接</a>】 ');
    return _str;
}
function LinkReversalChange(_str) {
    _str = _str.replace(/【<a href="(.*)" target="_blank">附加链接<\/a>】/g, '[[[$1]]]');
    return _str;
}