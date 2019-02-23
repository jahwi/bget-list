@echo off

::::BgetDescription#SImple folder locker using user permissions.
::::BgetAuthor#Jahwi
::::BgetCategory#utilities

if "%~1"=="" (
	echo Simple folder locker.
	echo Usage: %~0 "folder to lock/unlock" lock/unlock
	echo Example: %~0 "Folder1" lock
	exit /b
)
::SIMPLE FOLDER LOCK
if /i not "%~2"=="lock" (
	if /i not "%~2"=="unlock" (
		if /i not "%~2"=="softunlock" (
			echo '%~0' is not recognized as an internal or external command, 
			echo operable program or batch file.
			exit /b
		)
	)
)
goto :%2
:unlock
if exist "%~1/*" (
	takeown /F "%1" /R /D Y
)>nul 2>&1
takeown /F "%~1" >nul 2>&1
cacls "%~1" /e /g everyone:f >nul 2>&1
if "%errorlevel%"=="0" (
	echo %~1 Unlocked.
) else (
echo An error occured.
)
attrib -h -s %~1
exit /b
:lock
attrib +h +s %~1
if exist "%~1/*" (
	takeown /F "%~1" /R /D Y
)>nul 2>&1
takeown /F "%~1" >nul 2>&1
cacls "%~1" /e /p everyone:n >nul 2>&1
if "%errorlevel%"=="0" (
	echo %~1 Locked.
) else (
echo An error occured.
)
exit /b
:softlock
if exist "%~1" (
attrib +h +s "%~1"
takeown /F "%~1" >nul 2>&1
cacls "%~1" /e /p everyone:n >nul 2>&1
if "%errorlevel%"=="0" (
	echo %~1 Locked successfully
) else (
echo An error occured.
)
)
exit /b

:gui
