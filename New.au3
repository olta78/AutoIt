HotKeySet("[PAUSE]", "start_program")
HotKeySet("[ESC]", "terminate")

While 1
	Sleep(50)
WEnd

Func start_program()
	ToolTip("Hello")
	Sleep(1000)
	ToolTip("")
EndFunc

Func terminate()
	Exit
EndFunc
