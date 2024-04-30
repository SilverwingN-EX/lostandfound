<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="utf-8">
        <title>失物招领后台管理</title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport"
            content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
        <link rel="stylesheet" href="../../../static/layuiadmin/layui/css/layui.css" media="all">
        <link rel="stylesheet" href="../../../static/layuiadmin/style/admin.css" media="all">
    </head>

    <body class="layui-layout-body">

        <div id="LAY_app">
            <div class="layui-layout layui-layout-admin">
                <div class="layui-header">
                    <!-- 头部区域 -->
                    <ul class="layui-nav layui-layout-left">
                        <li class="layui-nav-item layadmin-flexible" lay-unselect>
                            <a href="javascript:;" layadmin-event="flexible" title="侧边伸缩">
                                <i class="layui-icon layui-icon-shrink-right" id="LAY_app_flexible"></i>
                            </a>
                        </li>
                    </ul>
                    <ul class="layui-nav layui-layout-right" lay-filter="layadmin-layout-right">
                        <li class="layui-nav-item layui-hide-xs" lay-unselect>
                            <a href="javascript:;" layadmin-event="theme">
                                <i class="layui-icon layui-icon-theme"></i>
                            </a>
                        </li>
                        <li class="layui-nav-item layui-hide-xs" lay-unselect>
                            <a href="javascript:;" layadmin-event="note">
                                <i class="layui-icon layui-icon-note"></i>
                            </a>
                        </li>
                        <li class="layui-nav-item layui-hide-xs" lay-unselect>
                            <a href="javascript:;" layadmin-event="fullscreen">
                                <i class="layui-icon layui-icon-screen-full"></i>
                            </a>
                        </li>
                        <li class="layui-nav-item" lay-unselect>
                            <a href="javascript:;">
                                <cite>${admin.nickname}</cite>
                            </a>
                            <dl class="layui-nav-child">
                                    <dd style="text-align: center;"><a href="/">退出</a></dd>
                            </dl>
                        </li>

                        <li class="layui-nav-item layui-hide-xs" lay-unselect>
                            <a href="javascript:;" layadmin-event="about"><i
                                    class="layui-icon layui-icon-more-vertical"></i></a>
                        </li>
                        <li class="layui-nav-item layui-show-xs-inline-block layui-hide-sm" lay-unselect>
                            <a href="javascript:;" layadmin-event="more"><i
                                    class="layui-icon layui-icon-more-vertical"></i></a>
                        </li>
                    </ul>
                </div>

                <!-- 侧边菜单 -->
                <div class="layui-side layui-side-menu">
                    <div class="layui-side-scroll">
                        <div class="layui-logo" lay-href="home/console.html">
                            <span>失物招领系统</span>
                        </div>

                        <ul class="layui-nav layui-nav-tree" lay-shrink="all" id="LAY-system-side-menu"
                            lay-filter="layadmin-system-side-menu">
                            <li data-name="home" class="layui-nav-item layui-nav-itemed">
                                <a href="javascript:;" lay-tips="主页" lay-direction="2">
                                    <i class="layui-icon layui-icon-home"></i>
                                    <cite>主页</cite>
                                </a>
                                <dl class="layui-nav-child">
                                    <dd data-name="console" class="layui-this">
                                        <a lay-href="admin/adminp">个人中心</a>
                                    </dd>
                                </dl>
                            </li>
                            <li data-name="component" class="layui-nav-item">
                                <a href="javascript:;" lay-tips="用户管理" lay-direction="2">
                                    <i class="layui-icon layui-icon-component"></i>
                                    <cite>用户管理</cite>
                                </a>
                                <dl class="layui-nav-child">
                                    <dd data-name="button">
                                        <a lay-href="admin/userlist">用户列表</a>
                                    </dd>
                                </dl>
                            </li>
                            <li data-name="app" class="layui-nav-item">
                                <a href="javascript:;" lay-tips="应用" lay-direction="2">
                                    <i class="layui-icon layui-icon-app"></i>
                                    <cite>反馈中心</cite>
                                </a>
                                <dl class="layui-nav-child">
                                    <dd data-name="board">
                                        <a lay-href="admin/board">反馈</a>
                                    </dd>
                                </dl>
                            </li>
