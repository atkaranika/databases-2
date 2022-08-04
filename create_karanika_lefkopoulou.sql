create database eshop_db;
use eshop_db;

create table users (
username varchar(20) NOT NULL,
email varchar(30) NOT NULL,
mobile varchar(15) NOT NULL,
password varchar(20) NOT NULL,
PRIMARY KEY (username)
);
create table client (
first_name varchar(30) not null,
last_name varchar(30) not null,
username varchar(20) not null,
gender boolean not null,
PRIMARY KEY (username),
foreign key(username) references users(username) on delete cascade 
);
create table admin(
username varchar(20),
primary key(username),
foreign key(username) references users(username) on delete cascade
);

create table shop_info(
username varchar(20) NOT NULL,
town varchar(20) NOT NULL,
street varchar(30) NOT NULL,
paywith int NOT NULL,
primary key(username),
foreign key (username) references client(username) on delete cascade
);
CREATE TABLE clothes(
	id VARCHAR(25) PRIMARY KEY NOT NULL,
	kind VARCHAR(25) NOT NULL,
	color VARCHAR(25) NOT NULL,
	prize DOUBLE(6, 2) NOT NULL,
    active boolean NOT NULL
);
create table clothing_store(
	 id VARCHAR(25) NOT NULL,
	 size VARCHAR(10) NOT NULL,
	 pieces int NOT NULL,
	 PRIMARY KEY(id,size),
	 FOREIGN KEY (id) REFERENCES clothes(id) ON DELETE CASCADE
 );
CREATE VIEW active_clothes AS SELECT * FROM clothes WHERE active =1;

CREATE TABLE buy (
	buy_id  int NOT NULL AUTO_INCREMENT,
	buy_date varchar(30) NOT NULL,
	id VARCHAR(25) NOT NULL,
	username VARCHAR(20) NOT NULL,
	PRIMARY KEY (buy_id),
	FOREIGN KEY (username) REFERENCES users(username) ON DELETE cascade,
	foreign key(id) references clothes(id) ON DELETE no action
);
create user 'client'@'localhost' IDENTIFIED BY 'client';
GRANT SELECT ON eshop_db.clothes TO 'client'@'localhost';
GRANT SELECT,UPDATE ON eshop_db.clothing_store TO 'client'@'localhost';
GRANT SELECT,INSERT,DELETE ON eshop_db.buy TO 'client'@'localhost';
GRANT SELECT ON eshop_db.active_clothes TO 'client'@'localhost';
GRANT SELECT,DELETE,INSERT,UPDATE ON eshop_db.users TO 'client'@'localhost';
GRANT SELECT,DELETE,INSERT,UPDATE ON eshop_db.client TO 'client'@'localhost';
GRANT SELECT ON eshop_db.admin TO 'client'@'localhost';
GRANT SELECT,INSERT,UPDATE,DELETE ON eshop_db.shop_info TO 'client'@'localhost';
create user 'baseis2'@'localhost' IDENTIFIED BY 'baseis';
GRANT ALL PRIVILEGES ON eshop_db.* TO 'baseis2'@'localhost';

