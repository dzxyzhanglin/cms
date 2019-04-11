<?php /*a:2:{s:58:"C:\PHP\WWW\YZNCMS\application\admin\view\config\index.html";i:1554268222;s:58:"C:\PHP\WWW\YZNCMS\application\admin\view\index_layout.html";i:1554268222;}*/ ?>
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
    <div class="layui-card-body">
        <div class="layui-tab layui-tab-card">
            <ul class="layui-tab-title">
                <?php if(is_array($groupArray) || $groupArray instanceof \think\Collection || $groupArray instanceof \think\Paginator): $i = 0; $__LIST__ = $groupArray;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                <li class="<?php if($key==$group): ?>layui-this<?php endif; ?>"><a href="<?php echo url('index',['group'=>$key]); ?>"><?php echo htmlentities($vo); ?></a></li>
                <?php endforeach; endif; else: echo "" ;endif; ?>
            </ul>
            <div class="layui-tab-content">
                <table class="layui-hide" id="table" lay-filter="table"></table>
            </div>
        </div>
    </div>
</div>
<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
    <a class="layui-btn layui-btn-sm" href="<?php echo url('admin/config/add'); ?>">新增配置项</a>
  </div>
</script>
<script type="text/html" id="barTool">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script type="text/html" id="switchTpl">
    <input type="checkbox" name="status" value="{{d.id}}" lay-skin="switch" lay-text="开启|关闭" lay-filter="status" {{ d.status==1 ? 'checked' : '' }}>
</script>

    
<script>
layui.use('table', function() {
    var table = layui.table,
        $ = layui.$,
        form = layui.form;
    table.render({
        elem: '#table',
        toolbar: '#toolbarDemo',
        url: '<?php echo url("admin/config/index",["group"=>$group]); ?>',
        cols: [
            [
                { field: 'listorder', width: 70, title: '排序', edit: 'text' },
                { field: 'name', title: '名称' },
                { field: 'title', title: '标题' },
                { field: 'ftitle', width: 150, title: '类型' },
                { field: 'update_time', width: 200, title: '更新时间' },
                { field: 'status', title: '状态', width: 100, templet: '#switchTpl', unresize: true },
                { fixed: 'right', width: 120, title: '操作', toolbar: '#barTool' }
            ]
        ],
    });

            //监听单元格编辑
    table.on('edit(table)', function(obj) {
        var value = obj.value,data = obj.data;
        $.post('<?php echo url("admin/config/listorder"); ?>', {'id': data.id,'value':value }, function(data) {
            if (data.code == 1) {
                layer.msg(data.msg);
            }else{
                layer.msg(data.msg);
            }

        })
    });

    //监听状态操作
    form.on('switch(status)', function(obj) {
        var _this = $(obj.elem);
        $.post('<?php echo url("admin/config/setstate"); ?>', { 'id':this.value,'status':obj.elem.checked }, function(data) {
            if (data.code == 1) {
                layer.msg(data.msg);
            }else{
                layer.msg(data.msg);
            }

        });
    });

    //监听行工具事件
    table.on('tool(table)', function(obj) {
        var data = obj.data;
        //console.log(obj);
        if (obj.event === 'del') {
            layer.confirm('确定删除这条数据？', { icon: 3, title: '提示' }, function(index) {
                layer.close(index);
                $.post('<?php echo url("admin/config/del"); ?>', { 'id': data.id }, function(data) {
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
        } else if (obj.event === 'edit') {
            window.open('<?php echo url("admin/config/edit"); ?>' + "?id=" + data.id, '_self')
        }
    });
});
</script>

</body>

</html>