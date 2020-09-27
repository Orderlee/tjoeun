from flask import Flask,render_template,request
from keras.models import load_model
import numpy as np

#플라스크 앱을 만들고
app=Flask(__name__)

#http://127.0.0.1/iris => templates/iris/input.html
@app.route('/iris',methods=['GET'])
def main():
    return render_template('iris/input.html')

@app.route('/iris_result',methods=['POST'])
def iris_result():
    flowers=['setosa','versicolor','virginica'] #품종이름
    #keras 모형과 가중치를 불러오고
    model=load_model('d:/data/iris/iris_keras.model')
    model.load_weights('d:/data/iris/iris_keras.weights')
    #사용자가 입력한 값들을 저장하고
    a = float(request.form['a'])
    b = float(request.form['b'])
    c = float(request.form['c'])
    d = float(request.form['d'])
    #넘파이 배열로 만든후
    test_set=np.array([[a,b,c,d]])
    #신경망 모형에 입력하여 예측
    n=model.predict_classes(test_set)
    result=flowers[n[0]]
    #결과 페이지로 넘어가서 출력
    return render_template('iris/result.html',
                           result=result ,a=a, b=b, c=c, d=d)

#프로그램의 시작점
if __name__ =='__main__':
    #플라스크 앱이 실행됨
    app.run(port=8000, threaded=False)