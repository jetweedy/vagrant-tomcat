CREATE DATABASE mydb;
CREATE USER mydb IDENTIFIED BY 'mydb';
GRANT ALL PRIVILEGES ON mydb.* TO mydb;

USE mydb;
CREATE TABLE thetable (id int not null auto_increment primary key, label varchar(50));
INSERT INTO thetable (label) VALUES ('Label 1');
INSERT INTO thetable (label) VALUES ('Label 2');
INSERT INTO thetable (label) VALUES ('Label 3');

