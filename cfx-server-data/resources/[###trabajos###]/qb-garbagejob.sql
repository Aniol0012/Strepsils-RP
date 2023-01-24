INSERT INTO `jobs` (name, label) VALUES
	('garbage', 'Basurero')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('garbage',0,'employee','Empleado',800,'{}','{}'),
;

--For limit
INSERT INTO items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('metalscrap', 'Chatarra', 1, 0, 1);
INSERT INTO items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('plastic', 'Plastico', 1, 0, 1);
INSERT INTO items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('copper', 'Cobre', 1, 0, 1);
INSERT INTO items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('iron', 'Hierro', 1, 0, 1);
INSERT INTO items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('aluminum', 'Aluminio', 1, 0, 1);
INSERT INTO items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('steel', 'Acero', 1, 0, 1);
INSERT INTO items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('glass', 'Vidrio', 1, 0, 1);