a=[70,60,55,75,95,90,80,80,85,100]
total = 0
for score in a:
    total = total+score

#len (컨테이너) 요소의 갯수

average=total/len(a)
print('평균 점수:{}'.format(average))
