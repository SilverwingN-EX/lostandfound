<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>公告详情页面</title>
        <link rel="stylesheet" href="../../../static/layui/css/layui.css">
        <style>
            body {
                background-color: #f0f2f5;
            }

            .layui-container {
                margin-top: 50px;
            }

            #announcementTitle {
                font-size: 24px;
                color: #333;
                margin-bottom: 20px;
            }

            #announcementContent {
                font-size: 16px;
                line-height: 1.8;
                color: #666;
                padding: 20px;
                background-color: #fff;
                border-radius: 5px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }

            #announcementDate {
                text-align: right;
                color: #999;
                margin-top: 20px;
            }

            .layui-btn-back {
                position: fixed;
                top: 20px;
                left: 20px;
                z-index: 100;
            }
        </style>
    </head>

    <body>

        <!-- 导入layui.js -->
        <script src="../../../static/layui/layui.js"></script>

        <div class="layui-container">
            <div class="layui-row">
                <div class="layui-col-md12">
                    <button onclick="goBack()" class="layui-btn layui-btn-back">返回</button>
                    <h3 id="announcementTitle">${nocmsg.title}</h3>
                    <div id="announcementContent">${nocmsg.msg}</div>
                    <p id="announcementDate"><fmt:formatDate value="${nocmsg.releasetime}"
                                                             pattern="yyyy-MM-dd HH:mm:ss" /></p>
                </div>
            </div>
        </div>
        <script>
            function goBack() {
                history.back();
            }
        </script>
    </body>

</html>