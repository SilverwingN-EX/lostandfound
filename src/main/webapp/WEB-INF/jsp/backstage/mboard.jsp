<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
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
            <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="edit">回复</a>
            <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
        </script>
        <div class="layui-card layadmin-header">
            <div class="layui-breadcrumb" lay-filter="breadcrumb">
                <a lay-href="">反馈</a>
                <a><cite>反馈列表</cite></a>
            </div>
        </div>

        <div class="layui-fluid">
            <div class="layui-row layui-col-space15">
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <div class="layui-card-body">
                            <div class="usertable-btn" style="margin-bottom: 10px;">
                                搜索标题
                                <div class="layui-inline">
                                    <input class="layui-input" name="anumber" id="test-table-demoReload"
                                           autocomplete="off">
                                </div>

                                <button id="sreach" class="layui-btn" data-type="reload">搜索</button>
                                <button id="reset" class="layui-btn">清空</button>
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
                    , url: "getboard"
                    , height: 'full-100'
                    , cellMinWidth: 100
                    , page: true
                    // , lineStyle: 'height: 30px;'
                    , defaultToolbar: false
                    , cols: [[
                        // {checkbox: true, fixed: true},
                        {field: 'id', title: 'id', hide: true}
                        , {field: 'nickname', title: '用户名'}
                        , {field: 'title', title: '标题',}
                        , {
                            field: 'mpicture', title: '图片', templet: function (d) {
                                return "<img src='http://localhost:8080/upload/" + d.mpicture + " 'style='width: 100%; height: 80px;'/>"
                            }
                        }
                        , {field: 'reply', title: '回复'}
                        , {
                            field: 'rpicture', title: '图片', templet: function (d) {
                                return "<img src='http://localhost:8080/upload/" + d.rpicture + " 'style='width: 100%; height: 80px;'/>"
                            }
                        }
                        , {
                            field: 'type', title: '是否回复', sort: true, templet: function (d) {
                                return d.type == 0 ? '未回复' : '已回复'
                            }
                        }
                        , {
                            field: 'boardtime',
                            title: '反馈时间',
                            sort: true,
                            templet: "<div>{{layui.util.toDateString(d.ordertime, 'yyyy年MM月dd日 HH:mm:ss')}}</div>"
                        }
                        , {
                            field: 'replytime',
                            title: '回复时间',
                            sort: true,
                            templet: "<div>{{layui.util.toDateString(d.ordertime, 'yyyy年MM月dd日 HH:mm:ss')}}</div>"
                        }
                        , {fixed: 'right', title: '操作', edit: false, align: 'center', toolbar: "#userBar"}
                    ]]
                })
                var $ = layui.$, active = {
                    reload: function () {
                        goodtable.reload({
                            url: 'likeboard',
                            where: {
                                title: $('#test-table-demoReload').val(),
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
                    goodtable.reload({
                        url: "getboard"
                    })
                })

                table.on('tool(usertable)', function (obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
                    var data = obj.data //获得当前行数据
                    console.log(data.type);
                    var layEvent = obj.event //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
                    if (layEvent === 'del') { //查看
                        layer.msg("删除")
                        layer.confirm('真的删除行么', function (index) {
                            $.ajax({
                                url: 'delboard',
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
                        if (data.type == 0) {
                            window.location.href='remsg?id='+data.id;
                        } else {
                            layer.msg("已回复", {icon: 6, time: 2000})
                        }
                    }
                })

            });

        </script>
    </body>

</html>