#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=..\..\..\Изображения\Saved Pictures\лира.ico
#AutoIt3Wrapper_UseX64=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
AutoItSetOption("SendKeyDownDelay", 200)
Sleep (5000)
const $colorXP=0x2C3738
const $colorMP=0x2C3738
While 1
	Call("Check")
	Sleep(50)
Send("{F2}")
	Sleep(100)
Send("1")
Sleep(1200);задержка по времени между 3 и 1 скилом
	Call("Check")
	Sleep(50)
Send("2")
Sleep(1200);задержка по времени между 3 и 1 скилом
	Call("Check")
	Sleep(50)
Send("1")
Sleep(1200);задержка по времени между 3 и 1 скилом
	Call("Check")
	Sleep(50)
Send("3")
Sleep(1200);задержка по времени между 3 и 1 скилом
	Call("Check")
	Sleep(50)
WEnd

Func Check()
	$cordXP=PixelSearch(210, 76, 212, 78, 0x38372C, 10, 1)
	if Not @error Then
		Send("9")
	EndIf
	Sleep(200)
	$cordMP=PixelSearch(210, 91, 212, 93, 0x38372C, 10, 1)
	if Not @error Then
		Send("0")
	EndIf
EndFunc