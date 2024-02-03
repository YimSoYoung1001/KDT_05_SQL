# ------------------------------------------
# 2일차 과제 임소영
# ------------------------------------------

# 이해가 필요한 부분 => count(*)
# 확인할 부분 => 각 문제에서 요구하는걸 셀렉했는가

use sqlclass_db;    #어떤 데이터베이스를 쓸건지 써주어야 함!

desc nobel;

select * from nobel;

#1 1960년에 노벨상 물리학상 또는 노벨 평화상을 수상한 사람의 정보를 출력
select year, category, fullname
from nobel
#where category = 'Physics' or category = 'Peace';
WHERE YEAR = 196- AND (category = 'Physics' or category = 'Peace');


#2 Albert Einstein이 수상한 연도와 수상 분야(category),	출생대륙, 출생국가를 출력
select year, category, birth_continent, birth_country
from nobel
where fullname = 'Albert Einstein';


#3 1910년 부터 2010년까지 노벨 평화상 수상자 명단 출력 (연도 오름차순)
select year, fullname, birth_country
from nobel
#where year between 1910 and 2010      문제보면 노벨>>평화<<상임
WHERE category='Peace' and year between 1910 and 2010 
order by year asc;


#4 전체 테이블에서 수상자 이름이 ‘John’으로 시작하는 수상자 모두 출력
select category, fullname
from nobel
where fullname like 'John%';


#5 1964년 수상자 중에서 노벨화학상과 의학상(‘Physiology	or	Medicine’)을 제외한 
#  수상자의 모든 정보를 수상자 이름을 기준으로 오름차순으로 정렬 후 출력
select * from nobel
where year = 1964 and category not in ('Physiology or Medicine', 'Chemistry')
order by fullname asc;


#6 2000년부터 2019년까지 노벨 문학상 수상자 명단 출력
select year, fullname, gender, birth_country
from nobel
where (year between 2000 and 2019) and (category = 'Literature')
ORDER BY YEAR;
#정렬도 같이 해주었어야 했다


#7 각 분야별 역대 수상자의 수를 내림차순으로 정렬 후 출력(group by, order by)
#select category, count(*)         count의 괄호 안에 아스타리크만 들어가지는 않는다.
SELECT category, count(category)
from nobel
group by nobel.category
#order by count(*) desc;
order by count(category) desc;


#8-1 노벨 의학상이 있었던 연도를 모두 출력 (distinct 사용)
select distinct year 
from nobel as n
where category = 'Physiology or Medicine';


#8-2 노벨 의학상이 없었던 연도를 모두 출력 (distinct 사용)   => 해결 못함
select distinct(year)
from nobel n
where year 
	not in (select distinct YEAR
	NOT IN (SELECT year
	from nobel n
	where category = 'Physiology or Medicine');

#9 노벨 의학상이 없었던 연도의 총 회수를 출력 
select count(year)
from nobel n
where year 
	not in (select distinct year 
	from nobel n
	where category = 'Physiology or Medicine');

# 교수님 답
SELECT count(distinct year) as no_medicine_count FROM nobel
WHERE year not in (SELECT distinct year FROM nobel WHERE category = 'Physiology or Medicine');


#10 여성 노벨 수상자의 명단 출력
select fullname, category, birth_country
from nobel n
where gender = 'female';


#11 수상자들의 출생 국가별 횟수 출력
select birth_country,  count(*)
from nobel
group by nobel.birth_country; 


#12 수상자의 출생 국가가 ‘Korea’인 정보 모두 출력
select *
from nobel n
where birth_country = 'Korea';


#13 수상자의 출신 국가가 (‘Europe’, ‘North America’, 공백)이 아닌 모든 정보 출력
select *
from nobel n 
where birth_continent not in ('Europe', 'North America', '');


#14 수상자의 출신 국가별로 그룹화를 해서 수상 횟수가 10회 이상인 국가의 국가이름과 횟수를 출력하고 
#   국가별 수상횟수의 역순으로 출력
select birth_country, count(*)
from nobel n 
group by n.birth_country 
having count(*) >= 10
order by count(*) desc;


#15 2회 이상 수상자 중에서 fullname이 공백이 아닌 경우를 출력하는데, fullname의 오름차순으로 출력
# 이거는 왜 안되는 걸까????????????????????????????????????????????????????????????????
select fullname, count(*)
from nobel n
where fullname, count(*)
in (select fullname, count(*) 
	from nobel n 
	group by n.fullname having count(*) >= 2)
order by fullname asc;


# [방법1]
select fullname, count(*)
from nobel n
group by fullname having count(*) >=2 and fullname != ''
order by fullname asc;


# [방법2] : 공백인 거를 먼저 제하고 나서 그룹화하고 나서 출력을 했음
select fullname, count(*)
from nobel n
where fullname != ''
group by fullname having count(*) >= 2
order by fullname asc;