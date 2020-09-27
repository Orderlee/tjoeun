while True:
    try:
        n=int(input('숫자를 입력하세요:'))
        result=0
        for i in range(1,n+1):
            result += i
        print('합계:',result)
        break
    except:
        print('잘못된 값을 입력했습니다. 다시 입력하세요.')
