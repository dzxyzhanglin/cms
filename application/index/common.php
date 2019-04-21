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
// | cms函数文件
// +----------------------------------------------------------------------

use think\facade\Cache;


/**
 * 当前路径
 * 返回指定栏目路径层级
 * @param $catid 栏目id
 * @param $symbol 栏目间隔符
 */
function catpos($catid, $symbol = ' &gt; ')
{
    if (getCategory($catid) == false) {
        return '';
    }
    //获取当前栏目的 父栏目列表
    $arrparentid = array_filter(explode(',', getCategory($catid, 'arrparentid') . ',' . $catid));
    foreach ($arrparentid as $cid) {
        $url = buildCatUrl(getCategory($cid, 'type'), $cid, getCategory($cid, 'url'));
        $parsestr[] = '<a href="' . $url . '" >' . getCategory($cid, 'catname') . '</a>';
    }
    $parsestr = implode($symbol, $parsestr);
    return $parsestr;
}



/**
 * 生成分类信息中的筛选菜单
 */
function filters($modelid)
{
    $options = cache('ModelField')[$modelid];
    $data = [];
    foreach ($options as $_k => $_v) {
        if (isset($_v['filtertype']) && $_v['filtertype']) {
            $_v['options'] = parse_attr($_v['options']);
        } else {
            continue;
        }
        $data[$_v['name']] = $_v;
    }
    $param = paramdecode(input('condition'));
    $catid = input('catid');
    $conditionParam = [];
    foreach ($data as $name => $rs) {
        //选中
        if (!empty($param[$name])) {
            $conditionParam[$name]['options'][$param[$name]]['active'] = true;
            $nowParam = $param;
            $nowParam[$name] = '';
            $conditionParam[$name]['options'][$param[$name]]['param'] = paramencode($nowParam);
            unset($nowParam);
        }
        $conditionParam[$name]['title'] = $rs['title'];
        $conditionParam[$name]['name'] = $rs['name'];

        //未选中 active param title url
        foreach ($data[$name]['options'] as $k => $v) {
            $conditionParam[$name]['options'][$k]['title'] = $v;
            //未选中条件参数生成
            if (!isset($conditionParam[$name]['options'][$k]['active'])) {
                $conditionParam[$name]['options'][$k]['active'] = 0;
                $nowParam = $param;
                $nowParam[$name] = $k;
                $conditionParam[$name]['options'][$k]['param'] = paramencode($nowParam);
            }

            $conditionParam[$name]['options'][$k]['url'] = url('index/index/lists', ['catid' => $catid, 'condition' => $conditionParam[$name]['options'][$k]['param']]);
            ksort($conditionParam[$name]['options']);
        }
    }
    return $conditionParam;
}

function structure_filters_sql($modelid)
{
    $options = cache('ModelField')[$modelid];
    $data = [];
    foreach ($options as $_k => $_v) {
        if (isset($_v['filtertype']) && $_v['filtertype']) {
            $_v['options'] = parse_attr($_v['options']);
        } else {
            continue;
        }
        $data[$_v['name']] = $_v;
    }
    $fields_key = array_keys($data);

    $sql = '`status` = \'1\'';
    $param = paramdecode(input('condition'));
    foreach ($param as $k => $r) {
        if (in_array($k, $fields_key) && intval($r) != 0) {
            $sql .= " AND `$k` = '$r'";
        }
    }
    return $sql;
}

function paramdecode($str)
{
    $arr = [];
    $arr1 = explode('&', $str);
    foreach ($arr1 as $vo) {
        if (!empty($vo)) {
            $arr2 = explode('=', $vo);
            if (!empty($arr2[1])) {
                $arr[$arr2[0]] = $arr2[1];
            }
        }
    }
    return $arr;
}

function paramencode($arr)
{
    $str = '';
    if (!empty($arr)) {
        foreach ($arr as $key => $vo) {
            if (!empty($vo)) {
                $str .= $key . '=' . $vo . '&';
            }
        }
        $str = substr($str, 0, -1);
    }
    return $str;
}

/**
 * 生成SEO
 * @param $catid        栏目ID
 * @param $title        标题
 * @param $description  描述
 * @param $keyword      关键词
 */
function seo($catid = '', $title = '', $description = '', $keyword = '')
{
    if (!empty($title)) {
        $title = strip_tags($title);
    }
    if (!empty($description)) {
        $description = strip_tags($description);
    }
    if (!empty($keyword)) {
        $keyword = str_replace(' ', ',', strip_tags($keyword));
    }

    $site = cache("Config");
    if (!empty($catid)) {
        $cat = getCategory($catid);
    }

    $seo = [
        'title' => $site['web_site_name'],
        'keyword' => $site['web_site_keyword'],
        'description' => $site['web_site_description']
    ];

    // 标题
    if (isset($title) && !empty($title)) {
        $seo['title'] = $title;
    } else {
        if (isset($cat['setting']['meta_title']) && !empty($cat['setting']['meta_title'])) {
            $seo['title'] = $cat['setting']['meta_title'];
        }
    }
    // 关键词
    if (isset($keyword) && !empty($keyword)) {
        $seo['keyword'] = $keyword;
    } else {
        if (isset($cat['setting']['meta_keywords']) && !empty($cat['setting']['meta_keywords'])) {
            $seo['keyword'] = $cat['setting']['meta_keywords'];
        }
    }
    // 描述
    if (isset($description) && !empty($description)) {
        $seo['description'] = $description;
    } else {
        if (isset($cat['setting']['meta_description']) && !empty($cat['setting']['meta_description'])) {
            $seo['description'] = $cat['setting']['meta_description'];
        }
    }

    foreach ($seo as $k => $v) {
        $seo[$k] = str_replace(array("\n", "\r"), '', $v);
    }
    return $seo;
}
