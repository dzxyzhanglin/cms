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
// | 会员模型
// +----------------------------------------------------------------------
namespace app\member\model;

use \think\Model;

/**
 * 模型
 */
class Member extends Model
{
    protected $autoWriteTimestamp = true;
    protected $updateTime = false;
    protected $createTime = 'reg_time';
    protected $insert = ['status' => 1, 'reg_ip'];

    protected function setRegIpAttr()
    {
        return request()->ip(1);
    }

    /**
     * 注册一个新用户
     * @param string $username  用户名
     * @param string $password  密码
     * @param string $email     邮箱
     * @param string $mobile    手机号
     * @param array $extend    扩展参数
     */
    public function add($data)
    {
        $passwordinfo = encrypt_password($data['password']); //对密码进行处理
        $data['password'] = $passwordinfo['password'];
        $data['encrypt'] = $passwordinfo['encrypt'];
        $data['amount'] = 0;

        if (false !== $this->save($data)) {
            return true;
        } else {
            $this->error = $this->getError() ?: '注册失败！';
            return false;
        }
    }

    public function edit($data)
    {
        if (empty($data)) {
            $this->error = '编辑会员数据不能为空！';
            return false;
        }

        // 查询会员是否存在
        $member = $this->whereColumn('id', $data['id'])->find();
        if (empty($member)) {
            $this->error = '该会员不存在！';
            return false;
        }

        // 修改密码
        if ($data['password']) {
            if ($data['password'] != $data['password_confirm']) {
                $this->error = '两次密码输入不一致！';
                return false;
            }
            $passwordinfo = encrypt_password($data['password']); //对密码进行处理
            array_push($fields, 'password', 'encrypt');
            $data['password'] = $passwordinfo['password'];
            $data['encrypt'] = $passwordinfo['encrypt'];
        }

        if (false !== $this->update($data, [])) {
            return true;
        } else {
            $this->error = '会员修改失败！';
            return false;
        }
    }

    //会员配置缓存
    public function member_cache()
    {
        $data = unserialize(db('Module')->where(['module' => 'member'])->value('setting'));
        cache("Member_Config", $data);
        return $data;
    }

}
