import pygame

pygame.init() # 게임 초기화
surface = pygame.display.set_mode((800,600)) #화면사이즈 설정
clock =pygame.time.Clock() #타이머 객체
running =True #실행상태 변수

img = pygame.image.load("d:/data/game/flower.jpg") #이미지 파일 로딩
rect=img.get_rect() #이미지의 사각영역
degree=0 #회전각도
while running:
    for event in pygame.event.get(): #종료 옵션
        if event.type==pygame.QUIT:
            running=False #실행상태 변경
    surface.fill(0xffffff) #배경색상 (16진수 rgb) 00~ff(255)

    degree += 1 #회전각도 증가
    rotated=pygame.transform.rotate(img,degree) #이미지를 회전시킴
    surface.blit(rotated,rect) #사각영역에 이미지를 출력
    pygame.display.flip() #화면을 업데이트
    clock.tick(30) #잠시 멈춤
pygame.quit() #게임 종료