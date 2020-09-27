import tkinter as tk
from tkinter.scrolledtext import ScrolledText

root=tk.Tk()
root.title('메시지박스')
root.geometry('240x120')
#relief : 메시지박스의 테두리 설정
#solid,flat,sunken,ridge,groove,raised
#줄바꿈을 할 경우 \n 작성
message=tk.Message(root, text='안녕하세요 \n 반가워요.',
                   relief=tk.RAISED,width=100)

message.pack(fill=tk.BOTH)
#여러줄을 입력할 경우 ScrolledText 사용
text=ScrolledText(root)
text.pack()
root.mainloop()