import pygame

BLACK=(0,0,0) #배경색상 rgb color
pad_width = 480 # 가로 사이즈
pad_height = 640 # 세로 사이즈

def runGame(): # 게임 실행함수
    global gamepad, clock #전역변수

    doneFlag=False #게임 실행 상태 변수
    while not doneFlag:
        for event in pygame.event.get():
            if event.type == pygame.QUIT: #종료 이벤트
                doneFlag =True
        gamepad.fill(BLACK) #배경색상 칠하기
        pygame.display.update() #화면 갱신
        clock.tick(60) #초당 프레임 수

    pygame.quit() #게임 종료

def initGame(): #게임 초기화 함수
    global gamepad, clock #전역변수수
    pygame.init()
    gamepad = pygame.display.set_mode((pad_width,pad_height)) #화면 사이즈 설정

    pygame.display.set_caption('GOTG') #타이틀 설정
    clock = pygame.time.Clock() #타이머 객체 생성

initGame()
runGame()