HotKeySet("{ESC}","stop"); Вызов функции Остановка скрипта - ESC
HotKeySet("{PAUSE}", "_pause"); Вызов функции Пауза скрипта - PAUSE
Global $p = 0
Sleep(2000)
While 1
	$Delay = Random(150, 250, 1)
	$Delays = Random(100, 300, 1)
	AutoItSetOption("MouseClickDelay", $Delay)
	AutoItSetOption("MouseClickDownDelay", $Delay)
		MouseClick("right")
		Sleep($Delays)
		MouseUp("right")
	Sleep(400)
WEnd

Func stop(); Функция Остановка скрипта
    Exit
EndFunc

Func _pause(); Функция Пауза скрипта
	If $p Then
		$p = 0
	Else
		$p = 1
		While 1
			Sleep(50)
			If Not $p Then ExitLoop
		WEnd
	EndIf
EndFunc   ;==>_pause