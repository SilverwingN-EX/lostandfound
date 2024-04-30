<%--
  Created by IntelliJ IDEA.
  User: Silverwing
  Date: 2023/12/27
  Time: 11:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Demo</title>
        <!-- 请勿在项目正式环境中引用该 layui.css 地址 -->
<%--        <link href="../../static/layui/css/layui.css" rel="stylesheet">--%>
        <link rel="stylesheet" href="../../../static/layuiadmin/layui/css/layui.css" media="all">
        <link rel="stylesheet" href="../../../static/layuiadmin/style/admin.css" media="all">
        <link rel="stylesheet" href="../../../static/layuiadmin/style/login.css" media="all">
    </head>
    <body>
        <style>
            .demo-reg-container{width: 320px; margin: 21px auto 0;}
            .demo-reg-other .layui-icon{position: relative; display: inline-block; margin: 0 2px; top: 2px; font-size: 26px;}
        </style>
        <div class="layadmin-user-login layadmin-user-display-show" id="LAY-user-login" style="display: none;">
            <div class="layadmin-user-login-main">
                <div class="layadmin-user-login-box layadmin-user-login-header">
                    <h2>注册</h2>
                    <p>失物招领平台</p>
                </div>
        <form class="layui-form">
            <div class="demo-reg-container">
                <div class="layui-form-item">
                    <div class="layui-input-wrap">
                        <div class="layui-input-prefix">
                            <i class="layui-icon layui-icon-email"></i>
                        </div>
                        <input type="text" name="email" value="" lay-verify="required|email" placeholder="邮箱"  autocomplete="off" class="layui-input" id="reg-email">
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-row">
                        <div class="layui-col-xs7">
                            <div class="layui-input-wrap">
                                <div class="layui-input-prefix">
                                    <i class="layui-icon layui-icon-code-circle"></i>
                                </div>
                                <input type="text" id="vercode" name="vercode" value="" lay-verify="required" placeholder="验证码" lay-reqtext="请填写验证码" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-col-xs5">
                            <div style="margin-left: 11px;">
                                <button type="button" class="layui-btn layui-btn-fluid layui-btn-primary" lay-on="reg-get-vercode">获取验证码</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <a href="lg" style="float: right; margin-top: 7px;">密码登录</a>
                </div>
                <div class="layui-form-item">
                    <button class="layui-btn layui-btn-fluid" lay-submit lay-filter="demo-reg">登录/注册</button>
                </div>
            </div>
        </form>
            </div>
        </div>
        <!-- 请勿在项目正式环境中引用该 layui.js 地址 -->
        <script src="../../static/layui/layui.js"></script>
        <script>
            layui.use(function(){
                var $ = layui.$;
                var form = layui.form;
                var layer = layui.layer;
                var util = layui.util;

                // 提交事件
                form.on('submit(demo-reg)', function(data){
                    var field = data.field; // 获取表单字段值
                    console.log(field)
                    $.ajax({
                        url: 'lremail', // 你的接口地址
                        type: 'Get',
                        data: {'code':$('#vercode').val()},
                        success: function (res) {
                            console.log(res);
                            window.location.href = '/';
                        }
                    });
                    return false;
                });

                // 普通事件
                util.on('lay-on', {
                    // 获取验证码
                    'reg-get-vercode': function(othis){
                        var isValid = form.validate('#reg-email');  // 主动触发验证，v2.7.0 新增
                        // 验证通过
                        if(isValid) {
                            $.ajax({
                                url: 'sendemail', // 你的接口地址
                                type: 'Get',
                                data: {'email':$('#reg-email').val()},
                                success: function (res) {
                                    console.log(res);
                                    if (res === 'success') {
                                        layer.msg('验证码已发送，请注意查收');
                                    } else {
                                        layer.msg('获取验证码失败，请重试');
                                    }
                                }
                            });
                        }
                    }
                });
            });
        </script>

    </body>
</html>
