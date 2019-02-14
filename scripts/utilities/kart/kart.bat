@Echo Off
Cls & Color 1A

Cd %systemroot%\system32

::::BgetDescription#Add "Kill all non-responsive tasks" button to the context menu.
::::BgetAuthor#FreeBooter
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

Cls & Mode CON  LINES=11 COLS=85 & Color 0D & Title Created By FreeBooter
Echo.
Echo.
Echo.

Echo        Add Kill Not Responding Tasks Option to the Desktop Context Menu (Y/N)?   
Echo.       
Echo.
Echo.


Set /p input= RESPONSE: 

If /i  Not %input%==Y (Goto :_Ex) Else (Goto :_Start) 

:_Ex
If /i Not %input%==N  (Goto :EOF) Else (Goto :_RegRestore)



:_Start

Reg.exe add "HKCR\DesktopBackground\Shell\Kill Not Responding Tasks" /ve /t REG_SZ /d "" /f > Nul
Reg.exe add "HKCR\DesktopBackground\Shell\Kill Not Responding Tasks" /v "Icon" /t REG_SZ /d "explorer.exe,9" /f > Nul
Reg.exe add "HKCR\DesktopBackground\Shell\Kill Not Responding Tasks" /v "Position" /t REG_SZ /d "Top" /f > Nul
Reg.exe add "HKCR\DesktopBackground\Shell\Kill Not Responding Tasks\command" /ve /t REG_SZ /d "taskkill /F /FI \"STATUS eq NOT RESPONDING\"" /f > Nul


Cls & Mode CON  LINES=11 COLS=80 & Color 0D & Title Created By FreeBooter
Echo.
Echo.
Echo.
Echo.
Echo        Adding Kill Not Responding Tasks Option to the Context Menu   
Echo.
Echo.
Echo. 
Ping -n 6 localhost >Nul
Exit


:_RegRestore

Reg.exe delete "HKCR\DesktopBackground\Shell\Kill Not Responding Tasks" /f > Nul



Cls & Mode CON  LINES=11 COLS=85 & Color 0D & Title Created By FreeBooter
Echo.
Echo.
Echo.
Echo.
Echo           Removing Kill Not Responding Tasks Option from the Context Menu    
Echo.
Echo.
Echo. 
Ping -n 6 localhost >Nul
Exit
