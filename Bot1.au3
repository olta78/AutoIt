Func _WinWaitActivate($title,$text,$timeout=0)
	WinWait($title,$text,$timeout)
	If Not WinActive($title,$text) Then WinActivate($title,$text)
	WinWaitActive($title,$text,$timeout)
EndFunc

;init
$Blood = 0x0039098A;0x00000000042A036C
HotKeySet("{F10}","StartOrStop")
;------- Global control information --------------------
Global $STOP = True

_WinWaitActivate($Blood,"")

Global $hWnd = WinActive($Blood,"")

Global $TOTAL_KILLED = 0
Global $HP = 0
Global $MP = 0
Global $PET_HP = 0
Global $PET_MP = 0
Global $TARGET_HP = 0
Global $TARGET_MP = 0
Global $TARGET_STATE = 0
Global $LOOT_TIMES = 3
Global $LOOT_FLAG = True
Global $BAR_PERC = 0 ;return percent filling
Global $EMPTYHP_COLOR = '372A11'
Global $EMPTYMP_COLOR = '2B210E'
Global $HPPOT_PERC = 50
Global $HPPOT_KEY = "{F6}"
Global $HPPOT_TIMER = 30
Global $HP_REGEN_STOP = 98
Global $MPPOT_PERC = 20
Global $MPPOT_KEY = "{F5}"
Global $MPPOT_TIMER = 30
Global $MP_REGEN_STOP = 98
Global $HPSKILL_PERC = 70
Global $HPSKILL_KEY = "{F8}"
Global $HPSKILL_TIMER = 21
Global $MPSKILL_PERC = 50
Global $MPSKILL_KEY = "{F7}"
Global $MPSKILL_TIMER = 120
Global $FLUITE_PERC = 80
Global $FLUITE_KEY = "{F4}"
Global $FLUITE_HP_TYPE = True ; true - HP / False - MP
Global $ROTATE_SEARCH = True
Global $SKILL1_KEY = "{F1}" ; Agro for target
Global $SKILL1_TIMER = 6
Global $SKILL2_KEY = "{F2}" ; Damage
Global $SKILL2_TIMER = 0
Global $SKILL3_KEY = "{F3}" ; Control
Global $SKILL3_TIMER = 15
Global $HP_PET_PERC = 80
Global $HP_PET_REGENSTOP = 98
Global $BUFF1_KEY = "{F11}"
Global $BUFF1_TIMER = 60
Global $BUFF2_KEY = "{F12}"
Global $BUFF2_TIMER = 900
Global $BUFF1_COUNT = TimerInit()
Global $BUFF2_COUNT = TimerInit()
Global $HPPOT_COUNT = TimerInit()
Global $MPPOT_COUNT = TimerInit()
Global $HPSKILL_COUNT = TimerInit()
Global $MPSKILL_COUNT = TimerInit()
Global $SKILL1_COUNT = TimerInit()
Global $SKILL2_COUNT = TimerInit()
Global $SKILL3_COUNT = TimerInit()
Global $MP_YPOS = 80
Global $HP_YPOS = 65
Global $CHAR_XMIN_POS = 11
Global $CHAR_XMAX_POS = 308
Global $PET_XMIN_POS = 331
Global $PET_XMAX_POS = 448


Do
	Sleep(1000)
	;This part run on OFF mode
	;Update Char HP and MP
	;UpdateCharInfo()

Until $STOP = False
While (1)

	UpdateCharInfo()
	UpdatePetInfo()
	TargetTypeCheck()
	Main()

WEnd


Func Main()

	If $STOP = False Then

			TargetMob()

			If $TARGET_STATE > 9 Then
				KillTarget()
			EndIf

			UpdateCharInfo()
			;Stop on die
			StopCheck()
			HPMPRestore()
			BuffsCheck()

	Else
		Sleep(300)

	EndIf

EndFunc   ;==>Main

Func StartOrStop()

	If $STOP = True Then
		$STOP = False
	Else
		$STOP = True
	EndIf

EndFunc

