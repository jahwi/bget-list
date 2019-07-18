@Echo Off
Color 1A

Cd %systemroot%\system32

::::BgetDescription#[WIN 10] Enable/Disable driver updates in Windows 10.
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

Cls & Mode CON  LINES=11 COLS=95 & Color 0D & Title Created By FreeBooter
Echo.
Echo.
Echo.
Echo       ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
Echo       บ Do You Want To Disable Driver Updates From Windows Update in Windows 10 (Y/N)? บ  
Echo       ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
Echo.
Echo.


Set /p input= RESPONSE: 
If /i  Not %input%==Y (Goto :_Ex) Else (Goto :_Start) 

:_Ex
If /i Not %input%==N  (Goto :EOF) Else (Goto :_RegRestore)



:_Start

Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "ExcludeWUDriversInQualityUpdate" /t REG_DWORD /d "1" /f > Nul

Cls & Mode CON  LINES=11 COLS=62 & Color 0D & Title Created By FreeBooter
Echo.
Echo.
Echo.
Echo       ษอออออออออออออออออออออออออออออออออออออออออออออป
Echo       บ Driver Updates From Windows Update Disabled บ  
Echo       ศอออออออออออออออออออออออออออออออออออออออออออออผ
Echo.
Echo. 
ping -n 6 localhost >nul 


choice /c yn /n /m "Reboot? [Y/N]"
if errorlevel 1 shutdown /r /t 0 /c "Driver Update scheduled restart."
Exit




:_RegRestore

Reg Query "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "ExcludeWUDriversInQualityUpdate" > Nul

If %ErrorLevel% EQU 1 Goto :EOF


Reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "ExcludeWUDriversInQualityUpdate" /f > Nul


Cls & Mode CON  LINES=11 COLS=60 & Color 0D & Title Created By FreeBooter
Echo.
Echo.
Echo.
Echo       ษออออออออออออออออออออออออออออออออออออออออออออป
Echo       บ Driver Updates From Windows Update Enabled บ  
Echo       ศออออออออออออออออออออออออออออออออออออออออออออผ
Echo.
Echo. 
ping -n 6 localhost >nul 

Cd %tmp%
choice /c yn /n /m "Reboot? [Y/N]"
if errorlevel 1 shutdown /r /t 0 /c "Driver Update scheduled restart."

Exit



