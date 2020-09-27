#클라이언트측 프로그램
import socket
HOST=''
PORT=9009

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as sock:
    sock.connect((HOST,PORT)) #서버에 접속
    msg=input('메시지를 입력하세요:')
    #텍스트를 바이너리 형식으로 변환하여 서버에 전달
    sock.sendall(msg.encode())
    #서버로부터 바이너리 형식의 데이터를 받음
    data=sock.recv(1024)
    
print('서버로부터 받은 데이터:[%s]' % data.decode())