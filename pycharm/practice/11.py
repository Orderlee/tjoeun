import tkinter as tk
from tkinter import ttk
from time import sleep

def run_progressbar():
    progress_bar['maximum']=100
    for i in range(101):
        sleep(1)
        progress_bar['value']=i
        progress_bar.update()

    lblResult.config(text='완료되었습니다.')

root=tk.Tk()

root.title("Tkinter GUI")

button = ttk.Button(root, text='Run Progressbar', command=run_progressbar)
button.grid(column = 0, row=0, sticky='W')

progress_bar = ttk.Progressbar(root,orient="horizontal",length=286, mode="determinate")
progress_bar.grid(column=0, row=1, pady=2)

lblResult = ttk.Label(root)
lblResult.grid(column=0, row=2)

root.mainloop()