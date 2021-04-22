Global $start
HotKeySet("{PAUSE}", "Start_Program")
HotKeySet("{ESC}", "Terminate")
Sleep(2000)
;Цикл программы
While 1
	If $start Then
		ToolTip("")
		$Delay = Random(150, 250, 1)
		$Delays = Random(100, 300, 1)
		AutoItSetOption("MouseClickDelay", $Delay)
		AutoItSetOption("MouseClickDownDelay", $Delay)
		MouseClick("right")
		Sleep($Delays)
		MouseUp("right")
		Sleep(400)
	EndIf
	ToolTip("Программа приостановлена нажмите PAUSE для продолжения...", 0, 0)
	Sleep(100);Обязательная пауза в 0.1 сек для разгрузки процессора
WEnd

;Переключатель
Func Start_Program()
	$start = Not $start
	Return $start
EndFunc

;Выход
Func Terminate()
	Exit
EndFunc