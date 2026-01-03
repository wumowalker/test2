/*
SQLyog Ultimate v11.3 (64 bit)
MySQL - 5.7.32-log : Database - weixinxiaochengxushudian
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`weixinxiaochengxushudian` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `weixinxiaochengxushudian`;

/*Table structure for table `config` */

DROP TABLE IF EXISTS `config`;

CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='配置文件';

/*Data for the table `config` */

insert  into `config`(`id`,`name`,`value`) values (1,'轮播图1','http://localhost:8080/weixinxiaochengxushudian/upload/config1.jpg'),(2,'轮播图2','http://localhost:8080/weixinxiaochengxushudian/upload/config2.jpg'),(3,'轮播图3','http://localhost:8080/weixinxiaochengxushudian/upload/config3.jpg');

/*Table structure for table `dictionary` */

DROP TABLE IF EXISTS `dictionary`;

CREATE TABLE `dictionary` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dic_code` varchar(200) DEFAULT NULL COMMENT '字段',
  `dic_name` varchar(200) DEFAULT NULL COMMENT '字段名',
  `code_index` int(11) DEFAULT NULL COMMENT '编码',
  `index_name` varchar(200) DEFAULT NULL COMMENT '编码名字  Search111 ',
  `super_id` int(11) DEFAULT NULL COMMENT '父字段id',
  `beizhu` varchar(200) DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='字典表';

/*Data for the table `dictionary` */

insert  into `dictionary`(`id`,`dic_code`,`dic_name`,`code_index`,`index_name`,`super_id`,`beizhu`,`create_time`) values (1,'tushu_types','图书类型',1,'图书类型1',NULL,NULL,'2022-04-21 14:57:15'),(2,'tushu_types','图书类型',2,'图书类型2',NULL,NULL,'2022-04-21 14:57:15'),(3,'tushu_types','图书类型',3,'图书类型3',NULL,NULL,'2022-04-21 14:57:15'),(4,'news_types','公告类型',1,'公告类型1',NULL,NULL,'2022-04-21 14:57:15'),(5,'news_types','公告类型',2,'公告类型2',NULL,NULL,'2022-04-21 14:57:15'),(6,'news_types','公告类型',3,'公告类型3',NULL,NULL,'2022-04-21 14:57:15'),(7,'sex_types','性别',1,'男',NULL,NULL,'2022-04-21 14:57:15'),(8,'sex_types','性别',2,'女',NULL,NULL,'2022-04-21 14:57:15'),(9,'shangxia_types','上下架',1,'上架',NULL,NULL,'2022-04-21 14:57:15'),(10,'shangxia_types','上下架',2,'下架',NULL,NULL,'2022-04-21 14:57:15'),(11,'forum_state_types','帖子状态',1,'发帖',NULL,NULL,'2022-04-21 14:57:16'),(12,'forum_state_types','帖子状态',2,'回帖',NULL,NULL,'2022-04-21 14:57:16');

/*Table structure for table `forum` */

DROP TABLE IF EXISTS `forum`;

CREATE TABLE `forum` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `forum_name` varchar(200) DEFAULT NULL COMMENT '帖子标题  Search111 ',
  `yonghu_id` int(11) DEFAULT NULL COMMENT '用户',
  `users_id` int(11) DEFAULT NULL COMMENT '管理员',
  `forum_content` text COMMENT '发布内容',
  `super_ids` int(11) DEFAULT NULL COMMENT '父id',
  `forum_state_types` int(11) DEFAULT NULL COMMENT '帖子状态',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '发帖时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='论坛信息';

/*Data for the table `forum` */

insert  into `forum`(`id`,`forum_name`,`yonghu_id`,`users_id`,`forum_content`,`super_ids`,`forum_state_types`,`insert_time`,`update_time`,`create_time`) values (1,'帖子标题1',3,NULL,'发布内容1',NULL,1,'2022-04-21 14:57:40','2022-04-21 14:57:40','2022-04-21 14:57:40'),(2,'帖子标题2',2,NULL,'发布内容2',NULL,1,'2022-04-21 14:57:40','2022-04-21 14:57:40','2022-04-21 14:57:40'),(3,'帖子标题3',2,NULL,'发布内容3',NULL,1,'2022-04-21 14:57:40','2022-04-21 14:57:40','2022-04-21 14:57:40'),(4,'帖子标题4',3,NULL,'发布内容4',NULL,1,'2022-04-21 14:57:40','2022-04-21 14:57:40','2022-04-21 14:57:40'),(5,'帖子标题5',2,NULL,'发布内容5',NULL,1,'2022-04-21 14:57:40','2022-04-21 14:57:40','2022-04-21 14:57:40'),(6,NULL,1,NULL,'评论内容112',5,2,'2022-04-21 16:22:10',NULL,'2022-04-21 16:22:10');

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `news_name` varchar(200) DEFAULT NULL COMMENT '公告标题  Search111 ',
  `news_types` int(11) DEFAULT NULL COMMENT '公告类型  Search111 ',
  `news_photo` varchar(200) DEFAULT NULL COMMENT '公告图片',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '添加时间',
  `news_content` text COMMENT '公告详情',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show1 show2 nameShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='公告信息';

/*Data for the table `news` */

insert  into `news`(`id`,`news_name`,`news_types`,`news_photo`,`insert_time`,`news_content`,`create_time`) values (1,'公告标题1',3,'http://localhost:8080/weixinxiaochengxushudian/upload/news1.jpg','2022-04-21 14:57:40','公告详情1','2022-04-21 14:57:40'),(2,'公告标题2',2,'http://localhost:8080/weixinxiaochengxushudian/upload/news2.jpg','2022-04-21 14:57:40','公告详情2','2022-04-21 14:57:40'),(3,'公告标题3',2,'http://localhost:8080/weixinxiaochengxushudian/upload/news3.jpg','2022-04-21 14:57:40','公告详情3','2022-04-21 14:57:40'),(4,'公告标题4',3,'http://localhost:8080/weixinxiaochengxushudian/upload/news4.jpg','2022-04-21 14:57:40','公告详情4','2022-04-21 14:57:40'),(5,'公告标题5',1,'http://localhost:8080/weixinxiaochengxushudian/upload/news5.jpg','2022-04-21 14:57:40','公告详情5','2022-04-21 14:57:40');

/*Table structure for table `token` */

DROP TABLE IF EXISTS `token`;

CREATE TABLE `token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='token表';

