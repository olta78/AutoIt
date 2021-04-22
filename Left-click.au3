Sleep(5000)
Global $hWnd = WinGetHandle("[ACTIVE]")
While 1
	$DelayKey = Random(150, 300, 1)
	AutoItSetOption("MouseClickDelay", $DelayKey)
	$DelayKey = Random(150, 300, 1)
	AutoItSetOption("MouseClickDownDelay", $DelayKey)
	ControlClick($hWnd, "", "", "left", 1, 456, 783)
	Sleep(3000 + Random(1, 2000, 1))
WEnd