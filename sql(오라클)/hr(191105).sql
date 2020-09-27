select * from emp;
select * from dept;

select ename,e.deptno,dname
from emp e,dept d --join 할 테이블
where e.deptno=d.deptno; --join 조건, 테이블,필드명

-- deptno1 제1전공코드
select * from student;
-- deptno 학과코드, dname 학과명
select * from department;

select s.name,s.deptno1,d.dname
from student s, department d--join할 테이블들
where s.deptno1=d.deptno; --join 조건

--학번,이름 지도교수이름
--studno 학번, name 이름, profeno 지도교수사번
select * from student;
--profono 교수사번, name 교수명
select * from professor;
--테이블 이름, 필드이름
select s.studno 학번,s.name 학생이름,p.name 교수이름
from student s, professor p
where s.profno=p.profno;

--p_code 상품코드, p_name 상품이름, p_price 가격
select * from product;
--p_code 상품코드, p_qty 수량
select * from panmae;

--상품코드,상품이름,가격,수량,판매금액(가격x수량)
select a.p_code 상품코드, a.p_price 가격, b.p_qty 수량, p_price*p_qty  판매금액
from product a, panmae b
where a.p_code=b.p_code;



drop table product;

-- 테이블 만들기
-- varchar2 가변사이즈 문자열, char 고정사이즈 문자열
-- not null 널을 허용하지 않음 (필수 입력)
-- primary key (주키,기본키)레코드의 식별자(중복될 수 없음)
-- default 기본값

create table product(
product_code varchar2(20) not null primary key,
product_name varchar2(50) not null,
price number default 0,
company varchar2(50),
make_date date default sysdate
);
-- 레코드 입력
-- insert into 테이블 values (값1,값2...)
-- sql에서는 문자열, 날짜는 작음따옴표로 감싸고 숫자는 따옴표를 쓰지 않음
insert into product values
('A1','아이폰',900000,'애플','2019-03-01');
insert into product values
('A2','갤럭시노트',1000000,'삼성','2019-04-01');
insert into product values
('A3','갤럭시탭',1100000,'삼성','2019-05-01');

select * from product;
--판매 테이블
create table product_sales(
product_code varchar2(20) not null,
amount number default 0
);

insert into product_sales values ('A1',20);
insert into product_sales values ('A2',30);
insert into product_sales values ('A3',40);


select * from product_sales;
select * from product;
--상품코드,상품이름,제조사,제조일자,단가,판매수량,판매금액(price*amount)
select  a.product_code 상품코드, product_name 상품이름, company 제조사, 
make_date 제조일자, price 단가, amount 판매수량, price*amount 판매금액
from product a, product_sales b -- join 할 테이블
where a.product_code = b.product_code; --join 조건

--서브쿼리
select empno,ename,(select dname from dept where deptno=e.deptno)
from emp e;

select * from student;
--점수 테이블 
create table point (
studno number,
kor number,
eng number,
mat number
);
insert into point values (9411,80,90,100);
insert into point values (9412,85,95,75);
insert into point values (9413,82,93,67);
select * from point;
-- 학번, 이름,국어,영어,수학,총점,평균 (student와 point join)

select s.studno 학번, name 이름, kor 국어, eng 영어, mat 수학, 
kor+eng+mat 총점, round((kor+eng+mat)/3,1) 평균
from student s, point p --join 할 테이블
where s.studno = p.studno; --join 조건



commit;

-- 시험문제
select * from emp;
select * from dept;

select empno 사원번호, ename 사원이름, sal 월급여, nvl(comm,0) 보너스, (sal*12+nvl(comm,0)) 연봉, e.deptno 부서코드
from emp e, dept d
where e.deptno = d.deptno;












