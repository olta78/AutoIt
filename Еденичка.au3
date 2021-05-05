;------------ЕДЕНИЧКА сундучки, купоны, бонусы
Global $paused
HotKeySet("{PAUSE}", "Pause"); пауза PAUSE
HotKeySet("{END}","stop"); выход - END

Sleep (2000)

While 1; код нажатие на скил 1
	If $paused Then
		ToolTip("", 0, 0)
		$DelayKey = Random(250, 400, 1)
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

Func Pause(); функция пауза
	$paused = Not $paused
	Return $paused
EndFunc

Func stop(); вынкция выход
    Exit
EndFunc