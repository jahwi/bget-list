@Echo Off & Color 1A
::::BgetDescription#Enable remote desktop connections.
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
Echo       ษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
Echo       บ Do You Want To Disable Remote Desktop Connection (Y/N)? บ  
Echo       ศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
Echo.
Echo.


Set /p input= RESPONSE: 
If /i  Not %input%==Y (Goto :_Ex) Else (Goto :_Start) 

:_Ex
If /i Not %input%==N  (Goto :EOF) Else (Goto :_RegRestore)



:_Start

Reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 1 /f >Nul

reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fAllowToGetHelp /t REG_DWORD /d 0 /f > Nul

Cls & Mode CON  LINES=11 COLS=55 & Color 0D & Title Created By FreeBooter
Echo.
Echo.
Echo.
Echo       ษอออออออออออออออออออออออออออออออออออออป
Echo       บ Remote Desktop Connection Disabled  บ  
Echo       ศอออออออออออออออออออออออออออออออออออออผ
Echo.
Echo. 
ping -n 6 localhost >nul 


Exit




:_RegRestore



Reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f >Nul

reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fAllowToGetHelp /t REG_DWORD /d 1 /f > Nul

ping -n 6 localhost >nul




Cls & Mode CON  LINES=11 COLS=55 & Color 0D & Title Created By FreeBooter
Echo.
Echo.
Echo.
Echo       ษอออออออออออออออออออออออออออออออออออป
Echo       บ Remote Desktop Connection Enabled บ  
Echo       ศอออออออออออออออออออออออออออออออออออผ
Echo.
Echo. 
ping -n 6 localhost >nul 

Exit

