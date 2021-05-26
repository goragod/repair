<?php
/**
 * modules/repair/print.php
 *
 * @author Goragod Wiriya <admin@goragod.com>
 * @copyright 2016 Goragod.com
 * @license http://www.kotchasan.com/license/
 *
 * @see http://www.kotchasan.com/
 */
// load Kotchasan
include '../../load.php';
// Initial Kotchasan Framework
$app = Kotchasan::createWebApplication('Gcms\Config');
$app->defaultController = 'Repair\Export\Controller';
$app->run();
