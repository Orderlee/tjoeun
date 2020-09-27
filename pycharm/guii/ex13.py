from tkinter import*
import tkinter.messagebox as msg
import tkinter.simpledialog as dlg

main = Tk()

def btnclick():
    #스트링 변수 입력
    name= dlg.askstring('질문','이름을 입력하세요.')
    #정수 변수 입력
    age = dlg.askinteger('질문','나이를 입력하시오.')
    if name and age: #2개의 값이 입력되었으면
        msg.showwarning('환영',str(age) +'세 '+name+'님 반갑십니다.')

btn = Button(main, text='클릭', foreground='blue', command=btnclick)
btn.pack()

main.mainloop()