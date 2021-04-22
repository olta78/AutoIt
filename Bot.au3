#RequireAdmin#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_icon=icon.ico
GUISetIcon("icon.ico")
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****


#Obfuscator_Off
#include <File.au3>
#include <GuiEdit.au3>
#include <GuiStatusBar.au3>
#include <GuiConstantsEx.au3>
#include <GUIButton.au3>
#include <GUIToolbar.au3>
#include <ProgressConstants.au3>
#include <SliderConstants.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <EditConstants.au3>
#include <NomadMemory.au3>
#include <Array.au3>
#Obfuscator_On


;********************************************************************************
;* Options                                                                      *
;********************************************************************************
Opt("GUICloseOnESC", 0)
Opt("GUIOnEventMode", 1)
Opt("TrayAutoPause", 0)
Opt("TrayMenuMode", 1)




;********************************************************************************
;* Global Software Control Information                                          *
;********************************************************************************
; Declare Process Variables
Global $APP_BASE_ADDRESS = 0x00C62E70, $TARGET_BASE_ADDRESS = 0x005CF71F
Global $APP_TITLE = "Blood and Soul", $KERNEL32 = DllOpen('kernel32.dll')
Global $PROCESS_ID = WinGetProcess($APP_TITLE)
Global $PROCESS_INFORMATION = _MemoryOpen($PROCESS_ID)
Global $APP_PATH = _ProcessIdPath($PROCESS_ID)
Global $ANSWER = ""
While (@error)
    $ANSWER = InputBox("Blood and Soul not Found!", "Run first the game or open as Administrator, Press OK.", "Blood and Soul", "", -1, -1, 0, 0)
    If $ANSWER = "" Then
        Exit
    EndIf
    Global $APP_TITLE = $ANSWER
    Global $PROCESS_ID = WinGetProcess($APP_TITLE), $PROCESS_INFORMATION = _MemoryOpen($PROCESS_ID), $APP_PATH = _ProcessIdPath($PROCESS_ID)
WEnd


; Declare Menu Bar Variables
$OVERBOT = GUICreate("MaxBSBot v0.3", 230, 255, 0, 0)


$LABEL_HP_STATUS = GUICtrlCreateLabel("", 15, 14, 130, 15)
GUICtrlSetColor(-1, 0x000000)


GUICtrlCreateLabel("Use at: ", 110, 14, 35, 15)
GUICtrlSetColor(-1, 0x000000)


GUICtrlCreateLabel("Edited by MaxDistroyer - Developer Lyax", 30, 230, 240, 15)
GUICtrlSetColor(-1, 0x000000)


$LABEL_MP_STATUS = GUICtrlCreateLabel("", 15, 48, 130, 15)
GUICtrlSetColor(-1, 0x000000)


GUICtrlCreateLabel("Use at: ", 110, 48, 35, 15)
GUICtrlSetColor(-1, 0x000000)


$bt_close = GUICtrlCreateButton("Exit", 130, 195)
GUICtrlSetOnEvent($bt_close, "bt_close_Click")
Global $close = 1


$bt_battle = GUICtrlCreateButton("Battle Start", 50, 195)
GUICtrlSetOnEvent($bt_battle, "bt_battle_Click")


GUICtrlCreateLabel("HP Key: ", 15, 78, 40, 15)
GUICtrlSetColor(-1, 0x000000)


GUICtrlCreateLabel("MP Key: ", 110, 78, 40, 15)
GUICtrlSetColor(-1, 0x000000)


GUICtrlCreateLabel("Skill Key: ", 105, 108, 45, 15)
GUICtrlSetColor(-1, 0x000000)


GUICtrlCreateLabel("Skill Key: ", 105, 138, 45, 15)
GUICtrlSetColor(-1, 0x000000)


GUICtrlCreateLabel("Skill Key: ", 105, 168, 45, 15)
GUICtrlSetColor(-1, 0x000000)


Global $SKILL_CT = 3, $IPT_KEY_SKILL[$SKILL_CT]


$IPT_KEY_SKILL[0] = GUICtrlCreateInput("", 161, 108, 30, 15)
GUICtrlSetData($IPT_KEY_SKILL[0], "1")


$IPT_KEY_SKILL[1] = GUICtrlCreateInput("", 161, 138, 30, 15)
GUICtrlSetData($IPT_KEY_SKILL[1], "1")


$IPT_KEY_SKILL[2] = GUICtrlCreateInput("", 161, 168, 30, 15)
GUICtrlSetData($IPT_KEY_SKILL[2], "1")


$LABEL_TARGET_STATUS = GUICtrlCreateLabel("Stopped", 15, 108, 80, 15)
GUICtrlSetColor(-1, 0x000000)


$IPT_KEY_HP = GUICtrlCreateInput("", 66, 78, 30, 15)
GUICtrlSetData($IPT_KEY_HP, "2")


