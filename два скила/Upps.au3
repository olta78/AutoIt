#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=..\..\..\Изображения\Saved Pictures\лира.ico
#AutoIt3Wrapper_Outfile=Upps.Exe
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

Sleep (2000)
const $colorXP=0x2C3738
const $colorMP=0x2C3738
While 1
	$DelayKey = Random(250, 300, 1)
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
Sleep(1000)
Send("2")
Sleep(1000)
WEnd