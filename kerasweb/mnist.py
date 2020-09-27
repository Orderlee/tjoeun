from flask import Flask, render_template, request
from PIL import Image
import numpy as np
from keras.models import load_model

#플라스크 앱 작성
app = Flask(__name__)

#사용자가 요청한 주소가  http://127.0.0.1 이면
@app.route('/')
def upload_file():
    #templates/mnist/index.html 페이지가 출력됨
    return render_template('mnist/index.html')

@app.route('/uploader',methods=['POST'])
def upload_image():
    model=load_model('d:/data/mnist_keras.model')
    model.load_weights('d:/data/mnist.weights')
    #첨부파일을 그레이 스케일로 변환
    img=Image.open(request.files['file'].steam).convert('L')
    img=img.resize((28,28)) #28x28로 차원 변경
    arr=np.array(img) #모형에 입력하기 위하여 넘파이 배열로 변환
    print(arr.shape)
    # CNN모형에 설정된 4차원 형태로변환
    arr=arr.reshape(1,28,28,1)
    pred=model.predict_classes(arr) #예측값
    return '업로드한 숫자 이미지는 () 입니다.'.format(pred[0])


#외부에서 import 한 경우가 아니면
if __name__ == '__main__':
    #플라스크 앱을 실행시킴
    app.run(port=80, threaded=False)