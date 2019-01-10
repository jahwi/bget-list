@Echo Off & Cls

::::BgetDescription#Enable or disable Windows update.
::::BgetAuthor#Freebooter
::::BgetCategory#utilities

REM  --> Check for permissions
Reg query "HKU\S-1-5-19\Environment" > Nul
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
cls

:gotAdmin


Choice /C YS /N /M "Start Windows Update, press (Y) ;  Stop Windows Update, press (S) 
if %Errorlevel% EQU 1 Goto :_Start
if %Errorlevel% EQU 2 Goto :_Stop

:_Start
Sc config wuauserv start= auto > Nul
Sc start wuauserv > Nul




Exit
:_Stop

Sc config wuauserv start= disabled > Nul
Sc stop wuauserv > Nul