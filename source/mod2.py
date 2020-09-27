PI=3.141592

class Math:
    def solv(self,r):
        return PI*(r**2)
    
    def sum(self,a,b):
        return a+b
    
#콘솔에서 python.exe로 실행했을 때만 실행되는 코드
#외부에서 import 모듈이름 으로 불러올 때는 이부분은 실행되지 않음
    
if __name__ == "__main__":
    print(PI)
    a = Math()
    print(a.solv(2))
    print(a.sum(PI,4.4))
