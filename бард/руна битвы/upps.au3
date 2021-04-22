Sleep (2000)
const $colorXP=0x2C3738
const $colorMP=0x2C3738
While 1
;WinActivate("Blood and Soul", "")
	$DelayKey = Random(250, 500, 1)
	AutoItSetOption("SendKeyDownDelay", $DelayKey)
	$cordXP=PixelSearch(234, 72, 236, 74, 0x38372C, 10, 1)
	if Not @error Then
		Send("9")
	EndIf
	Sleep($DelayKey)
	$cordMP=PixelSearch(234, 87, 236, 89, 0x38372C, 10, 1)
	if Not @error Then
		Send("0")
	EndIf
	Sleep($DelayKey)
Send("1")
Sleep(1500)
Send("2")
Sleep(1000)
WEnd