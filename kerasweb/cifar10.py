from flask import Flask, render_template, request
from PIL import Image
import numpy as np
from keras.models import load_model

#플라스크 앱을 만들고
app=Flask(__name__)

#시작페이지를 호출하면 templates/cifar/index.html 페이지가 출력됨
@app.route('/')
def main():
    return render_template('cifar/index.html')

@app.route('/uploader',methods=['POST'])
def upload_image():
    #학습 모형과 가중치를 불러오고
    model=load_model('d:/data/cifar/cifar_keras.model')
    model.load_weights('d:/data/cifar/cifar.weight')
    #업로드한 이미지
    img=Image.open(request.files['file'].stream)
    #이미지 사이즈가 32x32가 아닌 경우 사이즈 조절
    img=img.resize((32,32))
    #넘파이 배열로 변환
    arr=np.array(img)
    #keras 모형에서 사용할 수 있도록 차원 변경
    arr=arr.reshape(1,32,32,3)
    #분류 결과
    pred=model.predict_classes(arr)
    a=pred[0]
    names=['비행기','자동차','새','고양이','사슴','개','개구리','말','배','트럭']
    return '이미지 분류 결과:' +names[a]



#외부에서 import한 코드가 아니면
if __name__=='__main__':
    #플라스크 앱을 실행시킴
    app.run(port=80, threaded=False)