--case when 조건 then 값            else       end
select name, position,
case when position ='정교수' then (pay+nvl(bonus,0))*1.1
when position ='조교수' then (pay+nvl(bonus,0))*1.07
when position = '전임강사' then (pay+nvl(bonus,0))*1.05
else pay+nvl(bonus,0)
end 급여
from professor
order by 3 desc; --sql은 1번 부터 시작 as가 없으면 번호로 적어도 됨

select * from dept;
-- 10 경리팀, 20 연구팀, 30 총무팀, 40 전산팀
create or replace view emp2_v as
select empno,ename,deptno,
case when deptno = 10 then '경리팀'
when deptno = 20 then '연구팀'
when deptno = 30 then '총무팀'
when deptno = 40 then '전산팀'
end 부서명
from emp
order by ename; --네번째 필드를 기준으로 오름차순 정렬
--sql에서는 필드 인덱스가 1부터
select * from emp2_v;


create or replace view score_v as
select name, kor, eng, mat, kor+eng+mat 총점,
round((kor+eng+mat)/3,2) 평균,
case 
when (kor+eng+mat)/3 >= 90 then 'A'
when (kor+eng+mat)/3 >= 80 then 'B'
when (kor+eng+mat)/3 >= 70 then 'C'
when (kor+eng+mat)/3 >= 60 then 'D'
else 'F'
end 등급
from score;

select * from score_v;
--동률순위 처리
select deptno,ename,sal,rank() over(order by sal desc) 순위
from emp;
-- 동률순위의 다음 순위를 +1로 처리
select deptno,ename,sal,dense_rank() over (order by sal desc) 순위
from emp;


-- PL/SQL --
-- create or replace procedure 프로시저이름(매개변수)
-- in 입력매개변수, out 출력매개변수
create or replace procedure update_sal(v_empno in number)
is --프로시저 안에서 사용할 지역변수 선언
begin
update emp
set sal=sal*1.1
where empno=v_empno;
end;
/
select * from emp;
--7369 200
-- execute 프로시저이름(전달할값)
execute update_sal(7369);


--사원 테이블 복사
create table emp_copy as select * from emp;
select * from emp_copy;
--사원 테이블의 커미션comm 
create or replace procedure update_comm(v_empno in number, v_comm in number)
is
begin
update emp_copy
set comm=v_comm where empno=v_empno;
end;
/
select * from emp_copy;
execute update_comm(7369,500);
select * from emp_copy;
commit;






