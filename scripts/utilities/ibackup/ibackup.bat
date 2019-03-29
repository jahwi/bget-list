@echo off
:: Incremental_Backup.bat Created by Hackoo on 12/08/2017
:: It is a total copy first and then incrementally,
:: ie, it just copies the new files and changed files.
::::BgetDescription#Backs up files.
::::BgetAuthor#Hackoo
::::BgetCategory#utilities
mode con cols=95 lines=5 & color 0E
Title %~nx0 for Incremental Backup with XCopy Command by Hackoo 2017
set "Settings=%~dp0Settings.ini"
Set "FirstFull_CopyLog=%~dp0%~n0_FirstFull_CopyLog.txt"
Set "LogFile=%~dp0%~n0_Incremental_CopyLog.txt"
If not exist "%Settings%" (
	Call :BrowseForFolder "Please choose the source folder for the backup" SourceFolder
	Setlocal EnableDelayedExpansion
	If defined SourceFolder (
		echo(
		echo             You chose "!SourceFolder!" as source folder
	) else (
		echo(
		Color 0C & echo                    The source folder is not defined ... Exiting ......
		Timeout /T 2 /nobreak>nul & exit
	)
	Call :BrowseForFolder "Please choose the target folder for the backup" TargetFolder
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
		echo "!SourceFolder!" 
		echo "!TargetFolder!\Backups_%ComputerName%\" 
	)
cls & echo( & echo(
echo         Please wait a while ... The Backup to "!TargetFolder!" is in progress... 
Call :Backup_XCopy "!SourceFolder!" "!TargetFolder!" "!FirstFull_CopyLog!"
Timeout /T 1 /nobreak>nul 
Start "" "!FirstFull_CopyLog!" & exit
) else (
Setlocal EnableDelayedExpansion
for /f "delims=" %%a in ('Type "%Settings%"') do (
	set /a idx+=1
	set Param[!idx!]=%%a
)

Set "SourceFolder=!Param[1]!"
Set "TargetFolder=!Param[2]!"
echo(
echo        The source Folder from Settings.ini is : !SourceFolder!
echo        The Target Folder from Settings.ini is : !TargetFolder!
Timeout /T 1 /nobreak>nul & cls & echo( & echo(
echo       Please wait a while ... The Backup to !TargetFolder! is in progress... 
Call :Backup_XCopy !SourceFolder! !TargetFolder! !LogFile!
)
Timeout /T 1 /nobreak>nul 
Start "" !LogFile! & exit
::****************************************************************************
:BrowseForFolder
set "psCommand="(new-object -COM 'Shell.Application')^
.BrowseForFolder(0,'%1',0,0).self.path""
for /f "usebackq delims=" %%I in (`powershell %psCommand%`) do set "%2=%%I"
exit /b
::****************************************************************************
:Backup_XCopy <Source> <Target> <LogFile>
Xcopy /c  /d  /e  /s  /i  /y %1 %2 > %3 2>&1
Exit /b
::****************************************************************************