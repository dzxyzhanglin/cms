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
// | 会员管理
// +----------------------------------------------------------------------
namespace app\member\controller;

use app\common\controller\Adminbase;
use app\member\model\Member as Member_Model;
use think\Db;

class Member extends Adminbase
{
    //初始化
    protected function initialize()
    {
        parent::initialize();
        $this->Member_Model = new Member_Model;
        $this->groupCache = cache("Member_Group"); //会员模型
    }

    /**
     * 会员列表
     */
    public function index()
    {
        if ($this->request->isAjax()) {
            $limit = $this->request->param('limit/d', 10);
            $page = $this->request->param('page/d', 10);
            $where = [];

            $_list = $this->Member_Model
                ->where($where)
                ->page($page, $limit)
                ->select()
                ->withAttr('reg_ip', function ($value, $data) {
                    return long2ip($value);
                })
                ->withAttr('last_login_time', function ($value, $data) {
                    if ($value) {
                        return time_format($value, 'Y-m-d');
                    } else {
                        return '';
                    }
                })
                ->withAttr('reg_time', function($value, $data) {
                    return time_format($value, 'Y-m-d');
                });
            $total = $this->Member_Model->where($where)->count();
            $result = array("code" => 0, "count" => $total, "data" => $_list);
            return json($result);

        }
        return $this->fetch();
    }

    /**
     * 会员增加
     */
    public function add()
    {
        if ($this->request->isPost()) {
            $data = $this->request->post();
            $result = $this->validate($data, 'member');
            if (true !== $result) {
                return $this->error($result);
            }
            $status = $this->Member_Model->add($data);
            if (false !== $status) {
                $this->success("添加会员成功！", url("member/member/index"));
            } else {
                $this->error("添加会员失败！");
            }
        } else {
            foreach ($this->groupCache as $g) {
                if (in_array($g['id'], array(8, 1, 7))) {
                    continue;
                }
                $groupCache[$g['id']] = $g['name'];
            }
            $this->assign('groupCache', $groupCache);
            $this->assign('sexs', array('男' => '男', '女' => '女'));
            return $this->fetch();
        }
    }

    /**
     * 会员编辑
     */
    public function edit()
    {
        if ($this->request->isPost()) {
            $data = $this->request->post();
            $result = $this->validate($data, '\app\member\validate\Member.edit');
            if (true !== $result) {
                return $this->error($result);
            }

            $status = $this->Member_Model->edit($data);
            if ($status) {
                $this->success("修改成功！", url("member/member/index"));
            } else {
                $error = $this->Member_Model->getError();
                $this->error($error ? $error : '会员修改失败！');
            }
        } else {
            $userid = $this->request->param('id', 0);
            //主表
            $data = $this->Member_Model->where(["id" => $userid])->find();
            if (empty($data)) {
                $this->error("该会员不存在！");
            }
            foreach ($this->groupCache as $g) {
                if (in_array($g['id'], array(8, 1, 7))) {
                    continue;
                }
                $groupCache[$g['id']] = $g['name'];
            }
            $this->assign('groupCache', $groupCache);
            $this->assign('sexs', array('男' => '男', '女' => '女'));
            $this->assign("data", $data);

            return $this->fetch();
        }

    }

    /**
     * 会员删除
     */
    public function delete()
    {
        $id = $this->request->param('id/d');
        empty($id) && $this->error('参数不能为空！');
        if ($this->Member_Model->where(['id' => $id])->delete()) {
            $this->success('操作成功！');
        } else {
            $this->error('操作失败！');
        }
    }

    /**
     * 会员状态
     */
    public function setstate()
    {
        $id = $this->request->param('id/d');
        empty($id) && $this->error('参数不能为空！');
        $status = $this->request->param('status/s') === 'true' ? 1 : 0;
        if ($this->Member_Model->update(['status' => $status], ['id' => $id])) {
            $this->success('操作成功！');
        } else {
            $this->error('操作失败！');
        }
    }
}
