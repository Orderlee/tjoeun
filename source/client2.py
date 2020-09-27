import socket
import sys

HOST='localhost'
PORT=9009

with socket.socket(socket.AF_INET,socket.SOCK_STREAM) as sock:
    sock.connect((HOST,PORT)) #서버에 접속
    while True:
        msg = input('메시지 입력:')
        if msg == '/quit':
            sock.sendall(msg.encode())
            break
        sock.sendall(msg.encode()) #바이너리로 바꿔서 전송
        data = sock.recv(1024)
        if data.decode()=='/quit':
            print('프로그램을 종료합니다.')
            sys.exit()
            
        print('서버로부터 받은 메시지: [%s]' %data.decode())
    
print('클라이언트 종료')