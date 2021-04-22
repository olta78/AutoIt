#include <WinAPIGdi.au3>
Sleep(5000)
$hWnd = WinGetHandle("[ACTIVE]")
MsgBox(0, "Окно ", $hWnd)
Sleep(5000)
$hDC = _WinAPI_GetDC($hWnd)
$color = _WinAPI_GetPixel($hDC, 1253, 53)
MsgBox(0, "", "Цвет: " & Hex($color, 6))