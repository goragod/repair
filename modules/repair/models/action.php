<?php
/**
 * @filesource modules/repair/models/action.php
 *
 * @copyright 2016 Goragod.com
 * @license http://www.kotchasan.com/license/
 *
 * @see http://www.kotchasan.com/
 */

namespace Repair\Action;

use Gcms\Login;
use Kotchasan\Http\Request;
use Kotchasan\Language;

/**
 * รับงานซ่อม
 *
 * @author Goragod Wiriya <admin@goragod.com>
 *
 * @since 1.0
 */
class Model extends \Kotchasan\Model
{
    /**
     * รับค่า submit จากฟอร์ม action
     *
     * @param Request $request
     *
     * @return JSON
     */
    public function submit(Request $request)
    {
        $ret = array();
        // session, token, can_received_repair, can_repair, ไม่ใช่สมาชิกตัวอย่าง
        if ($request->initSession() && $request->isSafe() && $login = Login::isMember()) {
            if (Login::checkPermission($login, array('can_received_repair', 'can_repair')) && Login::notDemoMode($login)) {
                try {
                    $save = array(
                        'member_id' => $login['id'],
                        'comment' => $request->post('comment')->topic(),
                        'status' => $request->post('status')->toInt(),
                        'operator_id' => $request->post('operator_id', $login['id'])->toInt(),
                        'cost' => $request->post('cost')->toDouble(),
                        'create_date' => date('Y-m-d H:i:s'),
                        'repair_id' => $request->post('repair_id')->toInt(),
                    );
                    // บันทึก
                    $this->db()->insert($this->getTableName('repair_status'), $save);
                    // คืนค่า
                    $ret['alert'] = Language::get('Saved successfully');
                    $ret['modal'] = 'close';
                    $ret['location'] = 'reload';
                    // clear
                    $request->removeToken();
                } catch (\Kotchasan\InputItemException $e) {
                    $ret['alert'] = $e->getMessage();
                }
            }
        }
        if (empty($ret)) {
            $ret['alert'] = Language::get('Unable to complete the transaction');
        }
        // คืนค่าเป็น JSON
        echo json_encode($ret);
    }
}
