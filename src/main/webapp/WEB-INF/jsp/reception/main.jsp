<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
        <!-- <link rel="stylesheet" href="../../static/layuiadmin/layui/css/layui.css" media="all"> -->
        <link rel="stylesheet" href="../../static/layui/css/layui.css" media="all">
        <link rel="stylesheet" href="../../static/css/main.css">
        <!-- <link rel="stylesheet" href="../../static/layuiadmin/style/admin.css" media="all"> -->
    </head>

    <body>
        <!-- <script src="../../static/layuiadmin/layui/layui.js"></script> -->
        <script src="../../static/layui/layui.js"></script>
        <center>
            <div class="layui-carousel" id="ID-carousel-demo-image">
                <div carousel-item>
                    <div><img src="upload/1.png"></div>
                    <div><img src="upload/img.png"></div>
                </div>
            </div>
        </center>
        <div class="layui-col-md-offset2 layui-col-md8">
            <table>
                <tr>
                    <td>公告</td>
                    <td class="notice-title">&nbsp;<a href="nocmsg?id=1">${nc.title}</a></td>
                    <td class="right-align"><fmt:formatDate value="${nc.releasetime}"
                                                            pattern="yyyy-MM-dd HH:mm:ss" /></td>
                    <td class="right-align"><a href="notice">更多➕</a></td>
                </tr>
            </table>
        </div>
        <div class="layui-bg-gray layui-col-md-offset2 layui-col-md8" style="padding: 16px; height: auto;">
            <div class="layui-row layui-col-space15">
                <div class="layui-col-md8">
                    <div class="layui-card">
                        <div class="layui-card-header">失物招领平台</div>
                        <div class="layui-card-body" style="height: auto; display: inline-block;">
                            <img src="../../static/images/swzl.jpg" align="left"
                                 style="width: 50%;height: 100%;margin-right: 10px;">
                            <span>失物招领系统,
                  角色：分为用户、管理员
                  分为前台和网站
                  前台功能有注册、登录、首页（展示失物信息）、发布失物、失物认领、发布帖子、评论帖子、回复帖子。
                  后台主要有：
                  登录：管理员登录
                  用户管理：管理用户信息（修改、删除、查询）
                  失物管理：管理用户发布的失物信息
                  公告管理：管理公告信息
                  认领管理：管理认领信息（增删改查）
                  帖子管理: 管理帖子信息
                  评论管理：管理评论信息
                  回复管理：管理回复信息
                  数据统计：统计失物数量等（饼状或者柱状）
                  个人信息修改：查看和修改个人信息
                </span>
                        </div>
                    </div>
                </div>
                <div class="layui-col-md4">
                    <div class="layui-card">
                        <div class="layui-card-header">最近帖子<a class="layui-col-md-offset7" href="forum">更多➕</a>
                        </div>
                        <div class="layui-card-body" style="height: 332px;">
                            <dl>
                                <c:forEach items="${fos}" begin="0" end="4" var="m2">
                                    <dd>
                                        <div>
                                            <p><a href="tzmsg?id=${m2.id}">${m2.title}</a></p>
                                            <span>
                                                    <fmt:formatDate value="${m2.posttime}"
                                                                    pattern="yyyy-MM-dd HH:mm:ss"/>
                                                </span>
                                        </div>
                                    </dd>
                                    <hr>
                                </c:forEach>
                            </dl>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="layui-bg-gray layui-col-md-offset2 layui-col-md8">
            <div class="layui-row layui-col-space15">
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <div class="layui-card-header">失物列表<a class="layui-col-md-offset10" href="fl?id=0">更多➕</a>
                        </div>
                        <div class="layui-card-body" style="height: auto; display: inline-block;">
                            <div class="box">
                                <!-- 轮播列表 -->
                                <ul>
                                    <!-- 轮播主图 -->
                                    <c:forEach items="${fs}" begin="0" end="7" var="ms">
                                        <li><a href="detail?id=${ms.id}"><img src="upload/${ms.picture}" alt="${ms.id}">4</a>
                                        </li>
                                    </c:forEach>
                                    <!-- 轮播完成防止留白 -->
                                    <!-- 怎么确定尾部需要几张防止留白，3 张是怎么得出的？其实就是上面： 盒子宽度 / 单个图片宽度 = 一屏几张留白图 -->
                                    <c:forEach items="${fs}" begin="0" end="3" var="ms">
                                        <li><a href="detail?id=${ms.id}"><img src="upload/${ms.picture}"
                                                                              alt="${ms.id}"></a></li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="layui-bg-gray layui-col-md-offset2 layui-col-md8">
            <div class="layui-row layui-col-space15">
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <div class="layui-card-header">最新公告<a class="layui-col-md-offset10" href="notice">更多➕</a>
                        </div>
                        <div class="layui-card-body layui-col-md12" style="height: auto; display: inline-block;">
                            <div class="layui-timeline">
                                <c:forEach items="${fb}" begin="0" end="4" var="m3">
                                    <div class="layui-timeline-item layui-col-md12">
                                        <i class="layui-icon layui-timeline-axis"></i>
                                        <div class="layui-timeline-content layui-text">
                                            <h3 class="layui-timeline-title">${m3.title}</h3>
                                            <p><fmt:formatDate value="${m3.boardtime}"
                                                               pattern="yyyy-MM-dd HH:mm:ss" /></p>
                                            <hr>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            layui.use(function () {
                var carousel = layui.carousel
                // 渲染 - 图片轮播
                carousel.render({
                    elem: '#ID-carousel-demo-image',
                    width: '720px',
                    height: '360px',
                    interval: 3000
                })
            });
        </script>
    </body>

</html>