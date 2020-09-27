import pygame

pygame.init() # 게임 초기화
surface = pygame.display.set_mode((600,400)) #화면사이즈 설정
clock =pygame.time.Clock() #타이머 객체
running =True #실행상태 변수

img = pygame.image.load("d:/data/game/flower.jpg") #이미지 파일 로딩
rect=img.get_rect() #이미지의 사각영역
rect.y=20 #이미지의 y 좌표
while running:
    for event in pygame.event.get(): #종료 옵션
        if event.type==pygame.QUIT:
            running=False #실행상태 변경
    surface.fill(0xffffff) #배경색상 (16진수 rgb) 00~ff(255)
    surface.blit(img,rect) #사각영역에 이미지를 출력
    rect.x += 1 # x좌표를 1증가시킴
    rect.y += 3 # y좌표를 3증가시킴
    pygame.display.flip() #화면을 업데이트
    clock.tick(30) #잠시 멈춤
pygame.quit() #게임 종료