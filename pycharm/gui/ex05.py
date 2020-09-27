import wx

app=wx.App()
frame=wx.Frame(None, title='구구단')
text=wx.TextCtrl(frame)
btn=wx.Button(frame, label='계산')
text2=wx.StaticText(frame, label='입력한 내용')

def onClick(event):
    #텍스트박스에 입력한 내용을 읽어서 숫자로 저장
    dan=int(text.GetValue())
    result=''
    for i in range(1,10):
        result += '{} x {} = {}\n'.format(dan,i,dan*i)
    text2.SetLabelText(result) #StaticText에 출력


btn.Bind(wx.EVT_BUTTON, onClick)
box=wx.BoxSizer(wx.VERTICAL)
frame.SetSizer(box)
box.Add(text)
box.Add(btn)
box.Add(text2)
frame.Show(True)
app.MainLoop()