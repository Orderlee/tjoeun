n=10
if n%2==0:
    print('짝수')
else:
    print('홀수')

def myodd(num):
    # result=''
    if num%2==0:
        return str(num)+'==>짝수'
        # print('짝수')
    else:
        return str(num)+'==>홀수'
        # print('홀수')
    return result

print(myodd(10))
print(myodd(5))