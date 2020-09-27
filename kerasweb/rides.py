from flask import Flask,render_template,request
from keras.models import load_model
import numpy as np
import joblib

#플라스크 앱 생성
app = Flask(__name__)

#시작 페이지에 대한 url mapping
@app.route('/',methods=['GET'])
def main():
    #templates/rides/input.html 페이지가 출력됨
    return render_template('rides/input.html')

@app.route('/result',methods=['POST'])
def result():
    model = load_model('d:/data/rides/rides_keras.model') #신경망 모형
    model.load_weights('d:/data/rides/rides.weights') #신경망의 가중치
    scaler = joblib.load('d:/data/rides/scaler.sav') #MinMaxScaler
    week= request.form['week'] #주말여부 변수
    if week=='1':
        weekend='주말'
    else:
        weekend='평일'
    child = int(request.form['child']) #자녀수
    distance = int(request.form['distance']) #거리
    rides = int(request.form['rides']) #놀이기구 점수
    games = int(request.form['games']) #게임점수
    wait= int(request.form['wait']) #대기시간 점수
    clean = int(request.form['clean']) #청결 점수

    test_set=np.array([week,child,distance,rides,games,wait,clean]).reshape(1,7)

    test_set_scaled=scaler.transform(test_set) #MinMaxScaler 적용
    print(test_set)
    print(test_set_scaled)
    rate=model.predict(test_set_scaled) #분류
    print(rate)
    if rate >=0.5: #sigmoid 함수의 결과값이 0.5 이상이면 1로 처리
        result='만족'
    else: #0.5보다 작으면 0으로 처리
        result='불만족'
        #result.html 페이지가 화면에 출력됨
    return render_template('rides/result.html',
                           rate='{:.2f}%'.format(rate[0][0]*100),result=result,
                           weekend=weekend,child=child, distance=distance,rides=rides,games=games,
                           wait=wait,clean=clean)
#외부에서 import 한 것이 아닌 현재 코드를 직접 실행했다면
if __name__ =='__main__':
    app.run(port=80, threaded=False)