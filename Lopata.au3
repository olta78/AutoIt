#RequireAdmin
#include <Misc.au3>
Global $p = 0
Sleep(5000)
HotKeySet("{ESC}","stop"); Вызов функции Остановка скрипта - ESC
HotKeySet("!s", "_pause"); Вызов функции Пауза скрипта - Alt+s

$dll = DllOpen("user32.dll"); Подключение библиотеки
While 1; Координаты камня проклятья
	If _IsPressed("01", $dll) Then ;Ожидание, в цикле, нажатия ЛКМ(Координаты лопаты)
        $bCoord=MouseGetPos()
         ToolTip("Нажата ЛКМ"&@CRLF&"Координаты: x="&$bCoord[0]&" y="&$bCoord[1], Default, Default, '_IsPressed', 1)
      Sleep(800)
         ExitLoop
	EndIf
WEnd

While 1; Процесс копки
	$DelayKey = Random(50, 200, 1)
	AutoItSetOption("MouseClickDelay", $DelayKey)
	$DelayKey = Random(50, 200, 1)
	AutoItSetOption("MouseClickDownDelay", $DelayKey)
	Sleep(200)
	MouseClick("left", $bCoord[0], $bCoord[1], 1, 5)
	Sleep(200)
	$Delay = Random(8000, 10000, 1)
	Sleep($Delay)
WEnd

Func stop(); Функция Остановка скрипта
    Exit
EndFunc

Func _pause(); Функция Пауза скрипта
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