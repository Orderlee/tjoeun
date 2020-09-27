 SELECT studno,s.NAME 학생이름, dname 학과명, p.name 지도교수명
 FROM student s, department d, professor p
 WHERE s.deptno1=d.deptno AND s.profno=p.profno;
 
SELECT studno,s.NAME 학생이름, dname 학과명, p.name 지도교수명
 FROM student s, department d, professor p
 WHERE s.deptno1=d.deptno AND s.profno=p.profno(+);
 
 
 