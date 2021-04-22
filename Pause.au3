HotKeySet('{ESC}', '_pause');Alt+3
Global $p = 0

Func _pause()
	If $p Then
		$p = 0
	Else
		$p = 1
		While 1
			Sleep(50)
			If Not $p Then ExitLoop
		WEnd
	EndIf
EndFunc   ;==>_pause