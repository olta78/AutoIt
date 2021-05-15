#RequireAdmin
#include <Misc.au3>

Sleep(3000); Ожидание 5 секунд

Global $hWnd = WinGetHandle("[ACTIVE]");получаем хэндл активного окна

HotKeySet("{END}","stop"); Вызов функции Остановка скрипта - ESC

While 1
	Sleep(3000); Ожидание 5 секунд
	WinActivate($hWnd)
	$DelayKey = Random(150, 300, 1)
	AutoItSetOption("SendKeyDownDelay", $DelayKey)
	Sleep(3000); Ожидание 3 секунд
	Send("1");отсылаем "1" в окно
	Sleep(1900000); Ожидание 30 минут
WEnd



Func stop(); Функция Остановка скрипта
    Exit
EndFunc