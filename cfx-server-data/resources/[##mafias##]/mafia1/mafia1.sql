INSERT INTO `addon_account` (name, label, shared) VALUES 
	('society_mafia1','mafia1',1)
;

INSERT INTO `datastore` (name, label, shared) VALUES 
	('society_mafia1','mafia1',1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES 
	('society_mafia1', 'mafia1', 1)
;

INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
('mafia1', 'Mafia 1', 1);


INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
('mafia1', 1, 'soldato', 'Recluta', 1500, '{}', '{}'),
('mafia1', 2, 'mafioso', 'Soldado', 2000, '{}', '{}'),
('mafia1', 3, 'consigliere', 'Sub-jefe de la mafia', 2500, '{}', '{}'),
('mafia1', 4, 'boss', 'Jefe de la mafia', 3000, '{}', '{}');
