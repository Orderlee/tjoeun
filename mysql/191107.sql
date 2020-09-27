-- 새로운 데이터 베이스 만들기
CREATE DATABASE web;
-- 데이터베이스 목록
SHOW DATABASES;
-- 새로운 데이터베이스 만들기
CREATE DATABASE my_suppliers;
-- 작업할 데이터베이스 선택
USE my_suppliers;
--테이블이 존재하지 않으면 새로 만들기
--varchar(바이트) 가변사이즈 문자열
--CHAR(바이즈) 고정사이즈 문자열 
CREATE TABLE if NOT EXISTS suppliers(
supplier_name VARCHAR(20),
invoice_number VARCHAR(20),
part_number VARCHAR(20),
cost FLOAT,
purchase_date date
);
--테이블의 필드 목록 보기
DESCRIBE suppliers;
DESC suppliers;

DELETE FROM suppliers;
SELECT * FROM suppliers;

DROP TABLE POINT;

CREATE TABLE POINT ( 
 name VARCHAR(50),
 kor int,
 eng int,
 mat INT,
 total INT,
 average float
);
DESC POINT;
SELECT * FROM POINT;

SELECT * FROM POINT;
SELECT name,kor,eng,mat,kor+eng+mat total,round((kor+eng+mat)/3 ,1) average FROM POINT;

