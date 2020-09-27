CREATE DATABASE myweb;

SHOW DATABASES;

USE myweb;

SHOW TABLES;

SELECT * FROM wine;

SELECT * FROM boston;

--평균주택가격, 최저주택가격, 최고주택가격
-- 소수 둘째자리에서 반올림

SELECT round(AVG(target),2), MIN(target), MAX(target)
FROM boston;

--필드 추가
ALTER TABLE boston ADD target2 FLOAT;

SELECT * FROM boston;

SELECT AVG(target) FROM boston;
--target 필드값이 평균이상이면 target2를 1로
UPDATE boston SET target2=1
WHERE target >= 22.532806324110698;
--target 필드값이 평균미만이면 target2를 0으로
UPDATE boston SET target2=0
WHERE target <22.532806324110698;

SELECT COUNT(*) FROM boston;

SELECT target2,COUNT(*)
FROM boston
GROUP BY target2
ORDER BY target2;



SELECT * FROM diabetes;

--target2 필드 추가
ALTER TABLE diabetes ADD target2 int;
--target값이 평균 이상이면 target2에 1저장
--target값이 평균 미만이면 target2에 0 저장
SELECT AVG(target) FROM diabetes;

UPDATE diabetes SET target2=1
WHERE target >= 152.13348416289594;

UPDATE diabetes SET target2=0
WHERE target < 152.13348416289594;

SELECT * FROM diabetes;
--0,1 갯수 group by
SELECT target2,COUNT(*)
FROM diabetes
GROUP BY target2
ORDER BY target2;

SELECT COUNT(*) FROM diabetes;