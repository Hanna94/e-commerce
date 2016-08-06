{页面属性}{/页面属性}
<body>
    {页顶导航}{/页顶导航}
    
    <!-- 内容-->
    <div id="data-list" class="container-fluid">
        <header>
            <!-- <div class="btn-group btn-group-sm pull-right">
                <button data-toggle="modal" data-target="#modal-create" class="btn btn-success btn-modal-create" type="button"><span class="glyphicon glyphicon-plus-sign"></span> 手工建单</button>

                <button data-toggle="modal" data-target="#modal-upload" class="btn btn-success" type="button"><span class="glyphicon glyphicon-upload"></span> 上传</button>

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
            </div> -->
        </header>

        <ul class="nav nav-tabs">
            <li><a href="?Do=All">全部商品</a></li>
            <li><a href="?Do=Auction">拍卖商品</a></li>
            <li><a href="?Do=BuyItNow">一口价商品</a></li>
            <li><a href="?Do=Promotional">促销商品</a></li>
            <li><a href="?Do=Marks">收藏商品</a></li>
        </ul>

        <div class="tab-content">
            <div class="tab-pane active">
                <form id="form-filter" class="form-inline mg-t-10 mg-b-10" action="javascript:;">
                    <input class="do" type="hidden" name="Do" value="unconfirmed">

                    <div class="input-group">
                        <div class="btn-group btn-group-xs" data-toggle="buttons">
                            <!-- BEGIN 店铺列表 ATTRIB= -->
                            <label class="btn btn-default">
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

                    <div class="input-group input-group-sm">
                        <input type="text" class="form-control" placeholder="Search..." name="KeyWord">
                        <span class="input-group-btn">
                            <button class="btn btn-default" type="submit"><span class="glyphicon glyphicon-search"></span> 搜索</button>
                        </span>
                    </div>
                </form>
                <div class="maxW1280" style="margin: 0 auto;">
                    <table class="table">
                        <tbody>
                            <!-- BEGIN 数据列表 ATTRIB= -->
                            <tr>
                                <td>
                                    <div style="position: relative; height:120px;">
                                        <div style="width: 120px; height: 100%; position: absolute; top:0; left: 0;">
                                            <img src="{GalleryURL}" alt="橱窗图">
                                        </div>
                                        <div style="width:1000px; height:19px; position: absolute; top:0; left: 120px;">
                                            <h4 style="display: block; height:38px; margin: 0 0 5px 0"><a href="Listing.aspx?Do=Edit&DataID={DataID}&ItemID={ItemID}" target="_blank">{Title}</a> <small>[{ItemID}]</small><br /><small>{SubTitle}</small></h4>
                                            <div>
                                                <span>店铺：{ShopName}</span><span style="margin-left:50px;">刊登站点：{Site}</span>
                                            </div>
                                            <div style="position:relative; width:1150px; height:65px;">
                                                <span style="position: absolute; top: 0; left: 0">在线时长：{ListingDuration}</span>
                                                <span style="position: absolute; top: 20px; left: 0">下架时间：{EndTime}</span>
                                                <span style="font-size: 20px; position: absolute; top: 0; left: 230px;">{CurrencyID}{StartPrice}</span>
                                                <span style="color: #CCC; text-decoration: line-through; position: absolute; top: 20px; left: 230px;">{PromotionalOriginalPrice}</span>
                                                <span style="position: absolute; top: 0; left: 350px;">{PromotionalStartTime}</span>
                                                <span style="position: absolute; top: 20px; left: 350px;">{PromotionalStartTime}</span>
                                                <span style="color: #CCC; position: absolute; bottom: 0; right: 0;">[售出{QuantitySold}][收藏{WatchCount}][浏览{HitCount}]</span>
                                            </div>
                                        </div>
                                        
                                    </div>
                                </td>
                            </tr>
                            <!-- END 数据列表 -->
                        </tbody>
                        <tfoot><tr><td colspan="15"></td></tr></tfoot>
                    </table>
                </div>
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
    
    <script>
        (function() {
            'use strict';

            var $dataList = $('#data-list'),
                $formFilter = $('#form-filter'),
                oParam = common.URL.parse(),
                $confBtn = $dataList.find('button[data-name="Confirmed"]'),
                shopID = oParam.ShopID || [];

            $formFilter.find('.do').val(oParam.Do);
            $formFilter.find('input[type="text"]').val(decodeURI((oParam.KeyWord || '').replace(/\++/g, ' ')));
            $formFilter.find('select option[value="' + (oParam.TeamID || $formFilter.find('select').data('default')) + '"]').prop('selected', true);

            for (var i = 0, len = shopID.length; i < len; i++) {
                $formFilter.find('input[type="checkbox"][value="' + shopID[i] + '"]').closest('.btn').button('toggle');
            }

            $formFilter.on('submit', function() {
                location.search = common.URL.stringify(common.URL.parse('?' + $formFilter.serialize()));
            });

            

            <!-- BEGIN 分页脚本 ATTRIB= -->
            common.showPage({当前页}, {总条数}, {每页条数});
            <!-- END 分页脚本 -->
        }());
    </script>
</body>
</html>
