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
        </style>
    </head>

    <body>
        <script type="text/html" id="userBar">
            <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="edit">编辑</a>
            <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
        </script>
        <div class="layui-card layadmin-header">
            <div class="layui-breadcrumb" lay-filter="breadcrumb">
                <a lay-href="">主页</a>
                <a><cite>组件</cite></a>
                <a><cite>数据表格</cite></a>
                <a><cite>数据表格的重载</cite></a>
            </div>
        </div>

        <div class="layui-fluid">
            <div class="layui-row layui-col-space15">
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <div class="layui-card-body">
                            <div class="usertable-btn" style="margin-bottom: 10px;">
                                搜索账号 | 昵称：
                                <div class="layui-inline">
                                    <input class="layui-input" name="anumber" id="test-table-demoReload"
                                           autocomplete="off">
                                </div>
                                <div class="layui-inline">
                                    <input class="layui-input" name="nickname" id="test-table-demoReload2"
                                           autocomplete="off">
                                </div>
                                <button id="sreach" class="layui-btn" data-type="reload">搜索</button>
                                <button id="reset" class="layui-btn">清空</button>
<%--                                <button id="delete" class="layui-btn layui-bg-red" style="margin-left: 510px">批量删除--%>
<%--                                </button>--%>
                            </div>
                            <table class="layui-hide" id="usertable" lay-filter="usertable"></table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

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
                //方法级渲染
                var goodtable = table.render({
                    elem: '#usertable'
                    , url: "pageuserlist"
                    , height: 'full-100'
                    , cellMinWidth: 100
                    , page: true
                    // , lineStyle: 'height: 30px;'
                    , defaultToolbar: false
                    , cols: [[
                        // {checkbox: true, fixed: true},
                          {field: 'id', title: 'id', hide: true}
                        , {field: 'anumber', title: '账号'}
                        , {field: 'pwd', title: '密码', sort: true}
                        , {
                            field: 'photo', title: '头像', templet: function (d) {
                                return "<img src='http://localhost:8080/upload/" + d.photo + " 'style='width: 100%; height: 80px;'/>"
                            }
                        }
                        , {field: 'nickname', title: '昵称'}
                        , {
                            field: 'sex', title: '性别', sort: true, templet: function (d) {
                                return d.sex === 0 ? '男' : '女'
                            }
                        }
                        , {field: 'createtime', title: '生日', sort: true,templet : "<div>{{layui.util.toDateString(d.ordertime, 'yyyy年MM月dd日 HH:mm:ss')}}</div>"}
                        , {field: 'phone', title: '手机号'}
                        , {field: 'province', title: '省份', sort: true}
                        , {field: 'email', title: '邮箱', sort: true},
                        {fixed: 'right', title: '操作', edit: false, align: 'center', toolbar: "#userBar"}
                    ]]
                })
                var $ = layui.$, active = {
                    reload: function () {
                        goodtable.reload({
                            url: 'likeUserList',
                            where: {
                                anumber: $('#test-table-demoReload').val(),
                                nickname: $('#test-table-demoReload2').val()
                            }
                        })
                    }
                }
                $('#sreach').on('click', function () {
                    var type = $(this).data('type')
                    active[type] ? active[type].call(this) : ''
                })
                $('#reset').on('click', function () {
                    $('#test-table-demoReload').val("")
                    $('#test-table-demoReload2').val("")
                    goodtable.reload({
                        url: "pageuserlist"
                    })
                })

                table.on('tool(usertable)', function (obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
                    var data = obj.data //获得当前行数据
                    var layEvent = obj.event //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
                    if (layEvent === 'del') { //查看
                        layer.msg("删除")
                        layer.confirm('真的删除行么', function (index) {
                            $.ajax({
                                url: 'deleteUser',
                                data: {id: data.id},
                                method: 'get',
                                success: function (req) {
                                    console.log((req))
                                    obj.del()
                                    layer.close(index)
                                }
                            })
                        })
                    } else if (layEvent === 'edit') {
                        openUpdateUser(data)
                    }
                })

                function openUpdateUser(data) {
                    layer.open({
                        type: 2,
                        title: "修改用户信息",
                        content: '/admin/edit',
                        area: ['800px', '400px'],
                        success: function (layero, index) {
                            var body = layer.getChildFrame('body', index)
                            body.find('#id').val(data.id)
                            body.find('#anumber').val(data.anumber)
                            body.find('#pwd').val(data.pwd)
                            body.find('#photo').attr('src', data.photo)
                            body.find('#nickname').val(data.nickname)
                            body.find('#sex').val(data.sex)
                            body.find('#birthday').val(data.birthday)
                            body.find('#phone').val(data.phone)
                            body.find('#province').val(data.province)
                            body.find('#email').val(data.email)
                            layui.form.render()
                        }
                    })
                }
            });

        </script>
    </body>

</html>