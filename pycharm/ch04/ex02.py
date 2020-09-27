a = [100,87,90,95,66,50,20]

for i in a:
    if i>60:
        print('{}점이고 합격입니다.'.format(i))
    else:
        print('{}점이고 불합격입니다.'.format(i))

#함수 선언
def mypass(points):
    for i in points:
        if i<60:
            print('{}점이고 합격입니다.'.format(i))
        else:
            print('{}점이고 불합격입니다.'.format(i))

mypass(a)

