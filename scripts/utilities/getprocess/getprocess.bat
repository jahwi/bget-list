@echo off

::getprocess v0.1
::by Jahwi in 2019

::::BgetDescription#Get a process' parent or child processes using its PID.
::::BgetAuthor#Jahwi
::::BgetCategory#utilities

setlocal enabledelayedexpansion
if "%~1"=="" call :help && exit /b

if /i "%~1"=="-parent" (
	set /a rand=%random%
	set c=
	for /f %%a in ('wmic process where ProcessId^="%~2" get ParentProcessId') do (
			set /a c+=1
			if /i "!c!"=="2" for /f "delims=" %%b in ('wmic process where ProcessId^="%%~a" get Caption') do (
				set /a z+=1
					if /i "!z!"=="2" echo [%%b %%a] | find /v "Caption"
			)
			
	)
	exit /b
)

if /i "%~1"=="-child" (
	set /a rand=%random%
	for /f "delims=" %%a in ('wmic process where ParentProcessId^="%~2" get Caption^,ProcessId') do (
			set /a c+=1
			if /i not "!c!"=="1"  echo %%a
	)
	exit /b
)
exit /b

:help
echo GetProcess v0.1
echo Made by Jahwi in 2019
echo Find a process' parent or child process using its PID.
echo.
echo Usage: %~nx0 [-parent/-child]  [PID]
exit /b