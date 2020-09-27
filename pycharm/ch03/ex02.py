#1~10 3의 배수가 아닌 숫자들

a=1
while True:
    if a%3 !=0: # a를 3으로 나눈 나머지가 0 이 아니면
        print(a)
    a=a+1 #증가
    if a>10: #탈출 조건
        break


a = 1 #초기값
while a <=10:
    if a%3 != 0:
        print(a)
    a = a+1 #증가