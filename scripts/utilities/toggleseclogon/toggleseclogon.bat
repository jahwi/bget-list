@Echo Off
Title Dost-Tech & Color 1A
::::BgetDescription#Enables the Ctrl-Alt-Del secure logon prompt.
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

Cls & Mode CON  LINES=11 COLS=95 & Color 0D & Title Created By FreeBooter
Echo.
Echo.
Echo.
Echo       ��������������������������������������������������������������������������������ͻ
Echo       � Do You Want To Enable The Secure Logon Prompt With Ctrl+Alt+Delete Keys (Y/N)? �  
Echo       ��������������������������������������������������������������������������������ͼ
Echo.
Echo.


Set /p input= RESPONSE: 
If /i  Not %input%==Y (Goto :_Ex) Else (Goto :_Start) 

:_Ex
If /i Not %input%==N  (Goto :EOF) Else (Goto :_RegRestore)



:_Start

Reg Add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "DisableCAD" /t REG_DWORD /d "0" /f

Cls & Mode CON  LINES=11 COLS=70 & Color 0D & Title Created By FreeBooter
Echo.
Echo.
Echo.
Echo       �������������������������������������������������������ͻ
Echo       � Secure Logon Prompt With Ctrl+Alt+Delete Keys Enabled �  
Echo       �������������������������������������������������������ͼ
Echo.
Echo. 
ping -n 8 localhost >nul 
Exit


:_RegRestore

Reg Add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "DisableCAD" /t REG_DWORD /d "1" /f


Cls & Mode CON  LINES=11 COLS=70 & Color 0D & Title Created By FreeBooter
Echo.
Echo.
Echo.
Echo       ��������������������������������������������������������ͻ
Echo       � Secure Logon Prompt With Ctrl+Alt+Delete Keys Disabled �  
Echo       ��������������������������������������������������������ͼ
Echo.
Echo. 
ping -n 8 localhost >nul 
Exit



