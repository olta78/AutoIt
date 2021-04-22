#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=..\..\Lightshot\Icons\скил.ico
#AutoIt3Wrapper_Outfile=Upps.Exe
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

HotKeySet("{ESC}","stop"); Вызов функции Остановка скрипта - ESC

Sleep (2000)
const $colorXP=0x2C3738
const $colorMP=0x2C3738
While 1
	For $count = 1 To 20
	$DelayKey = Random(350, 700, 1)
	AutoItSetOption("SendKeyDownDelay", $DelayKey)

	$cordXP=PixelSearch(200, 75, 201, 78, 0x38372C, 10, 1)
	if Not @error Then
		Send("9")
	EndIf
	Sleep($DelayKey)
	$cordMP=PixelSearch(200, 88, 201, 92, 0x38372C, 10, 1)
	if Not @error Then
		Send("0")
	EndIf
	Sleep($DelayKey)
Send("1")
Sleep(2000)
;Send("{F2}")
;Sleep(2000)
	Next
Send("-")
Sleep(1500)
WEnd

Func stop(); Функция Остановка скрипта
    Exit
EndFunc