{页面属性}{/页面属性}
<body>
    {页顶导航}{/页顶导航}
    <!-- 内容-->
    <div id="data-list" class="container-fluid">
        <div id="password" class="panel panel-default maxW400 center-block">
            <div class="panel-heading">
                <h3 class="panel-title">修改密码</h3>
            </div>
            <div class="panel-body">
                <form class="form-horizontal">
                        <div class="form-group formMinheight">
                            <label for="OldPassWord" class="col-sm-4 col-lg-4 control-label">旧密码</label>
                            <div class="col-sm-8 col-lg-8">
                                <input type="password" id="OldPassWord" class="form-control" name="OldPassWord" placeholder="请输入旧密码" />
                                <span id="oldpwps" class="text-danger"></span>
                            </div>
                        </div>
                        <div class="form-group formMinheight">
                            <label for="NewPassWord" class="col-sm-4 col-lg-4 control-label">新密码</label>
                            <div class="col-sm-8 col-lg-8">
                                <div class="input-group">
                                    <input type="password" id="NewPassWord" class="form-control" name="NewPassWord" placeholder="请输入新密码" />
                                    <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-minus"></span>
                                    </span>
                                </div>
                                <span id="newpwps" class="text-danger"></span>
                            </div>
                        </div>
                        <div class="form-group formMinheight">
                            <label for="NewPassWordAgain" class="col-sm-4 col-lg-4 control-label">再次输入新密码</label>
                            <div class="col-sm-8 col-lg-8">
                            <div class="input-group">
                                <input type="password" id="NewPassWordAgain" class="form-control" name="NewPassWordAgain" placeholder="请再次输入新密码" />
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-minus"></span>
                                </span>
                            </div>
                                <span id="newpwaps" class="text-danger"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 col-lg-4 control-label">密码可见</label>
                            <div class="col-sm-8 col-lg-8">
                                <span id="pwEye" data-eye="close" class="glyphicon glyphicon-eye-close mg-t-10"></span>
                            </div>
                        </div>
                </form>
            </div>
            <div class="panel-footer clearfix">
                <button id="PWconfirm" class="btn btn-default pull-right" type="button">确认</button>
            </div>
        </div>
    </div>

    {页面底部}{/页面底部}
    
    <script>
        (function(){
            'use strict';

            var Str_Name = "<!-- BEGIN 当前用户名称 ATTRIB= --><!-- END 当前用户名称 -->",
                $pwEye = $('#pwEye'),
                $newPW = $('#NewPassWord'),
                $newPWA = $('#NewPassWordAgain'),
                $oldPW = $('#OldPassWord'),
                $oldpwps = $('#oldpwps'),
                $newpwps = $('#newpwps'),
                $newpwaps = $('#newpwaps'),
                $PWconfirm = $('#PWconfirm');

            // 密码可见按钮
            $pwEye.on('click', function(){
                var ts = $(this),
                    eye = ts.attr('data-eye');

                switch(eye){
                    case "close":
                        $newPW.attr('type', 'text');
                        $newPWA.attr('type', 'text');
                        $oldPW.attr('type', 'text');
                        break;
                    case "open":
                        $newPW.attr('type', 'password');
                        $newPWA.attr('type', 'password');
                        $oldPW.attr('type', 'password');
                        break;
                }

                eye === "close" ? eye = "open" : eye = "close";
                $pwEye.removeClass().addClass('glyphicon glyphicon-eye-' + eye + ' mg-t-10').attr('data-eye', eye);
            });

            // 密码强度正则
            (function(){
                var PWRlength = /^.{8,16}$/,
                    PWRcapital = /[A-Z]+/,
                    PWRlowercase = /[a-z]+/,
                    PWRnum = /[0-9]+/;

                $newPW[0].oninput = function(){
                    var newval = $newPW.val();
                    if (newval === null || newval === '') {
                        $newpwps.html('');
                        $newPW.next().html('<span class="glyphicon glyphicon-minus"></span>');
                    }else{
                        $newPW.next().html('<span class="glyphicon glyphicon-remove-sign" style="color: rgb(255, 0, 0);"></span>');
                        if(!PWRlength.test(newval)){
                            $newpwps.text('密码长度必须在8~16位之间！');
                        }else if(!PWRcapital.test(newval)){
                            $newpwps.text('密码必须含有大写字母！');
                        }else if(!PWRlowercase.test(newval)){
                            $newpwps.text('密码必须含有小写字母！');
                        }else if(!PWRnum.test(newval)){
                            $newpwps.text('密码必须含有数字！');
                        }else{
                            $newpwps.text('');
                            $newPW.next().html('<span class="glyphicon glyphicon-ok" style="color: rgb(0, 198, 0);"></span>');
                        }
                    }
                    
                };
            })();

            //验证第二次输入与第一次是否匹配
            (function(){
                $newPWA[0].oninput = function(){
                    var newPWval = $newPW.val(),
                        newPWvalA = $newPWA.val();
                    if (newPWvalA === null || newPWvalA === '') {
                        $newpwaps.html('');
                        $newPWA.next().html('<span class="glyphicon glyphicon-minus"></span>');
                    }else if(newPWvalA !== newPWval){
                        $newpwaps.text('两次密码输入不一致！');
                        $newPWA.next().html('<span class="glyphicon glyphicon-remove-sign" style="color: rgb(255, 0, 0);"></span>');
                    }else{
                        $newpwaps.html('');
                        $newPWA.next().html('<span class="glyphicon glyphicon-ok" style="color: rgb(0, 198, 0);"></span>');
                    }
                }
            })();

            //提交
            $PWconfirm.on('click', function(){
                $.ajax({
                    url: '/user/API/?Do=SetPassWord',
                    
                    type: 'post',
                    data: {
                        Name: Str_Name,
                        OldPassWord: $oldPW.val(),
                        NewPassWord: $newPW.val()
                    },
                    success: function(data){
                        var d = data;
                        if (d.Ack) {
                            common.alert({
                                type: 'success',
                                title: '修改密码',
                                msg: '成功！'
                            });
                            setTimeout(jump, 1000);
                        }else{
                            common.alert({
                                title: '修改密码',
                                msg: '失败!' + '后台反馈：' + d.LogError
                            });
                        }
                    },
                    error: function(data, status, e){
                        common.alert({
                            title: '修改密码',
                            msg: '失败！' + '后台反馈：' + data.LogError + '   error' + e
                        });
                    }
                });
            });

            //跳转页面
            function jump(){
                location.href = "/Logout.aspx";
            }

        })();
    </script>
</body>
</html>
