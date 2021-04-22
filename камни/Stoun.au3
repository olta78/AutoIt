#RequireAdmin
Sleep(2000); Ожидание 2 секунд
#include <Misc.au3>
HotKeySet("{ESC}","stop"); Вызов функции Остановка скрипта - ESC

$countStart = 1; Счетчик начало, всегда = 1
$countEnd = 149; Счетчик конец, количество очищаемых камней -1, который будет очищен вручную

$dll = DllOpen("user32.dll"); Подключение библиотеки

While 1; Координаты Зелья Очищения
    Sleep(50)
    If _IsPressed("02", $dll) Then ;Ожидание, в цикле, нажатия ПКМ(Зелье Очищения)
        $aCoord=MouseGetPos()
		ToolTip("Нажата ПКМ"&@CRLF&"Координаты: x="&$aCoord[0]&" y="&$aCoord[1], Default, Default, '_IsPressed', 1)
		Sleep(1000)
		ToolTip("")
       ExitLoop
    EndIf
WEnd

While 1; Координаты камня проклятья
	Sleep(50)
	If _IsPressed("01", $dll) Then ;Ожидание, в цикле, нажатия ЛКМ(Камень Проклятья)
        $bCoord=MouseGetPos()
		ToolTip("Нажата ЛКМ"&@CRLF&"Координаты: x="&$bCoord[0]&" y="&$bCoord[1], Default, Default, '_IsPressed', 1)
		Sleep(1000)
		ToolTip("")
		ExitLoop
	EndIf
WEnd

While 1; Координтаы кнопки подтверждения - ОК
	Sleep(50)
	If _IsPressed("01", $dll) Then ;Ожидание, в цикле, нажатия ЛКМ(Всплывающее Окно кнопка ОК)
        $cCoord=MouseGetPos()
		ToolTip("Нажата ЛКМ"&@CRLF&"Координаты: x="&$cCoord[0]&" y="&$cCoord[1], Default, Default, '_IsPressed', 1)
		Sleep(1000)
		ToolTip("")
        ExitLoop
    EndIf
WEnd

Sleep(5000); Ожидание 5 секунд

While $countStart <= $countEnd; Процесс очистки
	$DelayKey = Random(30, 100, 1)
	AutoItSetOption("MouseClickDelay", $DelayKey)
	$DelayKey = Random(30, 100, 1)
	AutoItSetOption("MouseClickDownDelay", $DelayKey)

	MouseClick("right", $aCoord[0], $aCoord[1], 1, 5)
	Sleep(200)
	MouseClick("left", $bCoord[0], $bCoord[1], 1, 5)
	Sleep(200)
	MouseClick("left", $cCoord[0], $cCoord[1], 1, 5)
	Sleep(200)
	$countStart = $countStart + 1
WEnd

Func stop(); Функция Остановка скрипта
	DllClose($dll); Закрытие библиотеки
    Exit
EndFunc

DllClose($dll); Закрытие библиотеки