use testdb;

create table string_tbl
(char_fld char(30),
vchar_fld varchar(30),
text_fld text);

insert into string_tbl(char_fld,vchar_fld, text_fld)
values('this is char data',
'this is varchar data',
'this is text data');

select * from string_tbl ;

update string_tbl
set vchar_fld = 'this is a piece of extremely long varchar data';
# 너무 길어서 오류가 발생
#GUI에서 varchar(100)으로 수정했더니 적용됨

select * from string_tbl;


update string_tbl
set text_fld = 'This string didn\'t work, but it does now';

select text_fld from string_tbl;


select quote(text_fld)
from string_tbl;


delete from string_tbl;

insert into string_tbl(char_fld, vchar_fld, text_fld)
values('this string is 28 characters',
'this string is 28 characters',
'this string is 28 characters');

SELECT length(char_fld)	as char_length,
length(vchar_fld) as varchar_length,
length(text_fld) as text_length
FROM string_tbl;

select position('characters' in vchar_fld), vchar_fld
from string_tbl;

select locate('is', vchar_fld, 5), vchar_fld
from string_tbl;

select locate('is', vchar_fld, 1), vchar_fld
from string_tbl;

select locate('issss', vchar_fld, 1), vchar_fld
from string_tbl;
#찾는게 없으니까 0이 나온다


delete from string_tbl;

insert into string_tbl(vchar_fld)
values ('abcd'), ('xyz'),('QRSTUV'), ('qrstuv'), ('12345');

select vchar_fld from string_tbl order by vchar_fld;

select strcmp('text', 'text2'),
	strcmp('text2', 'text1'),
	strcmp('text', 'text');

use sakila;

select name, (name like '%y') as ends_in_y
from category;

select name, (name regexp 'y$') as ends_in_y
from category;


use testdb;
delete from string_tbl;

insert into string_tbl(text_fld)
values ('this string was 29 characters');

update string_tbl 
set text_fld = concat(text_fld, ', but now it is longer');
#기존에 있던 text_fld에 새로운 문자열을 concat 하겠다 ~

select text_fld from string_tbl;

use sakila;
select concat(first_name, ' ', last_name, ' has been a customer since ',
date(create_date)) as cust_narrative
from customer;


select insert('goodbye world', 9, 0, 'cruel ') as string;

select insert('goodbye world', 1, 7, 'hello') as string;
