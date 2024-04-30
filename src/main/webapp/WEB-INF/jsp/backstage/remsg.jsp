<%--
  Created by IntelliJ IDEA.
  User: Silverwing
  Date: 2024/1/3
  Time: 23:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <title>失物招领平台</title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport"
              content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
        <link rel="stylesheet" href="../../static/layui/css/layui.css" media="all">
        <link rel="stylesheet" href="../../static/layuiadmin/style/admin.css" media="all">
        <link href="../../static/editor/css/style.css" rel="stylesheet">
        <style>
            #editor—wrapper {
                border: 1px solid #ccc;
                z-index: 100;
                /* 按需定义 */
            }

            #toolbar-container {
                border-bottom: 1px solid #ccc;
            }

            #editor-container {
                height: 300px;
            }
        </style>
    </head>

    <body>
        <script src="../../static/layui/layui.js"></script>
        <script src="../../static/editor/index.js"></script>
        <div class="layui-bg-gray layui-col-md-offset2 layui-col-md8" style="padding: 16px; height: auto;">
                <!-- <div class="layui-form-item">
                  <div class="layui-input-group">
                    <div class="layui-input-prefix">
                      帖子标题
                    </div>
                    <input type="text" placeholder="带前置且无分割框" class="layui-input">
                  </div>
                </div> -->
                <div id="editor—wrapper">
                    <div id="toolbar-container"><!-- 工具栏 --></div>
                    <div id="editor-container"><!-- 编辑器 --></div>
                </div>
                <div class="layui-col-md-offset5" style="margin-top: 10px;">
                    <button type="submit" class="layui-btn layui-btn-normal layui-btn-radius" lay-submit
                            lay-filter="sub">提交</button>
                    <button onclick="goback()" class="layui-btn layui-btn-normal layui-btn-radius">返回</button>
                </div>
        </div>
        <script type="text/javascript">
            function goback() {
                history.back()
            }
            const { createEditor, createToolbar } = window.wangEditor
            var msg
            const editorConfig = {
                onChange (editor) {
                    const html = editor.getHtml()
                    msg=html
                    // 也可以同步到 <textarea>
                }
            }
            const editor = createEditor({
                selector: '#editor-container',
                html: '<p><br></p>',
                config: editorConfig,
                mode: 'simple', // or 'simple'
            })

            const toolbarConfig = {}

            const toolbar = createToolbar({
                editor,
                selector: '#toolbar-container',
                config: toolbarConfig,
                mode: 'simple', // or 'simple'
            })
            layui.config({
                base: '../../static/layuiadmin/' //静态资源所在路径
            }).extend({
                index: 'lib/index' //主入口模块
            }).use(['index', 'user', 'form','jquery'], function () {
                var form = layui.form
                var $= layui.jquery
                form.on('submit(sub)', function (data) {
                    var field = data.field // 获取表单字段值
                    $.ajax({
                        url:'repboard'
                        , type: 'get',
                        data: {id:${id}
                            ,reply:msg},
                        success: function (res) {
                            layer.msg('提交成功', {
                                offset: '150px'
                                , icon: 1
                                , time: 1000
                            })
                            window.location.href="board"
                        },
                        error: function (err) {
                            layer.msg('上传失败', { icon: 5 })
                        }
                    })
                    return false
                })
            })
        </script>
    </body>

</html>
