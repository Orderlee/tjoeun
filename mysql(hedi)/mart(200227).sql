USE myweb;

SELECT * FROM gs25 LIMIT 100;
SELECT COUNT(*) FROM gs25;

SELECT * FROM temperature LIMIT 100;
SELECT COUNT(*) FROM temperature;

#전처리 작업
DESCRIBE gs25;
# char, varchar, text
# char - 고정사이즈
# varchar - 가변사이즈
# text - 대용량 텍스트(검색속도가 느린 단점)

#인덱스 추가(검색속도 개선 목적)
#alter table 테이블 add index 인덱스이름(필드명)
ALTER TABLE gs25 ADD INDEX gs25_tm (tm);
ALTER TABLE gs25 ADD INDEX gs25_gu (gu);
ALTER TABLE temperature ADD INDEX temperature_tm (tm);
ALTER TABLE temperature ADD INDEX temperature_gu (bor_nm);


#원핫인코딩
#sido : 서울특별시, 인천광역시, 경기도
SELECT DISTINCT sido FROM gs25;

#필드추가
#alter table 테이블 add 필드명 자료형 (사이즈) default 기본값
ALTER TABLE gs25 ADD seoul CHAR(1) default '0';
UPDATE gs25 SET seoul='1' WHERE sido='서울특별시';

ALTER TABLE gs25 ADD incheon CHAR(1) DEFAULT '0';
UPDATE gs25 SET incheon='1' WHERE sido='인천광역시';

ALTER TABLE gs25 ADD gyungi CHAR(1) default '0';
UPDATE gs25 SET gyungi='1' WHERE sido='경기도';

SELECT * FROM gs25 LIMIT 10;
SELECT * FROM gs25 WHERE sido='인천광역시' LIMIT 10;
SELECT * FROM gs25 WHERE sido='경기도' LIMIT 10;

#성별 원핫인코딩
#남성여부 필드
ALTER TABLE gs25 ADD male CHAR(1) DEFAULT '0';
UPDATE gs25 SET male='1' WHERE gender='M';

#여성여부 필드
ALTER TABLE gs25 ADD female CHAR(1) DEFAULT '0';
UPDATE gs25 SET female='1' WHERE gender='F';