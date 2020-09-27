CREATE DATABASE pyweb;

USE pyweb;

SHOW DATABASES;

DESC board_board;

SELECT * FROM auth_user;
SELECT * FROM board_board;

USE pyweb;

SELECT * FROM board_board;

SELECT * FROM board_comment;

USE web;
SHOW TABLES;
SELECT * FROM iris;
SELECT COUNT(*) FROM iris;

--필드별 평균값
SELECT ROUND(
AVG(sepal_length),2)
,round(AVG(sepal_width),2)
,round(AVG(petal_length),2),
round(AVG(petal_width),2)
FROM iris;
--품종별 필드 평균값
SELECT target,AVG(sepal_length),AVG(sepal_width),
AVG(petal_length),AVG(petal_width)
FROM iris
GROUP BY target;