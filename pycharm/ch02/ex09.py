#실행 단축기 : alt +shift+ F10
a=[] #비어있는 리스트
a.append(10) #리스트에 값 추가
a.append(20)
a.append(30)
print(a)

a.clear() #리스트를 클리어시킴
#10부터 30까지 10씩 증가
for i in range(10,101,10):
    a.append(i)
print(a)

a.remove(20) #값 20제거
print(a)
#2번 인덱스에 45 삽입
a.insert(2,45)
print(a)


