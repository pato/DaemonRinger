#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=..\..\ICONS\Call-bell.ico
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include "Toast.au3"
#include <Inet.au3>


Local $sMsg, $hProgress, $aRet[2]
Global $noteStart = 1000, $noteLength = 200
Global $url = "http://plankenau.com/ringer/handle.php?op="
Global $name = "pato"

AdlibRegister("_check", 5000)

Opt("TrayMenuMode", 1)

Local $exititem = TrayCreateItem("Exit")

TraySetState()

While 1
    Local $msg = TrayGetMsg()
    Select
        Case $msg = 0
            ContinueLoop
        Case $msg = $exititem
            Exit
	EndSelect
	sleep(10)
WEnd

Func _check()
	$data = _INetGetSource($url & "check&name=" & $name, True)
	If StringLeft($data,2) == "ri" Then
		_beep()
		_toast("DaemonRing",StringTrimLeft($data,2))
	EndIf
EndFunc   ;==>_check

Func _beep()
	Beep($noteStart, $noteLength)
	Beep($noteStart + 100, $noteLength)
	Beep($noteStart + 200, $noteLength)
	Beep($noteStart - 100, $noteLength)
EndFunc   ;==>_beep

Func _toast($title = "DaemonRing", $msg = "Come downstairs!", $timeout = 5)
	$aRet = _Toast_Show(0, $title, $msg, $timeout)
	_Toast_Hide()
EndFunc   ;==>_toast
