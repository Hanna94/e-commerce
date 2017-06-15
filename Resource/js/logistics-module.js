/**
 * 运单模块插件
 * @param {JSON} option 配置信息
 *
 * 配置数据格式
 * var logOption = {
 *     Element  : $('#order-logistics'), // 容器
 *     OID      : Data.OrderID,          // OID，和数据两者必须至少存在一个
 *     Data     : '',                    // 数据，和OID两者必须至少存在一个
 *     Placement: 'top',                 // 弹出框显示位置
 *     Style    : 'table' / 'label',     // 显示样式
 *     DateShow : true / false           // 是否显式的显示建单时间
 *     Mode     : prepend(前插) / append(后插) / replace(替换)
 * };
 *
 * 需要引入文件
 * <script src="/Resource/js/logistics-module.js"></script>
 *
 * PS: 按Esc可直接关闭弹出框，需要注意的是，如果是在模态框内，按Esc会连同模态框一起关掉
 */
function LogisticsModule(option) {
    // 是否现成数据
    if (option.Data) {
        _LogTagLoad(option, option.Data);
        _RenderingStatus(option);
    }else {
        // 无现成数据，用接口查询
        $.ajax({
            url     : '/logistics/API/?Do=LogisticsList&ReferenceID=' + option.OID,
            type    : 'GET',
            
            success : function(data) {
                _LogTagLoad(option, data);
                _RenderingStatus(option);
            }
        });
    }
}
// 加载运单主标签
function _LogTagLoad(option, data) {
  var _btn = '<button class="btn btn-default btn-xs" '
             + 'data-toggle="popover" data-html="true" data-container="body" data-placement="' + option.Placement + '" '
             + 'data-content="'
               + '<ul class=&quot;nav nav-tabs mg-b-5&quot;>'
                 + '<li class=&quot;active&quot;><a href=&quot;#logistics-order&quot; data-toggle=&quot;tab&quot;>单号</a></li>'
                 + '<li><a href=&quot;#logistics-product&quot; data-toggle=&quot;tab&quot;>产品</a></li>'
                 + '<li><a href=&quot;#logistics-amt&quot; data-toggle=&quot;tab&quot;>费用</a></li>'
                 + '<li><a href=&quot;#logistics-log&quot; data-toggle=&quot;tab&quot;>日志</a></li>'
               + '</ul>'
               + '<div class=&quot;tab-content&quot;>'
                 + '<div id=&quot;logistics-order&quot; class=&quot;logisticsPopover tab-pane fade in active&quot; style=&quot;width:500px;height:150px;overflow:auto;&quot;>'
                   + '<table class=&quot;table table-striped table-bordered table-hover table-condensed&quot;>'
                     + '<thead><th>仓库/货代/物流</th><th>单号/挂号</th><th>状态</th></thead>'
                     + '<tbody>'
                       + '<tr><td>{{Warehouse.Code}}</td><td>{{OrderID}}</td><td>{{Status}}</td></tr>'
                       + '<tr><td>{{Freight.Code}}</td><td>{{Freight.InsideOrder}}</td><td></td></tr>'
                       + '<tr><td>{{Freight.Service.Code}}</td><td>{{Freight.Service.TrackingNumber}}</td><td></td></tr>'
                     + '</tbody>'
                   + '</table>'
                 + '</div>'
                 + '<div id=&quot;logistics-product&quot; class=&quot;logisticsPopover tab-pane fade&quot; style=&quot;width:500px;height:150px;overflow:auto;&quot;>'
                   + '<table class=&quot;table table-striped table-bordered table-hover table-condensed&quot;>'
                     + '<thead><th>产品</th><th>数量</th></thead>'
                     + '<tbody>'
                     + '{{#Product}}'
                       + '<tr><td>{{Status}}&nbsp;[{{FullSKU}}]&nbsp;{{FullName}}</td><td>{{Quantity}}</td></tr>'
                     + '{{/Product}}'
                     + '</tbody>'
                   + '</table>'
                 + '</div>'
                 + '<div id=&quot;logistics-amt&quot; class=&quot;logisticsPopover tab-pane fade&quot; style=&quot;width:500px;height:150px;overflow:auto;&quot;>'
                   + '<table class=&quot;table table-striped table-bordered table-hover table-condensed&quot;>'
                     + '<thead><th>项目</th><th>费用</th><th>时间</th></thead>'
                     + '<tbody>'
                     + '{{#Cost}}'
                       + '<tr><td>{{Remark}}</td><td>{{Currency}}{{Amount}}</td><td>{{Date}}</td></tr>'
                     + '{{/Cost}}'
                     + '</tbody>'
                   + '</table>'
                 + '</div>'
                 + '<div id=&quot;logistics-log&quot; class=&quot;logisticsPopover tab-pane fade&quot; style=&quot;width:500px;height:150px;overflow:auto;&quot;>'
                   + '<table class=&quot;table table-striped table-bordered table-hover table-condensed&quot;>'
                     + '<thead><th>操作人</th><th>操作记录</th><th>时间</th></thead>'
                     + '<tbody>'
                     + '{{#Log}}'
                       + '<tr><td>{{Name}}</td><td>{{Remark}}</td><td>{{Date}}</td></tr>'
                     + '{{/Log}}'
                     + '</tbody>'
                   + '</table>'
                 + '</div>'
               + '</div>'
             + '"><span class="glyphicon glyphicon-plane" title="运单详情"></span></button>';

  var tableStyle = '<table class="table table-striped table-bordered table-hover table-condensed">'
                    + '<thead><tr><td>单号</td><td>仓库</td><td>状态</td><td>时间</td><td>详情</td></tr></thead>'
                    + '<tbody>'
                    + '{{#Logistics}}'
                    + '<tr>'
                      + '<td><span class="orderID" title="运单号">{{OrderID}}</span></td>'
                      + '<td><span class="label warehouse " title="仓库">{{Warehouse.Code}}</span></td>'
                      + '<td><span class="label status" title="状态">{{Status}}</span></td>'
                      + '<td>' + (option.DateShow ? '<i class="text-muted" title="建单时间">{{CreatedDate}}</i>' : '<span class="glyphicon glyphicon-time" title="{{CreatedDate}}"></span>') + '</td>'
                      + '<td>'
                      + _btn
                      + '</td>'
                    + '</tr>'
                    + '{{/Logistics}}'
                    + '</tbody>'
                  + '</table>';
  var labelStyle = '{{#Logistics}}'
                 + '<div>'
                 + '<span class="label status" title="状态">{{Status}}</span>&nbsp;'
                 + '<span class="label warehouse " title="仓库">{{Warehouse.Code}}</span>&nbsp;'
                 + '<span class="orderID" title="运单号">{{OrderID}}</span>&nbsp;'
                 + (option.DateShow ? '<i class="text-muted" title="建单时间">{{CreatedDate}}</i>' : '<span class="glyphicon glyphicon-time" title="{{CreatedDate}}"></span>') + '&nbsp;'
                 + _btn
                 + '</div>'
                 + '{{/Logistics}}';
  var _tmp = option.Style == 'table' ? tableStyle : labelStyle;

  switch(option.Mode) {
    case 'prepend':
      option.Element.prepend(Mustache.render(_tmp, data));
      break;
    case 'append':
      option.Element.append(Mustache.render(_tmp, data));
      break;
    case 'replace':
      option.Element.html(Mustache.render(_tmp, data));
      break;
  }
  option.Element.find('[data-toggle="popover"]').popover();
  // 手动关闭搜索下拉
  $(document).keydown(function(e) {
      e = event || window.event;
      e.keyCode == 27 && $(".popover").popover('hide');
  });
}

