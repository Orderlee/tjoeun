use mydb;

#drop table emp;
CREATE TABLE emp ( 
  empno     int primary key, 
  ename     varchar(50), 
  job       varchar(50), 
  mgr       int, 
  hiredate  datetime default now(), 
  sal       int,
  comm      int, 
  deptno    int);

insert into emp values (7369,'김철수','사원',7902,'2000-12-17',200,null,20);
insert into emp values (7499,'이찬수','주임',7698,'2001-02-20',260,300,30);
insert into emp values (7521,'박종수','주임',7698,'2002-02-22',325,500,30);
insert into emp values (7566,'임채호','과장',7839,'2001-04-02',497,null,20);
insert into emp values (7654,'나대호','주임',7698,'2001-09-28',325,1400,30);
insert into emp values (7698,'박지성','과장',7839,'2001-05-01',485,null,30);
insert into emp values (7782,'구자철','과장',7839,'2001-06-09',445,null,10);
insert into emp values (7788,'송기성','부장',7566,'1997-04-17',500,null,20);
insert into emp values (7839,'김철호','대표',null,'2001-11-17',800,null,10);
insert into emp values (7844,'성명준','주임',7698,'2001-09-08',350,0,30);
insert into emp values (7876,'황인태','사원',7788,'2007-05-23',210,null,20);
insert into emp values (7900,'박민성','사원',7698,'2001-12-03',295,null,30);
insert into emp values (7902,'박진성','부장',7566,'2001-12-03',600,null,20);
insert into emp values (7934,'최철호','사원',7782,'2012-01-23',230,null,10);


#drop table dept;
CREATE TABLE dept (
  deptno   int primary key, 
  dname    varchar(50), 
  loc      varchar(50));

insert into dept values (10,'경리팀','부산');
insert into dept values (20,'연구팀','대전');
insert into dept values (30,'총무팀','대구');
insert into dept values (40,'전산팀','인천');




#drop table professor ;

create table professor(
 profno int primary key,
 name  varchar(10) not null, 
 id  varchar(15) not null,
 position varchar (20) not null,
 pay int (3) not null,
 hiredate  date not null,
 bonus int(4) ,
 deptno  int(3),
 email  varchar(50),
 hpage  varchar(50)
);

insert into professor
values(1001,'조인형','captain','정교수',550,'1980-06-23',100,101,'captain@abc.net','http://www.abc.net');

insert into professor
values(1002,'박승곤','sweety','조교수',380,'1987-01-30',60,101,'sweety@abc.net','http://www.abc.net');

insert into professor
values (1003,'송도권','powerman','전임강사',270,'1998-03-22',null,101,'pman@power.com','http://www.power.com');

insert into professor
values (2001,'양선희','lamb1','전임강사',250,'2001-09-01',null,102,'lamb1@hamail.net',null);

insert into professor
values (2002,'김영조','int1','조교수',350,'1985-11-30',80,102,'int1@naver.com','http://num1.naver.com');

insert into professor
values (2003,'주승재','bluedragon','정교수',490,'1982-04-29',90,102,'bdragon@naver.com',null);

insert into professor
values (3001,'김도형','angel1004','정교수',530,'1981-10-23',110,103,'angel1004@hanmir.com',null);

insert into professor
values (3002,'나한열','naone10','조교수',330,'1997-07-01',50,103,'naone10@empal.com',null);

insert into professor
values (3003,'김현정','only-u','전임강사',290,'2002-02-24',null,103,'only_u@abc.com',null);

insert into professor
values (4001,'심슨','simson','정교수',570,'1981-10-23',130,201,'chebin@daum.net',null);

insert into professor
values (4002,'최슬기','gogogo','조교수',330,'2009-08-30',null,201,'gogogo@def.com',null);

insert into professor
values (4003,'박원범','mypride','조교수',310,'1999-12-01',50,202,'mypride@hanmail.net',null);

insert into professor
values (4004,'차범철','ironman','전임강사',260,'2009-01-28',null,202,'ironman@naver.com',null);

insert into professor
values (4005,'바비','standkang','정교수',500,'1985-09-18',80,203,'standkang@naver.com',null);

insert into professor 
values (4006,'전민','napeople','전임강사',220,'2010-06-28',null,301,'napeople@jass.com',null);

