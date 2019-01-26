@echo off
setlocal enabledelayedexpansion

::::BgetDescription#Simple text-to-speech
::::BgetAuthor#Jahwi
::::BgetCategory#utilities
::::Bgettags#voice;aloud;read

:begin
set /p file_to_read=Enter the file to read::
if not exist "!file_to_read!" echo The file does not exist. && pause && exit /b

	cls
	echo [press P to pause, and S to stop]
	choice /c psü /n /t 1 /d ü
	echo [Press your option Now]
	if "!errorlevel!"=="2" cls && goto :begin
	if "!errorlevel!"=="1" (
		choice /c c /n /m "Press [c] to continue" 
	)
	set string=
	call :speech %%a
)

pause
exit /b

:speech
set string=%*
if not defined string exit /b
echo dim speechobject >%temp%\mk.vbs
echo set speechobject=createobject^("sapi.spvoice"^) >>%temp%\mk.vbs
echo speechobject.speak "!string!" >>%temp%\mk.vbs
cscript //B %temp%\mk.vbs
exit /b