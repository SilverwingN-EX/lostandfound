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
        #LAY-component-grid-list .demo-list .layui-card {
          height: 267px;
        }

        div img {
          width: 100%;
          /* 图片宽度填满div */
          height: 100%;
          /* 图片高度填满div */
          object-fit: contain;
          /* 保持图片的原始比例，图片将适应div容器，可能不会全部填充满 */
        }
      </style>
    </head>

    <body>
      <script src="../../../static/layui/layui.js"></script>
      <div class="layui-bg-gray layui-col-md-offset2 layui-col-md8" style="padding: 16px; height: auto;">
        <span class="layui-breadcrumb" lay-separator=">">
          <a>首页</a>
          <a><cite>失物/招领</cite></a>
        </span>
        <div class="layui-form">
          <div class="layui-form-item" style="margin:15px 0px 0px ;">
            <div class="layui-input-group">
              <div class="layui-input-block">
                <select name="interest" lay-filter="fltype">
                  <option value="lost" selected>失物</option>
                  <option value="find">认领</option>
                </select>
              </div>
<%--              <div class="layui-input-split layui-input-prefix">--%>
<%--                失物名称--%>
<%--              </div>--%>
<%--              <input type="text" placeholder="" class="layui-input">--%>
<%--              <div class="layui-input-split layui-input-prefix">--%>
<%--                遗失日期--%>
<%--              </div>--%>
<%--              <input type="text" class="layui-input" id="ID-laydate" placeholder="">--%>
<%--              <div class="layui-input-suffix">--%>
<%--                <button class="layui-btn">搜索</button>--%>
<%--              </div>--%>
            </div>
          </div>
          <div class="layui-fluid" id="LAY-component-grid-list">
            <div id="itemList" class="layui-row layui-col-space10 demo-list">
              <c:forEach items="${lost}" var="ls">
                <div class="layui-col-sm4 layui-col-md3 layui-col-lg3">
                  <!-- 填充内容 -->
                  <a href="detail?id=${ls.id}">
                    <div class="layui-card">
                      <img src="/upload/${ls.picture}" alt=${ls.id}>
                    </div>
                  </a>
                </div>
              </c:forEach>
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
          var form = layui.form
          var $ = layui.$
          // 渲染
          laydate.render({
            elem: '#ID-laydate'
          })
          form.on('select(fltype)', function (data) {
            var value = data.value // 获得被选中的值
            $.ajax({
              url: 'find',
              data: {
                type: value
              },
              type: 'GET',
              success: function (response) {
              }
            })
          })
        });
      </script>
    </body>

    </html>