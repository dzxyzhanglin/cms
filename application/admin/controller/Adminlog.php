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
// | 日志首页
// +----------------------------------------------------------------------
namespace app\admin\controller;

use app\admin\model\Adminlog as Adminlog_Model;
use app\common\controller\Adminbase;
use think\Db;

class Adminlog extends Adminbase
{
    protected function initialize()
    {
        parent::initialize();
        $this->Adminlog_Model = new Adminlog_Model;
    }
    //日志首页
    public function index()
    {
        if ($this->request->isAjax()) {
            $limit = $this->request->param('limit/d', 10);
            $page = $this->request->param('page/d', 10);
            $data = Db::name("adminlog")
                ->page($page, $limit)
                ->order('id', 'desc')
                ->withAttr('create_time', function ($value, $data) {
                    return date('Y-m-d H:i:s', $value);
                })
                ->withAttr('ip', function ($value, $data) {
                    return long2ip($value);
                })
                ->select();
            $total = Db::name("adminlog")->order('id', 'desc')->count();
            $result = array("code" => 0, "count" => $total, "data" => $data);
            return json($result);
        }
        return $this->fetch();
    }

    //删除一个月前的操作日志
    public function deletelog()
    {
        if ($this->Adminlog_Model->deleteAMonthago()) {
            $this->success("删除日志成功！");
        } else {
            $this->error("删除日志失败！");
        }
    }

}
