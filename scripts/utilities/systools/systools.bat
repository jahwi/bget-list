@Echo Off
Cls & Color 1A

Cd %systemroot%\system32

:: Add “System Tools” Cascading Menu in Windows 7 and Later Desktop Context Menu
::::BgetDescription#Add a system tools cascading menu to the desktop context menu. These include Control Panel; Disk Cleanup; Event Viewer and others.
::::BgetAuthor#Freebooter
::::BgetCategory#utilities

REM  --> Check for permissions
Reg query "HKU\S-1-5-19\Environment" 
REM --> If error flag set, we do not have admin.
if %errorlevel% NEQ 0 (
ECHO                 **************************************
ECHO                  Running Admin shell... Please wait...
ECHO                 **************************************

    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = "%*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B


:gotAdmin

Cls & Mode CON  LINES=11 COLS=75 & Color 0D & Title Created By FreeBooter
Echo.
Echo.
Echo.

Echo        Add a System Tools Cascading in Desktop Context Menu (Y/N)?   
Echo.       
Echo.
Echo.


Set /p input= RESPONSE: 

If /i  Not %input%==Y (Goto :_Ex) Else (Goto :_Start) 

:_Ex
If /i Not %input%==N  (Goto :EOF) Else (Goto :_RegRestore)



:_Start

Reg.exe add "HKCR\DesktopBackground\Shell\SystemTools" /v "MUIVerb" /t REG_SZ /d "System Tools" /f > Nul
Reg.exe add "HKCR\DesktopBackground\Shell\SystemTools" /v "SubCommands" /t REG_SZ /d "control;cleanmgr;devmgr;event;regedit;secctr;msconfig;taskmgr;taskschd;wu" /f > Nul
Reg.exe add "HKCR\DesktopBackground\Shell\SystemTools" /v "icon" /t REG_SZ /d "imageres.dll,104" /f > Nul
Reg.exe add "HKCR\DesktopBackground\Shell\SystemTools" /v "Position" /t REG_SZ /d "Bottom" /f > Nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\control" /ve /t REG_SZ /d "Control Panel" /f > Nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\control" /v "icon" /t REG_SZ /d "control.exe" /f > Nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\control\command" /ve /t REG_SZ /d "control.exe" /f > Nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\cleanmgr" /ve /t REG_SZ /d "Disk Cleanup" /f > Nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\cleanmgr" /v "icon" /t REG_SZ /d "cleanmgr.exe" /f > Nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\cleanmgr\command" /ve /t REG_SZ /d "cleanmgr.exe" /f > Nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\devmgr" /ve /t REG_SZ /d "Device Manager" /f > Nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\devmgr" /v "Icon" /t REG_EXPAND_SZ /d "devmgr.dll" /f > Nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\devmgr\command" /ve /t REG_EXPAND_SZ /d "%%SystemRoot%%\system32\mmc.exe /s %%SystemRoot%%\system32\devmgmt.msc" /f > Nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\event" /ve /t REG_SZ /d "Event Viewer" /f > Nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\event" /v "icon" /t REG_SZ /d "eventvwr.exe" /f > Nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\event\command" /ve /t REG_EXPAND_SZ /d "%%SystemRoot%%\system32\mmc.exe /s %%SystemRoot%%\system32\eventvwr.msc" /f > Nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\regedit" /ve /t REG_SZ /d "Registry Editor" /f > Nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\regedit" /v "icon" /t REG_SZ /d "regedit.exe" /f > Nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\regedit\command" /ve /t REG_SZ /d "regedit.exe" /f > Nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\secctr" /ve /t REG_SZ /d "Security Center" /f > Nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\secctr" /v "icon" /t REG_SZ /d "wscui.cpl" /f > Nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\secctr\command" /ve /t REG_SZ /d "control wscui.cpl" /f > Nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\msconfig" /ve /t REG_SZ /d "System Configuration" /f > Nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\msconfig" /v "icon" /t REG_SZ /d "msconfig.exe" /f > Nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\msconfig\command" /ve /t REG_SZ /d "msconfig.exe" /f > Nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\taskmgr" /ve /t REG_SZ /d "Task Manager" /f > Nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\taskmgr" /v "icon" /t REG_SZ /d "taskmgr.exe" /f > Nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\taskmgr\command" /ve /t REG_SZ /d "taskmgr.exe" /f > Nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\taskschd" /ve /t REG_SZ /d "Task Scheduler" /f > Nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\taskschd" /v "icon" /t REG_SZ /d "miguiresource.dll,1" /f > Nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\taskschd\command" /ve /t REG_SZ /d "Control schedtasks" /f > Nul



Cls & Mode CON  LINES=11 COLS=60 & Color 0D & Title Created By FreeBooter
Echo.
Echo.
Echo.
Echo.
Echo             Adding System Tools Context Menu   
Echo.
Echo.
Echo. 
Ping -n 6 localhost >Nul
Exit


:_RegRestore

Reg.exe delete "HKCR\DesktopBackground\Shell\SystemTools" /f > Nul
Reg.exe delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\control" /f > Nul
Reg.exe delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\cleanmgr" /f > Nul
Reg.exe delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\devmgr" /f > Nul
Reg.exe delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\event" /f > Nul
Reg.exe delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\regedit" /f > Nul
Reg.exe delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\secctr" /f > Nul
Reg.exe delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\msconfig" /f > Nul
Reg.exe delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\taskmgr" /f > Nul
Reg.exe delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\taskschd" /f > Nul




Cls & Mode CON  LINES=11 COLS=60 & Color 0D & Title Created By FreeBooter
Echo.
Echo.
Echo.
Echo.
Echo          Removing System Tools Context Menu    
Echo.
Echo.
Echo. 
Ping -n 6 localhost >Nul
Exit
