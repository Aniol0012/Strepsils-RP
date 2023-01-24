# Host: localhost  (Version 5.5.5-10.4.6-MariaDB)
# Date: 2020-09-03 12:09:02
# Generator: MySQL-Front 6.1  (Build 1.26)


#
# Structure for table "tm1_exp"
#

DROP TABLE IF EXISTS `tm1_exp`;
CREATE TABLE `tm1_exp` (
  `identifier` varchar(255) CHARACTER SET latin1 NOT NULL,
  `lvl` int(11) NOT NULL DEFAULT 0,
  `exp` int(11) NOT NULL DEFAULT 0,
  `sp` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Data for table "tm1_exp"
#

INSERT INTO `tm1_exp` VALUES ('steam:110000117a1e4c9',8,105,8);
