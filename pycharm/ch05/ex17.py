#멀티스레드
import time #타임 모듈
import threading #멀티스레드 처리를 지원하는 모듈

def long_task():
    for i in range(5):
        time.sleep(1) #1초간 멈춤
        print('working:%s\n' % i, end='')

print('start')

threads=[]
for i in range(5):
    #새로운 스레드(작업단위) 생성
    # target=멀티스레드를 적용할 함수 이름
    t=threading.Thread(target=long_task)
    threads.append(t)

for t in threads:
    t.start() #스레드 실행

print('end')
for i in range(1,101):
    print(i)