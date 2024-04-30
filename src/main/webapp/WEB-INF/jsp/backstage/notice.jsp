<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <title>Title</title>
        <%--        <link rel="stylesheet" href="//unpkg.com/layui@2.7.6/dist/css/layui.css">--%>
        <link href="//cdn.staticfile.org/layui/2.9.1/css/layui.css" rel="stylesheet">
    </head>
    <body>

        <table class="'layui-hide" id="userTable" lay-filter="userTable"></table>
        <style type="text/css">
            .layui-table-cell {
                text-align: center;
                height: auto;
                white-space: normal;
            }

            .layui-table img {
                max-width: 20%
            }
        </style>
        <script type="text/html" id="tb">
            <div class="layui-btn-container">
                <button class="layui-btn layui-btn-sm" lay-event="add">添加公告</button>
            </div>
        </script>
        <div id="userBar" style="display: none;">
            <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
        </div>
        <%--        <script src="//unpkg.com/layui@2.7.6/dist/layui.js"></script>--%>
        <script src="//cdn.staticfile.org/layui/2.9.1/layui.js"></script>
        <script type="text/javascript">
            layui.use(["jquery", 'form', 'upload', 'element', 'layer', 'table'], function () {
                var table = layui.table
                var form = layui.form
                var $ = layui.jquery;
                //渲染数据表格
                table.render({
                    elem: '#userTable', //渲染的目标对象
                    url: "noticelist"
                    , height: 'full-100'
                    , cellMinWidth: 100
                    , page: true,
                    toolbar: '#tb'
                    // , lineStyle: 'height: 30px;'
                    , defaultToolbar: false
                    , cols: [[
                        // {checkbox: true, fixed: true},
                        {field: 'id', title: 'id', hide: true}
                        , {field: 'title', title: '标题'},
                        {
                            field: 'picture', title: '图片', templet: function (d) {
                                return "<img src='http://localhost:8080/upload/" + d.picture + " 'style='width: 100%; height: 80px;'/>"
                            }
                        }
                        , {field: 'msg', title: '内容'}
                        , {
                            field: 'releasetime',
                            title: '发布日期',
                            sort: true,
                            templet: "<div>{{layui.util.toDateString(d.ordertime, 'yyyy年MM月dd日 HH:mm:ss')}}</div>"
                        }
                        , {fixed: 'right', title: '操作', edit: false, align: 'center', toolbar: "#userBar"}
                    ]]
                })
                table.on('tool(userTable)', function (obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
                    var data = obj.data //获得当前行数据
                    var layEvent = obj.event //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
                    if (layEvent === 'del') { //查看
                        //do somehing
                        layer.msg("删除")
                        layer.confirm('真的删除行么', function (index) {
                            $.ajax({
                                url: 'delnotice',
                                data: {'id': data.id},
                                method: 'get',
                                success: function (req) {
                                    console.log((req));
                                    obj.del();
                                    layer.close(index);
                                }
                            });
                        })
                    }
                })
                //监听行点击事件
                table.on('row(userTable)', function (obj) {
                    console.log(obj.data);

                });
                table.on('toolbar(userTable)', function (obj) {
                    console.log(obj.event);
                    window.location.href = "noticemsg"
                });
            });
        </script>
    </body>

</html>

