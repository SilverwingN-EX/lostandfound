<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
    <html>

    <head>
      <meta charset="utf-8">
      <title>我的资料</title>
      <meta name="renderer" content="webkit">
      <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <link href="../../../static/layui/css/layui.css" rel="stylesheet">
    </head>

    <body>
      <div class="layui-fluid" style="padding: 0px;">
        <form class="layui-form" action="userupload" enctype="multipart/form-data" method="post">
          <div class="layui-card">
            <div class="layui-card-header">设置我的资料</div>
            <div class="layui-card-body" style="padding: 15px 0px;">
              <div class="layui-form" lay-filter="">
                <div class="layui-form-item layui-hide">
                  <label class="layui-form-label">id</label>
                  <div class="layui-input-inline">
                    <input type="number" value="${info.id}" name="id" class="layui-input">
                  </div>
                </div>
                <div class="layui-form-item">
                  <label class="layui-form-label">账号</label>
                  <div class="layui-input-inline">
                    <input type="text" value="${info.anumber}" name="anumber" lay-verify="anumber" autocomplete="off"
                      placeholder="" class="layui-input" readonly>
                  </div>
                </div>
                <div class="layui-form-item">
                  <label class="layui-form-label">性别</label>
                  <div class="layui-input-block">
                    <input type="radio" name="sex" value="0" title="男" ${info.sex==0?'check':''}>
                    <input type="radio" name="sex" value="1" title="女" ${info.sex==1?'check':''}>
                    <input type="radio" name="sex" value="-1" title="未选择" ${info.sex==-1?'check':''}>
                  </div>
                </div>
                <div class="layui-form-item">
                  <label class="layui-form-label">photo</label>
                  <label class="chuans" id="upload">
                    <input value="${info.photo}" id="file" class="uploadImg file1" type="file" name="file"
                      style="display: none;" />
                    <div type="button" οnclick="uploadFile('file')" class="layui-btn layui-btn-danger"
                      id="ID-upload-demo-size">
                      <i class="layui-icon layui-icon-upload"></i> 上传图片
                    </div>
                  </label>
                </div>
                <div class="layui-form-item">
                  <label class="layui-form-label">头像</label>
                  <div class="layui-input-inline">
                    <input name="photo" lay-verify="required" id="photo" placeholder="图片地址"
                      value="http://cdn.layui.com/avatar/168.jpg" class="layui-input">
                  </div>
                </div>
                <div class="layui-form-item">
                  <label class="layui-form-label">昵称</label>
                  <div class="layui-input-inline">
                    <input type="text" value="${info.nickname}" name="nickname" lay-verify="nickname" autocomplete="off"
                      placeholder="" class="layui-input" >
                  </div>
                </div>
                <div class="layui-form-item">
                  <label class="layui-form-label">创建日期</label>
                  <div class="layui-input-inline">
                    <input type="text" value="<fmt:formatDate value="${info.createtime}"
                                                        pattern="yyyy-MM-dd HH:mm:ss" />" name="createtime" class="layui-input" id="ID-laydate"
                      placeholder="yyyy-MM-dd" readonly>
                  </div>
                </div>
              </div>
              <div class="layui-form-item">
                <label class="layui-form-label">省份</label>
                <div class="layui-input-inline">
                  <input type="text" name="province" lay-verify="province" autocomplete="off" placeholder=""
                    class="layui-input" value="${info.province}" >
                </div>
              </div>
              <div class="layui-form-item">
                <label class="layui-form-label">手机</label>
                <div class="layui-input-inline">
                  <input type="text" name="cellphone" value="${info.phone}" lay-verify="phone" autocomplete="off"
                    class="layui-input" >
                </div>
              </div>
              <div class="layui-form-item">
                <label class="layui-form-label">邮箱</label>
                <div class="layui-input-inline">
                  <input type="text" name="email" value="${info.email}" lay-verify="email" autocomplete="off"
                    class="layui-input" >
                </div>
              </div>
              <div class="layui-form-item">
                <div class="layui-input-block">
                  <button class="layui-btn">确认修改</button>
                  <button type="reset" class="layui-btn layui-btn-primary">重新填写</button>
                </div>
              </div>
            </div>
          </div>
        </form>
      </div>
      <script src="../../../static/layui/layui.js"></script>
      <script>
        layui.use(function () {
          var laydate = layui.laydate
          // 渲染
          laydate.render({
            elem: '#ID-laydate'
          })
        })
      </script>
    </body>

    </html>