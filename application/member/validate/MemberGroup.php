<?php
/**
 * Created by PhpStorm.
 * User: zhanglin
 * Date: 2019/4/9
 * Time: 14:56
 */

namespace app\member\validate;


use think\Validate;

class MemberGroup extends Validate
{
    // 定义验证规则
    protected $rule = [
        'name|会员组' => 'require|unique:member_group,name',
    ];
}