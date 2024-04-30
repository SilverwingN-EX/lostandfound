<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html>

    <head>
        <title>登录界面</title>
<%--        <link href="layui/css/layui.css" rel="stylesheet">--%>
        <link rel="stylesheet" href="../../../static/layuiadmin/layui/css/layui.css" media="all">
        <link rel="stylesheet" href="../../../static/layuiadmin/style/admin.css" media="all">
        <link rel="stylesheet" href="../../../static/layuiadmin/style/login.css" media="all">
    </head>

    <body>
        <style>
            .demo-login-container {
                width: 320px;
                margin: 21px auto 0;
            }

            .demo-login-other .layui-icon {
                position: relative;
                display: inline-block;
                margin: 0 2px;
                top: 2px;
                font-size: 26px;
            }
        </style>
        <div class="layadmin-user-login layadmin-user-display-show" id="LAY-user-login" style="display: none;">
            <div class="layadmin-user-login-main">
                <div class="layadmin-user-login-box layadmin-user-login-header">
                    <h2>登录</h2>
                    <p>失物招领平台</p>
                </div>
        <form id="login-" class="layui-form">
            <div class="demo-login-container">
                <div class="layui-form-item">
                    <div class="layui-input-wrap">
                        <div class="layui-input-prefix">
                            <i class="layui-icon layui-icon-username"></i>
                        </div>
                        <input type="text" name="anumber" value="" lay-verify="required" placeholder="账号"
                               lay-reqtext="请填写用户名" autocomplete="off" class="layui-input" lay-affix="clear">
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-wrap">
                        <div class="layui-input-prefix">
                            <i class="layui-icon layui-icon-password"></i>
                        </div>
                        <input type="password" name="pwd" value="" lay-verify="required" placeholder="密   码"
                               lay-reqtext="请填写密码" autocomplete="off" class="layui-input" lay-affix="eye">
                    </div>
                </div>
                <div class="layui-form-item">
                    <a href="reg" style="float: right; margin-top: 7px;">注册</a>
                </div>
                <div class="layui-form-item">
                    <div class="layui-row">
                        <div class="layui-col-xs7">
                            <div class="layui-input-wrap">
                                <div class="layui-input-prefix">
                                    <i class="layui-icon layui-icon-vercode"></i>
                                </div>
                                <input id="yzm" type="text" name="captcha" value="" lay-verify="required" placeholder="验证码"
                                       lay-reqtext="请填写验证码" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-col-xs5">
                            <div style="margin-left: 10px;">
                                <canvas id="canvas" width="100" height="43"></canvas>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="layui-form-item">
                    <button id="demo0" class="layui-btn layui-btn-fluid" lay-submit lay-filter="demo-login">登录</button>
                </div>

            </div>
        </form>
            </div>
        </div>

        <!-- 请勿在项目正式环境中引用该 layui.js 地址 -->
        <script src="../../static/layui/layui.js"></script>
        <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
        <script type="text/javascript">
            var flag =false;
            $(function () {
                var show_num = []
                draw(show_num)

                $("#canvas").on('click', function () {
                    draw(show_num)
                })
                $('#yzm').change(function(){
                    var val = $('#yzm').val().toLowerCase()
                    var num = show_num.join("")
                    if (val == num) {
                        console.log(val)
                        console.log(num)
                        flag=true
                    }
                });
                // $('#demo0').on('click', function () {

                // })
            })

            function draw (show_num) {
                var canvas_width = $('#canvas').width()
                var canvas_height = $('#canvas').height()
                var canvas = document.getElementById("canvas")//获取到canvas的对象，演员
                var context = canvas.getContext("2d")//获取到canvas画图的环境，演员表演的舞台
                canvas.width = canvas_width
                canvas.height = canvas_height
                var sCode = "A,B,C,E,F,G,H,J,K,L,M,N,P,Q,R,S,T,W,X,Y,Z,1,2,3,4,5,6,7,8,9,0"
                var aCode = sCode.split(",")
                var aLength = aCode.length//获取到数组的长度

                for (var i = 0; i <= 3; i++) {
                    var j = Math.floor(Math.random() * aLength)//获取到随机的索引值
                    var deg = Math.random() * 30 * Math.PI / 180//产生0~30之间的随机弧度
                    var txt = aCode[j]//得到随机的一个内容
                    show_num[i] = txt.toLowerCase()
                    var x = 10 + i * 20//文字在canvas上的x坐标
                    var y = 20 + Math.random() * 8//文字在canvas上的y坐标
                    context.font = "bold 23px 微软雅黑"

                    context.translate(x, y)
                    context.rotate(deg)

                    context.fillStyle = randomColor()
                    context.fillText(txt, 0, 0)

                    context.rotate(-deg)
                    context.translate(-x, -y)
                }
                for (var i = 0; i <= 5; i++) { //验证码上显示线条
                    context.strokeStyle = randomColor()
                    context.beginPath()
                    context.moveTo(Math.random() * canvas_width, Math.random() * canvas_height)
                    context.lineTo(Math.random() * canvas_width, Math.random() * canvas_height)
                    context.stroke()
                }
                for (var i = 0; i <= 30; i++) { //验证码上显示小点
                    context.strokeStyle = randomColor()
                    context.beginPath()
                    var x = Math.random() * canvas_width
                    var y = Math.random() * canvas_height
                    context.moveTo(x, y)
                    context.lineTo(x + 1, y + 1)
                    context.stroke()
                }
            }

            function randomColor () {//得到随机的颜色值
                var r = Math.floor(Math.random() * 256)
                var g = Math.floor(Math.random() * 256)
                var b = Math.floor(Math.random() * 256)
                return "rgb(" + r + "," + g + "," + b + ")"
            }
            layui.use(function () {
                var form = layui.form
                var layer = layui.layer
                var $ = layui.$
                // 提交事件
                form.on('submit(demo-login)', function (data) {
                    var field = data.field // 获取表单字段值
                    console.log("flag"+flag)
                    // 此处可执行 Ajax 等操作
                    if (!flag){
                        layer.msg('证验证码错误！', { icon: 2 });
                        return false;
                    }
                    $.ajax({
                        url: "tologin",
                        type: "Get",
                        data: {
                            'anumber': field.anumber,
                            'pwd': field.pwd
                        },
                        success: function (response) {
                            console.log(response)
                            var jr= JSON.parse(response)
                            if (jr.code === 0) {
                                layer.msg('登录成功！', { icon: 1 })
                                window.location.href = '/';
                            } else {
                                layer.msg('登录失败，请检查您的用户名、密码是否正确。', { icon: 2 })
                                // 和验证码
                            }
                        },
                        error: function () {
                            layer.msg('请求错误，请稍后再试。', { icon: 2 })
                        }
                    })
                    return false // 阻止表单提交
                })
            });
        </script>
    </body>

</html>