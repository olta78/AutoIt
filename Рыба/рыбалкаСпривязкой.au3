#RequireAdmin
Sleep(5000); Ожидание 5 секунд
#include <Misc.au3>
HotKeySet("{ESC}","stop"); Вызов функции Остановка скрипта - ESC
;Sleep(5000)
$hWnd = WinGetHandle("[ACTIVE]")
;MsgBox(0, "", $hWnd)
While(1)
WinActivate($hWnd)
$DelayKey = Random(300, 500, 1)
AutoItSetOption("SendKeyDownDelay", $DelayKey)
AutoItSetOption("SendKeyDelay", $DelayKey)
Send("1")
Sleep(500)
Sleep(4800)
WEnd

Func stop(); Функция Остановка скрипта
    Exit
EndFunc