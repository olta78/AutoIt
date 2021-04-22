#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=..\..\..\Изображения\Saved Pictures\лира.ico
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

Sleep (5000)

;$hWnd = WinGetHandle("[ACTIVE]")

While 1
	$DelayKey = Random(200, 500, 1)
	AutoItSetOption("SendKeyDownDelay", $DelayKey)
	Call("Check")
	Sleep(50)
Send("1");первый скил "1"
Sleep(1000);задержка по времени между 3 и 1 скилом
	Call("Check")
	Sleep(50)
Send("2");второй скил "2"
Sleep(1000);задержка по времени между 2 и 1 скилом
	Call("Check")
	Sleep(50)
Send("1");третий скил "3"
Sleep(1800); задержка по времени между 1 и 2 скилом
	Call("Check")
	Sleep(50)
WEnd
Func Check()
	$cordXP=PixelSearch(242, 75, 217, 77, 0x38372C, 50, 1)
	if Not @error Then
		Send("9")
	EndIf
	Sleep(200)
	$cordMP=PixelSearch(210, 91, 210, 93, 0x38372C, 50, 1)
	if Not @error Then
		Send("0")
	EndIf
EndFunc
