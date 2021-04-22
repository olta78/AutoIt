#include <Misc.au3>
$dll = DllOpen("user32.dll")

Sleep(5000)

While 1; Координаты Зелья Очищения
    Sleep(50)
    If _IsPressed("02", $dll) Then ;Ожидание, в цикле, нажатия ПКМ(Зелье Очищения)
        $hWND = WinGetHandle("", "")
    Sleep(800)
       ExitLoop
    EndIf
WEnd

Sleep(5000)
MsgBox(0, "HANDLE", $hWND)

While 1
$DelayKey = Random(150, 450, 1)
AutoItSetOption("MouseClickDelay", $DelayKey)
$DelayKey = Random(150, 450, 1)
AutoItSetOption("MouseClickDownDelay", $DelayKey)

ControlClick($hWND, "Blood and Soul", "", "left", 1, 452, 813)
Sleep(1000)
ControlClick($hWND, "Blood and Soul", "", "left", 1, 500, 813)
Sleep(1000)
ControlClick($hWND, "Blood and Soul", "", "left", 1, 452, 813)
Sleep(5000)
WEnd