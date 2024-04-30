<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Silverwing
  Date: 2024/1/3
  Time: 12:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>帖子详情展示页面</title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport"
              content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
        <%--        <link href="../../../static/layui/css/layui.css" rel="stylesheet">--%>
        <%--        <link href="../../../static/editor/css/style.css" rel="stylesheet">--%>

        <link rel="stylesheet" href="../../../static/layui/css/layui.css" media="all">
        <link href="../../../static/editor/css/style.css" rel="stylesheet">

        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
            }

            .container {
                max-width: 800px;
                margin: 0 auto;
                padding: 20px;
            }

            .post {
                background-color: #f5f5f5;
                padding: 20px;
                margin-bottom: 20px;
            }

            .post-title {
                font-size: 24px;
                margin-bottom: 10px;
            }

            .post-content {
                font-size: 16px;
                line-height: 1.5;
            }

            .post-author {
                font-size: 14px;
                color: #999;
                margin-top: 10px;
            }

            #editor—wrapper {
                border: 1px solid #ccc;
                z-index: 100; /* 按需定义 */
                margin-top: 20px;
                height: 100%;
            }

            #toolbar-container {
                border-bottom: 1px solid #ccc;
            }

            #editor-container {
                height: 300px;
            }

        </style>
    </head>
    <body>

        <div class="container">
            <div class="post">
                <h2 class="post-title">${tzmsg.title}</h2>
                <p class="post-content">${tzmsg.content}</p>
                <p class="post-author">${tzmsg.nickname}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<fmt:formatDate
                        value="${tzmsg.posttime}"
                        pattern="yyyy-MM-dd HH:mm:ss"/></p>
            </div>

            <div style="display: flex; justify-content: center; align-items: center;">
                <div id="editor—wrapper">
                    <div id="toolbar-container"><!-- 工具栏 --></div>
                    <div id="editor-container"><!-- 编辑器 --></div>
                </div>
            </div>

            <div style="margin-top: 15px; display: flex; justify-content: flex-end; width: 85%;">
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
                                            class="layui-btn layui-col-lg-offset9 layui-btn-xs layuiadmin-reply-single">
                                        回复
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
                    <center id="demo-laypage-normal"></center>
                </div>
            </div>
        </div>

        <script src="../../../static/editor/index.js"></script>

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

                $("#submsg").on('click', function () {
                    if (msg) {
                        $.ajax({
                            url: 'addcom',
                            type: 'get',
                            data: {
                                userid: ${sessionScope.user.id},
                                refid: ${ tzmsg.id },
                                type: 0,
                                content: msg
                            },
                            success: function (res) {
                                var jsonObject = JSON.parse(res)
                                console.log(jsonObject)
                                if (jsonObject.code === 0) {
                                    var $firstLi = $("#lmsg li:first")
                                    $firstLi.before("<li data-id='" + jsonObject.id + "'><h3>${sessionScope.user.nickname}</h3>" +
                                        "<p>" + msg
                                        + "</p>" +
                                        "<span>" + jsonObject.time + "</span>" +
                                        "<button id='rep' data-id='" + jsonObject.id + "' class='layui-btn layui-col-lg-offset9 layui-btn-xs layuiadmin-reply-single'>" +
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
                    layer.prompt({title: '请输入文本', formType: 2}, function (value, index, elem) {
                        if (value === '') layer.msg("请先提交评论内容！", {icon: 5, time: 2000})
                        else {
                            $.ajax({
                                url: 'addrep',
                                type: 'get',
                                data: {
                                    userid: ${user.id},
                                    refid: repid,
                                    rep: util.escape(value)
                                },
                                success: function (res) {
                                    var jsonObject = JSON.parse(res)
                                    if (jsonObject.code === 0) {
                                        var $firstLi = $('li[data-id="' + repid + '"]').first()
                                        $firstLi.after("<div className='pad-btm' style='background-color:#F2F2F2'>"+
                                            "<p className='fontColor'>${sessionScope.user.nickname}回复：<span>" + util.escape(value) + "</span></p>" +
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
