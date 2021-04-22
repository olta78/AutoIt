#include <ImageSearch.au3>
Sleep(2000)
$x = 0
$y = 0
While 1
	 $Search = _ImageSearch('nagrada.bmp', 1, $x, $y, 0)
	 If $Search = 1 Then
		 MouseMove($x, $y, 30)
	 EndIf
	 Sleep(5000)
	 MouseMove($x, $y + 200, 20)
	 Sleep(5000)
WEnd

 While 1
	 Sleep(100)
 WEnd
