import wx
app=wx.App()
frame=wx.Frame(None,title='구구단 계산')
dan=['2단','3단','4단','5단','6단','7단','8단','9단']
#콤보박스
combo=wx.ComboBox(frame, choices=dan)
result=wx.StaticText(frame,label='')

def onitemchange(event):
    idx=combo.GetCurrentSelection() #선택한 값의 인덱스
    print(idx)
    txt=''
    for i in range(1,10):
        txt += '{} x {} = {}\n'.format(idx+2,i,(idx+2)*i)
    result.SetLabelText(dan[idx]+'을 선택하였습니다.\n'+txt)
#콤보박스 아이템을 선택하면 onitemchange() 호출
combo.Bind(wx.EVT_COMBOBOX, onitemchange)
#박스사이저에 콤보박스와 staticText를 붙임
box=wx.BoxSizer(wx.VERTICAL)
frame.SetSizer(box) #프레임에 박스사이저를 붙임
box.Add(combo)
box.Add(result)
frame.Show(True)
app.MainLoop()
