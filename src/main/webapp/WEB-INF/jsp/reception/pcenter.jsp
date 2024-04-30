<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <!DOCTYPE html>
    <html>

    <head>
      <meta charset="utf-8">
      <title>自定义固定条示例 - Layui</title>
      <meta name="renderer" content="webkit">
      <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <link href="../../../static/layui/css/layui.css" rel="stylesheet">
      <link rel="stylesheet" href="../../../static/css/pcenter.css">
    </head>

    <body>
      <div class="container- layui-bg-gray layui-col-md-offset2 layui-col-md8 " style="padding:0px 16px; height: auto;">
        <div class="layui-side-scroll grzc-" style="width: 200px;">
          <ul class="layui-nav layui-bg-gray" style="text-align: center; padding: 0px;">
            <li class="layui-nav-item" style="width: 120px;"><a href="info?id=${sessionScope.user.id}" target="ifr">个人中心</a></li>
            <li class="layui-nav-item" style="width: 120px;"><a href="info1?id=${sessionScope.user.id}" target="ifr">我的帖子</a></li>
            <li class="layui-nav-item" style="width: 120px;"><a href="info2?id=${sessionScope.user.id}" target="ifr">我的评论</a></li>
          </ul>
        </div>
        <div class="grzc-" style="width: 740px;">
          <iframe id="ifr" name="ifr" class="layui-card layui-panel" frameborder="0" src="info?id=${sessionScope.user.id}"
            style="width: 790px; min-height:630px;height: auto;">

          </iframe>
        </div>
      </div>
      <script src="../../../static/layui/layui.js"></script>
    </body>

    </html>