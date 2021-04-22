Sleep(5000)
$hWnd = WinGetHandle("[ACTIVE]", "")
$X = 456
$Y = 814

For $i = 0 To 10
	Sleep(1000)
	MouseLeftClick()
Next


Func MouseLeftClick($hWnd, $X, $Y, $Sleep = 50 + Random(20, 50, 1))
  Local Const $MK_LBUTTON = 0x0001
  _WinAPI_PostMessage($hWnd, $WM_SETCURSOR, $hWnd, _WinAPI_MakeLong($HTCLIENT, $WM_LBUTTONDOWN))
  _WinAPI_PostMessage($hWnd, $WM_LBUTTONDOWN, $MK_LBUTTON, _WinAPI_MakeLong($X, $Y))
  Sleep($Sleep)
  _WinAPI_PostMessage($hWnd, $WM_SETCURSOR, $hWnd, _WinAPI_MakeLong($HTCLIENT, $WM_LBUTTONUP))
  _WinAPI_PostMessage($hWnd, $WM_LBUTTONUP, 0, _WinAPI_MakeLong($X, $Y))
EndFunc