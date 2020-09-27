#문자열 포메팅
# "     " % (값)
# "     ".format(값)

number=3
a = '나는 사과를 %d개를 먹었다.' %number
print(a)
a = '나는 사과를 %s개를 먹었다.' %number
print(a)
# %d 정수 %f 실수 $s 문자열 %c 문자1개 %o 8진수 %x 16진수
# %문자를 출력할 경우 : %%

day=3
#출력할 값이 2개 이상인 경우
a= '나는 사과를 %d개 먹었다. %d일 동안 아팠다.' %(number,day)
print(a)

number=20
#10진수, 8진수 , 16진수
print('%d %o %x' %(number,number,number))
print('확률 : %d%%' %number) # %를 출력하고 싶을 경우
