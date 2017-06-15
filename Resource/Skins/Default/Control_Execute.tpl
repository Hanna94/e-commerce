{页面属性}{/页面属性}
<body>
    <!-- 获取数据后的内容-->
    <div id="API-Data" class="container">
        <div class="row">
            <div class="col-sm-offset-2 col-sm-8">
                <button type="button" class="btn btn-danger btn-sm center-block" data-api="/Control/Plan.aspx?Do=TaskGet&QueryLimitNumber={QueryLimitNumber}&Model={Model}">获取{Model}数据</button>
                <ul class="list-group"></ul>
            </div>
        </div>
    </div>
   
    {页面底部}{/页面底部}

    <script>
        (function () {
            'use strict';
            
            var $APIData = $('#API-Data');

            $APIData.find('button').on('click', function() {
                var $btn = $(this);
                $btn.prop('disabled', true);
                if ($btn.attr('status')) {
                    $btn.prop('disabled', true);
                } else {
                    APIControl($btn);
                    $btn.attr('status', true);
                }
            });

            function APIControl($btn) {
                var $APIDataList = $btn.next();
                API_1();
                    
                // API·1
                // 获取需要访问的接口与数据
                function API_1() {
                    $.ajax({
                        url: $btn.data('api'),
                        success: function(data) {

                            // 判断是否错误与列表长度
                            if (data.Ack && data.DataList.length) {
                                appendData('info', data.Message || '获取API·1成功，并且有数据！');
                                batch(data.DataList);
                            } else {
                                appendData('info', data.Message || '获取API·1失败，或者无数据！', '60秒后继续发送请求...');
                                // 获取API·1失败
                                // 或者没有数据，延迟1分钟执行
                                setTimeout(function () {
                                    API_1();
                                }, 60 * 1000);
                            }
                        },
                        error: function () {
                            appendData('danger', '获取API·1失败！', '5秒后重新发送请求...');
                            // 获取API·1错误
                            // 延迟5秒钟执行
                            setTimeout(function () {
                                API_1();
                            }, 5 * 1000);
                        }
                    });
                }

                // 批量处理
                function batch(list) {
                    var i = 0,
                        record = 0, // 记录API·1返回的列表执行完成条数
                        len = list.length,
                        interval;

                    for (; i < len; i++) {
                        (function (ele) {
                            // 判断存不存在Api字段
                            if (ele.Api) {
                                API_2(ele.Api);
                            } else {
                                API_2(ele.PlanApi + '?' + ele.Parameter);
                            }
                        }(list[i]));
                    }

                    // API·2
                    // 获取数据，显示到页面
                    function API_2(URL) {
                        $.ajax({
                            url: URL,
                            success: function (data) {
                                appendData(data.Ack ? (data.Message ? 'success' : 'info') : 'danger',
                                    data.Message || '获取API·2单条数据结束，无Message！');

                                // 判断是否存在下一页的特殊数据
                                var page = +data.Page, oParam,
                                    search = '?' + URL.split('?')[1];

                                if (data.NextPage) {
                                    oParam = common.URL.parse(search);
                                    oParam.CallStart = data.CallStart;
                                    oParam.CallEnd = data.CallEnd;
                                    search = common.URL.stringify(oParam);
                                    API_2(URL.split('?')[0] + search);

                                // 如果总页数大于当前页
                                // 则执行下一个API·2    
                                } else if (+data.QueryPages > page) {
                                    oParam = common.URL.parse(search);
                                    oParam.Page = page + 1;
                                    search = common.URL.stringify(oParam);
                                    API_2(URL.split('?')[0] + search);
                                } else {
                                    record ++;
                                }
                            }, error: function () {
                                appendData('danger', '获取API·2失败！');
                            }
                        });
                    }

                    // 轮询判断是否执行完所有API·1返回的列表
                    interval = setInterval(function () {
                        if (record === len) {
                            // 执行完所有API·2
                            appendData('info', '获取API·2全部数据结束！', '5秒后继续发送请求...');

                            // 延迟5分钟之后
                            // 继续执行API·1
                            setTimeout(function () {
                                API_1();
                            }, 5 * 1000);

                            clearInterval(interval);
                        }
                    }, 100);
                }

                // 追加数据
                function appendData(type, text, em) {
                    // 判断个数，超过100条，前面的删掉
                    if ($APIDataList.children().length > 100) {
                        $APIDataList.find('li:lt(50)').remove();
                    }

                    var time = new Date(),
                        datatime = common.date.format(0, time),
                        t = common.date.format(2, time);

                    $APIDataList.append('<li class="list-group-item list-group-item-' + type + '">' + text +
                        (em ? '<br><strong>' + em + '</strong>' : '') +
                        '<time class="pull-right" datetime="' +
                            datatime + '">' + t + '</time></li>');

                    $APIDataList.animate({scrollTop: $APIDataList.scrollTop() + $APIDataList.height()});
                }

                // 轮询数据错误或者服务器崩溃
                // 10分钟间隔轮询
                setInterval(function () {
                    // 与现在时间超过20分钟
                    // 则重新启动
                    var lastTime = +$APIDataList.children().eq(-1).find('time').attr('datetime'),
                        now = +new Date();

                    if (lastTime + (20 * 60 * 1000) < now) {
                        appendData('warning', '远程服务器崩溃或请求超时20分钟！', '现在启动API·1请求...');
                        API_1();
                    }

                }, 10 * 60 * 1000);
            }
        }());
    </script>
</body>
</html>
