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
namespace app\cms\controller;

use app\cms\model\Cms as Cms_Model;
use app\cms\model\Page as Page_Model;
use app\common\controller\Adminbase;
use think\Db;

class Cms extends Adminbase
{
    protected function initialize()
    {
        parent::initialize();
        $this->Cms_Model = new Cms_Model;
    }

    public function index()
    {
        return $this->fetch();
    }

    //栏目信息列表
    public function classlist()
    {
        $catid = $this->request->param('catid/d', 0);
        $limit = $this->request->param('limit/d', 10);
        $page = $this->request->param('page/d', 10);

        //当前栏目信息
        $catInfo = getCategory($catid);
        if (empty($catInfo)) {
            $this->error('该栏目不存在！');
        }
        //栏目所属模型
        $modelid = $catInfo['modelid'];
        //检查模型是否被禁用
        if (!getModel($modelid, 'status')) {
            $this->error('模型被禁用！');
        }

        if ($this->request->isAjax()) {
            $searchField = $this->request->param('searchField/a', '');
            $where[] = ['catid', '=', $catid];
            if (!empty($searchField)) {
                foreach ($searchField as $field) {
                    $frr =  explode(':', $field);
                    if (!empty($frr[2])) {
                        if ($frr[1] == 'text') {
                            $where[] = [$frr[0], 'like', '%' . $frr[2] . '%'];
                        } else if ($frr[1] == 'select') {
                            $where[] = [$frr[0], '=', $frr[2]];
                        }
                    }
                }
            }

            $modelCache = cache("Model");
            $tableName = $modelCache[$modelid]['tablename'];
            $total = Db::name(ucwords($tableName))->where($where)->count();
            $list = Db::name(ucwords($tableName))->page($page, $limit)->where($where)->order(['listorder', 'id' => 'desc'])->select();
            $_list = [];
            foreach ($list as $k => $v) {
                $v['updatetime'] = date('Y-m-d H:i:s', $v['updatetime']);
                $v['url'] = buildContentUrl($v['catid'], $v['id']);
                $_list[$v['id']] = $v;
            }
            $result = array("code" => 0, "count" => $total, "data" => $_list);
            return json($result);
        }

        // 当前可搜索字段
        $searchFieldList = $this->Cms_Model->getSearchFieldList($modelid);
        $this->assign('searchFieldList', $searchFieldList);

        $this->assign('catid', $catid);
        return $this->fetch();

    }

    //添加栏目
    public function add()
    {
        if ($this->request->isPost()) {
            $data = $this->request->post();
            $catid = intval($data['modelField']['catid']);
            if (empty($catid)) {
                $this->error("请指定栏目ID！");
            }
            $category = getCategory($catid);
            if (empty($category)) {
                $this->error('该栏目不存在！');
            }
            if ($category['type'] == 2) {
                $data['modelFieldExt'] = isset($data['modelFieldExt']) ? $data['modelFieldExt'] : [];
                try {
                    $this->Cms_Model->addModelData($data['modelField'], $data['modelFieldExt']);
                } catch (\Exception $ex) {
                    $this->error($ex->getMessage());
                }
            } else if ($category['type'] == 1) {
                $Page_Model = new Page_Model;
                if (!$Page_Model->savePage($data['modelField'])) {
                    $error = $Page_Model->getError();
                    $this->error($error ? $error : '操作失败！');
                }
            }
            $this->success('操作成功！');
        } else {
            $catid = $this->request->param('catid/d', 0);
            $category = getCategory($catid);
            if (empty($category)) {
                $this->error('该栏目不存在！');
            }
            if ($category['type'] == 2) {
                $modelid = $category['modelid'];
                $fieldList = $this->Cms_Model->getFieldList($modelid);
                $this->assign([
                    'catid' => $catid,
                    'fieldList' => $fieldList,
                ]);
                return $this->fetch();
            } else if ($category['type'] == 1) {
                $Page_Model = new Page_Model;
                $info = $Page_Model->getPage($catid);
                $this->assign([
                    'info' => $info,
                    'catid' => $catid,
                ]);
                return $this->fetch('singlepage');
            }

        }
    }

