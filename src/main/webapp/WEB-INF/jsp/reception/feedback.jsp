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

                    .fixed-bar {
                        position: fixed;
                        top: 70px;
                        right: 200px;
                        width: 300px;
                        height: auto;
                        background-color: #f5f5f5;
                    }

                    .notice-title {
                        overflow: hidden;
                        text-overflow: ellipsis;
                        white-space: nowrap;
                    }
                </style>
            </head>

            <body>
                <script src="../../../static/layui/layui.js"></script>
                <div class="layui-bg-gray layui-col-md-offset2 layui-col-md6" style="padding: 16px; height: auto;">
                    <span class="layui-breadcrumb" lay-separator=">">
                        <a>首页</a>
                        <a><cite>反馈中心</cite></a>
                    </span>
                    <div class="layui-form">
<%--                        <div class="layui-form-item" style="margin:15px 0px 0px ;">--%>
<%--                            <div class="layui-input-group layui-col-md12">--%>
<%--                                <div style="width: 300px;"></div>--%>
<%--                                <div class="layui-input-split layui-input-prefix">--%>
<%--                                    标题名称--%>
<%--                                </div>--%>
<%--                                <input type="text" placeholder="" class="layui-input">--%>
<%--                                <div class="layui-input-suffix">--%>
<%--                                    <button class="layui-btn layui-bg-blue">搜索</button>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
                        <div class="layui-fluid" id="LAY-component-grid-list">
                            <div class="layui-row layui-col-space10 demo-list">
                                <div class="layui-card" style="height: auto;">
                                    <div class="layui-card-body">
                                        <dl class="layuiadmin-card-status">
                                            <c:forEach items="${htlist}" var="ht">
                                                <dd>
                                                    <div>
                                                        <span><a href="htmsg?id=${ht.id}"
                                                                target="iframeMain">${ht.title}</a></span>
                                                        <p>${ht.nickname}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                            <fmt:formatDate value="${ht.boardtime}"
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
                <div class=" fixed-bar">
                    <a href="post" target="iframeMain" type="button" class="layui-btn layui-col-md12"
                        style="margin-bottom: 10px;">提交留言</a>
                    <div class="layui-bg-gray" style="padding: 10px;">
                        <div class="layui-row">
                            <div class="layui-col-md12">
                                <div class="layui-card">
                                    <div class="layui-card-header">最近回复</div>
<%--                                    <c:forEach items="${htlist}" var="ht">--%>
<%--                                        <c:if test="${ht.type==1}">--%>
<%--                                            <div class="layui-card-body">--%>
<%--                                                <span class="notice-title" style="max-width: 50px"><a--%>
<%--                                                        href="htmsg?id=${ht.id}">${ht.title}</a></span>--%>
<%--                                                <hr>--%>
<%--                                            </div>--%>
<%--                                        </c:if>--%>
<%--                                    </c:forEach>--%>
                                    <c:set var="count" value="0" scope="page"/>
                                    <c:forEach items="${htlist}" var="ht">
                                        <c:if test="${ht.type==1 && count < 3}">
                                            <div class="layui-card-body">
                                                <span class="notice-title" style="max-width: 50px"><a href="htmsg?id=${ht.id}">${ht.title}</a></span>
                                                <hr>
                                            </div>
                                            <c:set var="count" value="${count + 1}" scope="page"/>
                                        </c:if>
                                    </c:forEach>
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