Func BarDetect($BAR_XMIN,$BAR_XMAX,$BAR_YPOS,$BAR_EMPTYCOLOR)
	;Func for get bar fill in %
	;Left to right scan
	;-------------------------------------------------------
	;                  BAR check
	;-------------------------------------------------------
	Local $BAR_SEARCH = $BAR_XMIN - 1
	Local $BAR_TEMP = 1
	Local $BAR_LENGHT = $BAR_XMAX - $BAR_XMIN
	Do
		$BAR_SEARCH = $BAR_SEARCH + 1
		Local $iColorTEMPbar = PixelGetColor($BAR_SEARCH,$BAR_YPOS,$hWnd)
		If Hex($iColorTEMPbar,6) = $BAR_EMPTYCOLOR Then ExitLoop
	Until $BAR_SEARCH = $BAR_XMAX
	$BAR_TEMP = $BAR_SEARCH - $BAR_XMIN
	$BAR_PERC = Int($BAR_TEMP / $BAR_LENGHT * 100)
	Return $BAR_PERC

EndFunc   ;==> BarDetect

;-----------------------------------------------------------------------------------------
;
;                  TARGET SECTION
;
;-----------------------------------------------------------------------------------------

Func TargetMob()

	;Use Skill for agro
	If TimerDiff($SKILL1_COUNT) > ($SKILL1_TIMER * 1000) Then
		ControlSend($hWnd, "", "", $SKILL1_KEY)
		Sleep(100)
		TargetTypeCheck()
		TargetHPCheck()
		If $TARGET_STATE > 9 Then $SKILL1_COUNT = TimerInit()
	EndIf
	If $ROTATE_SEARCH = True Then
		If $TARGET_STATE = 0 Then
			ControlSend($hWnd, "", "", "{UP}")
			Sleep(Random(30,60,1))
			ControlSend($hWnd, "", "", "{DOWN}")
			Sleep(Random(30,60,1))
			Sleep(200)
			If TimerDiff($SKILL1_COUNT) > ($SKILL1_TIMER * 1000) Then
				ControlSend($hWnd, "", "", $SKILL1_KEY)
				Sleep(300)
				TargetTypeCheck()
				TargetHPCheck()
				If $TARGET_STATE > 9 Then $SKILL1_COUNT = TimerInit()
			EndIf
		EndIf
		If $TARGET_STATE = 0 Then
			If Random(0,1,1) = 1 Then
				ControlSend($hWnd, "", "", "{PGUP}")
				Sleep(Random(30,60,1))
				ControlSend($hWnd, "", "", "{DOWN}")
				Sleep(Random(30,60,1))
				ControlSend($hWnd, "", "", "{UP}")
				Sleep(Random(30,60,1))
			Else
				ControlSend($hWnd, "", "", "{PGDN}")
				Sleep(Random(30,60,1))
				ControlSend($hWnd, "", "", "{DOWN}")
				Sleep(Random(30,60,1))
				ControlSend($hWnd, "", "", "{UP}")
				Sleep(Random(30,60,1))
			EndIf
			Sleep(200)
			If TimerDiff($SKILL1_COUNT) > ($SKILL1_TIMER * 1000) Then
				ControlSend($hWnd, "", "", $SKILL1_KEY)
				Sleep(100)
				TargetTypeCheck()
				TargetHPCheck()
				If $TARGET_STATE > 9 Then $SKILL1_COUNT = TimerInit()
			EndIf
		EndIf
	EndIf

EndFunc   ;==>TargetMob

Func TargetTypeCheck()

	$TARGET_STATE = 0
	Local $iColorTEMP3 = PixelGetColor(729,$HP_YPOS,$hWnd);miniHPmax
	Local $iColorTEMP4 = PixelGetColor(553,$HP_YPOS,$hWnd);miniHPmin
	Local $iColorTEMP5 = PixelGetColor(494,$HP_YPOS,$hWnd);mobHPmin
	Local $iColorTEMP6 = PixelGetColor(428,$HP_YPOS,$hWnd);bossHPmin
	If Hex($iColorTEMP3,6) = '372A11' Then $TARGET_STATE = 1
	If Hex($iColorTEMP3,6) = '579134' Then $TARGET_STATE = 2
	If Hex($iColorTEMP3,6) = 'D45A5A' Or Hex($iColorTEMP4,6) = '902727' Then $TARGET_STATE = 10
	If Hex($iColorTEMP3,6) = 'A0322D' Or Hex($iColorTEMP5,6) = '892020' Then $TARGET_STATE = 11
	If Hex($iColorTEMP3,6) = '9A2D2A' Or Hex($iColorTEMP6,6) = '972E2E' Then $TARGET_STATE = 12


