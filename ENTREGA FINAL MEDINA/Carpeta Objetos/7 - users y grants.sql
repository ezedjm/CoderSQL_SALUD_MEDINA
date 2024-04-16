SELECT User, Host FROM mysql.user;


create user Usuario1@localhost identified by 'Clave1';
create user Usuario2@localhost identified by 'Clave2';
create user Usuario3@localhost identified by 'Clave3';

GRANT SELECT ON db_salud_medina.patients TO 'usuario1'@'localhost';
GRANT SELECT ON db_salud_medina.doctors TO 'usuario1'@'localhost';
SHOW GRANTS FOR 'usuario1'@'localhost';

GRANT SELECT, INSERT, UPDATE, DELETE ON db_salud_medina.* TO 'usuario2'@'localhost';
SHOW GRANTS FOR 'usuario2'@'localhost';

GRANT SELECT, DELETE ON db_salud_medina.* TO 'usuario3'@'localhost';
SHOW GRANTS FOR 'usuario3'@'localhost';


SELECT user, host, Grant_priv, Create_priv, Drop_priv, Insert_priv, Update_priv, Delete_priv, Select_priv FROM mysql.user;
