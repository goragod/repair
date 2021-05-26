<?php
/**
 * @filesource modules/repair/controllers/repair.php
 *
 * @copyright 2016 Goragod.com
 * @license http://www.kotchasan.com/license/
 *
 * @see http://www.kotchasan.com/
 */

namespace Repair\Repair;

use Kotchasan\Http\Request;

/**
 * Controller สำหรับแสดงหน้าเว็บ
 *
 * @author Goragod Wiriya <admin@goragod.com>
 *
 * @since 1.0
 */
class Controller extends \Gcms\Controller
{
    /**
     * หน้าสำหรับแสดงรายละเอียดการซ่อมสำหรับลูกค้า
     *
     * @param Request $request
     */
    public function index(Request $request)
    {
        if (preg_match('/([A-Z0-9]{10,12})/', $request->get('id')->toString(), $match)) {
            // session cookie
            $request->initSession();
            // อ่านข้อมูลการทำรายการ
            $index = \Repair\Export\Model::get($match[1]);
            if ($index) {
                $detail = createClass('Repair\Repair\View')->render($index);
            }
        }
        if (empty($detail)) {
            // ไม่พบโมดูลหรือไม่มีสิทธิ
            new \Kotchasan\Http\NotFound();
        } else {
            // แสดงผล
            echo $detail;
        }
    }
}
