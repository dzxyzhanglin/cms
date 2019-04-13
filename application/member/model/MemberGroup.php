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
// | 会员组模型
// +----------------------------------------------------------------------
namespace app\member\model;

use \think\Model;

/**
 * 模型
 */
class MemberGroup extends Model
{
    //生成会员组缓存
    public function membergroup_cache()
    {
        $data = $this->select();
        if ($data) {
            $data = $data->toArray();
        } else {
            return;
        }
        $return = array();
        foreach ($data as $k => $v) {
            if ($v['expand']) {
                $v['expand'] = unserialize($v['expand']);
            } else {
                $v['expand'] = array();
            }
            $return[$v['id']] = $v;
        }
        cache("Member_Group", $return);
        return $return;
    }

    public function addMemberGroup($data) {
        if (false !== $this->save($data)) {
            // 缓存会员组数据
            $this->membergroup_cache();
            return true;
        } else {
            $this->error = $this->getError() ?: '会员组添加失败！';
            return false;
        }
    }

    public function editMemberGroup($data, $fields) {
        $group = $this->whereColumn('id', $data['id']);
        if (empty($group)) {
            $this->error = '该会员组不存在';
            return false;
        }

        if (false !== $this->update($data, [], $fields)) {
            // 缓存会员组数据
            $this->membergroup_cache();
            return true;
        } else {
            $this->error = $this->getError() ?: '会员组修改失败！';
            return false;
        }
    }

    public function deleteMemberGroup($id) {
        $group = $this->whereColumn('id', $id)->find();
        if (empty($group)) {
            $this->error = '该会员组不存在';
            return false;
        }

        if ($group['issystem'] == 1) {
            $this->error = '该会员组为系统组，不能删除！';
            return false;
        }

        if (false !== $this->whereColumn('id', $id)->delete()) {
            // 缓存会员组数据
            $this->membergroup_cache();
            return true;
        } else {
            $this->error = '该会员组删除失败';
            return false;
        }
    }
}