// 状态渲染
function _RenderingStatus(option) {
  // 状态渲染
  var style  = ['default', 'default',  'info', 'lightseagreen', 'cadetblue', 'success', 'warning', 'warning', 'danger'],
      txt    = ['初始', '截单', '已配货', '已交运', '已出库', '已妥投', '已取消', '异常', '退件'],
      status = ['', 'CutOff', 'Stock', 'Post', 'OutStock', 'Delivered', 'Cancel', 'Return', 'Exception'];
  option.Element.find('.status').each(function() {
    var statusIndex = status.indexOf($(this).text());
    $(this).text(txt[statusIndex]);
    $(this).addClass('label-' + style[statusIndex]);
  });
  // 仓库渲染
  var style = ['label-default', 'a1me', 'a1md', 'm2c', '2gve', 'xytg', 'xyts', 'label-warning'],
      warehouse = ['', 'A1ME', 'A1MD', 'M2C', 'SXTY', 'XYTG', 'XYTS'];
  option.Element.find('.warehouse').each(function() {
    var warehouseIndex = warehouse.indexOf($(this).text());
    warehouseIndex == -1 ? $(this).addClass(style[7]) : $(this).addClass(style[warehouseIndex]);
  });
  // 运单号日期渲染
  common.Rendering.order(option.Element);
}