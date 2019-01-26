@echo off
::::BgetDescription#Monitors a file and outputs changed lines to the console.
::::BgetAuthor#Jahwi
::::BgetCategory#tools
::::Bgettags#compare;file compare;compare file;compare files
setlocal enabledelayedexpansion

::check for user errors
if "%~1"=="" (
	set msg=Error: No switch supplied.
	call :help
	exit /b
)
if "%~1"=="/?" (
	call :help
	exit /b
)
if not exist "%~1" (
	set msg=Error: "%~1" does not exist.
	call :help
	exit /b
)
if "%~n1"=="" (
	set msg=Invalid input.
	call :help
	exit /b
)
if not "%~2"=="" (
	set msg=Invalid input.
	call :help
	exit /b
)

::init dirs
if not exist "%temp%\rtfc\" md "%temp%\rtfc\"
if not exist temp md temp
set tmpf=

::copy and compare to saved copy.
copy /y "%~1" "%temp%\rtfc\%~nx1_backup.txt">nul 2>&1
title Monitoring "%~1"
:loop
findstr /N /V /I /B /E /G:"%temp%\rtfc\%~nx1_backup.txt" <"%~1">>temp\diff.txt
type temp\diff.txt

timeout /t 2 >nul
del /f /q temp\diff.txt
cls
goto :loop
exit /b

:help
	echo  ------------------------------------------------------------
	echo rtfc- Realtime file compare utility.
	echo Monitors a file and outputs changed lines to the console.
	echo by Jahwi
	echo Usage: %~nx0 [file to monitor]
	echo  ------------------------------------------------------------
	if defined msg echo !msg!
	set msg=
	exit /b