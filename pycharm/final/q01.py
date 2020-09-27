a='a:b:c:d'

print(a.replace(':','#'))
#split 과 join 함수 이용
#split('구분자') : 하나의 문자열을 나누어 리스트로 저장
b=a.split(':')
#'구분자'.join(리스트) : 리스트의 개별값 사이에 구분자를 넣어서 하나의 문자열로
c='#'.join(b)

print(c)