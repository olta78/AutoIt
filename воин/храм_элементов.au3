#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=..\..\..\Изображения\Saved Pictures\лира.ico
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
HotKeySet("{ESC}","stop"); Вызов функции Остановка скрипта - ESC
Sleep (5000)
const $colorXP=0x2C3738
const $colorMP=0x2C3738
While 1
	$DelayKey = Random(400, 500, 1)
	AutoItSetOption("SendKeyDownDelay", $DelayKey)
	Call("Check")
	Sleep(50)
Send("1")
Sleep(1200);задержка по времени между 3 и 1 скилом
	Call("Check")
	Sleep(50)
Send("2")
Sleep(1200);задержка по времени между 2 и 1 скилом
	Call("Check")
	Sleep(50)
Send("1")
Sleep(2200); задержка по времени между 1 и 2 скилом
WEnd
Func Check()
	$cordXP=PixelSearch(215, 73, 217, 75, 0x38372C, 10, 1)
	if Not @error Then
		Send("9")
	EndIf
	Sleep(200)
	$cordMP=PixelSearch(208, 87, 210, 89, 0x38372C, 10, 1)
	if Not @error Then
		Send("0")
	EndIf
EndFunc
Func stop(); Функция Остановка скрипта
    Exit
EndFunc