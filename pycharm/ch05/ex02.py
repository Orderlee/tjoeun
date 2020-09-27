class Sales:
    def __init__(self,code='0',product='noname',unit=0,amount=0): #초기화 함수
        self.code=code
        self.product=product
        self.unit=unit
        self.amount=amount

    def calc(self):
        self.price=self.unit*self.amount

    def display(self):
        print('상품코드\t\t품명\t단가\t수량\t금액')
        print('='*55)
        print('{}\t\t\t{}\t{}\t{}\t\t{}'.format(self.code,self.product,self.unit,self.amount,self.price))

s1=Sales(10,'냉장고',500000,100)
s1.calc()
s1.display()
s1=Sales()
s1.calc()
s1.display()