/*Data for the table `token` */

insert  into `token`(`id`,`userid`,`username`,`tablename`,`role`,`token`,`addtime`,`expiratedtime`) values (1,1,'a1','yonghu','用户','rgv1e3498oxiewqrrasyg4nfrrmi49cy','2022-04-21 15:09:48','2022-04-21 17:20:20'),(2,1,'admin','users','管理员','j564edrcx0y2fzrxpy332fbusnwbhvsk','2022-04-21 15:37:14','2022-04-21 17:26:55');

/*Table structure for table `tushu` */

DROP TABLE IF EXISTS `tushu`;

CREATE TABLE `tushu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键 ',
  `tushu_name` varchar(200) DEFAULT NULL COMMENT '图书名称  Search111 ',
  `tushu_photo` varchar(200) DEFAULT NULL COMMENT '图书图片',
  `tushu_zuozhe` varchar(200) DEFAULT NULL COMMENT '作者',
  `tushu_chubanshe` varchar(200) DEFAULT NULL COMMENT '出版社',
  `tushu_file` varchar(200) DEFAULT NULL COMMENT '图书下载',
  `tushu_types` int(11) DEFAULT NULL COMMENT '图书类型 Search111',
  `tushu_kucun_number` int(11) DEFAULT NULL COMMENT '图书库存',
  `tushu_new_money` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `shangxia_types` int(11) DEFAULT NULL COMMENT '是否上架 ',
  `tushu_delete` int(11) DEFAULT NULL COMMENT '逻辑删除',
  `tushu_content` text COMMENT '图书简介 ',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间  show1 show2 photoShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='图书';

/*Data for the table `tushu` */

insert  into `tushu`(`id`,`tushu_name`,`tushu_photo`,`tushu_zuozhe`,`tushu_chubanshe`,`tushu_file`,`tushu_types`,`tushu_kucun_number`,`tushu_new_money`,`shangxia_types`,`tushu_delete`,`tushu_content`,`create_time`) values (1,'图书名称1','http://localhost:8080/weixinxiaochengxushudian/upload/tushu1.jpg','作者1','出版社1','http://localhost:8080/weixinxiaochengxushudian/upload/file.rar',1,101,'496.77',1,1,'图书简介1','2022-04-21 14:57:40'),(2,'图书名称2','http://localhost:8080/weixinxiaochengxushudian/upload/tushu2.jpg','作者2','出版社2','http://localhost:8080/weixinxiaochengxushudian/upload/file.rar',3,102,'121.21',1,1,'图书简介2','2022-04-21 14:57:40'),(3,'图书名称3','http://localhost:8080/weixinxiaochengxushudian/upload/tushu3.jpg','作者3','出版社3','http://localhost:8080/weixinxiaochengxushudian/upload/file.rar',1,103,'431.82',1,1,'图书简介3','2022-04-21 14:57:40'),(4,'图书名称4','http://localhost:8080/weixinxiaochengxushudian/upload/tushu4.jpg','作者4','出版社4','http://localhost:8080/weixinxiaochengxushudian/upload/file.rar',2,103,'216.48',1,1,'图书简介4','2022-04-21 14:57:40'),(5,'图书名称5','http://localhost:8080/weixinxiaochengxushudian/upload/tushu5.jpg','作者5','出版社5','http://localhost:8080/weixinxiaochengxushudian/upload/file.rar',1,105,'296.31',2,1,'图书简介5','2022-04-21 14:57:40');

/*Table structure for table `tushu_liuyan` */

DROP TABLE IF EXISTS `tushu_liuyan`;

CREATE TABLE `tushu_liuyan` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tushu_id` int(11) DEFAULT NULL COMMENT '图书',
  `yonghu_id` int(11) DEFAULT NULL COMMENT '用户',
  `tushu_liuyan_text` text COMMENT '留言内容',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '留言时间',
  `reply_text` text COMMENT '回复内容',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '回复时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='图书留言';

