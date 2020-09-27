import pygame

pygame.init() #게임초기화
surface = pygame.display.set_mode((400,300)) #화면 사이즈
clock = pygame.time.Clock() #타이머 객체
running = True #실행상태 변수

gun = pygame.mixer.Sound("d:/data/game/GUN_SHOT.WAV") #사운드 객체
blast = pygame.mixer.Sound("d:/data/game/BLAST.WAV")
arial = pygame.font.SysFont('Arial',30) #폰트 객체
usage = arial.render('Press A or B key', True, (0,0,255)) #출력할 텍스트

while running:
    for event in pygame.event.get(): # 게임 실행 중 발생하는 이벤트 처리
        if event.type == pygame.QUIT: #게임종료 이벤트(x버튼을 누를 때)
            running = False #실행 상태를 변경시킴
        elif event.type == pygame.KEYDOWN: #키입력 이벤트
            if event.key == pygame.K_a: #소문자 a 키를 누르면
                gun.play() #사운드 플레이
            elif event.key == pygame.K_b: #소문자 b 키를 누르면
                blast.play()
    surface.fill(0xffffff) #배경색상 설정
    surface.blit(usage,(100,100)) #텍스트를 화면에 출력시킴
    pygame.display.flip() #게임 화면을 갱신함
    clock.tick(30) #시간 지연 효과 (1초당 프레임수 30)

pygame.quit()