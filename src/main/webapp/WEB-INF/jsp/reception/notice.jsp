<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <title>失物招领平台</title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport"
              content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
        <link rel="stylesheet" href="../../../static/layui/css/layui.css" media="all">
        <link rel="stylesheet" href="../../../static/layuiadmin/style/admin.css" media="all">
        <style>
            #LAY-component-grid-list .demo-list .layui-card {
                height: 267px;
            }
        </style>
    </head>

    <body>
        <script src="../../../static/layui/layui.js"></script>
        <div class="layui-bg-gray layui-col-md-offset2 layui-col-md8" style="padding: 16px; height: auto;">
        <span class="layui-breadcrumb" lay-separator=">">
          <a>首页</a>
          <a><cite>公告列表</cite></a>
        </span>
            <div class="layui-form">
                <div class="layui-fluid" id="LAY-component-grid-list">
                    <div class="layui-row layui-col-space10 demo-list">
                        <div class="layui-card" style="height: auto;">
                            <div class="layui-card-body">
                                <dl class="layuiadmin-card-status">
                                    <c:forEach items="${noclist}" var="mm">
                                        <dd>
                                            <div>
                                                        <span><a href="nocmsg?id=${mm.id}"
                                                                 target="iframeMain">${mm.title}</a></span>
                                                <p>${mm.nickname}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <fmt:formatDate value="${mm.releasetime}"
                                                                    pattern="yyyy-MM-dd HH:mm:ss" />
                                                </p>
                                            </div>
                                        </dd>
                                    </c:forEach>
                                </dl>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            layui.config({
                base: '../../../static/layuiadmin/' //静态资源所在路径
            }).extend({
                index: 'lib/index' //主入口模块
            }).use(['index', 'laydate', 'jquery'], function () {
                var laydate = layui.laydate
                var $ = layui.$
                // 渲染
                laydate.render({
                    elem: '#ID-laydate'
                })
            });
        </script>
    </body>

</html>