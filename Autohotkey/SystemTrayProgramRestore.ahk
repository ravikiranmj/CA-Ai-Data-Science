#o::
DetectHiddenWindows, On 
IfWinNotExist, ahk_class rctrl_renwnd32
Run, "C:\Program Files\Microsoft Office\OFFICE11\Outlook.exe" 
Else 
DetectHiddenWindows, Off
IfWinNotExist ahk_class rctrl_renwnd32
{ 
WinShow, ahk_class rctrl_renwnd32
WinActivate, ahk_class rctrl_renwnd32
} 
Else 
IfWinExist, ahk_class rctrl_renwnd32
{ 
WinMinimize, ahk_class rctrl_renwnd32
WinHide, ahk_class rctrl_renwnd32
} 
Return
