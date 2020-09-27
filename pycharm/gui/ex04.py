import wx

app=wx.App()
frame=wx.Frame(None, title='wxPython')
#텍스트 입력 상자
text=wx.TextCtrl(frame)
btn=wx.Button(frame, label='클릭하세요')

text2=wx.StaticText(frame, label='입력한 내용')

def onClick(event):
    str=text.GetValue() #입력한 텍스트값을 가져옴
    #메시지 박스에 표시
    wx.MessageBox(str, '입력내용',wx.OK)
    text2.SetLabelText('입력한 내용:'+str)

#버튼 클릭 =>onClick
btn.Bind(wx.EVT_BUTTON, onClick)
box=wx.BoxSizer(wx.VERTICAL)
frame.SetSizer(box)
box.Add(text)
box.Add(btn)
box.Add(text2)
frame.Show(True)
app.MainLoop()