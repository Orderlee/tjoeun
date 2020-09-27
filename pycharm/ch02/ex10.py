# d:/data/emp/emp.csv를 읽어서 각 라인을 리스트로 저장

with open('d:/data/emp/emp.csv') as f: #파일을 열어서 참조변수 f에 전달
    lines=f.readlines() #전체 라인을 읽어서 리스트로 저장
    result=[]
    for line in lines[1:]: #첫행은 건너뜀
        # print(line,end='')
        a=line.split(',') #컴머 구분자로 나눠서 리스트로 저장
        result.append(a) #결과 리스트에 추가

import cx_Oracle #오라클 접속 모듈
#오라클 서버에 접속:   아이디/비번@호스트:포트번호/sid
conn=cx_Oracle.connect('hr/hr@localhost:1521/xe')
cursor=conn.cursor() #커서 생성

sql='delete from myemp' #전체 레코드 삭제
cursor.execute(sql)
conn.commit() #커밋

# sql='insert into myemp values(:1,:2,:3,:4,:5,:6,:7,:8)'
# 일괄처리할 레코드수 지정(선택사항)
# cursor.bindarrayize=len(result)
# 레코드 입력 일괄 처리
# cursor.executemany(sql, result)
# 커밋(변경사항 확정)
# conn.commit()

for row in result:
    row[1]=row[1].replace('"','') #큰따옴표 제거
    row[2]=row[2].replace('"','')
    row[7]=row[7].strip() #마지막 필드의 \n 제거
    print(row)
    sql='insert into myemp values(:1,:2,:3,:4,:5,:6,:7,:8)'
    cursor.execute(sql,row) #레코드 1개가 저장됨
    #커밋 변경사항 확정
    conn.commit()

print('테이블에 자료가 저장되었습니다.')
cursor.close()
conn.close()

