import tkinter as tk
from tkinter import ttk
from tkinter import scrolledtext
from tkinter import messagebox as msg

import pymysql


def get_connection():
    conn = pymysql.connect(host="localhost", user="web", password="1234", db="web", charset="utf8")
    return conn


def book_search():
    keyword = keyword_var.get()

    conn = get_connection()

    cursor = conn.cursor()

    sql = "select * from book where title like %s"
    cursor.execute(sql, ("%" + keyword + "%"))

    rows = cursor.fetchall()

    isbn_list = []
    for row in rows:
        isbn_list.append("[{}] {}".format(row[0], row[1]))

    conn.close()

    book_list_var.set(isbn_list)


def book_list():
    conn = get_connection()

    cursor = conn.cursor()

    sql = "select * from book"
    cursor.execute(sql)

    rows = cursor.fetchall()

    isbn_list = []
    for row in rows:
        isbn_list.append("[{}] {}".format(row[0], row[1]))

    conn.close()

    book_list_var.set(isbn_list)


def book_read():
    selected_item = book_listbox.get(book_listbox.curselection())

    idx = selected_item.find("]")

    selected_isbn = selected_item[1:idx]

    conn = get_connection()

    cursor = conn.cursor(pymysql.cursors.DictCursor)

    sql = "select * from book where isbn = %s"
    cursor.execute(sql, (selected_isbn))

    rows = cursor.fetchall()
    for row in rows:
        isbn_var.set(row["isbn"])
        title_var.set(row["title"])
        author_var.set(row["author"])
        price_var.set(row["price"])
        publisher_var.set(row["publisher"])
        pubdate_var.set(row["pubdate"])

        editDescription.delete("1.0", tk.END)
        editDescription.insert(tk.INSERT, row["description"])
        editDescription.see(tk.END)

    conn.close()


def book_reset():
    isbn_var.set("")
    title_var.set("")
    author_var.set("")
    price_var.set("")
    publisher_var.set("")
    pubdate_var.set("")
    editDescription.delete("1.0", tk.END)


def book_register():
    isbn = isbn_var.get()
    title = title_var.get()
    author = author_var.get()
    price = price_var.get()
    publisher = publisher_var.get()
    pubdate = pubdate_var.get()
    description = editDescription.get("1.0", tk.END)
    conn = get_connection()
    curs = conn.cursor()
    sql = """insert into book(isbn,title,author,price,publisher,pubdate,description) 
             values (%s, %s, %s, %s, %s, %s, %s)"""
    curs.execute(sql, (isbn, title, author, price, publisher, pubdate, description))

    conn.commit()
    conn.close()
    show("등록이 완료되었습니다.")
    book_reset()
    book_list()


def book_modify():
    isbn = isbn_var.get()
    title = title_var.get()
    author = author_var.get()
    price = price_var.get()
    publisher = publisher_var.get()
    pubdate = pubdate_var.get()
    description = editDescription.get("1.0", tk.END)

    conn = get_connection()

    curs = conn.cursor()

    sql = """update book set title = %s, author = %s, price = %s, 
             publisher = %s, pubdate = %s, description = %s where isbn = %s"""

    curs.execute(sql, (title, author, price, publisher, pubdate, description, isbn))

    conn.commit()

    conn.close()

    show("수정되었습니다.")


def book_delete():
    isbn = isbn_var.get()

    conn = get_connection()

    cursor = conn.cursor()

    sql = "delete from book where isbn = %s"

    cursor.execute(sql, isbn)

    conn.commit()

    conn.close()

    show("삭제되었습니다.")

    book_reset()
    book_list()


def show(message):
    msg.showinfo("정보", message)



root = tk.Tk()

root.title("도서 관리")
root.geometry("800x480")

panedwindow1 = ttk.PanedWindow(root, orient = tk.HORIZONTAL)
panedwindow1.pack(fill = tk.BOTH, expand = True)

lef_frame = tk.Frame(panedwindow1, padx = 4, pady = 4, bd = 2, relief = tk.RIDGE)

search_frame = tk.Frame(lef_frame, padx = 4, pady = 4)
search_frame.pack()

lblSearch = ttk.Label(search_frame, text = "검색어:")
lblSearch.pack(side = tk.LEFT)

keyword_var = tk.StringVar()
keyword_entry = ttk.Entry(search_frame, textvariable = keyword_var)
keyword_entry.pack(side = tk.LEFT)

