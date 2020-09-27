#입력: 근속연수
#1~5년미만 : 휴가 10일
#6~10년미만: 휴가 15일
#10년 이상 : 휴가 20일

def holiday(y):
    if 1<=y<5:
        d=10
    elif 6<=y<10:
        d=15
    elif y>=11:
        d=20
    return d #함수를 호출한 곳으로 값을 반환
#함수 호출
#input ()함수를 int()로 묶어서 숫자로 변환
year=int(input('근속연수를 입력하세요:'))
days=holiday(year)
print('휴가일수:{}일'.format(days))




