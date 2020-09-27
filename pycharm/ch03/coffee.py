coffee = 10
while True: #무한 반복
    money=int(input('돈을 넣어주세요:')) #문자열을 숫자로 변환
    if money==300:
        print('커피를 줍니다.')
        coffee=coffee-1
    elif money > 300:
        print('커피를 줍니다. 거스름돈: %d' % (money-300))
        coffee=coffee-1
    else: #나머지 모든 조건
        print('돈이 모자랍니다.')
        print('남은 커피의 양:%d' % coffee)
    if coffee==0:
        print('품절...')
        break #반복문을 종료함

print('프로그램 종료')