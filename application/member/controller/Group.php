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
// | 会员组管理
// +----------------------------------------------------------------------
namespace app\member\controller;

use app\common\controller\Adminbase;
use app\member\model\MemberGroup as MemberGroup_Model;
use think\Db;

class Group extends Adminbase
{
    //初始化
    protected function initialize()
    {
        parent::initialize();
        $this->MemberGroup_Model = new MemberGroup_Model;
    }

    //
    public function index()
    {
        if ($this->request->isAjax()) {
            $limit = $this->request->param('limit/d', 10);
            $page = $this->request->param('page/d', 10);
            $where = [];
            $_list = $this->MemberGroup_Model->where($where)->page($page, $limit)->select();
            $total = $this->MemberGroup_Model->where($where)->count();
            $result = array("code" => 0, "count" => $total, "data" => $_list);
            return json($result);
        }
        return $this->fetch();
    }

    public function add()
    {
        if ($this->request->isPost()) {
            $data = $this->request->post();
            $result = $this->validate($data, 'member_group');
            if (true !== $result) {
                return $this->error($result);
            }
            $status = $this->MemberGroup_Model->addMemberGroup($data);
            if (false !== $status) {
                $this->success("添加会员组成功！", url("member/group/index"));
            } else {
                $this->error("添加会员组失败！");
            }
        } else {
            return $this->fetch();
        }
    }

    public function edit()
    {
        if ($this->request->isPost()) {
            $data = $this->request->post();
            $result = $this->validate($data, 'member_group');
            if (true !== $result) {
                return $this->error($result);
            }
            $status = $this->MemberGroup_Model->editMemberGroup($data, ['id', 'name', 'description']);
            if (false !== $status) {
                $this->success("编辑会员组成功！", url("member/group/index"));
            } else {
                $this->error("编辑会员组失败！");
            }
        } else {
            $id = $this->request->param('id/d', 0);
            $data = $this->MemberGroup_Model->where(["id" => $id])->find();
            $this->assign('data', $data);

            return $this->fetch();
        }
    }

    public function delete()
    {
        $id = $this->request->param('id');
        if (!$id) {
            $this->error("请指定需要删除的会员组！");
        }

        if (false == $this->MemberGroup_Model->deleteMemberGroup($id)) {
            $this->error($this->MemberGroup_Model->getError());
        }

        $this->success("会员组删除成功！", url('member/group/index'));
    }
}
