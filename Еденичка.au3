;------------ЕДЕНИЧКА сундучки, купоны, бонусы
Global $paused
HotKeySet("{PAUSE}", "Pause")
HotKeySet("{END}","stop"); stop - ESC

Sleep (2000)

While 1
	If $paused Then
		ToolTip("", 0, 0)
		$DelayKey = Random(200, 300, 1)
		AutoItSetOption("SendKeyDownDelay", $DelayKey)
		AutoItSetOption("SendKeyDelay", $DelayKey)
		Send("1")
		Sleep(150)
	EndIf
	If $paused == False Then
		ToolTip("кнопка 'PAUSE' для продолжения", 0, 0)
	EndIf
	Sleep(50)
WEnd

Func Pause()
	$paused = Not $paused
	Return $paused
EndFunc

Func stop(); stop
    Exit
EndFunc