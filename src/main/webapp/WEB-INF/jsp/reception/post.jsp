<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
        * {
          box-sizing: border-box;
          margin: 0;
          padding: 0;
        }

        body {
          font-family: Arial, sans-serif;
          font-size: 16px;
          line-height: 1.6;
          color: #444;
        }

        header {
          background-color: #0072c6;
          color: #fff;
          padding: 20px;
        }

        header h1 {
          font-size: 36px;
          margin: 0;
        }

        main {
          margin: 20px;
        }

        form {
          background-color: #f7f7f7;
          padding: 20px;
          border-radius: 5px;
          margin-bottom: 20px;
        }

        form h2 {
          margin-bottom: 10px;
        }

        form label {
          display: block;
          margin-bottom: 5px;
          font-weight: bold;
        }

        form input,
        form textarea {
          display: block;
          width: 100%;
          padding: 10px;
          border: none;
          border-radius: 3px;
          box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1);
          margin-bottom: 10px;
        }

        form textarea {
          min-height: 100px;
          resize: vertical;
        }

        form input[type="submit"] {
          background-color: #0072c6;
          color: #fff;
          border: none;
          padding: 10px 20px;
          border-radius: 3px;
          cursor: pointer;
        }

        form input[type="submit"]:hover {
          background-color: #005daa;
        }

        section {
          background-color: #f7f7f7;
          padding: 20px;
          border-radius: 5px;
        }

        section h2 {
          margin-bottom: 10px;
        }

        #message-list li {
          margin-bottom: 10px;
          padding: 10px;
          border: 1px solid #d6d6d6;
          border-radius: 3px;
          background-color: #fff;
          box-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
        }

        footer {
          background-color: #444;
          color: #fff;
          padding: 10px;
          text-align: center;
        }

        footer p {
          margin: 0;
        }
      </style>
    </head>
      <body>
        <div class="layui-col-md8 layui-col-lg-offset2">
        <header>
          <h1>留言板</h1>
        </header>
        <main>
          <form method="post" enctype="multipart/form-data" action="addfb">
            <h2>发布留言</h2>
            <label for="title">标题：</label>
            <input type="text" name="title" id="title" required>
            <label for="mpicture">图片</label>
            <input type="file" name="file" id="mpicture" required>
            <label for="message">留言内容：</label>
            <textarea name="msg" id="message" required></textarea>
            <input type="submit" value="提交">
          </form>
        </main>
        <footer>
          <p>&copy; 2023 反馈申请</p>
        </footer>
        </div>
      <script src="../../../static/layui/layui.js"></script>
      <script src="../../../static/editor/index.js"></script>
      <script type="text/javascript">
        layui.config({
          base: '../../../static/layuiadmin/' //静态资源所在路径
        }).extend({
          index: 'lib/index' //主入口模块
        }).use()
      </script>
    </body>

    </html>