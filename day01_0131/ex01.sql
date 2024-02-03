show databases;

use sakila;

select now();
	
create database testdb;
use testdb;

drop table if exists person;

create table person
	(person_id smallint unsigned,
	fname VARCHAR(20),
	lname VARCHAR(20),
	eye_color ENUM('BR', 'BL', 'GR'),
	birth_date DATE,
	street VARCHAR(30),
	city VARCHAR(20),
	state VARCHAR(20),
	country VARCHAR(20),
	postal_code VARCHAR(20),
	constraint pk_person primary key (person_id)
	);
	
desc person;

drop table if exists favorite_food;

create table favorite_food
(person_id smallint unsigned,
food varchar(20),
constraint pk_favorite_food primary key (person_id, food),
constraint fk_fav_food_person_id foreign key (person_id) references person(person_id)
);

insert into person (person_id, fname, lname, eye_color, birth_date,
street, city, state, country, postal_code)
values(null, 'Susan', 'Smith', 'BL', '1975-11-02',
'23 Maple St.', 'Arlington', 'VA', 'USA', '20220');

select person_id, fname, lname, birth_date from person;


desc favorite_food;

set foreign_key_checks = 0;  #제약조건 비활성화
alter table person modify person_id smallint unsigned auto_increment;
#자동으로 숫자가 증가한다.
set foreign_key_checks = 1;  #제약조건 활성화

desc person;

insert into person(person_id, fname, lname, eye_color, birth_date)
values(null, 'William', 'Turner', 'BR', '1972-05-27');

select * from person;

select person_id, fname, lname, birth_date from person;

select person_id, fname, lname, birth_date from person where fname = 'William';

insert into favorite_food(person_id, food)
values(1, 'pizza'),
	(1, 'cookie'),
	(1, 'nachos');
	
select food from favorite_food
where person_id = 1 order by food;

update person 
set street = '1225 Tremon St,',
city = 'Boston',
state = 'MA',
country = 'USA',
postal_code = '01238'
where person_id = 1 ;

select * from person;

delete from person where person_id = 2;

select * from person;
#위에 올라가서 susan 부분만 다시 만들어주면 2가 생겨남

insert into favorite_food(person_id, food) values(3, 'lasagna');

insert into person (person_id, fname, lname) values(3, 'kevin', 'kern');
insert into person(person_id, fname, lname) values(null, 'kevin', 'kern');
select * from person;

insert into favorite_food(person_id, food) values(3, 'lasagna');
select * from favorite_food;

update person set birth_date = str_to_date('DEC-12-1980', '%b-%d-%Y')
where person_id = 1;


#df