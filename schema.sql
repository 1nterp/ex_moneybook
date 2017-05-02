drop database mydb;
create database mydb default character set utf8 default collate utf8_general_ci;
use mydb;

create table payment (
    id smallint AUTO_INCREMENT,
    name varchar(64),
    primary key (id)
);

create table mcat (
    id smallint AUTO_INCREMENT,
    name varchar(64),
    primary key (id)
);

create table scat (
    id smallint AUTO_INCREMENT,
    name varchar(64),
    mcat_id smallint,
    primary key (id),
    foreign key (mcat_id) references mcat(id)
);

create table item (
    id integer AUTO_INCREMENT,
    datetime date,
    mcat_id smallint,
    scat_id smallint,
    contents varchar(200),
    payment_id smallint,
    income float,
    outcome float,
    primary key (id),
    foreign key (mcat_id) references mcat(id),
    foreign key (scat_id) references scat(id),
    foreign key (payment_id) references payment(id)
);
