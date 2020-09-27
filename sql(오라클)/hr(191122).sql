select * from emp;
--null : 값이 입력되지 않은 상태
--0 : 0이라는 값이 입력된 상태
--null 과 연산하면 --> null
select ename,sal,comm,sal+comm from emp;
--커미션이 null인 사원들
select * from emp where comm is null ;
--커미션이 null이 아닌 사원들
select * from emp where comm <> null ;
select * from emp where comm is not null ;
--커미션이 null이면 봉급의 3% 적용
--nvl(A,B) A가 null이면 B, null이 아니면 A
select ename, job, sal, comm,sal+nvl(comm,sal*0.03)
from emp;

--부전공(deptno2) 가 null이면 '0'으로 표기
select studno,name,grade,deptno1,deptno2 from student;
select studno,name,grade,deptno1,nvl(deptno2,0)
from student;

-- decode (A,B, A와 B가 같을때의 값, 다를때의 값)
-- 함수에 전달되는 값의 갯수는 유동적
-- Trunc(실수) -->  소수 이하를 버림
select ename,sal,decode(trunc(sal/100), 0, 'E', 1, 'D',
 2, 'C', 3, 'B', 'A') 급여등급
from emp;

select * from dept;
-- 10 경리팀, 20 연구팀, 30 총무팀
select ename,deptno,decode(deptno,10,'경리팀', 20,'연구팀', 30, '총무팀') 부서명
from emp;

select * from department;
-- deptno 101 컴공, 102 멀티, 103 소공, 201 전자, 202 기계
select studno,name,deptno1,decode(deptno1, 101, '컴공', 102, '멀티', 103, '소공', 201, '전자', 202, '기계', '기타') 전공
from student; 


select * from score;
create table score(
student_no varchar2(20) primary key,
name varchar2(20) not null,
kor number(3) default 0,
eng number(3) default 0,
mat number(3) default 0
);

insert into score values ('1','kim',90,80,70);
insert into score values ('2','park',88,77,66);
insert into score values ('3','hong',95,84,54);
insert into score values ('4','choi',87,66,99);

select * from score;
commit;
--학번,이름,국어,영어,수학,총점,평균
-- round(값,소수이하자리수)
select student_no,name,kor,eng,mat,(kor+eng+mat) 총점, round((kor+eng+mat)/3,1) 평균,
decode(trunc(((kor+eng+mat)/3)/10), 10,'A',9,'A',8,'B',7,'C',6,'D','F') 등급
from score;
commit;

