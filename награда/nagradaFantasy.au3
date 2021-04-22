#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=..\..\Lightshot\Icons\награда.ico
#AutoIt3Wrapper_Outfile=upps.Exe
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
const $color=0xffffff
Sleep(3000)
While 1
$coord=PixelSearch(1255, 50, 1300, 55, $color, 20, 1)
If Not @error Then
MouseMove(1275, 53, 20)
Sleep(1000)
MouseClick("Left")
Sleep(2000)
MouseMove(1275, 250)
EndIf
Sleep(200)
WEnd