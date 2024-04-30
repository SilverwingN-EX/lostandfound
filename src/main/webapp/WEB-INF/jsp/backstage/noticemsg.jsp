<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Demo</title>
        <!-- 请勿在项目正式环境中引用该 layui.css 地址 -->
        <link href="../../../static/layui/css/layui.css" rel="stylesheet">
        <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js">
        </script>
        <style>
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
        </style>
    </head>
    <body>
        <div class="layui-col-md5 layui-col-md-offset4" style="margin-top: 100px;">
            <form class="layui-form" action="addnotice" method="post" enctype="multipart/form-data">
                <div class="layui-form-item">
                    <label class="layui-form-label">标题</label>
                    <div class="layui-input-block">
                        <input name='title' style="width: 200px;" type="text" lay-verify="required"
                                placeholder="请输入"
                                autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">图片</label>
                    <div class="layui-input-block">
                        <input id="img_input2" name="file" type="file" accept="image/*"/>
                        <label for="img_input2" id="img_label2">选择文件
                            <i class="fa fa-plus fa-lg"></i></label>
                        <div id="preview_box2" style="height: 120px; background-color: #f2d547; width: 0px;"></div>
                    </div>
                </div>
                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">内容</label>
                    <div class="layui-input-block">
                        <textarea name="msg" style="width: 400px;" placeholder="请输入内容"
                                  class="layui-textarea"></textarea>
                    </div>
                </div>
                <center class="layui-form-item">
                    <button class="layui-btn" id="ID-upload-demo-action">确认</button>
                    <button onclick="goBack()" class="layui-btn layui-btn-primary">返回</button>
                </center>
            </form>
        </div>

        <!-- 请勿在项目正式环境中引用该 layui.js 地址 -->
        <script src="../../../static/layui/layui.js"></script>
        <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>

        <script>
            function goBack() {
                history.back()
            }

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

            function setvalue(a) {
                console.log(a)
                console.log(document.getElementById('address'))
                $('#address').val(a)
            }

            layui.use(['form', 'laydate', 'util', 'jquery'], function () {
                var form = layui.form
                var layer = layui.layer
                var laydate = layui.laydate
                var $ = layui.jquery
                // 日期
                laydate.render({
                    elem: '#date'
                })
                $('#getadress').on('click', function () {
                    layer.open({
                        type: 2,
                        title: false, // 不显示标题栏,
                        content: 'map',
                        area: ['600px', '450px']
                    })
                })
            });
        </script>
    </body>
</html>