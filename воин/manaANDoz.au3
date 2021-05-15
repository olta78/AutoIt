#include <Misc.au3>
Global $paused
HotKeySet("{PAUSE}", "Pause"); Горячая клавиша ПАУЗА - Pause/Break
HotKeySet("{END}", "Terminate"); Горячая клавиша ВЫХОД - End
Sleep (2000)

While 1; Цикл программы
	If $paused Then
		$DelayKey = Random(150, 350, 1)
		AutoItSetOption("SendKeyDownDelay", $DelayKey)
		AutoItSetOption("SendKeyDelay", $DelayKey)
		ToolTip("", 0, 0)
		$cordXP=PixelSearch(220, 76, 244, 78, 0x38372C, 50, 1); проверка ОЗ
		if Not @error Then
			Send("9")
		EndIf
		Sleep(150)
		$cordMP=PixelSearch(210, 92, 225, 94, 0x38372C, 50, 1); проверка Маны
		if Not @error Then
			Send("0")
		EndIf
		Sleep(150)
	EndIf
	If $paused == False Then
		ToolTip("...нажмите 'PAUSE' для продолжения...", 0, 0); Если переключатель False то пауза
	EndIf
	Sleep(100); Обязательная пауза в 0.1 сек для разгрузки процессора
WEnd

Func Pause(); переключатель
	$paused = Not $paused
	Return $paused
EndFunc

Func Terminate(); выход
	Exit
EndFunc