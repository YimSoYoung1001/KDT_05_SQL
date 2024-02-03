# ----------------------------------------------
# 1번 문제
# ----------------------------------------------

show databases;

# 데이터 베이스 생성 및 사용
create database shoppingmall;

show databases;

use shoppingmall;

# 테이블 생성

drop table if exists user_table;

create table user_table
(userID char(8) not null,
userName varchar(10) not null,
birthYear INT not null,
addr char(2) not null,
mobile1 char(3),
mobile2 char(8),
height smallint,
mDate date,
constraint pk_user_table primary key (userID)
);

desc user_table;


# 테이블에 데이터 추가
insert into user_table 
values
('KDH', '강호동', 1970, '경북', '011', '22222222', 182, '2007-07-07'),
('KJD', '김제동', 1974, '경남', NULL, NULL, 173, '2013-03-03'),
('KKJ', '김국진', 1965, '서울', '019', '33333333', 171, '2009-09-09'),
('KYM', '김용만', 1967, '서울', '010', '44444444', 177, '2015-05-05'),
('LHJ', '이휘재', 1972, '경기', '011', '88888888', 180, '2006-04-04'),
('LKK', '이경규', 1960, '경남', '018', '99999999', 170, '2004-12-12'),
('NHS', '남희석', 1971, '충남', '016', '66666666', 180, '2017-04-04'),
('PSH', '박수홍', 1970, '서울', '010', '00000000', 183, '2012-05-05'),
('SDY', '신동엽', 1971, '경기', NULL, NULL, 176, '2008-10-10'),
('YJS', '유재석', 1972, '서울', '010', '11111111', 178, '2008-08-08');


select * from user_table;



# 테이블 생성

drop table if exists buy_table;

create table buy_table
(num INT not null,
userID char(8) not null,
prodName char(6) not null,
groupName char(4),
price INT not null,
amount smallint not null,
primary key(num));

set foreign_key_checks = 0;
alter table buy_table modify num int unsigned auto_increment;
set foreign_key_checks = 1;

desc buy_table;

# 테이블에 데이터 넣기
insert into buy_table 
values
(1, 'KHD', '운동화', NULL, 30, 2),
(2, 'KHD', '노트북', '전자', 1000, 1),
(3, 'KYM', '모니터', '전자', 200, 1),
(4, 'PSH', '모니터', '전자', 200, 5),
(5, 'KHD', '청바지', '의류', 50, 3),
(6, 'PSH', '메모리', '전자', 80, 10),
(7, 'KJD', '책', '서적', 15, 5),
(8, 'LHJ', '책', '서적', 15, 2),
(9, 'LHJ', '청바지', '의류', 50, 1),
(10, 'PSH', '운동화', NULL, 30, 2),
(11, 'LHJ', '책', '서적', 15, 1),
(12, 'PSH', '운동화', NULL, 30, 2)
;



select * from buy_table;



# ----------------------------------------------
# 2번 문제
# ----------------------------------------------


# 내부조인 =================================================> 근데 왜 엔티티에서 줄이 안그어질까?
select u.userId, b.prodName, u.addr 
from user_table as u inner join buy_table as b
on u.userID = b.userID;

# 컬럼명 추가
#alter table user_table 
#add column phonenum int;

# 2-1
select u.userName, b.prodName, u.addr, concat(mobile1, mobile2) as '연락처'
from user_table as u inner join buy_table as b
on u.userID = b.userID;


# 2-2
select u.userID, u.userName, b.prodName, u.addr, concat(mobile1, mobile2) as '연락처'
from user_table as u inner join buy_table as b
on u.userID = b.userID
where u.userID = 'KYM';

# 2-3
select u.userID, u.userName, b.prodName, u.addr, concat(mobile1, mobile2) as '연락처'
from user_table as u inner join buy_table as b
on u.userID = b.userID
order by userID;

# 2-4

# 2-5

