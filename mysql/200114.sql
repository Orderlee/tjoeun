USE mydb;

SELECT * FROM student;
SELECT * FROM department;
SELECT * FROM professor;
SELECT NAME, s.deptno1, dname
FROM student s, department d #조인할 테이블들
WHERE s.deptno1=d.deptno; #조인 조건
 
 #학번,학생이름,학과명,지도교수명
SELECT studno,s.NAME 학생이름, dname 학과명, p.name 지도교수명
FROM student s, department d, professor p
WHERE s.deptno1=d.deptno AND s.profno=p.profno; #조인 조건
 
#오라클에서만 동작함, 에러 남
SELECT studno,s.NAME 학생이름, dname 학과명, p.name 지도교수명
FROM student s, department d, professor p
WHERE s.deptno1=d.deptno AND s.profno=p.profno(+);

#지도교수 배정이 되지 않은 학생 5명은 누락됨
#outer join은 ANSI  SQL로 작성해야 함
# A join B on 조인조건 => inner join(내부조인)
# A left outer join B : A 모든 자료
# A Right outer join B : B 모든 자료
# A Full outer join B : A,B 모든 자료
SELECT studno, s.NAME 학생이름, dname 학과명, p.name 지도교수명
FROM student s join department d 
ON s.deptno1=d.deptno
LEFT OUTER join professor p 
ON s.profno=p.profno;
 

SELECT * FROM emp;
select * FROM dept;
SELECT empno,e.deptno,dname
FROM emp e, dept d
WHERE e.deptno=d.deptno;

SELECT empno,e.deptno,dname
FROM emp e INNER JOIN dept d #조인 테이블
ON e.deptno=d.deptno; #조건

SELECT s.name sname, p.name pname
FROM student s, professor p
WHERE s.profno=p.profno;

#ansi join
SELECT s.name sname, p.name pname
FROM student s join professor p
on s.profno=p.profno;

#left outer join
SELECT s.name sname, p.name pname
FROM student s LEFT OUTER JOIN professor p
ON s.profno=p.profno;

SELECT * FROM professor;

#left outer join
SELECT s.name sname, p.name pname
FROM student s LEFT OUTER JOIN professor p ON s.profno=p.profno;

#right outer join
SELECT s.name sname, p.name pname
FROM student s RIGHT OUTER JOIN professor p ON s.profno=p.profno;

#MySQL에서는 full outer join 지원안해줌
SELECT s.name sname, p.name pname
FROM student s FULL OUTER JOIN professor p
ON s.profno=p.profno;

#full outer join
SELECT s.name sname, p.name pname
FROM student s LEFT OUTER JOIN professor p ON s.profno=p.profno

UNION all

SELECT s.name sname, p.name pname
FROM student s RIGHT OUTER JOIN professor p ON s.profno=p.profno;

#학생,학과
SELECT studno,NAME,dname
FROM student s, department d
WHERE s.deptno1=d.deptno;

#ansi join(inner join)
SELECT studno, NAME, dname
FROM student s JOIN department d
ON s.deptno1=d.deptno;

#ansi join(left outer join)
#학번이 9411인 학생의 학과코드 지움
UPDATE student SET deptno1=NULL WHERE studno=9411;

SELECT studno,NAME,dname
FROM student s LEFT OUTER JOIN department d
ON s.deptno1= d.deptno;

#ansi join(right outer join) -학생이 배정되지 않은 학과도 출력 됨
SELECT studno,NAME,dname
FROM student s RIGHT OUTER JOIN department d
ON s.deptno1=d.deptno;

#ansi join(full outer join)
SELECT studno,NAME,dname
FROM student s LEFT OUTER JOIN department d
ON s.deptno1=d.deptno
UNION all
SELECT studno,NAME,dname
FROM student s RIGHT OUTER JOIN department d
ON s.deptno1=d.deptno;

SELECT COUNT(*) FROM department;

SELECT studno,NAME,dname
FROM student s, department d
WHERE s.deptno1=d.deptno;

SELECT * 
FROM 
emp
WHERE empno=7369;

SELECT * FROM emp WHERE empno=7902;

#self join
SELECT a.empno 사번, a.ename 이름, b.empno 매니저사번, b.ename 매니저
FROM emp a, emp b
WHERE a.mgr=b.empno;

SELECT 사원.empno 사번, 사원.ename 이름, 관리자.empno 매니저사번, 관리자.ename 매니저
FROM emp 사원, emp 관리자
WHERE 사원.mgr=관리자.empno;

#실습32p
#상품테이블
DROP TABLE product;
CREATE TABLE product(
product_code VARCHAR(20) NOT NULL PRIMARY KEY,
product_name VARCHAR(50) NOT NULL,
price INT DEFAULT 0, #기본값
company VARCHAR(50),
make_date DATETIME DEFAULT NOW() #기본값 :  현재시각
);

INSERT INTO product
VALUES('A1','아이폰',900000, '애플','2019-03-01');
INSERT INTO product
VALUES('A2','갤럭시노트',1000000, '삼성','2019-03-01');
INSERT INTO product
VALUES('A3','갤럭시탭',11000000, '삼성','2019-05-01');
SELECT * FROM product;

#판매 테이블
DROP TABLE product_sales;
CREATE TABLE product_sales(
product_code VARCHAR(20) NOT NULL,
amount INT DEFAULT 0
);

INSERT INTO product_sales VALUES('A1',100);
INSERT INTO product_sales VALUES('A2',200);
INSERT INTO product_sales VALUES('A3',300);
SELECT * FROM product_sales;

#상품코드,상품이름,제조사,단가,수량,금액,제조일자
SELECT p.product_code, product_name,company,price,amount,
price*amount money, make_date
FROM product p, product_sales s
WHERE p.product_code=s.product_code;

#ansi join
SELECT p.product_code, product_name,company,price,amount,
price*amount money, make_date
FROM product p join product_sales s
on p.product_code=s.product_code;

#create or replace view 뷰이름 as select 명령어;
CREATE OR REPLACE VIEW product_sales_v
AS
SELECT p.product_code, product_name,company,price,amount,
price*amount money, make_date
FROM product p, product_sales s
WHERE p.product_code=s.product_code;

SELECT * FROM product_sales_v
WHERE company='삼성';

#name 필드가 중복되어 에러 발생, alias로 구분해야 함
CREATE OR REPLACE VIEW student_v
as
SELECT studno,s.NAME 학생이름, dname 학과명, p.name 지도교수명
FROM student s, department d, professor p
WHERE s.deptno1=d.deptno AND s.profno=p.profno;

#dlias를 추가한 코드
CREATE OR REPLACE VIEW student_v
AS
SELECT studno,s.name sname ,dname,p.name pname
FROM student s, department d, professor p
WHERE s.deptno1=d.deptno AND s.profno=p.profno;
#뷰를 테이블처럼 하용할 수 있음
SELECT * FROM student_v;