@Echo Off
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

Cls & Mode CON  LINES=11 COLS=90 & Color 0D & Title Created By FreeBooter
Echo.
Echo.
Echo.
Echo       ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
Echo       º Do You Want To Add the Control Panel to Windows File Explorer (Y/N)? º  
Echo       ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
Echo.
Echo.


Set /p input= RESPONSE: 

If /i  Not %input%==Y (Goto :_Ex) Else (Goto :_Start) 

:_Ex
If /i Not %input%==N  (Goto :EOF) Else (Goto :_RegRestore)



:_Start

Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{26EE0668-A00A-44D7-9371-BEB064C98683}" /f  > NUL

Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{21EC2020-3AEA-1069-A2DD-08002B30309D}" /f  > NUL

Cls & Mode CON  LINES=11 COLS=65 & Color 0D & Title Created By FreeBooter
Echo.
Echo.
Echo.
Echo       ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
Echo       º  Control Panel Added to Windows File Explorer º  
Echo       ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
Echo.
Echo. 

Taskkill /im Explorer.exe /f >Nul

Start Explorer.exe

ping -n 6 localhost >Nul 
Exit


:_RegRestore


Reg.exe delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{26EE0668-A00A-44D7-9371-BEB064C98683}" /f > Nul
Reg.exe delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{21EC2020-3AEA-1069-A2DD-08002B30309D}" /f > Nul


Cls & Mode CON  LINES=11 COLS=65 & Color 0D & Title Created By FreeBooter
Echo.
Echo.
Echo.
Echo       ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
Echo       º Control Panel Removed From Windows File Explorer  º  
Echo       ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
Echo.
Echo. 

Taskkill /im Explorer.exe /f >Nul

Start Explorer.exe

ping -n 6 localhost >nul 
Exit
