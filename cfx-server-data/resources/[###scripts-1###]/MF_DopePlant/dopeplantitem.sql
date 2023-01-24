CREATE TABLE IF NOT EXISTS `dopeplants` (
  `owner` varchar(50) NOT NULL,
  `plant` longtext NOT NULL,
  `plantid` bigint(20) NOT NULL
);


INSERT INTO `items` (`name`,`label`,`limit`) VALUES
	('highgradefemaleseed', 'Female Dope Seed+', -1),
	('lowgradefemaleseed', 'Female Dope Seed', -1),
	('highgrademaleseed', 'Male Dope Seed+', -1),
	('lowgrademaleseed', 'Male Dope Seed', -1),
	('highgradefert', 'High-Grade Fertilizer', -1),
	('lowgradefert', 'Low-Grade Fertilizer', -1),
	('purifiedwater', 'Purified Water', -1),
	('wateringcan', 'Watering Can', -1),
	('plantpot', 'Plant Pot', -1),
	('trimmedweed', 'Trimmed Weed', -1),
	('dopebag', 'Ziplock Bag', -1),
	('bagofdope', 'Bag of Dope', -1),
	('drugscales', 'Drug Scales', -1);
