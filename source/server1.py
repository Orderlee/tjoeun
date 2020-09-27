#메시지 서버
import socket #소켓 모듈
HOST='' #호스트(ip, 생략하면 내 컴퓨터)
PORT=9009 #서비스 제공을 위한 포트번호

def runServer(): #함수 선언
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as sock:
        sock.bind((HOST,PORT)) #지정된 ip,port에 연결
        sock.listen(1) #연결가능한 클라이언트수 지정(5까지 가능)
        print('클라이언트의 연결을 기다리는 중...')
        conn, addr= sock.accept() #접속할 때까지 대기
        
    with conn:
        print('[%s]와 연결됨' % addr[0])
        while True:
            data=conn.recv(1024) #데이터 수신
            if not data: #데이터가 없으면 종료
                break
            # decode() 바이너리 형식을 텍스트 형식으로 변환
            print('메시지 수신:[%s]' % data.decode())
            conn.sendall((addr[0]+'님의 방문을 환영합니다.').encode()) #클라이언트에게 전송

runServer() #함수호출