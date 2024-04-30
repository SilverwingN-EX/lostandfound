<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>用户列表</title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport"
              content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
        <link rel="stylesheet" href="../../../static/layuiadmin/layui/css/layui.css" media="all">
        <link rel="stylesheet" href="../../../static/layuiadmin/style/admin.css" media="all">
        <style type="text/css">
            td img {
                max-width: 10px;
                height: auto;
                overflow: hidden;
            }
            #img_input2 {
                display: none;
            }

            #img_label2 {
                background-color: #f2d547;
                border-radius: 5px;
                display: inline-block;
                padding: 10px;
            }

            #preview_box2 img {
                width: 200px;
            }
            td img {
                max-width: 10px;
                height: auto;
                overflow: hidden;
            }
        </style>
    </head>

    <body style="background-color: white;">
        <div class="layui-card layadmin-header">
            <div class="layui-breadcrumb" lay-filter="breadcrumb" >
                <a lay-href="">主页</a>
                <a><cite>个人中心</cite></a>
            </div>
        </div>
        <div class="layui-col-md8 off" style=" margin-top: 100px;">
            <form class="layui-form" action="adminupload" method="post" enctype="multipart/form-data">
                <div class="layui-form-item">
                    <label class="layui-form-label">用户名</label>
                    <div class="layui-input-block">
                        <input name='username' style="width: 200px;" type="text" name="username" lay-verify="required"
                               placeholder="请输入" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">密码</label>
                    <div class="layui-input-block">
                        <input name='password' style="width: 200px;" type="text" name="password" lay-verify="required"
                               placeholder="请输入" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">昵称</label>
                    <div class="layui-input-block">
                        <input name='text' style="width: 200px;" type="text" name="nickname" lay-verify="required" placeholder="请输入"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">图片</label>
                    <div class="layui-input-block">
                        <input id="img_input2" name="file" type="file" accept="image/*" />
                        <label for="img_input2" id="img_label2">选择文件
                            <i class="fa fa-plus fa-lg"></i></label>
                        <div id="preview_box2" style="height: 120px; background-color: #f2d547; width: 0px;"></div>
                    </div>
                </div>
                <center class="layui-form-item">
                    <button class="layui-btn" id="ID-upload-demo-action">确认</button>
                    <button type="reset" class="layui-btn layui-btn-primary">返回</button>
                </center>
            </form>
        </div>
        <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js">
        </script>
        <script type="text/javascript">
            $("#img_input2").on("change", function (e) {
                /* //获取图片资源 */
                var file = e.target.files[0]

                /* // 只选择图片文件 */
                if (!file.type.match('image.*')) {
                    return false
                }

                var reader = new FileReader()
                /* // 读取文件 */
                reader.readAsDataURL(file)

                /* // 渲染文件 */
                reader.onload = function (arg) {

                    var img = '<img class="preview" src="' + arg.target.result + '" alt="preview"/>'
                    $("#preview_box2").empty().append(img)
                }
            })
        </script>
        <script src="../../../static/layuiadmin/layui/layui.js"></script>
        <script>
            layui.config({
                base: '../../../static/layuiadmin/' //静态资源所在路径
            }).extend({
                index: 'lib/index' //主入口模块
            }).use(['index', 'table', 'jquery', 'form', 'layer'], function () {
                var $ = layui.jquery
                var table = layui.table
                var form = layui.form
                var layer = layui.layer
            });

        </script>
    </body>

</html>