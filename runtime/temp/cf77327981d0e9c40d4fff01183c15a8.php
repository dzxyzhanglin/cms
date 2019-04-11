<?php /*a:2:{s:52:"C:\PHP\WWW\YZNCMS\application\cms\view\cms\panl.html";i:1554728014;s:58:"C:\PHP\WWW\YZNCMS\application\admin\view\index_layout.html";i:1554268222;}*/ ?>
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
    
<style type="text/css">
.childrenBody {
    background: #fff;
}
</style>
<div class="layui-row layui-col-space10 panel_box">
    <div class="panel layui-col-xs12 layui-col-sm6 layui-col-md4 layui-col-lg3">
        <a href="javascript:;">
        <div class="panel_icon layui-bg-black">
            <i class="icon iconfont icon-other layui-anim"></i>
        </div>
        <div class="panel_word">
            <span><?php echo htmlentities($info['category']); ?></span>
            <cite>栏目数量</cite>
        </div>
    </a>
    </div>
    <div class="panel layui-col-xs12 layui-col-sm6 layui-col-md4 layui-col-lg3">
        <a href="javascript:;">
        <div class="panel_icon layui-bg-red">
            <i class="icon iconfont icon-apartment layui-anim"></i>
        </div>
        <div class="panel_word">
            <span><?php echo htmlentities($info['model']); ?></span>
            <cite>模型数量</cite>
        </div>
    </a>
    </div>
    <div class="panel layui-col-xs12 layui-col-sm6 layui-col-md4 layui-col-lg3">
        <a href="javascript:;">
        <div class="panel_icon layui-bg-green">
            <i class="icon iconfont icon-shiyongwendang layui-anim"></i>
        </div>
        <div class="panel_word">
            <span><?php echo htmlentities($info['doc']); ?></span>
            <cite>文档数量</cite>
        </div>
    </a>
    </div>
    <!--<div class="panel layui-col-xs12 layui-col-sm6 layui-col-md4 layui-col-lg3">
        <a href="javascript:;">
        <div class="panel_icon layui-bg-blue">
            <i class="icon iconfont icon-label layui-anim"></i>
        </div>
        <div class="panel_word">
            <span><?php echo htmlentities($info['tags']); ?></span>
            <cite>Tags数量</cite>
        </div>
    </a>
    </div>-->
</div>
<blockquote class="layui-elem-quote main_btn">
    备注
</blockquote>

    
<script type="text/javascript">
layui.use(['jquery'], function() {
    var $ = layui.jquery;
    //icon动画
    $(".panel a").hover(function() {
        $(this).find(".layui-anim").addClass("layui-anim-scaleSpring");
    }, function() {
        $(this).find(".layui-anim").removeClass("layui-anim-scaleSpring");
    })
    $(".panel a").click(function() {
        parent.addTab($(this));
    })
})
</script>

</body>

</html>