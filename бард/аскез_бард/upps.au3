Sleep (2000)
const $colorXP=0x2C3738
const $colorMP=0x2C3738
$W=WinGetHandle("[ACTIVE]")
While 1
WinActivate($W, "")
	$DelayKey = Random(250, 500, 1)
	AutoItSetOption("SendKeyDownDelay", $DelayKey)
	$cordXP=PixelSearch(230, 76, 232, 79, 0x38372C, 10, 1);проверка ОЗ
	if Not @error Then
		Send("9")
	EndIf
	Sleep($DelayKey)
	$cordMP=PixelSearch(215, 89, 216, 92, 0x38372C, 10, 1);проверка Маны
	if Not @error Then
		Send("0")
	EndIf
	Sleep($DelayKey)
	Send("{F2}");Дерзкая ловушка
	Sleep(1500)
	Send("1");Внезапный удар
	Sleep(1500)
	Send("2");Небесная буря
	Sleep(1500)
	Send("1");Внезапный удар
	Sleep(1100)
WEnd