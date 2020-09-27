#합집합을 리스트로 구현
a=[1,2,3]
b=[3,4,5,6]
print(a+b) #리스트를 연결


c=[]
for i in a:
    if i not in b:
        c.append(i)

c=c+b
print(c)