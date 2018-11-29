::::BgetDescription#Clear stuck print jobs.
::::BgetAuthor#b00st3d
::::BgetCategory#utility
@echo off
NET FILE 1>NUL 2>NUL
if %errorlevel% == 0 goto elevated

REM build vbs to invoke UAC 
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute %0, "", "", "runas", 1 >> "%temp%\getadmin.vbs"
   
ECHO **************************************
ECHO Invoking UAC for Privilege Escalation 
ECHO **************************************

"%temp%\getadmin.vbs" >nul
exit /B

:elevated
    del "%temp%\getadmin.vbs" 2>nul     
    CD "%~dp0"

net stop spooler
echo.
del %systemroot%\system32\spool\printers\* /Q/F/S 1>nul 2>nul
echo old jobs deleted
echo.
net start spooler