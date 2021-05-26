<?php
/**
 * @filesource modules/repair/controllers/export.php
 *
 * @copyright 2016 Goragod.com
 * @license http://www.kotchasan.com/license/
 *
 * @see http://www.kotchasan.com/
 */

namespace Repair\Export;

use Gcms\Login;
use Kotchasan\Http\Request;

/**
 * export.php
 *
 * @author Goragod Wiriya <admin@goragod.com>
 *
 * @since 1.0
 */
class Controller extends \Gcms\Controller
{
    /**
     * หน้าสำหรับพิมพ์ (print.html)
     *
     * @param Request $request
     */
    public function index(Request $request)
    {
        // session cookie
        $request->initSession();
        // can_received_repair, can_repair
        if (Login::checkPermission(Login::isMember(), array('can_received_repair', 'can_repair'))) {
            // ตรวจสอบ id ที่ต้องการ
            if (preg_match('/([A-Z0-9]{10,12})/i', $request->get('id')->toString(), $match)) {
                // อ่านข้อมูลการทำรายการ
                $index = \Repair\Export\Model::get($match[1]);
                if ($index) {
                    $detail = createClass('Repair\Export\View')->render($index);
                }
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
