#문자열 : 큰따옴표 또는 작은따옴표로 묶음
a = 'Hello World'
print(a)
print(type(a))
a = "Hello World"
print(a)
print(type(a))
#문자열에 작은따옴표가 포함될 경우
a = "I'm sorry"
print(a)
a ='I\'m sorry'
print(a)
#문자열에 큰따옴표가 포함될 경우
a = '"파이썬"은 쉽다.'
print(a)
a = '\"파이썬\"은 쉽다.'
print(a)
#문자열에 작은따옴표+큰따옴표가 포함될 경우
a = '\"I\'m sorry"'
print(a)

# escape character 탈출문자
#\' 작은따옴표 \" 큰따옴표
#\n 줄바꿈 \t 탭 \\ 백슬래시
print('aaa\nbbb\nccc') #\n 줄바꿈
print('aaa\t\t\tbbb\tccc') #\t 탭
print('aaa\\bbb\ccc') #\\ 백슬래시