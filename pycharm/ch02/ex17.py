#차집합을 리스트로 구현
a=[1,2,3]
b=[3,4,5,6]
#에러 발생 (리스트에서는 - 를 사용할 수 없음)
#print(a-b) #리스트를 연결

c=[]
for i in a:
    if i not in b:
        c.append(i)

print(c)