EndFunc   ;==>TargetTypeCheck

Func TargetHPCheck()
	;for Mini MOB
	If $TARGET_STATE = 10 Then
		$TARGET_HP = BarDetect(553,729,$HP_YPOS,$EMPTYHP_COLOR)
	EndIf
	;for Normal MOB
	If $TARGET_STATE = 11 Then
		$TARGET_HP = BarDetect(494,788,$HP_YPOS,$EMPTYHP_COLOR)
	EndIf
	;For Boss MOB
	If $TARGET_STATE = 12 Then
		$TARGET_HP = BarDetect(428,854,$HP_YPOS,$EMPTYHP_COLOR)
	EndIf

EndFunc   ;==>TargetCheck

;-----------------------------------------------------------------------------------------
;
;              END TARGET SECTION
;
;-----------------------------------------------------------------------------------------

;-----------------------------------------------------------------------------------------
;
;               IN COMBAT ACTION SECTION
;
;-----------------------------------------------------------------------------------------

Func StopCheck()

	UpdateCharInfo()
	If $HP = 0 Then
		StartOrStop()
	EndIf

EndFunc

Func KillTarget()

	;Read Last HP Info
	;UpdateCharInfo()

	If $TARGET_STATE > 9 Then

		Do
			;Loop for skill spaming
			If TimerDiff($SKILL2_COUNT) > ($SKILL2_TIMER * 1000) Then
				ControlSend($hWnd, "", "", $SKILL2_KEY)
				$SKILL2_COUNT = TimerInit()
				Sleep(Random(20,30,1))
			EndIf
			If TimerDiff($SKILL3_COUNT) > ($SKILL3_TIMER * 1000) Then
				ControlSend($hWnd, "", "", $SKILL3_KEY)
				$SKILL3_COUNT = TimerInit()
				Sleep(Random(20,30,1))
			EndIf
			;Check if Auto-Pot is Needed
			HPMPFightAutoPotCheck()

			TargetHPCheck()
			If $TARGET_HP = 0 Then
				Sleep(500)
				$TOTAL_KILLED = $TOTAL_KILLED + 1
				PickLoot($LOOT_TIMES)
				TargetTypeCheck()
				If $TARGET_STATE = 1 Then ControlSend($hWnd, "", "", "{ESC}") ;drop dead target
			EndIf

		Until $TARGET_STATE < 10
		;Pick loot thin mob die
		PickLoot($LOOT_TIMES)
	Else
		ControlSend($hWnd, "", "", "{ESC}")
	EndIf

EndFunc

Func HPMPFightAutoPotCheck()
	;HP and MP restore in Combat

	UpdateCharInfo()
	If $HP < $HPPOT_PERC And TimerDiff($HPPOT_COUNT) > ($HPPOT_TIMER * 1000) Then
		ControlSend($hWnd, "", "", $HPPOT_KEY)
		$HPPOT_COUNT = TimerInit()
		Sleep(30)
	EndIf
	If $MP < $MPPOT_PERC And TimerDiff($MPPOT_COUNT) > ($MPPOT_TIMER * 1000) Then
		ControlSend($hWnd, "", "", $MPPOT_KEY)
		$MPPOT_COUNT = TimerInit()
		Sleep(30)
	EndIf

EndFunc   ;==> HPMPFightAutoPotCheck

;-----------------------------------------------------------------------------------------
;
;              END IN COMBAT ACTION SECTION
;
;-----------------------------------------------------------------------------------------

