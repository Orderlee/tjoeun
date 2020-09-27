from flask import Flask, render_template, request
import numpy as np
from keras.models import load_model
import gensim
from konlpy.tag import Okt

#플라스크 앱을 만들고
app= Flask(__name__)

MIN_NOUN_VECTOR_VALUE=-10.0
MAX_NOUN_VECTOR_VALUE=10.0
NOUN_VECTOR_SIZE=100 #벡터 사이즈 (벡터의 차원)


def generate_random_noun_vector():
    return np.random.uniform(low=MIN_NOUN_VECTOR_VALUE,
                            high=MAX_NOUN_VECTOR_VALUE,
                            size=(NOUN_VECTOR_SIZE,))

def generate_zero_noun_vector():
    return np.random.uniform(low=0.0, high=0.0,
                            size=(NOUN_VECTOR_SIZE, ))


#http://127.0.01 주소를 요청하면
@app.route('/')
def home():
    # templates/text/index.html 페이지가 출력됨
    return render_template('text/index.html')

@app.route('/text_result',methods=['POST'])
def result():
    #신경망 모형과 가중치를 불러오고
    model=load_model('d:/data/text/text_cnn_keras.model')
    model.load_weights('d:/data/text/text_cnn.weights')
    #사용자가 입력한 리뷰 텍스트를 저장
    text=request.form['text']

    twitter_nlp=Okt() #트위터 형태소 분석기
    title_noun_arr=[]
    #리뷰 텍스트의 명사만 추출
    title_noun_arr.append(twitter_nlp.nouns(text))

    #벡터 모델을 불러와서 텍스트를 벡터로 변환환
    w2v_model = gensim.models.Word2Vec.load('d:/data/text/text_100.model')
    title_noun_vector_arr = []
    for index, title_nouns in enumerate(title_noun_arr):
        if index % 1000 == 0:
            print('step:', index)
        noun_vector_arr = []
        for noun in title_nouns:
            try:  # 단어별로  word2vec 모델 적용
                noun_vector = w2v_model[noun]
            except:
                noun_vector = generate_random_noun_vector()
            noun_vector_arr.append(noun_vector)
        title_noun_vector_arr.append(noun_vector_arr)

    for index, title_noun_vector in enumerate(title_noun_vector_arr):
        if index % 1000 == 0:
            print('step:', index)
        # 최대 문장 길이보다 짧은 경우
        while len(title_noun_vector) < 37:
             # 0으로 채움
            title_noun_vector.append(generate_zero_noun_vector())
        title_noun_vector = title_noun_vector[:37]
    #신경망 모형에 입력하기 위하여 차원을 변경시키고
    noun_vector_arr=np.array(title_noun_vector_arr).reshape(1,37,100,1)
    #모형에 입력하여 예측값을 얻음
    pred=model.predict(noun_vector_arr)
    a=pred[0][0]
    result=''
    if a>=0.5:
        result='긍정'
    else:
        result='부정'
    return render_template('text/result.html', result=result, rate='{:.2f}%'.format(a*100),review=text)



    #벡터 모형을 불러와서 단어들을 벡터로 변환
    w2v_model=gensim.models.Word2Vec.load('d:/data/text/text_100.model')
    title_noun_vector_arr=[]


#현재 코드를 실행한 경우 플라스크 앱 실행
if __name__ == '__main__':
    app.run(port=80, threaded=False)
