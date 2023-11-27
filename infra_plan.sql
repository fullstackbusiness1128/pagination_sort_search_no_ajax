/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : infra_plan

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2019-03-27 12:35:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for customers
-- ----------------------------
DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customers
-- ----------------------------
INSERT INTO `customers` VALUES ('1', 'jang', 'Male', 'love@outlook.com', '2019-03-27 04:25:47', '2019-03-27 04:25:47');
INSERT INTO `customers` VALUES ('2', 'ssss', 'Female', 'sss@out.com', '2019-03-27 04:26:08', '2019-03-27 04:26:08');
INSERT INTO `customers` VALUES ('3', 'adf', 'Male', 'adsf@ou.com', '2019-03-27 04:27:38', '2019-03-27 04:27:38');
INSERT INTO `customers` VALUES ('4', 'fff', 'Male', 'ff@tt.com', '2019-03-27 04:33:41', '2019-03-27 04:33:41');
INSERT INTO `customers` VALUES ('5', 'dsf', 'Male', 'ff@tt.com', '2019-03-27 04:33:46', '2019-03-27 04:33:46');
INSERT INTO `customers` VALUES ('6', 'dsfasdf', 'Male', 'ff@tt.com', '2019-03-27 04:33:54', '2019-03-27 04:33:54');
INSERT INTO `customers` VALUES ('7', 'asdf', 'Male', 'ff@tt.comdd', '2019-03-27 04:34:03', '2019-03-27 04:34:03');
INSERT INTO `customers` VALUES ('8', 'sdafsadf', 'Male', 'ff@tt.com', '2019-03-27 04:34:27', '2019-03-27 04:34:27');

-- ----------------------------
-- Table structure for files
-- ----------------------------
DROP TABLE IF EXISTS `files`;
CREATE TABLE `files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `option_id` int(10) unsigned NOT NULL,
  `project_id` int(10) unsigned NOT NULL,
  `file_name` varchar(199) NOT NULL,
  `file_url` varchar(255) NOT NULL,
  `year_month` varchar(199) NOT NULL,
  `uploaded_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of files
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------

-- ----------------------------
-- Table structure for notifications
-- ----------------------------
DROP TABLE IF EXISTS `notifications`;
CREATE TABLE `notifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int(10) unsigned NOT NULL,
  `sender_name` varchar(100) NOT NULL,
  `project_id` int(10) unsigned NOT NULL,
  `file_name` varchar(199) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_name` varchar(199) NOT NULL,
  `receivers` text NOT NULL,
  `file_url` varchar(255) NOT NULL,
  `year_month` varchar(199) NOT NULL,
  `uploaded_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `project_noti` (`project_id`),
  CONSTRAINT `project_noti` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notifications
-- ----------------------------

-- ----------------------------
-- Table structure for options
-- ----------------------------
DROP TABLE IF EXISTS `options`;
CREATE TABLE `options` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(199) NOT NULL,
  `option_img` varchar(199) NOT NULL,
  PRIMARY KEY (`option_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of options
