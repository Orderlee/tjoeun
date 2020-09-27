from flask import Flask, render_template,request
from keras.models import load_model
import numpy as np
#MinMaxScaler를 불러오기 위한 패키지
import joblib

#플라스크 앱을 만들고
app=Flask(__name__)

#http://127.0.0.1로 --> main() 함수 실행
@app.route('/')
def main():
    #templates/ozone/input.html 페이지가 출력됨
    return render_template('ozone/input.html')

@app.route('/result',methods=['POST'])
def result():
    #모형을 불러오고
    model=load_model('d:/data/ozone/ozone_keras.model')
    #모형에 사용된 가중치를 불러오고
    model.load_weights('d:/data/ozone/ozone.weights')
    #사용자가 입력한 값들을 저장
    a = float(request.form['a'])
    b = float(request.form['b'])
    c = float(request.form['c'])
    #keras에 맞는 형식으로 변환
    test_set = np.array([a,b,c]).reshape(1,3)

    #joblib패키지를 이용하여 MinMaxScaler를 로딩하고
    scaler=joblib.load('d:/data/ozone/scaler.sav')
    #새로운 예측 데이터를 변환
    test_set_scaled=scaler.transform(test_set)
    #변환된 데이터를 모형에 입력하여 예측 결과 확인
    rate = model.predict(test_set_scaled)

    #분류
    #rate = model.predict(test_rate)
    if rate[0][0] >= 0.5:
        result='충분'
    else:
        result='부족'
    return render_template('ozone/result.html',
                           rate='{:.2f}%'.format(rate[0][0]*100),
                           result=result, a=a,b=b,c=c)


#현재 코드에서 실행한 경우
if __name__ =='__main__':
    # 플라스크 앱이 실행됨
    app.run(port=80, threaded=False)