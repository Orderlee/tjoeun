from flask import Flask,render_template,request
from keras.models import load_model
import numpy as np
#플라스크 앱을 만들고
app = Flask(__name__)

#http://127.0.0.1/ => templates/titanic/input.html
@app.route('/',methods=['GET'])
def main():
    return render_template('titanic/input.html')

#http://127.0.0.1/result , post방식 호출
@app.route('/result',methods=['POST'])
def iris_result():
    #keras 신경망 모형과 가중치값을 불러오고
    model=load_model('d:/data/titanic/titanic_keras.model')
    model.load_weights('d:/data/titanic/titanic.weights')
    #사용자가 입력한 값들을 가져와서 처리
    sex=request.form['sex']
    if sex =='male':
        male=1
        female=0
        gender='남성'
    else:
        male=0
        female=1
        gender='여성'
    pclass=request.form['pclass'] #좌석등급
    if pclass=='1':
        pclass1=1
        pclass2=0
        pclass3=0
    elif pclass=='2':
        pclass1=0
        pclass2=1
        pclass3=0
    elif pclass=='3':
        pclass1=0
        pclass2=0
        pclass3=1
    age = int(request.form['age']) #나이
    fare= int(request.form['fare']) #요금
    sibsp= int(request.form['sibsp']) #동승자수(형제, 배우자)
    parch = int(request.form['parch']) #동승자수(부모, 자녀)
    #keras 신경망에 값을 입력(차원을 변경해야 함)
    test_set=np.array([pclass1,pclass2,pclass3,male,female,
                       age,sibsp,parch,fare]).reshape(1,9)
    rate=model.predict(test_set) #예측값 계산
    if rate>=0.5:
        result='생존'
    else:
        result='사망'
    #templates/titanic/result.html 페이지에 결과 출력
    return render_template('titanic/result.html',
                           rate='{:.2f}%'.format(rate[0][0]*100),result=result,
                           sex=gender, pclass=pclass, age=age, fare=fare, sibsp=sibsp, parch=parch)
#현재 코드에서 실행된 경우
if __name__ =='__main__':
    #플라스크 앱을 실행시킴
    app.run(port=8000,threaded=False)