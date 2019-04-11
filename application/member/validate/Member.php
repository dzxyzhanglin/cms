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
// | 模型验证
// +----------------------------------------------------------------------
namespace app\member\validate;

use think\Validate;

class Member extends Validate
{
    //定义验证规则
    protected $rule = [
        'username|用户名' => 'require|unique:member,username|alphaDash|length:2,20',
        'password|密码' => 'require|length:6,20|confirm',
        //'email|邮箱' => 'require|email',
        'groupid|会员组' => 'require|number',
    ];

    // <编辑>验证场景
    protected $scene = [
        'edit' => [
            'username',
            //'email',
            'groupid',
        ]
    ];
}
