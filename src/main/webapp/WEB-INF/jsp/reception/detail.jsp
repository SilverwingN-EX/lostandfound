<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <title>失物/招领大厅</title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport"
              content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
        <link rel="stylesheet" href="../../../static/layui/css/layui.css" media="all">
        <link href="../../../static/editor/css/style.css" rel="stylesheet">

        <style>
            .layui-table td {
                padding: 12px 6px;
                word-break: break-all;
                border-color: #e6e6e6 !important;
            }

            .layui-table thead tr th,
            .layui-table tbody tr td {
                background-color: transparent !important;
                color: #333;
            }

            .layui-table thead tr th {
                font-weight: bold;
                text-align: left;
            }

            .layui-table span {
                margin-right: 10px;
                color: #999;
            }

            tablelayuiadmin-page-table {
                margin-bottom: 20px;
            }

            #editor—wrapper {
                border: 1px solid #ccc;
                z-index: 100;
                /* 按需定义 */
            }

            #toolbar-container {
                border-bottom: 1px solid #ccc;
            }

            #editor-container {
                height: 200px;
            }
        </style>
    </head>

    <body>
        <script src="../../../static/editor/index.js"></script>
        <div class="layui-bg-gray layui-col-md-offset2 layui-col-md8" style="padding: 16px; height: auto;">
                    <span class="layui-breadcrumb" lay-separator=">">
                        <a>首页</a>
                        <a><cite>失物大厅</cite></a>
                    </span>

            <div class="layui-row layui-col-space15" style="margin:10px 0px 0px ;">
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <div class="layui-card-body layui-col-md12"
                             style="height: auto; display: inline-block;">
                            <img src="/upload/${msg.picture}" align="left" alt="${msg.id}"
                                 style="min-width: 300px;min-height: 350px; width: 40%;height: 100%;margin-right: 10px;">
                            <div class="layui-col-sm7">
                                <div class="layui-card">
                                    <div class="layui-card-header">
                                        <c:choose>
                                            <c:when test="${msg.type ==0}">
                                                ${msg.name}
                                            </c:when>
                                            <c:otherwise>
                                                ${msg.lostname}
                                            </c:otherwise>
                                        </c:choose>
                                        <%--                                                <c:if test="${msg.type ==0}">--%>
                                        <%--                                                    --%>
                                        <%--                                                </c:if>--%>
                                        <%--                                                <c:if test="${msg.type ==1}">--%>
                                        <%--                                                    --%>
                                        <%--                                                </c:if>--%>
                                    </div>
                                    <div class="layui-card-body">
                                        <table class="layui-table layuiadmin-page-table" lay-skin="line"
                                               style="width: 100%;">
                                            <thead>
                                            <tr>
                                                <th><span>信息类别</span></th>
                                                <th>详细信息</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td><span>丢失地点：</span></td>
                                                    <td>
                                                        <c:if test="${msg.type ==0}">
                                                            <c:out value="${msg.findplace}"/>
                                                        </c:if>
                                                        <c:if test="${msg.type ==1}">
                                                            <c:out value="${msg.lostplace}"/>
                                                        </c:if>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td><span>丢失时间：</span></td>
                                                    <td>
                                                        <c:if test="${msg.type ==0}">
                                                            <fmt:formatDate value="${msg.findtime}"
                                                                            pattern="yyyy-MM-dd HH:mm:ss"/>
                                                        </c:if>
                                                        <c:if test="${msg.type ==1}">
                                                            <fmt:formatDate value="${msg.losttime}"
                                                                            pattern="yyyy-MM-dd HH:mm:ss"/>
                                                        </c:if>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td><span>用户名：</span></td>
                                                    <td>${msg.nickname}</td>
                                                </tr>
                                                <tr>
                                                    <td><span>手机：</span></td>
                                                    <td>${msg.phone}</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="layui-tab layui-tab-card">
                <ul class="layui-tab-title">
                    <li class="layui-this">详细描述</li>
                    <li>评论</li>
                </ul>
                <div class="layui-tab-content">
                    <div class="layui-tab-item layui-show">${msg.detail}</div>
                    <div class="layui-tab-item" style="margin: 0px 15px;">
                        <div id="editor—wrapper">
                            <div id="toolbar-container"><!-- 工具栏 --></div>
                            <div id="editor-container"><!-- 编辑器 --></div>
                        </div>
                        <div class="layui-col-md-offset11" style="margin-top: 10px;">
                            <button id="submsg" class="layui-btn layui-btn-normal layui-btn-radius">提交
                            </button>
                        </div>
                        <div class="layui-card">
                            <div class="layui-card-header">用户留言</div>
                            <div class="layui-card-body">
                                <ul id="lmsg" class="layuiadmin-card-status layuiadmin-home2-usernote">
                                    <c:if test="${not empty rew}">
                                        <c:forEach items="${rew}" var="re">
                                            <li data-id="${re.id}">
                                                <h3>${re.nickname}</h3>
                                                <p>${re.content}</p>
                                                <span>
                                                            <fmt:formatDate value="${re.commenttime}"
                                                                            pattern="yyyy-MM-dd HH:mm:ss"/>
                                                        </span>
                                                <button id='rep' data-id='${re.id}'
                                                        class="layui-btn layui-col-lg-offset9 layui-btn-xs layuiadmin-reply-single">回复
                                                </button>
                                            </li>
                                            <c:if test="${not empty reply}">
                                                <c:forEach items="${reply}" var="py">
                                                    <c:if test="${py.refid==re.id}">
                                                        <div className='pad-btm'
                                                             style='background-color:#F2F2F2'>
                                                            <p className='fontColor'>
                                                                    ${py.nickname}回复：<span>${py.rep}</span>
                                                            </p>
                                                            <p className='min-font'>
                                                                        <span>
                                                                            <fmt:formatDate value="${py.replytime}"
                                                                                            pattern="yyyy-MM-dd HH:mm:ss"/>
                                                                        </span>
                                                            </p>
                                                        </div>
                                                        <hr/>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                        </c:forEach>
                                    </c:if>
                                </ul>