<%--                            <li data-name="senior" class="layui-nav-item">--%>
<%--                                <a href="javascript:;" lay-tips="高级" lay-direction="2">--%>
<%--                                    <i class="layui-icon layui-icon-senior"></i>--%>
<%--                                    <cite>高级</cite>--%>
<%--                                </a>--%>
<%--                                <dl class="layui-nav-child">--%>
<%--                                    <dd>--%>
<%--                                        <a layadmin-event="im">LayIM 通讯系统</a>--%>
<%--                                    </dd>--%>
<%--                                    <dd data-name="echarts">--%>
<%--                                        <a href="javascript:;">Echarts集成</a>--%>
<%--                                        <dl class="layui-nav-child">--%>
<%--                                            <dd><a lay-href="senior/echarts/map.html">地图</a></dd>--%>
<%--                                        </dl>--%>
<%--                                    </dd>--%>
<%--                                </dl>--%>
<%--                            </li>--%>
<%--                            <li data-name="set" class="layui-nav-item">--%>
<%--                                <a href="javascript:;" lay-tips="设置" lay-direction="2">--%>
<%--                                    <i class="layui-icon layui-icon-set"></i>--%>
<%--                                    <cite>评论</cite>--%>
<%--                                </a>--%>
<%--                                <dl class="layui-nav-child">--%>
<%--                                    <dd class="layui-nav-itemed">--%>
<%--                                        <a href="javascript:;">评论</a>--%>
<%--                                    </dd>--%>
<%--                                    <dd class="layui-nav-itemed">--%>
<%--                                        <a href="javascript:;">回复</a>--%>
<%--                                    </dd>--%>
<%--                                </dl>--%>
<%--                            </li>--%>
                            <li data-name="user" class="layui-nav-item">
                                <a href="javascript:;" lay-tips="用户" lay-direction="2">
                                    <i class="layui-icon layui-icon-user"></i>
                                    <cite>公告管理</cite>
                                </a>
                                <dl class="layui-nav-child">
                                    <dd>
                                        <a lay-href="admin/noc">公告列表</a>
                                    </dd>
                                </dl>
                            </li>
                        </ul>
                    </div>
                </div>

                <!-- 页面标签 -->
                <div class="layadmin-pagetabs" id="LAY_app_tabs">
                    <div class="layui-icon layadmin-tabs-control layui-icon-prev" layadmin-event="leftPage"></div>
                    <div class="layui-icon layadmin-tabs-control layui-icon-next" layadmin-event="rightPage"></div>
                    <div class="layui-icon layadmin-tabs-control layui-icon-down">
                        <ul class="layui-nav layadmin-tabs-select" lay-filter="layadmin-pagetabs-nav">
                            <li class="layui-nav-item" lay-unselect>
                                <a href="javascript:;"></a>
                                <dl class="layui-nav-child layui-anim-fadein">
                                    <dd layadmin-event="closeThisTabs"><a href="javascript:;">关闭当前标签页</a></dd>
                                </dl>
                            </li>
                        </ul>
                    </div>
                    <div class="layui-tab" lay-unauto lay-allowClose="true" lay-filter="layadmin-layout-tabs">
                        <ul class="layui-tab-title" id="LAY_app_tabsheader">
                            <li lay-id="home/console.html" lay-attr="home/console.html" class="layui-this"><i
                                    class="layui-icon layui-icon-home"></i></li>
                        </ul>
                    </div>
                </div>


                <!-- 主体内容 -->
                <div class="layui-body" id="LAY_app_body">
                    <div class="layadmin-tabsbody-item layui-show">
                        <iframe src="admin/adminp" frameborder="0" class="layadmin-iframe"></iframe>
                    </div>
                </div>

                <!-- 辅助元素，一般用于移动设备下遮罩 -->
                <div class="layadmin-body-shade" layadmin-event="shade"></div>
            </div>
        </div>

        <script src="../../../static/layuiadmin/layui/layui.js"></script>
        <script>
            layui.config({
                base: '../../../static/layuiadmin/' //静态资源所在路径
            }).extend({
                index: 'lib/index' //主入口模块
            }).use('index');
        </script>

    </body>

    </html>