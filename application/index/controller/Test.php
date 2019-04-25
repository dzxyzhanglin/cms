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
// | cms管理
// +----------------------------------------------------------------------
namespace app\index\controller;
 
use app\common\controller\Base; 
use think\Db;

class Test extends Base
{
    protected function initialize()
    {
        parent::initialize(); 
    }

    /**
     * 首页
     */
    public function index()
    {
		$data = [
			'student_answer' => 'CBD'
		];
		$status = db('exam_record_result')->where('id', 11)->update($data);
		 
        return $status;
    } 
}
