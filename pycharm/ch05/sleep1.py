# sleep1.py
import time # time 모듈 로딩
#타임스탬프 :  1970년 1월 1일 이후 현재까지의 초
a=time.time()

for i in range(10):
    print(i)
    print(time.time())
    # 1초간 실행을 멈춤
    time.sleep(1)

b=time.time()
print('시간측정:',(b-a))