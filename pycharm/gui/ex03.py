import wx

app= wx.App()
frame = wx.Frame(None, title='wxPython')
# StaticText 고정문자열
static = wx.StaticText(frame, label='Fruit')
# panel :여러 위젯들을 묶어서 배치할 때 사용
panelhorz = wx.Panel(frame)
btnApple = wx.Button(panelhorz, label='apple')

def onApple(event):
    #staticText 내용을 변경
    static.SetLabelText('Apple')
#버튼을 누르면 onApple 함수 호출
btnApple.Bind(wx.EVT_BUTTON, onApple)

btnOrange= wx.Button(panelhorz, label='Orange')

def onOrange(event):
    static.SetLabelText('Orange')

#버튼을 누르면 onOrange() 함수가 호출됨
btnOrange.Bind(wx.EVT_BUTTON, onOrange)

sizerhorz = wx.BoxSizer(wx.HORIZONTAL)
sizerhorz.Add(btnApple)
sizerhorz.Add(btnOrange)
panelhorz.SetSizer(sizerhorz)

box=wx.BoxSizer(wx.VERTICAL)
frame.SetSizer(box)
# wx.ALL 상하좌우 , ALIGN_CENTER_HORIZONTAL 수직 중앙 배치
box.Add(static, border=20, flag=wx.ALL|wx.ALIGN_CENTER_HORIZONTAL)

box.Add(panelhorz, flag= wx.ALIGN_CENTER_HORIZONTAL) #수평 중앙 배치

frame.Show(True)
app.MainLoop()
