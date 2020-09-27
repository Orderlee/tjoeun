import wx

app = wx.App()
frame = wx.Frame(None,title='wxPython')
#RadioButton : 한개만 선택할 때
radio1 = wx.RadioButton(frame, label='등산', style=wx.RB_GROUP)
radio2 = wx.RadioButton(frame, label='운동')
radio3 = wx.RadioButton(frame, label='요리')
#StaticBoxSizer : 경계선과 제목이 있는 박스
box= wx.StaticBoxSizer(wx.HORIZONTAL, frame, '취미')
frame.SetSizer(box)
box.Add(radio1)
box.Add(radio2)
box.Add(radio3)

frame.Show(True)
app.MainLoop()