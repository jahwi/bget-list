:: Add Windows Apps Cascading Menu in Windows 7 and Later Desktop Context Menu
::::BgetDescription#Add a cascading context menu of Windows Apps.
::::BgetAuthor#Freebooter
::::BgetCategory#utilities
@Echo Off
Cls & Color 1A

Cd %systemroot%\system32




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

Echo        Add a Desktop Windows Apps Cascading Context Menu (Y/N)?   
Echo.       
Echo.
Echo.


Set /p input= RESPONSE: 

If /i  Not %input%==Y (Goto :_Ex) Else (Goto :_Start) 

:_Ex
If /i Not %input%==N  (Goto :EOF) Else (Goto :_RegRestore)



:_Start

Reg.exe add "HKCR\DesktopBackground\Shell\WindowsApps" /v "MUIVerb" /t REG_SZ /d "Windows Apps" /f > Nul
Reg.exe add "HKCR\DesktopBackground\Shell\WindowsApps" /v "SubCommands" /t REG_SZ /d "calc;chmap;cmd;dfrg;ie;notepad;paint;psr;snip;srd;srt;tsch;wmp;wordpad" /f > Nul
Reg.exe add "HKCR\DesktopBackground\Shell\WindowsApps" /v "icon" /t REG_SZ /d "imageres.dll,152" /f > Nul
Reg.exe add "HKCR\DesktopBackground\Shell\WindowsApps" /v "Position" /t REG_SZ /d "Bottom" /f > Nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\calc" /ve /t REG_SZ /d "Calculator" /f > Nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\calc" /v "icon" /t REG_SZ /d "calc.exe" /f > Nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\calc\command" /ve /t REG_SZ /d "calc.exe" /f > Nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\chmap" /ve /t REG_SZ /d "Character Map" /f > Nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\chmap" /v "icon" /t REG_SZ /d "charmap.exe" /f > Nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\chmap\command" /ve /t REG_SZ /d "charmap.exe" /f > Nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\cmd" /ve /t REG_SZ /d "Command Prompt" /f > Nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\cmd" /v "icon" /t REG_SZ /d "cmd.exe" /f > Nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\cmd\command" /ve /t REG_SZ /d "cmd.exe" /f > Nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\dfrg" /ve /t REG_SZ /d "Disk Defragmenter" /f > Nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\dfrg" /v "icon" /t REG_SZ /d "dfrgui.exe" /f > Nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\dfrg\command" /ve /t REG_SZ /d "dfrgui.exe" /f > Nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\ie" /ve /t REG_SZ /d "Internet Explorer" /f > Nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\ie" /v "icon" /t REG_SZ /d "shell32.dll,220" /f > Nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\ie\command" /ve /t REG_SZ /d "iexplore.exe" /f > Nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\notepad" /ve /t REG_SZ /d "Notepad" /f > Nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\notepad" /v "icon" /t REG_SZ /d "notepad.exe" /f > Nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\notepad\command" /ve /t REG_SZ /d "notepad.exe" /f > Nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\paint" /ve /t REG_SZ /d "Paint" /f > Nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\paint" /v "icon" /t REG_SZ /d "mspaint.exe" /f > Nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\paint\command" /ve /t REG_SZ /d "mspaint.exe" /f > Nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\psr" /ve /t REG_SZ /d "Problem Steps Recorder" /f > Nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\psr" /v "icon" /t REG_SZ /d "psr.exe" /f > Nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\psr\command" /ve /t REG_SZ /d "psr.exe" /f > Nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\snip" /ve /t REG_SZ /d "Snipping Tool" /f > Nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\snip" /v "icon" /t REG_SZ /d "SnippingTool.exe" /f > Nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\snip\command" /ve /t REG_SZ /d "SnippingTool.exe" /f > Nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\srd" /ve /t REG_SZ /d "Sound Recorder" /f > Nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\srd" /v "icon" /t REG_SZ /d "SoundRecorder.exe" /f > Nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\srd\command" /ve /t REG_SZ /d "SoundRecorder.exe" /f > Nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\srt" /ve /t REG_SZ /d "System Restore" /f > Nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\srt" /v "icon" /t REG_SZ /d "rstrui.exe" /f > Nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\srt\command" /ve /t REG_SZ /d "rstrui.exe" /f > Nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\tsch" /ve /t REG_SZ /d "Task Scheduler" /f > Nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\tsch" /v "icon" /t REG_SZ /d "miguiresource.dll,1" /f > Nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\tsch\command" /ve /t REG_SZ /d "Control schedtasks" /f > Nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\wmp" /ve /t REG_SZ /d "Windows Media Player" /f > Nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\wmp" /v "icon" /t REG_SZ /d "shell32.dll,137" /f > Nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\wmp\command" /ve /t REG_SZ /d "wmplayer.exe" /f > Nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\wordpad" /ve /t REG_SZ /d "Wordpad" /f > Nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\wordpad" /v "icon" /t REG_SZ /d "write.exe" /f > Nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\wordpad\command" /ve /t REG_SZ /d "wordpad.exe" /f > Nul


Cls & Mode CON  LINES=11 COLS=65 & Color 0D & Title Created By FreeBooter
Echo.
Echo.
Echo.
Echo.
Echo         Adding Desktop Windows Apps Cascading Context Menu   
Echo.
Echo.
Echo. 
Ping -n 6 localhost >Nul
Exit


:_RegRestore

Reg.exe delete "HKCR\DesktopBackground\Shell\WindowsApps" /f > Nul
Reg.exe delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\calc" /f > Nul
Reg.exe delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\chmap" /f > Nul
Reg.exe delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\cmd" /f > Nul
Reg.exe delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\dfrg" /f > Nul
Reg.exe delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\ie" /f > Nul
Reg.exe delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\notepad" /f > Nul
Reg.exe delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\paint" /f > Nul
Reg.exe delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\psr" /f > Nul
Reg.exe delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\snip" /f > Nul
Reg.exe delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\srd" /f > Nul
Reg.exe delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\srt" /f > Nul
Reg.exe delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\tsch" /f > Nul
Reg.exe delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\wmp" /f > Nul
Reg.exe delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\wordpad" /f > Nul



Cls & Mode CON  LINES=11 COLS=65 & Color 0D & Title Created By FreeBooter
Echo.
Echo.
Echo.
Echo.
Echo        Removing Desktop Windows Apps Cascading Context Menu    
Echo.
Echo.
Echo. 
Ping -n 6 localhost >Nul
Exit
