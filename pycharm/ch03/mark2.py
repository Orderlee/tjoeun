marks=[90,25,67,45,80]
number=0
 # continue 그 단계를 건너뜀
 # break 반복문을 종료함

 #'형식화된 문자열' % (값1,값2)
 #'형식화된 문자열'.format(값1,값2)
for mark in marks:
    number=number+1
    if mark<60: continue
    #print('%d번 학생의 점수는 %d점이고 합격입니다.' %(number,mark)
    print('{}번 학생의 점수는 {}점이고 합격입니다.'.format(number,mark))


