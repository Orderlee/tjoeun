import pygame
import random
from time import sleep

# 게임에 사용되는 전역 변수 정의
BLACK = (0, 0, 0)
RED = (255, 0, 0)
WHITE = (255, 255, 255)
pad_width = 480
pad_height = 640
fight_width = 36
fight_height = 38
enemy_width = 26
enemy_height = 20


def gameover():
    global gamepad
    dispMessage('Game Over')


# 적을 맞춘 개수 계산
def drawScore(count):
    global gamepad

    font = pygame.font.SysFont(None, 20)
    text = font.render('Enemy Kills: ' + str(count), True, WHITE)
    gamepad.blit(text, (0, 0))


def drawPassed(count):
    global gamepad

    font = pygame.font.SysFont(None, 20)
    text = font.render('Enemy Passed: ' + str(count), True, RED)
    gamepad.blit(text, (360, 0))


# 화면에 글씨 보이게 하기
def dispMessage(text):
    global gamepad
    # 폰트 사이즈 80
    textfont = pygame.font.Font('freesansbold.ttf', 80)
    text = textfont.render(text, True, RED)
    textpos = text.get_rect()
    textpos.center = (pad_width / 2, pad_height / 2)
    gamepad.blit(text, textpos)
    pygame.display.update()
    sleep(2)  # 2초 후에
    runGame()  # 게임 재시작


def crash():
    global gamepad
    dispMessage('Crashed!')


# 게임에 등장하는 객체를 그려줌
def drawObject(obj, x, y):
    global gamepad
    gamepad.blit(obj, (x, y))


# 게임 실행 메인 함수
def runGame():
    global gamepad, fighter, clock
    global bullet, enemy

    isShot = False  # 충돌 여부
    shotcount = 0  # 격추한 적의 갯수
    enemypassed = 0  # 격추 실패 횟수

    x = pad_width * 0.45
    y = pad_height * 0.9
    x_change = 0

    bullet_xy = []
    enemy_x = random.randrange(0, pad_width - enemy_width)
    enemy_y = 0
    enemy_speed = 3

    ongame = False
    while not ongame:
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                ongame = True

            if event.type == pygame.KEYDOWN:
                if event.key == pygame.K_LEFT:
                    x_change -= 5

                elif event.key == pygame.K_RIGHT:
                    x_change += 5

                elif event.key == pygame.K_SPACE:  # 발사키
                    if len(bullet_xy) < 2:
                        bullet_x = x + fight_width / 2
                        bullet_y = y - fight_height
                        bullet_xy.append([bullet_x, bullet_y])

            if event.type == pygame.KEYUP:
                if event.key == pygame.K_LEFT or event.key == pygame.K_RIGHT:
                    x_change = 0

        gamepad.fill(BLACK)

        x += x_change
        if x < 0:
            x = 0
        elif x > pad_width - fight_width:
            x = pad_width - fight_width
        # 게이머 전투기가 적과 충돌했는지 체크
        if y < enemy_y + enemy_height:
            if (
                    enemy_x > x and enemy_x < x + fight_width) \
                    or (enemy_x + enemy_width > x and enemy_x+ enemy_width < x + fight_width):
                crash()

        drawObject(fighter, x, y)

        # 전투기 무기 발사 구현
        if len(bullet_xy) != 0:
            for i, bxy in enumerate(bullet_xy):
                bxy[1] -= 10
                bullet_xy[i][1] = bxy[1]

                if bxy[1] < enemy_y:
                    if bxy[0] > enemy_x and bxy[0] < enemy_x + enemy_width:
                        bullet_xy.remove(bxy)  # 충돌하면 무기 리스트에서 제거
                        isShot = True  # 충돌로 설정
                        shotcount += 1  # 충돌횟수 증가처리

                if bxy[1] <= 0:  # 위로 통과
                    try:
                        bullet_xy.remove(bxy)
                    except:
                        pass

        if len(bullet_xy) != 0:  # 미사일이 있으면 표시
            for bx, by in bullet_xy:
                drawObject(bullet, bx, by)

        drawScore(shotcount)  # 점수 표시

        # 적 구현
        enemy_y += enemy_speed

        if enemy_y > pad_height:  # 적이 밑으로 통과하면
            enemy_x = random.randrange(0, pad_width - enemy_width)  # 좌표 재설정
            enemy_y = 0
            enemypassed += 1  # 통과 횟수 증가 처리

        if enemypassed == 3:  # 통과 횟수가 3이면 게임 종료
            gameover()

        drawPassed(enemypassed)  # 통과 횟수 그리기

        if isShot:  # 격추하면 스피드는 점점 빨라지고 최대 10으로
            enemy_speed += 1
            if enemy_speed >= 10:
                enemy_speed = 10

            enemy_x = random.randrange(0, pad_width - enemy_width)
            enemy_y = 0
            isShot = False

        drawObject(enemy, enemy_x, enemy_y)

        pygame.display.update()
        clock.tick(60)

    pygame.quit()


def initGame():
    global gamepad, fighter, clock
    global bullet, enemy

    pygame.init()
    gamepad = pygame.display.set_mode((pad_width, pad_height))
    pygame.display.set_caption('MyGalaga')
    fighter = pygame.image.load('d:/data/game/gunship.png')
    enemy = pygame.image.load('d:/data/game/enemy.png')
    bullet = pygame.image.load('d:/data/game/missile.png')

    clock = pygame.time.Clock()


initGame()
runGame()