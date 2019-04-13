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
// | 后台首页
// +----------------------------------------------------------------------
namespace app\admin\controller;

use app\admin\service\User;
use app\common\controller\Adminbase;
use think\facade\Cache;
use think\Db;

class Index extends Adminbase
{
    //后台首页
    public function index()
    {
        $this->assign('userInfo', $this->_userinfo);
        $this->assign("SUBMENU_CONFIG", json_encode(model("admin/Menu")->getMenuList()));
        $this->assign('config', cache('Config'));
        return $this->fetch();
    }

    //登录判断
    public function login()
    {
        if (User::instance()->isLogin()) {
            $this->redirect('admin/index/index');
        }
        if ($this->request->isPost()) {
            $data = $this->request->post();
            //验证码
            if (!captcha_check($data['verify'])) {
                $this->error('验证码输入错误！');
                return false;
            }
            // 验证数据
            $rule = [
                'username|用户名' => 'require|alphaDash|length:3,20',
                'password|密码' => 'require|length:3,20',
            ];
            $result = $this->validate($data, $rule);
            if (true !== $result) {
                $this->error($result);
            }
            if (User::instance()->login($data['username'], $data['password'])) {
                $this->success('恭喜您，登陆成功', url('admin/Index/index'));
            } else {
                $this->error("用户名或者密码错误，登陆失败！", url('admin/index/login'));
            }

        } else {
            $this->assign('config', cache('Config'));
            return $this->fetch();
        }
    }

    /**
     * 修改密码
     */
    public function updatePwd()
    {
        if ($this->request->isPost()) {
            $data = $this->request->post();
            $rule = [
                'password_old|旧密码' => 'require',
                'password|密码' => 'require|confirm'
            ];
            $result = $this->validate($data, $rule);
            if (true !== $result) {
                $this->error($result);
            }

            $userInfo = $this->_userinfo;
            if (encrypt_password($data['password_old'], $userInfo['encrypt'])
                != $userInfo['password']) {
                $this->error('旧密码错误');
            }

            $passwordinfo = encrypt_password($data['password']); //对密码进行处理
            $arr = [];
            $arr['encrypt'] = $passwordinfo['encrypt'];
            $arr['password'] = $passwordinfo['password'];

            $status = Db::name("admin")->where(array('userid'=>$userInfo['userid']))->update($arr);

            if (false !== $status) {
                $this->success('密码修改成功');
            } else {
                $this->error('密码修改失败');
            }
        } else {
            return $this->fetch();
        }
    }


    //手动退出登录
    public function logout()
    {
        if (User::instance()->logout()) {
            //手动登出时，清空forward
            //cookie("forward", NULL);
            $this->success('注销成功！', url("admin/index/login"));
        }
    }

    //缓存更新
    public function cache()
    {
        $type = $this->request->request("type");
        switch ($type) {
            case 'data' || 'all':
                rmdirs(ROOT_PATH . 'runtime' . DIRECTORY_SEPARATOR . 'cache');
                Cache::clear();
                if ($type == 'content') {
                    break;
                }

            case 'template' || 'all':
                rmdirs(ROOT_PATH . 'runtime' . DIRECTORY_SEPARATOR . 'temp');
                if ($type == 'template') {
                    break;
                }
        }
        $this->success('清理缓存');
    }

}
