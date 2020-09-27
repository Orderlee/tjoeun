import socketserver
import sys
HOST=''
PORT=9009

class MyTcpHandler(socketserver.BaseRequestHandler):
    def handle(self):
        print('[%s]와 연결됨' % self.client_address[0])
        try:
            while True:
                self.data=self.request.recv(1024)
                if self.data.decode=='/quit':
                    print('[%s] 사용자에 의해 중단' % self.client_address[0])
                    return
                print('[%s]' % self.data.decode())
                
                msg = input('메시지 입력:')
                if msg == '/quit':
                    self.request.sendall('/quit'.encode())
                    print('서비스를 종료합니다.')
                    sys.exit()
               
                self.request.sendall(self.data)
        except Exception as e:
            print(e)
            
def runServer():
    print('서버 시작...')
    print('끝내시려면 Ctrl+C를 누르세요.')
    try:
        server=socketserver.TCPServer((HOST,PORT), MyTcpHandler)
        server.serve_forever() #클라이언트의 접속을 기다림
    except KeyboardInterrupt:
        print('서버를 종료합니다.')
runServer()
        