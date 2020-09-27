import tkinter as tk
from tkinter import ttk # tkinter 테마위젯

root=tk.Tk()
root.title('콤보박스 이벤트')
root.geometry('240x240')

itemVar=tk.StringVar() #콤보박스와 calc 함수를 연결하는 함수
def calc(e):
    #print(dir(e))
    dan=int(itemVar.get()) #스트링변수를 정수형으로 변환
    result=''
    for i in range(1,10):
        result += '{} x {} = {}\n'.format(dan,i,dan*i)
    lblResult['text']=result # 라벨의 텍스트가 변경됨

#콤보박스의 값을 선택하면 calc 함수에 itemVar 변수 값이 전달됨
cboDan=ttk.Combobox(root, width=10, textvariable=itemVar) #콤보박스
#콤보박스의 값을 선택하면 calc 함수가 호출되도록 연결시키는 코드
cboDan.bind('<<ComboboxSelected>>',calc)
cboDan['values']=tuple(range(2,10)) #콤보박스에 표시할 값들
cboDan.current(0) #콤보박스의 기본값
cboDan.grid(column=0, row=0) #0행 0열에 콤보박스 배치

lblResult=ttk.Label(root) #테마위젯 라벨
lblResult.grid(column=0, row=1) #라벨을 1행 0열에 배치
root.mainloop()