btnSearch = ttk.Button(search_frame, text ="검색", command = book_search)
btnSearch.pack(side = tk.RIGHT)

scrollbar = ttk.Scrollbar(lef_frame)
scrollbar.pack(side = tk.RIGHT, fill = tk.Y)


book_list_var = tk.StringVar()

book_listbox = tk.Listbox(lef_frame, bd = 2, relief = tk.RIDGE, yscrollcommand = scrollbar.set, listvariable = book_list_var)

book_listbox.pack(side = tk.TOP, fill = tk.BOTH, expand = True)

scrollbar.config(command = book_listbox.yview)

panedwindow1.add(lef_frame)

center_frame = tk.Frame(panedwindow1, padx = 4, pady = 4, bd = 2, relief = tk.RIDGE)

lblIsbn = ttk.Label(center_frame, text = "ISBN:")
lblIsbn.grid(column = 0, row = 0, pady = 3, sticky = tk.E)

isbn_var = tk.StringVar()
isbn_entry = ttk.Entry(center_frame, textvariable = isbn_var)
isbn_entry.grid(column = 1, row = 0, padx = 4, pady = 3, sticky = tk.W)

lblTitle = ttk.Label(center_frame, text = "제목:")
lblTitle.grid(column = 0, row = 1, pady = 3, sticky = tk.E)



title_var = tk.StringVar()
title_entry = ttk.Entry(center_frame, width = 50, textvariable = title_var)
title_entry.grid(column = 1, row = 1, padx = 4, pady = 3, sticky = tk.W)

lblAuthor = ttk.Label(center_frame, text = "작가명:")
lblAuthor.grid(column = 0, row = 2, pady = 3, sticky = tk.E)

author_var = tk.StringVar()
author_entry = ttk.Entry(center_frame, textvariable = author_var)
author_entry.grid(column = 1, row = 2, padx = 4, pady = 3, sticky = tk.W)

lblPrice = ttk.Label(center_frame, text = "가격:")
lblPrice.grid(column = 0, row = 3, pady = 3, sticky = tk.E)

price_var = tk.StringVar()
price_entry = ttk.Entry(center_frame, textvariable = price_var)
price_entry.grid(column = 1, row = 3, padx = 4, pady = 3, sticky = tk.W)

lblPublisher = ttk.Label(center_frame, text = "출판사:")
lblPublisher.grid(column = 0, row = 4, pady = 3, sticky = tk.E)

publisher_var = tk.StringVar()
publisher_entry = ttk.Entry(center_frame, textvariable = publisher_var)
publisher_entry.grid(column = 1, row = 4, padx = 4, pady = 3, sticky = tk.W)

lblPubdate = ttk.Label(center_frame, text = "출판일:")
lblPubdate.grid(column = 0, row = 5, pady = 3, sticky = tk.E)

pubdate_var = tk.StringVar()
pubdate_entry = ttk.Entry(center_frame, textvariable = pubdate_var)
pubdate_entry.grid(column = 1, row = 5, padx = 4, pady = 3, sticky = tk.W)

lblDescription = ttk.Label(center_frame, text = "설명:")
lblDescription.grid(column = 0, row = 6, pady = 3, sticky = tk.E)

scrol_w  = 50
scrol_h  =  10
editDescription = scrolledtext.ScrolledText(center_frame, width = scrol_w, height = scrol_h, wrap = tk.WORD)
editDescription.grid(column = 1, row = 6, padx = 4, pady = 3, sticky = tk.W)

panedwindow1.add(center_frame)

bottom_frame = tk.Frame(root, padx = 4, pady = 4)
bottom_frame.pack()



btnList = ttk.Button(bottom_frame, text = "목록", command = book_list)
btnList.pack(side = tk.LEFT)


btnView = ttk.Button(bottom_frame, text = "보기", command = book_read)
btnView.pack(side = tk.LEFT)

btnReset = ttk.Button(bottom_frame, text = "리셋", command = book_reset)
btnReset.pack(side = tk.LEFT)

btnSave = ttk.Button(bottom_frame, text = "등록", command = book_register)
btnSave.pack(side = tk.LEFT)

btnUpdate = ttk.Button(bottom_frame, text = "수정", command = book_modify)
btnUpdate.pack(side = tk.LEFT)

btnDel = ttk.Button(bottom_frame, text = "삭제", command = book_delete)
btnDel.pack(side = tk.LEFT)

root.mainloop()

