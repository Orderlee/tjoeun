# myemp 테이블을 읽어서
# sal, coo =>연봉계산 sal*12 + comm
# myemp.csv 파일로 export

import cx_Oracle #오라클 접속 모듈
#오라클 서버에 접속 '아이디/비번@호스트:포트/sid'
conn=cx_Oracle.connect('hr/hr@localhost:1521/xe')
#커서 생성
cursor=conn.cursor()
# nvl(comm,0) comm필드값이 null이면 0으로 대체
sql='select empno,ename,sal,nvl(comm,0),sal*12+nvl(comm,0) from myemp'
#sql 명령어를 실행
cursor.execute(sql)
#결과셋(select 명령어를 실행할 결과)을 리스트로 저장
rows=cursor.fetchall()

result=[]
for row in rows:
    #각각의 레코드를 딕셔너리로 저장
    line = {'empno':row[0],'ename':row[1],'sal':row[2],'comm':row[3],
            'money':row[4]}
    result.append(line)

# print(result)

#리소스 정리
cursor.close()
conn.close()



#csv 파일로 export
with open('d:/data/emp/myemp.csv','w') as f:
    f.write('empno,ename,sal,comm,coney\n') #헤더 기록
    for line in result:
        a='{},{},{},{},{}\n'.format(line['empno'],line['ename'],line['sal'],line['comm'],line['money'])
        f.write(a) #one row 저장

print('파일로 저장되었습니다.')