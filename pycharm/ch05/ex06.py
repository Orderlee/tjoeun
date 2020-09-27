# 컨테이너: 집합 자료형(여러값을 저장하고 있는 자료형)
# enumerate : 컨테이너의 index와 value를 리턴하는 함수
for i ,name in enumerate(['body','foo','bar']):
    print(i,name)

a=[10,20,30,40,50]

for i in a:
    print(i)

for i in range(len(a)):
    print(i,a[i])

for i , v in enumerate(a):
    print(i,v)