::::BgetDescription#Backup and restore Wireless network profiles in Windows 10.
::::BgetAuthor#FreeBooter
::::BgetCategory#tools
@Echo Off & cls	
	
(Net session >nul 2>&1)||(PowerShell start """%~0""" -verb RunAs & Exit /B)	
	
Setlocal EnableDelayedExpansion
	
:choice

Cls & Mode CON  LINES=11 COLS=60 & Color 0E & Title Created By FreeBooter
Echo.
Echo.
Echo.
Echo        Backup Wireless Network Profiles   (B)?   
Echo.       
Echo        Restore Wireless Network Profiles  (R)?
Echo.


Set /p input= RESPONSE: 

If /i  Not %input%==B (Goto :_Ex) Else (Goto :_Backup) 

:_Ex
If /i Not %input%==R  (Goto :choice) Else (Goto :_Restore)



:_Backup
	mode con cols=95 lines=5 & color 0E
	Call :BrowseForFolder "Please choose the source folder to backup wireless profiles" SourceFolder
	If defined SourceFolder (
		echo(
		echo             You chose "!SourceFolder!" as source folder
	) else (
		echo(
		Color 0C & echo                    The source folder is not defined ... Exiting ......
		Timeout /T 2 /nobreak>nul & exit
	)

netsh wlan export profile key=clear folder="!SourceFolder!"

Timeout /T 4 /nobreak>nul & exit

	


:_Restore	
	mode con cols=95 lines=5 & color 0E
	
	Call :BrowseForFolder "Please choose the target folder to restore wireless profiles" TargetFolder
	If defined TargetFolder (
		echo(
		echo             You chose "!TargetFolder!" as Target folder
	) else (
		echo(
		Color 0C & echo                    The Target folder is not defined ... Exiting ......
		Timeout /T 2 /nobreak>nul & exit
	)
Timeout /T 3 /nobreak>nul
	(
Cd /d !TargetFolder!	

For %%c in (*.xml) do netsh wlan add profile filename="%%c" user=all



	)
Timeout /T 5 /nobreak>nul & exit
	
	
	
	:BrowseForFolder
set "psCommand="(new-object -COM 'Shell.Application')^
.BrowseForFolder(0,'%1',0,0).self.path""
for /f "usebackq delims=" %%I in (`powershell %psCommand%`) do set "%2=%%I"
exit /b