/*Data for the table `tushu_liuyan` */

insert  into `tushu_liuyan`(`id`,`tushu_id`,`yonghu_id`,`tushu_liuyan_text`,`insert_time`,`reply_text`,`update_time`,`create_time`) values (1,1,2,'留言内容1','2022-04-21 14:57:40','回复信息1','2022-04-21 14:57:40','2022-04-21 14:57:40'),(2,2,1,'留言内容2','2022-04-21 14:57:40','回复信息2','2022-04-21 14:57:40','2022-04-21 14:57:40'),(3,3,2,'留言内容3','2022-04-21 14:57:40','回复信息3','2022-04-21 14:57:40','2022-04-21 14:57:40'),(4,4,2,'留言内容4','2022-04-21 14:57:40','回复信息4','2022-04-21 14:57:40','2022-04-21 14:57:40'),(5,5,2,'留言内容5','2022-04-21 14:57:40','回复信息5111','2022-04-21 16:25:07','2022-04-21 14:57:40');

/*Table structure for table `tushu_order` */

DROP TABLE IF EXISTS `tushu_order`;

CREATE TABLE `tushu_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tushu_order_uuid_number` varchar(200) DEFAULT NULL COMMENT '订单号',
  `tushu_id` int(11) DEFAULT NULL COMMENT '图书',
  `yonghu_id` int(11) DEFAULT NULL COMMENT '用户',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '购买时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='图书订单';

/*Data for the table `tushu_order` */

insert  into `tushu_order`(`id`,`tushu_order_uuid_number`,`tushu_id`,`yonghu_id`,`insert_time`,`create_time`) values (14,'1650525843145',4,1,'2022-04-21 15:24:03','2022-04-21 15:24:03'),(15,'1650529303314',1,1,'2022-04-21 16:21:43','2022-04-21 16:21:43');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`password`,`role`,`addtime`) values (1,'admin','admin','管理员','2022-05-01 00:00:00');

/*Table structure for table `yonghu` */

DROP TABLE IF EXISTS `yonghu`;

CREATE TABLE `yonghu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(200) DEFAULT NULL COMMENT '账户',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `yonghu_name` varchar(200) DEFAULT NULL COMMENT '用户姓名 Search111 ',
  `yonghu_photo` varchar(255) DEFAULT NULL COMMENT '头像',
  `sex_types` int(11) DEFAULT NULL COMMENT '性别 Search111 ',
  `yonghu_phone` varchar(200) DEFAULT NULL COMMENT '联系方式',
  `yonghu_email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `new_money` decimal(10,2) DEFAULT NULL COMMENT '余额 ',
  `yonghu_delete` int(11) DEFAULT '1' COMMENT '假删',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '添加时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户';

/*Data for the table `yonghu` */

insert  into `yonghu`(`id`,`username`,`password`,`yonghu_name`,`yonghu_photo`,`sex_types`,`yonghu_phone`,`yonghu_email`,`new_money`,`yonghu_delete`,`insert_time`,`create_time`) values (1,'a1','123456','用户姓名1','http://localhost:8080/weixinxiaochengxushudian/upload/yonghu1.jpg',2,'17703786901','1@qq.com','4644.50',1,'2022-04-21 14:57:40','2022-04-21 14:57:40'),(2,'a2','123456','用户姓名2','http://localhost:8080/weixinxiaochengxushudian/upload/yonghu2.jpg',1,'17703786902','2@qq.com','715.94',1,'2022-04-21 14:57:40','2022-04-21 14:57:40'),(3,'a3','123456','用户姓名3','http://localhost:8080/weixinxiaochengxushudian/upload/yonghu3.jpg',2,'17703786903','3@qq.com','933.48',1,'2022-04-21 14:57:40','2022-04-21 14:57:40');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
