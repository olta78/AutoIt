Sleep(5000)
$win = WinGetHandle("[ACTIVE]", "")

for $a = 1 to 5

$DelayKey = Random(200, 450, 1)
AutoItSetOption("SendKeyDownDelay", $DelayKey)

;MsgBox(0, "", $win)
ControlSend($win, "", "", "1")

Sleep(1000)

Next