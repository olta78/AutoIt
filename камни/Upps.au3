Sleep(5000)
$i = 1
While($i <= 150)
	;Sleep(3000)
$DelayKey = Random(250, 300, 1)
AutoItSetOption("SendKeyDownDelay", $DelayKey)
MouseMove(1210, 465, 10)
MouseClick("right")
Sleep(300)
MouseMove(1210, 510, 10)
MouseClick("left")
Sleep(400)
MouseMove(750, 530, 10)
MouseClick("left")
Sleep(300)
$i = $i + 1
WEnd
