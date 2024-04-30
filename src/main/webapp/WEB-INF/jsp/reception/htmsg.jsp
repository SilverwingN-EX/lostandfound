<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Silverwing
  Date: 2024/1/3
  Time: 13:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <title>反馈界面</title>
        <link rel="stylesheet" href="../../../static/layui/css/layui.css">
        <style>
            body {
                background-color: #f0f2f5;
                font-family: 'Arial', sans-serif;
            }

            .layui-container {
                margin-top: 70px;
            }

            .feedback-part {
                height: calc(100vh - 140px);
                overflow-y: auto;
                border: 1px solid #e6e6e6;
                border-radius: 5px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                margin-bottom: 20px;
                padding: 20px;
                background-color: #fff;
                position: relative;
            }

            .feedback-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 10px;
            }

            .feedback-header span:first-child {
                color: #333;
                font-weight: bold;
            }

            .feedback-time {
                color: #999;
            }

            #userFeedback,
            #officialReply {
                font-size: 16px;
                line-height: 1.8;
                color: #666;
                word-break: break-all;
            }

            .layui-btn-back {
                position: fixed;
                top: 20px;
                left: 20px;
                z-index: 100;
                padding: 8px 16px;
                font-size: 16px;
                border: none;
                border-radius: 2px;
                background-color: #409eff;
                color: #fff;
                cursor: pointer;
                outline: none;
                display: flex;
                align-items: center;
                justify-content: center;
            }

            .layui-btn-back:hover {
                background-color: #2a7ae2;
            }
        </style>
    </head>

    <body>

        <!-- 返回按钮 -->
        <button class="layui-btn layui-btn-back" onclick="goBack()"><i class="layui-icon layui-icon-left"></i>返回</button>

        <!-- 导入layui.js -->
        <script src="../../../static/layui/layui.js"></script>

        <div class="layui-container">
            <div class="layui-row">
                <!-- 用户反馈部分 -->
                <div class="layui-col-md6 feedback-part">
                    <div class="feedback-header">
                        <span>用户名：${htmsg.nickname}</span>
                        <span class="feedback-time">反馈时间：
                            <fmt:formatDate value="${htmsg.boardtime}"
                                            pattern="yyyy-MM-dd HH:mm:ss" /></span>
                    </div>
                    <hr/>
                    <h3>${htmsg.title}</h3>
                    <div id="userFeedback">${htmsg.msg}</div>
                </div>

                <!-- 官方回复部分 -->
                <div class="layui-col-md6 feedback-part">
                    <c:if test="${htmsg.type ==1}">
                    <div class="feedback-header">
                        <span>官方回复</span>
                        <hr/>
                        <span class="feedback-time">回复时间：<fmt:formatDate value="${htmsg.replytime}"
                                                                             pattern="yyyy-MM-dd HH:mm:ss" /></span>
                    </div>
                    <div id="officialReply">${htmsg.reply}</div>
                    </c:if>
                </div>
            </div>
        </div>

        <script>
            function goBack () {
                history.back()
            }
        </script>
    </body>

</html>