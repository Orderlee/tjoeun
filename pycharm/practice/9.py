import tkinter as tk
from tkinter import ttk
root = tk.Tk()

root.title("Tkinter GUI")
root.geometry("240x60+100+100")

combobox = ttk.Combobox(root,width=12)
combobox['values'] = (10,20,30)
combobox.current(0)

combobox.pack()

root.mainloop()