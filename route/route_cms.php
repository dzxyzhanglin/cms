<?php
// +----------------------------------------------------------------------
// | Yzncms [ 御宅男工作室 ]
// +----------------------------------------------------------------------
// | Copyright (c) 2018 http://yzncms.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 御宅男 <530765310@qq.com>
// +----------------------------------------------------------------------

// +----------------------------------------------------------------------
// | CMS路由
// +----------------------------------------------------------------------

Route::rule('index/index', 'index/index/index');
Route::rule('index/lists/:catid/[:condition]', 'index/index/lists')->pattern(['catid' => '\d+', 'condition' => '[0-9_&=a-zA-Z]+']);
Route::rule('index/shows/:catid/:id', 'index/index/shows')->pattern(['catid' => '\d+', 'id' => '\d+']);
Route::rule('index/tag/[:tag]', 'index/index/tags');
Route::rule('index/search/<keyword?>/[:modelid]/[:time]', 'index/index/search')->pattern(['keyword' => '\w+', 'modelid' => '\d+', 'time' => '\w+']);

//如果想要直接绑定域名 不加cms后缀 直接注释上面代码 如以下代码
//Route::rule('/', 'cms/index/index');
//Route::rule('index', 'cms/index/index');
//Route::rule('lists/:catid/[:condition]', 'cms/index/lists')->pattern(['catid' => '\d+', 'condition' => '[0-9_&=a-zA-Z]+']);
//更多...
//更个性化的地址请参考TP手册路由章节

//最后重要提示
//务必【更新栏目缓存】和【一键清理缓存】
