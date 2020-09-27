create or replace function fn_update_sal(v_empno number)
return number --리턴자료형
is 
v_sal number; --함수 안에서 사용할 지역변수
begin
-- 급여 10% 인상 처리
--update emp set sal=sal*1.1 where empno=v_empno;
-- 필드 into 변수 : 필드의 값을 변수에 저장
select sal into v_sal from emp
where empno=v_empno;
return v_sal; --함수를 호출한 곳으로 결과값을 되돌려줌
end;
/

select * from emp;
select fn_update_sal(7499) from dual;
select sysdate from dual;
--"cannot perform a DML operation inside a query "
-- DML 데이터 조작 언어 insert,update,delete
-- := (sqlplus에서 대입), :salary ->매개변수

--프로시저 만들기
create or replace procedure dept_search(p_empno in number)
is
v_deptno number;
begin
--사번에 해당되는 레코드의 부서코드를 변수에 저장
select deptno into v_deptno from emp
where empno=p_empno;
--오라클 콘솔에 출력
dbms_output.put_line('부서코드:'|| v_deptno);
if v_deptno=10 then
dbms_output.put_line('경리팀 사원입니다.');
elsif v_deptno=20 then
dbms_output.put_line('연구팀 사원입니다.');
elsif v_deptno =30 then
dbms_output.put_line('총무팀 사원입니다.');
else
dbms_output.put_line('기타부서 사원입니다.');
end if;
end;
/
-- 오라클 코솔에 출력 할 수 있도록 설정 변경
set serveroutput on
--exec 프로시저이름(전달할값)
exec dept_search(7499);

delete from emp where empno>=9010;
select * from emp where empno>=9010;
declare -- 변수 선언부
v_cnt number :=9010; --변수명 자료형 :=초기값
begin
loop
v_cnt := v_cnt+1; --카운트 증가 처리
--레코드가 추가됨
insert into emp (empno,ename,hiredate) values
(v_cnt, 'tell'||v_cnt, sysdate);
--루프 종료 선언
exit when v_cnt >=9100; 
end loop;-- 루프종료
dbms_output.put_line(v_cnt-9010||'개의 레코드가 입력되었습니다.');
end;
/

select * from emp order by empno desc;

delete from emp where empno>=9010;
declare
cnt number :=9050; --cnt 변수에 초기값 대입
begin
while cnt < 9060 loop --조건이 true일동안 반복 처리
insert into emp(empno,ename,hiredate)
values (cnt,'test',sysdate); 
cnt:=cnt+1; --조건을 변경시키는 코드
end loop;
dbms_output.put_line(cnt-9050||'개의 레코드가 입력되었습니다.');
end;
/

select * from emp where empno >= 9050;









