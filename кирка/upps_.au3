#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=..\..\Lightshot\Icons\Screenshot_1.ico
#AutoIt3Wrapper_Outfile=upps.Exe
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

#include<Date.au3>

$datas = _NowCalcDate()
$datae = "2020/12/30"

if $datas > $datae Then
	End()
Else
	Start()
EndIf

Func Start()
Sleep (5000)
While 1
   ;WinActivate ("Blood and Soul")
   $DelayKey = Random(250, 300, 1)
   ;$DelaySleep = Random(5, 20, 1)
   AutoItSetOption("SendKeyDownDelay", $DelayKey)
Send("1")
Sleep(Random(5, 20, 1)*1000)
WEnd
EndFunc

Func End()
	MsgBox( 0, "ERROR!!!", "Пробный период завершен, для продолжения обновите программу")
EndFunc
