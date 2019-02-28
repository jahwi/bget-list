@Echo Off
Cls & Color 1A

Cd %systemroot%\system32
::::BgetDescription#Add 'Pin to start menu' to the context menu.
::::BgetAuthor#FreBooter
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

Cls & Mode CON  LINES=11 COLS=70 & Color 0D & Title Created By FreeBooter
Echo.
Echo.
Echo.

Echo          Add "Pin to Start" context menu option (Y/N)?   
Echo.       
Echo.
Echo.


Set /p input= RESPONSE: 

If /i  Not %input%==Y (Goto :_Ex) Else (Goto :_Start) 

:_Ex
If /i Not %input%==N  (Goto :EOF) Else (Goto :_RegRestore)



:_Start

Reg.exe add "HKCR\*\shellex\ContextMenuHandlers\PintoStartScreen" /ve /t REG_SZ /d "{470C0EBD-5D73-4d58-9CED-E91E22E23282}" /f  > Nul


Cls & Mode CON  LINES=11 COLS=70 & Color 0D & Title Created By FreeBooter
Echo.
Echo.
Echo.
Echo.
Echo           Enabling "Pin to Start" context menu option   
Echo.
Echo.
Echo. 
Ping -n 6 localhost >Nul
Exit


:_RegRestore

Reg.exe delete "HKCR\*\shellex\ContextMenuHandlers\PintoStartScreen" /f > Nul


Cls & Mode CON  LINES=11 COLS=70 & Color 0D & Title Created By FreeBooter
Echo.
Echo.
Echo.
Echo.
Echo           Removing "Pin to Start" context menu option    
Echo.
Echo.
Echo. 
Ping -n 6 localhost >Nul
Exit
