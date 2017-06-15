{页面属性}{/页面属性}
<body>
	{页顶导航}{/页顶导航}
    <!-- 内容-->
    <article class="container-fluid">
        <div id="infoList">
            <div id="msgWid">
                <div class="msg-title">
                    <div class="msg-title-left">
                        <h3 class="panel-title"></h3>
                    </div>
                    <div class="msg-title-right">
                        <span data-name="Star" class="glyphicon glyphicon-star poi" title="是否为星标邮件"></span>
                        <span data-name="Crash" class="glyphicon glyphicon-fire poi" title="是否为紧急邮件"></span>
                        <span data-name="Executes" class="glyphicon glyphicon-refresh poi" title="是否已经处理"></span>
                    </div>
                </div>
                <div class="msg-content"></div>
                <div class="msg-input">
                    <div class="inputHead pd-t-5 pd-l-5">
                        <button class="btn btn-link btn-xs" data-toggle="modal" data-target="#imgUpload" >上传图片</button>
                        <button id="imgRemove" class="btn btn-link btn-xs">清空图片</button>
                    </div>
                    <div class="inputBody">
                        <textarea id="msg-input-content" name="Content"></textarea>
                    </div>
                    <div class="inputFoot">
                        <button class="btn btn-default pull-right sendEmail" type="button">确认</button>
                    </div>
                </div>
            </div>
            <div id="userInfo">
                <!-- 用户信息 -->
                <div id="u-info" class="pad mg-b-10 hidden">
                    <table class="tableStyle">
                        <colgroup>
                            <col width="80px">
                            <col>
                        </colgroup>
                        <tbody></tbody>
                    </table>
                </div>
                
                <!-- Item信息 -->
                <div id="u-item" class="pad mg-b-10"></div>            

                <!-- 订单信息 -->
                <div id="u-order" class="pad mg-b-10 hidden">
                    <table class="tableStyle table table-condensed">
                        <colgroup>
                            <col width="40px">
                            <col width="60px">
                            <col>
                            <col>
                            <col>
                            <col width="40px">
                        </colgroup>
                        <thead>
                            <th>店铺</th>
                            <th>订单号</th>
                            <th>状态</th>
                            <th>金额</th>
                            <th>时间</th>
                            <th>操作</th>
                        </thead>
                        <tbody></tbody>
                    </table>
                </div>

                <!-- 运单信息 -->
                <div id="u-logistics" class="pad mg-b-10 maxH300 hidden"></div>
                
                <!-- 备注信息 -->
                <div id="msg-remark" class="pad mg-b-10 hidden">
                    <h4></h4>
                    <div id="message-remark"></div>
                </div>
            </div>
        </div>
    
    </article>

    <!-- 图片上传 -->
    <div class="modal fade" id="imgUpload" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button class="close" data-dismiss="modal">x</button>
                    <h4 class="modal-title">图片上传</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group attachments">
                        <label>请选择要上传的图片:</label>
                    </div>
                    <div class="form-group attachments">
                        <input type="file" id="imgupload" name="StrFile" multiple="multiple" />
                    </div>
                    <div class="form-group">
                        <span class="text-danger">注：该功能可同时上传最多5张图片；上传错图片只需要重新上传一次覆盖即可。</span>
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-default">上传</button>
                </div>
            </div>
        </div>
    </div>

    <!-- 图片展示模态框 -->
    <div class="modal fade" id="imgModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div id="btnL" class="topBtnColor02 btnLR poi" style="font-size: 30px; padding: 7px 25px; width: 80px; height: 50px; position: absolute; bottom: 10px; left: 10px;">
                    <span class="glyphicon glyphicon-chevron-left"></span>
                </div>
                <div id="imgCon"></div>
                <div id="btnR" class="topBtnColor02 btnLR poi" style="font-size: 30px; padding: 7px 25px; width: 80px; height: 50px; position: absolute; bottom: 10px; left: 90px;">
                    <span class="glyphicon glyphicon-chevron-right"></span>
                </div>
            </div>
        </div>
    </div>

    <!-- 新建售后单选择框 -->
    <div class="modal fade" id="serviceModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button class="close" data-dismiss="modal">x</button>
                    <h4 class="modal-title">新建售后单 - 跳转</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" action="javascript:;">
                        <div class="form-group form-group-sm mg-b-5">
                            <label for="sell-cause" class="control-label col-sm-2">原因</label>
                            <div class="col-sm-4">
                                <select id="sell-cause" class="form-control customer-service-cause"></select>
                            </div>
                            <div class="col-sm-6">
                                <p id="sell-msg-cause" class="text-danger"></p>
                            </div>
                        </div>
                        <div class="form-group form-group-sm">
                            <label for="sell-handle" class="control-label col-sm-2">处理方式</label>
                            <div class="col-sm-4">
                                <select id="sell-handle" class="form-control">
                                    <option value="">请选择</option>
                                    <option value="退款">退款</option>
                                    <option value="重发">重发</option>
                                    <option value="额外退款">额外退款</option>
                                    <option value="账号退款">账号退款</option>
                                </select>
                            </div>
                            <div class="col-sm-6">
                                <p id="sell-msg-handle" class="text-danger"></p>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button id="service-jump" type="button" class="btn btn-default btn-sm">跳转</button>
                </div>
            </div>
        </div>
    </div>

    <!-- 邮件显示 -->
    <template id="temp-message">
        {{#Content}}
        <div data-id="{{DataID}}" data-msgid="{{MessageID}}" data-fid="{{FolderID}}">
            <div class="msg-message-title">
                <h5><strong></strong><small>[时间:{{ReceiveDate}}]</small></h5>
            </div>
            <div class="msg-message-content">
                <p>{{{Content}}}</p>
                <p>
                {{#Media}}
                    <img class="poi" data-imgid="{{DataID}}" data-url="{{MediaURL}}"  src="{{MediaURL-Small}}" />
                {{/Media}}
                </p>
            </div>
        </div>
        {{/Content}}
    </template>

    <!-- 用户信息 -->
    <template id="temp-info">
        {{#Address}}
        {{#PayPal}}
        <tr><td class="text-r">邮箱:</td><td class="tdStyle"></td></tr>
        <tr><td class="text-r">客户名:</td><td class="tdStyle">{{Name}}</td></tr>
        <tr><td class="text-r" valign="top">订单地址:</td><td class="tdStyle">{{FullAddress}}</td></tr>
        {{/PayPal}}
        {{#eBay}}
        <tr><td class="text-r">客户电话:</td><td class="tdStyle">{{Phone}}</td></tr>
        {{/eBay}}
        {{/Address}}
    </template>

    <!-- Item信息 -->
    <template id="temp-item">
        {{#Item}}
        <p><a href="http://cgi.ebay.com/{{ItemID}}" target="_blank">{{Title}}</a></p>
        <p>[{{ShopName}}]{{ItemID}}</p>
        <table class="tableStyle">
            <colgroup>
                <col width="120px">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <td rowspan="2" style="text-align: center;"><img class="poi" style="height:42px;width:auto;" data-url="{{GalleryURL}}" src="{{GalleryURL-Small}}"></td>
                    <td>金额：</td>
                    <td><span class="label currency">{{CurrencyID}}</span>{{StartPrice}}</td>
                </tr>
                <tr>
                    <td>时间：</td>
                    <td>{{EndTime}}</td>
                </tr>
            </tbody>
        </table>
        {{/Item}}
    </template>

    <!-- 用户订单记录 -->
    <template id="temp-order">
        {{#Order}}
        <tr class="tr-pd-8">
            <td>{{ShopName}}</td>
            <td><a href="/OMS/?Do=Edit&DataID={{DataID}}" target="_blank">{{DataID}}</a></td>
            <td>{{Status}}</td>
            <td>{{Currency}}<br>{{Amt}}</td>
            <td>{{CreatedTime}}</td>
            <td>
                <span data-val="{{DataID}}" class="glyphicon glyphicon-tag poi" title="点击切换备注[{{DataID}}]"></span>
                <span data-val="{{DataID}}" class="glyphicon glyphicon-new-window poi" title="创建订单号[{{DataID}}]的售后单"></span>
            </td>
        </tr>
        {{/Order}}
    </template>
    
    {页面底部}{/页面底部}

    <script src="/Resource/js/mustache.js"></script>
    <script src="/Resource/js/Remark.js"></script>
    <script src="/Resource/js/logistics-module.js"></script>
    <script src="/Resource/js/customer-service-option.js"></script>
    <script>
        $(function(){
            'use strict';

            var oParam = common.URL.parse(),
                $infoList = $('#infoList'),
                $msgWid = $('#msgWid'),
                $toolbox = $('#Toolbox'),
                $msgTitle = $infoList.find('.msg-title'),
                $msgContent = $infoList.find('.msg-content'),
                $msgInput = $infoList.find('.msg-input'),
                tempMessage = $('#temp-message').html(),
                $userInfo = $('#userInfo'),
                tempInfo = $('#temp-info').html(),
                $userItem = $('#u-item'),
                tempItem = $('#temp-item').html(),
                $imgModal = $('#imgModal'),
                $imgUpload = $('#imgUpload'),
                tempOrder = $('#temp-order').html(),
                scrollHeight, dataShopID, imgMedie,
                page = 1,
                hasOrder, lastMsgForBuyer;
                
            // 获取数据和上传数据
            (function(){
                getMsg();
                function getMsg(){
                    $.ajax({
                        url: '/OMS/API/?Do=MessageQuery&DataID=' + oParam.DataID + '&Page=' + page,
                        
                        type: 'get',
                        success: function(data){
                            var d = data;
                            lastMsgForBuyer = d.Content[0].FolderID
                            console.log('最后一条信息发送人(Inbox为Buyer，Send为客服)：' + lastMsgForBuyer);
                            d.Content = d.Content.reverse();
                            dataShopID = d.MessageData.ShopID;

                            // 标题
                            $msgTitle.find('h3').text(d.MessageData.Subject);
                            if (d.Status.Star === 'True') {$msgTitle.find('span').attr('style', 'color: rgba(252, 145, 80 ,1)');}

                            // 渲染图标
                            $msgTitle.find('.glyphicon-star').attr('data-sta', d.Status.Star);
                            $msgTitle.find('.glyphicon-fire').attr('data-sta', d.Status.Crash);
                            $msgTitle.find('.glyphicon-refresh').attr('data-sta', d.Status.Executes);
                            $msgTitle.find('.glyphicon').each(function(){
                                var ts = $(this);
                                if (ts.attr('data-sta') === 'True') {
                                    ts.attr('style', 'color: rgba(252, 145, 80 ,1)');
                                }else{
                                    ts.removeAttr('style');
                                }
                            });


                            // 邮件内容
                            if (page !== 1) {
                                $msgContent.find('div:eq(0)').before(Mustache.render(tempMessage, d));
                            }else{
                                $msgContent.html(Mustache.render(tempMessage, d));
                            }
                            // 区分是否为系统邮件
                            if (d.MessageData.Type === 'Question') {
                                $msgContent.find('div').each(function(){
                                    var ts = $(this),
                                        fid = ts.attr('data-fid');
                                    switch(fid){
                                        case 'Send':
                                            ts.addClass('msg-message-right');
                                        break;
                                        case 'Inbox':
                                            ts.addClass('msg-message-left');
                                        break;
                                    }
                                });

                                // 图片显示
                                $msgWid.find('.msg-content img').each(function(){
                                    var ts = $(this);
                                    ts.on('click', function(){
                                        $imgModal.modal('show');
                                        $imgModal.find('#imgCon').html('<img data-imgid="' + ts.attr('data-imgid') + '" src="' + ts.attr('data-url') + '"/>');
                                    });
                                });

                            }else {
                                $msgContent.removeClass('msg-content');
                                $msgInput.remove();
                            }

                            // Item信息
                            $userItem.html(Mustache.render(tempItem, d));

                            // Item货币单位渲染
                            $userItem.find('.currency').each(function () {
                                var $this = $(this);
                                $this.addClass('label-' + common.order.amtCurrency($.trim($this.text())));
                            });

                            // Item商品图点击加载大图
                            $userItem.find('img').on('click', function(){
                                var ts = $(this);
                                $imgModal.modal('show');
                                $imgModal.find('.btnLR').hide();
                                $imgModal.find('#imgCon').html('<img src="' + ts.attr('data-url') + '"/>');
                            });

                            // 获取图片组
                            (function(){
                                var imgArr = [],
                                    maxN, minN,
                                    imgObj;
                                $msgContent.find('img[class="poi"]').on('click', function(){
                                    // 初始化数据
                                    imgArr = []; 
                                    maxN = null;
                                    minN = null;

                                    var ts = $(this);
                                    $imgModal.find('.btnLR').show();
                                    ts.closest('p').find('img').each(function(i){
                                        var tempNum = i;
                                        if (i === 0) {
                                            maxN = $(this).attr('data-imgid');
                                        }else if (i === (ts.closest('p').find('img').length) - 1) {
                                            minN = $(this).attr('data-imgid');
                                        }
                                        imgArr[i] = $(this).attr('data-imgid');
                                    });
                                    imgObj = null;
                                    imgObj = $(this).closest('p');
                                });

                                // 模态框大图按钮
                                $imgModal.find('.btnLR').each(function(){
                                    var ts = $(this),
                                        tempUrl, tempImgid;
                                    ts.on({
                                        mouseover: function(){ ts.removeClass('topBtnColor02').addClass('topBtnColor07'); },
                                        mouseout: function(){ ts.removeClass('topBtnColor07').addClass('topBtnColor02'); },
                                        click: function(){
                                            switch(ts.attr('id')){
                                                case 'btnL':
                                                    if (ts.attr('id') !== maxN) {
                                                        tempImgid = parseInt($('#imgCon img').attr('data-imgid')) + 1;
                                                        tempUrl = imgObj.find('img[data-imgid="'+ tempImgid +'"]').attr('data-url');
                                                        $('#imgCon').find('img').attr('data-imgid', tempImgid);
                                                        $('#imgCon').find('img').attr('src', tempUrl);
                                                        tempImgid = null;
                                                        tempUrl = null;
                                                    }
                                                    break;
                                                case 'btnR':
                                                    if (ts.attr('id') !== minN) {
                                                        tempImgid = parseInt($('#imgCon img').attr('data-imgid')) - 1;
                                                        tempUrl = imgObj.find('img[data-imgid="'+ tempImgid +'"]').attr('data-url');
                                                        $('#imgCon').find('img').attr('data-imgid', tempImgid);
                                                        $('#imgCon').find('img').attr('src', tempUrl);
                                                        tempImgid = null;
                                                        tempUrl = null;
                                                    }
                                                    break;
                                            }
                                        }
                                    });
                                });
                            })();

                            // 滚动条
                            if (page === 1) {
                                scrollHeight = $msgContent[0].scrollHeight;
                                $msgContent.scrollTop(scrollHeight);
                            }else{
                                $msgContent.scrollTop($msgContent[0].scrollHeight - scrollHeight);
                                scrollHeight = $msgContent[0].scrollHeight;
                            }

                            // 加载更多信息
                            $('#loadMore').remove();
                            if(page < d.Page.QueryPages) {
                                $msgContent.find('div:eq(0)').before('<div id="loadMore" style="width: 100%; text-align: center;"><span class="label label-default poi">加载更多信息...</span></div>');
                            }

                            // 点击获取更多，提取更多信息数据
                            $('#loadMore span').on('click', function(){
                                page++;
                                getMsg();
                            });

                            // 加载用户信息
                            $.ajax({
                                url: '/OMS/API/?Do=UserQuery&BuyerID=' + d.MessageData.Sender,
                                type: 'get',
                                
                                success: function(data){
                                    hasOrder = data.Ack
                                    console.log('是否有订单信息：' + hasOrder);
                                    common.loading.show();
                                    if (data.Order.length !== 0) {
                                        // 渲染用户信息
                                        var tempUser = '<tr><td class="text-r">BuyerUserID:</td><td class="tdStyle">{{Buyer}}</td></tr>';
                                        // 拼合地址
                                        var _address = [], _dap = data.Address.PayPal;
                                        if (_dap != null && _dap != '') {
                                            _address.push(_dap.Street1, _dap.Street2, 
                                                        _dap.City, _dap.State, _dap.ZIP, 
                                                        _dap.Country, _dap.Phone);
                                            // 删除数组中空元素
                                            for(var i = 0; i < _address.length; i++) {
                                                if (_address[i].length == 0) {
                                                    _address.splice(i, 1);
                                                    i--;
                                                }
                                            }
                                            // 把删除空元素后的数组组合成字符串,插入数据中
                                            data.Address.PayPal.FullAddress = _address.join(', ');
                                        }

                                        var userHtml = Mustache.render(tempUser, data.Order[0]);
                                        var tempInfoHtml = userHtml + Mustache.render(tempInfo, data);
                                        $userInfo.find('#u-info tbody').html(tempInfoHtml);
                                        // 渲染订单信息
                                        $userInfo.find('#u-order tbody').html(Mustache.render(tempOrder, data));
                                        // 渲染状态
                                        var tempTr = $userInfo.find('#u-order tbody tr');
                                        tempTr.each(function(){
                                            var ts = $(this).find('td:eq(2)');
                                            ts.html(common.order.setStatus(ts.text()));
                                        });

                                        // 加载运单信息
                                        $.each(data.Order, function(index, event) {
                                            $.ajax({
                                                url     : '/OMS/API/?Do=Query&DataID=' + event.DataID,
                                                type    : 'GET',
                                                
                                                success : function(data){
                                                    var logOption = {
                                                        Element  : $('#u-logistics'),       // 容器
                                                        OID      : data.DataList[0].OrderID,// OID，和数据两者必须至少存在一个
                                                        Data     : '',                      // 数据，和OID两者必须至少存在一个
                                                        Placement: 'left',                  // 弹出框显示位置
                                                        Style    : 'table',                 // 显示样式
                                                        DateShow : false,                   // 是否显式的显示建单时间
                                                        Mode     : 'append'                 // 后入式
                                                    };
                                                    LogisticsModule(logOption);
                                                }
                                            });
                                        });
                                        $('#u-logistics').hasClass('hidden') && $('#u-logistics').removeClass('hidden');

                                        // 初始标签渲染
                                        $userInfo.find('#u-order tbody tr td:eq(5) span.glyphicon-tag').attr('style', 'color: rgba(92, 184, 92, 1)');

                                        // 加载完各种数据后加载备注方法
                                        setRemark(data.Order[0].DataID);

                                        // 切换订单方法
                                        orderChange();

                                        // 新建售后单方法
                                        NewService();

                                        // 显示用户信息
                                        $('#u-info').hasClass('hidden') && $('#u-info').removeClass('hidden');
                                        $('#u-order').hasClass('hidden') && $('#u-order').removeClass('hidden');
                                        $('#msg-remark').hasClass('hidden') && $('#msg-remark').removeClass('hidden');
                                    }
                                    common.loading.hide();
                                }
                            });
                        }
                    });
                }

                // 点击图标更改标记状态
                $msgTitle.find('.glyphicon').each(function(){
                    var ts = $(this);
                    ts.on('click', function(){
                        var sta = ts.attr('data-name'),
                            val = ts.attr('data-sta');
                        if (sta == 'Executes') {
                            if (hasOrder && lastMsgForBuyer == 'Inbox') {
                                if (confirm('是否确认要更改处理状态？')) {

                                }else {
                                    return false;
                                }
                            }
                        }
                        
                        $.ajax({
                            url: '/OMS/API/?Do=SetMessageStatus',
                            type: 'post',
                            
                            traditional: true,
                            data: {
                                DataID: oParam.DataID,
                                Status: sta,
                                Value: val === 'True' ? 'False' : 'True'
                            },
                            success: function(data){
                                val === 'True' ? ts.attr('data-sta', 'False') : ts.attr('data-sta', 'True');
                                if (ts.attr('data-sta') === 'True') {
                                    ts.attr('style', 'color: rgba(252, 145, 80 ,1)');
                                }else{
                                    ts.removeAttr('style');
                                }
                            }
                        });
                    });
                });

                // 上传图片
                $imgUpload.find('.modal-footer button').on('click', function(){
                    common.ajaxFE({
                        title: '图片上传',
                        URL: '/OMS/API/eBay.aspx?Do=UploadImages',
                        FE: 'imgupload',
                        type: 'post',
                        data: {
                            DataID: dataShopID
                        },
                        ok: function(data, status, e){
                            common.alert({
                                type: 'success',
                                title: '图片上传',
                                msg: '成功：' + data.Message,
                                time: 1000
                            });
                            $imgUpload.modal('hide');
                            imgMedie = data.Media;
                            thumbnail();
                        }
                    });
                });

                // 清除图片
                $('#imgRemove').on('click', function(){
                    CloseImg();
                });

                // 上传数据
                $msgInput.find('.sendEmail').on('click', function(){
                    var text = $('#msg-input-content').val();
                    $.ajax({
                        url: '/OMS/API/eBay.aspx?Do=MessageRTQ&MessageID=' + oParam.MessageID,
                        type: 'post',
                        
                        data: {
                            Content: text,
                            Media: imgMedie
                        },
                        success: function(data){
                            common.alert({
                                type: 'success',
                                msg: data.Message,
                                cb: function() {
                                    CloseImg();
                                }
                            });
                            $msgInput.find('textarea').val('');
                            imgMedie = null;

                            //回复后把邮件标记为已处理
                            $.ajax({
                                url: '/OMS/API/?Do=SetMessageStatus',
                                type: 'post',
                                
                                traditional: true,
                                data: {
                                    DataID: oParam.DataID,
                                    Status: 'Executes',
                                    Value: 'True'
                                },
                                success: function(data){
                                    $msgTitle.find('.glyphicon-refresh').attr('style', 'color: rgba(252, 145, 80 ,1)');
                                }
                            });
                        },
                        error: function(data){
                            common.alert({
                                msg: data.Message
                            });
                        }
                    });
                });

                // 清空图片
                function CloseImg() {
                    imgMedie = '';
                    $msgInput.find('.inputHead').find('img').remove();
                }

                // 上传图片后显示缩略图
                function thumbnail() {
                    var $imgAppendArea = $msgInput.find('.inputHead');
                    $imgAppendArea.find('img').remove(); // 每次遍历前清空其他图片
                    // 分割图片链接数组
                    var imgArray = [];
                    imgArray = imgMedie.split(',');

                    // 遍历图片标签
                    var imgFragment = document.createDocumentFragment();
                    $.each(imgArray, function(index, object) {
                        var imgElement = $('<img>');
                        imgElement.attr({
                            'src': object,
                            'style': 'width:15px; height: 15px; margin-right: 5px;',
                            'data-html': 'true',
                            'data-trigger': 'hover',
                            'data-container': 'body',
                            'data-toggle': 'popover',
                            'data-placement': 'top',
                            'data-content': '<img src =\'' + object + '\' style=\'max-width: 244px;\'>'
                        });
                        imgFragment.appendChild(imgElement[0]);
                    });
                    $imgAppendArea.append(imgFragment); // 把预览图插入到上传图片按钮后边
                    $("[data-toggle='popover']").popover(); // 启动缩略图预览
                }

                // 点击切换备注
                function orderChange() {
                    var $remarkTr = $userInfo.find('#u-order tbody tr'),
                        dataDataID;
                    $remarkTr.on('click', 'span.glyphicon-tag', function() {
                        var ts = $(this);
                        $remarkTr.each(function() {
                            $(this).find('span.glyphicon-tag').removeAttr('style');
                        });
                        ts.attr('style', 'color: rgba(92, 184, 92, 1)');
                        setRemark(ts.attr('data-val'));
                    });
                }

                // 设置备注方法
                function setRemark(dataDataID, data){
                    var Int_UID = <!-- BEGIN 当前用户ID ATTRIB= --><!-- END 当前用户ID -->;

                    // 设置备注标题
                    $('#msg-remark h4').html('备注单号：' + dataDataID);
                    
                    var msgOption = {
                        Target : $('#message-remark'),
                        DataID : dataDataID,
                        UID    : Int_UID,
                        HasWarp: true
                    };
                    Remark(msgOption, data);
                }

                // 新建售后单方法
                function NewService() {
                    $('#u-order').on('click', 'span.glyphicon-new-window', function() {
                        var did = $(this).data('val');
                        // 点击跳转按钮时触发
                        $('#service-jump').off().on('click', function() {
                            var sc = IfSelected($('#sell-cause'), $('#sell-msg-cause'), '售后原因');
                            var sh = IfSelected($('#sell-handle'), $('#sell-msg-handle'), '处理方式');
                            if (sc && sh) {
                                var serviceHref = '/CustomerService/?Do=Doing'
                                                + '&DataID=' + did
                                                + '&Types=' + $('#sell-cause').val()
                                                + '&ExecuteMode=' + $('#sell-handle').val();
                                window.open(serviceHref);
                                $('#serviceModal').modal('hide');
                            }
                            
                        });

                        $('#serviceModal').modal('show');
                    });
                }

                /**
                 * 判断是否已经选择
                 * @param {Object} _se   select元素
                 * @param {Object} _msg  提示框
                 * @param {String} _text 提示文本
                 */
                function IfSelected(_se, _msg, _text) {
                    var _re;
                    if (_se.val() == '' || _se.val() == null) {
                        _se.addClass('fs');
                        _msg.text('请先选择' + _text);
                        _re = false;
                    } else if(_se.hasClass('fs')) {
                        _se.removeClass('fs');
                        _msg.empty();
                        _re = true;
                    } else {
                        _re = true;
                    }
                    return _re;
                }
                
            })(); //获取数据和上传数据-END

            // 根据浏览器宽度自适应
            (function(){
                function wthChange(){
                    var wth = document.documentElement.clientWidth || document.body.clientWidth;
                    var hei = document.documentElement.clientHeight || document.body.clientHeight;
                    var navHeight = $('nav')[0].offsetHeight;
                    var titleHeight = $('.msg-title')[0].offsetHeight; 
                    var inputHeight = 200; 
                        wth -= 35;
                        hei -= (titleHeight + inputHeight + navHeight + 10);
                    $infoList[0].style.width = wth + 'px';
                    $msgWid[0].style.width = (wth - 410) + 'px';
                    $msgContent[0].style.height = hei + 'px';
                    // $userInfo[0].style.left = (wth - 390) + 'px';
                    console.log($msgWid[0].offsetHeight);
                    $userInfo.css({
                        'left'    : (wth - 390) + 'px',
                        'height'  : ($msgWid[0].offsetHeight + 30) + 'px', // 30个未知像素，先暂时添加
                        'overflow': 'auto',
                    });
                }
                wthChange();
                window.onresize = function(){
                    wthChange();
                }
            })();
        });
    </script>
</body>
</html>
