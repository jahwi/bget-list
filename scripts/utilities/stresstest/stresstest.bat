::::BgetDescription#CPU Stress Tester.
::::BgetAuthor#b00st3d
::::BgetCategory#Utilities
@echo off
title Computer Stress Test
Color E
if "%1"=="clean" goto cleanup
REM Location for the working directory that everything will be written to.  This will be deleted when you cleanly exit the script.
set working=%temp%\stresser
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::DON'T CHANGE ANYTHING BELOW THIS LINE:::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


::::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::
::::::::::: Computer Stress Tester :::::::::::
:::::::::::  Written by: b00st3d   :::::::::::
::::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::
cls
echo PLEASE ONLY USE THE MENU OPTION TO EXIT THIS SCRIPT.
echo.  
echo To manually kill the processes, 
echo look for cmd.exe in the task manger and kill it.
echo You could also just relaunch this script and select option 2.  
echo This will kill all proccess and delete any temp files that were created.
echo.
pause
cls
echo.
echo ++++++++++++++++++++++++++++++++++++++++++++++++++
echo +                                                +
echo + This will put a large load on your             +
echo + computer.  Please close unneccessary           +
echo + applications before starting.                  +
echo +                                                +
echo + Press 1 to Start                               +
echo + Press 2 to Kill any running stresser           +
echo + press 3 to Exit                                +
echo +                                                +
echo ++++++++++++++++++++++++++++++++++++++++++++++++++
echo.
choice /c 123 /N /M "Please make a selection: "
if %errorlevel% == 2 goto cleanup
if %errorlevel% == 3 exit
cls
echo.
echo ++++++++++++++++++++++++++++++++++++++++++++++++++
echo +                                                +
echo + How many instances would you you like to run?  +
echo +                                                +
echo + Press 1 for 20 (Fast)                          +
echo + Press 2 for 50 (Medium)                        +
echo + Press 3 for 100 (Slow)                         +
echo +                                                +
echo ++++++++++++++++++++++++++++++++++++++++++++++++++
echo.
choice /c 123 /N /M "Please make a selection: "
if %errorlevel% == 1 set instances=20&set percent=5
if %errorlevel% == 2 set instances=50&set percent=2
if %errorlevel% == 3 set instances=100&set percent=1
echo.
echo launching stresser
echo please be patient this could take a while depending on your computer and number of instances selected.
set /a counter = 0
set /a loading = 0

REM BUILD DIRECTORY
if exist "%working%\time.bat" (
rd /s /q "%working%\"
)
timeout 1 > nul
mkdir "%working%"
cd "%working%"

REM BUILD FILES
echo CreateObject^("Wscript.shell"^).Run """" ^& WScript.Arguments^(0^) ^& """", 0, False > invisible.vbs

echo ^@echo off > time.bat
echo :start >> time.bat
echo cls >> time.bat
echo set /a current=%%time:~-3,3%% >> time.bat
echo goto start >> time.bat

REM THIS IS THE ACTUAL LAUNCH LOOP.  
:while
	if %counter% leq %instances% (
wscript.exe "invisible.vbs" "time.bat"
cls
set /a loading = %loading% + %percent%
echo Launching stresser: %loading%%% complete
set /a counter=%counter% + 1
goto while
)
REM END LOOP

cls
echo Stresser is running
timeout 2 > nul
cls
echo.
echo ++++++++++++++++++++++++++++++++++++++++
echo +                                      +
echo +    Press 1 to end stress testing     +
echo +                                      +
echo ++++++++++++++++++++++++++++++++++++++++
echo.
choice /N /C 1 /M ^>
echo.
echo killing all processes
start "" "%~f0" clean
exit
:cleanup
if exist "%working%\time.bat" (
rd /s /q "%working%\"
)
taskkill /im cmd.exe