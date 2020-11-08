:: Backup and Restore Device Drivers in Windows 10
::::BgetDescription#Backup and Restore Device Drivers in Windows 10
::::BgetAuthor#FreeBooter
::::BgetCategory#tools

@Echo Off & cls	
	
(Net session >nul 2>&1)||(PowerShell start """%~0""" -verb RunAs & Exit /B)	
	
Setlocal EnableDelayedExpansion
	
:choice

Cls & Mode CON  LINES=11 COLS=40 & Color 0E & Title Created By FreeBooter
Echo.
Echo.
Echo.
Echo        Export Drivers  (E)?   
Echo.       
Echo        Import Drivers  (I)?
Echo.


Set /p input= RESPONSE: 

If /i  Not %input%==E (Goto :_Ex) Else (Goto :_Backup) 

:_Ex
If /i Not %input%==I  (Goto :choice) Else (Goto :_Restore)



:_Backup
	mode con cols=95 lines=5 & color 0E
	Call :BrowseForFolder "Please choose the source folder for to backup drivers" SourceFolder
	If defined SourceFolder (
		echo(
		echo             You chose "!SourceFolder!" as source folder
	) else (
		echo(
		Color 0C & echo                    The source folder is not defined ... Exiting ......
		Timeout /T 2 /nobreak>nul & exit
	)

Dism /online /export-driver /destination:"!SourceFolder!"

Timeout /T 4 /nobreak>nul & exit

	


:_Restore	
	mode con cols=95 lines=5 & color 0E
	
	Call :BrowseForFolder "Please choose the target folder for to restore drivers" TargetFolder
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
pnputil /add-driver "!TargetFolder!\*.inf" /subdirs /install /reboot
	)
Timeout /T 6 /nobreak>nul & exit
	
	
	
	:BrowseForFolder
set "psCommand="(new-object -COM 'Shell.Application')^
.BrowseForFolder(0,'%1',0,0).self.path""
for /f "usebackq delims=" %%I in (`powershell %psCommand%`) do set "%2=%%I"
exit /b