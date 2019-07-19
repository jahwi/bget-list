@Echo Off
::::BgetDescription#Enables auto-compelte for file explorer.
::::BgetAuthor#FreeBooter
::::BgetCategory#utilities
Title Dost-Tech & Color 1A

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
Echo       ษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
Echo       บ Do You Want To Enable Auto Completion in File Explorer (Y/N)? บ  
Echo       ศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
Echo.
Echo.


Set /p input= RESPONSE: 
If /i  Not %input%==Y (Goto :_Ex) Else (Goto :_Start) 

:_Ex
If /i Not %input%==N  (Goto :EOF) Else (Goto :_RegRestore)



:_Start

Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\AutoComplete" /v "Append Completion" /t REG_SZ /d "yes" /f > Nul

Cls & Mode CON  LINES=11 COLS=60 & Color 0D & Title Created By FreeBooter
Echo.
Echo.
Echo.
Echo       ษออออออออออออออออออออออออออออออออออออออออออป
Echo       บ Auto Completion in File Explorer Enabled บ  
Echo       ศออออออออออออออออออออออออออออออออออออออออออผ
Echo.
Echo. 
ping -n 6 localhost >nul 


Cd %tmp%
choice /c yn /n /m "Reboot? [Y/N]"
if errorlevel 1 shutdown /r /t 0 /c "Icon Cache Rebuilder scheduled restart."

Exit




:_RegRestore

Reg Query "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\AutoComplete" /v "Append Completion" > Nul

If %ErrorLevel% EQU 1 Goto :EOF

Reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\AutoComplete" /v "Append Completion" /f > Nul


Cls & Mode CON  LINES=11 COLS=60 & Color 0D & Title Created By FreeBooter
Echo.
Echo.
Echo.
Echo       ษอออออออออออออออออออออออออออออออออออออออออออป
Echo       บ Auto Completion in File Explorer Disabled บ  
Echo       ศอออออออออออออออออออออออออออออออออออออออออออผ
Echo.
Echo. 
ping -n 6 localhost >nul 

Cd %tmp%
choice /c yn /n /m "Reboot? [Y/N]"
if errorlevel 1 shutdown /r /t 0 /c "Icon Cache Rebuilder scheduled restart."

Exit