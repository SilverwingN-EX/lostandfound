<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="initial-scale=1.0, user-scalable=no, width=device-width">
        <title>map</title>
        <link rel="stylesheet" href="https://a.amap.com/jsapi_demos/static/demo-center/css/demo-center.css" />
        <link rel="stylesheet" href="../../../static/layui/css/layui.css" />
        <style>
            html,
            body,
            #container {
                height: 100%;
                width: 100%;
            }

            .btn {
                width: 10rem;
                margin-left: 6.8rem;
            }
        </style>
    </head>

    <body>
        <div style="position:relative; display: flex; justify-content: center;">
            <div id="container" style="width: 600px; height: 450px; z-index: 0;">
                <input id='address' type="text" disabled
                       style='z-index: 1; width:30rem;height:3rem; position: absolute;top: 0;left: 0;'>
                <center style="z-index: 1000; width:30rem;height:3rem; position: absolute;top: 0%;right: 0;">
                    <button id="adress" type="submit" class="layui-btn layui-btn-xs">提交
                    </button>
                    <button id="exit" type="button" class="layui-btn layui-btn-xs">返回</button>
                </center>
            </div>

        </div>
        <input id='lnglat' type="text" value='' style="display: none;">
        <script type="text/javascript">
            window._AMapSecurityConfig = {
                securityJsCode: "15633c57fefe70a4c182750874b8dde1",
            };
        </script>
        <script src="https://a.amap.com/jsapi_demos/static/demo-center/js/demoutils.js"></script>
        <script src="../../../static/layui/layui.js"></script>
        <script type="text/javascript"
                src="https://webapi.amap.com/maps?v=2.0&key=70584557d63d56c203394ce7b0733fbf&plugin=AMap.Geocoder"></script>
        <script type="text/javascript">
            var map = new AMap.Map("container", {
                resizeEnable: true
            })
            AMap.plugin('AMap.Geolocation', function () {
                var geolocation = new AMap.Geolocation({
                    enableHighAccuracy: true,//是否使用高精度定位，默认:true
                    timeout: 10000,          //超过10秒后停止定位，默认：5s
                    buttonPosition: 'RB',    //定位按钮的停靠位置
                    buttonOffset: new AMap.Pixel(10, 20),//定位按钮与设置的停靠位置的偏移量，默认：Pixel(10, 20)
                    zoomToAccuracy: true,   //定位成功后是否自动调整地图视野到定位点
                    convert: false
                })
                map.addControl(geolocation)
                geolocation.getCurrentPosition(function (status, result) {
                    if (status == 'complete') {
                        onComplete(result)
                    }
                    //  else {
                    //   onError(result)
                    // }
                })
            })
            //解析定位结果
            function onComplete (data) {
                console.log(data.position)
                document.getElementById('lnglat').value = data.position
                regeoCode()
            }
            //解析定位错误信息
            function onError (data) {
                document.getElementById('status').innerHTML = '定位失败'
                document.getElementById('result').innerHTML = '失败原因排查信息:' + data.message
            }
            var geocoder = new AMap.Geocoder({
                city: "010", //城市设为北京，默认：“全国”
                radius: 1000 //范围，默认：500
            })
            var marker = new AMap.Marker();;
            function regeoCode () {

                var lnglat = document.getElementById('lnglat').value.split(',')
                map.add(marker)
                marker.setPosition(lnglat)

                geocoder.getAddress(lnglat, function (status, result) {
                    if (status === 'complete' && result.regeocode) {
                        var address = result.regeocode.formattedAddress
                        document.getElementById('address').value = address
                    } else {
                        log.error('根据经纬度查询地址失败')
                    }
                })
            }

            map.on('click', function (e) {
                document.getElementById('lnglat').value = e.lnglat
                regeoCode()
            })

        </script>
        <script type="text/javascript">
            layui.use(['jquery', 'layer'], function () {
                var $ = layui.jquery
                var layer = layui.layer
                $('#adress').click(function () {
                    parent.setvalue(document.getElementById('address').value)
                    var index = parent.layer.getFrameIndex(window.name)
                    parent.layer.close(index)
                })
                $('#exit').click(function () {
                    var index = parent.layer.getFrameIndex(window.name)
                    parent.layer.close(index)
                })
            })
        </script>
    </body>

</html>
