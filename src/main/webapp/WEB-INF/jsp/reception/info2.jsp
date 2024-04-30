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
                <div class="layui-fluid" id="LAY-component-grid-list">
                    <div class="layui-row layui-col-space10 demo-list">
                        <div class="layui-card" style="height: auto;">
                            <div class="layui-card-body">
                                <dl class="layuiadmin-card-status">
                                    <c:forEach items="${info2}" var="info">
                                        <dd>
                                            <div>
                                                <p class="truncate"><a href="
                                                <c:choose>
                                                    <c:when test="${info.type ==0}">
                                                        /detail?id=${info.refid}
                                                    </c:when>
                                                    <c:otherwise>
                                                        /tzmsg?id=${info.refid}
                                                    </c:otherwise>
                                                </c:choose>" class="content-ellipsis" target="iframeMain">${info.content}</a></p>
                                                <span>
                                                    <fmt:formatDate value="${info.commenttime}"
                                                        pattern="yyyy-MM-dd HH:mm:ss" />
                                                </span>
                                            </div>
                                            <button type="button" class="layui-btn layui-btn-xs" style="margin-left: auto;" data-id="${info.id}">删除</button>
                                        </dd>
                                    </c:forEach>
                                </dl>
<%--                                <center id="demo-laypage-normal"></center>--%>
                            </div>
                        </div>
                    </div>
                </div>
                <script>
                    layui.use(['laypage','jquery'],function () {
                        var laypage = layui.laypage
                        var $ = layui.jquery
                        // 普通用法
                        // laypage.render({
                        //     elem: 'demo-laypage-normal',
                        //     count: 50 // 数据总数
                        // })
                        $('.layui-btn-xs').on('click', function (event) {
                            event.preventDefault();
                            var $btn = $(this);
                            var id = $(this).data('id');
                            console.log(id)
                            layer.confirm('真的删除吗', function (index) {
                                $.ajax({
                                    url: 'dc',
                                    data: {'id': id},
                                    method: 'get',
                                    success: function (req) {
                                        $btn.closest('dd').remove();
                                        console.log((req))
                                        layer.close(index);
                                    }
                                })
                            })
                        });
                    });
                </script>
            </body>

            </html>