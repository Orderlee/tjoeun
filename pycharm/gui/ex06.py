import wx

app=wx.App() #애플리케이션 생성
frame = wx.Frame(None, title='wxPython') #프레임 생성

panel= wx.Panel(frame) #패널 생성

colorname=['빨강','초록','파랑','노랑','하양','검정']
# Colour(Red,Green,Blue,Alpha)
colorvalue = [wx.Colour(255,0,0,0), wx.Colour(0,255,0,0),
              wx.Colour(0,0,255,0), wx.Colour(255,255,0,0),
              wx.Colour(255,255,255,0),wx.Colour(0,0,0,0)]
# 패널에 리스트박스를 붙임
colorlist=wx.ListBox(panel,choices=colorname) #리스트 박스
colorlist.SetSize(wx.Size(100,150)) #리스트박스의 사이즈 설정
colorlist.SetPosition(wx.Point(100,20)) #리스트박스를 표시할 좌표

def onitemchange(event):
    idx=colorlist.GetSelection() #선택한 값의 인덱스
    print(idx)
    color = colorvalue[idx]
    frame.SetBackgroundColour(color) #배경색 변경
    frame.Refresh() #프레임을 새로고침
#리스트박스의 아이템을 선택하면 onitemchange() 실행
colorlist.Bind(wx.EVT_LISTBOX, onitemchange)

frame.Show(True)
app.MainLoop()