#RequireAdmin
const $color=0xffffff
const $color1=0x77c3c2
Sleep(3000)
$hWnd = WinGetHandle("[ACTIVE]")
$sec = 1000
$min = $sec * 60
Sleep(60 * $min)
While 1
	WinActivate ($hWnd)
	$coord=PixelSearch(1275, 75, 1280, 80, $color, 20, 1)
	If Not @error Then
		MouseMove(1275, 80, 20)
		Sleep(1000)
		MouseClick("Left")
		Sleep(2000)
		MouseMove(1275, 250)
		$coord1=PixelSearch(1275, 75, 1280, 80, $color1, 20, 1)
		If Not @error Then
			MouseMove(1275, 80, 20)
			Sleep(1000)
			MouseClick("Left")
			Sleep(2000)
			MouseMove(1275, 250)
		EndIf
	EndIf
	Sleep(200)
WEnd