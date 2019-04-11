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
// | 后台控制模块
// +----------------------------------------------------------------------
namespace app\common\controller;

use app\admin\service\User;

class Adminbase extends Base
{
    public $_userinfo; //当前登录账号信息
    //初始化
    protected function initialize()
    {
        parent::initialize();

        //过滤不需要登陆的行为
        $allowUrl = [
            'admin/index/login',
            'admin/index/logout',
        ];

        $rule = strtolower($this->request->module() . '/' . $this->request->controller() . '/' . $this->request->action());

        if (!in_array($rule, $allowUrl)) {
            if (defined('UID')) {
                return;
            }
            define('UID', (int) User::instance()->isLogin());
            if (false == $this->competence()) {
                //跳转到登录界面
                $this->error('请先登陆', url('admin/index/login'));
            } else {
                //是否超级管理员
                if (!User::instance()->isAdministrator()) {
                    //检测访问权限
                    if (!$this->checkRule($rule, [1, 2])) {
                        $this->error('未授权访问!');
                    }
                }
            }
        }
    }

    /**
     * 验证登录
     * @return boolean
     */
    private function competence()
    {
        //检查是否登录
        $uid = (int) User::instance()->isLogin();
        if (empty($uid)) {
            return false;
        }
        //获取当前登录用户信息
        $this->_userinfo = $userInfo = User::instance()->getInfo();
        if (empty($userInfo)) {
            User::instance()->logout();
            return false;
        }
        //是否锁定
        if (!$userInfo['status']) {
            User::instance()->logout();
            $this->error('您的帐号已经被锁定！', url('admin/index/login'));
            return false;
        }
        return $userInfo;

    }

    /**
     * 操作错误跳转的快捷方法
     */
    final public function error($msg = '', $url = null, $data = '', $wait = 3, array $header = [])
    {
        model('admin/Adminlog')->record($msg, 0);
        parent::error($msg, $url, $data, $wait, $header);
    }

    /**
     * 操作成功跳转的快捷方法
     */
    final public function success($msg = '', $url = null, $data = '', $wait = 3, array $header = [])
    {
        model('admin/Adminlog')->record($msg, 1);
        parent::success($msg, $url, $data, $wait, $header);
    }

    /**
     * 权限检测
     * @param string  $rule    检测的规则
     * @param string  $mode    check模式
     * @return boolean
     */
    final protected function checkRule($rule, $type = AuthRule::RULE_URL, $mode = 'url')
    {
        static $Auth = null;
        if (!$Auth) {
            $Auth = new \libs\Auth();
        }
        if (!$Auth->check($rule, UID, $type, $mode)) {
            return false;
        }
        return true;
    }

}