$IPT_KEY_MP = GUICtrlCreateInput("", 161, 78, 30, 15)
GUICtrlSetData($IPT_KEY_MP, "3")




$IPT_HP = GUICtrlCreateInput("", 150, 14, 60, 15)
GUICtrlSetData($IPT_HP, "0")


$IPT_MP = GUICtrlCreateInput("", 150, 48, 60, 15)
GUICtrlSetData($IPT_MP, "0")


GuiSetState(@SW_SHOW)


Global $OFFSET_HP[3]
$OFFSET_HP[0] = 0
$OFFSET_HP[1] = 0x04
$OFFSET_HP[2] = 0x0C


Global $OFFSET_MP[3]
$OFFSET_MP[0] = 0
$OFFSET_MP[1] = 0x08
$OFFSET_MP[2] = 0x0C


Global $OFFSET_TARGET[2]
$OFFSET_TARGET[0] = 0
$OFFSET_TARGET[1] = 0x08


Global $baseADDR = _MemoryRead($APP_BASE_ADDRESS, $PROCESS_INFORMATION)
Global $HANDLE = WinGetHandle("Blood Rites")
Global $HANDLE = ControlGetHandle($APP_TITLE, "", "")
$LVL1 =  '0x' & Hex($baseADDR + $OFFSET_HP[2])
$baseADDR = _MemoryRead($LVL1, $PROCESS_INFORMATION);


;CHAR INFO
Global $ADDR_HP =  '0x' & Hex($baseADDR + $OFFSET_HP[1])
Global $ADDR_MP =  '0x' & Hex($baseADDR + $OFFSET_MP[1])


;TARGET
$baseADDR = _MemoryRead($TARGET_BASE_ADDRESS, $PROCESS_INFORMATION)
$LVL1 =  '0x' & Hex($baseADDR + $OFFSET_TARGET[1])


Global $ADDR_TARGETED = '0x' & Hex($LVL1)
Global $BATTLE_STARTED = 0, $TARGETED = 0, $ATK_TIME = 0, $ATK_MAX_TIME = 15000
;sgBox(0, "ae", ":" &  _MemoryRead($ADDR_TARGETED, $PROCESS_INFORMATION))




;Exit


Global $HEAL_HP = 0, $HEAL_MP = 0
Global $HP, $MP


GUICtrlSetData($IPT_HP, Int(_MemoryRead($ADDR_HP, $PROCESS_INFORMATION)/2))


;********************************************************************************
;* Main Loop                                                                    *
;********************************************************************************


;WinActivate($APP_TITLE)


While ($close) ;==>Main Loop
    checkStatus()
    ;_SendMessage($HANDLE, 256, 112);
    ;_SendMessage($HANDLE, 0x4d, 0);
    ;_PostMessage($HANDLE, 256, 49, 0x20001);


    ;_PostMessage($HANDLE, 257, 49, 0x20001);
    ;_SendMessage($HANDLE, 256, KEYCODE("{1}"))
    ;sControlSend($HANDLE, "", "", "{1}")
    if($BATTLE_STARTED = 1) Then
        controlBattle()
    EndIf
    Sleep(200)
WEnd ;==>Main Loop


Func controlBattle()
    selectTarget()
    attackTarget()
EndFunc


Func attackTarget()
    GUICtrlSetData($LABEL_TARGET_STATUS, "Attacking target")
    $ATK_TIME = 0
    $SKILL = 0
    $SKILL_TIME = 0
    while($TARGETED > 0 And $BATTLE_STARTED = 1 And $ATK_TIME <= $ATK_MAX_TIME)
        $ATK_TIME += 200
        $SKILL_TIME += 200
        Send("{" & GUICtrlRead($IPT_KEY_SKILL[$SKILL]) & "}")
        checkStatus()
        Sleep(100)
        if($SKILL_TIME >= 400) Then
            $SKILL += 1
            if($SKILL_CT = $SKILL) Then
                $SKILL = 0
            EndIf
        EndIf
        Sleep(100)
        $TARGETED = _MemoryRead($ADDR_TARGETED, $PROCESS_INFORMATION)
    WEnd
    $TARGETED = 0
EndFunc


Func selectTarget()
    GUICtrlSetData($LABEL_TARGET_STATUS, "Looking target")
    while($TARGETED = 0 And $BATTLE_STARTED = 1)
        checkStatus()
        Send("{TAB}")
        Sleep(150)
        $TARGETED = _MemoryRead($ADDR_TARGETED, $PROCESS_INFORMATION)
    WEnd
EndFunc


Func checkStatus()
    checkHP()
    Sleep(50)
    checkMP()
    GUICtrlSetData($LABEL_HP_STATUS, "Current HP: " & $HP)
    GUICtrlSetData($LABEL_MP_STATUS, "Current MP: " & $MP)
EndFunc


