import time

def long_task():
    for i in range(5):
        time.sleep(1) #1초간 멈춤
        print('working:%s\n' % i,end='')

print('start')
for i in range(5):
    long_task()

print('end')