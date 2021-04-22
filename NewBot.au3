Sleep(5000)
While 1
$hWnd = WinActive("[active]")
;MsgBox(0, "hWnd", $hWnd)
;MouseMove(457, 818)
;ControlClick("", $hWnd, "", "left")
ControlSend("Blood and Soul", $hWnd, "", "1", 1)
Sleep(6000)
WEnd