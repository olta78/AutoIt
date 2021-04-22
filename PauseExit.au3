Global $paused
HotKeySet("{PAUSE}", "Pause")
HotKeySet("{ESC}", "Terminate")

;Тут будет ваш скрипт

Func Pause()
	$paused = Not $paused
	While $paused
		ToolTip("Текущий скрипт приостановлен... Нажмите кнопку 'PAUSE' для продолжения", 0, 0)
		Sleep(100)
	WEnd
	ToolTip("")
EndFunc

Func Terminate()
	Exit
EndFunc