insert into professor
values (4007,'허은','silver-her','조교수',290,'2001-05-23',30,301,'silver-her@daum.net',null);

#drop table department ;
create table department
( deptno int(3) primary key ,
  dname varchar(30) not null,
  part int(3),
  build  varchar(30));

insert into department 
values (101,'컴퓨터공학과',100,'정보관');

insert into department
values (102,'멀티미디어공학과',100,'멀티미디어관');

insert into department
values (103,'소프트웨어공학과',100,'소프트웨어관');

insert into department
values (201,'전자공학과',200,'전자제어관');

insert into department
values (202,'기계공학과',200,'기계실험관');

insert into department
values (203,'화학공학과',200,'화학실습관');

insert into department
values (301,'문헌정보학과',300,'인문관');

insert into department
values (100,'컴퓨터정보학부',10,null);

insert into department
values (200,'메카트로닉스학부',10,null);

insert into department
values (300,'인문사회학부',20,null);

insert into department
values (10,'공과대학',null,null);

insert into department
values (20,'인문대학',null,null);


 

#drop table student ;

create table student
( studno int primary key,
  name   varchar(10) not null,
  id varchar(20) not null unique,
  grade int ,
  jumin char(13) not null,
  birthday  datetime default now(),
  tel varchar(15),
  height  int,
  weight  int,
  deptno1 int,
  deptno2 int,
  profno  int) ;

insert into student values (
9411,'서진수','75true',4,'7510231901813','1975-10-23','055)381-2158',180,72,101,201,1001);

insert into student values (
9412,'서재수','pooh94',4,'7502241128467','1975-02-24','051)426-1700',172,64,102,null,2001);

insert into student values (
9413,'이미경','angel000',4,'7506152123648','1975-06-15','053)266-8947',168,52,103,203,3002);

insert into student values (
9414,'김재수','gunmandu',4,'7512251063421','1975-12-25','02)6255-9875',177,83,201,null,4001);

insert into student values (
9415,'박동호','pincle1',4,'7503031639826','1975-03-03','031)740-6388',182,70,202,null,4003);

insert into student values (
9511,'김신영','bingo',3,'7601232186327','1976-01-23','055)333-6328',164,48,101,null,1002);

insert into student values (
9512,'신은경','jjang1',3,'7604122298371','1976-04-12','051)418-9627',161,42,102,201,2002);

insert into student values (
9513,'오나라','nara5',3,'7609112118379','1976-09-11','051)724-9618',177,55,202,null,4003);

insert into student values (
9514,'구유미','guyume',3,'7601202378641','1976-01-20','055)296-3784',160,58,301,101,4007);

insert into student values (
9515,'임세현','shyun1',3,'7610122196482','1976-10-12','02)312-9838',171,54,201,null,4001);

insert into student values (
9611,'일지매','onejimae',2,'7711291186223','1977-11-29','02)6788-4861',182,72,101,null,1002);

insert into student values (
9612,'김진욱','samjang7',2,'7704021358674','1977-04-02','055)488-2998',171,70,102,null,2001);

insert into student values (
9613,'안광훈','nonnon1',2,'7709131276431','1977-09-13','053)736-4981',175,82,201,null,4002);

insert into student values (
9614,'김문호','munho',2,'7702261196365','1977-02-26','02)6175-3945',166,51,201,null,4003);

insert into student values (
9615,'노정호','star123',2,'7712141254963','1977-12-14','051)785-6984',184,62,301,null,4007);

insert into student values (
9711,'이윤나','prettygirl',1,'7808192157498','1978-08-19','055)278-3649',162,48,101,null,null);

insert into student values (
9712,'안은수','silverwt',1,'7801051776346','1978-01-05','02)381-5440',175,63,201,null,null);

insert into student values (
9713,'인영민','youngmin',1,'7808091786954','1978-08-09','031)345-5677',173,69,201,null,null);

insert into student values (
9714,'김주현','kimjh',1,'7803241981987','1978-03-24','055)423-9870',179,81,102,null,null);

insert into student values (
9715,'허우','wooya2702',1,'7802232116784','1978-02-23','02)6122-2345',163,51,103,null,null);




