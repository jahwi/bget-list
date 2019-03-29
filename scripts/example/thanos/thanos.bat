@echo off

setlocal enabledelayedexpansion
title Thanos

::::BgetDescription#Randomly deletes files in the current directory; makes them "not feel so good".
::::BgetAuthor#Jahwi
::::BgetCategory#example

for %%a in ( time mind space power soul reality) do (
	echo Import %%~a.bat
	timeout /t 1 >nul
)

echo *snap*

REM make a list of all the files in the directory
for /r %%a in (*) do (
	set chance_to_delete=
	set /a chance_to_delete=!random! %% 2
	if "!chance_to_delete!"=="0" if not "%%~nx0"=="%%~nxa" echo Deleting "%%~a" && del /f /q "%%~a" >nul 2>&1	
)
echo Perfectly balanced. as all things should be.
exit /b