#리스트 복사 (얕은 복사)
#참조변수(레퍼런스)
a=[1,2,3]
b=a #a가 가리키는 주소값을 b에 저장
print(a)
print(b)
print(a is b) # a와 b가 같은 객체 인가?
print(id(a)) #a의 주소값
print(id(b)) #b의 주소값
a[1]=4
print(a)
print(b)