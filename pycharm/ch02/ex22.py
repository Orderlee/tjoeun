# d:/data/point/point.csv 를 읽어서
# 이름,국어,영어,수학,총점,평균 출력

with open('d:/data/point/point.csv') as f:
    print('이름\t국어\t영어\t수학\t총점\t평균')
    print('='*50)
    lines=f.readlines()
    print(lines)
    for line in lines[1:]:
        #strip() 공백,탭, 줄바꿈 문자 제거
        a=line.strip().split(',') #스트링 컴머로 구분하여 리스트로 저장
        total=int(a[1])+int(a[2])+int(a[3])
        average=total/3
        print('{}\t{}\t\t{}\t\t{}\t\t{}\t\t{:.2f}'.format(a[0],a[1],a[2],a[3],total,average))