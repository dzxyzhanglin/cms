<?php /*a:2:{s:68:"C:\PHP\WWW\YZNCMS\application\attachment\view\attachments\index.html";i:1554268222;s:58:"C:\PHP\WWW\YZNCMS\application\admin\view\index_layout.html";i:1554268222;}*/ ?>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>YZNCMS后台管理系统</title>
    <meta name="author" content="YZNCMS">
    <link rel="stylesheet" href="/YZNCMS/public/static/libs/layui/css/layui.css">
    <link rel="stylesheet" href="/YZNCMS/public/static/admin/css/admin.css">
    <link rel="stylesheet" href="/YZNCMS/public/static/admin/font/iconfont.css">
    <script src="/YZNCMS/public/static/libs/layui/layui.js"></script>
    <script src="/YZNCMS/public/static/libs/jquery/jquery.min.js"></script>
<script type="text/javascript">
//全局变量
var GV = {
    'image_upload_url': '<?php echo !empty($image_upload_url) ? htmlentities($image_upload_url) :  url("attachment/attachments/upload", ["dir" => "images", "module" => request()->module()]); ?>',
    'file_upload_url': '<?php echo !empty($file_upload_url) ? htmlentities($file_upload_url) :  url("attachment/attachments/upload", ["dir" => "files", "module" => request()->module()]); ?>',
    'WebUploader_swf': '/YZNCMS/public/static/webuploader/Uploader.swf',
    'upload_check_url': '<?php echo !empty($upload_check_url) ? htmlentities($upload_check_url) :  url("attachment/Attachments/check"); ?>',
    'ueditor_upload_url': '<?php echo !empty($ueditor_upload_url) ? htmlentities($ueditor_upload_url) :  url("attachment/Ueditor/run"); ?>',
    'ueditor_grabimg_url': '<?php echo !empty($ueditor_upload_url) ? htmlentities($ueditor_upload_url) :  url("attachment/Attachments/geturlfile"); ?>',
};
</script>
</head>
<body class="childrenBody">
    
<div class="layui-card">
    <div class="layui-card-header">附件管理</div>
    <div class="layui-card-body">
        <table class="layui-hide" id="table" lay-filter="table"></table>
        <script type="text/html" id="toolbarDemo">
            <div class="layui-btn-container">
		    <button class="layui-btn layui-btn-sm" lay-event="delAll">批量删除</button>
		  </div>
		</script>
        <script type="text/html" id="barTool">
            <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
        </script>
    </div>
</div>

    
<script>
layui.use('table', function() {
    var table = layui.table,
        $ = layui.$;
    table.render({
        elem: '#table',
        toolbar: '#toolbarDemo',
        url: '<?php echo url("attachment/attachments/index"); ?>',
        cols: [
            [
                { type: 'checkbox', fixed: 'left' },
                { field: 'id', width: 80, title: 'ID', sort: true },
                { field: 'uid', width: 80, title: '用户ID' },
                { field: 'name', title: '名称' },
                { field: 'size', title: '大小', sort: true },
                { field: 'create_time', width: 180, title: '上传时间' },
                { fixed: 'right', width: 70, title: '操作', toolbar: '#barTool' }
            ]
        ],
        page: {}
    });

    table.on('toolbar(table)', function(obj) {
        if (obj.event === 'delAll') {
            var checkStatus = table.checkStatus('table'),
                data = checkStatus.data,
                ids = [];
            if (data.length > 0) {
                for (let i in data) {
                    ids.push(data[i].id);
                }
                layer.confirm('确定删除选中的数据？', { icon: 3, title: '提示信息' }, function(index) {
                    $.post('<?php echo url("attachment/attachments/delete"); ?>', { 'ids': ids }, function(data) {
                        if (data.code == 1) {
                            if (data.url) {
                                layer.msg(data.msg + ' 页面即将自动跳转~');
                            } else {
                                layer.msg(data.msg);
                            }
                            setTimeout(function() {
                                if (data.url) {
                                    location.href = data.url;
                                } else {
                                    location.reload();
                                }
                            }, 1500);
                        } else {
                            layer.msg(data.msg);
                            setTimeout(function() {
                                if (data.url) {
                                    location.href = data.url;
                                }
                            }, 1500);
                        }
                    });
                    layer.close(index);
                })
            } else {
                layer.msg("请选择需要删除的数据");
            }
        }
    });


    //监听行工具事件
    table.on('tool(table)', function(obj) {
        var data = obj.data;
        //console.log(obj);
        if (obj.event === 'del') {
            layer.confirm('确定删除这条数据？', { icon: 3, title: '提示' }, function(index) {
                layer.close(index);
                $.ajax({
                    url: '<?php echo url("attachment/attachments/delete"); ?>',
                    type: "GET",
                    data: {
                        id: data.id
                    },
                    success: function(data) {
                        if (data.code == 1) {
                            if (data.url) {
                                layer.msg(data.msg + ' 页面即将自动跳转~');
                            } else {
                                layer.msg(data.msg);
                            }
                            setTimeout(function() {
                                if (data.url) {
                                    location.href = data.url;
                                } else {
                                    location.reload();
                                }
                            }, 1500);
                        } else {
                            layer.msg(data.msg);
                            setTimeout(function() {
                                if (data.url) {
                                    location.href = data.url;
                                }
                            }, 1500);
                        }
                    }
                });
            });
        }
    });


});
</script>

</body>

</html>