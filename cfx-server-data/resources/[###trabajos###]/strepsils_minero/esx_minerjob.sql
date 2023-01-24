INSERT INTO `jobs` (name, label) VALUES
	('miner', 'Minero')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('miner', 0, 'employee', 'Empleado', 0, '{}', '{}')
;

INSERT INTO `items` (`name`, `label`, `limit`) VALUES
	('stones', 'Piedras', 40),
	('washedstones', 'Piedras lavadas', 40),
	('diamond', 'Diamantes', 100),
	('gold', 'Lingote de Oro', 100),
	('iron', 'Hierro', 100),
	('copper', 'Cobre', 100)
;
