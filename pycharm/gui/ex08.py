import wx
app=wx.App()
frame=wx.Frame(None,title='메뉴 예제')
menubar=wx.MenuBar() #메뉴바
file=wx.Menu() #메뉴
menubar.Append(file,'파일') #메뉴바에 메뉴를 붙임
about=wx.MenuItem(id=wx.ID_ANY, text='소개') #메뉴 아이템
file.Append(about) #메뉴에 메뉴아이템을 붙임
file.AppendSeparator() #메뉴 구분선
exit=wx.MenuItem(id=wx.ID_ANY, text='종료')
file.Append(exit)
frame.SetMenuBar(menubar) #프레임에 메뉴바를 붙임
def onAbout(event):
    wx.MessageBox('메뉴 사용 예제','알림',wx.OK)
frame.Bind(wx.EVT_MENU, onAbout,about)
def onExit(event):
    frame.Close()
frame.Bind(wx.EVT_MENU,onExit,exit)
frame.Show(True)
app.MainLoop()