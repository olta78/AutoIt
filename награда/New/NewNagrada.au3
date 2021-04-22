#include "FastFind.au3"
Sleep(5000)
$FFhWnd = WinGetHandle("[ACTIVE]")
While 1
FFSnapShot()
Local $aCoords = FFNearestSpot(1275, 75, 1280, 80, 0xFFFFFF, False)
If Not @error Then
    MsgBox(0, "Coords", $aCoords[0] & ", " & $aCoords[1])
EndIf
sleep(500)
WEnd
