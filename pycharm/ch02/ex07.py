number=3
#숫자이지만 문자열 형식으로 출력 가능함
a='나는 사과 %s개를 먹었다.' %number
print(a)
#%10s 10자리의 문자열(오른쪽 정렬)
a='나는 사과 %10s개를 먹었다.' %number
print(a)
# $-10s 10자리의 문자열 (왼쪽 정렬)
a='나는 사과 %-10s개를 먹었다.' %number
print(a)

# {}위치에 값이 입력됨
a='나는 사과 {}개를 먹었다.'.format(number)
print(a)
# >자리수: 오른쪽 정렬
# {변수인덱스:세부옵션}
a='나는 사과 {:>10}개를 먹었다.'.format(number)
print(a)
# <자리수: 왼쪽 정렬
a='나는 사과 {:<10}개를 먹었다.'.format(number)
print(a)
# &자리수: 가운데 정렬
a='나는 사과 {:^10}개를 먹었다.'.format(number)
print(a)

#실수값의 표현 방법
a = 3.42134234
print('%f' % a) #실수형으로 출력
print('%.2f' %a) #소수 이하 2자리까지 출력
# 전체자리수.소수이하자리수
print('%7.2f' %a)
print('{}'.format(a))
print('{:.2f}'.format(a))
print('{:7.2f}'.format(a))