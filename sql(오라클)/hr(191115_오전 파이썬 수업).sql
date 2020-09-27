--myemp 테이블 제거
drop table myemp;
-- emp 테이블을 읽어서 myemp 테이블로 저장
-- 테이블의 구조 (스키마)와 데이터를 복사하는 방법(제약조건 제외)
-- primary key, not null
-- where 1=0 거짓이므로 데이터는 복사되지 않음
create table myemp as
select * from emp;
--where 1=0;

delete from myemp;
select * from myemp;
insert into myemp (empno) values (1);

desc emp;
desc myemp;
