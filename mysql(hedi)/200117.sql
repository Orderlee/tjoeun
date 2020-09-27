USE mydb;

desc t_emp;
DROP TABLE t_emp;
#필드명 자료형(사이즈)
CREATE TABLE t_emp(
id INT(5) NOT NULL,
NAME VARCHAR(25),
salary FLOAT,
phone VARCHAR(15),
dept_name VARCHAR(25)
);
SELECT * FROM t_emp;
#테이블 이름 수정
RENAME TABLE t_emp TO s_emp;
SELECT * FROM s_emp;
#레코드 입력
#insert into 테이블 values (필드순서대로 값 입력)
#insert into 테이블 (필드) values(값)
INSERT INTO s_emp VALUES (100,'이상헌',2000,'010-2222-3333','개발부');
INSERT INTO s_emp VALUES (200,'최순철',3000,'010-3333-3333','총무부');
INSERT INTO s_emp VALUES (300,'장혜숙',4000,'010-4444-3333','영업부');
#일부 값만 입력하고 싶을때
INSERT INTO s_emp (id,NAME) VALUES (400,'장미숙');

#필드 추가: 입사일자
#alter table 테이블 add 필드명 자로형;
ALTER TABLE s_emp ADD hire_date DATETIME;
SELECT * FROM s_emp;

#phone 필드의 사이즈를 20바이트로 변경
#lter table 테이블 modify 필드명 자로형(사이즈)
ALTER TABLE s_emp MODIFY phone VARCHAR(20);
DESC s_emp;

#필드 삭제 alter table 테이블 drop 필드명;
ALTER TABLE s_emp DROP dept_name;

DESC s_emp;

#필드 이름 수정
#alter table 테이블 change 변경전 변경후 자료형;
ALTER TABLE s_emp CHANGE id t_id INT;

#레코드 수정
#update 테이블 set 필드=값 where 조건
UPDATE s_emp SET hire_date=NOW() WHERE t_id=100;
UPDATE s_emp SET hire_date=NOW() WHERE t_id=200;
UPDATE s_emp SET hire_date=NOW() WHERE t_id=300;

#레코드 삭제
#delete from 테이블 where 조건
DELETE FROM s_emp WHERE t_id=200;
SELECT * FROM s_emp;

#백업 테이블 만들기
#create table 테이블이름 as select 명령어
#테이블이 복사됨(primary 키는 복사안됨)
CREATE TABLE emp2 AS SELECT * FROM emp;
SELECT * FROM emp2;
DESC emp2;

#문제
ALTER TABLE s_emp ADD mailid VARCHAR(10);
DESC s_emp;
ALTER TABLE s_emp MODIFY mailid VARCHAR(20);
ALTER TABLE s_emp CHANGE mailid e_mail VARCHAR(20);
RENAME TABLE s_emp TO t_emp;
DESC t_emp;
SELECT * FROM t_emp;

#제약조건이 없는 테이블
CREATE TABLE c_emp (
id INT,
NAME VARCHAR(25),
salary FLOAT,
phone VARCHAR(15),
dept_id INT
);

#제약조건 설정
CREATE TABLE c_emp (
id INT PRIMARY key,
NAME VARCHAR(25),
salary FLOAT,
phone VARCHAR(15),
dept_id INT
);

# 복합키 설정법
CREATE TABLE c_emp (
id INT,
NAME VARCHAR(25),
salary FLOAT,
phone VARCHAR(15),
dept_id INT
PRIMARY KEY(id,NAME)
);

#같은 id가 여러번 입력되는 문제점
INSERT INTO c_emp (id,NAME) VALUES (1,'김철수');
INSERT INTO c_emp (id,NAME) VALUES (1,'김기철');
INSERT INTO c_emp (id,NAME) VALUES (1,'김수철');
SELECT * FROM c_emp;
DELETE FROM c_emp;
#id에 primary key 제약조건 설정
ALTER TABLE c_emp ADD CONSTRAINT PRIMARY KEY(id);
#제약조건확인
SELECT * FROM information_schema.TABLE_CONSTRAINTS
WHERE TABLE_NAME='c_emp';

# foreign key 제약조건 
DROP TABLE emp2;
DROP TABLE dept2;
CREATE TABLE emp2 AS SELECT * FROM emp;
CREATE TABLE dept2 AS SELECT * FROM dept;

#존재하지 않는 부서코드가 입력되는 문제
insert INTO emp2 (empno,ename,deptno) VALUES (1,'kim',100);
SELECT * FROM emp2;
#join 할 때 문제가 발생함
SELECT ename,dname
FROM emp2 e, dept2 d
WHERE e.deptno=d.deptno;

#이 문제를 해결하기 위해 emp2 테이블에 foreign key 설정

# 잘못 추가한 레코드 삭제
DELETE FROM emp2 WHERE empno=1;
#foreign key로 설정하기 위해 먼저 primary key 설정을 해야 함
ALTER TABLE dept2 ADD CONSTRAINT primakry KEY (deptno);
ALTER TABLE emp2 ADD CONSTRAINT FOREIGN KEY(deptno)
REFERENCES dept2(deptno); 

INSERT INTO emp2 (empno,ename,deptno) VALUES (1,'kim',100);
INSERT INTO emp2 (empno,ename,deptno) VALUES (1,'kim',30);

SELECT ename,dname
FROM emp2 e, dept2 d
WHERE e.deptno=d.deptno;
