<%--                                <center id="demo-laypage-normal"></center>--%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="../../../static/layui/layui.js"></script>
        <script>
            const {createEditor, createToolbar} = window.wangEditor
            var msg
            const editorConfig = {
                onChange(editor) {
                    const html = editor.getHtml()
                    msg = html
                }
            }

            const editor = createEditor({
                selector: '#editor-container',
                html: '',
                config: editorConfig,
                mode: 'simple', // or 'simple'
            })

            const toolbarConfig = {}

            const toolbar = createToolbar({
                editor,
                selector: '#toolbar-container',
                config: toolbarConfig,
                mode: 'simple', // or 'simple'
            })

            function cleararea() {
                editor.clear()
            }

            layui.config({
                base: '../../../static/layuiadmin/' //静态资源所在路径
            }).extend({
                index: 'lib/index' //主入口模块
            }).use(['index'])
            layui.use(['index', 'layer', 'sample', 'jquery', 'layer', 'util'], function () {
                var laypage = layui.laypage
                var $ = layui.jquery
                var layer = layui.layer
                var util = layui.util
                // 普通用法
                // laypage.render({
                //     elem: 'demo-laypage-normal',
                //     count: 50 // 数据总数
                // })
                $("#submsg").on('click', function (event) {
                    event.preventDefault();
                    msg= msg.replace(/^\s+|\s+$/g, '')
                    if (msg) {
                        $.ajax({
                            url: 'addcom',
                            type: 'get',
                            data: {
                                userid: ${sessionScope.user.id},
                                refid: ${ msg.id },
                                type: 0,
                                content: msg
                            },
                            success: function (res) {
                                var jsonObject = JSON.parse(res)
                                console.log(jsonObject)
                                if (jsonObject.code === 0) {
                                    var $firstLi = $("#lmsg li:first")
                                    $firstLi.before("<li data-id='" + jsonObject.id + "'><h3>${user.nickname}</h3>" +
                                        "<p>" + msg
                                        + "</p>" +
                                        "<span>" + jsonObject.time + "</span>" +
                                        "<button data-id='" + jsonObject.id + "' class='layui-btn layui-col-lg-offset9 layui-btn-xs layuiadmin-reply-single'>" +
                                        "回复</button></li>")
                                    cleararea()
                                    layer.msg("提交成功！", {icon: 6, time: 2000})
                                } else {
                                    layer.msg("提交失败", {icon: 5, time: 2000})
                                }
                            }
                        })
                    } else layer.msg(
                        "请先提交评论内容！", {icon: 5, time: 2000})
                })
                $(document).on('click', '.layui-btn-xs.layuiadmin-reply-single', function (event) {
                    event.preventDefault()
                    var repid = $(this).data('id')
                    console.log(repid)
                    layer.prompt({title: '请输入文本', formType: 2}, function (value, index, elem) {
                        if (value === '') layer.msg("请先提交评论内容！", {icon: 5, time: 2000})
                        else {
                            $.ajax({
                                url: 'addrep',
                                type: 'get',
                                data: {
                                    userid: ${sessionScope.user.id},
                                    refid: repid,
                                    rep: util.escape(value)
                                },
                                success: function (res) {
                                    var jsonObject = JSON.parse(res)
                                    if (jsonObject.code === 0) {
                                        var $firstLi = $('li[data-id="' + repid + '"]').first()
                                        $firstLi.after("<div className='pad-btm' style='background-color:#F2F2F2'>"+
                                            "<p className='fontColor'>${user.nickname }回复：<span>" + util.escape(value) + "</span></p>" +
                                            "<p className='min-font'><span>" + jsonObject.time + "</span></p></div><hr/>")
                                        layer.msg("提交成功！", {icon: 6, time: 2000})
                                    } else {
                                        layer.msg("提交失败", {icon: 5, time: 2000})
                                    }
                                }
                            })
                            // 关闭 prompt
                            layer.close(index)
                        }
                    })
                })
            })
        </script>
    </body>

</html>