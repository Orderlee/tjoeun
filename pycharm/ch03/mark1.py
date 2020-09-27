marks =[90,25,67,45,80]

# len(marks) 요소의 갯수 5
# range
for i in range(len(marks)):
    print(marks[i])

# print(marks)
# print(type(marks))
#
# print(marks[0])
# print(marks[1])
# print(marks[2])
# print(marks[3])
# print(marks[4])

number=0
# for 개별값 in 컨테이너
# 컨테이너 : 복수의 값을 저장하는 변수
for mark in marks:
    number=number+1
    if mark >=60:
        # %d 정수 %f 실수 %s 문자열
        print('%d번 학생의 점수는 %d점이고 합격입니다.'% (number,mark))
    else:
        print('%d번 학생의 점수는 %d점이고 불합격입니다.'%(number,mark)