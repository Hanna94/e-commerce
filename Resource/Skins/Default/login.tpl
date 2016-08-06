<html lang="cmn-Hans">
    <head>
        <meta charset="utf-8">
        <title>登录 迅易通 ERP</title>
        <link rel="shortcut icon" href="/Resource/Images/favicon.ico">
        <link href="/Resource/css/bootstrap.css" rel="stylesheet">
        <style>
            body {background-color: #fbfbfb;}

            article {
                max-width: 400px;
                margin: 10% auto 0 auto;
                padding: 20px;
                border: 1px solid #ddd;
                border-radius: 6px;
                background-color: #fff;
            }

            h3 {margin-top: 0;}

            .form-group {position: relative;}

            span.error {
                position: absolute;
                right: 0;
                top: -10px;
                padding: 2px 4px;
                background-color: #6386DE;
                border-radius: 4px;
                color: #fff;
                margin-right: 8px;
            }
        </style>
    </head>
    <body>
        <article>
            <h3>User Login</h3>
            <hr>
            <form method="post" action="/Login.aspx?Do=Login" autocomplete="off">
                <div class="form-group">
                    <input class="form-control" name="Name" type="text" placeholder="ID" required>
                </div>
                <div class="form-group">
                    <input class="form-control" name="PassWord" type="password" placeholder="Password" required>
                </div>
                <div class="form-group">
                    <input class="btn btn-default" type="submit" value="Go">
                </div>
            </form>
        </article>
        <script src="/Resource/js/jquery.js"></script>
        <script src="/Resource/js/validate.js"></script>
        <script>
            $(function () {
                'use strict';
                
                var $form = $('form');
                $form.validate({
                    errorElement: 'span',
                    rules: {
                        Name: {
                            required: true,
                            rangelength: [4, 12]
                        },
                        PassWord: {
                            required: true,
                            rangelength: [4, 20]
                        }
                    },
                    messages: {
                        Name: {
                            required: '用户名不能为空',
                            digits: '用户名由4~12个字符组成',
                            rangelength: '请输入4~12个字符组成的用户名'
                        },
                        PassWord: {
                            required: '密码不能为空',
                            digits: '密码由4~20个字符组成',
                            rangelength: '请输入4~20个字符组成的密码'
                        }
                    },
                    // 验证不通过
                    errorPlacement: function(error, element) {
                        $(element).closest('.form-group').append(error[0].outerHTML);
                    }
                });
            });
        </script>
    </body>
</html>
