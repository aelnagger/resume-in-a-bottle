PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE person(id int not null,
first_name varchar(100) not null,
last_name varchar(100) not null,
phone_number varchar(20) not null,
email varchar(100) not null);
CREATE TABLE "skill"(id int not null primary key,
person_id int not null, name varchar(100), description varchar(500));
CREATE TABLE "employer"(id int not null primary key, name varchar(100));
CREATE TABLE position(id int not null primary key);
COMMIT;
