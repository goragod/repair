-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 02, 2021 at 01:57 PM
-- Server version: 10.1.44-MariaDB
-- PHP Version: 7.2.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

-- --------------------------------------------------------

--
-- Table structure for table `{prefix}_category`
--

CREATE TABLE `{prefix}_category` (
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(11) DEFAULT 0,
  `topic` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `color` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `{prefix}_category`
--

INSERT INTO `{prefix}_category` (`type`, `category_id`, `topic`, `color`, `published`) VALUES
('repairstatus', 1, 'แจ้งซ่อม', '#660000', 1),
('repairstatus', 2, 'กำลังดำเนินการ', '#120eeb', 1),
('repairstatus', 3, 'รออะไหล่', '#d940ff', 1),
('repairstatus', 4, 'ซ่อมสำเร็จ', '#06d628', 1),
('repairstatus', 5, 'ซ่อมไม่สำเร็จ', '#FF0000', 1),
('repairstatus', 6, 'เปลี่ยนสินค้าชิ้นใหม่', '#ff6969', 1),
('repairstatus', 7, 'ยกเลิกการซ่อม', '#FF6600', 1),
('repairstatus', 8, 'ชำระเงิน', '#006600', 1),
('repairstatus', 9, 'ส่งมอบสินค้าคืนลูกค้าเรียบร้อย', '#2A2A2A', 1);
-- --------------------------------------------------------

--
-- Table structure for table `{prefix}_language`
--

CREATE TABLE `{prefix}_language` (
  `id` int(11) NOT NULL,
  `key` text COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `owner` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `js` tinyint(1) NOT NULL,
  `th` text COLLATE utf8_unicode_ci,
  `en` text COLLATE utf8_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `{prefix}_inventory`
--

CREATE TABLE `{prefix}_inventory` (
  `id` int(11) NOT NULL,
  `equipment` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `serial` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `create_date` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `{prefix}_repair`
--

CREATE TABLE `{prefix}_repair` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `inventory_id` int(11) NOT NULL,
  `job_id` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `job_description` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `create_date` datetime NOT NULL,
  `appointment_date` date DEFAULT NULL,
  `appraiser` decimal(10,2) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `{prefix}_repair_status`
--

CREATE TABLE `{prefix}_repair_status` (
  `id` int(11) NOT NULL,
  `repair_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `operator_id` int(11) NOT NULL,
  `comment` varchar(1000) NOT NULL,
  `member_id` int(11) NOT NULL,
  `create_date` datetime NOT NULL,
  `cost` decimal(10,2) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `{prefix}_user`
--

CREATE TABLE `{prefix}_user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `salt` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0,
  `permission` text COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `sex` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_card` varchar(13) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provinceID` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `province` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zipcode` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(2) COLLATE utf8_unicode_ci DEFAULT 'TH',
  `visited` int(11) DEFAULT 0,
  `lastvisited` int(11) DEFAULT 0,
  `session_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `active` tinyint(1) DEFAULT 1,
  `social` tinyint(1) DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Indexes for table `{prefix}_category`
--
ALTER TABLE `{prefix}_category`
  ADD KEY `type` (`type`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `{prefix}_inventory`
--
ALTER TABLE `{prefix}_inventory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `{prefix}_language`
--
ALTER TABLE `{prefix}_language`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `{prefix}_repair`
--
ALTER TABLE `{prefix}_repair`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `job_id` (`job_id`);

--
-- Indexes for table `{prefix}_repair_status`
--
ALTER TABLE `{prefix}_repair_status`
  ADD PRIMARY KEY (`id`),
  ADD KEY `repair_id` (`repair_id`);

--
-- Indexes for table `{prefix}_user`
--
ALTER TABLE `{prefix}_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`),
  ADD KEY `token` (`token`),
  ADD KEY `phone` (`phone`);

--
-- AUTO_INCREMENT for table `{prefix}_language`
--
ALTER TABLE `{prefix}_language`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `{prefix}_repair`
--
ALTER TABLE `{prefix}_repair`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `{prefix}_repair_status`
--
ALTER TABLE `{prefix}_repair_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `{prefix}_inventory`
--
ALTER TABLE `{prefix}_inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `{prefix}_user`
--
ALTER TABLE `{prefix}_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
