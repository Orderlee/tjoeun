import tkinter as tk
from tkinter import scrolledtext

root = tk.Tk()
root.title("Tkinter GUI")
root.geometry("240x120")

scrol_w = 30
scrol_h = 5

scr = scrolledtext.ScrolledText(root, width=scrol_w,height=scrol_h)

scr.pack()

root.mainloop()