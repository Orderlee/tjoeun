CREATE TABLE EMP ( 
  EMPNO     int, 
  ENAME     nvarchar(10), 
  JOB       nvarchar(9), 
  MGR       int, 
  HIREDATE  DATE, 
  SAL       int,
  COMM      int, 
  DEPTNO    int);
  select * from emp;

  delete from emp;

insert into emp values (7369,'��ö��','���',7902,'2000-12-17',200,null,20);
insert into emp values (7499,'������','����',7698,'2001-02-20',260,300,30);
insert into emp values (7521,'������','����',7698,'2002-02-22',325,500,30);
insert into emp values (7566,'��äȣ','����',7839,'2001-04-02',497,null,20);
insert into emp values (7654,'����ȣ','����',7698,'2001-09-28',325,1400,30);
insert into emp values (7698,'������','����',7839,'2001-05-01',485,null,30);
insert into emp values (7782,'����ö','����',7839,'2001-06-09',445,null,10);
insert into emp values (7788,'�۱⼺','����',7566,'1997-04-17',500,null,20);
insert into emp values (7839,'��öȣ','��ǥ',null,'2001-11-17',800,null,10);
insert into emp values (7844,'������','����',7698,'2001-09-08',350,0,30);
insert into emp values (7876,'Ȳ����','���',7788,'2007-05-23',210,null,20);
insert into emp values (7900,'�ڹμ�','���',7698,'2001-12-03',295,null,30);
insert into emp values (7902,'������','����',7566,'2001-12-03',600,null,20);
insert into emp values (7934,'��öȣ','���',7782,'2012-01-23',230,null,10);

-- sal(�޿�) 10% �λ�
select * from emp ;
update emp set sal=sal*1.1;
select * from emp;




