#include <WinAPIConstants.au3>
#include <WinAPI.au3>

Func click(x,y)
	$hwnd=WinGetHandle("[ACTIVE]")
	$lParam=MAKELONG(x,y)

	ControlSend($hwnd,