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
    </head>

    <body>

        <div class="layui-fluid">
            <div class="layui-card">
                <div class="layui-card-body" style="padding: 15px;">
                    <form class="layui-form" action="" lay-filter="component-form-group" type="multipart/form-data">
                        <div class="layui-inline layui-hide">
                            <label class="layui-form-label">id</label>
                            <div class="layui-input-inline">
                                <input type="number" name="id" id="id" lay-verify="required" autocomplete="off"
                                    class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label class="layui-form-label">头像</label>
                                <div class="layui-input-inline">
                                    <img class="layui-upload-img" id="photo" style="width: 100%; height: 80px;">
                                </div>
                            </div>
                            <div class="layui-inline">
                                <div class="layui-input-inline">
                                    <button type="button" class="layui-btn layui-btn-normal" id="ID-upload-demo-choose">
                                        选择文件
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label class="layui-form-label">账号</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="anumber" id="anumber" lay-verify="required"
                                        autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">密码</label>
                                <div class="layui-input-inline">
                                    <input type="password" id="pwd" name="password" lay-verify="pass"
                                        placeholder="请输入密码" autocomplete="off" class="layui-input">
                                </div>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label class="layui-form-label">昵称</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="nickname" id="nickname" lay-verify="required|pass"
                                        autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">性别</label>
                                <div class="layui-input-inline">
                                    <select name="sex" id="sex">
                                        <option value="">请选择性别</option>
                                        <option value="0">男</option>
                                        <option value="1">女</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label class="layui-form-label">生日</label>
                                <div class="layui-input-inline">
                                    <input type="date" name="birthday" id="birthday" lay-verify="required"
                                        autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">手机号</label>
                                <div class="layui-input-inline">
                                    <input type="tel" name="phone" id="phone" lay-verify="required|phone"
                                        autocomplete="off" class="layui-input">
                                </div>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label class="layui-form-label">省份</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="province" id="province" lay-verify="required"
                                        autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">邮箱</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="email" id="email" lay-verify="email" autocomplete="off"
                                        class="layui-input">
                                </div>
                            </div>
                        </div>
                        <div class="layui-form-item layui-layout-admin">
                            <div class="layui-input-block">
                                <div class="layui-footer" style="left: 0;">
                                    <button class="layui-btn" id="ID-upload-demo-action">立即提交</button>
                                    <button id="res" type="reset" onclick="resetImageSrc()"
                                        class="layui-btn layui-btn-primary">重置
                                    </button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script type="text/javascript">
            function resetImageSrc () {
                var image = document.getElementById('photo')
                image.src = "" // 或者设置一个默认的空白图片地址
                image.alt = "" // 或者设置一个默认的空白图片地址
            }
        </script>
        <script src="../../../static/layuiadmin/layui/layui.js"></script>
        <script>
            layui.config({
                base: '../../../static/layuiadmin/' //静态资源所在路径
            }).extend({
                index: 'lib/index' //主入口模块
            }).use(['index', 'form', 'upload'], function () {
                var $ = layui.$
                    , admin = layui.admin
                    , element = layui.element
                    , layer = layui.layer
                    , form = layui.form
                    , upload = layui.upload

                form.render(null, 'component-form-group')

                /* 自定义验证规则 */
                form.verify({
                    nickname: [/^[\u4e00-\u9fa50-9a-zA-Z!@#$%^&*()\-_=+{};:,<.>]{1,8}$/, '昵称不超过8位']
                    , pass: [/(.+){6,12}$/, '密码必须6到12位']
                    , content: function (value) {
                        layedit.sync(editIndex)
                    }
                })

                upload.render({
                    elem: '#ID-upload-demo-choose',
                    url: 'fileupload', // 实际使用时改成您自己的上传接口即可。
                    auto: false
                    , accept: 'images'
                    , size: '60'
                    , data: {
                        "id": () => {
                            return $('#id').val()
                        },
                        "anumber": () => {
                            return $('#anumber').val()
                        },
                        "pwd": () => {
                            return $('#pwd').val()
                        },
                        // "photo": () => {
                        //     return $('#photo').attr("src");
                        // },
                        "nickname": () => {
                            return $('#nickname').val()
                        },
                        "sex": () => {
                            return $('#sex').val()
                        },
                        "birthday": () => {
                            return $('#birthday').val()
                        },
                        "phone": () => {
                            return $('#phone').val()
                        },
                        "province": () => {
                            return $('#province').val()
                        },
                        "email": () => {
                            return $('#email').val()
                        },
                    },
                    bindAction: '#ID-upload-demo-action',
                    choose: function (obj) {
                        // 预读本地文件示例，不支持ie8
                        obj.preview(function (index, file, result) {
                            $('#photo').attr('src', result)
                        })
                    },
                    done: function (res) {
                        parent.table.reload()
                        parent.location.reload(true)//刷新父级页面
                        var index = parent.layer.getFrameIndex(window.name)
                        parent.layer.close(index)
                        // if (res.code > 0) {
                        //     return layer.msg('上传失败');
                        // } else {
                        //     layer.msg('上传成功');
                        //     console.log(res);
                        // }
                    }
                })
            })

        </script>
    </body>

    </html>