import cx_Oracle as ora
conn=ora.connect('hr/hr@localhost:1521/xe')
cursor=conn.cursor()
sql='''select ename,sal,decode(trunc(sal/100), 0, 'E', 1, 'D',
2, 'C', 3, 'B', 'A')
from emp'''
cursor.execute(sql)
rows=cursor.fetchall()
print('이름\t월급\t급여등급')
for row in rows:
    print('{}\t{}\t{}'.format(row[0],row[1],row[2]))

cursor.close()
conn.close()