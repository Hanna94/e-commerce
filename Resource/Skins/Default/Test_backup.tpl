{页面属性}{/页面属性}
<body>
	{页顶导航}{/页顶导航}
    <!-- 内容-->
    <article class="container-fluid">
        <header class="pull-right mg-b-10">
            <div class="btn-group btn-group-sm">
                <button type="button" class="btn btn-success btn-upload" data-toggle="modal" data-target="#modal-upload"><span class="glyphicon glyphicon-open"></span> 上传附件</button>
                <button type="button" class="btn btn-success btn-loading" data-toggle="modal" data-target="#modal-loading"><span class="glyphicon glyphicon-refresh"></span> 加载条</button>
                <button type="button" class="btn btn-success btn-tag" data-toggle="modal" data-target="#modal-tag"><span class="glyphicon glyphicon-tags"></span> 标签页</button>
                <button type="button" class="btn btn-success btn-alert-mess" data-toggle="modal" data-target="#alert-mess"><span class="glyphicon glyphicon-warning-sign"></span> 提示框</button>
            </div>
        </header>

        <form class="form-inline mg-b-20" action="javascript:;">
            <select class="form-control input-sm">
                <option value="BuyerID">BuyerID</option>
                <option value="Consignee">Consignee</option>
                <option value="Email">Email</option>
            </select>
            <div class="input-group input-group-sm">
                <input type="text" class="form-control" placeholder="Search..." name="KeyWord">
                <input type="hidden" value="unconfirmed" name="Do">
                <span class="input-group-btn">
                    <button class="btn btn-default" type="submit"><span class="glyphicon glyphicon-search"></span> 搜索</button>
                </span>
            </div>
        </form>

        <div class="panel panel-default">
            <div class="panel-heading">买家资料</div>
            <table class="table table-striped table-bordered table-condensed">
                <tbody>
                    <tr>
                        <th>买家ID</th>
                        <td>wootts0(236)</td>
                        <th>邮箱</th>
                        <td>roou203484@bluecyouder.co.uk</td>
                    </tr>
                    <tr>
                        <th>祖册时间</th>
                        <td>2004-04-20 10:20:37</td>
                        <th>电话</th>
                        <td>4380917947</td>
                    </tr>
                    <tr>
                        <th>eBay地址</th>
                        <td colspan="3">dfoyf, falf, asdlfiur rou, ruoauf, dsfurfc</td>
                    </tr>
                    <tr>
                        <th>PayPal地址</th>
                        <td colspan="3">dfoyf, falf, asdlfiur rou, ruoauf, dsfurfc</td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="row">
            <div class="col-sm-6">
                <div class="panel panel-default">
                    <div class="panel-heading">买家留言</div>
                    <div class="panel-body text-danger">
                        说好的买鼠标，送电脑。
                    </div>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="panel panel-default">
                    <div class="panel-heading">备注
                        <button class="btn btn-success btn-xs pull-right" type="button">添加</button>
                    </div>
                    <table class="table table-striped table-bordered table-condensed">
                        <colgroup>
                            <col>
                            <col width="50%">
                            <col>
                            <col>
                        </colgroup>
                        <thead>
                            <tr>
                                <th>账号</th>
                                <th>内容</th>
                                <th>时间</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Demi</td>
                                <td class="text-danger">FL295832829GB,We asked the addressee to arrange redelivery or collect FL295832829GB from Cheadle SK DO. The addressee did not respond by the requested date. On the 2016-03-29 we returned the item to sender.因为买家没有取件已被退回。问买家是否愿意出3英镑运费重发，还是要求退款</td>
                                <td>2015-04-10 11:54:44</td>
                                <td>
                                    <a class="btn-edit" href="javascript:;"><span class="glyphicon glyphicon-pencil"></span></a>
                                    &nbsp;&nbsp;
                                    <a class="btn-del" href="javascript:;"><span class="glyphicon glyphicon-remove text-danger"></span></a>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        
        <div class="panel panel-default">
            <div class="panel-heading">历史订单</div>
            <table class="table table-striped table-bordered table-condensed">
                <thead>
                    <tr>
                        <th>店铺</th>
                        <th>SKU</th>
                        <th>价格</th>
                        <th>订单号</th>
                        <th>名称</th>
                        
                        <th>状态</th>
                        <th>物流商</th>
                        <th>跟踪号</th>
                        <th>付款交易号</th>
                        <th>退款交易号</th>
                        <th>是否开通PayPal Case</th>
                        <th>时间</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>LAN</td>
                        <td>YAFOR-4481H-4JHF</td>
                        <td><span class="label label-primary">GBP</span> 14.8</td>
                        <td>65479832172212</td>
                        <td>55cm魔法</td>
                        <td>未发货</td>
                        <td>CK1</td>
                        <td>3123127983217981</td>
                        <td>89745679812345687</td>
                        <td>7458696963565852</td>
                        <td>是</td>
                        <td>2016-03-02 11:34:50</td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="panel panel-default">
            <div class="panel-heading">来往邮件</div>
            <table class="table table-striped table-bordered table-condensed">
                <colgroup>
                    <col>
                    <col>
                    <col>
                    <col width="70%">
                </colgroup>
                <thead>
                    <tr>
                        <th>店铺</th>
                        <th>操作</th>
                        <th>时间</th>
                        <th>主题</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>LAN</td>
                        <td>发出</td>
                        <td>2016-03-02 11:34:50</td>
                        <td><a href="javascript:;">关于：18silky针对物品编号170147041891247189提出问题</a></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </article>

    <!-- 上传文件模态框-->
    <div id="modal-upload" class="modal fade" tabIndex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <form  class="form-horizontal" action="javascript:;">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                        <h4 class="modal-title">上传文件</h4>
                    </div>
                    <div class="modal-body">
                        <input class="form-control-static" type="file" name="StrFile">
                        <p class="text-info">
                            <br>
                            <strong>提示：</strong>这是上传处理后的提示信息。
                        </p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">确定</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- 加载条模态框-->
    <div id="modal-loading" class="modal fade" tabIndex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <form  class="form-horizontal" action="javascript:;">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                        <h4 class="modal-title">上传文件</h4>
                    </div>
                    <div class="modal-body">
                        <div class="progress">
                            <div class="progress-bar progress-bar-success progress-bar-striped active" style="width: 60%"><span class="sr-only">60% Complete</span></div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">确定</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- 带有标签页的模态框-->
    <div id="modal-tag" class="modal fade modal-nav" tabIndex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <form  class="form-horizontal" action="javascript:;">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                        <h4 class="modal-title">下载文件</h4>
                    </div>
                    <div class="modal-body">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#home" data-toggle="tab">one</a></li>
                            <li><a href="#profile" data-toggle="tab">two</a></li>
                            <li><a href="#messages" data-toggle="tab">there</a></li>
                            <li><a href="#settings" data-toggle="tab">four</a></li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="home">ONE</div>
                            <div class="tab-pane" id="profile">TWO</div>
                            <div class="tab-pane" id="messages">THERE</div>
                            <div class="tab-pane" id="settings">FOUR</div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">确定</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- 信息提示框-->
    <div id="alert-mess" class="modal fade" tabIndex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                    <h4 class="modal-title">{标题}</h4>
                </div>
                <div class="modal-body">
                    {内容}
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">确定</button>
                </div>
            </div>
        </div>
    </div>
    
    {页面底部}{/页面底部}
</body>
</html>
