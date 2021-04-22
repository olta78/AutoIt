Global $start
HotKeySet("{PAUSE}", "Start_Program")
HotKeySet("{ESC}", "Terminate")

;Цикл программы
While 1
	If $start Then
		ToolTip("Программа запущена");Тут скрипт программы
	EndIf
	Sleep(100);Обязательная пауза в 0.1 сек для разгрузки процессора
	ToolTip("");Стирает надпись от ToolTip
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
