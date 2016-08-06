<!DOCTYPE html>
<html lang="cmn-Hans">
<head>
    <meta charset="utf-8">
    <title>页面加载中，请稍等...</title>
    <link rel="shortcut icon" href="/Resource/Images/favicon.ico">
    <style>
        /* 加载图片*/
        body {
            margin: 0;
            background-color: #fbfbfb;
        }

        #loading {
            position: absolute;
            z-index: 10001;
            width: 100%;
            height: 100%;
            background-color: rgba(255, 255, 255, 0.6);
        }

        #loading img {
            position: relative;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }
    </style>
</head>
<body>
    <div id="loading">
        <img src="/Resource/Images/loading.gif">
    </div>
</body>
</html>