

INSERT INTO `addon_account` (name, label, shared) VALUES
  ('society_weazelnews','Reportero',1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
  ('society_weazelnews','Reportero',1)
;

INSERT INTO `jobs` (name, label) VALUES
  ('weazelnews','Reportero')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  ('weazelnews',0,'recrue','Empleado',800,'{}','{}'),
  ('weazelnews',1,'boss','Jefe',1500,'{}','{}')
;