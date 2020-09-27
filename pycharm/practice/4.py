import tkinter as tk

root=tk.Tk()
root.title("tkinter GUI")
root.geometry("240x120")

labelframe= tk.LabelFrame(root, text='Fill')
labelframe.pack(fill='both',expand='yes')

label = tk.Label(labelframe, text="Inside the Label Frame")
label.pack()

root.mainloop()