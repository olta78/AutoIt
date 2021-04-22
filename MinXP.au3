#Include "WinAPI.au3"
#Include "Constants.au3"

; MinHP Read By Sirioga
; Ver 1.4.5 Build 2305

Global $iPID, $iRead

$handle = _WinAPI_FindWindow("Blood and Soul", "Blood and Soul")
_WinAPI_GetWindowThreadProcessId($handle, $iPID)
$hProcess = _WinAPI_OpenProcess($PROCESS_ALL_ACCESS, False, $iPID)

Global $fPoint = DllStructCreate("dword")
if @error Then
MsgBox(0,"","Error in DllStructCreate " & @error);
exit
endif

_WinAPI_ReadProcessMemory($hProcess, 0x19169194, DllStructGetPtr($fPoint), DllStructGetSize($fPoint), $iRead)
_WinAPI_ReadProcessMemory($hProcess, DllStructGetData($fPoint,1)+0x1C, DllStructGetPtr($fPoint), DllStructGetSize($fPoint), $iRead)
_WinAPI_ReadProcessMemory($hProcess, DllStructGetData($fPoint,1)+0x34, DllStructGetPtr($fPoint), DllStructGetSize($fPoint), $iRead)
_WinAPI_ReadProcessMemory($hProcess, DllStructGetData($fPoint,1)+0x494, DllStructGetPtr($fPoint), DllStructGetSize($fPoint), $iRead)

MsgBox(0,"MinHP",DllStructGetData($fPoint,1))