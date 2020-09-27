import socketserver #클라이언트용 소켓
from os.path import exists

HOST=''
PORT=9009

class MyTcpHandler(socketserver.BaseRequestHandler):
    def handle(self):
        data_transferred = 0
        #클라이언트의 ip 출력됨
        print('[%s] 연결됨' % self.client_address[0])
        #클라이언트가 요청한 파일 이름
        filename=self.request.recv(1024)
        filename=filename.decode()
        #파일이 없으면 종료
        if not exists(filename):
            return
        print('파일 [%s] 전송 시작...' % filename)
        with open(filename, 'rb') as f:
            try:
                data=f.read(1024)
                while data:
                    data_transferred += self.request.send(data)
                    data=f.read(1024)
            except Exception as e:
                print(e)
        print('전송완료 [%s], 전송량 [%d]' %(filename,data_transferred))
    
def runServer():
    print('파일 서버 시작...')
    print('끝내려면 Ctrl+C를 누르세요.')
    try:
        #서비스를 위한 소켓 생성
        server=socketserver.TCPServer((HOST,PORT),MyTcpHandler)
        #사용자의 접속을 기다림
        server.serve_forever()
    except KeyboardInterrupt:
        print('파일 서버를 종료합니다.')
        
runServer() #함수 호출