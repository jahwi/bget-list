''''Bgetdescription#[VBS] Listen to live internet music.
''''Bgetauthor#Hackoo
''''Bgetcategory#tools
Option Explicit
Dim Title,MyScriptPath,DJBuzzRadio,MyLoop,strComputer,objPing,objStatus,FSO,FolderScript,Icon
Title = "Radio DJ Buzz Live by © Hackoo 2018 "
MyScriptPath = WScript.ScriptFullName
Set FSO = Createobject("Scripting.FileSystemObject")
'Path of the folder where the Vbscript is located
FolderScript = FSO.GetParentFolderName(MyScriptPath)
DJBuzzRadio = ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(58)&ChrW(47)&_
ChrW(47)&ChrW(119)&ChrW(119)&ChrW(119)&ChrW(46)&ChrW(99)&ChrW(104)&ChrW(111)&_
ChrW(99)&ChrW(114)&ChrW(97)&ChrW(100)&ChrW(105)&ChrW(111)&ChrW(115)&ChrW(46)&_
ChrW(99)&ChrW(104)&ChrW(47)&ChrW(100)&ChrW(106)&ChrW(98)&ChrW(117)&ChrW(122)&ChrW(122)&_
ChrW(114)&ChrW(97)&ChrW(100)&ChrW(105)&ChrW(111)&ChrW(95)&ChrW(119)&ChrW(105)&ChrW(110)&_
ChrW(100)&ChrW(111)&ChrW(119)&ChrW(115)&ChrW(46)&ChrW(109)&ChrW(112)&ChrW(51)&ChrW(46)&_
ChrW(97)&ChrW(115)&ChrW(120)
'To create a shortcut of this vbscript on your desktop
Call Shortcut(MyScriptPath,"DJ Buzz Radio")
MyLoop = True
If CheckConnection = True Then Call AskQuestion()
'***************************************************************************
Function CheckConnection()
	CheckConnection = False
	While MyLoop = True
		strComputer = "smtp.gmail.com"
		Set objPing = GetObject("winmgmts:{impersonationLevel=impersonate}!\\").ExecQuery _
		("select * from Win32_PingStatus where address = '" & strComputer & "'")
		For Each objStatus in objPing
			If objStatus.Statuscode = 0 Then
				MyLoop = False
				CheckConnection = True
				Exit Function
			End If
		Next
		Pause(10) 'To sleep for 10 secondes
	Wend
End Function
'***************************************************************************
Sub Play(URL)
	Dim Sound
	Set Sound = CreateObject("WMPlayer.OCX")               
	Sound.URL = URL
	Sound.settings.volume = 100                               
	Sound.Controls.play                                     
	do while Sound.currentmedia.duration = 0                
		wscript.sleep 100                                       
	loop                                                    
	wscript.sleep (int(Sound.currentmedia.duration)+1)*1000 
End Sub
'***************************************************************************
Sub Shortcut(Application_Path,ShortcutName)
	Dim objShell,fso,DesktopPath,objShortCut,MyTab,strCurDir
	Set objShell = CreateObject("WScript.Shell")
	Set fso = CreateObject("Scripting.FileSystemObject")
	strCurDir = fso.GetParentFolderName(WScript.ScriptFullName)
	MyTab = Split(Application_Path,"\")
	If ShortcutName = "" Then
		ShortcutName = MyTab(UBound(MyTab))
	End if
	DesktopPath = objShell.SpecialFolders("Desktop")
	Set objShortCut = objShell.CreateShortcut(DesktopPath & "\" & ShortcutName & ".lnk")
	objShortCut.TargetPath = Dblquote(Application_Path)
	ObjShortCut.IconLocation = "%SystemRoot%\system32\shell32.dll,138"
	objShortCut.Save
End Sub
'*****************************************************************************
'Function to add double quotes in a variable
Function DblQuote(Str)
	DblQuote = Chr(34) & Str & Chr(34)
End Function
'*****************************************************************************
Function AppPrevInstance()   
	With GetObject("winmgmts:" & "{impersonationLevel=impersonate}!\\.\root\cimv2")   
		With .ExecQuery("SELECT * FROM Win32_Process WHERE CommandLine LIKE " & CommandLineLike(WScript.ScriptFullName) & _
			" AND CommandLine LIKE '%WScript%' OR CommandLine LIKE '%cscript%'")   
			AppPrevInstance = (.Count > 1)   
		End With   
	End With   
End Function    
'******************************************************************************
Function CommandLineLike(ProcessPath)   
	ProcessPath = Replace(ProcessPath, "\", "\\")   
	CommandLineLike = "'%" & ProcessPath & "%'"   
End Function
'******************************************************************************
Sub Pause(NSeconds)
	Wscript.Sleep(NSeconds*1000)
End Sub
'******************************************************************************
Sub AskQuestion()
	Dim Question,MsgAR,MsgFR,MsgEN
	MsgFR = "Voulez-vous écouter DJ Buzz Radio en direct ?" & vbcr &_
	"Oui = Pour écouter la radio" & vbcr & "Non = Pour arrêter la radio" & vbcr & String(50,"*")
	MsgEN = "Did you want to listen to the Radio DJ Buzz Live ?" & vbcr &_
	"Yes = To Listen to the Radio" & vbcr &_
	"No = To Stop the Radio" & vbcr & String(50,"*")
	MsgAR = ChrW(1607)&ChrW(1604)&ChrW(32)&ChrW(1578)&ChrW(1585)&ChrW(1610)&ChrW(1583)&_ 
	ChrW(32)&ChrW(1571)&ChrW(1606)&ChrW(32)&ChrW(1578)&ChrW(1587)&ChrW(1605)&ChrW(1593)&ChrW(32)&_ 
	ChrW(32)&ChrW(1604)&ChrW(1575)&ChrW(1610)&ChrW(1601)&ChrW(32)&ChrW(1585)&ChrW(1575)&ChrW(1583)&_
	ChrW(1610)&ChrW(1608)&ChrW(32)&ChrW(68)&ChrW(74)&ChrW(32)&ChrW(66)&ChrW(117)&ChrW(122)&ChrW(122)&_ 
	ChrW(32)&ChrW(82)&ChrW(97)&ChrW(100)&ChrW(105)&ChrW(111)&ChrW(32)&ChrW(63) & vbcr & ChrW(1606)&ChrW(1593)&_ 
	ChrW(1605)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(1604)&ChrW(1575)&ChrW(1587)&ChrW(1578)&ChrW(1605)&ChrW(1575)&ChrW(1593) & vbcr &_
	ChrW(1604)&ChrW(1575)&ChrW(32)&ChrW(61)&ChrW(32)&ChrW(1604)&ChrW(1608)&ChrW(1602)&ChrW(1601) & vbcr & String(50,"*")
	Question = MsgBox(MsgFR & vbcr & MsgEN & vbcr & MsgAR,vbYesNO+vbQuestion+vbSystemModal,Title)
	If Question = VbYes And Not AppPrevInstance() Then
		Call Play(DJBuzzRadio)
	End If
	If Question = VbYes And AppPrevInstance() Then 
		MsgBox "There is another instance in execution !" & VbCrLF &_
		"Il y a une autre instance en cours d'exécution !"& VbcrLF &_
		ChrW(1607)&ChrW(1606)&ChrW(1575)&ChrW(1603)&ChrW(32)&ChrW(1605)&_ 
		ChrW(1579)&ChrW(1575)&ChrW(1604)&ChrW(32)&ChrW(1570)&ChrW(1582)&_ 
		ChrW(1585)&ChrW(32)&ChrW(1601)&ChrW(1610)&ChrW(32)&ChrW(1575)&_ 
		ChrW(1604)&ChrW(1578)&ChrW(1606)&ChrW(1601)&ChrW(1610)&ChrW(1584)& VbcrLF &_
		CommandLineLike(WScript.ScriptName),VbExclamation+vbSystemModal,Title    
		WScript.Quit()
	End If
	If Question = VbNo And Not AppPrevInstance() Then
		Call Kill("wscript.exe")
	End If
	If Question = VbNo And AppPrevInstance() Then
		Call Kill("wscript.exe")
	End If
End Sub
'******************************************************************************
Sub Kill(MyProcess)
	Dim Titre,colItems,objItem,Processus,Question
	Titre = " Processus "& DblQuote(MyProcess) &" en cours d'exécution "
	Set colItems = GetObject("winmgmts:").ExecQuery("Select * from Win32_Process " _
	& "Where Name like '%"& MyProcess &"%' AND commandline like " & CommandLineLike(WScript.ScriptFullName) & "",,48)
	For Each objItem in colItems
		objItem.Terminate(0)'Kill this process
	Next
End Sub
'******************************************************************************