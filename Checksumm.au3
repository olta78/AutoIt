#include <MsgBoxConstants.au3>
Sleep(5000)

$hWnd = WinGetHandle("[ACTIVE]")
;MsgBox(0, "Handle", $hWnd)
$checkSum = PixelChecksum(1255, 37, 1265, 49, 1, $hWnd)
While $checkSum = PixelChecksum(1255, 37, 1265, 49, 1, $hWnd)
	Sleep(100)
WEnd

MsgBox(0, "", "Награда")