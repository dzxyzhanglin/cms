<?php /*a:2:{s:64:"C:\PHP\WWW\YZNCMS\application\admin\view\auth_manager\index.html";i:1554816282;s:58:"C:\PHP\WWW\YZNCMS\application\admin\view\index_layout.html";i:1554268222;}*/ ?>
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
    <div class="layui-card-header">角色管理</div>
    <div class="layui-card-body">
        <div class="layui-form">
            <table class="layui-hide" id="table" lay-filter="table"></table>
            <script type="text/html" id="toolbarDemo">
                <div class="layui-btn-container">
                <a class="layui-btn layui-btn-sm" href="<?php echo url('AuthManager/createGroup'); ?>">添加角色</a>
              </div>
            </script>
            <script type="text/html" id="barTool">
                {{#  if(d.id == 1){ }}
                <a class="layui-btn layui-btn-xs layui-btn-danger layui-btn-disabled">不可操作</a>
                {{#  } else { }}
                <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
                <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
                {{#  } }}
            </script>
        </div>
    </div>
</div>

    
<script>
layui.use('table', function() {
    var table = layui.table,
        $ = layui.$;
    table.render({
        elem: '#table',
        toolbar: '#toolbarDemo',
        url: '<?php echo url("admin/AuthManager/index"); ?>',
        cols: [
            [
                { field: 'title', width: 200, title: '权限组'},
                { field: 'description', title: '描述' },
                { field: 'status', width: 100,title: '状态', templet: '<div>{{#  if(d.status){ }} 正常 {{#  } else { }} <font color="#FF0000">禁用</font> {{#  } }} </div>' },
                { field: 'title',width: 200, title: '授权',templet: "<div><a class='layui-btn layui-btn-xs' href='<?php echo url('AuthManager/access?group_name='); ?>?title={{d.title}}&group_id={{d.id}}'>编辑权限</a></div>" },
                { fixed: 'right', width: 160, title: '操作', toolbar: '#barTool' }
            ]
        ],
        page: true
    });

    //监听行工具事件
    table.on('tool(table)', function(obj) {
        var data = obj.data;
        //console.log(obj);
        if (obj.event === 'del') {
            layer.confirm('确定删除这条数据？', { icon: 3, title: '提示' }, function(index) {
                layer.close(index);
                $.post('<?php echo url("admin/AuthManager/deletegroup"); ?>', { 'id': data.id }, function(data) {
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
            });
        }else if (obj.event === 'edit') {
            window.open('<?php echo url("admin/AuthManager/editgroup"); ?>' + "?id=" + data.id, '_self')
        }
    });
});
</script>

</body>

</html>