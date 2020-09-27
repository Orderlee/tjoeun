#초기화 함수: 인스턴스를 만들 때 자동으로 호출되는 함수
#self : 인스턴스의 시작번지값을 가리키는 특별한 변수
class Emp:  # class 클래스 이름

    #멤버변수(property)
    empno=int()
    ename=str()
    sal=int()
    bonus=int()

    def __init__(self,empno,ename,sal,bonus):
        self.empno=empno
        self.ename=ename
        self.sal=sal
        self.bonus=bonus

    def calc(self):
        self.money=self.sal*12+self.bonus
        self.tax=self.money*0.03
        self.receive=self.money-self.tax



    def display(self):
        print('사번\t이름\t월급\t보너스\t연봉\t세액\t실수령액')
        print('='*60)
        print('{}\t\t{}\t{}\t\t{}\t{}\t{}\t{}'.format(self.empno,self.ename,self.sal,self.bonus,self.money,
                                                      self.tax,self.receive))

#클래스의 인스턴스(객체)를 생성함
#e1=Emp()
e1=Emp(10,'김철수',500,1000)
e1.calc()
e1.display()