#입력값의 갯수에 관계없이 처리하려면? 가변사이즈 매개변수
# *변수명
#전달되는 값들이 튜플로 저장됨
def avg_numbers(*args):
    print(args)
    result = 0
    for i in args:
        result +=i
    return result/len(args)

#평균값 계산
print(avg_numbers(1,2))
print(avg_numbers(1,2,3))
print(avg_numbers(1,2,3,4,))
print(avg_numbers(1,2,3,4,5))