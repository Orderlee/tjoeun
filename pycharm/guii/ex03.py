import tkinter as tk
import guii.members as m

root=tk.Tk()
root.title('Tkinter GUI')

lbl1=tk.Label(root,text='아이디')
lbl1.grid(column=0,row=0) # 0행 0열에 배치

var1=tk.StringVar()
#엔트리에 입력한 텍스트를 저장할 변수 textvariable
id=tk.Entry(root, textvariable=var1) #텍스트 입력
id.grid(column=1, row=0) # 0행 1열

lbl2=tk.Label(root, text='비번') #라벨
lbl2.grid(column=0, row=1)
var2=tk.StringVar()
pw=tk.Entry(root, textvariable=var2, show='*') # show 입력마스킹
pw.grid(column=1,row=1)

def login():
    result=m.login_check(var1.get(), var2.get())
    lblResult['text']=result
    # #라벨의 텍스트가 변경됨
    # #lblResult['text']='아이디:'+var1.get()
    # if var1.get()=='kim' and var2.get()=='1234':
    #     lblResult['text']='김철수님 환영합니다.'
    # else:
    #     lblResult['text']='아이디 또는 비밀번호가 틀렸습니다.'

#버튼을 누르면 login 함수가 호출됨
button1=tk.Button(root,text='확인',command=login)
button1.grid(column=1, row=2,sticky='w') # 2행 1열
lblResult=tk.Label(root,text='결과:')
lblResult.grid(column=1,row=3) #3행 1열
root.mainloop()