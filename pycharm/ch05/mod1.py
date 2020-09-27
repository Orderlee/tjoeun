#mod1.py
def add(a,b):
    return a+b

def sub(a,b):
    return a-b

# print(add(1,4))
# print(sub(4,2))

#현재 파일에서 실행: __main__
#다른 파일에서 import : 모듈이름
print('name:',__name__)

#현재 파일에서 실행할 때만
if __name__ == '__main__':
    print(add(1,4))
    print(sub(4,2))