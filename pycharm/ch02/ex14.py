# # myemp 테이블
# # sal 10% 인상
# # comm null -> sal의 30%로 설정
#
# import cx_Oracle
# conn=cx_Oracle.connect('hr/hr@localhost:1521/xe')
#
# cursor=conn.cursor()
# sql='select empno,ename,sal,nvl(comm,0),sal*12+nvl(comm,0) from myemp'
#
# cursor.execute(sql)
# rows=cursor.fetchall()
#
# for row in rows:
#     line = {'empno':row[0],'ename':row[1],'sal':row[2],'comm':row[3],
#             'money':row[4]}
#     sal=line['sal']*1.1 #월급 10%인상
#     if line['comm']==0: #커미션이 0이면 월급의 30% 지급
#         comm=line['sal']*0.3
#     else:
#         comm=line['comm']
#     #레코드를 수정하는 sql 명령어
# # update 테이블 set 필드=수정할값, 필드=수정할값 where 조건
#     #사번에 해당하는 레코드의 월급과 커미션 수정
#     sql2='update myemp set sal=:1,comm=:2 where empno=:3'
#     cursor.execute(sql2,(sal,comm,row[0]))
#
# #변경사항을 확정함
# conn.commit()
# print('급여 인상 작업이 완료되었습니다.')
# #리소스 정리
# cursor.close()
# conn.close()