Func checkHP()
    $HEAL_HP = GUICtrlRead($IPT_HP)
    $HP = _MemoryRead($ADDR_HP, $PROCESS_INFORMATION)
    if ($HP < $HEAL_HP) Then
        Send("{" & GUICtrlRead($IPT_KEY_HP) & "}")
    EndIf
EndFunc


Func checkMP()
    $HEAL_MP = GUICtrlRead($IPT_MP)
    $MP = _MemoryRead($ADDR_MP, $PROCESS_INFORMATION)
    if ($MP < $HEAL_MP) Then
        Send("{" & GUICtrlRead($IPT_KEY_MP) & "}")
    EndIf
EndFunc


Func bt_close_Click()
    $close = 0
EndFunc


Func bt_battle_Click()
    if($BATTLE_STARTED = 1) Then
        GUICtrlSetData($bt_battle, "Battle Start")
        $BATTLE_STARTED = 0
    Else
        GUICtrlSetData($bt_battle, "Battle Stop")
        $BATTLE_STARTED = 1
    EndIf
EndFunc


Func _ProcessIdPath ( $vPID )
    Local $objWMIService, $oColItems
    Local $sNoExePath = ''
    Local Const $wbemFlagReturnImmediately = 0x10
    Local Const $wbemFlagForwardOnly = 0x20


    Local $RetErr_ProcessDoesntExist = 1
    Local $RetErr_ProcessPathUnknown = 2
    Local $RetErr_ProcessNotFound = 3
    Local $RetErr_ObjCreateErr = 4
    Local $RetErr_UnknownErr = 5


    If Not ProcessExists ( $vPID )  Then
        SetError ( $RetErr_ProcessDoesntExist )
        Return $sNoExepath
    EndIf


    $objWMIService = ObjGet ( 'winmgmts:\\localhost\root\CIMV2' )
    $oColItems = $objWMIService.ExecQuery  ( 'SELECT * FROM Win32_Process', 'WQL', $wbemFlagReturnImmediately + $wbemFlagForwardOnly )


    If IsObj ( $oColItems )  Then
        For $objItem In $oColItems
            If $vPID = $objItem.ProcessId Then
                If $objItem.ExecutablePath = '0' Then
                    If FileExists ( @SystemDir & '\' & $objItem.Caption )  Then
                        Return @SystemDir & '\' & $objItem.Caption
                    Else
                        SetError ( $RetErr_ProcessPathUnknown )
                        Return $sNoExepath
                    EndIf
                Else
                    Return $objItem.Executablepath
                EndIf
            EndIf
        Next
        SetError ( $RetErr_ProcessNotFound )
        Return $sNoExepath
    Else
        SetError ( $RetErr_ObjCreateErr )
        Return $sNoExepath
    EndIf


    SetError ( $RetErr_UnknownErr )
    Return $sNoExepath
EndFunc        ;==>_ProcessIdPath


Func Keycode($key)
    If $key == "{F1}" Then
        Return 112
    ElseIf $key == "{F2}" Then
        Return 113
    ElseIf $key == "{F3}" Then
        Return 114
    ElseIf $key == "{F4}" Then
        Return 115
    ElseIf $key == "{F5}" Then
        Return 116
    ElseIf $key == "{F6}" Then
        Return 117
    ElseIf $key == "{F7}" Then
        Return 118
    ElseIf $key == "{F8}" Then
        Return 119
    ElseIf $key == "{0}" Then
        Return 48
    ElseIf $key == "{1}" Then
        Return 49
    ElseIf $key == "{2}" Then
        Return 50
    ElseIf $key == "{3}" Then
        Return 51
    ElseIf $key == "{4}" Then
        Return 52
    ElseIf $key == "{5}" Then
        Return 53
    ElseIf $key == "{6}" Then
        Return 54
    ElseIf $key == "{7}" Then
        Return 55
    ElseIf $key == "{8}" Then
        Return 56
    ElseIf $key == "{9}" Then
        Return 57
    ElseIf $key == "{TAB}" Then
        Return 9
    ElseIf $key == "{LMB}" Then
        Return 1
    ElseIf $key == "{RMB}" Then
        Return 2
    ElseIf $key == "{SHIFT}" Then
        Return 160
    ElseIf $key == "{CTRL}" Then
        Return 162
    ElseIf $key == "{ALT}" Then
        Return 18
    ElseIf $key == "{SPACE}" Then
        Return 32
    ElseIf $key == "{ESC}" Then
        Return 27
    ElseIf $key == "{+}" Then
        Return 107
    ElseIf $key == "{-}" Then
        Return 109
    Else
        Return "none"
    EndIf
EndFunc        ;==>


Func _PostMessage($hWnd, $msgID, $wParam, $lParam)
    Local $ret = DllCall("user32.dll", "int", "PostMessage", "hwnd", $hWnd, "int", $msgID, "int", $wParam, "int", $lParam)
    If IsArray($ret) Then
        Return $ret[0]
    Else
        SetError(-1)
        Return False
    EndIf
EndFunc