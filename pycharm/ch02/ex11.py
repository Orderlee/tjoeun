#튜플 : 리스트와 사용법은 같으나 변경할 수 없는 자료형
t1= (1,2,'a','b')
print(t1)
print(t1[0]) #숫자 인덱스 사용
# t1[0]=10 #에러가 발생함
a=list(t1) #튜플을 리스트로 변경
a[0]=10
print(a)
print(t1)
t2 = 10,20,30,40,50 #괄호 생략 가능
print(t2)
print(type(t2))
a=10
b=20
a,b=b,a #()=()
print(a,b)


i=10,20,30
a,b,c=i
print(a,b,c)
