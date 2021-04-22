#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=..\..\Lightshot\Icons\скил.ico
#AutoIt3Wrapper_Outfile=Upps.Exe
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

Sleep (2000)
const $colorXP=0x2C3738
const $colorMP=0x2C3738
While 1
	$DelayKey = Random(250, 300, 1)
	AutoItSetOption("SendKeyDownDelay", $DelayKey)
	Sleep($DelayKey)
	Send("1")
	Sleep(1000)
	Send("2")
	Sleep(1000)
Sleep(1500)
WEnd