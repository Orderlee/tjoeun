# while 사용

i = 1 #초기값
while i<=5: #조건식
    print('*'*i)
    i=i+1 #조건을 변경시키는 코드

i=0
while i<=5:
    j=0
    while j<=i:
        print('*',end='')
        j=j+1
    print()
    i=i+1
