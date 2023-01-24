CREATE TABLE `cas_vendercoche` (
  `seller` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `buyer` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `car` varchar(255) CHARACTER SET utf8 NOT NULL,
  `hour` varchar(255) CHARACTER SET utf8 NOT NULL,
  `price` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;