#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=..\..\..\для Blood and Soul\Icons\обычная.ico
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#RequireAdmin
#include <Misc.au3>

Global $sec = 1000; 1 секунда - 1000 миллисекунд
Global $min = 60000; 1 минутка - 60 секунд - 60000 миллисекунд
Global $hWnd = WinGetHandle("[ACTIVE]");получаем хэндл активного окна

Sleep(5 * $sec); Ожидание 5 секунд

HotKeySet("{END}","stop"); Вызов функции Остановка скрипта - ESC

While 1
	Sleep(5 * $sec); Ожидание 5 секунд
	$DelayKey = Random(150, 300, 1)
	AutoItSetOption("SendKeyDownDelay", $DelayKey)
	Send("1");отсылаем "1" в окно
	Sleep(3 * $sec); Ожидание 3 секунд
	WinSetState ($hWnd, "", @SW_MINIMIZE);сворачиваем(минимизируем) окна хэндла
	Sleep(30 * $min); Ожидание 30 минут
	WinSetState ($hWnd, "", @SW_RESTORE);разворачиваем(восстанавливаем) окно хэндла
WEnd



Func stop(); Функция Остановка скрипта
    Exit
EndFunc