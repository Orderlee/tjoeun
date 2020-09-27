import cx_Oracle as ora #오라클 접속
#오라클 서버에 접속
conn=ora.connect('hr/hr@localhost:1521/xe')
#커서 생성(sql실행+레코드셋 탐색)
cursor=conn.cursor()
#sql='select * from score'
sql='''select student_no,name,kor,eng,mat,(kor+eng+mat) , round((kor+eng+mat)/3,1) ,
decode(trunc(((kor+eng+mat)/3)/10), 10,'A',9,'A',8,'B',7,'C',6,'D','F') grade
from score'''
cursor.execute(sql) #sql 명령어 실행
rows=cursor.fetchall() #레코드셋을 리스트로 저장
print('학번\t이름\t국어\t영어\t수학\t총점\t평균\t등급')
for row in rows:
    # 4s 문자열 4자리
    print('{:4s}\t{:4s}\t{:4d}\t{:4d}\t{:4d}\t{:4d}\t{:4.1f}\t{:4s}'.format(row[0],row[1],row[2],row[3],row[4],row[5],row[6],row[7]))
#리소스 정리
cursor.close()
conn.close()