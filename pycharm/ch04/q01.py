#짝수이면 True, 홀수이면 False를 리턴하는 함수
def is_odd(number):
    if number%2 ==0:
        return True
    else:
        return False

print(is_odd(20))
print(is_odd(31))

#람다식으로 표현
# lambda 입력값:출력값
#number를 2로 나눈 나머지가 0이면 True, 아니면 False
# True if number%2==0 else False
is_odd2=lambda number : True if number%2==0 else False
print(is_odd2(10))
print(is_odd2(5))