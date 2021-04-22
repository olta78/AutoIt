#include <nomadmemory.au3>

 $AllodsProcessName = "Blood and Soul"

$ProcessID = WinGetProcess($AllodsProcessName,"")
SetPrivilege("SeDebugPrivilege", 1)
If $ProcessID = -1 Then
    MsgBox(4096, "ERROR", "Failed to detect MMO A1 running.")
    Exit
EndIf


$DllInformation = _MemoryOpen($ProcessID)
        If @Error Then
            MsgBox(4096, "ERROR", "Failed to open memory.")
            Exit
        EndIf

;Func  _CurrentEN()
;    $CurrentEN = (_MemoryRead(0x00B1A4D0, $DllInformation, 'ptr'))
;    If @Error Then
;        MsgBox(4096, "ERROR", "Failed to read memory.")
;        Exit
;    EndIf
;    Global $ENdec = dec(StringTrimLeft($CurrentEN, 2))
;EndFunc

Func _CurrentHP()
    $CurrentHP = (_MemoryRead(0x00B1A4D0, $DllInformation, 'ptr'))
    If @Error Then
        MsgBox(4096, "ERROR", "Failed to read memory.")
        Exit
    EndIf
 Global $HPdec = dec(StringTrimLeft($CurrentHP, 2))
EndFunc

MsgBox(4096, "", $DllInformation)
