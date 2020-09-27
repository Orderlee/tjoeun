select * from emp;
select * from dept;

select empno,ename,dname
from emp e, dept d --join 할 테이블
where e.deptno=d.deptno; --join 조건
-- cross join 
select empno,ename,dname
from emp e, dept d;

select * from emp;
select empno,ename,job,mgr from emp;

--self join
select a.empno 사번, a.ename 이름, b.empno 부서장사번, b.ename 부서장이름
from emp a, emp b --같은 테이블을 join (self join)
where a.mgr=b.empno;

select studno, name, profno from student;
--교수 테이블
select * from professor;
-- 지도교수가 미배정인 학생들은 제외됨
select studno 학번, s.name 학생이름, p.name 지도교수이름
from student s, professor p
where s.profno=p.profno;

-- 지도교수가 미배정인 학생들도 출력
-- 외부join outer join
select studno 학번, s.name 학생이름, p.name 지도교수이름
from student s, professor p
where s.profno=p.profno(+);

--상품 테이블
select * from product;
--판매 테이블
select * from product_sales;
-- 상품 1개 추가
insert into product values 
('A4','아이패드',150000,'애플','2019-06-01');
--상품 테이블
select * from product;
--판매 테이블
select * from product_sales;
-- join(inner join,equi join, a4상품은 누락됨)
select p.product_code,product_name,price,amount,price*amount
from product p, product_sales s
where p.product_code=s.product_code;
--outer join, 누락되었던 A4상품도 표시됨
select p.product_code,product_name,price,amount,price*amount
from product p, product_sales s
where p.product_code=s.product_code(+);


--점수 테이블
select * from point;
select * from student;
-- 학생 테이블의 레코드 갯수20, 점수 테이블의 레코드 갯수3
-- 내부조인에서는 양쪽 테이블의 일치하는 자료만 표시됨
select s.studno, name, kor,eng,mat
from student s, point p
where s.studno=p.studno;
--점수가 없는 학생도 다 출력되도록 하려면?
--자료가 없는 테이블쪽에 (+)
select s.studno, name, kor,eng,mat
from student s, point p
where s.studno=p.studno(+);

--부서 테이블
select * from dept;
--직원 테이블
select * from emp;
-- 사번, 이름, 부서명
select empno, ename, dname
from emp e, dept d
where e.deptno=d.deptno;
-- 전산팀도 나오게 하려면?
select empno, ename, dname
from emp e, dept d
where e.deptno(+)=d.deptno
order by dname,ename;

select * from department;
-- 학과코드, 학과명, 학생이름
select deptno,dname,name
from department d, student s
where d.deptno=s.deptno1;
--학생이 없는 학과도 출력되게 하려면?
--자료가 없는 쪽에 (+)
select deptno,dname,name
from department d, student s
where d.deptno=s.deptno1(+);

--자료가 없는 쪽을 기준으로
--left outer join
--right outer join
--full outer join

--지도교수 미배정 학생도 출력
select * from student;
select studno, s.name, p.name
from student s, professor p
where s.profno=p.profno(+);

--지도하는 학생이 없는 교수도 출력
select * from professor;
select studno, s.name, p.name
from student s, professor p
where s.profno(+)=p.profno;

-- full outer join
-- A union B 합집합 : 중복값 제거
-- A union all B 합집합 : 중복값 포함

--full outer join:(+)를 양쪽에 쓸 수 없으므로 union 합집합 사용

select studno, s.name, p.name
from student s, professor p
where s.profno=p.profno(+)
union
select studno, s.name, p.name
from student s, professor p
where s.profno(+)=p.profno;

--ANSI SQL 내부조인 inner join
select empno, ename, dname
from emp e join dept d 
 on e.deptno=d.deptno;

select name, dname
from student s, department d
where s.deptno1=d.deptno;

--ANSI join으로 변경 (컴머를 join으로 , where를 on으로)
select name, dname
from student s join department d
    on s.deptno1=d.deptno;
    
--4학년 학생들의 이름, 학과명
select name, dname
from student s, department d
where s.deptno1 = d.deptno and grade=4;
--ANSI join으로 변경
select name, dname
from student s join department d
    on s.deptno1 = deptno --> 조인 조건
where grade=4; --> 일반적인 조건

--직급이 '사원'인 직원들의 이름, 부서이름
select ename, dname
from emp e, dept d
where e.deptno = d.deptno 
and job='사원';


--위 명령어를 ANSI join으로 변경
select ename, dname
from emp e join dept d
on e.deptno = d.deptno  --join을 위한 조건
where job='사원'; --일반적인 조건

-- 자료가 없는 쪽을 기준으로 함
-- A left outer join B: A에는 자료가 있고 B에는 없는 경우
-- A right outer join B: B에는 자료가 있고 A에는 없는 경우
-- A full outer join B: left8+right

-- 지도교수가 배정되지 않은 학생도 포함된 join(left outer join)
select s.name, p.name
from student s, professor p
where s.profno=p.profno(+);

select s.name, p.name
from student s left outer join professor p
    on s.profno = p.profno;
    
select s.name, p.name
from  professor p right outer join  student s
    on s.profno = p.profno;    
    
-- 지도하는 학생이 없는 교수도 출력
select s.name, p.name
from student s, professor p 
where s.profno(+)=p.profno;
    
select s.name, p.name
from student s right outer join professor p
on s.profno=p.profno;

--지도교수가 배정되지 않은 학생과 지도하는 학생이 없는 교수도 출력
--full outer join
select s.name, p.name
from student s full outer join professor p
on s.profno=p.profno;
    
    
    
    