import tkinter as tk

root = tk.Tk()
root.title("Tkinter GUI")
root.geometry("240x120")

win1=tk.PanedWindow(root)
win1.pack(fill=tk.BOTH, expand=1)

left= tk.Label(win1, text="left pane", bg="blue")
win1.add(left)

win2=tk.PanedWindow(win1, orient=tk.VERTICAL)
win1.add(win2)

top= tk.Label(win2, text='top pane',bg='red')
win2.add(top)

bottom = tk.Label(win2,text='bottom pane',bg='green')
win2.add(bottom)

root.mainloop()