select top 10* from ontime;

--���̺� ���
select * from information_schema.tables;
-- ontime ���̺��� �ʵ� ���� (��Ű��)
select * from information_schema.columns
where table_name ='ontime';

update ontime set depdelay=0 where depdelay='NA';
update ontime set arrdelay=0 where arrdelay='NA';
--�ε��� �����
--create index �ε����̸�on ���̺��̸�(�ʵ��)
create index year on ontime(year);
create index month on ontime(year,month);
create index day on ontime(year,month,dayofmonth);


create index carrier_code on carriers(code);

--cast(�ʵ� as �ڷ���) �ӽ÷� �ڷ����� �ٲ�
select uniquecarrier, avg(cast(depdelay as int))
from ontime
group by uniquecarrier;
--�װ��� �̸��� �������� ����
select year, uniquecarrier,description,
avg(cast(depdelay as int))
from ontime a, carriers c
where a.uniquecarrier=c.code
group by year, a.uniquecarrier,description
order by year, a.uniquecarrier,description;

select * from carriers;
select top 5* from ontime;

--�����������ð�
select avg(cast(depdelay as int))
from ontime;

select avg(sal) from emp;
select avg(*) from emp;
-- * star,�ֽ��͸���ũ ��� �ʵ�
select ename,sal from emp;
select * from emp;
select count(comm) from emp;
select count(*) from emp;