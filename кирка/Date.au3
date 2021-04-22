#include<Date.au3>

$datas = _NowCalcDate()
$datae = "2019/06/30"

if $datas > $datae Then
	MsgBox(0, "Data", "Erroe")
Else
	MsgBox(0, "Data", "Ok")
EndIf