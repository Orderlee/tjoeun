import tkinter as tk

root = tk.Tk()
root.title("Tkinter GUI")
root.geometry("240x120")

label = tk.Label(root, text='안녕하세요')

label.pack()
root.mainloop()