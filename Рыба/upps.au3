Sleep(5000)
While(1)
$DelayKey = Random(350, 700, 1)
$Delay = Random(520, 600, 1) * 10
AutoItSetOption("SendKeyDownDelay", $DelayKey)
Send("1")
;MsgBox(0, "", $Delay, 1)
Sleep($Delay)
WEnd