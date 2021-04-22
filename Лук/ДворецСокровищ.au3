#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=..\..\Lightshot\Icons\скил.ico
#AutoIt3Wrapper_Outfile=Upps.Exe
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

Sleep (2000)
const $colorXP=0x2C3738
const $colorMP=0x2C3738
While 1
	For $count = 1 To 50
	$DelayKey = Random(250, 500, 1)
	AutoItSetOption("SendKeyDownDelay", $DelayKey)

	$cordXP=PixelSearch(234, 76, 236, 78, 0x38372C, 10, 1)
	if Not @error Then
		Send("9")
	EndIf
	Sleep($DelayKey)
	$cordMP=PixelSearch(234, 91, 236, 93, 0x38372C, 10, 1)
	if Not @error Then
		Send("0")
	EndIf
	Sleep($DelayKey)
Send("1")
Sleep(2200)
Send("2")
Sleep(2000)
	Next
Send("-")
Sleep(1500)
WEnd