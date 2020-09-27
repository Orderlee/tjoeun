import pygame

BLACK=(0,0,0) #배경색상 rgb color
pad_width = 480 # 가로 사이즈
pad_height = 640 # 세로 사이즈

#전투기의 가로,세로 사이즈
fighter_width=29
fighter_height=30

#이미지를 화면에 출력시키는 함수
def drawObject(obj,x,y):
    global gamepad #전역변수
    gamepad.blit(obj,(x,y)) #obj 객체를 x,y 좌표에 출력시킴

def runGame(): # 게임 실행함수
    global gamepad, clock, fighter #전역변수

    #전투기의 초기좌표 설정
    x=pad_width*0.45
    y=pad_height*0.9
    x_change=0 #이동거리

    doneFlag=False #게임 실행 상태 변수
    while not doneFlag:
        for event in pygame.event.get():
            if event.type == pygame.QUIT: #종료 이벤트
                doneFlag =True
            # key down 이벤트
            if event.type==pygame.KEYDOWN:
                if event.key== pygame.K_LEFT: #왼쪽 화살표키
                    x_change-=5
                elif event.key == pygame.K_RIGHT: #오른쪽 화살표키
                    x_change+=5
             # key up 이벤트
            if event.type == pygame.KEYUP:
                # left,right 화살표키를 누른 후 이동거리를 0으로 초기화
                if event.key == pygame.K_LEFT or event.key==pygame.K_RIGHT:
                    x_change = 0

        gamepad.fill(BLACK) #배경색상 칠하기
        x += x_change #전투기의 좌표 변경
        #좌우 벽 처리 (좌측 상단이 기준 0)
        if x<0:
            x=0
        elif x>pad_width - fighter_width:
            x=pad_width - fighter_width

        drawObject(fighter,x,y) #전투기 이미지를 출력시킴

        pygame.display.update() #화면 갱신
        clock.tick(60) #초당 프레임 수

    pygame.quit() #게임 종료

def initGame(): #게임 초기화 함수
    global gamepad, clock, fighter #전역변수
    pygame.init()
    gamepad = pygame.display.set_mode((pad_width,pad_height)) #화면 사이즈 설정

    pygame.display.set_caption('GOTG') #타이틀 설정
    #전투기 이미지 로딩
    fighter=pygame.image.load('d:/data/game/gunship.png')
    clock = pygame.time.Clock() #타이머 객체 생성

initGame()
runGame()