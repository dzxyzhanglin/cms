<?php /*a:2:{s:56:"C:\PHP\WWW\YZNCMS\application\admin\view\config\add.html";i:1554984621;s:58:"C:\PHP\WWW\YZNCMS\application\admin\view\index_layout.html";i:1554268222;}*/ ?>
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
    <div class="layui-card-header">添加配置</div>
    <div class="layui-card-body">
        <form class="layui-form form-horizontal" action="<?php echo url('admin/config/add'); ?>" method="post">
            <div class="layui-form-item">
                <label class="layui-form-label">分组</label>
                <div class="layui-input-inline w300">
                    <select name="group">
                        <option value=""></option>
                        <?php if(is_array($groupArray) || $groupArray instanceof \think\Collection || $groupArray instanceof \think\Paginator): $i = 0; $__LIST__ = $groupArray;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                        <option value="<?php echo htmlentities($key); ?>"><?php echo htmlentities($vo); ?>[<?php echo htmlentities($key); ?>]</option>
                        <?php endforeach; endif; else: echo "" ;endif; ?>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">配置类型</label>
                <div class="layui-input-inline w300">
                    <select name="type" lay-filter="type">
                        <option value=""></option>
                        <?php if(is_array($fieldType) || $fieldType instanceof \think\Collection || $fieldType instanceof \think\Paginator): $i = 0; $__LIST__ = $fieldType;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                        <option value="<?php echo htmlentities($vo['name']); ?>" data-ifoption="<?php echo htmlentities($vo['ifoption']); ?>"><?php echo htmlentities($vo['title']); ?>[<?php echo htmlentities($vo['name']); ?>]</option>
                        <?php endforeach; endif; else: echo "" ;endif; ?>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">配置标题</label>
                <div class="layui-input-inline w300">
                    <input type="text" name="title" lay-verify="title" autocomplete="off" placeholder="字段中文标题" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">一般由中文组成，仅用于显示</div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">配置名称</label>
                <div class="layui-input-inline w300">
                    <input type="text" name="name" lay-verify="title" autocomplete="off" placeholder="字段英文名称" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">由英文字母开头和下划线组成，如 <code>web_site_title</code></div>
            </div>
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">配置默认值</label>
                <div class="layui-input-inline w300">
                    <textarea name="value" placeholder="未指定值时默认插入字段的值" class="layui-textarea"></textarea>
                </div>
                <div class="layui-form-mid layui-word-aux">配置类型为<code>数组</code>时请按如下格式填写：
                    <br>键值:键名
                    <br>键值:键名</div>
            </div>
            <div class="layui-form-item layui-form-text" id="options">
                <label class="layui-form-label">配置项</label>
                <div class="layui-input-inline w300">
                    <textarea name="options" placeholder="键值:键名
键值:键名
键值:键名
....." class="layui-textarea"></textarea>
                </div>
                <div class="layui-form-mid layui-word-aux">配置类型为<code>单选按钮,下拉框,复选框</code>时请按如下格式填写：
                    <br>键值:键名
                    <br>键值:键名</div>
            </div>
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">配置备注</label>
                <div class="layui-input-inline w300">
                    <textarea name="remark" placeholder="填写配置说明" class="layui-textarea"></textarea>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">排序</label>
                <div class="layui-input-inline w300">
                    <input type="number" name="listorder" lay-verify="title" autocomplete="off" placeholder="只能是正整数" class="layui-input" value="100">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn ajax-post" lay-submit="" lay-filter="*" target-form="form-horizontal">立即提交</button>
                    <a class="layui-btn layui-btn-normal" href="<?php echo url('admin/config/index'); ?>">返回</a>
                </div>
            </div>
        </form>
    </div>
</div>

    
<script type="text/javascript" src="/YZNCMS/public/static/admin/js/common.js"></script>
<script>
/*layui.use(['element', 'form', ], function() {
    var form = layui.form,
        element = layui.element,
        $ = layui.jquery;
    form.on('select(type)', function(data) {
        var ifoption = $(data.elem).find("option:selected").attr("data-ifoption");
        if (ifoption == '1') {
            $('#options').show();
        } else {
            $('#options').hide();
        }
    });

});*/
</script>

</body>

</html>