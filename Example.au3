Sleep(3000)
$count = 1
$hwnd = 0x000E0314
$key = 0x31

While $count <= 5
	$DelayKey = Random(250, 300, 1)
	AutoItSetOption("SendKeyDownDelay", $DelayKey)

	ControlSend("Blood Rites","Blood Rites", "", $key)
	Sleep(1000)
	$count = $count + 1
WEnd
