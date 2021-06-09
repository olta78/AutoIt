
Sleep (5000)
While 1
   ;WinActivate ("Blood and Soul")
   $DelayKey = Random(150, 350, 1)
   ;$DelaySleep = Random(5, 20, 1)
   AutoItSetOption("SendKeyDownDelay", $DelayKey)
Send("1")
Sleep(Random(8000, 10000, 1))
WEnd