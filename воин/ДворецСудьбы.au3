; 1 - 460, 816
; 2 - 500, 816
; = - 960, 816
; F2 - 500, 775

HotKeySet("{ESC}","stop"); stop - ESC
Sleep(2000)

While 1
	$DelayKey = Random(200, 300, 1)
	AutoItSetOption("SendKeyDownDelay", $DelayKey)
	AutoItSetOption("SendKeyDelay", $DelayKey)
	Send("1")
	Sleep(500)
	Send("2")
	Sleep(1500)
	Send("1")
	Sleep(500)
	Send("{F2}")
	Sleep(500)
	Send("=")
	Sleep(1000)
WEnd


Func stop(); stop
    Exit
EndFunc