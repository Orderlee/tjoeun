import tkinter as tk
from tkinter import messagebox as msg
from tkinter import ttk

root = tk.Tk()
root.title("다이얼로그")
root.geometry("240x80")

def show():
    answer = msg.askyesnocancel("질문",'삭제할까요?')
    print(answer)
    #answer = msg.askyesno('질문','삭제할까요?')
    if answer==True:
        lblResult['text']='예를 눌렀습니다.'
    elif answer == False:
        lblResult['text']='아니오를 눌렀습니다.'
    elif answer == None:
        lblResult['text'] ='취소를 눌렀습니다.'

button=tk.Button(root, text='클릭하세요',command=show)
button.grid(column=0,row=0)
lblResult=ttk.Label(root)
lblResult.grid(column=0, row=1)
root.mainloop()