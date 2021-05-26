<?php
/* config.php */
return array(
    'version' => '4.0.1',
    'web_title' => 'Repair',
    'web_description' => 'ระบบบันทึกข้อมูลงานซ่อม',
    'timezone' => 'Asia/Bangkok',
    'member_status' => array(
        0 => 'สมาชิก',
        1 => 'ผู้ดูแลระบบ',
        2 => 'ช่างซ่อม',
        3 => 'ผู้รับผิดชอบ',
    ),
    'color_status' => array(
        0 => '#259B24',
        1 => '#FF0000',
        2 => '#0E0EDA',
        3 => '#827717',
    ),
    'default_icon' => 'icon-tools',
    'user_forgot' => 0,
    'user_register' => 0,
    'welcome_email' => 0,
    'currency_unit' => 'THB',
    'repair_first_status' => 1,
);
