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
// | 附件上传模型
// +----------------------------------------------------------------------
namespace app\attachment\model;

use app\admin\service\User;
use think\Image;
use think\Model;

class Attachment extends Model
{
    // 自动写入时间戳
    protected $autoWriteTimestamp = true;

    /**
     * 创建缩略图
     * @param string $file 目标文件，可以是文件对象或文件路径
     * @param string $dir 保存目录，即目标文件所在的目录名
     * @param string $save_name 缩略图名
     * @param string $thumb_size 尺寸
     * @param string $thumb_type 裁剪类型
     * @return string 缩略图路径
     */
    public function create_thumb($file = '', $filename = '', $save_name = '', $thumb_size = '', $thumb_type = '')
    {
        // 获取要生成的缩略图最大宽度和高度
        $thumb_size = $thumb_size == '' ? config('upload_image_thumb') : $thumb_size;
        list($thumb_max_width, $thumb_max_height) = explode(',', $thumb_size);
        // 读取图片
        $image = Image::open($file);
        // 生成缩略图
        $thumb_type = $thumb_type == '' ? config('upload_image_thumb_type') : $thumb_type;
        $image->thumb($thumb_max_width, $thumb_max_height, $thumb_type);

        if (!is_dir($filename)) {
            mkdir($filename, 0766, true);
        }
        $image->save($filename . $save_name);
        return $filename;
    }

    /**
     * 添加水印
     * @param string $file 要添加水印的文件路径
     * @param string $watermark_img 水印图片id
     * @param string $watermark_pos 水印位置
     * @param string $watermark_alpha 水印透明度
     * @author 蔡伟明 <314013107@qq.com>
     */
    public function create_water($file = '', $watermark_img = '', $watermark_pos = '', $watermark_alpha = '')
    {
        $uploadPath = config('upload_path');
        $thumb_water_pic = realpath($uploadPath . '/' . substr($watermark_img, strpos($watermark_img, 'images')));
        if (is_file($thumb_water_pic)) {
            // 读取图片
            $image = Image::open($file);
            // 添加水印
            $watermark_pos = $watermark_pos == '' ? config('upload_thumb_water_position')['key'] : $watermark_pos;
            $watermark_alpha = $watermark_alpha == '' ? config('upload_thumb_water_alpha') : $watermark_alpha;
            $image->water($thumb_water_pic, $watermark_pos, $watermark_alpha);
            // 保存水印图片，覆盖原图
            $image->save($file);
        }
    }

    /**
     * 根据附件id获取路径
     * @param  string|array $id 附件id
     * @param  int $type 类型：0-补全目录，1-直接返回数据库记录的地址
     * @return string|array     路径
     */
    public function getFilePath($id = '', $type = 0)
    {
        $uploadPath = config('public_url') . 'uploads/';
        $isIds = strpos($id, ',') !== false;
        if ($isIds) {
            $ids = explode(',', $id);
            $data_list = $this->where('id', 'in', $ids)->field('path,driver,thumb')->select();
            $paths = [];
            foreach ($data_list as $key => $value) {
                if ($value['driver'] == 'local') {
                    $paths[$key] = ($type == 0 ? $uploadPath : '') . $value['path'];
                } else {
                    $paths[$key] = $value['path'];
                }
            }
            return $paths;
        } else {
            $data = $this->where('id', $id)->field('path,driver,thumb')->find();
            if ($data) {
                if ($data['driver'] == 'local') {
                    return ($type == 0 ? $uploadPath : '') . $data['path'];
                } else {
                    return $data['path'];
                }
            } else {
                return false;
            }
        }
    }

    /**
     * 根据图片id获取缩略图路径，如果缩略图不存在，则返回原图路径
     * @param string $id 图片id
     * @return mixed
     */
    /*public function getThumbPath($id = '')
    {
    $uploadUrl = config('public_url') . 'uploads/';
    $isIds = strpos($id, ',') !== false;
    if ($isIds) {
    $ids = explode(',', $id);
    $result = $this->where('id', 'in', $ids)->field('path,driver,thumb')->select();

    } else {
    $result = $this->where('id', $id)->field('path,driver,thumb')->find();
    if ($result) {
    if ($result['driver'] == 'local') {
    return $result['thumb'] != '' ? $uploadUrl . $result['thumb'] : $uploadUrl . $result['path'];
    } else {
    return $result['thumb'] != '' ? $result['thumb'] : $result['path'];
    }
    } else {
    return $result;
    }
    }
    }*/

    /**
     * 根据附件id获取名称
     * @param  string $id 附件id
     * @return string     名称
     */
    public function getFileName($id = '')
    {
        return $this->where('id', $id)->value('name');
    }

    public function deleteFile($id)
    {
        $path = config('upload_path');
        $isAdministrator = User::instance()->isAdministrator();
        $uid = (int) User::instance()->isLogin();

        if (is_array($id)) {
            $files_path = $isAdministrator ? self::where('id', 'in', $id)->column('path,thumb', 'id') : self::where('id', 'in', $id)->where('uid', $uid)->column('path,thumb', 'id');
            if (!empty($files_path)) {
                $mes = '';
                $id = [];
                foreach ($files_path as $key => $value) {
                    $real_path = realpath($path . '/' . $value['path']);
                    $real_path_thumb = realpath($path . '/' . $value['thumb']);

                    if (is_file($real_path) && !unlink($real_path)) {
                        $mes .= "删除" . $real_path . "失败，";
                    }
                    if (is_file($real_path_thumb) && !unlink($real_path_thumb)) {
                        $mes .= "删除" . $real_path_thumb . "失败，";
                    }
                    $id[] = $key;
                }
                self::where('id', 'in', $id)->delete();
                if ('' != $mes) {
                    throw new \Exception($mes);
                }
            } else {
                throw new \Exception($isAdministrator ? "文件数据库记录已不存在~" : "没有权限删除别人上传的附件~");
            }
        } else {
            $file_path = $isAdministrator ? self::where('id', $id)->field('path,thumb')->find() : self::where('id', $id)->where('uid', $uid)->field('path,thumb')->find();
            if (isset($file_path['path'])) {
                $real_path = realpath($path . '/' . $file_path['path']);
                $real_path_thumb = realpath($path . '/' . $file_path['thumb']);

                if (is_file($real_path) && !unlink($real_path)) {
                    throw new \Exception("删除" . $real_path . "失败");
                }
                if (is_file($real_path_thumb) && !unlink($real_path_thumb)) {
                    throw new \Exception("删除" . $real_path_thumb . "失败");
                }
                self::where('id', $id)->delete();
            } else {
                throw new \Exception($isAdministrator ? "文件数据库记录已不存在~" : "没有权限删除别人上传的附件~");
            }
        }
    }

}
