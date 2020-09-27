#create or replace view 뷰이름 as select 명령어
CREATE OR REPLACE VIEW test_view AS
SELECT empno,ename,job,sal,deptno
FROM emp;
#뷰를 테이블처럼 사용할 수 있음
SELECT * FROM test_view;
#뷰 제거
DROP VIEW test_view;

#뷰 생성
CREATE OR REPLACE VIEW test_view AS
SELECT empno,ename,e.deptno,dname
FROM emp e, dept d
WHERE e.deptno=d.deptno;

SELECT * FROM test_view;
#테이블,뷰의 목록
SHOW TABLES;

#조인한 테이블에는 inset가 되지 않음(에러발생)
INSERT INTO test_view VALUES (1000,'김철수',20,'연구팀');

CREATE OR REPLACE VIEW emp_v AS
SELECT empno,ename,hiredate,sal FROM emp;

SHOW TABLES; #테이블, 뷰의 목록
DESC emp_v; #필드 정보

SELECT * FROM emp_v;
#뷰를 통해 레코드 입력도 가능하지만
#주용도는 select 명령어
INSERT INTO emp_v VALUES (1000,'이민석','2020-01-01',500);
DELETE FROM emp_v WHERE empno=1000;
SELECT * FROM emp_v;

#색인 p.59

#explain sql명령어 : 실행계획 확인
explain
SELECT empno,ename FROM emp WHERE empno=7900;

EXPLAIN
SELECT empno,ename FROM emp WHERE ename='송기성';

#ename 필드에 인덱스 추가
#create index 인덱스 이름 on테이블(필드명)
CREATE INDEX emp_ename_idx ON emp(ename);

EXPLAIN
SELECT empno,ename FROM emp WHERE ename='송기성';
#인덱스 제거
ALTER TABLE emp DROP INDEX emp_ename_idx;


CREATE TABLE emp3(
NO INT,
NAME VARCHAR(10),
sal INT
);

#저장 프로시저 만들기
#테스트용 레코드 1만건 입력
# $$ : 구분자
delimiter $$
DROP PROCEDURE if EXISTS data_insert$$
CREATE PROCEDURE data_insert()
BEGIN
DECLARE i INT DEFAULT 1; #변수 선언
DECLARE NAME VARCHAR(50) DEFAULT'';
DECLARE sal INT DEFAULT 0;
while i <=10000 DO
SET NAME ='kim'; #set 변수=값
SET sal=500;
if i MOD 2 = 0 then # a mod b a를 b로 나눈 나머지
SET NAME=CONCAT('kim',i); # concat(a,b) a와 b 연결
SET sal=300;
ELSEIF i MOD 3=0 then
SET NAME=CONCAT('park',i);
SET sal=400;
ELSEIF i MOD 5 = 0 then
SET NAME=CONCAT('hong',i);
SET sal=500;
ELSE
SET NAME=CONCAT('shin',i);
SET sal=250;
END if;
INSERT INTO emp3 VALUES (i,NAME,sal);
SET i =i+1; #카운트 증가
END while; #while의 끝
END$$
delimiter $$
#call 프로시저이름()
CALL data_insert();

SELECT COUNT(*) FROM emp3;

explain
SELECT * FROM emp3 WHERE NAME='shin691' AND sal>200;

#인덱스 추가
CREATE INDEX emp_name_idx ON emp3(NAME,sal);

EXPLAIN
SELECT * FROM emp3 WHERE NAME='shin691' AND sal > 200;

ALTER TABLE emp3 DROP INDEX emp_name_idx;


USE ontime;
SELECT COUNT(*) FROM ontime;

DESC ontime;

SELECT * FROM information_schema.table_constraints
WHERE TABLE_NAME='ontime';
#인덱스 추가
CREATE INDEX YEAR ON ontime(YEAR);
CREATE INDEX MONTH ON ontime(MONTH);
CREATE INDEX DAYOFMONTH ON ontime(DAYOFMONTH);
#실행계획 보기
EXPLAIN
SELECT YEAR, MONTH,DAYOFMONTH,DISTANCE,depdelay
FROM ontime
WHERE MONTH=12 AND DAYOFMONTH=31;

ALTER TABLE ontime DROP INDEX YEAR;
ALTER TABLE ontime DROP INDEX MONTH;
ALTER TABLE ontime DROP INDEX DAYOFMONTH;

#일련번호
use mydb;

SELECT * FROM c_emp;
DROP TABLE c_emp;
# auto_increment 자동증가필드(일련번호),
# primary key와 같이 사용해야 함
CREATE TABLE c_emp(
id INT AUTO_INCREMENT PRIMARY key,
NAME VARCHAR(25),
salary FLOAT,
phone VARCHAR(15),
dept_id INT
);
INSERT INTO c_emp (NAME) VALUES ('kim1');
INSERT INTO c_emp (NAME) VALUES ('kim2');
INSERT INTO c_emp (NAME) VALUES ('kim3');
SELECT * FROM c_emp;
DELETE FROM c_emp;

SELECT MAX(id) FROM c_emp;
SELECT MAX(id)+1 FROM c_emp;
#ifnull(A,B) A가 null이면 B
SELECT ifnull(MAX(id)+1,1) FROM c_emp;

INSERT INTO c_emp (id,NAME) VALUES 
((SELECT ifnull(MAX(id)+1,1) FROM c_emp a),'kim1');

INSERT INTO c_emp (id,NAME) VALUES 
((SELECT ifnull(MAX(id)+1,1) FROM c_emp a),'kim2');

INSERT INTO c_emp (id,NAME) VALUES 
((SELECT ifnull(MAX(id)+1,1) FROM c_emp a),'kim3');

SELECT * FROM c_emp;



