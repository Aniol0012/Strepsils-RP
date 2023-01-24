-- ----------------------------
-- New Items
-- ----------------------------
INSERT INTO `items` (name, label) VALUES 
	('cocaseed','cocaseed'),
	('cocaplant','cocaplant'),
	('cocawihtout','cocawihtout'),
	('aditives','aditives'),
	('coca','coca'),
	('shovel','shovel'),
	('grilletes','grilletes'),
	('keys','keys')
;



-- ----------------------------
-- Table structure for tm1_enclosures
-- ----------------------------
DROP TABLE IF EXISTS `tm1_enclosures`;
CREATE TABLE `tm1_enclosures` (
  `enclosure_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `groupid` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tm1_enclosures
-- ----------------------------
INSERT INTO `tm1_enclosures` VALUES ('Campamento Altruista', '7557');

-- ----------------------------
-- Table structure for tm1_groups
-- ----------------------------
DROP TABLE IF EXISTS `tm1_groups`;
CREATE TABLE `tm1_groups` (
  `groupid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `aprove` int(1) DEFAULT 0,
  `money` int(11) DEFAULT 0,
  PRIMARY KEY (`groupid`)
) ENGINE=InnoDB AUTO_INCREMENT=7558 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tm1_groups
-- ----------------------------
INSERT INTO `tm1_groups` VALUES ('7557', 'Hola', '1', '1');

-- ----------------------------
-- Table structure for tm1_membersgroups
-- ----------------------------
DROP TABLE IF EXISTS `tm1_membersgroups`;
CREATE TABLE `tm1_membersgroups` (
  `groupid` int(11) DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `identifier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `rank` int(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tm1_membersgroups
-- ----------------------------
INSERT INTO `tm1_membersgroups` VALUES ('7557', null, 'steam:11000010e1d2449', '5');

ALTER TABLE `users` ADD `addicted` varchar(10);
ALTER TABLE `users` ADD `skills` varchar(100);
