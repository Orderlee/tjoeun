f = open('d:/data/test2.txt','r') #읽기모드로 오픈
body = f.read() #파일 내용 전체를 변수에 저장(1개의 문자열)
f.close()

#replace, java=>python
# 문자열.replace(A,B) A를 B로 변경
body = body.replace('java','python')

#쓰기모드로 오픈
f = open('d:/data/test2.txt','w')
f.write(body)
f.close