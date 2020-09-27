select top 10* from ontime;

--테이블 목록
select * from information_schema.tables;
-- ontime 테이블의 필드 구조 (스키마)
select * from information_schema.columns
where table_name ='ontime';

update ontime set depdelay=0 where depdelay='NA';
update ontime set arrdelay=0 where arrdelay='NA';
--인덱스 만들기
--create index 인덱스이름on 테이블이름(필드명)
create index year on ontime(year);
create index month on ontime(year,month);
create index day on ontime(year,month,dayofmonth);


create index carrier_code on carriers(code);

--cast(필드 as 자료형) 임시로 자료형을 바꿈
select uniquecarrier, avg(cast(depdelay as int))
from ontime
group by uniquecarrier;
--항공사 이름이 나오도록 조인
select year, uniquecarrier,description,
avg(cast(depdelay as int))
from ontime a, carriers c
where a.uniquecarrier=c.code
group by year, a.uniquecarrier,description
order by year, a.uniquecarrier,description;

select * from carriers;
select top 5* from ontime;

--평균출발지연시간
select avg(cast(depdelay as int))
from ontime;

select avg(sal) from emp;
select avg(*) from emp;
-- * star,애스터리스크 모든 필드
select ename,sal from emp;
select * from emp;
select count(comm) from emp;
select count(*) from emp;