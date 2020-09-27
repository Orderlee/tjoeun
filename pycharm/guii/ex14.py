from tkinter import*
import tkinter.messagebox as msg

# Menu(프레임) > Menu(메뉴바)
# add_cascade() 드롭다운 메뉴 추가
# add_command() 세부 메뉴 아이템 추가

main=Tk()
main.title('메뉴 예제')
main.geometry('300x200')
menubar=Menu(main) #메뉴 위젯 생성
main['menu']=menubar #프레임의 메뉴로 설정
menu1=Menu(menubar) #하위 메뉴
menubar.add_cascade(label='파일',menu=menu1) #계층형 드롭다운 메뉴 추가

def about():
    msg.showinfo('소개','메뉴 사용 예제입니다.')

def quit():
    msg.showwarning('종료','프로그램을 종료합니다.')
    main.destroy() #현재 프레임을 메모리에서 제거
    exit() #프로그램을 종료시킵

#메뉴 아이템을 클릭하면 about 함수 호출
menu1.add_command(label='소개', command = about) #메뉴 아이템 추가
#메뉴 아이템을 클릭하면 quit 함수 호출
menu1.add_command(label='종료', command = quit)
main.mainloop()