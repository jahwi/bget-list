::::BgetDescription#Ping sweep the local network.
::::BgetAuthor#b00st3d
::::BgetCategory#utility
@echo off
cd %~dp0
setlocal enabledelayedexpansion
mkdir working 2>nul
del /q working\* 2>nul
del /q online.csv 2>nul
echo CreateObject^("Wscript.Shell"^).Run """" ^& WScript.Arguments^(0^) ^& """", 0, False > %temp%\invisible.vbs
:top
cls
set num=0

REM find out what IP addresses the computer is currently using.  If you have virtual ports or multiple connections then there will be more than 1
for /f "tokens=1,2* delims=:" %%a in ('ipconfig ^| FIND "IPv4 Address"') do (
	set /a num=!num!+1
	set ip=%%b
	set ip=!ip:~1,15!
	
	REM we need to be able to recall this IP using a menu later so keep track of which selection it will be
	set menu!num!=!ip!
)

REM Write a menu of all IP addresses available
echo +=====================
echo +                                  
for /l %%a in (1,1,!num!) do (
echo + %%a - !menu%%a!                  	
)
set /a num=!num!+1
echo + !num! - Other IP address
echo +                                  
echo +=====================
set /p a=please make a selection: 

REM Check if selection is valid.  Note: if the users selects a letter it is equal to 1 and is automatically invalid.
if !a! GTR !num! echo invalid selection&timeout 2 >nul&goto top
set a=!menu%a%!
if "%a%"=="" goto custom

REM convert our menu item back into an IP address
:convert
for /f "tokens=1,2,3,4 delims=." %%a in ('echo %a%') do ( set base=%%a.%%b.%%c. )
set base=%base: =%
:writeScripts
for /l %%a in (1,1,255) do (
	(
		echo @echo off
		echo ping -4 %base%%%a -n 1 ^| FIND "TTL" ^> nul
		echo if NOT %%errorlevel%%==1 ^(
		echo echo %base%%%a ^>^> online.csv ^)
		echo exit
	) >working\%%a.bat
)
for /l %%a in (1,1,255) do (
cls
echo Running please wait.  Do not close this window.
title starting %%a of 255
echo starting %%a of 255
wscript.exe %temp%\invisible.vbs working\%%a.bat
)
del /q %temp%invisible.vbs
rd /s /q working
cls
echo online addresses:
echo.
type online.csv
echo.
pause
exit

:custom
cls
REM this is the same as above but with a given address  No good way to error check this though
set /p a=Please enter a network address you would like to scan ^(eg. 192.168.0.0^): 
choice /m "Is this correct? "
if %errorlevel%==1 goto convert
goto custom