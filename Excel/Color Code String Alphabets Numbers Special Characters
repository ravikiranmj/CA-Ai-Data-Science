'The following Function helps Excel identify if a character is a letter or not
Function IsLetter(strValue As String) As Boolean
    Dim intPos As Integer
    For intPos = 1 To Len(strValue)
        Select Case Asc(Mid(strValue, intPos, 1))
            Case 65 To 90, 97 To 122
                IsLetter = True
            Case Else
                IsLetter = False
                Exit For
        End Select
    Next
End Function
'The following function helps Excel identify if a character is a special character, like #, @, and !
Function IsSpecial(strValue As String) As Boolean
    Dim intPos As Integer
    For intPos = 1 To Len(strValue)
        Select Case Asc(Mid(strValue, intPos, 1))
            Case 33 To 47, 58 To 64, 91 To 96, 123 To 126
                IsSpecial = True
            Case Else
                IsSpecial = False
                Exit For
        End Select
    Next
End Function
'This is the Macro that will change the colors of characters in your selected range
Public Sub ColorText()
'the next 3 lines set abbreviations as certain kinds of things. Long is a number or integer, Ranges are cell selections
Dim lng As Long
Dim rng As Range
Dim cl As Range
'The next line sets the range of cells to change colors in to whatever cells you have selected on the sheet
    Set rng = Selection
'This section loops through each cell in your selection and checks each character in the cell.
    For Each cl In rng.Cells
    For lng = 1 To Len(cl.Value)
        With cl.Characters(lng, 1)
'First the code checks for letters and keeps them black
        If IsLetter(.Text) Then
            .Font.ColorIndex = 1 'change this number to change the color

'Next it checks for Special Characters and colors them Blue
        ElseIf IsSpecial(.Text) Then
            .Font.ColorIndex = 41

'If a character is not a letter or a special, it must be a number, so it colors numbers red
        Else
            .Font.ColorIndex = 3

        End If
        End With
    Next lng    'this moves the code to the next character
  Next cl       'once all the characters are checked, this moves the code to the next cell
End Sub         'once all the selected cells have been run through, this ends the code
