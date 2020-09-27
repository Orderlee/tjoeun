# #쓰기모드로 파일
# #파일참조변수 (파일포인터)
# f = open('d:/data/test.txt','w')
# for i in range(1,11): #1~10
#     data='%d번째 줄입니다.\n' % i
#     # \n 줄바꿈
#     f.write(data) #파일에 기록
#
# print('저장되었습니다.')
# f.close() #파일 참조변수가 가리키는 리소스 정리

#읽기모드로 파일 오픈
f2=open('d:/data/test.txt','r',encording='utf-8') #기본인코딩 :cp949
lines=f2.readlines() #라인별로 리스트로 저장
print(lines)
for line in lines:
    print(line,end='')

f2.close()