-- ----------------------------
INSERT INTO `options` VALUES ('1', 'Monthly Reporting', 'ic_project_overview.png');
INSERT INTO `options` VALUES ('2', 'PROGRAMME', 'ic_programming.png');
INSERT INTO `options` VALUES ('3', 'COMMERICAL', 'ic_commercial.png');
INSERT INTO `options` VALUES ('4', 'HSQE', 'ic_engineering.png');
INSERT INTO `options` VALUES ('5', 'ENGINEERING', 'ic_hsqe.png');

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for projects
-- ----------------------------
DROP TABLE IF EXISTS `projects`;
CREATE TABLE `projects` (
  `project_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_name` varchar(199) NOT NULL,
  `order` int(11) NOT NULL,
  PRIMARY KEY (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of projects
-- ----------------------------
INSERT INTO `projects` VALUES ('3', 'North West Electrification', '6');
INSERT INTO `projects` VALUES ('5', 'Southall UTX', '2');
INSERT INTO `projects` VALUES ('6', 'Nexus', '3');
INSERT INTO `projects` VALUES ('7', 'ATC / Crossrail', '4');
INSERT INTO `projects` VALUES ('8', 'Great Western', '5');
INSERT INTO `projects` VALUES ('9', 'Birmingham DU', '7');
INSERT INTO `projects` VALUES ('10', 'Crown Point', '8');
INSERT INTO `projects` VALUES ('11', 'TFL Barking Switching', '9');
INSERT INTO `projects` VALUES ('12', 'Wales BBR', '10');
INSERT INTO `projects` VALUES ('13', 'Amco Tunnels', '11');
INSERT INTO `projects` VALUES ('14', 'Cambridge Sidings', '12');
INSERT INTO `projects` VALUES ('15', 'Ardwick', '13');
INSERT INTO `projects` VALUES ('16', 'Stevenage Turnback', '14');

-- ----------------------------
-- Table structure for project_permissions
-- ----------------------------
DROP TABLE IF EXISTS `project_permissions`;
CREATE TABLE `project_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(100) unsigned NOT NULL,
  `project_id` int(4) unsigned NOT NULL,
  `project_name` varchar(199) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `project_permission` (`project_id`),
  CONSTRAINT `project_permission` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project_permissions
-- ----------------------------
INSERT INTO `project_permissions` VALUES ('17', '14', '3', '');
INSERT INTO `project_permissions` VALUES ('21', '13', '3', 'North West Electrification');
INSERT INTO `project_permissions` VALUES ('24', '12', '3', 'North West Electrification');
INSERT INTO `project_permissions` VALUES ('26', '12', '5', 'Southall UTX');
INSERT INTO `project_permissions` VALUES ('30', '17', '3', 'North West Electrification');
INSERT INTO `project_permissions` VALUES ('31', '17', '5', 'Southall UTX');
INSERT INTO `project_permissions` VALUES ('32', '14', '5', 'Southall UTX');
INSERT INTO `project_permissions` VALUES ('35', '12', '6', 'Nexus');
INSERT INTO `project_permissions` VALUES ('39', '20', '3', 'North West Electrification');
INSERT INTO `project_permissions` VALUES ('41', '20', '5', 'Southall UTX');
INSERT INTO `project_permissions` VALUES ('42', '20', '6', 'Nexus');
INSERT INTO `project_permissions` VALUES ('45', '22', '3', 'North West Electrification');
INSERT INTO `project_permissions` VALUES ('47', '22', '6', 'Nexus');
INSERT INTO `project_permissions` VALUES ('49', '21', '3', 'North West Electrification');
INSERT INTO `project_permissions` VALUES ('51', '21', '5', 'Southall UTX');
INSERT INTO `project_permissions` VALUES ('52', '21', '6', 'Nexus');
INSERT INTO `project_permissions` VALUES ('53', '21', '7', 'ATC / Crossrail');
INSERT INTO `project_permissions` VALUES ('54', '21', '8', 'Great Western');
INSERT INTO `project_permissions` VALUES ('55', '21', '9', 'Birmingham DU');
INSERT INTO `project_permissions` VALUES ('56', '21', '10', 'Crown Point');
INSERT INTO `project_permissions` VALUES ('57', '21', '11', 'TFL Barking Switching');
INSERT INTO `project_permissions` VALUES ('58', '21', '12', 'Wales BBR');
INSERT INTO `project_permissions` VALUES ('59', '21', '13', 'Amco Tunnels');
INSERT INTO `project_permissions` VALUES ('60', '21', '14', 'Cambridge Sidings');
INSERT INTO `project_permissions` VALUES ('61', '21', '15', 'Ardwick');
INSERT INTO `project_permissions` VALUES ('62', '21', '16', 'Stevenage Turnback');
INSERT INTO `project_permissions` VALUES ('65', '20', '7', 'ATC / Crossrail');
INSERT INTO `project_permissions` VALUES ('66', '20', '8', 'Great Western');
INSERT INTO `project_permissions` VALUES ('67', '20', '9', 'Birmingham DU');
INSERT INTO `project_permissions` VALUES ('68', '20', '10', 'Crown Point');
INSERT INTO `project_permissions` VALUES ('69', '20', '11', 'TFL Barking Switching');
INSERT INTO `project_permissions` VALUES ('70', '20', '12', 'Wales BBR');
INSERT INTO `project_permissions` VALUES ('71', '20', '13', 'Amco Tunnels');
INSERT INTO `project_permissions` VALUES ('72', '20', '14', 'Cambridge Sidings');
INSERT INTO `project_permissions` VALUES ('73', '20', '15', 'Ardwick');
INSERT INTO `project_permissions` VALUES ('74', '20', '16', 'Stevenage Turnback');

-- ----------------------------
-- Table structure for read_notification
-- ----------------------------
DROP TABLE IF EXISTS `read_notification`;
CREATE TABLE `read_notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `notification_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of read_notification
-- ----------------------------
INSERT INTO `read_notification` VALUES ('1', '14', '23', '2018-12-13 00:45:00', '2018-12-13 00:35:08');
INSERT INTO `read_notification` VALUES ('2', '20', '24', '2018-12-13 03:36:15', '2018-12-13 03:36:15');
INSERT INTO `read_notification` VALUES ('3', '20', '24', '2018-12-13 03:36:44', '2018-12-13 03:36:44');
INSERT INTO `read_notification` VALUES ('4', '20', '26', '2018-12-13 14:51:43', '2018-12-13 14:51:43');
INSERT INTO `read_notification` VALUES ('5', '20', '23', '2018-12-13 14:51:49', '2018-12-13 14:51:49');
INSERT INTO `read_notification` VALUES ('6', '20', '21', '2018-12-13 14:54:51', '2018-12-13 14:54:51');
INSERT INTO `read_notification` VALUES ('7', '20', '21', '2018-12-13 14:55:12', '2018-12-13 14:55:12');
INSERT INTO `read_notification` VALUES ('8', '20', '21', '2018-12-13 14:59:05', '2018-12-13 14:59:05');
INSERT INTO `read_notification` VALUES ('9', '20', '26', '2018-12-14 05:11:05', '2018-12-14 05:11:05');
INSERT INTO `read_notification` VALUES ('10', '20', '28', '2018-12-14 21:21:42', '2018-12-14 21:21:42');
INSERT INTO `read_notification` VALUES ('11', '20', '28', '2018-12-28 05:52:46', '2018-12-28 05:52:46');
INSERT INTO `read_notification` VALUES ('12', '20', '28', '2018-12-28 17:23:38', '2018-12-28 17:23:38');
INSERT INTO `read_notification` VALUES ('13', '20', '28', '2019-01-01 17:44:25', '2019-01-01 17:44:25');
INSERT INTO `read_notification` VALUES ('14', '20', '28', '2019-01-03 01:11:49', '2019-01-03 01:11:49');
INSERT INTO `read_notification` VALUES ('15', '20', '28', '2019-01-03 01:24:46', '2019-01-03 01:24:46');
INSERT INTO `read_notification` VALUES ('16', '20', '34', '2019-01-03 05:59:29', '2019-01-03 05:59:29');
INSERT INTO `read_notification` VALUES ('17', '20', '39', '2019-01-10 10:43:59', '2019-01-10 10:43:59');
INSERT INTO `read_notification` VALUES ('18', '20', '39', '2019-01-11 00:47:25', '2019-01-11 00:47:25');
INSERT INTO `read_notification` VALUES ('19', '20', '39', '2019-01-11 01:08:13', '2019-01-11 01:08:13');
INSERT INTO `read_notification` VALUES ('20', '20', '40', '2019-01-11 14:37:01', '2019-01-11 14:37:01');
INSERT INTO `read_notification` VALUES ('21', '20', '40', '2019-01-11 14:38:51', '2019-01-11 14:38:51');
INSERT INTO `read_notification` VALUES ('22', '20', '40', '2019-01-11 14:43:21', '2019-01-11 14:43:21');
INSERT INTO `read_notification` VALUES ('23', '20', '40', '2019-01-11 14:43:55', '2019-01-11 14:43:55');
INSERT INTO `read_notification` VALUES ('24', '20', '41', '2019-01-12 00:58:53', '2019-01-12 00:58:53');
INSERT INTO `read_notification` VALUES ('25', '20', '42', '2019-01-15 15:29:15', '2019-01-15 15:29:15');
INSERT INTO `read_notification` VALUES ('26', '20', '44', '2019-01-16 09:58:14', '2019-01-16 09:58:14');
INSERT INTO `read_notification` VALUES ('27', '20', '44', '2019-01-16 10:00:21', '2019-01-16 10:00:21');
INSERT INTO `read_notification` VALUES ('28', '20', '44', '2019-01-16 10:02:49', '2019-01-16 10:02:49');
INSERT INTO `read_notification` VALUES ('29', '20', '45', '2019-01-16 10:24:19', '2019-01-16 10:24:19');
INSERT INTO `read_notification` VALUES ('30', '20', '40', '2019-01-16 10:24:33', '2019-01-16 10:24:33');
INSERT INTO `read_notification` VALUES ('31', '20', '45', '2019-01-16 10:25:35', '2019-01-16 10:25:35');
INSERT INTO `read_notification` VALUES ('32', '21', '50', '2019-01-17 00:40:07', '2019-01-17 00:40:07');
INSERT INTO `read_notification` VALUES ('33', '21', '55', '2019-01-17 16:35:15', '2019-01-17 16:35:15');
INSERT INTO `read_notification` VALUES ('34', '21', '56', '2019-01-18 03:50:23', '2019-01-18 03:50:23');
INSERT INTO `read_notification` VALUES ('35', '21', '59', '2019-01-26 16:46:53', '2019-01-26 16:46:53');

-- ----------------------------
-- Table structure for settings
-- ----------------------------
DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `setting_key` varchar(199) NOT NULL,
  `setting_value` varchar(199) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of settings
-- ----------------------------
INSERT INTO `settings` VALUES ('1', 'ref_year_month', '2019-01', '2019-01-25 22:21:05', '2019-01-25 22:21:05');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8 NOT NULL,
  `user_name` varchar(191) CHARACTER SET utf8 NOT NULL,
  `email` varchar(191) CHARACTER SET utf8 NOT NULL,
  `company` varchar(191) CHARACTER SET utf8 NOT NULL,
  `password` varchar(191) CHARACTER SET utf8 NOT NULL,
  `encriptp` varchar(191) CHARACTER SET utf8 NOT NULL,
  `user_type` int(11) NOT NULL,
  `isActived` tinyint(4) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('12', 'jci', 'jci', 'jci@outlook.com', 'Jinung', '$2y$10$oK9mZQ31cEFn700iwioZFOZa8in8S8Fv6rzdP7UeIklHDVn7XHf.C', 'c360fe775245342e74a483edc97831fa', '1', '0', null, '2018-11-29 13:44:11');
INSERT INTO `users` VALUES ('13', 'kwj', 'kwj', 'kwj@outlook.com', 'Jinung', '$2y$10$Go9wke2LX8.Tulw4aX87rONxyrBz6Gv8xc7uo.HblpejSewDAxZQS', '8566f841ee7e0ace2ba6cfae98e3a87e', '2', '1', 'McDsRUtxjrDXaZ57RUVNINdUPkhdQighMrCAMenO6kBYUuGxqq2TSLdmA5UO', '2018-11-29 13:44:29');
INSERT INTO `users` VALUES ('14', 'ksy', 'ksy', 'ksy@outlook.com', 'Jinung', '$2y$10$wg7WUthF66J7XowIMZjVNuI771nzTKby.j1y8qGrScycbVfvCwmMy', 'dd9e5ceb62872be3c3cfbf9b083eb75a', '1', '1', null, '2018-11-29 13:44:48');
INSERT INTO `users` VALUES ('16', 'xxx', 'xxx', 'xxx@outlook.com', 'Jinung', '$2y$10$tTe/8i1e8WM8XKrPEJ98WugXM.O.aZlQi69czrh4g72DH8/KGg7aW', 'f561aaf6ef0bf14d4208bb46a4ccb3ad', '1', '1', null, '2018-11-29 18:41:34');
INSERT INTO `users` VALUES ('17', 'xxx1', 'xxx1', 'xxx1@outlook.com', 'Jinung', '$2y$10$1cBk4o/5VTNDA/XsYggVJ.ms0qNr4P9JyEcjNv3o5Za5lvqXN2a3a', '945220b105cb4c8af2f829c1b25f2069', '1', '1', null, '2018-11-30 02:53:21');
INSERT INTO `users` VALUES ('18', 'admin', 'admin', 'admin@gmail.com', 'admin', '$2y$10$S4FbZbhcMoQbznGO5L4GCeOPIQCf20wIQyVXgNumX4XHuH3Zeehlm', 'e10adc3949ba59abbe56e057f20f883e', '2', '1', 'YdgUKzyiBHfmLpoPiihoAFHsoO8tITUDwMeezb7ZHjX1l0uMVvrUljkiFF0v', '2018-12-04 08:56:51');
INSERT INTO `users` VALUES ('19', 'alex', 'alex', 'alex@gamil.com', 'alex', '$2y$10$jj4NEZcPh.5TZsu8RPSiDe4H397xzk36kF40N0bpPj17Q/nOXN8ii', 'e10adc3949ba59abbe56e057f20f883e', '1', '1', null, '2018-12-04 18:55:08');
INSERT INTO `users` VALUES ('20', 'Alex', 'Alex', 'tester@gmail.com', 'jdx', '$2y$10$xQe2au1/ptemi7JOzG5rguX/0MgqOjd3IA6Pe011sYRpyIfIfc7jm', '47bce5c74f589f4867dbd57e9ca9f808', '1', '1', null, '2018-12-12 01:30:11');
INSERT INTO `users` VALUES ('21', 'Tom', 'Gouldburntom', 'Gouldburntom@googlemail.com', 'infraplan', '$2y$10$W1JO9ThF4KkjCRHhDuE8De0T9Q21nbqD/VN/M21.D.JYp1nA6.EcW', '29aa7acafb73866d6571e1a72f46c146', '1', '1', null, '2019-01-03 11:21:30');
INSERT INTO `users` VALUES ('22', 'mark brookes', 'brookesm', 'markbrookes91@gmail.com', 'keltbray', '$2y$10$YRbXZMKn.sZZ0ynleSUg5.UAFtCLkaTEN3zV6ah1V0/KDNwnjz5Oe', 'e64b78fc3bc91bcbc7dc232ba8ec59e0', '1', '1', null, '2019-01-04 11:20:20');
