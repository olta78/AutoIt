#RequireAdmin
#include <Misc.au3>
Global $p = 0
Sleep(5000)
HotKeySet("{ESC}","stop"); ����� ������� ��������� ������� - ESC
HotKeySet("!s", "_pause"); ����� ������� ����� ������� - Alt+s

$dll = DllOpen("user32.dll"); ����������� ����������
While 1; ���������� ����� ���������
	If _IsPressed("01", $dll) Then ;��������, � �����, ������� ���(���������� ������)
        $bCoord=MouseGetPos()
         ToolTip("������ ���"&@CRLF&"����������: x="&$bCoord[0]&" y="&$bCoord[1], Default, Default, '_IsPressed', 1)
      Sleep(800)
         ExitLoop
	EndIf
WEnd

While 1; ������� �����
	$DelayKey = Random(50, 200, 1)
	AutoItSetOption("MouseClickDelay", $DelayKey)
	$DelayKey = Random(50, 200, 1)
	AutoItSetOption("MouseClickDownDelay", $DelayKey)
	Sleep(200)
	MouseClick("left", $bCoord[0], $bCoord[1], 1, 5)
	Sleep(200)
	$Delay = Random(8000, 10000, 1)
	Sleep($Delay)
WEnd

Func stop(); ������� ��������� �������
    Exit
EndFunc

Func _pause(); ������� ����� �������
	If $p Then
		$p = 0
	Else
		$p = 1
		While 1
			Sleep(50)
			If Not $p Then ExitLoop
		WEnd
	EndIf
EndFunc   ;==>_pause