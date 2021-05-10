#RequireAdmin
#include <Misc.au3>

Sleep(5000); Ожидание 5 секунд

Global $sec = 1000; 1 секунда - 1000 миллисекунд
Global $min = 60000; 1 минутка - 60 секунд - 60000 миллисекунд
Global $hWnd = WinGetHandle("[ACTIVE]");получаем хэндл активного окна

HotKeySet("{END}","stop"); Вызов функции Остановка скрипта - ESC

While 1
	Sleep(5 * $sec); Ожидание 5 секунд
	WinActivate($hWnd)
	$DelayKey = Random(150, 300, 1)
	AutoItSetOption("SendKeyDownDelay", $DelayKey)
	Send("1");отсылаем "1" в окно
	Sleep(3 * $sec); Ожидание 3 секунд
	Sleep(30 * $min); Ожидание 30 минут
WEnd



Func stop(); Функция Остановка скрипта
    Exit
EndFunc