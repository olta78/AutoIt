Sleep(5000); Ожидание 5 секунд
#include <Misc.au3>
HotKeySet("{ESC}","stop"); Вызов функции Остановка скрипта - ESC

$dll = DllOpen("user32.dll"); Подключение библиотеки

While 1; Координаты Зелья Очищения
    Sleep(50)
    If _IsPressed("02", $dll) Then ;Ожидание, в цикле, нажатия ПКМ(Зелье Очищения)
        $aCoord=MouseGetPos()
    Sleep(800)
       ExitLoop
    EndIf
WEnd

Sleep(5000); Ожидание 5 секунд

While 1
	$DelayKey = Random(50, 150, 1)
	AutoItSetOption("MouseClickDelay", $DelayKey)
	$DelayKey = Random(50, 150, 1)
	AutoItSetOption("MouseClickDownDelay", $DelayKey)

	MouseClick("right", $aCoord[0], $aCoord[1])
	Sleep(610000)

WEnd

Func stop(); Функция Остановка скрипта
    Exit
EndFunc

DllClose($dll); Закрытие библиотеки