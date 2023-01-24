CREATE TABLE `tm1_permissions` (
  `Id` int(11) NOT NULL,
  `permissions` varchar(255) DEFAULT '{}'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `tm1_permissions` (`Id`, `permissions`) VALUES
(4, '{\"noclip\",\"godmode\",\"vanish\",\"tpoint\",\"jump\",\"openCar\",\"spectate\",\"spawnCar\",\"clearVehicle\",\"spawnPed\",\"spawnObject\",\"clearChat\",\"setJob\",\"clearInventory\",\"bring\",\"goto\",\"freeze\",\"heal\",\"kill\",\"kick\",\"eat\",\"announce\",\"fix\"}');

ALTER TABLE `tm1_permissions`
  ADD PRIMARY KEY (`Id`);

ALTER TABLE `tm1_permissions`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;