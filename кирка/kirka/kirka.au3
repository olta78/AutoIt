#RequireAdmin
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=..\..\..\..\Pictures\2019-05-25_18-43-19.ico
#AutoIt3Wrapper_Outfile=kirka.EXE
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

#include<Date.au3>

$datas = _NowCalcDate()
;MsgBox(0, "DATE", $datas)
$datae = "2020/01/31"

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
   $DelaySleep = Random(5, 20, 1)
   AutoItSetOption("SendKeyDownDelay", $DelayKey)
Send("1")
Sleep($DelaySleep*1000)
WEnd
EndFunc

Func End()
	MsgBox( 0, "ERROR!!!", "Для продолжения обновите программу http://for-bs.ga/")
EndFunc
