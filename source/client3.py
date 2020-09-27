import socket
HOST='localhost'
PORT=9009

def getFileFromServer(filename):
    data_transferred=0
    # AF_INET : ipv4, SOCK_STREAM : TCP 통신
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as sock:
        #서버에 접속
        sock.connect((HOST,PORT))
        # 바이너리 형식으로 인코딩하여 전송
        sock.sendall(filename.encode())
        #서버에서 보낸 값을 받음
        data=sock.recv(1024)
        if not data:
            print('파일 [%s] : 존재하지 않는 파일 또는 전송중 오류발생' % filename)
            return
        fname=filename.split('/')
        filename=fname[-1]
        with open('d:/download/'+filename,'wb') as f:
            try:
                while data:
                    f.write(data)
                    data_transferred += len(data)
                    data=sock.recv(1024)
            except Exception as e:
                print(e)
    print('파일[%s] 전송종료. 전송량 [%d]' % (filename,data_transferred))
    
filename=input('다운로드 받을 파일이름을 입력하세요:')
getFileFromServer(filename)