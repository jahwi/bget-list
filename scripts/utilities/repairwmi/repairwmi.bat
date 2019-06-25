:: Batch Script Created by FreeBooter

@Echo Off & Cls

::::BgetDescription#Helps repair WMI issues.
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

Sfc /Scannow 

Ping -n 7 localhost > nul

Cls 

Cd %windir%\system32\wbem

For %%i in (*.dll) do RegSvr32 -s %%i

If Exist %windir%\sysWOW64\wbem  (Cd %windir%\sysWOW64\wbem & For %%i in (*.dll) do %windir%\SysWoW64\regsvr32 -s %%i)

Echo        Finish Re-Registring Dll Files

Ping -n 5 localhost > nul

Exit

