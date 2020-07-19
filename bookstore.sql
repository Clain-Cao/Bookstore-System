/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 80020
Source Host           : localhost:3306
Source Database       : bookstore

Target Server Type    : MYSQL
Target Server Version : 80020
File Encoding         : 65001

Date: 2020-07-20 00:13:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for app_users
-- ----------------------------
DROP TABLE IF EXISTS `app_users`;
CREATE TABLE `app_users` (
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of app_users
-- ----------------------------
INSERT INTO `app_users` VALUES ('chm', '12345678');

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can view log entry', '1', 'view_logentry');
INSERT INTO `auth_permission` VALUES ('5', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('8', 'Can view permission', '2', 'view_permission');
INSERT INTO `auth_permission` VALUES ('9', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('11', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('12', 'Can view group', '3', 'view_group');
INSERT INTO `auth_permission` VALUES ('13', 'Can add user', '4', 'add_user');
INSERT INTO `auth_permission` VALUES ('14', 'Can change user', '4', 'change_user');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete user', '4', 'delete_user');
INSERT INTO `auth_permission` VALUES ('16', 'Can view user', '4', 'view_user');
INSERT INTO `auth_permission` VALUES ('17', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('18', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('19', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('20', 'Can view content type', '5', 'view_contenttype');
INSERT INTO `auth_permission` VALUES ('21', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('22', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('23', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('24', 'Can view session', '6', 'view_session');
INSERT INTO `auth_permission` VALUES ('25', 'Can add books', '7', 'add_books');
INSERT INTO `auth_permission` VALUES ('26', 'Can change books', '7', 'change_books');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete books', '7', 'delete_books');
INSERT INTO `auth_permission` VALUES ('28', 'Can view books', '7', 'view_books');
INSERT INTO `auth_permission` VALUES ('29', 'Can add users', '8', 'add_users');
INSERT INTO `auth_permission` VALUES ('30', 'Can change users', '8', 'change_users');
INSERT INTO `auth_permission` VALUES ('31', 'Can delete users', '8', 'delete_users');
INSERT INTO `auth_permission` VALUES ('32', 'Can view users', '8', 'view_users');
INSERT INTO `auth_permission` VALUES ('33', 'Can add shop cart', '9', 'add_shopcart');
INSERT INTO `auth_permission` VALUES ('34', 'Can change shop cart', '9', 'change_shopcart');
INSERT INTO `auth_permission` VALUES ('35', 'Can delete shop cart', '9', 'delete_shopcart');
INSERT INTO `auth_permission` VALUES ('36', 'Can view shop cart', '9', 'view_shopcart');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES ('1', 'pbkdf2_sha256$180000$O6OwdDur4avl$aJDe5SIiqzBkuVMqAPNIoAm0y24dESzd1SLair/TCCA=', '2020-07-15 04:19:27.570194', '1', 'dell', 'haiming', 'cao', '1152633386@qq.com', '1', '1', '2020-07-08 15:36:00.000000');
INSERT INTO `auth_user` VALUES ('3', 'pbkdf2_sha256$180000$8W3jj704vTy0$OB2BK0fjK0rOE4CyB/8MU2KOyQlAIB3j/cI89nGfaIo=', null, '0', 'lwh', '', '', '', '0', '1', '2020-07-08 15:55:00.000000');
INSERT INTO `auth_user` VALUES ('4', 'pbkdf2_sha256$180000$h0KbNlMUfNyQ$+seVIEfNafABfcVsRMSPygoPW+VRaqUYJh2OD6dTAKA=', '2020-07-15 04:25:24.364028', '1', 'chm', 'hoiming', 'cou', 'hoiming.wk@foxmail.com', '1', '1', '2020-07-09 07:36:00.000000');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for books
-- ----------------------------
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books` (
  `id` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `price` double NOT NULL,
  `original` varchar(20) NOT NULL,
  `image` varchar(75) NOT NULL,
  `author` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of books
-- ----------------------------
INSERT INTO `books` VALUES ('0001', '我我的名字', '178.61', '我的出版社', 'images/contentbg.jpg', 'chm');
INSERT INTO `books` VALUES ('0003', '他的名字', '867.46', '他的出版社', 'images/wallpaper.jpg', 'him');
INSERT INTO `books` VALUES ('0004', '她的名字', '46.45', '她的出版社', 'images/cup.jpg', 'her');
INSERT INTO `books` VALUES ('0005', '它的名字', '465.63', '它的出版社', 'images/kenan.jpg', 'it');
INSERT INTO `books` VALUES ('0006', '谁的名字', '464.15', '谁的出版社', 'images/xuejing.jpg', 'who');
INSERT INTO `books` VALUES ('0007', '童话', '468.13', '童话出版社', 'images/background.jpg', '童话');
INSERT INTO `books` VALUES ('0008', '安徒生', '12.85', '安徒生出版生', 'images/bg.jpg    ', '安徒生');
INSERT INTO `books` VALUES ('0009', '安徒生童话', '167.93', '安徒生出版社', 'images/image01.jpg', '安徒生');
INSERT INTO `books` VALUES ('0010', '我的名字', '468.56', '你的出版社', 'images/image02.jpg', 'ming');
INSERT INTO `books` VALUES ('0011', '习近平', '789', '我的出版社', 'images/image03.jpg', '海铭');
INSERT INTO `books` VALUES ('0012', 'cvpr大全', '456.38', '铭出版社', 'images/image02.jpg', '铭铭');
INSERT INTO `books` VALUES ('0013', 'nips大全', '1500', '曹海铭出版社', 'images/image05.jpg', '曹海铭');
INSERT INTO `books` VALUES ('0056', '你我的书', '850.62', '你我出版社', 'images/rabbit.jpg', '你我呀');
INSERT INTO `books` VALUES ('0078', '没有人', '13.89', '没有人出版社', 'images/rabbit.jpg', 'chm');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES ('1', '2020-07-08 15:49:54.474534', '2', 'chm', '1', '[{\"added\": {}}]', '4', '1');
INSERT INTO `django_admin_log` VALUES ('2', '2020-07-08 15:52:03.962810', '2', 'chm', '2', '[{\"changed\": {\"fields\": [\"Date joined\"]}}]', '4', '1');
INSERT INTO `django_admin_log` VALUES ('3', '2020-07-08 15:55:03.242528', '3', 'lwh', '1', '[{\"added\": {}}]', '4', '1');
INSERT INTO `django_admin_log` VALUES ('4', '2020-07-08 15:55:11.040182', '3', 'lwh', '2', '[]', '4', '1');
INSERT INTO `django_admin_log` VALUES ('5', '2020-07-09 07:34:27.992479', '2', 'chm', '2', '[]', '4', '1');
INSERT INTO `django_admin_log` VALUES ('6', '2020-07-09 07:36:13.334037', '2', 'chm', '3', '', '4', '1');
INSERT INTO `django_admin_log` VALUES ('7', '2020-07-09 07:36:37.379716', '4', 'chm', '1', '[{\"added\": {}}]', '4', '1');
INSERT INTO `django_admin_log` VALUES ('8', '2020-07-09 07:36:42.238717', '4', 'chm', '2', '[]', '4', '1');
INSERT INTO `django_admin_log` VALUES ('9', '2020-07-10 09:37:46.468233', '4', 'chm', '2', '[{\"changed\": {\"fields\": [\"Staff status\", \"Superuser status\", \"Last login\"]}}]', '4', '1');
INSERT INTO `django_admin_log` VALUES ('10', '2020-07-10 09:39:07.650015', '5', 'admin', '1', '[{\"added\": {}}]', '4', '1');
INSERT INTO `django_admin_log` VALUES ('11', '2020-07-10 09:39:16.641137', '5', 'admin', '2', '[]', '4', '1');
INSERT INTO `django_admin_log` VALUES ('12', '2020-07-10 16:33:27.898311', '1', 'dell', '2', '[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]', '4', '4');
INSERT INTO `django_admin_log` VALUES ('13', '2020-07-10 17:24:16.938715', '6', '0113', '1', '[{\"added\": {}}]', '4', '4');
INSERT INTO `django_admin_log` VALUES ('14', '2020-07-11 15:42:47.956499', '4', 'chm', '2', '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Last login\"]}}]', '4', '4');
INSERT INTO `django_admin_log` VALUES ('15', '2020-07-11 16:53:35.060692', '3', 'lwh', '2', '[]', '4', '4');
INSERT INTO `django_admin_log` VALUES ('16', '2020-07-11 16:53:51.328650', '3', 'lwh', '2', '[]', '4', '4');
INSERT INTO `django_admin_log` VALUES ('17', '2020-07-11 16:54:00.658632', '6', '0113', '3', '', '4', '4');
INSERT INTO `django_admin_log` VALUES ('18', '2020-07-11 16:57:34.241469', '5', 'admin', '3', '', '4', '4');
INSERT INTO `django_admin_log` VALUES ('19', '2020-07-11 16:57:59.723892', '7', 'admin', '1', '[{\"added\": {}}]', '4', '4');
INSERT INTO `django_admin_log` VALUES ('20', '2020-07-11 16:58:05.839837', '7', 'admin', '2', '[]', '4', '4');
INSERT INTO `django_admin_log` VALUES ('21', '2020-07-15 02:25:28.080584', '7', 'admin', '3', '', '4', '4');
INSERT INTO `django_admin_log` VALUES ('22', '2020-07-15 02:27:41.223098', '8', 'admin', '1', '[{\"added\": {}}]', '4', '4');
INSERT INTO `django_admin_log` VALUES ('23', '2020-07-15 02:29:47.717052', '8', 'admin', '2', '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Staff status\"]}}]', '4', '4');
INSERT INTO `django_admin_log` VALUES ('24', '2020-07-15 04:23:25.638383', '8', 'admin', '2', '[]', '4', '4');
INSERT INTO `django_admin_log` VALUES ('25', '2020-07-15 04:23:50.594671', '0118', 'Books object (0118)', '2', '[{\"changed\": {\"fields\": [\"\\u7f16\\u53f7\", \"\\u8def\\u5f84\"]}}]', '7', '4');
INSERT INTO `django_admin_log` VALUES ('26', '2020-07-15 04:24:02.838942', '0118', 'Books object (0118)', '3', '', '7', '4');
INSERT INTO `django_admin_log` VALUES ('27', '2020-07-15 04:24:17.594501', '8', 'admin', '3', '', '4', '4');

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('7', 'app', 'books');
INSERT INTO `django_content_type` VALUES ('9', 'app', 'shopcart');
INSERT INTO `django_content_type` VALUES ('8', 'app', 'users');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2020-07-08 08:35:45.952182');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2020-07-08 08:35:52.819845');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0001_initial', '2020-07-08 08:36:30.657173');
INSERT INTO `django_migrations` VALUES ('4', 'admin', '0002_logentry_remove_auto_add', '2020-07-08 08:36:39.890468');
INSERT INTO `django_migrations` VALUES ('5', 'admin', '0003_logentry_add_action_flag_choices', '2020-07-08 08:36:40.299401');
INSERT INTO `django_migrations` VALUES ('6', 'app', '0001_initial', '2020-07-08 08:36:43.379133');
INSERT INTO `django_migrations` VALUES ('7', 'contenttypes', '0002_remove_content_type_name', '2020-07-08 08:36:50.180676');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0002_alter_permission_name_max_length', '2020-07-08 08:36:58.004797');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0003_alter_user_email_max_length', '2020-07-08 08:36:59.456879');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0004_alter_user_username_opts', '2020-07-08 08:36:59.719226');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0005_alter_user_last_login_null', '2020-07-08 08:37:04.868024');
INSERT INTO `django_migrations` VALUES ('12', 'auth', '0006_require_contenttypes_0002', '2020-07-08 08:37:05.017666');
INSERT INTO `django_migrations` VALUES ('13', 'auth', '0007_alter_validators_add_error_messages', '2020-07-08 08:37:05.139340');
INSERT INTO `django_migrations` VALUES ('14', 'auth', '0008_alter_user_username_max_length', '2020-07-08 08:37:08.490373');
INSERT INTO `django_migrations` VALUES ('15', 'auth', '0009_alter_user_last_name_max_length', '2020-07-08 08:37:12.979320');
INSERT INTO `django_migrations` VALUES ('16', 'auth', '0010_alter_group_name_max_length', '2020-07-08 08:37:13.995638');
INSERT INTO `django_migrations` VALUES ('17', 'auth', '0011_update_proxy_permissions', '2020-07-08 08:37:14.167143');
INSERT INTO `django_migrations` VALUES ('18', 'sessions', '0001_initial', '2020-07-08 08:37:15.350978');
INSERT INTO `django_migrations` VALUES ('19', 'app', '0002_auto_20200708_1639', '2020-07-08 08:39:51.234606');
INSERT INTO `django_migrations` VALUES ('20', 'app', '0002_shopcart', '2020-07-13 14:32:17.972007');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('ox7nc5zn9hdap5e0c5nbw4enilvfoumv', 'MDI1NzQ1ZGQ5MTMwNGYzY2ZlYjZlZDE0YmRmZjEwOTFmNmMzNWEzNzp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYWJhZTE1OTdhOTE5Y2Y1YjU0MGNiNTY0ODc2NzU4MjU0MTkzMzgyIn0=', '2020-07-29 04:25:24.537564');

-- ----------------------------
-- Table structure for shop_cart
-- ----------------------------
DROP TABLE IF EXISTS `shop_cart`;
CREATE TABLE `shop_cart` (
  `data_id` varchar(20) NOT NULL,
  `book_id` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `price` double NOT NULL,
  `original` varchar(20) NOT NULL,
  `image` varchar(75) NOT NULL,
  `author` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  PRIMARY KEY (`data_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of shop_cart
-- ----------------------------
