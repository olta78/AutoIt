Sleep (2000)
const $colorXP=0x2C3738
const $colorMP=0x2C3738
$HWnd = WinGetHandle("Blood and Soul", "")
;MsgBox(0, "HWND", $HWnd)
;While 1
;WinActivate($HWnd, "")
	$DelayMouse = Random(800, 1200, 1)
	$DelayKey = Random(250, 500, 1)
	AutoItSetOption("SendKeyDownDelay", $DelayKey)
	AutoItSetOption("MouseClickDelay", $DelayMouse)
	AutoItSetOption("MouseClickDownDelay", $DelayMouse)
	AutoItSetOption("MouseClickDragDelay", $DelayMouse)

	Sleep($DelayKey)
	MouseMove( 450, 810, 100)
MouseClick("left")
Sleep(1500)
MouseClick("left")
Sleep(1000)
;WEnd