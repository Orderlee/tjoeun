import wx

app=wx.App() #애플리케이션 생성
frame =wx.Frame(None, title='wxPython') #프레임 생성

btn1 = wx.Button(frame, label='버튼1') #버튼 생성
btn2 = wx.Button(frame, label='버튼2')
btn3 = wx.Button(frame, label='버튼3')

box=wx.BoxSizer(wx.VERTICAL) #박스사이저(세로방향)
frame.SetSizer(box) #프레임에 박스사이저를 붙임
box.Add(btn1, border=10) #박스사이저에 버튼을 붙임
box.Add(btn2, border=10, flag=wx.ALL) #상하좌우 여백
#box.Add(btn2, border=10, flag=wx.LEFT) #좌측 여백
box.Add(btn3, border=10)

frame.Show(True) #프레임을 화면에 표시
app.MainLoop() #애플리케이션 실행



