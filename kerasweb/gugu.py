from flask import Flask, Markup, render_template, request

#플라스크 앱을 만들고
app = Flask(__name__)

#url pattern을 지정 http://127.0.0.1:8000/gugu => gugu.html 실행
@app.route('/gugu',methods=['GET'])
def main():
    #templates/gugu/gugu.html 페이지가 화면에 출력됨
    return render_template('gugu/gugu.html')

@app.route('/gugu_result', methods=['POST'])
def gugu_result():
    dan = int(request.form['dan']) #룸에서 전달된 값을 정수로 변환
    result=''
    for i in range(1,10):
        result += '{}x{}={}<br>'.format(dan,i,dan*i)
    result=Markup(result) #html 태그가 그대로 출력되도록 처리
    #페이지로 넘어가면서 값이 전달됨
    return render_template('gugu/gugu_result.html',result=result)
#프로그램이 시작되는 부분
if __name__ == '__main__':
    # port 지정, threaded 멀티스레드 사용 여부
    app.run(port=8000, threaded=False)
