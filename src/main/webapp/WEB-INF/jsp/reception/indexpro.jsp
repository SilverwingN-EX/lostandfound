<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>失物招领系统</title>
    <!-- 请勿在项目正式环境中引用该 layui.css 地址 -->
    <link href="../../../static/layui/css/layui.css" rel="stylesheet">
  </head>

  <body>
    <!-- 请勿在项目正式环境中引用该 layui.js 地址 -->
    <script src="../../../static/layui/layui.js"></script>
    <ul class="layui-nav layui-bg-gray">
      <img class="layui-col-md-offset1" src="../../../static/images/image.png" style="margin:0px 50px 0px 200px">
      <li class="layui-nav-item layui-this"><a href="main" target="iframeMain">首页</a></li>
      <li class="layui-nav-item"><a href="fl?id=0" target="iframeMain">失物大厅</a></li>
      <li id="lt" class="layui-nav-item"><a href="forum" target="iframeMain">论坛中心</a></li>
      <li class="layui-nav-item"><a href="feedback" target="iframeMain">反馈中心</a></li>
      <li class="layui-nav-item"><a href="notice" target="iframeMain">公告信息</a></li>
      <li class="layui-nav-item"><a href="login">后台管理</a></li>
      <c:if test="${empty user}">
      <li id="lr" class="layui-nav-item layui-col-md-offset1" lay-unselect>
        <button type="button" id="login" class="layui-btn layui-btn-radius">登录</button>
        <button type="button" id="reg" class="layui-btn layui-btn-radius" style="margin-left: 10px;">注册</button>
      </li>
      </c:if>
      <c:if test="${not empty user}">
      <li id="user" class="layui-nav-item layui-col-md-offset1" lay-unselect>
        <a href="javascript:;">
          <img src="upload/${user.photo}" alt="${user.id}" class="layui-nav-img">
        </a>
        <dl class="layui-nav-child">
          <dd><a href="user/pcenter" target="iframeMain">个人中心</a></dd>
          <hr>
          <dd id="exit" style="text-align: center;"><a href="loginback">退出</a></dd>
        </dl>
      </li>
      </c:if>
    </ul>
    <iframe class="layadmin-iframe layui-col-md8" id="iframeMain" name="iframeMain" frameborder="0" src="main"
            style="width: 100%; height: 647px;"></iframe>
    <script type="text/javascript">
      layui.use(['jquery'], function () {
        var $ = layui.jquery
        $('#login').on('click', function () {
          window.location.href = 'lg'
        })
        $('#reg').on('click', function () {
          window.location.href = 'reg'
        })
      });
    </script>

  </body>

</html>