#교집합을 리스트로 구현
a=[1,2,3]
b=[3,4,5,6]

c=[]
for i in a:
    if i in b: #집합 b에 i가 있으면 추가
        c.append(i)

print(c)