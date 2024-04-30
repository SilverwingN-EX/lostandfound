<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>帖子编辑器</title>
        <link href="../../../static/editor/css/style.css" rel="stylesheet">
        <link href="../../../static/layui/css/layui.css" rel="stylesheet">
        <style>
            html,
            body {
                background-color: #fff;
                height: 100%;
                overflow: hidden;
                color: #333;
            }

            /*#top-container {*/
            /*  border-bottom: 1px solid #e8e8e8;*/
            /*  padding-left: 30px;*/
            /*}*/

            #editor-toolbar {
                width: 1350px;
                background-color: #FCFCFC;
                margin: 0 auto;
            }

            #content {
                height: calc(100% - 40px);
                background-color: rgb(245, 245, 245);
                overflow-y: auto;
                position: relative;
            }

            #editor-container {
                width: 850px;
                margin: 30px auto 0px auto;
                background-color: #fff;
                padding: 20px 50px 50px 50px;
                border: 1px solid #e8e8e8;
                box-shadow: 0 2px 10px rgb(0 0 0 / 12%);
            }

            #title-container {
                padding: 20px 0;
                border-bottom: 1px solid #e8e8e8;
            }

            #title-container input {
                font-size: 30px;
                border: 0;
                outline: none;
                width: 100%;
                line-height: 1;
            }

            #editor-text-area {
                min-height: 900px;
                margin-top: 20px;
            }
        </style>
    </head>

    <body>
        <%-- <div id="top-container">--%>
            <%-- <p>--%>
                <%-- <a href="./index.html">&lt;&lt; 返回 Back to demo</a>--%>
                    <%-- </p>--%>
                        <%-- </div>--%>
                            <div style="border-bottom: 1px solid #e8e8e8;">
                                <div id="editor-toolbar"></div>
                            </div>
                            <div id="content">
                                <div id="editor-container">
                                    <div id="title-container">
                                        <input name="title" placeholder="标题">
                                    </div>
                                    <div id="editor-text-area"></div>
                                </div>
                                <center class="layui-col-md-offset5" style="margin:10px 0px 150px 0px;">
                                    <button type="submit" class="layui-btn layui-btn-normal layui-btn-radius" lay-submit
                                        lay-filter="sub">提交
                                    </button>
                                    <a href="forum" target="iframeMain" type="button"
                                        class="layui-btn layui-btn-danger layui-btn-radius">返回</a>
                                </center>
                            </div>
                            <%--<script src="https://cdn.jsdelivr.net/npm/@wangeditor/editor@latest/dist/index.min.js">
                                </script>--%>
                                <script src="../../../static/editor/index.js"></script>
                                <script src="../../../static/layui/layui.js"></script>
                                <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
                                <script>
                                    $(document).ready(function () {
                                        $('.layui-btn-normal').on('click', function (event) {
                                            event.preventDefault() // 阻止默认提交行为

                                            // 获取标题输入框的值
                                            // var title =

                                                // 获取编辑器内容，假设你的富文本编辑器提供了获取内容的方法，例如：editor.txt.html()
                                                // 构造要发送的数据


                                                // 使用ajax向服务器发送POST请求
                                                $.ajax({
                                                    url: 'addpost', // 替换为你的服务器端接收数据的接口地址
                                                    type: 'get',
                                                    data: {
                                                        userid: ${user.id},
                                                        title: $('input[name="title"]').val(),
                                                        content: editor.getHtml()
                                                    },
                                                    success: function (response) {
                                                            layer.msg("提交成功！", { icon: 6, time: 2000 })
                                                        window.location.href="forum"
                                                    },
                                                    error: function (xhr, status, error) {
                                                        alert('请求发生错误：' + status)
                                                    }
                                                })
                                        })
                                    })
                                </script>
                                <script>
                                    const E = window.wangEditor

                                    // 切换语言
                                    const LANG = location.href.indexOf('lang=en') > 0 ? 'en' : 'zh-CN'
                                    E.i18nChangeLanguage(LANG)

                                    const editorConfig = {
                                        placeholder: '内容...',
                                        scroll: false, // 禁止编辑器滚动
                                        MENU_CONF: {
                                            uploadImage: {
                                                fieldName: 'your-fileName',
                                                base64LimitSize: 10 * 1024 * 1024 // 10M 以下插入 base64
                                            }
                                        },
                                        onChange (editor) {
                                            console.log(editor.getHtml())
                                        }
                                    }

                                    // 先创建 editor
                                    const editor = E.createEditor({
                                        selector: '#editor-text-area',
                                        content: [],
                                        // html: '',
                                        config: editorConfig
                                    })

                                    // 创建 toolbar
                                    const toolbar = E.createToolbar({
                                        editor,
                                        selector: '#editor-toolbar',
                                        config: {
                                            excludeKeys: 'fullScreen',
                                        }
                                    })

                                    // 点击空白处 focus 编辑器
                                    document.getElementById('editor-text-area').addEventListener('click', e => {
                                        if (e.target.id === 'editor-text-area') {
                                            editor.blur()
                                            editor.focus(true) // focus 到末尾
                                        }
                                    })
                                    editorConfig.MENU_CONF['uploadImage'] = {
                                        server: 'upload',
                                        // server: '/api/upload-img-10s', // test timeout
                                        // server: '/api/upload-img-failed', // test failed
                                        // server: '/api/xxx', // test 404

                                        timeout: 5 * 1000, // 5s

                                        maxFileSize: 10 * 1024 * 1024, // 10M

                                        base64LimitSize: 5 * 1024, // insert base64 format, if file's size less than 5kb

                                        onBeforeUpload (file) {
                                            console.log('onBeforeUpload', file)

                                            return file // will upload this file
                                            // return false // prevent upload
                                        },
                                        onProgress (progress) {
                                            console.log('onProgress', progress)
                                        },
                                        onSuccess (file, res) {
                                            console.log('onSuccess', file, res)
                                        },
                                        onFailed (file, res) {
                                            alert(res.message)
                                            console.log('onFailed', file, res)
                                        },
                                        onError (file, err, res) {
                                            alert(err.message)
                                            console.error('onError', file, err, res)
                                        }
                                    }

                                </script>
    </body>

    </html>