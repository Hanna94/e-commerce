{页面属性}{/页面属性}
<body>
    {页顶导航}{/页顶导航}
    <!-- 内容-->
    <article class="container-fluid">
        <header>
            <button class="btn btn-success btn-sm btn-add-data pull-right" data-toggle="modal" data-target="#add-data"><span class="glyphicon glyphicon-bookmark"></span> 建立团队</button>
        </header>

        <!-- 数据列表-->
        <table id="data-list" class="table table-hover table-bordered table-striped table-condensed">
            <caption>团队管理列表</caption>
            <thead>
                <tr>
                    <th>团队ID</th>
                    <th>团队名称</th>
                    <th>团队管理人ID号</th>
                    <th>团队管理人</th>
                    <th>创建时间</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
                <!-- BEGIN 数据列表 ATTRIB= -->
                <tr data-id="{DataID}">
                    <td>{DataID}</td>
                    <td>{Name}</td>
                    <td>{LeaderID}</td>
                    <td>{Leader}</td>
                    <td>{Date}</td>
                    <td>
                        <a title="编辑" class="btn-edit" href="javascript:;"><span class="glyphicon glyphicon-pencil"></span></a>
                        &nbsp;&nbsp;
                        <a title="店铺授权" class="btn-shore-accredit" href="javascript:;"><span class="glyphicon glyphicon-home text-success"></span></a>
                        &nbsp;&nbsp;
                        <a title="删除" class="btn-del" href="javascript:;"><span class="glyphicon glyphicon-remove text-danger"></span></a>
                    </td>
                </tr>
                <!-- END 数据列表 -->
            </tbody>
        </table>
    </article>

    <!-- 添加与编辑-->
    <div id="add-data" class="modal fade modal-nav modal-set-del" tabIndex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <form class="form-horizontal" method="post" action="?Do=Save">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                        <h4 class="modal-title">新增/编辑团队</h4>
                    </div>
                    <div class="modal-body span-block">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#basic" data-toggle="tab">基本信息</a></li>
                            <li class="member disabled"><a href="#member" data-toggle="tab">团队成员</a></li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="basic">
                                <div class="form-group">
                                    <label for="DataID" class="col-sm-3 control-label">团队编码</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="DataID" ID="DataID" placeholder="团队编码，系统自动分配" readonly>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Name" class="col-sm-3 control-label">团队名称</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="Name" ID="Name" placehoder="团队名称">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="Date" class="col-sm-3 control-label">更新时间</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="Date" ID="Date" placeholder="系统自动处理" readonly>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane" id="member">
                                <div class="form-group">
                                    <label for="Date" class="col-sm-3 control-label">管理员</label>
                                    <div class="col-sm-9">
                                        <div class="leader-member radio"></div>
                                    </div>
                                </div>
                                <hr>
                                <div class="form-group">
                                    <label for="Date" class="col-sm-3 control-label">已加入成员</label>
                                    <div class="col-sm-9 active-member"></div>
                                </div>
                                <hr>
                                <div class="form-group">
                                    <label for="Date" class="col-sm-3 control-label">其他成员</label>
                                    <div class="col-sm-9 all-member"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                        <button type="submit" class="btn btn-primary">提交</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- 店铺授权-->
    <div id="shore-accredit" class="modal fade modal-set-del" tabIndex="-1">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <form  class="form-horizontal" action="javascript:;">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                        <h4 class="modal-title">店铺授权</h4>
                    </div>
                    <div class="modal-body span-block">
                        <div class="form-group">
                            <label class="col-sm-2">已授权店铺</label>
                            <div class="col-sm-10 active-shore-accredit"></div>
                        </div>
                        <hr>
                        <div class="form-group">
                            <label class="col-sm-2">其余店铺</label>
                            <div class="col-sm-10 all-shore-accredit"></div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    {页面底部}{/页面底部}
    <script>
        (function () {
            'use strict';

            var $dataList = $('#data-list'),
                $addDataPanel = $('#add-data'),
                memberList, activeList, leaderID,
                $member = $addDataPanel.find('.member'),
                $allMember = $addDataPanel.find('.all-member'),
                $activeMember = $addDataPanel.find('.active-member'),
                $leaderMember = $addDataPanel.find('.leader-member');

            // 追加成员
            function addMember() {
                var i = 0,
                    len = memberList.length,
                    pHtml = '',
                    aHtml = '',
                    lHtml = '',
                    id;
                for (; i < len; i++) {
                    id = memberList[i].DataID;
                    if ($.inArray(id, activeList) >= 0) {
                        aHtml += '<span title="点击删除成员" class="label label-danger" data-id="' + id +
                            '"><b>&times; </b>' + memberList[i].Name + '</span>&nbsp;';

                        lHtml += '<label style="margin-right:20px;"><input type="radio" name="LeaderID" value="' + id +
                            '" ' + (leaderID === id ? 'checked' : '') + '> ' + memberList[i].Name + '</label>';
                        continue;
                    }
                    pHtml += '<span title="点击添加成员" class="label label-success" data-id="' + id +
                        '"><b>+ </b>' + memberList[i].Name + '</span>&nbsp;';
                }
                $allMember.html(pHtml);
                $activeMember.html(aHtml);
                $leaderMember.html(lHtml)
            }

            // 获取已有成员
            function getSelfMember(id) {
                common.ajax({
                    notload: true,
                    title: '获取已有成员',
                    URL: '?Do=UserList&DataID=' + id,
                    good: function(data) {
                        activeList = data.DataList.map(function(ele) {
                            return ele.DataID;
                        });
                        addMember();
                    }
                });
            }

            // 成员分配
            (function () {
                // 添加成员
                $allMember.on('click', 'span', function() {
                    var id = $(this).data('id');
                    common.ajax({
                        title: '添加成员',
                        URL: '?Do=UserAdd&DataID=' + $addDataPanel.data('id') + '&UserID=' + id,
                        good: function (data) {
                            common.alert({
                                type: 'success',
                                title: '“添加成员”操作：',
                                msg: data.Message || '成功！'
                            });
                            activeList.push(id);
                            addMember();
                        }
                    });
                });

                // 删除成员
                $activeMember.on('click', 'span', function() {
                    var id = $(this).data('id');
                    common.ajax({
                        title: '删除成员',
                        URL: '?Do=UserCancel&DataID=' + $addDataPanel.data('id') + '&UserID=' + id,
                        good: function (data) {
                            common.alert({
                                type: 'success',
                                title: '“删除成员”操作：',
                                msg: data.Message || '成功！'
                            });
                            activeList = activeList.filter(function(ele) {
                                return ele !== id;
                            });
                            addMember();
                        }
                    });
                });
            }());

            // 编辑操作
            $dataList.on('click', '.btn-edit', function() {
                var id = $(this).closest('tr').data('id');
                $addDataPanel.data('id', id);
                common.ajax({
                    title: '编辑',
                    URL: '?Do=Query&DataID=' + id,
                    good: function(data) {
                        leaderID = data.LeaderID;
                        $addDataPanel.find('#DataID').val(data.DataID);
                        $addDataPanel.find('#Name').val(data.Name);
                        $addDataPanel.find('#Date').val(data.Date);
                        
                        $addDataPanel.modal('show');
                        // 开放团队成员操作
                        $member.prev().find('a').tab('show');
                        $member.removeClass('disabled');

                        if (!memberList) {
                            // 所有成员
                            common.ajax({
                                notload: true,
                                title: '获取所有成员',
                                URL: '/User/User.aspx?Do=ListAll',
                                good: function(data) {
                                    memberList = data.DataList;
                                    getSelfMember(id);
                                }
                            });
                            return;
                        }
                        getSelfMember(id);
                    }
                });
            });
            // 添加数据
            $('.btn-add-data').on('click', function () {
                $member.prev().find('a').tab('show');
                $member.addClass('disabled');
            });
            // 关联操作限制
            $member.on('click', function () {
                return !$member.hasClass('disabled');
            });

            // 店铺授权
            (function () {
                var $panelShoreAccredit = $('#shore-accredit'),
                    $allShore = $panelShoreAccredit.find('.all-shore-accredit'),
                    $activeAccredit = $panelShoreAccredit.find('.active-shore-accredit'),
                    AccreditList, activeList;
                // 追加店铺授权
                function addFreight() {
                    var i = 0,
                        len = AccreditList.length,
                        pHtml = '',
                        aHtml = '',
                        id;
                    for (; i < len; i++) {
                        id = AccreditList[i].DataID;
                        if ($.inArray(id, activeList) >= 0) {
                            aHtml += '<span title="点击取消店铺授权" class="label label-danger" data-id="' + id +
                            '"><b>&times; </b>' + AccreditList[i].Alias + '</span>&nbsp;';
                            continue;
                        }
                        pHtml += '<span title="点击添加店铺授权" class="label label-success" data-id="' + id +
                            '"><b>+ </b>' + AccreditList[i].Alias + '</span>&nbsp;';
                    }
                    $allShore.html(pHtml);
                    $activeAccredit.html(aHtml);
                }

                // 店铺授权设置
                $dataList.on('click', '.btn-shore-accredit', function() {
                    var id = $(this).closest('tr').data('id');
                    if (!AccreditList) {
                        // 所有店铺授权
                        common.ajax({
                            notload: true,
                            title: '获取所有店铺授权',
                            URL: '/OMS/Order.aspx?Do=ShopList',
                            good: function(data) {
                                AccreditList = data.DataList;
                                getSelfAccreditTeam(id);
                            }
                        });
                        return;
                    }

                    getSelfAccreditTeam(id);
                });

                // 获取已有店铺授权
                function getSelfAccreditTeam(id) {
                    common.ajax({
                        title: '获取自身店铺权限',
                        URL: '?Do=ShopList&DataID=' + id,
                        good: function(data) {
                            activeList = data.DataList.map(function(ele) {
                                return ele.DataID;
                            });;
                            addFreight();
                            $panelShoreAccredit.modal('show').data('id', id);
                        }
                    });
                }

                // 添加店铺授权
                $allShore.on('click', 'span', function() {
                    var id = $(this).data('id');
                    common.ajax({
                        title: '添加店铺授权',
                        URL: '?Do=ShopAdd&DataID=' + $panelShoreAccredit.data('id') + '&ShopID=' + id + '&Alias=' + $.trim($(this).text()).substr(2),
                        good: function (data) {
                            common.alert({
                                type: 'success',
                                title: '“添加店铺授权”操作：',
                                msg: data.Message || '成功！'
                            });
                            activeList.push(id);
                            addFreight();
                        }
                    });
                });

                // 取消店铺授权
                $activeAccredit.on('click', 'span', function() {
                    var id = $(this).data('id');
                    common.ajax({
                        title: '取消店铺授权',
                        URL: '?Do=ShopCancel&DataID=' + $panelShoreAccredit.data('id') + '&ShopID=' + id,
                        good: function (data) {
                            common.alert({
                                type: 'success',
                                title: '“取消店铺授权”操作：',
                                msg: data.Message || '成功！'
                            });
                            activeList = activeList.filter(function(ele) {
                                return ele !== id;
                            });
                            addFreight();
                        }
                    });
                });
            }());
        }());
    </script>
</body>
</html>