    //编辑信息
    public function edit()
    {
        if ($this->request->isPost()) {
            $data = $this->request->post();
            $data['modelFieldExt'] = isset($data['modelFieldExt']) ? $data['modelFieldExt'] : [];
            try {
                $this->Cms_Model->editModelData($data['modelField'], $data['modelFieldExt']);
            } catch (\Exception $ex) {
                $this->error($ex->getMessage());
            }
            $this->success('编辑成功！');

        } else {
            $catid = $this->request->param('catid/d', 0);
            $id = $this->request->param('id/d', 0);
            $category = getCategory($catid);
            if (empty($category)) {
                $this->error('该栏目不存在！');
            }
            if ($category['type'] == 2) {
                $modelid = $category['modelid'];
                $fieldList = $this->Cms_Model->getFieldList($modelid, $id);
                $this->assign([
                    'catid' => $catid,
                    'fieldList' => $fieldList,
                ]);
                return $this->fetch();
            } else {
                return $this->fetch('singlepage');
            }

        }

    }

    //删除
    public function delete($ids = 0)
    {
        $catid = $this->request->param('catid/d', 0);
        $ids = $this->request->param('ids/a', null);
        if (empty($ids) || !$catid) {
            $this->error('参数错误！');
        }
        if (!is_array($ids)) {
            $ids = array(0 => $ids);
        }
        $modelid = getCategory($catid, 'modelid');
        try {
            $this->Cms_Model->deleteModelData($modelid, $ids);
        } catch (\Exception $ex) {
            $this->error($ex->getMessage());
        }
        $this->success('删除成功！');
    }

    //面板
    public function panl()
    {
        $info['category'] = Db::name('Category')->count();
        $info['model'] = Db::name('Model')->where(['module' => 'cms'])->count();
        $info['tags'] = Db::name('Tags')->count();
        $info['doc'] = 0;
        $modellist = cache('Model');
        foreach ($modellist as $model) {
            if ($model['module'] !== 'cms') {
                continue;
            }
            $tmp = Db::name($model['tablename'])->count();
            $info['doc'] += $tmp;
        }
        $this->assign('info', $info);
        return $this->fetch();
    }

    //显示栏目菜单列表
    public function public_categorys()
    {
        $json = [];
        $categorys = cache('Category');
        foreach ($categorys as $rs) {
            $rs = getCategory($rs['id']);
            //剔除无子栏目外部链接
            if ($rs['type'] == 3 && $rs['child'] == 0) {
                continue;
            }
            $data = array(
                'id' => $rs['id'],
                'parentid' => $rs['parentid'],
                'catname' => $rs['catname'],
                'type' => $rs['type'],
            );
            //终极栏目
            if ($rs['child'] == 0) {
                $data['target'] = 'right';
                $data['url'] = url('cms/cms/classlist', array('catid' => $rs['id']));
            } else {
                $data['isParent'] = true;
            }
            //单页
            if ($rs['type'] == 1) {
                $data['target'] = 'right';
                $data['url'] = url('cms/cms/add', array('catid' => $rs['id']));
            }
            $json[] = $data;
        }
        $this->assign('json', json_encode($json));
        return $this->fetch();
    }

    /**
     * 排序
     */
    public function listorder()
    {
        $catid = $this->request->param('catid/d', 0);
        $id = $this->request->param('id/d', 0);
        $listorder = $this->request->param('value/d', 0);
        $modelid = getCategory($catid, 'modelid');
        $modelCache = cache("Model");
        if (empty($modelCache[$modelid])) {
            return false;
        };
        $tableName = $modelCache[$modelid]['tablename'];
        if (Db::name($tableName)->where('id', $id)->update(['listorder' => $listorder])) {
            $this->success("排序成功！");
        } else {
            $this->error("排序失败！");
        }
    }

    /**
     * 状态
     */
    public function setstate()
    {
        $id = $this->request->param('id/d', 0);
        $catid = $this->request->param('catid/d', 0);
        $status = $this->request->param('status/s') === 'true' ? 1 : 0;

        $modelid = getCategory($catid, 'modelid');
        $modelCache = cache("Model");
        if (empty($modelCache[$modelid])) {
            return false;
        };
        $tableName = $modelCache[$modelid]['tablename'];

        if (Db::name($tableName)->where('id', $id)->update(['status' => $status])) {
            //更新栏目缓存
            cache('Category', null);
            getCategory($id, '', true);
            $this->success('操作成功！');
        } else {
            $this->error('操作失败！');
        }
    }

}