;-----------------------------------------------------------------------------------------
;
;               OUT COMBAT ACTION SECTION
;
;-----------------------------------------------------------------------------------------

Func PickLoot($MAX)

	;Check if need pick loot
	If $LOOT_FLAG = True Then
		For $P = $MAX To 1 Step -1
			ControlSend($hWnd, "", "", "f")
			Sleep(Random(100,200,1))
		Next
	EndIf

EndFunc   ;==>PickLoot

Func HPMPRestore()

	UpdateCharInfo()
	UpdatePetInfo()
	TargetTypeCheck()
	If $TARGET_STATE = 0 Then
		Do
			Sleep(500)
			If $MP > $MP_REGEN_STOP And ($HP < $HPSKILL_PERC Or $PET_HP < $HP_PET_PERC) And TimerDiff($HPSKILL_COUNT) > ($HPSKILL_TIMER * 1000) Then
				ControlSend($hWnd, "", "", $HPSKILL_KEY)
				$HPSKILL_COUNT = TimerInit()
				Sleep(500)
			ElseIf $FLUITE_HP_TYPE = True And ($HP < $FLUITE_PERC Or $PET_HP < $HP_PET_PERC) Then
				ControlSend($hWnd, "", "", $FLUITE_KEY)
				Sleep(7000)
			EndIf
			If $FLUITE_HP_TYPE = False And $MP < $FLUITE_PERC Then
				ControlSend($hWnd, "", "", $FLUITE_KEY)
				Sleep(7000)
			ElseIf $MP < $MPSKILL_PERC And TimerDiff($MPSKILL_COUNT) > ($MPSKILL_TIMER * 1000) Then
				ControlSend($hWnd, "", "", $MPSKILL_KEY)
				$MPSKILL_COUNT = TimerInit()
				Sleep(9000)
			EndIf
			UpdateCharInfo()
			UpdatePetInfo()
			TargetTypeCheck()
		Until ($HP > $HP_REGEN_STOP And $MP > $MP_REGEN_STOP And $PET_HP > $HP_PET_REGENSTOP) Or $TARGET_STATE <> 0
	EndIf

EndFunc ; ==> HPMPRestore

Func BuffsCheck()

	If TimerDiff($BUFF1_COUNT) > ($BUFF1_TIMER * 1000) Then
		ControlSend($hWnd, "", "", $BUFF1_KEY)
		Sleep(2000)
		$BUFF1_COUNT = TimerInit()
	EndIf
	If TimerDiff($BUFF2_COUNT) > ($BUFF2_TIMER * 1000) Then
		ControlSend($hWnd, "", "", $BUFF2_KEY)
		Sleep(2000)
		$BUFF2_COUNT = TimerInit()
	EndIf

EndFunc


;-----------------------------------------------------------------------------------------
;
;               END OUT COMBAT ACTION SECTION
;
;-----------------------------------------------------------------------------------------

;-----------------------------------------------------------------------------------------
;
;               CHAR and PET STATUS SECTION
;
;-----------------------------------------------------------------------------------------

Func UpdatePetInfo()

	$PET_HP = BarDetect($PET_XMIN_POS,$PET_XMAX_POS,$HP_YPOS,$EMPTYHP_COLOR)
	$PET_MP = BarDetect($PET_XMIN_POS,$PET_XMAX_POS,$MP_YPOS,$EMPTYMP_COLOR)

EndFunc ;==>UpdatePetInfo

Func UpdateCharInfo()

	$HP = BarDetect($CHAR_XMIN_POS,$CHAR_XMAX_POS,$HP_YPOS,$EMPTYHP_COLOR)
	$MP = BarDetect($CHAR_XMIN_POS,$CHAR_XMAX_POS,$MP_YPOS,$EMPTYMP_COLOR)

EndFunc   ;==>UpdateCharInfo

;-----------------------------------------------------------------------------------------
;
;               End CHAR and PET STATUS SECTION
;
;-----------------------------------------------------------------------------------------
;Подробнее: https://www.rf-cheats.ru/forum/showthread.php?t=236551