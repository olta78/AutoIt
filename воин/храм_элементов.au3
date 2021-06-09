#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=..\..\..\Изображения\Saved Pictures\лира.ico
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
HotKeySet("{END}","stop"); Вызов функции Остановка скрипта - ESC
Sleep (5000)
While 1
	$DelayKey = Random(150, 350, 1)
	AutoItSetOption("SendKeyDownDelay", $DelayKey)
	Call("Check")
	Sleep(50)
Send("1")
Sleep(1200);задержка по времени между 3 и 1 скилом
	$DelayKey = Random(150, 350, 1)
	AutoItSetOption("SendKeyDownDelay", $DelayKey)
	Call("Check")
	Sleep(50)
Send("2")
Sleep(1200);задержка по времени между 2 и 1 скилом
	$DelayKey = Random(150, 350, 1)
	AutoItSetOption("SendKeyDownDelay", $DelayKey)
	Call("Check")
	Sleep(50)
Send("1")
Sleep(2200); задержка по времени между 1 и 2 скилом
WEnd
Func Check()
	$cordXP=PixelSearch(220, 76, 244, 78, 0x38372C, 50, 1); проверка ОЗ
		if Not @error Then
			Send("9")
		EndIf
		Sleep(150)
		$cordMP=PixelSearch(210, 92, 225, 94, 0x38372C, 50, 1); проверка Маны
		if Not @error Then
			Send("0")
		EndIf
EndFunc
Func stop(); Функция Остановка скрипта
    Exit
EndFunc