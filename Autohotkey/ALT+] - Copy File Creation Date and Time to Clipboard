!]::            ; Letter Alt + ] - Get Creation Date and Time of File in Format DD-MMM-YYYY tt:mm:ss AM/PM
For itemNum, item in Explorer_GetSelection()
 FileGetTime, ctime, %item%, C
Clipboard =
FormatTime, Clipboard, %ctime%, dd-MMM-yyyy hh.mm.ss tt
ClipWait
If ErrorLevel
 MsgBox, 48, Error, An error occurred while waiting for the clipboard.
Else MsgBox,, Copied to clipboard, % Clipboard "`n`n(For " RegExReplace(item, ".+\\") ")"
Return

Explorer_GetSelection() {
 ; https://www.autohotkey.com/boards/viewtopic.php?style=17&t=60403#p255256
 WinGetClass, winClass, % "ahk_id" hWnd := WinExist("A")
 If !(winClass ~= "Progman|WorkerW|(Cabinet|Explore)WClass")
  Return
 shellWindows := ComObjCreate("Shell.Application").Windows, sel := []
 If !(winClass ~= "Progman|WorkerW") {
  For window in shellWindows
   If (hWnd = window.HWND) && (shellFolderView := window.Document)
    Break
 } Else shellFolderView := shellWindows.FindWindowSW(0, 0, SWC_DESKTOP := 8, 0, SWFO_NEEDDISPATCH := 1).Document
 For item in shellFolderView.SelectedItems
  sel.Push(item.Path)
 Return sel
}
