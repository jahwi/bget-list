@Echo Off
Title Dost-Tech & Color 1A
::::BgetDescription#Enables the default admin account.
::::BgetAuthor#FreeBooter
::::BgetCategory#utilities
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

Cls & Mode CON  LINES=11 COLS=80 & Color 0D & Title Created By FreeBooter
Echo.
Echo.
Echo.
Echo       ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
Echo       บ Do You Want To Enable Windows Administrator Account (Y/N)? บ  
Echo       ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
Echo.
Echo.


Set /p input= RESPONSE: 

If /i  Not %input%==Y (Goto :_Ex) Else (Goto :_Start) 

:_Ex
If /i Not %input%==N  (Goto :EOF) Else (Goto :_Disable)



:_Start

Net user administrator /active:yes > Nul

Cls & Mode CON  LINES=11 COLS=60 & Color 0D & Title Created By FreeBooter
Echo.
Echo.
Echo.
Echo       ษอออออออออออออออออออออออออออออออออออออออป
Echo       บ Windows Administrator Account Enabled บ  
Echo       ศอออออออออออออออออออออออออออออออออออออออผ
Echo.
Echo. 

ping -n 6 localhost >Nul 
Exit


:_Disable

Net user administrator /active:no > Nul


Cls & Mode CON  LINES=11 COLS=60 & Color 0D & Title Created By FreeBooter
Echo.
Echo.
Echo.
Echo       ษอออออออออออออออออออออออออออออออออออออออออป
Echo       บ Windows Administrator Account Disabled  บ  
Echo       ศอออออออออออออออออออออออออออออออออออออออออผ
Echo.
Echo. 


ping -n 6 localhost >nul 
Exit

