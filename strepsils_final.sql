# Host: localhost  (Version 5.5.5-10.4.6-MariaDB)
# Date: 2021-04-11 21:06:52
# Generator: MySQL-Front 6.1  (Build 1.26)


#
# Structure for table "addon_account"
#

DROP TABLE IF EXISTS `addon_account`;
CREATE TABLE `addon_account` (
  `name` varchar(60) COLLATE utf8mb4_spanish_ci NOT NULL,
  `label` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

#
# Data for table "addon_account"
#

INSERT INTO `addon_account` VALUES ('bank_savings','Livret Bleu',0),('caution','Caution',0),('property_black_money','Argent Sale Propriété',0),('society_admin','Administrador',1),('society_ambulance','Ambulance',1),('society_banker','Banque',1),('society_cardealer','Concessionnaire',1),('society_mafia1','mafia1',1),('society_mechanic','MÃ©cano',1),('society_police','Police',1),('society_realestateagent','Agent immobilier',1),('society_taxi','Taxi',1),('society_weazelnews','Reportero',1);

#
# Structure for table "addon_account_data"
#

DROP TABLE IF EXISTS `addon_account_data`;
CREATE TABLE `addon_account_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_name` varchar(100) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `money` int(11) NOT NULL,
  `owner` varchar(100) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_addon_account_data_account_name_owner` (`account_name`,`owner`),
  KEY `index_addon_account_data_account_name` (`account_name`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

#
# Data for table "addon_account_data"
#

INSERT INTO `addon_account_data` VALUES (1,'society_ambulance',22000,NULL),(2,'society_banker',0,NULL),(3,'society_cardealer',0,NULL),(4,'society_mechanic',0,NULL),(5,'society_police',1021,NULL),(6,'society_realestateagent',0,NULL),(7,'society_taxi',0,NULL),(8,'bank_savings',0,'steam:1100001132b99e9'),(9,'property_black_money',0,'steam:1100001132b99e9'),(10,'caution',0,'steam:1100001132b99e9'),(11,'bank_savings',0,'steam:1100001323d8cbb'),(12,'caution',0,'steam:1100001323d8cbb'),(13,'property_black_money',0,'steam:1100001323d8cbb'),(14,'property_black_money',0,'steam:110000117a1e4c9'),(15,'bank_savings',0,'steam:110000117a1e4c9'),(16,'caution',0,'steam:110000117a1e4c9'),(17,'bank_savings',0,'steam:110000142794b5a'),(18,'caution',0,'steam:110000142794b5a'),(19,'property_black_money',0,'steam:110000142794b5a'),(20,'society_mafia1',0,NULL),(21,'society_admin',0,NULL),(22,'bank_savings',0,'steam:1100001172b03f4'),(23,'property_black_money',0,'steam:1100001172b03f4'),(24,'caution',0,'steam:1100001172b03f4'),(25,'bank_savings',0,'steam:1100001154bcf8d'),(26,'property_black_money',0,'steam:1100001154bcf8d'),(27,'caution',0,'steam:1100001154bcf8d'),(28,'bank_savings',0,'steam:110000118cf839d'),(29,'caution',0,'steam:110000118cf839d'),(30,'property_black_money',0,'steam:110000118cf839d'),(31,'property_black_money',0,'steam:1100001026d69a0'),(32,'caution',0,'steam:1100001026d69a0'),(33,'bank_savings',0,'steam:1100001026d69a0'),(34,'property_black_money',0,'steam:11000010c0588f0'),(35,'caution',0,'steam:11000010c0588f0'),(36,'bank_savings',0,'steam:11000010c0588f0'),(37,'bank_savings',0,'steam:11000010edbfb5d'),(38,'caution',0,'steam:11000010edbfb5d'),(39,'property_black_money',0,'steam:11000010edbfb5d'),(40,'property_black_money',0,'steam:110000116b2f1a5'),(41,'caution',0,'steam:110000116b2f1a5'),(42,'bank_savings',0,'steam:110000116b2f1a5'),(43,'bank_savings',0,'steam:110000112c384fc'),(44,'caution',0,'steam:110000112c384fc'),(45,'property_black_money',0,'steam:110000112c384fc'),(46,'caution',0,'steam:110000142afbcd6'),(47,'property_black_money',0,'steam:110000142afbcd6'),(48,'bank_savings',0,'steam:110000142afbcd6'),(49,'society_weazelnews',0,NULL);

#
# Structure for table "addon_inventory"
#

DROP TABLE IF EXISTS `addon_inventory`;
CREATE TABLE `addon_inventory` (
  `name` varchar(60) COLLATE utf8mb4_spanish_ci NOT NULL,
  `label` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

#
# Data for table "addon_inventory"
#

INSERT INTO `addon_inventory` VALUES ('property','Propriété',0),('society_admin','Administrador',1),('society_ambulance','EMS',1),('society_cardealer','Concesionario',1),('society_mafia1','mafia1',1),('society_mechanic','Mecanico',1),('society_police','Police',1),('society_taxi','Taxi',1),('society_weazelnews','Reportero',1);

#
# Structure for table "addon_inventory_items"
#

DROP TABLE IF EXISTS `addon_inventory_items`;
CREATE TABLE `addon_inventory_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_name` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `count` int(11) NOT NULL,
  `owner` varchar(60) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_addon_inventory_items_inventory_name_name` (`inventory_name`,`name`),
  KEY `index_addon_inventory_items_inventory_name_name_owner` (`inventory_name`,`name`,`owner`),
  KEY `index_addon_inventory_inventory_name` (`inventory_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

#
# Data for table "addon_inventory_items"
#

INSERT INTO `addon_inventory_items` VALUES (1,'society_taxi','fish',0,NULL),(2,'society_taxi','water',20,NULL),(3,'society_mechanic','rueda',11,NULL),(4,'society_admin','rueda',10,NULL),(5,'society_admin','altavoz',10,NULL);

#
# Structure for table "baninfo"
#

DROP TABLE IF EXISTS `baninfo`;
CREATE TABLE `baninfo` (
  `identifier` varchar(25) COLLATE utf8mb4_bin NOT NULL,
  `license` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `liveid` varchar(21) COLLATE utf8mb4_bin DEFAULT NULL,
  `xblid` varchar(21) COLLATE utf8mb4_bin DEFAULT NULL,
  `discord` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL,
  `playerip` varchar(25) COLLATE utf8mb4_bin DEFAULT NULL,
  `playername` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

#
# Data for table "baninfo"
#


#
# Structure for table "banlist"
#

DROP TABLE IF EXISTS `banlist`;
CREATE TABLE `banlist` (
  `identifier` varchar(25) COLLATE utf8mb4_bin NOT NULL,
  `license` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `liveid` varchar(21) COLLATE utf8mb4_bin DEFAULT NULL,
  `xblid` varchar(21) COLLATE utf8mb4_bin DEFAULT NULL,
  `discord` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL,
  `playerip` varchar(25) COLLATE utf8mb4_bin DEFAULT NULL,
  `targetplayername` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `sourceplayername` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `reason` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `timeat` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `added` datetime DEFAULT current_timestamp(),
  `expiration` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `permanent` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

#
# Data for table "banlist"
#


#
# Structure for table "banlisthistory"
#

DROP TABLE IF EXISTS `banlisthistory`;
CREATE TABLE `banlisthistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(25) COLLATE utf8mb4_bin NOT NULL,
  `license` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `liveid` varchar(21) COLLATE utf8mb4_bin DEFAULT NULL,
  `xblid` varchar(21) COLLATE utf8mb4_bin DEFAULT NULL,
  `discord` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL,
  `playerip` varchar(25) COLLATE utf8mb4_bin DEFAULT NULL,
  `targetplayername` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `sourceplayername` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `reason` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `timeat` int(11) NOT NULL,
  `added` datetime DEFAULT current_timestamp(),
  `expiration` int(11) NOT NULL,
  `permanent` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

#
# Data for table "banlisthistory"
#


#
# Structure for table "betrayed_inventariocasas"
#

DROP TABLE IF EXISTS `betrayed_inventariocasas`;
CREATE TABLE `betrayed_inventariocasas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `propiedad` varchar(8) NOT NULL,
  `data` text NOT NULL,
  `propietarioID` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `propiedad` (`propiedad`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

#
# Data for table "betrayed_inventariocasas"
#


#
# Structure for table "billing"
#

DROP TABLE IF EXISTS `billing`;
CREATE TABLE `billing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) COLLATE utf8mb4_spanish_ci NOT NULL,
  `sender` varchar(255) COLLATE utf8mb4_spanish_ci NOT NULL,
  `target_type` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_spanish_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_spanish_ci NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

#
# Data for table "billing"
#

INSERT INTO `billing` VALUES (3,'steam:110000117a1e4c9','steam:1100001172b03f4','player','steam:1100001172b03f4','Taxi',2147483647),(4,'steam:110000116b2f1a5','steam:110000117a1e4c9','player','steam:110000117a1e4c9','admin',1),(7,'steam:110000117a1e4c9','steam:1100001172b03f4','society','society_police','Police',123123);

#
# Structure for table "cas_vendercoche"
#

DROP TABLE IF EXISTS `cas_vendercoche`;
CREATE TABLE `cas_vendercoche` (
  `seller` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `buyer` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `car` varchar(255) CHARACTER SET utf8 NOT NULL,
  `hour` varchar(255) CHARACTER SET utf8 NOT NULL,
  `price` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Data for table "cas_vendercoche"
#

INSERT INTO `cas_vendercoche` VALUES ('steam:1100001172b03f4','steam:110000117a1e4c9','KYL 357 ','Mon Aug  3 13:29:09 2020',100,'rs3');

#
# Structure for table "characters"
#

DROP TABLE IF EXISTS `characters`;
CREATE TABLE `characters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) COLLATE utf8mb4_spanish_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_spanish_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_spanish_ci NOT NULL,
  `dateofbirth` varchar(255) COLLATE utf8mb4_spanish_ci NOT NULL,
  `sex` varchar(1) COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT 'M',
  `height` varchar(128) COLLATE utf8mb4_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

#
# Data for table "characters"
#


#
# Structure for table "datastore"
#

DROP TABLE IF EXISTS `datastore`;
CREATE TABLE `datastore` (
  `name` varchar(60) COLLATE utf8mb4_spanish_ci NOT NULL,
  `label` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

#
# Data for table "datastore"
#

INSERT INTO `datastore` VALUES ('property','Propriété',0),('society_admin','Administrador',1),('society_ambulance','Ambulance',1),('society_mafia1','mafia1',1),('society_police','Police',1),('society_taxi','Taxi',1),('user_ears','Orejas',0),('user_glasses','Gafas',0),('user_helmet','Gorro',0),('user_mask','Mascara',0);

#
# Structure for table "datastore_data"
#

DROP TABLE IF EXISTS `datastore_data`;
CREATE TABLE `datastore_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_spanish_ci NOT NULL,
  `owner` varchar(60) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `data` longtext COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_datastore_data_name_owner` (`name`,`owner`),
  KEY `index_datastore_data_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

#
# Data for table "datastore_data"
#

INSERT INTO `datastore_data` VALUES (1,'society_ambulance',NULL,'{}'),(2,'society_police',NULL,'{}'),(3,'society_taxi',NULL,'{}'),(4,'property','steam:1100001132b99e9','{}'),(5,'user_helmet','steam:1100001132b99e9','{}'),(6,'user_glasses','steam:1100001132b99e9','{}'),(7,'user_ears','steam:1100001132b99e9','{}'),(8,'user_mask','steam:1100001132b99e9','{}'),(9,'property','steam:1100001323d8cbb','{}'),(10,'user_ears','steam:1100001323d8cbb','{}'),(11,'user_glasses','steam:1100001323d8cbb','{}'),(12,'user_helmet','steam:1100001323d8cbb','{}'),(13,'user_mask','steam:1100001323d8cbb','{}'),(14,'property','steam:110000117a1e4c9','{\"dressing\":[{\"label\":\"Mierda\",\"skin\":{\"blush_2\":0,\"makeup_2\":0,\"torso_2\":0,\"arms\":62,\"bproof_2\":0,\"ears_2\":-1,\"shoes_1\":1,\"glasses_2\":-1,\"age_1\":0,\"skin\":14,\"watches_2\":0,\"eyebrows_3\":0,\"age_2\":0,\"chain_2\":0,\"blush_3\":0,\"helmet_2\":3,\"eyebrows_1\":0,\"ears_1\":-1,\"lipstick_4\":0,\"hair_2\":0,\"chest_3\":0,\"beard_4\":0,\"helmet_1\":20,\"moles_2\":1,\"bodyb_2\":0,\"blemishes_2\":0,\"lipstick_2\":0,\"eyebrows_2\":10,\"beard_3\":0,\"watches_1\":8,\"hair_color_1\":0,\"bproof_1\":0,\"moles_1\":0,\"bags_2\":0,\"decals_2\":0,\"sun_1\":0,\"beard_1\":0,\"chest_2\":0,\"bracelets_2\":0,\"bracelets_1\":-1,\"bodyb_1\":0,\"sun_2\":0,\"blemishes_1\":0,\"beard_2\":10,\"face\":0,\"lipstick_1\":0,\"pants_1\":54,\"makeup_1\":0,\"mask_2\":0,\"shoes_2\":3,\"makeup_3\":0,\"torso_1\":226,\"makeup_4\":0,\"lipstick_3\":0,\"tshirt_1\":15,\"decals_1\":0,\"bags_1\":0,\"complexion_2\":1,\"glasses_1\":-1,\"eye_color\":0,\"hair_1\":0,\"blush_1\":0,\"chest_1\":0,\"complexion_1\":0,\"pants_2\":1,\"arms_2\":0,\"chain_1\":0,\"sex\":0,\"mask_1\":0,\"tshirt_2\":0,\"hair_color_2\":0,\"eyebrows_4\":0}},{\"label\":\"Lol\",\"skin\":{\"blush_2\":0,\"makeup_2\":0,\"torso_2\":0,\"arms\":62,\"bproof_2\":0,\"ears_2\":-1,\"shoes_1\":1,\"glasses_2\":-1,\"age_1\":0,\"skin\":14,\"watches_2\":0,\"eyebrows_3\":0,\"age_2\":0,\"chain_2\":0,\"blush_3\":0,\"helmet_2\":3,\"eyebrows_1\":0,\"ears_1\":-1,\"lipstick_4\":0,\"hair_2\":0,\"chest_3\":0,\"beard_4\":0,\"helmet_1\":20,\"moles_2\":1,\"bodyb_2\":0,\"blemishes_2\":0,\"lipstick_2\":0,\"eyebrows_2\":10,\"beard_3\":0,\"watches_1\":8,\"hair_color_1\":0,\"bproof_1\":0,\"moles_1\":0,\"bags_2\":0,\"mask_2\":0,\"sun_1\":0,\"tshirt_1\":15,\"chest_2\":0,\"bracelets_2\":0,\"bracelets_1\":-1,\"makeup_4\":0,\"sun_2\":0,\"blemishes_1\":0,\"beard_2\":10,\"face\":0,\"makeup_1\":0,\"pants_1\":54,\"torso_1\":226,\"complexion_1\":0,\"shoes_2\":3,\"makeup_3\":0,\"lipstick_1\":0,\"tshirt_2\":0,\"decals_2\":0,\"beard_1\":0,\"lipstick_3\":0,\"bags_1\":40,\"complexion_2\":1,\"glasses_1\":-1,\"eye_color\":0,\"hair_1\":0,\"chest_1\":0,\"bodyb_1\":0,\"blush_1\":0,\"decals_1\":0,\"arms_2\":0,\"chain_1\":0,\"sex\":0,\"mask_1\":0,\"eyebrows_4\":0,\"hair_color_2\":0,\"pants_2\":1}}]}'),(15,'user_glasses','steam:110000117a1e4c9','{\"hasGlasses\":true,\"skin\":{\"glasses_2\":0,\"glasses_1\":18}}'),(16,'user_mask','steam:110000117a1e4c9','{}'),(17,'user_ears','steam:110000117a1e4c9','{}'),(18,'user_helmet','steam:110000117a1e4c9','{}'),(19,'user_mask','steam:110000142794b5a','{}'),(20,'user_helmet','steam:110000142794b5a','{}'),(21,'user_ears','steam:110000142794b5a','{}'),(22,'property','steam:110000142794b5a','{}'),(23,'user_glasses','steam:110000142794b5a','{}'),(24,'society_mafia1',NULL,'{}'),(25,'society_admin',NULL,'{}'),(26,'user_ears','steam:1100001172b03f4','{}'),(27,'property','steam:1100001172b03f4','{}'),(28,'user_helmet','steam:1100001172b03f4','{}'),(29,'user_mask','steam:1100001172b03f4','{}'),(30,'user_glasses','steam:1100001172b03f4','{}'),(31,'property','steam:1100001154bcf8d','{}'),(32,'user_ears','steam:1100001154bcf8d','{}'),(33,'user_glasses','steam:1100001154bcf8d','{}'),(34,'user_helmet','steam:1100001154bcf8d','{}'),(35,'user_mask','steam:1100001154bcf8d','{}'),(36,'property','steam:110000118cf839d','{}'),(37,'user_ears','steam:110000118cf839d','{}'),(38,'user_glasses','steam:110000118cf839d','{}'),(39,'user_helmet','steam:110000118cf839d','{}'),(40,'user_mask','steam:110000118cf839d','{}'),(41,'property','steam:1100001026d69a0','{}'),(42,'user_helmet','steam:1100001026d69a0','{}'),(43,'user_glasses','steam:1100001026d69a0','{}'),(44,'user_ears','steam:1100001026d69a0','{}'),(45,'user_mask','steam:1100001026d69a0','{}'),(46,'property','steam:11000010c0588f0','{}'),(47,'user_ears','steam:11000010c0588f0','{}'),(48,'user_helmet','steam:11000010c0588f0','{}'),(49,'user_mask','steam:11000010c0588f0','{}'),(50,'user_glasses','steam:11000010c0588f0','{}'),(51,'property','steam:11000010edbfb5d','{}'),(52,'user_ears','steam:11000010edbfb5d','{}'),(53,'user_glasses','steam:11000010edbfb5d','{}'),(54,'user_mask','steam:11000010edbfb5d','{}'),(55,'user_helmet','steam:11000010edbfb5d','{}'),(56,'property','steam:110000116b2f1a5','{}'),(57,'user_mask','steam:110000116b2f1a5','{}'),(58,'user_ears','steam:110000116b2f1a5','{}'),(59,'user_helmet','steam:110000116b2f1a5','{}'),(60,'user_glasses','steam:110000116b2f1a5','{}'),(61,'property','steam:110000112c384fc','{}'),(62,'user_ears','steam:110000112c384fc','{}'),(63,'user_glasses','steam:110000112c384fc','{}'),(64,'user_helmet','steam:110000112c384fc','{}'),(65,'user_mask','steam:110000112c384fc','{}'),(66,'property','steam:110000142afbcd6','{}'),(67,'user_glasses','steam:110000142afbcd6','{}'),(68,'user_mask','steam:110000142afbcd6','{}'),(69,'user_helmet','steam:110000142afbcd6','{}'),(70,'user_ears','steam:110000142afbcd6','{}');

#
# Structure for table "dopeplants"
#

DROP TABLE IF EXISTS `dopeplants`;
CREATE TABLE `dopeplants` (
  `owner` varchar(50) COLLATE utf32_spanish2_ci NOT NULL,
  `plant` longtext COLLATE utf32_spanish2_ci NOT NULL,
  `plantid` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

#
# Data for table "dopeplants"
#


#
# Structure for table "dpkeybinds"
#

DROP TABLE IF EXISTS `dpkeybinds`;
CREATE TABLE `dpkeybinds` (
  `id` varchar(50) DEFAULT NULL,
  `keybind1` varchar(50) DEFAULT 'num4',
  `emote1` varchar(255) DEFAULT '',
  `keybind2` varchar(50) DEFAULT 'num5',
  `emote2` varchar(255) DEFAULT '',
  `keybind3` varchar(50) DEFAULT 'num6',
  `emote3` varchar(255) DEFAULT '',
  `keybind4` varchar(50) DEFAULT 'num7',
  `emote4` varchar(255) DEFAULT '',
  `keybind5` varchar(50) DEFAULT 'num8',
  `emote5` varchar(255) DEFAULT '',
  `keybind6` varchar(50) DEFAULT 'num9',
  `emote6` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "dpkeybinds"
#

INSERT INTO `dpkeybinds` VALUES ('steam:110000117a1e4c9','num4','sit9','num5','','num6','','num7','','num8','','num9',''),('steam:110000142794b5a','num4','','num5','','num6','','num7','','num8','','num9',''),('steam:1100001172b03f4','num4','','num5','','num6','','num7','','num8','','num9',''),('steam:1100001154bcf8d','num4','','num5','','num6','','num7','','num8','','num9',''),('steam:110000118cf839d','num4','','num5','','num6','','num7','','num8','','num9',''),('steam:1100001026d69a0','num4','','num5','','num6','','num7','','num8','','num9',''),('steam:11000010c0588f0','num4','','num5','','num6','','num7','','num8','','num9',''),('steam:11000010edbfb5d','num4','','num5','','num6','','num7','','num8','','num9',''),('steam:110000116b2f1a5','num4','','num5','','num6','','num7','','num8','','num9',''),('steam:110000112c384fc','num4','','num5','','num6','','num7','','num8','','num9',''),('steam:110000142afbcd6','num4','','num5','','num6','','num7','','num8','','num9','');

#
# Structure for table "fine_types"
#

DROP TABLE IF EXISTS `fine_types`;
CREATE TABLE `fine_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

#
# Data for table "fine_types"
#

INSERT INTO `fine_types` VALUES (1,'Uso abusibo del claxon',500,1),(2,'Evadir la linea continua',500,1),(3,'Robo a banco',25000,3),(4,'Robo a banco central',50000,3),(5,'Saltarse un semaforo',300,1),(6,'Falta de respeto a la autoridad',200,1),(7,'Saltarse un stop',150,0),(8,'Exceso de velocidad',800,1),(9,'Asesinato',12000,3),(10,'Intento de asesinato',8000,2),(11,'Fuga a la policia',2000,2),(12,'Ir en sentido contrario',1500,2),(13,'Cambio de sentido ilegal',500,0),(14,'Conducir fuera de la carretera',800,1),(15,'Estacionamiento ilegal',200,0),(16,'Conducir un vehiculo ilegal',1000,1),(17,'Robar un vehiculo',2500,2),(18,'Usar un vehiculo sin papeles',1200,1),(19,'Obstrucion a la justicia',500,1),(20,'Desacato',300,0),(21,'Intento de corrupcion',400,1),(22,'No tener licencia de armas',300,1),(23,'Disparar en zona publica',800,2),(24,'Disparar contra la autoridad',5000,3),(25,'Posesion de drogas o substancia ilegal',1500,2),(26,'Secuestro',8000,3),(27,'Homicidio involuntario',2500,2),(28,'Otros [100€]',100,0),(29,'Otros [500€]',500,1),(30,'Otros [1000€]',1000,2),(31,'Otros [10000€]',10000,3);

#
# Structure for table "items"
#

DROP TABLE IF EXISTS `items`;
CREATE TABLE `items` (
  `name` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL,
  `label` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL,
  `weight` int(11) NOT NULL DEFAULT 1,
  `rare` tinyint(1) NOT NULL DEFAULT 0,
  `can_remove` tinyint(1) NOT NULL DEFAULT 1,
  `limit` int(11) DEFAULT 20,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

#
# Data for table "items"
#

INSERT INTO `items` VALUES ('alive_chicken','Poulet vivant',1,0,1,20),('altavoz','Altavoz de musica',1,0,1,3),('aluminum','Aluminio',1,0,1,1),('bagofdope','Bag of Dope',1,0,1,-1),('bandage','Bandage',2,0,1,NULL),('blowpipe','Chalumeaux',2,0,1,1),('bread','Donut',1,0,1,20),('burger','Hamburguesa',1,0,1,-1),('cannabis','Cannabis',1,0,1,40),('cargador','Cargador para arma',1,0,1,5),('carokit','Kit carosserie',3,0,1,1),('carotool','outils carosserie',2,0,1,1),('chaleco','Chaleco',1,0,1,5),('cheesebows','Patatas de queso',1,0,1,-1),('chips','Patatas fritas',1,0,1,-1),('cigarett','Cigarro',1,0,1,-1),('clothe','VÃªtement',1,0,1,40),('cocacola','Coca Cola',1,0,1,-1),('colis','E:\\Fivem_Server\\[SERVIDORES]\\STEPSILS_ROLEPLAY_FIN',1,0,1,-1),('copper','Cobre',1,0,1,56),('dopebag','Ziplock Bag',1,0,1,-1),('drugscales','Drug Scales',1,0,1,-1),('essence','Essence',1,0,1,24),('fabric','Tissu',1,0,1,80),('fanta','Fanta',1,0,1,-1),('fish','Poisson',1,0,1,100),('fixkit','Kit rÃ©paration',3,0,1,1),('fixtool','outils rÃ©paration',2,0,1,1),('flashlight','Linterna para arma',1,0,1,-1),('gazbottle','bouteille de gaz',2,0,1,3),('glass','Vidrio',1,0,1,1),('grip','Empuñadura para arma',1,0,1,-1),('highgradefemaleseed','Female Dope Seed+',1,0,1,-1),('highgradefert','High-Grade Fertilizer',1,0,1,-1),('highgrademaleseed','Male Dope Seed+',1,0,1,-1),('iron','Hierro',1,0,1,1),('jewels','Joyas',1,0,1,-1),('letter','Carta',1,0,1,-1),('lighter','Linterna',1,0,1,-1),('loka','Refresco de fruta',1,0,1,-1),('lotteryticket','Ticket de loteria',1,0,1,-1),('lowgradefemaleseed','Female Dope Seed',1,0,1,-1),('lowgradefert','Low-Grade Fertilizer',1,0,1,-1),('lowgrademaleseed','Male Dope Seed',1,0,1,-1),('macka','Sandwich de jamÃ³n',1,0,1,-1),('marabou','Chocolate con leche de marabÃº',1,0,1,-1),('marijuana','Marijuana',1,0,1,14),('medikit','Medikit',2,0,1,3),('Neumatico de recambio','Moneda de donador',1,0,0,50),('packaged_chicken','Poulet en barquette',1,0,1,100),('packaged_plank','Paquet de planches',1,0,1,100),('pastacarbonara','Pasta Carbonara',1,0,1,-1),('pastel','Pastel',2,0,1,2),('petardo','Petardo',1,0,1,5),('petrol','PÃ©trole',1,0,1,24),('petrol_raffin','PÃ©trole RaffinÃ©',1,0,1,24),('pizza','Pizza',1,0,1,-1),('plantpot','Plant Pot',1,0,1,-1),('plastic','Plastico',1,0,1,1),('purifiedwater','Purified Water',1,0,1,-1),('rueda','Neumatico de recambio',1,0,1,3),('silencieux','Silenciador para arma',1,0,1,-1),('skate','Skate',1,0,1,1),('slaughtered_chicken','Poulet abattu',1,0,1,20),('sprite','Sprite',1,0,1,-1),('steel','Acero',1,0,1,1),('trimmedweed','Trimmed Weed',1,0,1,-1),('water','Agua',1,0,1,20),('wateringcan','Watering Can',1,0,1,-1),('wayne_laptop','Chip tuneador',1,0,1,2),('wool','Laine',1,0,1,40),('yusuf','Skin para arma',1,0,1,-1),('zarowki','Luz de coche',1,0,1,3);

#
# Structure for table "job_grades"
#

DROP TABLE IF EXISTS `job_grades`;
CREATE TABLE `job_grades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL,
  `label` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL,
  `salary` int(11) NOT NULL,
  `skin_male` longtext COLLATE utf8mb4_spanish_ci NOT NULL,
  `skin_female` longtext COLLATE utf8mb4_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

#
# Data for table "job_grades"
#

INSERT INTO `job_grades` VALUES (1,'unemployed',0,'unemployed','Paro',200,'{}','{}'),(2,'mechanic',0,'recrue','Novato',1000,'{}','{}'),(3,'mechanic',1,'novice','Experimentado',1500,'{}','{}'),(6,'mechanic',2,'boss','Jefe de Mecanicos',2500,'{}','{}'),(12,'ambulance',0,'ambulance','Enfermero',1200,'{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}','{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),(13,'ambulance',1,'doctor','Medico',1500,'{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}','{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),(14,'ambulance',2,'chief_doctor','Doctor',2000,'{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}','{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),(15,'ambulance',3,'boss','Jefe de EMS',2500,'{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}','{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),(21,'lumberjack',0,'employee','Trabajador',800,'{}','{}'),(22,'fisherman',0,'employee','Trabajador',800,'{}','{}'),(23,'fueler',0,'employee','Trabajador',800,'{}','{}'),(26,'miner',0,'employee','Trabajador',800,'{\"tshirt_2\":1,\"ears_1\":8,\"glasses_1\":15,\"torso_2\":0,\"ears_2\":2,\"glasses_2\":3,\"shoes_2\":1,\"pants_1\":75,\"shoes_1\":51,\"bags_1\":0,\"helmet_2\":0,\"pants_2\":7,\"torso_1\":71,\"tshirt_1\":59,\"arms\":2,\"bags_2\":0,\"helmet_1\":0}','{}'),(28,'police',0,'recruit','Recluta',1200,'{}','{}'),(29,'police',1,'officer','Oficial',1500,'{}','{}'),(30,'police',2,'sergeant','Inspector',2000,'{}','{}'),(32,'police',3,'boss','Jefe de Policia',2500,'{}','{}'),(42,'taxi',0,'recrue','Novato',1200,'{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":32,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":31,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":0,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":27,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}','{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),(43,'taxi',1,'novice','Experimentado',1500,'{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":32,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":31,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":0,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":27,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}','{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),(46,'taxi',2,'boss','Jefe de Taxi',3000,'{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":29,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":31,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":4,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":1,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":0,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":4,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}','{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),(51,'mafia1',1,'soldato','Recluta',1500,'{}','{}'),(52,'mafia1',2,'mafioso','Soldado',2000,'{}','{}'),(53,'mafia1',3,'consigliere','Sub-jefe de la mafia',2500,'{}','{}'),(54,'mafia1',4,'boss','Jefe de la mafia',3000,'{}','{}'),(55,'admin',0,'recrue','Moderador',3000,'{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":32,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":31,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":0,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":27,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}\n','{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}\n'),(56,'admin',1,'novice','Administrador',4000,'{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":32,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":31,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":0,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":27,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}\n','{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}\n\n'),(57,'admin',2,'experimente','Superadministrador',100,'{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":29,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":31,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":4,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":1,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":0,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":4,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}\n','{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}\n'),(58,'admin',3,'experimente','Fundador',100,'{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":130,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":143,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":4,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":1,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":1,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":0,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":4,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":63,\"pants_1\":28}\n','{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":130,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":143,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":4,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":1,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":1,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":0,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":4,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":63,\"pants_1\":28}\n'),(59,'reporter',0,'novice','Empleado',800,'',''),(60,'slaughterer',0,'novice','Empleado',800,'',''),(61,'gopostal',0,'employee','Trabajador',800,'',''),(62,'miner',0,'employee','Empleado',0,'{}','{}'),(63,'weazelnews',0,'recrue','Empleado',800,'{}','{}'),(64,'weazelnews',1,'boss','Jefe',1500,'{}','{}');

#
# Structure for table "jobs"
#

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs` (
  `name` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL,
  `label` varchar(50) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `whitelisted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

#
# Data for table "jobs"
#

INSERT INTO `jobs` VALUES ('admin','Administracion',1),('ambulance','EMS',1),('fisherman','Pescador',0),('fueler','Reponedor',0),('garbage','Basurero',0),('gopostal','Correos',0),('lumberjack','Leñador',0),('mafia1','Mafia 1',1),('mechanic','Mecanico',1),('miner','Minero',0),('police','Policia',1),('reporter','Reportero',0),('slaughterer','Abatteur',1),('taxi','Taxista',1),('unemployed','Desempleado',0),('weazelnews','Reportero',0);

#
# Structure for table "kc_bans"
#

DROP TABLE IF EXISTS `kc_bans`;
CREATE TABLE `kc_bans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(100) NOT NULL DEFAULT '0',
  `license` varchar(100) NOT NULL,
  `reason` varchar(250) NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT '0',
  `ip` varchar(16) NOT NULL DEFAULT '127.0.0.1',
  `admin_name` varchar(100) NOT NULL DEFAULT '0',
  `admin_identifier` varchar(100) NOT NULL DEFAULT '0',
  `time` varchar(50) NOT NULL DEFAULT '0',
  `date` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "kc_bans"
#


#
# Structure for table "kc_jails"
#

DROP TABLE IF EXISTS `kc_jails`;
CREATE TABLE `kc_jails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `license` varchar(100) NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT '0',
  `admin_name` varchar(100) NOT NULL DEFAULT '0',
  `admin_identifier` varchar(100) NOT NULL DEFAULT '0',
  `time` varchar(100) NOT NULL DEFAULT '0',
  `time_s` varchar(100) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

#
# Data for table "kc_jails"
#


#
# Structure for table "kc_warns"
#

DROP TABLE IF EXISTS `kc_warns`;
CREATE TABLE `kc_warns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(100) NOT NULL DEFAULT '0',
  `license` varchar(100) NOT NULL DEFAULT '0',
  `reason` varchar(250) NOT NULL DEFAULT '0',
  `name` varchar(250) NOT NULL DEFAULT '0',
  `admin_name` varchar(250) NOT NULL DEFAULT '0',
  `admin_identifier` varchar(100) NOT NULL DEFAULT '0',
  `timestamp` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

#
# Data for table "kc_warns"
#


#
# Structure for table "licenses"
#

DROP TABLE IF EXISTS `licenses`;
CREATE TABLE `licenses` (
  `type` varchar(60) COLLATE utf8mb4_spanish_ci NOT NULL,
  `label` varchar(60) COLLATE utf8mb4_spanish_ci NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

#
# Data for table "licenses"
#

INSERT INTO `licenses` VALUES ('boat','Boat License'),('dmv','Code de la route'),('drive','Permis de conduire'),('drive_bike','Permis moto'),('drive_truck','Permis camion'),('weapon','Nivel de armas 1'),('weapon2','Nivel de armas 2'),('weapon3','VIP'),('weed_processing','Weed Processing License');

#
# Structure for table "mdt_warrants"
#

DROP TABLE IF EXISTS `mdt_warrants`;
CREATE TABLE `mdt_warrants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf32_spanish2_ci DEFAULT NULL,
  `char_id` int(11) DEFAULT NULL,
  `report_id` int(11) DEFAULT NULL,
  `report_title` varchar(255) COLLATE utf32_spanish2_ci DEFAULT NULL,
  `charges` longtext COLLATE utf32_spanish2_ci DEFAULT NULL,
  `date` varchar(255) COLLATE utf32_spanish2_ci DEFAULT NULL,
  `expire` varchar(255) COLLATE utf32_spanish2_ci DEFAULT NULL,
  `notes` varchar(255) COLLATE utf32_spanish2_ci DEFAULT NULL,
  `author` varchar(255) COLLATE utf32_spanish2_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

#
# Data for table "mdt_warrants"
#


#
# Structure for table "outfits"
#

DROP TABLE IF EXISTS `outfits`;
CREATE TABLE `outfits` (
  `idSteam` varchar(255) NOT NULL,
  `dad` int(11) NOT NULL DEFAULT 0,
  `mum` int(11) NOT NULL DEFAULT 0,
  `dadmumpercent` int(11) NOT NULL DEFAULT 0,
  `skinton` int(11) NOT NULL DEFAULT 0,
  `eyecolor` int(11) NOT NULL DEFAULT 0,
  `acne` int(11) NOT NULL DEFAULT 0,
  `skinproblem` int(11) NOT NULL DEFAULT 0,
  `freckle` int(11) NOT NULL DEFAULT 0,
  `wrinkle` int(11) NOT NULL DEFAULT 0,
  `wrinkleopacity` int(11) NOT NULL DEFAULT 0,
  `eyebrow` int(11) NOT NULL DEFAULT 0,
  `eyebrowopacity` int(11) NOT NULL DEFAULT 0,
  `beard` int(11) NOT NULL DEFAULT 0,
  `beardopacity` int(11) NOT NULL DEFAULT 0,
  `beardcolor` int(11) NOT NULL DEFAULT 0,
  `hair` int(11) NOT NULL DEFAULT 0,
  `hairtext` int(11) NOT NULL DEFAULT 0,
  `torso` int(11) NOT NULL DEFAULT 0,
  `torsotext` int(11) NOT NULL DEFAULT 0,
  `leg` int(11) NOT NULL DEFAULT 0,
  `legtext` int(11) NOT NULL DEFAULT 0,
  `shoes` int(11) NOT NULL DEFAULT 0,
  `shoestext` int(11) NOT NULL DEFAULT 0,
  `accessory` int(11) NOT NULL DEFAULT 0,
  `accessorytext` int(11) NOT NULL DEFAULT 0,
  `undershirt` int(11) NOT NULL DEFAULT 0,
  `undershirttext` int(11) NOT NULL DEFAULT 0,
  `torso2` int(11) NOT NULL DEFAULT 0,
  `torso2text` int(11) NOT NULL DEFAULT 0,
  `prop_hat` int(11) NOT NULL DEFAULT 0,
  `prop_hat_text` int(11) NOT NULL DEFAULT 0,
  `prop_glasses` int(11) NOT NULL DEFAULT 0,
  `prop_glasses_text` int(11) NOT NULL DEFAULT 0,
  `prop_earrings` int(11) NOT NULL DEFAULT 0,
  `prop_earrings_text` int(11) NOT NULL DEFAULT 0,
  `prop_watches` int(11) NOT NULL DEFAULT 0,
  `prop_watches_text` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "outfits"
#


#
# Structure for table "owned_properties"
#

DROP TABLE IF EXISTS `owned_properties`;
CREATE TABLE `owned_properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_spanish_ci NOT NULL,
  `price` double NOT NULL,
  `rented` int(11) NOT NULL,
  `owner` varchar(60) COLLATE utf8mb4_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

#
# Data for table "owned_properties"
#


#
# Structure for table "owned_vehicles"
#

DROP TABLE IF EXISTS `owned_vehicles`;
CREATE TABLE `owned_vehicles` (
  `owner` varchar(22) COLLATE utf8mb4_bin NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Etat de la voiture',
  `plate` varchar(12) COLLATE utf8mb4_bin NOT NULL,
  `vehicle` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `type` varchar(20) COLLATE utf8mb4_bin NOT NULL DEFAULT 'car',
  `job` varchar(20) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `stored` tinyint(1) NOT NULL DEFAULT 0,
  `fourrieremecano` tinyint(1) NOT NULL DEFAULT 0,
  `vehiclename` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT 'voiture',
  `garage` varchar(200) COLLATE utf8mb4_bin DEFAULT 'A',
  PRIMARY KEY (`plate`),
  KEY `vehsowned` (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

#
# Data for table "owned_vehicles"
#

INSERT INTO `owned_vehicles` VALUES ('steam:110000117a1e4c9',0,'AHI 217','{\"modFrontWheels\":-1,\"modDoorSpeaker\":-1,\"health\":1000,\"bodyHealth\":1000.0,\"modAirFilter\":-1,\"modGrille\":-1,\"modSpoilers\":-1,\"tyreSmokeColor\":[255,255,255],\"modTrimB\":-1,\"modRightFender\":-1,\"modHorns\":-1,\"modTransmission\":-1,\"modOrnaments\":-1,\"modTank\":-1,\"neonEnabled\":[false,false,false,false],\"modEngine\":-1,\"tyres\":[false,false,false,false,false,false,false],\"dirtLevel\":0.60953545570374,\"engineHealth\":1000.0,\"modLivery\":-1,\"modHydrolic\":-1,\"wheelColor\":156,\"modFrame\":-1,\"doors\":[false,false,false,false,false,false],\"modAPlate\":-1,\"modFender\":-1,\"windowTint\":-1,\"modPlateHolder\":-1,\"modEngineBlock\":-1,\"modSteeringWheel\":-1,\"wheels\":7,\"pearlescentColor\":111,\"modVanityPlate\":-1,\"model\":-1216765807,\"modRoof\":-1,\"extras\":{\"12\":false,\"10\":false,\"1\":true},\"modSeats\":-1,\"modXenon\":false,\"modTurbo\":false,\"modRearBumper\":-1,\"modTrimA\":-1,\"modWindows\":-1,\"color2\":12,\"modArmor\":-1,\"plate\":\"AHI 217\",\"modDial\":-1,\"modBrakes\":-1,\"modFrontBumper\":-1,\"modBackWheels\":-1,\"modSmokeEnabled\":1,\"modHood\":-1,\"modAerials\":-1,\"color1\":4,\"modArchCover\":-1,\"plateIndex\":0,\"windows\":[1,1,1,false,false,1,false,1,1,1,1,1,1],\"modSpeakers\":-1,\"modDashboard\":-1,\"modExhaust\":-1,\"modStruts\":-1,\"modSuspension\":-1,\"fuelLevel\":65.0,\"modTrunk\":-1,\"neonColor\":[255,0,255],\"modSideSkirt\":-1,\"modShifterLeavers\":-1}','car','',1,0,'voiture','central'),('steam:110000117a1e4c9',0,'ANIOL_12','{\"modHydrolic\":-1,\"modFrame\":-1,\"color2\":13,\"modAPlate\":-1,\"modHood\":-1,\"modOrnaments\":-1,\"modRearBumper\":-1,\"modSideSkirt\":-1,\"modTrunk\":-1,\"modExhaust\":-1,\"modDashboard\":-1,\"modTrimA\":-1,\"color1\":3,\"modRoof\":-1,\"modTurbo\":false,\"modSmokeEnabled\":false,\"modArchCover\":-1,\"modAerials\":-1,\"dirtLevel\":6.0,\"modDial\":-1,\"modSpoilers\":-1,\"extras\":{\"1\":true,\"10\":false,\"12\":true},\"modSeats\":-1,\"modRightFender\":-1,\"neonEnabled\":[false,false,false,false],\"modFrontBumper\":-1,\"model\":-1216765807,\"plate\":\"ANIOL_12\",\"modBrakes\":-1,\"modDoorSpeaker\":-1,\"modSuspension\":-1,\"modFrontWheels\":-1,\"modArmor\":-1,\"tyreSmokeColor\":[255,255,255],\"modGrille\":-1,\"pearlescentColor\":5,\"modShifterLeavers\":-1,\"modAirFilter\":-1,\"modSpeakers\":-1,\"modTank\":-1,\"modTransmission\":-1,\"modEngine\":-1,\"modPlateHolder\":-1,\"health\":1000,\"modVanityPlate\":-1,\"modHorns\":-1,\"modFender\":-1,\"modEngineBlock\":-1,\"modLivery\":-1,\"modSteeringWheel\":-1,\"plateIndex\":0,\"modXenon\":false,\"wheels\":7,\"wheelColor\":156,\"modWindows\":-1,\"neonColor\":[255,0,255],\"windowTint\":-1,\"modBackWheels\":-1,\"modTrimB\":-1,\"modStruts\":-1}','car','',1,0,'voiture','A'),('steam:110000117a1e4c9',0,'ASY 373','{\"modHorns\":-1,\"modStruts\":-1,\"color2\":28,\"modVanityPlate\":-1,\"plateIndex\":4,\"modArmor\":-1,\"modAerials\":-1,\"wheels\":0,\"model\":1171614426,\"modExhaust\":-1,\"modTransmission\":-1,\"modSideSkirt\":-1,\"modSeats\":-1,\"pearlescentColor\":112,\"dirtLevel\":0.053951758891344,\"color1\":112,\"plate\":\"ASY 373\",\"modTrimA\":-1,\"modPlateHolder\":-1,\"modOrnaments\":-1,\"windows\":[1,1,1,false,false,1,false,1,1,false,1,1,1],\"modDoorSpeaker\":-1,\"modFender\":-1,\"modRearBumper\":-1,\"modHood\":-1,\"modEngineBlock\":-1,\"modFrame\":-1,\"extras\":{\"1\":false},\"tyreSmokeColor\":[255,255,255],\"windowTint\":-1,\"modBackWheels\":-1,\"modXenon\":false,\"modShifterLeavers\":-1,\"modArchCover\":-1,\"tyres\":[false,false,false,false,false,false,false],\"modTurbo\":false,\"modSmokeEnabled\":1,\"neonEnabled\":[false,false,false,false],\"modGrille\":-1,\"modAPlate\":-1,\"bodyHealth\":1000.0,\"health\":1000,\"modHydrolic\":-1,\"modSpoilers\":-1,\"modRightFender\":-1,\"wheelColor\":156,\"modFrontWheels\":-1,\"neonColor\":[255,0,255],\"modAirFilter\":-1,\"modDashboard\":-1,\"modSuspension\":-1,\"modTrunk\":-1,\"fuelLevel\":76.92000579834,\"modLivery\":1,\"modBrakes\":-1,\"doors\":[false,false,false,false,false,false],\"modTank\":-1,\"modFrontBumper\":-1,\"modSpeakers\":-1,\"modRoof\":-1,\"modTrimB\":-1,\"modDial\":-1,\"engineHealth\":1000.0,\"modWindows\":-1,\"modEngine\":-1,\"modSteeringWheel\":-1}','car','ambulance',1,0,'voiture','central'),('steam:110000117a1e4c9',0,'CKD 090','{\"modArmor\":-1,\"doors\":[false,false,false,false,false,false],\"modExhaust\":-1,\"modSpeakers\":-1,\"tyreSmokeColor\":[255,255,255],\"modTurbo\":false,\"modTrunk\":-1,\"pearlescentColor\":0,\"wheelColor\":96,\"modAPlate\":-1,\"tyres\":[false,false,false,false,false,false,false],\"modEngineBlock\":-1,\"modSideSkirt\":-1,\"modGrille\":-1,\"plate\":\"CKD 090\",\"windowTint\":-1,\"modLivery\":-1,\"modBackWheels\":-1,\"modSmokeEnabled\":1,\"modHydrolic\":-1,\"modSteeringWheel\":-1,\"modSpoilers\":-1,\"modFrontWheels\":-1,\"modFrame\":-1,\"neonEnabled\":[false,false,false,false],\"modSeats\":-1,\"modSuspension\":-1,\"bodyHealth\":983.12481689453,\"modTrimB\":-1,\"dirtLevel\":0.07583636790514,\"neonColor\":[255,0,255],\"health\":983,\"modXenon\":1,\"modStruts\":-1,\"modDashboard\":-1,\"modTank\":-1,\"modRearBumper\":-1,\"modHorns\":-1,\"modAerials\":-1,\"modTrimA\":-1,\"modPlateHolder\":-1,\"extras\":[],\"modTransmission\":-1,\"modAirFilter\":-1,\"modBrakes\":-1,\"modDial\":-1,\"modDoorSpeaker\":-1,\"modHood\":-1,\"modRoof\":-1,\"modVanityPlate\":-1,\"modOrnaments\":-1,\"engineHealth\":974.68725585938,\"modEngine\":-1,\"color2\":32,\"color1\":160,\"windows\":[1,1,1,1,1,1,1,1,1,false,1,1,1],\"modArchCover\":-1,\"modFender\":-1,\"model\":921299053,\"plateIndex\":4,\"fuelLevel\":1000.0,\"modFrontBumper\":-1,\"modWindows\":-1,\"wheels\":3,\"modShifterLeavers\":-1,\"modRightFender\":-1}','car','',1,0,'voiture','central'),('steam:110000117a1e4c9',0,'DCQ 229','{\"modDashboard\":-1,\"modExhaust\":0,\"modDial\":-1,\"fuelLevel\":46.10998916626,\"modTrimA\":-1,\"plateIndex\":1,\"modAPlate\":-1,\"modSpoilers\":-1,\"modBackWheels\":-1,\"wheelColor\":55,\"modHood\":-1,\"modStruts\":-1,\"tyreSmokeColor\":[0,255,0],\"modSmokeEnabled\":1,\"modArchCover\":-1,\"modSeats\":-1,\"modOrnaments\":-1,\"bodyHealth\":935.04681396484,\"pearlescentColor\":160,\"modVanityPlate\":-1,\"modWindows\":-1,\"color1\":57,\"tyres\":[false,false,false,false,false,false,false],\"doors\":[false,false,false,false,false,false],\"modSideSkirt\":-1,\"dirtLevel\":10.791085243225,\"modTrimB\":-1,\"model\":819197656,\"modFrontBumper\":0,\"modRoof\":0,\"engineHealth\":909.32012939453,\"modFrame\":-1,\"modGrille\":-1,\"modHorns\":41,\"modBrakes\":2,\"windowTint\":1,\"modAerials\":-1,\"modTransmission\":2,\"modSteeringWheel\":-1,\"modArmor\":4,\"neonColor\":[0,255,0],\"modEngine\":3,\"plate\":\"DCQ 229\",\"modLivery\":-1,\"extras\":{\"1\":true},\"modTank\":-1,\"modPlateHolder\":-1,\"modXenon\":1,\"modAirFilter\":-1,\"modDoorSpeaker\":-1,\"modHydrolic\":-1,\"windows\":[1,false,false,false,false,1,false,1,1,false,1,1,1],\"modTrunk\":-1,\"modShifterLeavers\":-1,\"modRightFender\":-1,\"modEngineBlock\":-1,\"wheels\":2,\"modRearBumper\":0,\"neonEnabled\":[1,1,1,1],\"modTurbo\":1,\"modSuspension\":-1,\"modFrontWheels\":7,\"color2\":132,\"health\":998,\"modFender\":-1,\"modSpeakers\":-1}','car','',1,0,'voiture','central'),('steam:110000117a1e4c9',0,'DUM 469','{\"modHorns\":-1,\"modStruts\":-1,\"color2\":0,\"modVanityPlate\":-1,\"plateIndex\":0,\"modArmor\":-1,\"modAerials\":-1,\"wheels\":0,\"model\":-344943009,\"modExhaust\":-1,\"modTransmission\":-1,\"modSideSkirt\":-1,\"modSeats\":-1,\"pearlescentColor\":111,\"dirtLevel\":11.507731437683,\"color1\":6,\"plate\":\"DUM 469\",\"modTrimA\":-1,\"modPlateHolder\":-1,\"modOrnaments\":-1,\"windows\":[false,1,1,false,false,false,false,1,1,1,1,1,1],\"modDoorSpeaker\":-1,\"modFender\":-1,\"modRearBumper\":-1,\"modHood\":-1,\"modEngineBlock\":-1,\"modFrame\":-1,\"extras\":{\"10\":true,\"12\":false},\"tyreSmokeColor\":[255,255,255],\"windowTint\":-1,\"modBackWheels\":-1,\"modXenon\":1,\"modShifterLeavers\":-1,\"modArchCover\":-1,\"tyres\":[false,false,false,false,false,false,false],\"modTurbo\":false,\"modSmokeEnabled\":1,\"neonEnabled\":[false,false,false,false],\"modGrille\":-1,\"modAPlate\":-1,\"bodyHealth\":991.97717285156,\"health\":1000,\"modHydrolic\":-1,\"modSpoilers\":-1,\"modRightFender\":-1,\"wheelColor\":156,\"modFrontWheels\":-1,\"neonColor\":[255,0,255],\"modAirFilter\":-1,\"modDashboard\":-1,\"modSuspension\":-1,\"modTrunk\":-1,\"fuelLevel\":23.909997940063,\"modLivery\":-1,\"modBrakes\":-1,\"doors\":[false,false,false,false,false,false],\"modTank\":-1,\"modFrontBumper\":-1,\"modSpeakers\":-1,\"modRoof\":-1,\"modTrimB\":-1,\"modDial\":-1,\"engineHealth\":998.875,\"modWindows\":-1,\"modEngine\":-1,\"modSteeringWheel\":-1}','car','',1,0,'voiture','central'),('steam:110000117a1e4c9',0,'EQA 563','{\"modAerials\":-1,\"modEngineBlock\":-1,\"model\":-271091526,\"modDoorSpeaker\":-1,\"modOrnaments\":-1,\"modGrille\":-1,\"modTurbo\":false,\"modXenon\":1,\"modVanityPlate\":-1,\"doors\":[false,false,false,false,false,false],\"modSuspension\":-1,\"modFrontWheels\":-1,\"modHood\":-1,\"modRearBumper\":-1,\"modBackWheels\":-1,\"modAirFilter\":-1,\"modTrunk\":-1,\"tyreSmokeColor\":[255,255,255],\"modStruts\":-1,\"modHydrolic\":-1,\"modPlateHolder\":-1,\"modEngine\":-1,\"modTransmission\":-1,\"modFrame\":-1,\"modArchCover\":-1,\"wheels\":0,\"bodyHealth\":966.18988037109,\"color2\":32,\"modRoof\":-1,\"modTank\":-1,\"modSideSkirt\":-1,\"modSteeringWheel\":-1,\"windows\":[1,false,1,false,false,1,false,1,1,false,1,1,1],\"plateIndex\":4,\"modArmor\":-1,\"wheelColor\":96,\"color1\":128,\"modHorns\":-1,\"health\":966,\"modSpoilers\":-1,\"engineHealth\":1000.0,\"neonEnabled\":[false,false,false,false],\"modTrimA\":-1,\"fuelLevel\":65.0,\"modDial\":-1,\"modFrontBumper\":-1,\"modAPlate\":-1,\"pearlescentColor\":0,\"extras\":{\"1\":true},\"modExhaust\":-1,\"modRightFender\":-1,\"modDashboard\":-1,\"plate\":\"EQA 563\",\"modWindows\":-1,\"neonColor\":[255,0,255],\"modSeats\":-1,\"modBrakes\":-1,\"modTrimB\":-1,\"windowTint\":-1,\"modLivery\":0,\"modFender\":-1,\"tyres\":[false,false,false,false,false,false,false],\"modShifterLeavers\":-1,\"modSpeakers\":-1,\"dirtLevel\":8.1767234802246,\"modSmokeEnabled\":false}','car','',1,0,'voiture','ciudad'),('steam:110000142794b5a',0,'KSW 184','{\"modFrontBumper\":-1,\"modEngine\":-1,\"modHydrolic\":-1,\"modAPlate\":-1,\"modFrame\":-1,\"modSteeringWheel\":-1,\"color2\":0,\"extras\":{\"12\":false,\"10\":false,\"1\":true},\"modSeats\":-1,\"modSmokeEnabled\":false,\"windowTint\":-1,\"color1\":1,\"modDoorSpeaker\":-1,\"modPlateHolder\":-1,\"pearlescentColor\":7,\"modHorns\":-1,\"modArchCover\":-1,\"modTrimA\":-1,\"modTrunk\":-1,\"modRightFender\":-1,\"model\":-1216765807,\"modSpoilers\":-1,\"modAirFilter\":-1,\"modXenon\":false,\"modWindows\":-1,\"tyreSmokeColor\":[255,255,255],\"modTransmission\":-1,\"modBrakes\":-1,\"health\":1000,\"modSpeakers\":-1,\"neonEnabled\":[false,false,false,false],\"modHood\":-1,\"plate\":\"KSW 184\",\"modBackWheels\":-1,\"modTank\":-1,\"modDashboard\":-1,\"modSideSkirt\":-1,\"modTrimB\":-1,\"modGrille\":-1,\"modExhaust\":-1,\"modVanityPlate\":-1,\"wheels\":7,\"modEngineBlock\":-1,\"modTurbo\":false,\"dirtLevel\":6.0,\"modRoof\":-1,\"plateIndex\":0,\"modArmor\":-1,\"modFrontWheels\":-1,\"neonColor\":[255,0,255],\"modRearBumper\":-1,\"modDial\":-1,\"modStruts\":-1,\"modOrnaments\":-1,\"modSuspension\":-1,\"modShifterLeavers\":-1,\"modLivery\":-1,\"modFender\":-1,\"modAerials\":-1,\"wheelColor\":156}','car','',1,0,'voiture','A'),('steam:110000117a1e4c9',0,'KYL 357','{\"modArmor\":-1,\"doors\":[false,false,false,false,false,false],\"modExhaust\":-1,\"modSpeakers\":-1,\"tyreSmokeColor\":[255,255,255],\"modFrontBumper\":-1,\"modTrunk\":-1,\"pearlescentColor\":0,\"color1\":128,\"modAPlate\":-1,\"tyres\":[false,false,false,false,false,false,false],\"modHood\":-1,\"modSideSkirt\":-1,\"modGrille\":-1,\"plate\":\"KYL 357\",\"windowTint\":-1,\"modLivery\":-1,\"modBackWheels\":-1,\"modSmokeEnabled\":1,\"modHydrolic\":-1,\"modSteeringWheel\":-1,\"modSpoilers\":-1,\"modRightFender\":-1,\"modFrame\":-1,\"neonEnabled\":[false,false,false,false],\"modSeats\":-1,\"modSuspension\":-1,\"bodyHealth\":1000.0,\"modTrimB\":-1,\"dirtLevel\":0.0037717679515481,\"neonColor\":[255,0,255],\"health\":1000,\"modXenon\":1,\"modStruts\":-1,\"modDashboard\":-1,\"modTank\":-1,\"modRearBumper\":-1,\"modHorns\":-1,\"modAerials\":-1,\"modTrimA\":-1,\"modPlateHolder\":-1,\"extras\":{\"6\":true},\"modTransmission\":-1,\"modBrakes\":-1,\"color2\":32,\"modDial\":-1,\"modDoorSpeaker\":-1,\"modRoof\":-1,\"engineHealth\":1000.0,\"modVanityPlate\":-1,\"modOrnaments\":-1,\"modEngineBlock\":-1,\"modEngine\":-1,\"modFender\":-1,\"windows\":[1,false,false,1,1,1,1,1,1,false,1,false,false],\"modArchCover\":-1,\"fuelLevel\":65.0,\"modTurbo\":false,\"model\":138414874,\"plateIndex\":4,\"wheelColor\":96,\"modAirFilter\":-1,\"modWindows\":-1,\"wheels\":0,\"modShifterLeavers\":-1,\"modFrontWheels\":-1}','car','',1,0,'voiture','central'),('steam:110000118cf839d',0,'LCH 651','{\"neonEnabled\":[false,false,false,false],\"modFender\":-1,\"modVanityPlate\":-1,\"modSpoilers\":-1,\"modWindows\":-1,\"windowTint\":-1,\"tyreSmokeColor\":[255,255,255],\"modRearBumper\":-1,\"modAPlate\":-1,\"modSeats\":-1,\"modEngine\":-1,\"health\":1000,\"modTransmission\":-1,\"modPlateHolder\":-1,\"dirtLevel\":8.0,\"modLivery\":-1,\"modStruts\":-1,\"modGrille\":-1,\"modDial\":-1,\"modSuspension\":-1,\"modFrontBumper\":-1,\"modHood\":-1,\"modEngineBlock\":-1,\"modArchCover\":-1,\"modBackWheels\":-1,\"modXenon\":false,\"modSideSkirt\":-1,\"modTrimA\":-1,\"modTrimB\":-1,\"wheelColor\":96,\"color1\":160,\"neonColor\":[255,0,255],\"modTrunk\":-1,\"modRoof\":-1,\"modAerials\":-1,\"modOrnaments\":-1,\"modTank\":-1,\"modDoorSpeaker\":-1,\"modExhaust\":-1,\"modDashboard\":-1,\"modAirFilter\":-1,\"plate\":\"LCH 651\",\"model\":921299053,\"pearlescentColor\":0,\"extras\":[],\"wheels\":3,\"modTurbo\":false,\"modSmokeEnabled\":false,\"modShifterLeavers\":-1,\"plateIndex\":4,\"modFrame\":-1,\"modHydrolic\":-1,\"color2\":32,\"modFrontWheels\":-1,\"modSpeakers\":-1,\"modBrakes\":-1,\"modHorns\":-1,\"modRightFender\":-1,\"modSteeringWheel\":-1,\"modArmor\":-1}','car','',1,0,'voiture','A'),('steam:1100001172b03f4',0,'OMC 621','{\"wheels\":6,\"modSideSkirt\":-1,\"modAirFilter\":-1,\"modSuspension\":-1,\"health\":946,\"modHydrolic\":-1,\"modSmokeEnabled\":1,\"modRoof\":-1,\"plate\":\"OMC 621\",\"dirtLevel\":9.8546991348267,\"modAerials\":-1,\"modStruts\":-1,\"color2\":80,\"extras\":[],\"modVanityPlate\":-1,\"modAPlate\":-1,\"modBrakes\":-1,\"modHorns\":-1,\"model\":716948124,\"bodyHealth\":947.45520019531,\"modOrnaments\":-1,\"modTrimA\":-1,\"modSpeakers\":-1,\"modFrontWheels\":-1,\"modFender\":-1,\"modShifterLeavers\":-1,\"engineHealth\":955.34698486328,\"modFrame\":-1,\"tyreSmokeColor\":[255,255,255],\"modRearBumper\":-1,\"modRightFender\":-1,\"doors\":[false,false,false,false,false,false],\"modHood\":-1,\"modTrimB\":-1,\"modFrontBumper\":-1,\"modEngine\":-1,\"color1\":96,\"tyres\":[false,false,false,false,false,false,false],\"modWindows\":-1,\"modXenon\":1,\"fuelLevel\":65.0,\"modTurbo\":false,\"modTransmission\":-1,\"modPlateHolder\":-1,\"modExhaust\":-1,\"modGrille\":-1,\"modSpoilers\":-1,\"modTank\":-1,\"modDashboard\":-1,\"pearlescentColor\":0,\"modBackWheels\":-1,\"modDoorSpeaker\":-1,\"wheelColor\":96,\"modLivery\":-1,\"neonColor\":[255,0,255],\"modSeats\":-1,\"modTrunk\":-1,\"plateIndex\":4,\"modArchCover\":-1,\"modEngineBlock\":-1,\"windowTint\":-1,\"windows\":[false,false,false,false,false,false,false,1,1,false,1,1,1],\"modSteeringWheel\":-1,\"modArmor\":-1,\"neonEnabled\":[false,false,false,false],\"modDial\":-1}','car','',1,0,'voiture','central'),('steam:110000117a1e4c9',0,'PIY 470','{\"modXenon\":false,\"plateIndex\":4,\"neonEnabled\":[false,false,false,false],\"modAerials\":-1,\"modShifterLeavers\":-1,\"modSpoilers\":-1,\"modEngineBlock\":-1,\"modAPlate\":-1,\"modRoof\":-1,\"modLivery\":-1,\"modGrille\":-1,\"modRearBumper\":-1,\"modTrunk\":-1,\"modDial\":-1,\"modSeats\":-1,\"extras\":{\"11\":true,\"2\":false},\"modFender\":-1,\"modTransmission\":-1,\"wheelColor\":96,\"modHydrolic\":-1,\"wheels\":3,\"modArchCover\":-1,\"dirtLevel\":1.0000094175339,\"modHood\":-1,\"health\":1000,\"modRightFender\":-1,\"modFrontWheels\":-1,\"windowTint\":-1,\"neonColor\":[255,0,255],\"pearlescentColor\":0,\"modBackWheels\":-1,\"modBrakes\":-1,\"modHorns\":-1,\"plate\":\"PIY 470\",\"modSteeringWheel\":-1,\"modStruts\":-1,\"modSmokeEnabled\":false,\"modPlateHolder\":-1,\"modDoorSpeaker\":-1,\"model\":-450773703,\"modEngine\":-1,\"tyreSmokeColor\":[255,255,255],\"modTrimB\":-1,\"modTrimA\":-1,\"color1\":128,\"modArmor\":-1,\"modAirFilter\":-1,\"modSpeakers\":-1,\"modTank\":-1,\"modFrontBumper\":-1,\"modSideSkirt\":-1,\"modFrame\":-1,\"color2\":192,\"modVanityPlate\":-1,\"modOrnaments\":-1,\"modTurbo\":false,\"modWindows\":-1,\"modSuspension\":-1,\"modExhaust\":-1,\"modDashboard\":-1}','car','',1,0,'voiture','A'),('steam:1100001172b03f4',0,'PJL 063','{\"plateIndex\":4,\"modLivery\":-1,\"modHorns\":-1,\"modSmokeEnabled\":false,\"modFender\":-1,\"modTrimB\":-1,\"modFrontBumper\":-1,\"modSteeringWheel\":-1,\"model\":-2128675626,\"neonEnabled\":[false,false,false,false],\"modDashboard\":-1,\"modSideSkirt\":-1,\"modArchCover\":-1,\"modFrontWheels\":-1,\"tyres\":[false,false,false,false,false,false,false],\"modPlateHolder\":-1,\"modDoorSpeaker\":-1,\"modBackWheels\":-1,\"modHydrolic\":-1,\"modXenon\":1,\"modAerials\":-1,\"bodyHealth\":980.62805175781,\"modAPlate\":-1,\"modSuspension\":-1,\"modExhaust\":-1,\"color2\":192,\"modBrakes\":-1,\"plate\":\"PJL 063\",\"modVanityPlate\":-1,\"engineHealth\":970.94207763672,\"modWindows\":-1,\"modSpoilers\":-1,\"modTank\":-1,\"neonColor\":[255,0,255],\"health\":980,\"modHood\":-1,\"modSeats\":-1,\"modAirFilter\":-1,\"modTrunk\":-1,\"modGrille\":-1,\"wheelColor\":96,\"modSpeakers\":-1,\"dirtLevel\":1.0652579069138,\"windowTint\":-1,\"doors\":[false,false,false,false,false,false],\"extras\":[],\"pearlescentColor\":0,\"modRoof\":-1,\"wheels\":7,\"modOrnaments\":-1,\"modDial\":-1,\"modEngineBlock\":-1,\"modEngine\":-1,\"modTurbo\":false,\"modRearBumper\":-1,\"modFrame\":-1,\"modTrimA\":-1,\"tyreSmokeColor\":[255,255,255],\"modRightFender\":-1,\"color1\":128,\"modShifterLeavers\":-1,\"windows\":[1,1,1,false,false,1,1,false,1,false,1,1,1],\"fuelLevel\":71.219985961914,\"modTransmission\":-1,\"modArmor\":-1,\"modStruts\":-1}','car','',1,0,'voiture','central'),('steam:110000112c384fc',0,'POZ 259','{\"modTurbo\":false,\"color2\":16,\"neonColor\":[255,0,255],\"modSpeakers\":-1,\"modEngineBlock\":-1,\"modSmokeEnabled\":false,\"modLivery\":-1,\"modShifterLeavers\":-1,\"modDashboard\":-1,\"modArchCover\":-1,\"neonEnabled\":[false,false,false,false],\"modAirFilter\":-1,\"modSteeringWheel\":-1,\"modTrimA\":-1,\"modEngine\":-1,\"modStruts\":-1,\"windowTint\":-1,\"modPlateHolder\":-1,\"modFrame\":-1,\"modExhaust\":-1,\"wheels\":0,\"color1\":96,\"modHorns\":-1,\"modTrunk\":-1,\"modAerials\":-1,\"modTransmission\":-1,\"modOrnaments\":-1,\"modDial\":-1,\"wheelColor\":96,\"modDoorSpeaker\":-1,\"modXenon\":false,\"modFender\":-1,\"modSpoilers\":-1,\"modHydrolic\":-1,\"modSeats\":-1,\"modSuspension\":-1,\"modTank\":-1,\"modAPlate\":-1,\"health\":1000,\"modWindows\":-1,\"modFrontBumper\":-1,\"tyreSmokeColor\":[255,255,255],\"plateIndex\":4,\"modSideSkirt\":-1,\"modHood\":-1,\"modBackWheels\":-1,\"modBrakes\":-1,\"modGrille\":-1,\"model\":391676359,\"plate\":\"POZ 259\",\"modVanityPlate\":-1,\"pearlescentColor\":0,\"modRearBumper\":-1,\"modRightFender\":-1,\"modFrontWheels\":-1,\"modTrimB\":-1,\"dirtLevel\":3.0,\"extras\":{\"1\":true},\"modArmor\":-1,\"modRoof\":-1}','car','',1,0,'voiture','A'),('steam:1100001172b03f4',0,'RDH 737','{\"modXenon\":false,\"plateIndex\":4,\"neonEnabled\":[false,false,false,false],\"modAerials\":-1,\"modShifterLeavers\":-1,\"modSpoilers\":-1,\"modRoof\":-1,\"modTank\":-1,\"color2\":240,\"modTrimB\":-1,\"modGrille\":-1,\"modArmor\":-1,\"modTrunk\":-1,\"modDial\":-1,\"modSeats\":-1,\"modExhaust\":-1,\"modRearBumper\":-1,\"modEngine\":-1,\"modHydrolic\":-1,\"dirtLevel\":7.0000085830688,\"modFrontBumper\":-1,\"modArchCover\":-1,\"health\":1000,\"modSuspension\":-1,\"modFrontWheels\":-1,\"modRightFender\":-1,\"modStruts\":-1,\"wheelColor\":96,\"neonColor\":[255,0,255],\"pearlescentColor\":0,\"modBackWheels\":-1,\"modFender\":-1,\"modHorns\":-1,\"modEngineBlock\":-1,\"modSteeringWheel\":-1,\"color1\":32,\"modAPlate\":-1,\"modPlateHolder\":-1,\"windowTint\":-1,\"model\":1929204514,\"wheels\":6,\"tyreSmokeColor\":[255,255,255],\"plate\":\"RDH 737\",\"modTrimA\":-1,\"modLivery\":2,\"modVanityPlate\":-1,\"modAirFilter\":-1,\"modSpeakers\":-1,\"modWindows\":-1,\"modHood\":-1,\"modSideSkirt\":-1,\"modBrakes\":-1,\"extras\":[],\"modFrame\":-1,\"modOrnaments\":-1,\"modTurbo\":false,\"modSmokeEnabled\":false,\"modDoorSpeaker\":-1,\"modTransmission\":-1,\"modDashboard\":-1}','car','',1,0,'voiture','A'),('steam:110000117a1e4c9',0,'RDZ 492','{\"modAirFilter\":-1,\"modRearBumper\":-1,\"modStruts\":-1,\"extras\":[],\"modDial\":-1,\"modDashboard\":-1,\"modArchCover\":-1,\"modSideSkirt\":-1,\"modHydrolic\":-1,\"dirtLevel\":0.094599165022373,\"modEngineBlock\":-1,\"modExhaust\":-1,\"modFrontWheels\":-1,\"bodyHealth\":972.00659179688,\"windows\":[1,false,false,false,false,1,false,false,1,false,1,1,1],\"modXenon\":1,\"health\":971,\"modGrille\":-1,\"modTank\":-1,\"modFrame\":-1,\"tyreSmokeColor\":[255,255,255],\"modAerials\":-1,\"modTrunk\":-1,\"modLivery\":-1,\"modEngine\":-1,\"engineHealth\":967.1748046875,\"modArmor\":-1,\"pearlescentColor\":3,\"modSuspension\":-1,\"windowTint\":-1,\"doors\":[false,false,false,false,false,false],\"modTrimB\":-1,\"color2\":7,\"modAPlate\":-1,\"modWindows\":-1,\"modTurbo\":false,\"modPlateHolder\":-1,\"wheelColor\":0,\"plate\":\"RDZ 492\",\"neonColor\":[255,0,255],\"modSeats\":-1,\"color1\":7,\"tyres\":[false,false,false,false,false,false,false],\"modFrontBumper\":-1,\"modHood\":-1,\"modTrimA\":-1,\"modSteeringWheel\":-1,\"modTransmission\":-1,\"modOrnaments\":-1,\"modRightFender\":-1,\"modRoof\":-1,\"modShifterLeavers\":-1,\"modVanityPlate\":-1,\"plateIndex\":0,\"modHorns\":-1,\"modSpeakers\":-1,\"modDoorSpeaker\":-1,\"modFender\":-1,\"modBrakes\":-1,\"modSmokeEnabled\":1,\"neonEnabled\":[false,false,false,false],\"fuelLevel\":70.189994812012,\"modBackWheels\":-1,\"wheels\":7,\"model\":1663218586,\"modSpoilers\":-1}','car','',1,0,'voiture','central'),('steam:110000117a1e4c9',0,'TETE','{\"neonColor\":[255,0,255],\"modTransmission\":-1,\"modArmor\":-1,\"tyres\":[false,false,false,false,false,false,false],\"modFrontBumper\":-1,\"modHydrolic\":-1,\"modVanityPlate\":-1,\"modRightFender\":-1,\"modExhaust\":-1,\"modEngineBlock\":-1,\"modGrille\":-1,\"fuelLevel\":52.5,\"health\":1000,\"modSuspension\":-1,\"modAPlate\":-1,\"modSteeringWheel\":-1,\"engineHealth\":1000.0,\"modLivery\":-1,\"modTurbo\":false,\"modArchCover\":-1,\"dirtLevel\":1.9295688616694e-05,\"doors\":[false,false,false,false,false,false],\"modStruts\":-1,\"modTank\":-1,\"modOrnaments\":-1,\"modDoorSpeaker\":-1,\"modXenon\":1,\"modSpeakers\":-1,\"modBackWheels\":-1,\"modTrimB\":-1,\"modHorns\":-1,\"neonEnabled\":[false,false,false,false],\"plateIndex\":0,\"modTrunk\":-1,\"color1\":111,\"wheels\":7,\"modRearBumper\":-1,\"color2\":2,\"modAerials\":-1,\"modSmokeEnabled\":1,\"modFender\":-1,\"windowTint\":-1,\"pearlescentColor\":70,\"model\":-1216765807,\"modSeats\":-1,\"plate\":\"TETE\",\"tyreSmokeColor\":[255,255,255],\"extras\":{\"10\":false,\"12\":false,\"1\":true},\"modSideSkirt\":-1,\"modDashboard\":-1,\"modBrakes\":-1,\"modSpoilers\":-1,\"modShifterLeavers\":-1,\"modRoof\":-1,\"modFrame\":-1,\"modHood\":-1,\"modFrontWheels\":-1,\"bodyHealth\":1000.0,\"modAirFilter\":-1,\"modPlateHolder\":-1,\"modEngine\":-1,\"windows\":[1,1,1,false,false,1,false,1,1,1,1,false,false],\"modWindows\":-1,\"modDial\":-1,\"wheelColor\":156,\"modTrimA\":-1}','car','',1,0,'voiture','central'),('steam:110000117a1e4c9',0,'TTV 655','{\"modSeats\":-1,\"modTrimA\":-1,\"modExhaust\":-1,\"modFrame\":-1,\"modSpoilers\":-1,\"modSpeakers\":-1,\"modHydrolic\":-1,\"modRoof\":-1,\"modEngineBlock\":-1,\"modArmor\":-1,\"tyres\":[false,false,false,false,false,false,false],\"modDashboard\":-1,\"tyreSmokeColor\":[255,255,255],\"pearlescentColor\":18,\"modSideSkirt\":-1,\"model\":1093792632,\"neonEnabled\":[false,false,false,false],\"wheels\":7,\"health\":1000,\"modDoorSpeaker\":-1,\"doors\":[false,false,false,false,false,false],\"modVanityPlate\":-1,\"modFender\":-1,\"modTank\":-1,\"modTransmission\":-1,\"wheelColor\":112,\"modShifterLeavers\":-1,\"modTrunk\":-1,\"color2\":33,\"modRightFender\":-1,\"modStruts\":-1,\"modEngine\":-1,\"neonColor\":[255,0,255],\"modFrontBumper\":-1,\"modAPlate\":-1,\"modOrnaments\":-1,\"modBackWheels\":-1,\"modLivery\":-1,\"plate\":\"TTV 655\",\"engineHealth\":1000.0,\"modTrimB\":-1,\"windowTint\":-1,\"modDial\":-1,\"modXenon\":1,\"modHorns\":-1,\"dirtLevel\":1.6161570549011,\"modSmokeEnabled\":1,\"color1\":27,\"windows\":[1,false,false,false,false,1,1,1,1,false,1,1,1],\"fuelLevel\":31.229995727539,\"extras\":{\"1\":true},\"modPlateHolder\":-1,\"plateIndex\":0,\"modBrakes\":-1,\"modAirFilter\":-1,\"modAerials\":-1,\"modRearBumper\":-1,\"modHood\":-1,\"modWindows\":-1,\"bodyHealth\":970.55084228516,\"modSteeringWheel\":-1,\"modSuspension\":-1,\"modFrontWheels\":-1,\"modGrille\":-1,\"modArchCover\":-1,\"modTurbo\":false}','car','',1,0,'voiture','central');

#
# Structure for table "owned_vehicles_headlights"
#

DROP TABLE IF EXISTS `owned_vehicles_headlights`;
CREATE TABLE `owned_vehicles_headlights` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` text NOT NULL,
  `color` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

#
# Data for table "owned_vehicles_headlights"
#

INSERT INTO `owned_vehicles_headlights` VALUES (1,'89VVR378',12),(2,'CKD090',10),(3,'86CCF302',7),(4,'DCQ229',4),(5,'83JDX824',10),(6,'68VZJ859',10),(7,'POZ259',4),(8,'43RSJ840',12);

#
# Structure for table "phone_app_chat"
#

DROP TABLE IF EXISTS `phone_app_chat`;
CREATE TABLE `phone_app_chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(20) NOT NULL,
  `message` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

#
# Data for table "phone_app_chat"
#


#
# Structure for table "phone_calls"
#

DROP TABLE IF EXISTS `phone_calls`;
CREATE TABLE `phone_calls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(10) NOT NULL COMMENT 'Num tel proprio',
  `num` varchar(10) NOT NULL COMMENT 'Num reférence du contact',
  `incoming` int(11) NOT NULL COMMENT 'Défini si on est à l''origine de l''appels',
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `accepts` int(11) NOT NULL COMMENT 'Appels accepter ou pas',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8;

#
# Data for table "phone_calls"
#

INSERT INTO `phone_calls` VALUES (122,'101-5635','911',1,'2020-08-19 23:24:47',0);

#
# Structure for table "phone_messages"
#

DROP TABLE IF EXISTS `phone_messages`;
CREATE TABLE `phone_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transmitter` varchar(10) NOT NULL,
  `receiver` varchar(10) NOT NULL,
  `message` varchar(255) NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `isRead` int(11) NOT NULL DEFAULT 0,
  `owner` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=107 DEFAULT CHARSET=utf8;

#
# Data for table "phone_messages"
#

/*!40000 ALTER TABLE `phone_messages` DISABLE KEYS */;
INSERT INTO `phone_messages` VALUES (106,'ambulance','101-5635','De #101-5635 : Interventtion requise: citoyen inconscient! -67.936218261719, 6322.421875','2020-06-07 15:34:16',1,0);
/*!40000 ALTER TABLE `phone_messages` ENABLE KEYS */;

#
# Structure for table "phone_users_contacts"
#

DROP TABLE IF EXISTS `phone_users_contacts`;
CREATE TABLE `phone_users_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) CHARACTER SET utf8mb4 DEFAULT NULL,
  `number` varchar(10) CHARACTER SET utf8mb4 DEFAULT NULL,
  `display` varchar(64) CHARACTER SET utf8mb4 NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

#
# Data for table "phone_users_contacts"
#


#
# Structure for table "properties"
#

DROP TABLE IF EXISTS `properties`;
CREATE TABLE `properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `label` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `entering` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `exit` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `inside` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `outside` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `ipls` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT '[]',
  `gateway` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `is_single` int(11) DEFAULT NULL,
  `is_room` int(11) DEFAULT NULL,
  `is_gateway` int(11) DEFAULT NULL,
  `room_menu` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

#
# Data for table "properties"
#

INSERT INTO `properties` VALUES (1,'WhispymoundDrive','2677 Whispymound Drive','{\"y\":564.89,\"z\":182.959,\"x\":119.384}','{\"x\":117.347,\"y\":559.506,\"z\":183.304}','{\"y\":557.032,\"z\":183.301,\"x\":118.037}','{\"y\":567.798,\"z\":182.131,\"x\":119.249}','[]',NULL,1,1,0,'{\"x\":118.748,\"y\":566.573,\"z\":175.697}',1500000),(2,'NorthConkerAvenue2045','2045 North Conker Avenue','{\"x\":372.796,\"y\":428.327,\"z\":144.685}','{\"x\":373.548,\"y\":422.982,\"z\":144.907},','{\"y\":420.075,\"z\":145.904,\"x\":372.161}','{\"x\":372.454,\"y\":432.886,\"z\":143.443}','[]',NULL,1,1,0,'{\"x\":377.349,\"y\":429.422,\"z\":137.3}',1500000),(3,'RichardMajesticApt2','Richard Majestic, Apt 2','{\"y\":-379.165,\"z\":37.961,\"x\":-936.363}','{\"y\":-365.476,\"z\":113.274,\"x\":-913.097}','{\"y\":-367.637,\"z\":113.274,\"x\":-918.022}','{\"y\":-382.023,\"z\":37.961,\"x\":-943.626}','[]',NULL,1,1,0,'{\"x\":-927.554,\"y\":-377.744,\"z\":112.674}',1700000),(4,'NorthConkerAvenue2044','2044 North Conker Avenue','{\"y\":440.8,\"z\":146.702,\"x\":346.964}','{\"y\":437.456,\"z\":148.394,\"x\":341.683}','{\"y\":435.626,\"z\":148.394,\"x\":339.595}','{\"x\":350.535,\"y\":443.329,\"z\":145.764}','[]',NULL,1,1,0,'{\"x\":337.726,\"y\":436.985,\"z\":140.77}',1500000),(5,'WildOatsDrive','3655 Wild Oats Drive','{\"y\":502.696,\"z\":136.421,\"x\":-176.003}','{\"y\":497.817,\"z\":136.653,\"x\":-174.349}','{\"y\":495.069,\"z\":136.666,\"x\":-173.331}','{\"y\":506.412,\"z\":135.0664,\"x\":-177.927}','[]',NULL,1,1,0,'{\"x\":-174.725,\"y\":493.095,\"z\":129.043}',1500000),(6,'HillcrestAvenue2862','2862 Hillcrest Avenue','{\"y\":596.58,\"z\":142.641,\"x\":-686.554}','{\"y\":591.988,\"z\":144.392,\"x\":-681.728}','{\"y\":590.608,\"z\":144.392,\"x\":-680.124}','{\"y\":599.019,\"z\":142.059,\"x\":-689.492}','[]',NULL,1,1,0,'{\"x\":-680.46,\"y\":588.6,\"z\":136.769}',1500000),(7,'LowEndApartment','Appartement de base','{\"y\":-1078.735,\"z\":28.4031,\"x\":292.528}','{\"y\":-1007.152,\"z\":-102.002,\"x\":265.845}','{\"y\":-1002.802,\"z\":-100.008,\"x\":265.307}','{\"y\":-1078.669,\"z\":28.401,\"x\":296.738}','[]',NULL,1,1,0,'{\"x\":265.916,\"y\":-999.38,\"z\":-100.008}',562500),(8,'MadWayneThunder','2113 Mad Wayne Thunder','{\"y\":454.955,\"z\":96.462,\"x\":-1294.433}','{\"x\":-1289.917,\"y\":449.541,\"z\":96.902}','{\"y\":446.322,\"z\":96.899,\"x\":-1289.642}','{\"y\":455.453,\"z\":96.517,\"x\":-1298.851}','[]',NULL,1,1,0,'{\"x\":-1287.306,\"y\":455.901,\"z\":89.294}',1500000),(9,'HillcrestAvenue2874','2874 Hillcrest Avenue','{\"x\":-853.346,\"y\":696.678,\"z\":147.782}','{\"y\":690.875,\"z\":151.86,\"x\":-859.961}','{\"y\":688.361,\"z\":151.857,\"x\":-859.395}','{\"y\":701.628,\"z\":147.773,\"x\":-855.007}','[]',NULL,1,1,0,'{\"x\":-858.543,\"y\":697.514,\"z\":144.253}',1500000),(10,'HillcrestAvenue2868','2868 Hillcrest Avenue','{\"y\":620.494,\"z\":141.588,\"x\":-752.82}','{\"y\":618.62,\"z\":143.153,\"x\":-759.317}','{\"y\":617.629,\"z\":143.153,\"x\":-760.789}','{\"y\":621.281,\"z\":141.254,\"x\":-750.919}','[]',NULL,1,1,0,'{\"x\":-762.504,\"y\":618.992,\"z\":135.53}',1500000),(11,'TinselTowersApt12','Tinsel Towers, Apt 42','{\"y\":37.025,\"z\":42.58,\"x\":-618.299}','{\"y\":58.898,\"z\":97.2,\"x\":-603.301}','{\"y\":58.941,\"z\":97.2,\"x\":-608.741}','{\"y\":30.603,\"z\":42.524,\"x\":-620.017}','[]',NULL,1,1,0,'{\"x\":-622.173,\"y\":54.585,\"z\":96.599}',1700000),(12,'MiltonDrive','Milton Drive','{\"x\":-775.17,\"y\":312.01,\"z\":84.658}',NULL,NULL,'{\"x\":-775.346,\"y\":306.776,\"z\":84.7}','[]',NULL,0,0,1,NULL,0),(13,'Modern1Apartment','Appartement Moderne 1',NULL,'{\"x\":-784.194,\"y\":323.636,\"z\":210.997}','{\"x\":-779.751,\"y\":323.385,\"z\":210.997}',NULL,'[\"apa_v_mp_h_01_a\"]','MiltonDrive',0,1,0,'{\"x\":-766.661,\"y\":327.672,\"z\":210.396}',1300000),(14,'Modern2Apartment','Appartement Moderne 2',NULL,'{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}','{\"x\":-781.808,\"y\":315.866,\"z\":186.913}',NULL,'[\"apa_v_mp_h_01_c\"]','MiltonDrive',0,1,0,'{\"x\":-795.735,\"y\":326.757,\"z\":186.313}',1300000),(15,'Modern3Apartment','Appartement Moderne 3',NULL,'{\"x\":-774.012,\"y\":342.042,\"z\":195.686}','{\"x\":-779.057,\"y\":342.063,\"z\":195.686}',NULL,'[\"apa_v_mp_h_01_b\"]','MiltonDrive',0,1,0,'{\"x\":-765.386,\"y\":330.782,\"z\":195.08}',1300000),(16,'Mody1Apartment','Appartement Mode 1',NULL,'{\"x\":-784.194,\"y\":323.636,\"z\":210.997}','{\"x\":-779.751,\"y\":323.385,\"z\":210.997}',NULL,'[\"apa_v_mp_h_02_a\"]','MiltonDrive',0,1,0,'{\"x\":-766.615,\"y\":327.878,\"z\":210.396}',1300000),(17,'Mody2Apartment','Appartement Mode 2',NULL,'{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}','{\"x\":-781.808,\"y\":315.866,\"z\":186.913}',NULL,'[\"apa_v_mp_h_02_c\"]','MiltonDrive',0,1,0,'{\"x\":-795.297,\"y\":327.092,\"z\":186.313}',1300000),(18,'Mody3Apartment','Appartement Mode 3',NULL,'{\"x\":-774.012,\"y\":342.042,\"z\":195.686}','{\"x\":-779.057,\"y\":342.063,\"z\":195.686}',NULL,'[\"apa_v_mp_h_02_b\"]','MiltonDrive',0,1,0,'{\"x\":-765.303,\"y\":330.932,\"z\":195.085}',1300000),(19,'Vibrant1Apartment','Appartement Vibrant 1',NULL,'{\"x\":-784.194,\"y\":323.636,\"z\":210.997}','{\"x\":-779.751,\"y\":323.385,\"z\":210.997}',NULL,'[\"apa_v_mp_h_03_a\"]','MiltonDrive',0,1,0,'{\"x\":-765.885,\"y\":327.641,\"z\":210.396}',1300000),(20,'Vibrant2Apartment','Appartement Vibrant 2',NULL,'{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}','{\"x\":-781.808,\"y\":315.866,\"z\":186.913}',NULL,'[\"apa_v_mp_h_03_c\"]','MiltonDrive',0,1,0,'{\"x\":-795.607,\"y\":327.344,\"z\":186.313}',1300000),(21,'Vibrant3Apartment','Appartement Vibrant 3',NULL,'{\"x\":-774.012,\"y\":342.042,\"z\":195.686}','{\"x\":-779.057,\"y\":342.063,\"z\":195.686}',NULL,'[\"apa_v_mp_h_03_b\"]','MiltonDrive',0,1,0,'{\"x\":-765.525,\"y\":330.851,\"z\":195.085}',1300000),(22,'Sharp1Apartment','Appartement Persan 1',NULL,'{\"x\":-784.194,\"y\":323.636,\"z\":210.997}','{\"x\":-779.751,\"y\":323.385,\"z\":210.997}',NULL,'[\"apa_v_mp_h_04_a\"]','MiltonDrive',0,1,0,'{\"x\":-766.527,\"y\":327.89,\"z\":210.396}',1300000),(23,'Sharp2Apartment','Appartement Persan 2',NULL,'{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}','{\"x\":-781.808,\"y\":315.866,\"z\":186.913}',NULL,'[\"apa_v_mp_h_04_c\"]','MiltonDrive',0,1,0,'{\"x\":-795.642,\"y\":326.497,\"z\":186.313}',1300000),(24,'Sharp3Apartment','Appartement Persan 3',NULL,'{\"x\":-774.012,\"y\":342.042,\"z\":195.686}','{\"x\":-779.057,\"y\":342.063,\"z\":195.686}',NULL,'[\"apa_v_mp_h_04_b\"]','MiltonDrive',0,1,0,'{\"x\":-765.503,\"y\":331.318,\"z\":195.085}',1300000),(25,'Monochrome1Apartment','Appartement Monochrome 1',NULL,'{\"x\":-784.194,\"y\":323.636,\"z\":210.997}','{\"x\":-779.751,\"y\":323.385,\"z\":210.997}',NULL,'[\"apa_v_mp_h_05_a\"]','MiltonDrive',0,1,0,'{\"x\":-766.289,\"y\":328.086,\"z\":210.396}',1300000),(26,'Monochrome2Apartment','Appartement Monochrome 2',NULL,'{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}','{\"x\":-781.808,\"y\":315.866,\"z\":186.913}',NULL,'[\"apa_v_mp_h_05_c\"]','MiltonDrive',0,1,0,'{\"x\":-795.692,\"y\":326.762,\"z\":186.313}',1300000),(27,'Monochrome3Apartment','Appartement Monochrome 3',NULL,'{\"x\":-774.012,\"y\":342.042,\"z\":195.686}','{\"x\":-779.057,\"y\":342.063,\"z\":195.686}',NULL,'[\"apa_v_mp_h_05_b\"]','MiltonDrive',0,1,0,'{\"x\":-765.094,\"y\":330.976,\"z\":195.085}',1300000),(28,'Seductive1Apartment','Appartement SÃ©duisant 1',NULL,'{\"x\":-784.194,\"y\":323.636,\"z\":210.997}','{\"x\":-779.751,\"y\":323.385,\"z\":210.997}',NULL,'[\"apa_v_mp_h_06_a\"]','MiltonDrive',0,1,0,'{\"x\":-766.263,\"y\":328.104,\"z\":210.396}',1300000),(29,'Seductive2Apartment','Appartement SÃ©duisant 2',NULL,'{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}','{\"x\":-781.808,\"y\":315.866,\"z\":186.913}',NULL,'[\"apa_v_mp_h_06_c\"]','MiltonDrive',0,1,0,'{\"x\":-795.655,\"y\":326.611,\"z\":186.313}',1300000),(30,'Seductive3Apartment','Appartement SÃ©duisant 3',NULL,'{\"x\":-774.012,\"y\":342.042,\"z\":195.686}','{\"x\":-779.057,\"y\":342.063,\"z\":195.686}',NULL,'[\"apa_v_mp_h_06_b\"]','MiltonDrive',0,1,0,'{\"x\":-765.3,\"y\":331.414,\"z\":195.085}',1300000),(31,'Regal1Apartment','Appartement RÃ©gal 1',NULL,'{\"x\":-784.194,\"y\":323.636,\"z\":210.997}','{\"x\":-779.751,\"y\":323.385,\"z\":210.997}',NULL,'[\"apa_v_mp_h_07_a\"]','MiltonDrive',0,1,0,'{\"x\":-765.956,\"y\":328.257,\"z\":210.396}',1300000),(32,'Regal2Apartment','Appartement RÃ©gal 2',NULL,'{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}','{\"x\":-781.808,\"y\":315.866,\"z\":186.913}',NULL,'[\"apa_v_mp_h_07_c\"]','MiltonDrive',0,1,0,'{\"x\":-795.545,\"y\":326.659,\"z\":186.313}',1300000),(33,'Regal3Apartment','Appartement RÃ©gal 3',NULL,'{\"x\":-774.012,\"y\":342.042,\"z\":195.686}','{\"x\":-779.057,\"y\":342.063,\"z\":195.686}',NULL,'[\"apa_v_mp_h_07_b\"]','MiltonDrive',0,1,0,'{\"x\":-765.087,\"y\":331.429,\"z\":195.123}',1300000),(34,'Aqua1Apartment','Appartement Aqua 1',NULL,'{\"x\":-784.194,\"y\":323.636,\"z\":210.997}','{\"x\":-779.751,\"y\":323.385,\"z\":210.997}',NULL,'[\"apa_v_mp_h_08_a\"]','MiltonDrive',0,1,0,'{\"x\":-766.187,\"y\":328.47,\"z\":210.396}',1300000),(35,'Aqua2Apartment','Appartement Aqua 2',NULL,'{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}','{\"x\":-781.808,\"y\":315.866,\"z\":186.913}',NULL,'[\"apa_v_mp_h_08_c\"]','MiltonDrive',0,1,0,'{\"x\":-795.658,\"y\":326.563,\"z\":186.313}',1300000),(36,'Aqua3Apartment','Appartement Aqua 3',NULL,'{\"x\":-774.012,\"y\":342.042,\"z\":195.686}','{\"x\":-779.057,\"y\":342.063,\"z\":195.686}',NULL,'[\"apa_v_mp_h_08_b\"]','MiltonDrive',0,1,0,'{\"x\":-765.287,\"y\":331.084,\"z\":195.086}',1300000),(37,'IntegrityWay','4 Integrity Way','{\"x\":-47.804,\"y\":-585.867,\"z\":36.956}',NULL,NULL,'{\"x\":-54.178,\"y\":-583.762,\"z\":35.798}','[]',NULL,0,0,1,NULL,0),(38,'IntegrityWay28','4 Integrity Way - Apt 28',NULL,'{\"x\":-31.409,\"y\":-594.927,\"z\":79.03}','{\"x\":-26.098,\"y\":-596.909,\"z\":79.03}',NULL,'[]','IntegrityWay',0,1,0,'{\"x\":-11.923,\"y\":-597.083,\"z\":78.43}',1700000),(39,'IntegrityWay30','4 Integrity Way - Apt 30',NULL,'{\"x\":-17.702,\"y\":-588.524,\"z\":89.114}','{\"x\":-16.21,\"y\":-582.569,\"z\":89.114}',NULL,'[]','IntegrityWay',0,1,0,'{\"x\":-26.327,\"y\":-588.384,\"z\":89.123}',1700000),(40,'DellPerroHeights','Dell Perro Heights','{\"x\":-1447.06,\"y\":-538.28,\"z\":33.74}',NULL,NULL,'{\"x\":-1440.022,\"y\":-548.696,\"z\":33.74}','[]',NULL,0,0,1,NULL,0),(41,'DellPerroHeightst4','Dell Perro Heights - Apt 28',NULL,'{\"x\":-1452.125,\"y\":-540.591,\"z\":73.044}','{\"x\":-1455.435,\"y\":-535.79,\"z\":73.044}',NULL,'[]','DellPerroHeights',0,1,0,'{\"x\":-1467.058,\"y\":-527.571,\"z\":72.443}',1700000),(42,'DellPerroHeightst7','Dell Perro Heights - Apt 30',NULL,'{\"x\":-1451.562,\"y\":-523.535,\"z\":55.928}','{\"x\":-1456.02,\"y\":-519.209,\"z\":55.929}',NULL,'[]','DellPerroHeights',0,1,0,'{\"x\":-1457.026,\"y\":-530.219,\"z\":55.937}',1700000);

#
# Structure for table "rented_vehicles"
#

DROP TABLE IF EXISTS `rented_vehicles`;
CREATE TABLE `rented_vehicles` (
  `vehicle` varchar(60) COLLATE utf8mb4_spanish_ci NOT NULL,
  `plate` varchar(12) COLLATE utf8mb4_spanish_ci NOT NULL,
  `player_name` varchar(255) COLLATE utf8mb4_spanish_ci NOT NULL,
  `base_price` int(11) NOT NULL,
  `rent_price` int(11) NOT NULL,
  `owner` varchar(22) COLLATE utf8mb4_spanish_ci NOT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

#
# Data for table "rented_vehicles"
#


#
# Structure for table "shops"
#

DROP TABLE IF EXISTS `shops`;
CREATE TABLE `shops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `item` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

#
# Data for table "shops"
#

INSERT INTO `shops` VALUES (1,'TwentyFourSeven','bread',30),(2,'TwentyFourSeven','water',15),(3,'RobsLiquor','bread',30),(4,'RobsLiquor','water',15),(5,'LTDgasoline','bread',30),(6,'LTDgasoline','water',15),(7,'TwentyFourSeven','bread',30),(8,'TwentyFourSeven','water',15),(9,'RobsLiquor','bread',30),(10,'RobsLiquor','water',15),(11,'LTDgasoline','bread',30),(12,'LTDgasoline','water',15),(13,'TwentyFourSeven','bread',30),(14,'TwentyFourSeven','water',15),(15,'RobsLiquor','bread',30),(16,'RobsLiquor','water',15),(17,'LTDgasoline','bread',30),(18,'LTDgasoline','water',15);

#
# Structure for table "society_moneywash"
#

DROP TABLE IF EXISTS `society_moneywash`;
CREATE TABLE `society_moneywash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) COLLATE utf8mb4_spanish_ci NOT NULL,
  `society` varchar(60) COLLATE utf8mb4_spanish_ci NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

#
# Data for table "society_moneywash"
#


#
# Structure for table "t1ger_druglabs"
#

DROP TABLE IF EXISTS `t1ger_druglabs`;
CREATE TABLE `t1ger_druglabs` (
  `identifier` varchar(100) CHARACTER SET latin1 NOT NULL,
  `labID` int(11) NOT NULL,
  `supplies` int(11) NOT NULL DEFAULT 0,
  `stock` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`labID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

#
# Data for table "t1ger_druglabs"
#

INSERT INTO `t1ger_druglabs` VALUES ('steam:110000117a1e4c9',2,0,0);

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


#
# Structure for table "truck_inventory"
#

DROP TABLE IF EXISTS `truck_inventory`;
CREATE TABLE `truck_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item` varchar(100) NOT NULL,
  `count` int(11) NOT NULL,
  `plate` varchar(8) NOT NULL,
  `name` varchar(255) NOT NULL,
  `itemt` varchar(50) DEFAULT NULL,
  `owned` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `item` (`item`,`plate`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

#
# Data for table "truck_inventory"
#


#
# Structure for table "user_accounts"
#

DROP TABLE IF EXISTS `user_accounts`;
CREATE TABLE `user_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(22) COLLATE utf8mb4_spanish_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL,
  `money` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

#
# Data for table "user_accounts"
#

INSERT INTO `user_accounts` VALUES (1,'steam:110000117a1e4c9','black_money',1000000),(2,'steam:110000142794b5a','black_money',0),(3,'steam:1100001172b03f4','black_money',0),(4,'steam:1100001154bcf8d','black_money',100000000),(5,'steam:110000118cf839d','black_money',1000000000),(6,'steam:1100001026d69a0','black_money',0),(7,'steam:11000010c0588f0','black_money',0),(8,'steam:11000010edbfb5d','black_money',0),(9,'steam:110000116b2f1a5','black_money',0),(10,'steam:110000112c384fc','black_money',0),(11,'steam:110000142afbcd6','black_money',0);

#
# Structure for table "user_convictions"
#

DROP TABLE IF EXISTS `user_convictions`;
CREATE TABLE `user_convictions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `char_id` int(11) DEFAULT NULL,
  `offense` varchar(255) COLLATE utf32_spanish2_ci DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

#
# Data for table "user_convictions"
#


#
# Structure for table "user_inventory"
#

DROP TABLE IF EXISTS `user_inventory`;
CREATE TABLE `user_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(22) COLLATE utf8mb4_spanish_ci NOT NULL,
  `item` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=773 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

#
# Data for table "user_inventory"
#

INSERT INTO `user_inventory` VALUES (1,'steam:1100001132b99e9','wool',0),(2,'steam:1100001132b99e9','water',0),(3,'steam:1100001132b99e9','wood',0),(4,'steam:1100001132b99e9','cutted_wood',0),(5,'steam:1100001132b99e9','washed_stone',0),(6,'steam:1100001132b99e9','essence',0),(7,'steam:1100001132b99e9','stone',0),(8,'steam:1100001132b99e9','petrol_raffin',0),(9,'steam:1100001132b99e9','clothe',0),(10,'steam:1100001132b99e9','carotool',0),(11,'steam:1100001132b99e9','copper',0),(12,'steam:1100001132b99e9','packaged_chicken',0),(13,'steam:1100001132b99e9','petrol',0),(14,'steam:1100001132b99e9','cannabis',0),(15,'steam:1100001132b99e9','packaged_plank',0),(16,'steam:1100001132b99e9','bread',0),(17,'steam:1100001132b99e9','medikit',0),(18,'steam:1100001132b99e9','fabric',0),(19,'steam:1100001132b99e9','marijuana',0),(20,'steam:1100001132b99e9','blowpipe',0),(21,'steam:1100001132b99e9','bandage',0),(22,'steam:1100001132b99e9','gazbottle',0),(23,'steam:1100001132b99e9','iron',0),(24,'steam:1100001132b99e9','gold',0),(25,'steam:1100001132b99e9','jewels',0),(26,'steam:1100001132b99e9','fixtool',0),(27,'steam:1100001132b99e9','slaughtered_chicken',0),(28,'steam:1100001132b99e9','diamond',0),(29,'steam:1100001132b99e9','alive_chicken',0),(30,'steam:1100001132b99e9','fixkit',0),(31,'steam:1100001132b99e9','fish',0),(32,'steam:1100001132b99e9','carokit',0),(33,'steam:1100001323d8cbb','wool',0),(34,'steam:1100001323d8cbb','wood',0),(35,'steam:1100001323d8cbb','cutted_wood',0),(36,'steam:1100001323d8cbb','water',0),(37,'steam:1100001323d8cbb','washed_stone',0),(38,'steam:1100001323d8cbb','essence',0),(39,'steam:1100001323d8cbb','stone',0),(40,'steam:1100001323d8cbb','petrol_raffin',0),(41,'steam:1100001323d8cbb','carotool',0),(42,'steam:1100001323d8cbb','clothe',0),(43,'steam:1100001323d8cbb','copper',0),(44,'steam:1100001323d8cbb','packaged_chicken',0),(45,'steam:1100001323d8cbb','petrol',0),(46,'steam:1100001323d8cbb','cannabis',0),(47,'steam:1100001323d8cbb','packaged_plank',0),(48,'steam:1100001323d8cbb','bread',0),(49,'steam:1100001323d8cbb','medikit',0),(50,'steam:1100001323d8cbb','fabric',0),(51,'steam:1100001323d8cbb','marijuana',0),(52,'steam:1100001323d8cbb','blowpipe',0),(53,'steam:1100001323d8cbb','bandage',0),(54,'steam:1100001323d8cbb','gazbottle',0),(55,'steam:1100001323d8cbb','iron',0),(56,'steam:1100001323d8cbb','gold',0),(57,'steam:1100001323d8cbb','jewels',0),(58,'steam:1100001323d8cbb','diamond',0),(59,'steam:1100001323d8cbb','fixtool',0),(60,'steam:1100001323d8cbb','slaughtered_chicken',0),(61,'steam:1100001323d8cbb','alive_chicken',0),(62,'steam:1100001323d8cbb','fixkit',0),(63,'steam:1100001323d8cbb','fish',0),(64,'steam:1100001323d8cbb','carokit',0),(65,'steam:110000117a1e4c9','bread',1083),(66,'steam:110000117a1e4c9','slaughtered_chicken',0),(67,'steam:110000117a1e4c9','wool',0),(68,'steam:110000117a1e4c9','jewels',0),(69,'steam:110000117a1e4c9','washed_stone',0),(70,'steam:110000117a1e4c9','fixkit',0),(71,'steam:110000117a1e4c9','cannabis',-4),(72,'steam:110000117a1e4c9','water',0),(73,'steam:110000117a1e4c9','stone',0),(74,'steam:110000117a1e4c9','alive_chicken',0),(75,'steam:110000117a1e4c9','gazbottle',0),(76,'steam:110000117a1e4c9','wood',0),(77,'steam:110000117a1e4c9','blowpipe',0),(78,'steam:110000117a1e4c9','bandage',0),(79,'steam:110000117a1e4c9','fixtool',0),(80,'steam:110000117a1e4c9','medikit',13),(81,'steam:110000117a1e4c9','petrol',0),(82,'steam:110000117a1e4c9','fish',990),(83,'steam:110000117a1e4c9','diamond',0),(84,'steam:110000117a1e4c9','marijuana',0),(85,'steam:110000117a1e4c9','packaged_chicken',0),(86,'steam:110000117a1e4c9','carokit',0),(87,'steam:110000117a1e4c9','clothe',0),(88,'steam:110000117a1e4c9','copper',0),(89,'steam:110000117a1e4c9','iron',0),(90,'steam:110000117a1e4c9','essence',0),(91,'steam:110000117a1e4c9','gold',197),(92,'steam:110000117a1e4c9','fabric',0),(93,'steam:110000117a1e4c9','petrol_raffin',0),(94,'steam:110000117a1e4c9','carotool',0),(95,'steam:110000117a1e4c9','cutted_wood',0),(96,'steam:110000117a1e4c9','packaged_plank',0),(97,'steam:110000117a1e4c9','chaleco',190),(98,'steam:110000117a1e4c9','rueda',96),(99,'steam:110000117a1e4c9','grip',0),(100,'steam:110000117a1e4c9','yusuf',0),(101,'steam:110000117a1e4c9','silencieux',1),(102,'steam:110000117a1e4c9','flashlight',0),(103,'steam:110000117a1e4c9','cheesebows',3),(104,'steam:110000117a1e4c9','lotteryticket',0),(105,'steam:110000117a1e4c9','macka',0),(106,'steam:110000117a1e4c9','burger',0),(107,'steam:110000117a1e4c9','pizza',4),(108,'steam:110000117a1e4c9','cocacola',5),(109,'steam:110000117a1e4c9','chips',0),(110,'steam:110000117a1e4c9','loka',0),(111,'steam:110000117a1e4c9','sprite',0),(112,'steam:110000117a1e4c9','cigarett',12),(113,'steam:110000117a1e4c9','lighter',0),(114,'steam:110000117a1e4c9','pastacarbonara',0),(115,'steam:110000117a1e4c9','marabou',0),(116,'steam:110000117a1e4c9','fanta',0),(117,'steam:110000117a1e4c9','vip_coin',2993),(118,'steam:110000117a1e4c9','pastel',0),(119,'steam:110000117a1e4c9','altavoz',92),(120,'steam:110000142794b5a','gold',0),(121,'steam:110000142794b5a','fanta',0),(122,'steam:110000142794b5a','copper',0),(123,'steam:110000142794b5a','lotteryticket',0),(124,'steam:110000142794b5a','macka',0),(125,'steam:110000142794b5a','cutted_wood',0),(126,'steam:110000142794b5a','chips',0),(127,'steam:110000142794b5a','flashlight',0),(128,'steam:110000142794b5a','petrol',0),(129,'steam:110000142794b5a','burger',0),(130,'steam:110000142794b5a','fabric',0),(131,'steam:110000142794b5a','bandage',0),(132,'steam:110000142794b5a','altavoz',0),(133,'steam:110000142794b5a','wool',0),(134,'steam:110000142794b5a','iron',0),(135,'steam:110000142794b5a','water',0),(136,'steam:110000142794b5a','loka',0),(137,'steam:110000142794b5a','medikit',0),(138,'steam:110000142794b5a','cheesebows',0),(139,'steam:110000142794b5a','fixkit',0),(140,'steam:110000142794b5a','wood',0),(141,'steam:110000142794b5a','marabou',0),(142,'steam:110000142794b5a','vip_coin',0),(143,'steam:110000142794b5a','sprite',0),(144,'steam:110000142794b5a','clothe',0),(145,'steam:110000142794b5a','cigarett',0),(146,'steam:110000142794b5a','chaleco',0),(147,'steam:110000142794b5a','rueda',0),(148,'steam:110000142794b5a','fish',0),(149,'steam:110000142794b5a','slaughtered_chicken',0),(150,'steam:110000142794b5a','cocacola',0),(151,'steam:110000142794b5a','silencieux',0),(152,'steam:110000142794b5a','pizza',0),(153,'steam:110000142794b5a','pastel',0),(154,'steam:110000142794b5a','petrol_raffin',0),(155,'steam:110000142794b5a','pastacarbonara',0),(156,'steam:110000142794b5a','blowpipe',0),(157,'steam:110000142794b5a','packaged_plank',0),(158,'steam:110000142794b5a','yusuf',0),(159,'steam:110000142794b5a','stone',0),(160,'steam:110000142794b5a','bread',0),(161,'steam:110000142794b5a','marijuana',0),(162,'steam:110000142794b5a','washed_stone',0),(163,'steam:110000142794b5a','fixtool',0),(164,'steam:110000142794b5a','gazbottle',0),(165,'steam:110000142794b5a','packaged_chicken',0),(166,'steam:110000142794b5a','jewels',0),(167,'steam:110000142794b5a','essence',0),(168,'steam:110000142794b5a','carotool',0),(169,'steam:110000142794b5a','carokit',0),(170,'steam:110000142794b5a','grip',0),(171,'steam:110000142794b5a','alive_chicken',0),(172,'steam:110000142794b5a','lighter',0),(173,'steam:110000142794b5a','diamond',0),(174,'steam:110000142794b5a','cannabis',0),(175,'steam:110000117a1e4c9','petardo',0),(176,'steam:110000117a1e4c9','skate',2),(177,'steam:110000117a1e4c9','zarowki',122),(178,'steam:110000117a1e4c9','cargador',0),(179,'steam:1100001172b03f4','fixkit',0),(180,'steam:1100001172b03f4','chips',0),(181,'steam:1100001172b03f4','blowpipe',0),(182,'steam:1100001172b03f4','iron',0),(183,'steam:1100001172b03f4','alive_chicken',0),(184,'steam:1100001172b03f4','cheesebows',0),(185,'steam:1100001172b03f4','bandage',0),(186,'steam:1100001172b03f4','carokit',0),(187,'steam:1100001172b03f4','burger',0),(188,'steam:1100001172b03f4','zarowki',109),(189,'steam:1100001172b03f4','packaged_plank',0),(190,'steam:1100001172b03f4','wood',0),(191,'steam:1100001172b03f4','grip',0),(192,'steam:1100001172b03f4','essence',0),(193,'steam:1100001172b03f4','wool',0),(194,'steam:1100001172b03f4','chaleco',0),(195,'steam:1100001172b03f4','macka',0),(196,'steam:1100001172b03f4','cocacola',0),(197,'steam:1100001172b03f4','water',0),(198,'steam:1100001172b03f4','washed_stone',0),(199,'steam:1100001172b03f4','bread',0),(200,'steam:1100001172b03f4','vip_coin',0),(201,'steam:1100001172b03f4','stone',0),(202,'steam:1100001172b03f4','sprite',0),(203,'steam:1100001172b03f4','rueda',995),(204,'steam:1100001172b03f4','slaughtered_chicken',0),(205,'steam:1100001172b03f4','fish',0),(206,'steam:1100001172b03f4','silencieux',0),(207,'steam:1100001172b03f4','cutted_wood',0),(208,'steam:1100001172b03f4','cannabis',0),(209,'steam:1100001172b03f4','skate',0),(210,'steam:1100001172b03f4','pizza',0),(211,'steam:1100001172b03f4','fabric',0),(212,'steam:1100001172b03f4','fanta',0),(213,'steam:1100001172b03f4','medikit',0),(214,'steam:1100001172b03f4','fixtool',0),(215,'steam:1100001172b03f4','pastel',0),(216,'steam:1100001172b03f4','jewels',0),(217,'steam:1100001172b03f4','petardo',0),(218,'steam:1100001172b03f4','packaged_chicken',0),(219,'steam:1100001172b03f4','cargador',0),(220,'steam:1100001172b03f4','gold',0),(221,'steam:1100001172b03f4','pastacarbonara',0),(222,'steam:1100001172b03f4','yusuf',0),(223,'steam:1100001172b03f4','altavoz',0),(224,'steam:1100001172b03f4','lighter',0),(225,'steam:1100001172b03f4','petrol_raffin',0),(226,'steam:1100001172b03f4','petrol',0),(227,'steam:1100001172b03f4','lotteryticket',0),(228,'steam:1100001172b03f4','carotool',0),(229,'steam:1100001172b03f4','gazbottle',0),(230,'steam:1100001172b03f4','clothe',0),(231,'steam:1100001172b03f4','copper',0),(232,'steam:1100001172b03f4','flashlight',0),(233,'steam:1100001172b03f4','loka',0),(234,'steam:1100001172b03f4','marijuana',0),(235,'steam:1100001172b03f4','diamond',0),(236,'steam:1100001172b03f4','cigarett',0),(237,'steam:1100001172b03f4','marabou',0),(238,'steam:1100001154bcf8d','bread',0),(239,'steam:1100001154bcf8d','rueda',10),(240,'steam:1100001154bcf8d','cannabis',0),(241,'steam:1100001154bcf8d','fish',0),(242,'steam:1100001154bcf8d','cigarett',0),(243,'steam:1100001154bcf8d','pastel',0),(244,'steam:1100001154bcf8d','marabou',0),(245,'steam:1100001154bcf8d','bandage',0),(246,'steam:1100001154bcf8d','diamond',0),(247,'steam:1100001154bcf8d','zarowki',0),(248,'steam:1100001154bcf8d','vip_coin',0),(249,'steam:1100001154bcf8d','fabric',0),(250,'steam:1100001154bcf8d','copper',0),(251,'steam:1100001154bcf8d','wool',0),(252,'steam:1100001154bcf8d','yusuf',0),(253,'steam:1100001154bcf8d','burger',0),(254,'steam:1100001154bcf8d','cocacola',0),(255,'steam:1100001154bcf8d','water',0),(256,'steam:1100001154bcf8d','slaughtered_chicken',0),(257,'steam:1100001154bcf8d','stone',0),(258,'steam:1100001154bcf8d','carokit',0),(259,'steam:1100001154bcf8d','alive_chicken',0),(260,'steam:1100001154bcf8d','blowpipe',0),(261,'steam:1100001154bcf8d','packaged_plank',0),(262,'steam:1100001154bcf8d','lighter',0),(263,'steam:1100001154bcf8d','packaged_chicken',0),(264,'steam:1100001154bcf8d','cheesebows',0),(265,'steam:1100001154bcf8d','washed_stone',0),(266,'steam:1100001154bcf8d','macka',0),(267,'steam:1100001154bcf8d','silencieux',0),(268,'steam:1100001154bcf8d','pizza',0),(269,'steam:1100001154bcf8d','petrol_raffin',0),(270,'steam:1100001154bcf8d','petrol',0),(271,'steam:1100001154bcf8d','carotool',0),(272,'steam:1100001154bcf8d','flashlight',0),(273,'steam:1100001154bcf8d','clothe',0),(274,'steam:1100001154bcf8d','fixkit',0),(275,'steam:1100001154bcf8d','grip',0),(276,'steam:1100001154bcf8d','cutted_wood',0),(277,'steam:1100001154bcf8d','pastacarbonara',0),(278,'steam:1100001154bcf8d','essence',0),(279,'steam:1100001154bcf8d','fixtool',0),(280,'steam:1100001154bcf8d','sprite',0),(281,'steam:1100001154bcf8d','chips',0),(282,'steam:1100001154bcf8d','marijuana',0),(283,'steam:1100001154bcf8d','gold',0),(284,'steam:1100001154bcf8d','jewels',0),(285,'steam:1100001154bcf8d','lotteryticket',0),(286,'steam:1100001154bcf8d','altavoz',0),(287,'steam:1100001154bcf8d','skate',0),(288,'steam:1100001154bcf8d','fanta',0),(289,'steam:1100001154bcf8d','wood',0),(290,'steam:1100001154bcf8d','chaleco',0),(291,'steam:1100001154bcf8d','iron',0),(292,'steam:1100001154bcf8d','petardo',0),(293,'steam:1100001154bcf8d','cargador',0),(294,'steam:1100001154bcf8d','loka',0),(295,'steam:1100001154bcf8d','medikit',0),(296,'steam:1100001154bcf8d','gazbottle',0),(297,'steam:110000118cf839d','bread',0),(298,'steam:110000118cf839d','rueda',8),(299,'steam:110000118cf839d','cannabis',0),(300,'steam:110000118cf839d','fish',0),(301,'steam:110000118cf839d','cigarett',0),(302,'steam:110000118cf839d','pastel',0),(303,'steam:110000118cf839d','marabou',0),(304,'steam:110000118cf839d','bandage',0),(305,'steam:110000118cf839d','zarowki',0),(306,'steam:110000118cf839d','diamond',0),(307,'steam:110000118cf839d','vip_coin',0),(308,'steam:110000118cf839d','fabric',0),(309,'steam:110000118cf839d','copper',0),(310,'steam:110000118cf839d','yusuf',0),(311,'steam:110000118cf839d','wool',0),(312,'steam:110000118cf839d','burger',0),(313,'steam:110000118cf839d','cocacola',0),(314,'steam:110000118cf839d','water',0),(315,'steam:110000118cf839d','slaughtered_chicken',0),(316,'steam:110000118cf839d','stone',0),(317,'steam:110000118cf839d','carokit',0),(318,'steam:110000118cf839d','alive_chicken',0),(319,'steam:110000118cf839d','lighter',0),(320,'steam:110000118cf839d','packaged_plank',0),(321,'steam:110000118cf839d','blowpipe',0),(322,'steam:110000118cf839d','packaged_chicken',0),(323,'steam:110000118cf839d','cheesebows',0),(324,'steam:110000118cf839d','washed_stone',0),(325,'steam:110000118cf839d','macka',0),(326,'steam:110000118cf839d','silencieux',0),(327,'steam:110000118cf839d','pizza',0),(328,'steam:110000118cf839d','petrol_raffin',0),(329,'steam:110000118cf839d','petrol',0),(330,'steam:110000118cf839d','carotool',0),(331,'steam:110000118cf839d','flashlight',0),(332,'steam:110000118cf839d','clothe',0),(333,'steam:110000118cf839d','grip',0),(334,'steam:110000118cf839d','cutted_wood',0),(335,'steam:110000118cf839d','pastacarbonara',0),(336,'steam:110000118cf839d','fixkit',0),(337,'steam:110000118cf839d','sprite',0),(338,'steam:110000118cf839d','essence',0),(339,'steam:110000118cf839d','fixtool',0),(340,'steam:110000118cf839d','chips',0),(341,'steam:110000118cf839d','marijuana',0),(342,'steam:110000118cf839d','skate',0),(343,'steam:110000118cf839d','gold',0),(344,'steam:110000118cf839d','jewels',0),(345,'steam:110000118cf839d','lotteryticket',0),(346,'steam:110000118cf839d','altavoz',0),(347,'steam:110000118cf839d','petardo',0),(348,'steam:110000118cf839d','fanta',0),(349,'steam:110000118cf839d','wood',0),(350,'steam:110000118cf839d','iron',0),(351,'steam:110000118cf839d','chaleco',0),(352,'steam:110000118cf839d','cargador',0),(353,'steam:110000118cf839d','loka',0),(354,'steam:110000118cf839d','medikit',0),(355,'steam:110000118cf839d','gazbottle',0),(356,'steam:1100001026d69a0','rueda',0),(357,'steam:1100001026d69a0','cannabis',0),(358,'steam:1100001026d69a0','cigarett',0),(359,'steam:1100001026d69a0','bread',0),(360,'steam:1100001026d69a0','fish',0),(361,'steam:1100001026d69a0','pastel',0),(362,'steam:1100001026d69a0','marabou',0),(363,'steam:1100001026d69a0','zarowki',0),(364,'steam:1100001026d69a0','bandage',0),(365,'steam:1100001026d69a0','diamond',0),(366,'steam:1100001026d69a0','vip_coin',0),(367,'steam:1100001026d69a0','fabric',0),(368,'steam:1100001026d69a0','copper',0),(369,'steam:1100001026d69a0','yusuf',0),(370,'steam:1100001026d69a0','wool',0),(371,'steam:1100001026d69a0','cocacola',0),(372,'steam:1100001026d69a0','water',0),(373,'steam:1100001026d69a0','burger',0),(374,'steam:1100001026d69a0','slaughtered_chicken',0),(375,'steam:1100001026d69a0','stone',0),(376,'steam:1100001026d69a0','carokit',0),(377,'steam:1100001026d69a0','blowpipe',0),(378,'steam:1100001026d69a0','packaged_plank',0),(379,'steam:1100001026d69a0','alive_chicken',0),(380,'steam:1100001026d69a0','lighter',0),(381,'steam:1100001026d69a0','packaged_chicken',0),(382,'steam:1100001026d69a0','washed_stone',0),(383,'steam:1100001026d69a0','silencieux',0),(384,'steam:1100001026d69a0','macka',0),(385,'steam:1100001026d69a0','cheesebows',0),(386,'steam:1100001026d69a0','pizza',0),(387,'steam:1100001026d69a0','petrol_raffin',0),(388,'steam:1100001026d69a0','petrol',0),(389,'steam:1100001026d69a0','carotool',0),(390,'steam:1100001026d69a0','flashlight',0),(391,'steam:1100001026d69a0','fixkit',0),(392,'steam:1100001026d69a0','clothe',0),(393,'steam:1100001026d69a0','grip',0),(394,'steam:1100001026d69a0','cutted_wood',0),(395,'steam:1100001026d69a0','pastacarbonara',0),(396,'steam:1100001026d69a0','sprite',0),(397,'steam:1100001026d69a0','essence',0),(398,'steam:1100001026d69a0','fixtool',0),(399,'steam:1100001026d69a0','chips',0),(400,'steam:1100001026d69a0','marijuana',0),(401,'steam:1100001026d69a0','skate',0),(402,'steam:1100001026d69a0','gold',0),(403,'steam:1100001026d69a0','lotteryticket',0),(404,'steam:1100001026d69a0','altavoz',0),(405,'steam:1100001026d69a0','jewels',0),(406,'steam:1100001026d69a0','fanta',0),(407,'steam:1100001026d69a0','wood',0),(408,'steam:1100001026d69a0','iron',0),(409,'steam:1100001026d69a0','chaleco',0),(410,'steam:1100001026d69a0','petardo',0),(411,'steam:1100001026d69a0','cargador',0),(412,'steam:1100001026d69a0','loka',0),(413,'steam:1100001026d69a0','medikit',0),(414,'steam:1100001026d69a0','gazbottle',0),(415,'steam:11000010c0588f0','bread',0),(416,'steam:11000010c0588f0','rueda',0),(417,'steam:11000010c0588f0','cannabis',0),(418,'steam:11000010c0588f0','fish',0),(419,'steam:11000010c0588f0','cigarett',0),(420,'steam:11000010c0588f0','pastel',0),(421,'steam:11000010c0588f0','marabou',0),(422,'steam:11000010c0588f0','diamond',0),(423,'steam:11000010c0588f0','bandage',0),(424,'steam:11000010c0588f0','zarowki',0),(425,'steam:11000010c0588f0','fabric',0),(426,'steam:11000010c0588f0','vip_coin',0),(427,'steam:11000010c0588f0','copper',0),(428,'steam:11000010c0588f0','yusuf',0),(429,'steam:11000010c0588f0','wool',0),(430,'steam:11000010c0588f0','burger',0),(431,'steam:11000010c0588f0','cocacola',0),(432,'steam:11000010c0588f0','water',0),(433,'steam:11000010c0588f0','slaughtered_chicken',0),(434,'steam:11000010c0588f0','stone',0),(435,'steam:11000010c0588f0','carokit',0),(436,'steam:11000010c0588f0','alive_chicken',0),(437,'steam:11000010c0588f0','blowpipe',0),(438,'steam:11000010c0588f0','packaged_plank',0),(439,'steam:11000010c0588f0','lighter',0),(440,'steam:11000010c0588f0','packaged_chicken',0),(441,'steam:11000010c0588f0','cheesebows',0),(442,'steam:11000010c0588f0','washed_stone',0),(443,'steam:11000010c0588f0','macka',0),(444,'steam:11000010c0588f0','silencieux',0),(445,'steam:11000010c0588f0','pizza',0),(446,'steam:11000010c0588f0','petrol_raffin',0),(447,'steam:11000010c0588f0','petrol',0),(448,'steam:11000010c0588f0','carotool',0),(449,'steam:11000010c0588f0','flashlight',0),(450,'steam:11000010c0588f0','grip',0),(451,'steam:11000010c0588f0','cutted_wood',0),(452,'steam:11000010c0588f0','fixkit',0),(453,'steam:11000010c0588f0','pastacarbonara',0),(454,'steam:11000010c0588f0','clothe',0),(455,'steam:11000010c0588f0','essence',0),(456,'steam:11000010c0588f0','chips',0),(457,'steam:11000010c0588f0','fixtool',0),(458,'steam:11000010c0588f0','marijuana',0),(459,'steam:11000010c0588f0','sprite',0),(460,'steam:11000010c0588f0','skate',0),(461,'steam:11000010c0588f0','gold',0),(462,'steam:11000010c0588f0','jewels',0),(463,'steam:11000010c0588f0','lotteryticket',0),(464,'steam:11000010c0588f0','altavoz',0),(465,'steam:11000010c0588f0','wood',0),(466,'steam:11000010c0588f0','iron',0),(467,'steam:11000010c0588f0','fanta',0),(468,'steam:11000010c0588f0','chaleco',0),(469,'steam:11000010c0588f0','petardo',0),(470,'steam:11000010c0588f0','loka',0),(471,'steam:11000010c0588f0','gazbottle',0),(472,'steam:11000010c0588f0','medikit',0),(473,'steam:11000010c0588f0','cargador',0),(474,'steam:11000010edbfb5d','bread',0),(475,'steam:11000010edbfb5d','rueda',0),(476,'steam:11000010edbfb5d','cannabis',0),(477,'steam:11000010edbfb5d','fish',0),(478,'steam:11000010edbfb5d','cigarett',0),(479,'steam:11000010edbfb5d','marabou',0),(480,'steam:11000010edbfb5d','bandage',0),(481,'steam:11000010edbfb5d','pastel',0),(482,'steam:11000010edbfb5d','zarowki',0),(483,'steam:11000010edbfb5d','diamond',0),(484,'steam:11000010edbfb5d','vip_coin',0),(485,'steam:11000010edbfb5d','fabric',0),(486,'steam:11000010edbfb5d','copper',0),(487,'steam:11000010edbfb5d','yusuf',0),(488,'steam:11000010edbfb5d','wool',0),(489,'steam:11000010edbfb5d','burger',0),(490,'steam:11000010edbfb5d','cocacola',0),(491,'steam:11000010edbfb5d','water',0),(492,'steam:11000010edbfb5d','stone',0),(493,'steam:11000010edbfb5d','slaughtered_chicken',0),(494,'steam:11000010edbfb5d','carokit',0),(495,'steam:11000010edbfb5d','alive_chicken',0),(496,'steam:11000010edbfb5d','blowpipe',0),(497,'steam:11000010edbfb5d','packaged_plank',0),(498,'steam:11000010edbfb5d','lighter',0),(499,'steam:11000010edbfb5d','packaged_chicken',0),(500,'steam:11000010edbfb5d','cheesebows',0),(501,'steam:11000010edbfb5d','washed_stone',0),(502,'steam:11000010edbfb5d','macka',0),(503,'steam:11000010edbfb5d','silencieux',0),(504,'steam:11000010edbfb5d','pizza',0),(505,'steam:11000010edbfb5d','petrol_raffin',0),(506,'steam:11000010edbfb5d','petrol',0),(507,'steam:11000010edbfb5d','carotool',0),(508,'steam:11000010edbfb5d','flashlight',0),(509,'steam:11000010edbfb5d','clothe',0),(510,'steam:11000010edbfb5d','cutted_wood',0),(511,'steam:11000010edbfb5d','fixkit',0),(512,'steam:11000010edbfb5d','grip',0),(513,'steam:11000010edbfb5d','pastacarbonara',0),(514,'steam:11000010edbfb5d','sprite',0),(515,'steam:11000010edbfb5d','essence',0),(516,'steam:11000010edbfb5d','fixtool',0),(517,'steam:11000010edbfb5d','chips',0),(518,'steam:11000010edbfb5d','marijuana',0),(519,'steam:11000010edbfb5d','skate',0),(520,'steam:11000010edbfb5d','gold',0),(521,'steam:11000010edbfb5d','jewels',0),(522,'steam:11000010edbfb5d','lotteryticket',0),(523,'steam:11000010edbfb5d','altavoz',0),(524,'steam:11000010edbfb5d','fanta',0),(525,'steam:11000010edbfb5d','wood',0),(526,'steam:11000010edbfb5d','iron',0),(527,'steam:11000010edbfb5d','petardo',0),(528,'steam:11000010edbfb5d','chaleco',0),(529,'steam:11000010edbfb5d','cargador',0),(530,'steam:11000010edbfb5d','loka',0),(531,'steam:11000010edbfb5d','medikit',0),(532,'steam:11000010edbfb5d','gazbottle',0),(533,'steam:110000116b2f1a5','zarowki',0),(534,'steam:110000116b2f1a5','vip_coin',0),(535,'steam:110000116b2f1a5','yusuf',0),(536,'steam:110000116b2f1a5','fanta',0),(537,'steam:110000116b2f1a5','diamond',0),(538,'steam:110000116b2f1a5','sprite',0),(539,'steam:110000116b2f1a5','essence',0),(540,'steam:110000116b2f1a5','loka',0),(541,'steam:110000116b2f1a5','wood',0),(542,'steam:110000116b2f1a5','water',0),(543,'steam:110000116b2f1a5','washed_stone',0),(544,'steam:110000116b2f1a5','packaged_chicken',0),(545,'steam:110000116b2f1a5','cargador',0),(546,'steam:110000116b2f1a5','medikit',0),(547,'steam:110000116b2f1a5','cutted_wood',0),(548,'steam:110000116b2f1a5','wool',0),(549,'steam:110000116b2f1a5','stone',0),(550,'steam:110000116b2f1a5','slaughtered_chicken',0),(551,'steam:110000116b2f1a5','carokit',0),(552,'steam:110000116b2f1a5','cocacola',0),(553,'steam:110000116b2f1a5','altavoz',0),(554,'steam:110000116b2f1a5','copper',0),(555,'steam:110000116b2f1a5','fixtool',0),(556,'steam:110000116b2f1a5','burger',0),(557,'steam:110000116b2f1a5','pastel',0),(558,'steam:110000116b2f1a5','silencieux',0),(559,'steam:110000116b2f1a5','macka',0),(560,'steam:110000116b2f1a5','cigarett',0),(561,'steam:110000116b2f1a5','carotool',0),(562,'steam:110000116b2f1a5','bread',0),(563,'steam:110000116b2f1a5','alive_chicken',0),(564,'steam:110000116b2f1a5','jewels',0),(565,'steam:110000116b2f1a5','petrol_raffin',0),(566,'steam:110000116b2f1a5','fixkit',0),(567,'steam:110000116b2f1a5','pizza',0),(568,'steam:110000116b2f1a5','fish',0),(569,'steam:110000116b2f1a5','petrol',0),(570,'steam:110000116b2f1a5','fabric',0),(571,'steam:110000116b2f1a5','petardo',0),(572,'steam:110000116b2f1a5','pastacarbonara',0),(573,'steam:110000116b2f1a5','packaged_plank',0),(574,'steam:110000116b2f1a5','marabou',0),(575,'steam:110000116b2f1a5','marijuana',0),(576,'steam:110000116b2f1a5','rueda',0),(577,'steam:110000116b2f1a5','gold',0),(578,'steam:110000116b2f1a5','iron',0),(579,'steam:110000116b2f1a5','cheesebows',0),(580,'steam:110000116b2f1a5','lighter',0),(581,'steam:110000116b2f1a5','blowpipe',0),(582,'steam:110000116b2f1a5','clothe',0),(583,'steam:110000116b2f1a5','cannabis',0),(584,'steam:110000116b2f1a5','chaleco',0),(585,'steam:110000116b2f1a5','flashlight',0),(586,'steam:110000116b2f1a5','chips',0),(587,'steam:110000116b2f1a5','grip',0),(588,'steam:110000116b2f1a5','bandage',0),(589,'steam:110000116b2f1a5','gazbottle',0),(590,'steam:110000116b2f1a5','skate',0),(591,'steam:110000116b2f1a5','lotteryticket',0),(592,'steam:110000117a1e4c9','bagofdope',1),(593,'steam:110000117a1e4c9','lowgrademaleseed',0),(594,'steam:110000117a1e4c9','purifiedwater',0),(595,'steam:110000117a1e4c9','plantpot',1),(596,'steam:110000117a1e4c9','lowgradefemaleseed',0),(597,'steam:110000117a1e4c9','highgradefemaleseed',10),(598,'steam:110000117a1e4c9','wateringcan',0),(599,'steam:110000117a1e4c9','drugscales',1000),(600,'steam:110000117a1e4c9','highgrademaleseed',0),(601,'steam:110000117a1e4c9','dopebag',0),(602,'steam:110000117a1e4c9','highgradefert',999),(603,'steam:110000117a1e4c9','trimmedweed',95),(604,'steam:110000117a1e4c9','lowgradefert',0),(605,'steam:1100001172b03f4','bagofdope',0),(606,'steam:1100001172b03f4','lowgradefemaleseed',0),(607,'steam:1100001172b03f4','plantpot',0),(608,'steam:1100001172b03f4','lowgrademaleseed',0),(609,'steam:1100001172b03f4','purifiedwater',0),(610,'steam:1100001172b03f4','drugscales',0),(611,'steam:1100001172b03f4','highgradefemaleseed',0),(612,'steam:1100001172b03f4','highgrademaleseed',0),(613,'steam:1100001172b03f4','wateringcan',0),(614,'steam:1100001172b03f4','highgradefert',0),(615,'steam:1100001172b03f4','dopebag',0),(616,'steam:1100001172b03f4','trimmedweed',0),(617,'steam:1100001172b03f4','lowgradefert',0),(618,'steam:110000117a1e4c9','wayne_laptop',1),(619,'steam:110000112c384fc','cutted_wood',0),(620,'steam:110000112c384fc','loka',0),(621,'steam:110000112c384fc','highgrademaleseed',0),(622,'steam:110000112c384fc','lowgrademaleseed',0),(623,'steam:110000112c384fc','silencieux',0),(624,'steam:110000112c384fc','vip_coin',0),(625,'steam:110000112c384fc','grip',0),(626,'steam:110000112c384fc','burger',0),(627,'steam:110000112c384fc','cocacola',0),(628,'steam:110000112c384fc','wood',0),(629,'steam:110000112c384fc','highgradefemaleseed',0),(630,'steam:110000112c384fc','chaleco',0),(631,'steam:110000112c384fc','fixtool',0),(632,'steam:110000112c384fc','packaged_plank',0),(633,'steam:110000112c384fc','sprite',0),(634,'steam:110000112c384fc','lowgradefemaleseed',0),(635,'steam:110000112c384fc','highgradefert',0),(636,'steam:110000112c384fc','marijuana',0),(637,'steam:110000112c384fc','washed_stone',0),(638,'steam:110000112c384fc','carokit',0),(639,'steam:110000112c384fc','lowgradefert',0),(640,'steam:110000112c384fc','cargador',0),(641,'steam:110000112c384fc','slaughtered_chicken',0),(642,'steam:110000112c384fc','medikit',0),(643,'steam:110000112c384fc','iron',0),(644,'steam:110000112c384fc','purifiedwater',0),(645,'steam:110000112c384fc','clothe',0),(646,'steam:110000112c384fc','macka',0),(647,'steam:110000112c384fc','lighter',0),(648,'steam:110000112c384fc','jewels',0),(649,'steam:110000112c384fc','bandage',0),(650,'steam:110000112c384fc','dopebag',0),(651,'steam:110000112c384fc','copper',0),(652,'steam:110000112c384fc','trimmedweed',0),(653,'steam:110000112c384fc','pizza',0),(654,'steam:110000112c384fc','stone',0),(655,'steam:110000112c384fc','wool',0),(656,'steam:110000112c384fc','bread',0),(657,'steam:110000112c384fc','cannabis',0),(658,'steam:110000112c384fc','fanta',0),(659,'steam:110000112c384fc','wateringcan',0),(660,'steam:110000112c384fc','wayne_laptop',0),(661,'steam:110000112c384fc','zarowki',0),(662,'steam:110000112c384fc','yusuf',0),(663,'steam:110000112c384fc','gold',0),(664,'steam:110000112c384fc','water',0),(665,'steam:110000112c384fc','packaged_chicken',0),(666,'steam:110000112c384fc','marabou',0),(667,'steam:110000112c384fc','lotteryticket',0),(668,'steam:110000112c384fc','pastel',0),(669,'steam:110000112c384fc','rueda',2),(670,'steam:110000112c384fc','petrol_raffin',0),(671,'steam:110000112c384fc','essence',0),(672,'steam:110000112c384fc','fish',0),(673,'steam:110000112c384fc','skate',0),(674,'steam:110000112c384fc','cheesebows',0),(675,'steam:110000112c384fc','chips',0),(676,'steam:110000112c384fc','alive_chicken',0),(677,'steam:110000112c384fc','diamond',0),(678,'steam:110000112c384fc','petrol',0),(679,'steam:110000112c384fc','petardo',0),(680,'steam:110000112c384fc','flashlight',0),(681,'steam:110000112c384fc','gazbottle',0),(682,'steam:110000112c384fc','pastacarbonara',0),(683,'steam:110000112c384fc','cigarett',0),(684,'steam:110000112c384fc','bagofdope',0),(685,'steam:110000112c384fc','carotool',0),(686,'steam:110000112c384fc','altavoz',0),(687,'steam:110000112c384fc','fabric',0),(688,'steam:110000112c384fc','fixkit',0),(689,'steam:110000112c384fc','plantpot',0),(690,'steam:110000112c384fc','drugscales',0),(691,'steam:110000112c384fc','blowpipe',0),(692,'steam:1100001172b03f4','wayne_laptop',0),(693,'steam:110000142afbcd6','gazbottle',0),(694,'steam:110000142afbcd6','zarowki',0),(695,'steam:110000142afbcd6','jewels',0),(696,'steam:110000142afbcd6','plantpot',0),(697,'steam:110000142afbcd6','carotool',0),(698,'steam:110000142afbcd6','pastacarbonara',0),(699,'steam:110000142afbcd6','petrol',0),(700,'steam:110000142afbcd6','highgrademaleseed',0),(701,'steam:110000142afbcd6','grip',0),(702,'steam:110000142afbcd6','alive_chicken',0),(703,'steam:110000142afbcd6','cheesebows',0),(704,'steam:110000142afbcd6','purifiedwater',0),(705,'steam:110000142afbcd6','loka',0),(706,'steam:110000142afbcd6','slaughtered_chicken',0),(707,'steam:110000142afbcd6','pizza',0),(708,'steam:110000142afbcd6','blowpipe',0),(709,'steam:110000142afbcd6','fish',0),(710,'steam:110000142afbcd6','lowgrademaleseed',0),(711,'steam:110000142afbcd6','bagofdope',0),(712,'steam:110000142afbcd6','macka',0),(713,'steam:110000142afbcd6','dopebag',0),(714,'steam:110000142afbcd6','bread',0),(715,'steam:110000142afbcd6','fixkit',0),(716,'steam:110000142afbcd6','wayne_laptop',0),(717,'steam:110000142afbcd6','copper',0),(718,'steam:110000142afbcd6','pastel',0),(719,'steam:110000142afbcd6','cutted_wood',0),(720,'steam:110000142afbcd6','chips',0),(721,'steam:110000142afbcd6','medikit',0),(722,'steam:110000142afbcd6','packaged_plank',0),(723,'steam:110000142afbcd6','highgradefemaleseed',0),(724,'steam:110000142afbcd6','cannabis',0),(725,'steam:110000142afbcd6','trimmedweed',0),(726,'steam:110000142afbcd6','iron',0),(727,'steam:110000142afbcd6','chaleco',0),(728,'steam:110000142afbcd6','cocacola',0),(729,'steam:110000142afbcd6','drugscales',0),(730,'steam:110000142afbcd6','packaged_chicken',0),(731,'steam:110000142afbcd6','essence',0),(732,'steam:110000142afbcd6','fanta',0),(733,'steam:110000142afbcd6','lighter',0),(734,'steam:110000142afbcd6','yusuf',0),(735,'steam:110000142afbcd6','bandage',0),(736,'steam:110000142afbcd6','fixtool',0),(737,'steam:110000142afbcd6','wool',0),(738,'steam:110000142afbcd6','marijuana',0),(739,'steam:110000142afbcd6','washed_stone',0),(740,'steam:110000142afbcd6','lowgradefemaleseed',0),(741,'steam:110000142afbcd6','cigarett',0),(742,'steam:110000142afbcd6','wood',0),(743,'steam:110000142afbcd6','sprite',0),(744,'steam:110000142afbcd6','vip_coin',0),(745,'steam:110000142afbcd6','silencieux',0),(746,'steam:110000142afbcd6','wateringcan',0),(747,'steam:110000142afbcd6','petardo',0),(748,'steam:110000142afbcd6','stone',0),(749,'steam:110000142afbcd6','water',0),(750,'steam:110000142afbcd6','clothe',0),(751,'steam:110000142afbcd6','skate',0),(752,'steam:110000142afbcd6','carokit',0),(753,'steam:110000142afbcd6','lowgradefert',0),(754,'steam:110000142afbcd6','rueda',0),(755,'steam:110000142afbcd6','cargador',0),(756,'steam:110000142afbcd6','gold',0),(757,'steam:110000142afbcd6','altavoz',0),(758,'steam:110000142afbcd6','burger',0),(759,'steam:110000142afbcd6','lotteryticket',0),(760,'steam:110000142afbcd6','petrol_raffin',0),(761,'steam:110000142afbcd6','flashlight',0),(762,'steam:110000142afbcd6','fabric',0),(763,'steam:110000142afbcd6','marabou',0),(764,'steam:110000142afbcd6','diamond',0),(765,'steam:110000142afbcd6','highgradefert',0),(766,'steam:110000117a1e4c9','colis',0),(767,'steam:110000117a1e4c9','letter',0),(768,'steam:110000117a1e4c9','Neumatico de recambio',0),(769,'steam:110000117a1e4c9','steel',0),(770,'steam:110000117a1e4c9','plastic',0),(771,'steam:110000117a1e4c9','aluminum',0),(772,'steam:110000117a1e4c9','glass',0);

#
# Structure for table "user_licenses"
#

DROP TABLE IF EXISTS `user_licenses`;
CREATE TABLE `user_licenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(60) COLLATE utf8mb4_spanish_ci NOT NULL,
  `owner` varchar(60) COLLATE utf8mb4_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

#
# Data for table "user_licenses"
#

INSERT INTO `user_licenses` VALUES (2,'weapon','steam:110000117a1e4c9'),(3,'weapon','steam:110000117a1e4c9'),(4,'weapon','steam:110000117a1e4c9'),(5,'weapon3','steam:110000117a1e4c9');

#
# Structure for table "user_mdt"
#

DROP TABLE IF EXISTS `user_mdt`;
CREATE TABLE `user_mdt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `char_id` int(11) DEFAULT NULL,
  `notes` varchar(255) COLLATE utf32_spanish2_ci DEFAULT NULL,
  `mugshot_url` varchar(255) COLLATE utf32_spanish2_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

#
# Data for table "user_mdt"
#


#
# Structure for table "user_parkings"
#

DROP TABLE IF EXISTS `user_parkings`;
CREATE TABLE `user_parkings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `garage` varchar(60) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `zone` int(11) NOT NULL,
  `vehicle` longtext COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

#
# Data for table "user_parkings"
#


#
# Structure for table "user_policearmory"
#

DROP TABLE IF EXISTS `user_policearmory`;
CREATE TABLE `user_policearmory` (
  `identifier` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `weapons` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

#
# Data for table "user_policearmory"
#

INSERT INTO `user_policearmory` VALUES ('steam:1100001172b03f4',''),('steam:110000117a1e4c9','WEAPON_FLASHLIGHT, WEAPON_SMG, ');

#
# Structure for table "users"
#

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `identifier` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `license` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_bin DEFAULT '',
  `skin` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `job` varchar(50) COLLATE utf8mb4_bin DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT 0,
  `loadout` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `position` varchar(36) COLLATE utf8mb4_bin DEFAULT NULL,
  `bank` int(11) DEFAULT NULL,
  `permission_level` int(11) DEFAULT NULL,
  `group` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `is_dead` tinyint(1) DEFAULT 0,
  `firstname` varchar(50) COLLATE utf8mb4_bin DEFAULT '',
  `lastname` varchar(50) COLLATE utf8mb4_bin DEFAULT '',
  `dateofbirth` varchar(25) COLLATE utf8mb4_bin DEFAULT '',
  `sex` varchar(10) COLLATE utf8mb4_bin DEFAULT '',
  `height` varchar(5) COLLATE utf8mb4_bin DEFAULT '',
  `last_property` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `status` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `skills` varchar(1000) COLLATE utf8mb4_bin DEFAULT NULL,
  `tattoos` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `phone_number` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL,
  `jail` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

#
# Data for table "users"
#

INSERT INTO `users` VALUES ('steam:1100001026d69a0','license:d09c78df316b62efcfcf930a1896d0d93e08da09',500,'LoborRR','{\"hair_color_1\":40,\"ears_2\":-1,\"glasses_2\":-1,\"pants_2\":4,\"hair_1\":1,\"ears_1\":-1,\"helmet_2\":3,\"skin\":12,\"complexion_1\":0,\"tshirt_1\":10,\"face\":4,\"eyebrows_2\":10,\"watches_1\":-1,\"hair_color_2\":40,\"beard_2\":10,\"torso_1\":10,\"age_1\":0,\"eye_color\":0,\"shoes_1\":0,\"tshirt_2\":0,\"shoes_2\":10,\"beard_4\":0,\"moles_2\":1,\"chain_1\":11,\"eyebrows_1\":27,\"pants_1\":61,\"torso_2\":0,\"beard_3\":0,\"arms\":4,\"arms_2\":0,\"complexion_2\":1,\"sex\":0,\"hair_2\":0,\"beard_1\":21,\"glasses_1\":-1,\"watches_2\":-1,\"moles_1\":0,\"helmet_1\":2,\"age_2\":0,\"chain_2\":2}','unemployed',0,'[{\"label\":\"AK-47\",\"ammo\":91,\"components\":[\"clip_default\"],\"name\":\"WEAPON_ASSAULTRIFLE\"}]','{\"y\":6175.1,\"x\":-218.6,\"z\":30.5}',8000,0,'user',1,'Manolo','Escobar','1995-06-2','m','200',NULL,'[{\"name\":\"drunk\",\"val\":0,\"percent\":0.0},{\"name\":\"hunger\",\"val\":453425,\"percent\":45.3425},{\"name\":\"thirst\",\"val\":447215,\"percent\":44.7215},{\"name\":\"stress\",\"val\":0,\"percent\":0.0}]',NULL,NULL,'646-1662',0),('steam:11000010c0588f0','license:1f3e5785de88280796efaa6991b8e560d18e984c',500,'AlexChoji','{\"hair_color_1\":53,\"ears_2\":0,\"arms\":6,\"pants_2\":2,\"hair_1\":1,\"ears_1\":5,\"helmet_2\":0,\"skin\":12,\"complexion_1\":0,\"tshirt_1\":5,\"face\":15,\"sex\":0,\"watches_1\":-1,\"glasses_1\":1,\"beard_2\":10,\"torso_1\":3,\"age_1\":0,\"complexion_2\":1,\"shoes_1\":1,\"tshirt_2\":0,\"shoes_2\":0,\"beard_4\":0,\"eye_color\":0,\"chain_1\":0,\"eyebrows_1\":0,\"pants_1\":0,\"arms_2\":0,\"moles_1\":0,\"eyebrows_2\":10,\"chain_2\":0,\"hair_color_2\":53,\"moles_2\":1,\"hair_2\":0,\"beard_1\":7,\"glasses_2\":0,\"beard_3\":0,\"watches_2\":-1,\"helmet_1\":15,\"age_2\":0,\"torso_2\":15}','unemployed',0,'[{\"label\":\"Revolver\",\"ammo\":181,\"components\":[],\"name\":\"WEAPON_REVOLVER\"},{\"label\":\"Escopeta\",\"ammo\":0,\"components\":[],\"name\":\"WEAPON_PUMPSHOTGUN\"},{\"label\":\"AK-47\",\"ammo\":129,\"components\":[\"clip_default\"],\"name\":\"WEAPON_ASSAULTRIFLE\"}]','{\"y\":2089.8,\"x\":-2626.8,\"z\":112.1}',8200,0,'user',1,'Domingo','Diasfestivos','1995/08/04','m','200',NULL,'[{\"name\":\"drunk\",\"val\":0,\"percent\":0.0},{\"name\":\"hunger\",\"val\":476075,\"percent\":47.6075},{\"name\":\"thirst\",\"val\":472885,\"percent\":47.2885},{\"name\":\"stress\",\"val\":0,\"percent\":0.0}]',NULL,NULL,'696-4507',0),('steam:11000010edbfb5d','license:063c744cf3911a5cb7410bdc89b6e2dc4d24bfc0',500,'KFK_pjgm2003','{\"moles_2\":1,\"arms_2\":0,\"chain_1\":0,\"moles_1\":0,\"age_2\":0,\"chain_2\":0,\"watches_1\":-1,\"arms\":0,\"beard_4\":0,\"pants_1\":100,\"hair_2\":0,\"complexion_1\":0,\"sex\":0,\"complexion_2\":1,\"torso_1\":282,\"face\":2,\"hair_color_1\":32,\"tshirt_2\":0,\"age_1\":0,\"ears_1\":-1,\"ears_2\":-1,\"shoes_2\":0,\"beard_3\":0,\"eyebrows_2\":10,\"beard_1\":0,\"hair_1\":3,\"watches_2\":-1,\"beard_2\":10,\"eye_color\":0,\"torso_2\":6,\"helmet_1\":-1,\"shoes_1\":34,\"hair_color_2\":32,\"tshirt_1\":15,\"glasses_2\":-1,\"pants_2\":9,\"eyebrows_1\":0,\"helmet_2\":-1,\"skin\":12,\"glasses_1\":-1}','unemployed',0,'[{\"label\":\"Revolver\",\"name\":\"WEAPON_REVOLVER\",\"components\":[],\"ammo\":139},{\"label\":\"AK-47\",\"name\":\"WEAPON_ASSAULTRIFLE\",\"components\":[\"clip_default\"],\"ammo\":14}]','{\"y\":6312.4,\"x\":-134.8,\"z\":31.4}',8200,0,'user',0,'Mayreen','Murphy','1995/21/03','m','140',NULL,'[{\"name\":\"drunk\",\"val\":0,\"percent\":0.0},{\"name\":\"hunger\",\"val\":499850,\"percent\":49.985},{\"name\":\"thirst\",\"val\":499830,\"percent\":49.983},{\"name\":\"stress\",\"val\":0,\"percent\":0.0}]',NULL,NULL,'416-0570',0),('steam:110000112c384fc','license:379817337ca8515ee87441c4092b76429f40a77a',999960,'teresita123','{\"hair_color_1\":12,\"complexion_1\":0,\"beard_3\":12,\"tshirt_2\":0,\"beard_2\":10,\"eyebrows_1\":1,\"age_1\":0,\"chain_1\":0,\"torso_1\":0,\"watches_1\":10,\"shoes_2\":1,\"arms_2\":0,\"moles_2\":1,\"hair_2\":0,\"watches_2\":0,\"skin\":12,\"glasses_1\":-1,\"sex\":0,\"torso_2\":7,\"eye_color\":4,\"face\":44,\"pants_2\":0,\"glasses_2\":-1,\"age_2\":0,\"ears_2\":-1,\"moles_1\":0,\"beard_4\":12,\"complexion_2\":1,\"tshirt_1\":0,\"beard_1\":4,\"pants_1\":0,\"hair_1\":55,\"shoes_1\":1,\"helmet_1\":-1,\"ears_1\":-1,\"chain_2\":0,\"hair_color_2\":12,\"eyebrows_2\":8,\"helmet_2\":-1,\"arms\":0}','taxi',1,'[{\"components\":[\"clip_default\"],\"name\":\"WEAPON_ADVANCEDRIFLE\",\"ammo\":0,\"label\":\"Rifle de asalto\"},{\"components\":[\"clip_default\"],\"name\":\"WEAPON_SPECIALCARBINE\",\"ammo\":0,\"label\":\"Carabina especial\"},{\"components\":[],\"name\":\"WEAPON_RPG\",\"ammo\":20,\"label\":\"Lanzacohetes\"},{\"components\":[],\"name\":\"WEAPON_MINIGUN\",\"ammo\":0,\"label\":\"Minigun\"}]','{\"z\":31.0,\"y\":6217.9,\"x\":-183.2}',11400,0,'user',0,'Teresita','Bebelin','2002-11-17','m','183',NULL,'[{\"name\":\"drunk\",\"percent\":0.0,\"val\":0},{\"name\":\"hunger\",\"percent\":45.245,\"val\":452450},{\"name\":\"thirst\",\"percent\":44.611,\"val\":446110},{\"name\":\"stress\",\"percent\":0.0,\"val\":0}]',NULL,NULL,'840-7465',0),('steam:1100001154bcf8d','license:5fe068fd5c8289432e72461c7b81afc68a1d497f',99929300,'Manolito Pies De Morcilla','{\"hair_color_1\":0,\"ears_2\":-1,\"moles_2\":1,\"pants_2\":0,\"hair_1\":46,\"ears_1\":-1,\"helmet_2\":-1,\"skin\":12,\"complexion_1\":0,\"tshirt_1\":15,\"watches_2\":-1,\"sex\":0,\"watches_1\":-1,\"hair_color_2\":0,\"beard_2\":10,\"torso_1\":111,\"age_1\":0,\"eye_color\":3,\"shoes_1\":10,\"tshirt_2\":0,\"shoes_2\":0,\"beard_4\":0,\"eyebrows_2\":10,\"chain_1\":0,\"eyebrows_1\":2,\"pants_1\":24,\"age_2\":0,\"glasses_2\":-1,\"complexion_2\":1,\"helmet_1\":-1,\"glasses_1\":-1,\"arms\":4,\"hair_2\":0,\"beard_1\":3,\"face\":6,\"beard_3\":0,\"moles_1\":0,\"arms_2\":0,\"torso_2\":3,\"chain_2\":0}','taxi',0,'[{\"label\":\"Porra policial\",\"ammo\":0,\"components\":[],\"name\":\"WEAPON_NIGHTSTICK\"},{\"label\":\"Bate de beisbol\",\"ammo\":0,\"components\":[],\"name\":\"WEAPON_BAT\"},{\"label\":\"Pistola\",\"ammo\":208,\"components\":[\"clip_default\"],\"name\":\"WEAPON_PISTOL\"},{\"label\":\"Pistola de combate\",\"ammo\":208,\"components\":[\"clip_default\"],\"name\":\"WEAPON_COMBATPISTOL\"},{\"label\":\"Revolver\",\"ammo\":208,\"components\":[],\"name\":\"WEAPON_REVOLVER\"},{\"label\":\"Micro SMG\",\"ammo\":0,\"components\":[\"clip_default\"],\"name\":\"WEAPON_MICROSMG\"},{\"label\":\"Escopeta\",\"ammo\":219,\"components\":[],\"name\":\"WEAPON_PUMPSHOTGUN\"},{\"label\":\"AK-47\",\"ammo\":210,\"components\":[\"clip_default\"],\"name\":\"WEAPON_ASSAULTRIFLE\"},{\"label\":\"Carabina especial\",\"ammo\":210,\"components\":[\"clip_default\"],\"name\":\"WEAPON_SPECIALCARBINE\"},{\"label\":\"Francotirador\",\"ammo\":78,\"components\":[\"scope\"],\"name\":\"WEAPON_SNIPERRIFLE\"},{\"label\":\"Granada\",\"ammo\":15,\"components\":[],\"name\":\"WEAPON_GRENADE\"},{\"label\":\"Granada de humo\",\"ammo\":25,\"components\":[],\"name\":\"WEAPON_SMOKEGRENADE\"},{\"label\":\"Gas BZ\",\"ammo\":20,\"components\":[],\"name\":\"WEAPON_BZGAS\"},{\"label\":\"Extintor\",\"ammo\":0,\"components\":[],\"name\":\"WEAPON_FIREEXTINGUISHER\"},{\"label\":\"Cohete Pirotecnico\",\"ammo\":16,\"components\":[],\"name\":\"WEAPON_FIREWORK\"},{\"label\":\"Mosquetón\",\"ammo\":219,\"components\":[],\"name\":\"WEAPON_MUSKET\"},{\"label\":\"Taser\",\"ammo\":42,\"components\":[],\"name\":\"WEAPON_STUNGUN\"},{\"label\":\"Machete\",\"ammo\":0,\"components\":[],\"name\":\"WEAPON_MACHETE\"},{\"label\":\"Linterna\",\"ammo\":0,\"components\":[],\"name\":\"WEAPON_FLASHLIGHT\"}]','{\"y\":-908.3,\"x\":284.5,\"z\":29.0}',100002400,0,'superadmin',0,'Woozie','Mu','1998-10-31','m','180',NULL,'[{\"name\":\"drunk\",\"val\":0,\"percent\":0.0},{\"name\":\"hunger\",\"val\":493475,\"percent\":49.3475},{\"name\":\"thirst\",\"val\":492605,\"percent\":49.2605},{\"name\":\"stress\",\"val\":0,\"percent\":0.0}]',NULL,NULL,'415-8959',0),('steam:110000116b2f1a5','license:931f9304fbd0dfe59504cfe159626b40974e8f69',500,'.AS','{\"moles_2\":1,\"arms\":6,\"hair_color_2\":12,\"glasses_1\":-1,\"shoes_1\":31,\"helmet_1\":2,\"face\":1,\"complexion_2\":1,\"pants_1\":76,\"glasses_2\":-1,\"complexion_1\":11,\"beard_3\":12,\"shoes_2\":4,\"sex\":0,\"beard_2\":10,\"beard_4\":12,\"age_1\":14,\"eyebrows_2\":10,\"eyebrows_1\":27,\"beard_1\":18,\"moles_1\":17,\"arms_2\":0,\"hair_1\":33,\"eye_color\":2,\"helmet_2\":7,\"hair_color_1\":12,\"watches_1\":-1,\"tshirt_1\":5,\"chain_2\":0,\"tshirt_2\":0,\"torso_1\":3,\"torso_2\":11,\"chain_1\":0,\"watches_2\":-1,\"hair_2\":0,\"ears_2\":0,\"ears_1\":18,\"pants_2\":2,\"age_2\":14,\"skin\":25}','admin',2,'[]','{\"x\":-166.6,\"y\":6222.1,\"z\":31.2}',8100,0,'user',0,'Saitama','Melamama','21312331','m','144',NULL,'[{\"name\":\"drunk\",\"percent\":0.0,\"val\":0},{\"name\":\"hunger\",\"percent\":72.8875,\"val\":728875},{\"name\":\"thirst\",\"percent\":69.2725,\"val\":692725},{\"name\":\"stress\",\"percent\":100.0,\"val\":1000000}]',NULL,NULL,'626-4798',0),('steam:1100001172b03f4','license:18455d63d0516ef1571bd4ce963a1a0fbc831171',657,'Viktor','{\"moles_1\":0,\"hair_1\":33,\"torso_2\":0,\"helmet_2\":-1,\"beard_4\":0,\"sex\":0,\"eyebrows_2\":10,\"age_1\":0,\"tshirt_2\":0,\"arms_2\":0,\"arms\":4,\"chain_1\":12,\"hair_2\":0,\"complexion_1\":0,\"age_2\":0,\"beard_2\":10,\"eyebrows_1\":0,\"ears_1\":5,\"ears_2\":0,\"glasses_1\":5,\"shoes_1\":10,\"watches_2\":0,\"eye_color\":5,\"pants_2\":0,\"tshirt_1\":10,\"complexion_2\":1,\"pants_1\":4,\"moles_2\":1,\"skin\":14,\"beard_1\":10,\"beard_3\":0,\"hair_color_1\":26,\"glasses_2\":0,\"face\":44,\"chain_2\":2,\"shoes_2\":0,\"helmet_1\":-1,\"hair_color_2\":26,\"torso_1\":10,\"watches_1\":8}','police',3,'[{\"components\":[],\"name\":\"WEAPON_KNIFE\",\"ammo\":0,\"label\":\"Cuchillo\"},{\"components\":[],\"name\":\"WEAPON_NIGHTSTICK\",\"ammo\":0,\"label\":\"Porra policial\"},{\"components\":[\"clip_default\"],\"name\":\"WEAPON_PISTOL\",\"ammo\":72,\"label\":\"Pistola\"},{\"components\":[\"clip_default\"],\"name\":\"WEAPON_COMBATPISTOL\",\"ammo\":72,\"label\":\"Pistola de combate\"},{\"components\":[\"clip_default\"],\"name\":\"WEAPON_SPECIALCARBINE\",\"ammo\":0,\"label\":\"Carabina especial\"},{\"components\":[\"scope\"],\"name\":\"WEAPON_SNIPERRIFLE\",\"ammo\":51,\"label\":\"Francotirador\"},{\"components\":[],\"name\":\"WEAPON_RPG\",\"ammo\":12,\"label\":\"Lanzacohetes\"},{\"components\":[],\"name\":\"WEAPON_MINIGUN\",\"ammo\":0,\"label\":\"Minigun\"},{\"components\":[],\"name\":\"WEAPON_STUNGUN\",\"ammo\":250,\"label\":\"Taser\"},{\"components\":[],\"name\":\"WEAPON_FLASHLIGHT\",\"ammo\":0,\"label\":\"Linterna\"}]','{\"y\":6022.6,\"x\":-407.8,\"z\":30.5}',2145514116,0,'superadmin',1,'Viktor','Garcia','04-12-1999','m','200',NULL,'[{\"percent\":49.13,\"val\":491300,\"name\":\"hunger\"},{\"percent\":49.014,\"val\":490140,\"name\":\"thirst\"},{\"percent\":0.0,\"val\":0,\"name\":\"stress\"},{\"percent\":0.0,\"val\":0,\"name\":\"drunk\"}]',NULL,NULL,'273-8087',0),('steam:110000117a1e4c9','license:0a4f1a44b6856610d3c039586e73493ba7a88bcb',9970,'Aniol0012','{\"age_2\":0,\"arms_2\":0,\"chain_1\":0,\"blush_1\":0,\"watches_1\":8,\"eyebrows_1\":0,\"chest_2\":0,\"sun_1\":0,\"lipstick_2\":0,\"chest_3\":0,\"hair_color_1\":0,\"chain_2\":0,\"mask_1\":0,\"helmet_1\":20,\"glasses_2\":-1,\"sun_2\":0,\"decals_1\":0,\"face\":0,\"shoes_2\":3,\"beard_2\":10,\"bags_1\":40,\"age_1\":0,\"tshirt_1\":15,\"pants_1\":54,\"bodyb_1\":0,\"beard_1\":0,\"ears_2\":-1,\"eyebrows_3\":0,\"lipstick_4\":0,\"eyebrows_2\":10,\"blemishes_1\":0,\"mask_2\":0,\"arms\":62,\"tshirt_2\":0,\"moles_1\":0,\"lipstick_3\":0,\"chest_1\":0,\"hair_1\":0,\"beard_4\":0,\"eyebrows_4\":0,\"bags_2\":0,\"bproof_1\":0,\"moles_2\":1,\"torso_1\":226,\"makeup_4\":0,\"hair_color_2\":0,\"shoes_1\":1,\"decals_2\":0,\"makeup_1\":0,\"blush_3\":0,\"pants_2\":1,\"lipstick_1\":0,\"skin\":14,\"hair_2\":0,\"watches_2\":0,\"blush_2\":0,\"complexion_2\":1,\"bracelets_2\":0,\"makeup_2\":0,\"ears_1\":-1,\"beard_3\":0,\"blemishes_2\":0,\"torso_2\":0,\"bproof_2\":0,\"helmet_2\":3,\"complexion_1\":0,\"eye_color\":0,\"glasses_1\":-1,\"bracelets_1\":-1,\"sex\":0,\"makeup_3\":0,\"bodyb_2\":0}','admin',2,'[{\"components\":[],\"ammo\":0,\"label\":\"Porra policial\",\"name\":\"WEAPON_NIGHTSTICK\"},{\"components\":[\"clip_default\"],\"ammo\":239,\"label\":\"Pistola\",\"name\":\"WEAPON_PISTOL\"},{\"components\":[\"clip_default\"],\"ammo\":239,\"label\":\"Pistola de combate\",\"name\":\"WEAPON_COMBATPISTOL\"},{\"components\":[\"clip_default\"],\"ammo\":239,\"label\":\"Pistola SNS\",\"name\":\"WEAPON_SNSPISTOL\"},{\"components\":[\"clip_default\"],\"ammo\":0,\"label\":\"Micro SMG\",\"name\":\"WEAPON_MICROSMG\"},{\"components\":[\"clip_default\",\"flashlight\",\"scope\",\"suppressor\"],\"ammo\":0,\"label\":\"SMG\",\"name\":\"WEAPON_SMG\"},{\"components\":[],\"ammo\":74,\"label\":\"Escopeta Recortada\",\"name\":\"WEAPON_SAWNOFFSHOTGUN\"},{\"components\":[\"clip_default\"],\"ammo\":35,\"label\":\"Rifle de asalto\",\"name\":\"WEAPON_ADVANCEDRIFLE\"},{\"components\":[\"clip_default\"],\"ammo\":35,\"label\":\"Carabina especial\",\"name\":\"WEAPON_SPECIALCARBINE\"},{\"components\":[\"scope\"],\"ammo\":247,\"label\":\"Francotirador\",\"name\":\"WEAPON_SNIPERRIFLE\"},{\"components\":[\"scope_advanced\"],\"ammo\":247,\"label\":\"Francotirador Mejorado\",\"name\":\"WEAPON_HEAVYSNIPER\"},{\"components\":[],\"ammo\":78,\"label\":\"Minigun\",\"name\":\"WEAPON_MINIGUN\"},{\"components\":[],\"ammo\":250,\"label\":\"Taser\",\"name\":\"WEAPON_STUNGUN\"},{\"components\":[],\"ammo\":0,\"label\":\"Linterna\",\"name\":\"WEAPON_FLASHLIGHT\"}]','{\"x\":-108.0,\"y\":6510.1,\"z\":29.2}',1024200,1000,'superadmin',0,'Tupu','Tamadre','04-12-1998','m','150',NULL,'[{\"val\":0,\"percent\":0.0,\"name\":\"drunk\"},{\"val\":433975,\"percent\":43.3975,\"name\":\"hunger\"},{\"val\":358505,\"percent\":35.8505,\"name\":\"thirst\"},{\"val\":0,\"percent\":0.0,\"name\":\"stress\"}]',NULL,'[{\"texture\":5,\"collection\":\"mplowrider_overlays\"}]','101-5635',0),('steam:110000118cf839d','license:51eb09296330c137111e9901db2b9455b9a1c5b7',999920700,'âœª L U C X S','{\"hair_color_1\":53,\"ears_2\":0,\"glasses_2\":0,\"pants_2\":5,\"hair_1\":0,\"ears_1\":11,\"helmet_2\":-1,\"skin\":19,\"complexion_1\":0,\"tshirt_1\":15,\"watches_2\":0,\"sex\":0,\"watches_1\":3,\"hair_color_2\":53,\"beard_2\":10,\"torso_1\":2,\"age_1\":0,\"complexion_2\":1,\"shoes_1\":0,\"tshirt_2\":0,\"shoes_2\":10,\"beard_4\":0,\"age_2\":0,\"chain_1\":0,\"eyebrows_1\":2,\"pants_1\":26,\"torso_2\":9,\"arms\":2,\"moles_2\":1,\"eye_color\":6,\"glasses_1\":3,\"hair_2\":0,\"moles_1\":0,\"beard_3\":0,\"face\":19,\"eyebrows_2\":10,\"arms_2\":0,\"helmet_1\":-1,\"chain_2\":0,\"beard_1\":10}','police',3,'[{\"label\":\"Porra policial\",\"ammo\":0,\"components\":[],\"name\":\"WEAPON_NIGHTSTICK\"},{\"label\":\"Bate de beisbol\",\"ammo\":0,\"components\":[],\"name\":\"WEAPON_BAT\"},{\"label\":\"AP pistol\",\"ammo\":28,\"components\":[\"clip_extended\",\"flashlight\",\"suppressor\"],\"name\":\"WEAPON_APPISTOL\"},{\"label\":\"Revolver\",\"ammo\":28,\"components\":[],\"name\":\"WEAPON_REVOLVER\"},{\"label\":\"Tec-9\",\"ammo\":90,\"components\":[\"clip_default\"],\"name\":\"WEAPON_MACHINEPISTOL\"},{\"label\":\"Escopeta\",\"ammo\":235,\"components\":[],\"name\":\"WEAPON_PUMPSHOTGUN\"},{\"label\":\"Escopeta Recortada\",\"ammo\":235,\"components\":[],\"name\":\"WEAPON_SAWNOFFSHOTGUN\"},{\"label\":\"Rifle de asalto\",\"ammo\":151,\"components\":[\"clip_default\"],\"name\":\"WEAPON_ADVANCEDRIFLE\"},{\"label\":\"Rifle Compacto\",\"ammo\":151,\"components\":[\"clip_default\"],\"name\":\"WEAPON_COMPACTRIFLE\"},{\"label\":\"MG\",\"ammo\":118,\"components\":[\"clip_default\"],\"name\":\"WEAPON_MG\"},{\"label\":\"Mosquetón\",\"ammo\":235,\"components\":[],\"name\":\"WEAPON_MUSKET\"},{\"label\":\"Recortada de doble cañon\",\"ammo\":235,\"components\":[],\"name\":\"WEAPON_DBSHOTGUN\"}]','{\"y\":1568.0,\"x\":-2643.2,\"z\":90.0}',1000008500,0,'superadmin',0,'Jhonny','Zoo','2000/04/01','m','180',NULL,'[{\"name\":\"drunk\",\"val\":0,\"percent\":0.0},{\"name\":\"hunger\",\"val\":493700,\"percent\":49.37},{\"name\":\"thirst\",\"val\":492860,\"percent\":49.286},{\"name\":\"stress\",\"val\":0,\"percent\":0.0}]',NULL,NULL,'771-1741',0),('steam:110000142afbcd6','license:18455d63d0516ef1571bd4ce963a1a0fbc831171',500,'Viktor Numero 2',NULL,'unemployed',0,'[]','{\"y\":6288.7,\"x\":-140.1,\"z\":31.5}',8000,0,'user',0,'','','','','',NULL,'[{\"percent\":98.98,\"val\":989800,\"name\":\"hunger\"},{\"percent\":98.844,\"val\":988440,\"name\":\"thirst\"},{\"percent\":100.0,\"val\":1000000,\"name\":\"stress\"},{\"percent\":0.0,\"val\":0,\"name\":\"drunk\"}]',NULL,NULL,'256-8589',0);

#
# Structure for table "vehicle_categories"
#

DROP TABLE IF EXISTS `vehicle_categories`;
CREATE TABLE `vehicle_categories` (
  `name` varchar(60) COLLATE utf8mb4_spanish_ci NOT NULL,
  `label` varchar(60) COLLATE utf8mb4_spanish_ci NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

#
# Data for table "vehicle_categories"
#

INSERT INTO `vehicle_categories` VALUES ('audi','Audi'),('bmw','BMW'),('chevrolet','Chevrolet'),('citroen','Citroen'),('ferrari','Ferrari'),('ford','Ford'),('mclaren','Mclaren'),('mercedes','Mercedes'),('motos','Motos'),('opel','Opel'),('peugeot','Peugeot'),('porsche','Porsche'),('volkswagen','Volkswagen');

#
# Structure for table "vehicle_sold"
#

DROP TABLE IF EXISTS `vehicle_sold`;
CREATE TABLE `vehicle_sold` (
  `client` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL,
  `model` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL,
  `plate` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL,
  `soldby` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL,
  `date` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

#
# Data for table "vehicle_sold"
#


#
# Structure for table "vehicles"
#

DROP TABLE IF EXISTS `vehicles`;
CREATE TABLE `vehicles` (
  `name` varchar(60) COLLATE utf8mb4_spanish_ci NOT NULL,
  `model` varchar(60) COLLATE utf8mb4_spanish_ci NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `imglink` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  PRIMARY KEY (`model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

#
# Data for table "vehicles"
#

INSERT INTO `vehicles` VALUES ('Audi 1','audi1',1,'audi','https://imgur.com/a/bZsrlV4'),('Audi 2','audi2',1,'audi','https://imgur.com/a/bZsrlV4'),('Audi 3','audi3',1,'audi','https://imgur.com/a/9rFsMsf'),('Audi 4','audi4',1,'audi',NULL),('Audi 5','audi5',1,'audi',NULL),('BMW 1 ','bmw1',1,'bmw',NULL),('BMW 2','bmw2',1,'bmw',NULL),('BMW 3','bmw3',1,'bmw',NULL),('Chevrolet 1','chevrolet1',1,'chevrolet',NULL),('Chevrolet 2','chevrolet2',1,'chevrolet',NULL),('Chevrolet 3','chevrolet3',1,'chevrolet',NULL),('Citroen 1','citroen1',1,'citroen',NULL),('Citroen 2','citroen2',1,'citroen',NULL),('Citroen 3','citroen3',1,'citroen',NULL),('Ferrari 1','ferrari1',1,'ferrari',NULL),('Ferrari 2','ferrari2',1,'ferrari',NULL),('Ferrari 3','ferrari3',1,'ferrari',NULL),('Ford 1','ford1',1,'ford',NULL),('Ford 2','ford2',1,'ford',NULL),('Ford 3','ford3',1,'ford',NULL),('Mclaren 1','mclaren1',1,'mclaren',NULL),('Mclaren 2','mclaren2',1,'mclaren',NULL),('Mclaren 3','mclaren3',1,'mclaren',NULL),('Mercedes 1','mercedes1',1,'mercedes',NULL),('Mercedes 2','mercedes2',1,'mercedes',NULL),('Mercedes 3','mercedes3',1,'mercedes',NULL),('Mercedes 4','mercedes4',1,'mercedes',NULL),('Moto 1','moto1',1,'motos',NULL),('Moto 2','moto2',1,'motos',NULL),('Moto 3','moto3',1,'motos',NULL),('Moto 4','moto4',1,'motos',NULL),('Moto 5','moto5',1,'motos',NULL);

#
# Structure for table "weashops"
#

DROP TABLE IF EXISTS `weashops`;
CREATE TABLE `weashops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zone` varchar(255) COLLATE utf8mb4_spanish_ci NOT NULL,
  `item` varchar(255) COLLATE utf8mb4_spanish_ci NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

#
# Data for table "weashops"
#

INSERT INTO `weashops` VALUES (1,'GunShop','WEAPON_PISTOL',300),(2,'BlackWeashop','WEAPON_PISTOL',500),(3,'GunShop','WEAPON_FLASHLIGHT',60),(4,'BlackWeashop','WEAPON_FLASHLIGHT',70),(5,'GunShop','WEAPON_MACHETE',90),(6,'BlackWeashop','WEAPON_MACHETE',110),(7,'GunShop','WEAPON_NIGHTSTICK',150),(8,'BlackWeashop','WEAPON_NIGHTSTICK',150),(9,'GunShop','WEAPON_BAT',100),(10,'BlackWeashop','WEAPON_BAT',100),(11,'GunShop','WEAPON_STUNGUN',50),(12,'BlackWeashop','WEAPON_STUNGUN',50),(13,'GunShop','WEAPON_MICROSMG',1400),(14,'BlackWeashop','WEAPON_MICROSMG',1700),(15,'GunShop','WEAPON_PUMPSHOTGUN',3400),(16,'BlackWeashop','WEAPON_PUMPSHOTGUN',3500),(17,'GunShop','WEAPON_ASSAULTRIFLE',10000),(18,'BlackWeashop','WEAPON_ASSAULTRIFLE',11000),(19,'GunShop','WEAPON_SPECIALCARBINE',15000),(20,'BlackWeashop','WEAPON_SPECIALCARBINE',16500),(21,'GunShop','WEAPON_SNIPERRIFLE',22000),(22,'BlackWeashop','WEAPON_SNIPERRIFLE',24000),(23,'GunShop','WEAPON_FIREWORK',18000),(24,'BlackWeashop','WEAPON_FIREWORK',20000),(25,'GunShop','WEAPON_GRENADE',500),(26,'BlackWeashop','WEAPON_GRENADE',650),(27,'GunShop','WEAPON_BZGAS',200),(28,'BlackWeashop','WEAPON_BZGAS',350),(29,'GunShop','WEAPON_FIREEXTINGUISHER',100),(30,'BlackWeashop','WEAPON_FIREEXTINGUISHER',100),(31,'GunShop','WEAPON_BALL',50),(32,'BlackWeashop','WEAPON_BALL',50),(33,'GunShop','WEAPON_SMOKEGRENADE',100),(34,'BlackWeashop','WEAPON_SMOKEGRENADE',100),(35,'BlackWeashop','WEAPON_APPISTOL',1100),(36,'BlackWeashop','WEAPON_CARBINERIFLE',12000),(37,'BlackWeashop','WEAPON_HEAVYSNIPER',30000),(38,'BlackWeashop','WEAPON_MINIGUN',45000),(39,'BlackWeashop','WEAPON_RAILGUN',50000),(40,'BlackWeashop','WEAPON_STICKYBOMB',500);

#
# Structure for table "whitelist"
#

DROP TABLE IF EXISTS `whitelist`;
CREATE TABLE `whitelist` (
  `identifier` varchar(70) COLLATE utf8mb4_spanish_ci NOT NULL,
  `last_connection` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ban_reason` text COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `ban_until` timestamp NULL DEFAULT NULL,
  `vip` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

#
# Data for table "whitelist"
#

