#깊은 복사
a=[1,2,3]
b=a[:] #a리스트의 모든 원소를 b에 복사
a[1]=4
print(a is b) #서로 다른 객체이므로 False
print(id(a))
print(id(b))
print(a)
print(b)