#include <Misc.au3>
Global $paused
HotKeySet("{INSERT}", "Pause")
HotKeySet("{ESC}", "Terminate")
Sleep (2000)

While 1
	If $paused Then
		$DelayKey = Random(250, 300, 1)
		AutoItSetOption("SendKeyDownDelay", $DelayKey)
		ToolTip("", 0, 0)
		$cordXP=PixelSearch(242, 76, 217, 78, 0x38372C, 50, 1)
		if Not @error Then
			Send("9")
		EndIf
		Sleep(250)
		$cordMP=PixelSearch(210, 91, 210, 93, 0x38372C, 50, 1)
		if Not @error Then
			Send("0")
		EndIf
		Sleep(250)
	EndIf
	;ToolTip("Программа приостановлена нажмите PAUSE для продолжения...", 0, 0)
	Sleep(250);Обязательная пауза в 0.05 сек для разгрузки процессора
WEnd

Func Pause()
	$paused = Not $paused
	If $paused == False Then
		ToolTip("Программа приостановлена нажмите 'PAUSE' для продолжения...", 0, 0)
	EndIf
	Return $paused
EndFunc

Func Terminate()
	Exit
EndFunc