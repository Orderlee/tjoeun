import tkinter as tk

def sel1():
    #체크하면 1, 해제하면 0
    txt = '체크박스1=' + str(v1.get()) #정수변수값을 스트링으로 변환
    #label.config(text=txt) #라벨에 표시
    if v1.get()==1:
        label['text']='음악 선택'
    else:
        label['text']='음악 해제'
    if v1.get()+v2.get()==2:
        label['text']='음악,미술 선택'

def sel2():
    txt='체크박스2='+str(v2.get())
    #label.config(text=txt)
    if v2.get()==1:
        label['text']='미술 선택'
    else:
        label['text']='미술 해제'
    if v1.get() + v2.get() == 2:
        label['text'] = '음악,미술 선택'

root = tk.Tk() #프레임 생성
root.title('체크박스 이벤트')
root.geometry('240x120')

v1=tk.IntVar() #정수변수
v2=tk.IntVar()
#체크버튼 variable=변수이름 command=함수이름
ck1=tk.Checkbutton(root,text='음악',variable=v1, command=sel1)
ck2=tk.Checkbutton(root,text='미술',variable=v2, command=sel2)

ck1.pack()#적절하게 배치
ck2.pack()

label = tk.Label(root)
label.pack()

root.mainloop()
