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
// | sitemap管理
// +----------------------------------------------------------------------
namespace app\sitemap\controller;

use app\common\controller\Adminbase;
use app\sitemap\lib\Sitemap as Sitemap_Class;
use think\Db;

class Index extends Adminbase
{
    public function index()
    {
        if ($this->request->isPost()) {
            $data = $this->request->post();
            $Sitemap = new Sitemap_Class();
            $rootUrl = $this->request->domain();
            $data['num'] = intval($data['num']);

            $Sitemap->AddItem($rootUrl, intval($data['index']['priority']), $data['index']['changefreq'], time());

            //栏目
            $List = Db::name('Category')->where('status', 1)->order('id desc')->field('id,url')->select();
            if (!empty($List)) {
                foreach ($List as $vo) {
                    $Sitemap->AddItem(url('cms/index/lists', ['catid' => $vo['id']]), intval($data['Category']['priority']), $data['Category']['changefreq'], time());
                }
            }

            //单页
            $List = Db::name('Page')->order('updatetime desc')->field('catid,updatetime')->select();
            if (!empty($List)) {
                foreach ($List as $vo) {
                    $Sitemap->AddItem(url('cms/index/lists', ['catid' => $vo['catid']]), intval($data['content']['priority']), $data['content']['changefreq'], $v['updatetime']);
                }
            }

            //列表
            $modelList = cache('Model');
            if (!empty($modelList)) {
                $num = 1;
                $volist = [];
                foreach ($modelList as $vo) {
                    $volist = Db::name($vo['tablename'])->where('status', 1)->order('updatetime desc')->field('id,catid,updatetime')->select();
                    if (!empty($volist)) {
                        foreach ($volist as $v) {
                            $Sitemap->AddItem(url('cms/index/shows', ['catid' => $v['catid'], 'id' => $v['id']]), intval($data['content']['priority']), $data['content']['changefreq'], $v['updatetime']);
                            $num++;
                            if ($num >= $data['num']) {
                                break;
                            }
                        }
                    }
                }
            }
            try {
                $Sitemap->SaveToFile(ROOT_PATH . 'sitemap.xml');
            } catch (\Exception $ex) {
                $this->error($ex->getMessage());
            }
            $this->success("sitemap.xml文件已生成到网站根目录");

        } else {

            if (is_file(ROOT_PATH . 'sitemap.xml')) {
                $make_xml_time = date('Y-m-d H:i:s', filectime(ROOT_PATH . 'sitemap.xml'));
                $this->assign('make_xml_time', $make_xml_time);
            }
            if (is_file(ROOT_PATH . 'sitemap.txt')) {
                $make_txt_time = date('Y-m-d H:i:s', filectime(ROOT_PATH . 'sitemap.txt'));
                $this->assign('make_txt_time', $make_txt_time);
            }
            return $this->fetch();
        }
    }

}
