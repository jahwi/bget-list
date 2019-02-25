@echo off & setlocal enableDelayedExpansion

::::BgetDescription#Macro emulating Turtle Graphics and Logo programming.
::::BgetAuthor#Icarus
::::BgetCategory#library

call :turtleGraphics

set /a "%push%"
for /l %%a in (0,1,10) do %forward% 1
set /a "%pop%"
set /a "turtleX-=6", "turtleY+=6"
%turnLeft% 90
for /l %%a in (0,1,10) do %forward% 1

echo %screen%




pause >nul& exit
:turtleGraphics
mode 100,100
set /a "turtleX=50", "turtleY=50", "turtleAngle=90"

set ^"LF=^

^" Above empty line is required - do not remove
set ^"\n=^^^%LF%%LF%^%LF%%LF%^^"
for /F %%a in ('echo prompt $E^| cmd') do set "ESC=%%a"
<nul set /p "=%esc%[?25l"

set "push=savedX=turtleX, savedY=turtleY, savedA=turtleAngle"
set "pop=turtleX=savedX, turtleY=savedY, turtleAngle=savedA"

set plot=for %%# in (1 2) do if %%#==2 ( for /f "tokens=1-4" %%1 in ("^!args^!") do (%\n%
	set "screen=^!screen^!!esc![%%2;%%1H!esc![38;5;%%3m%%~4!esc![0m"%\n%
)) else set args=

rem forward distance
set forward=for %%# in (1 2) do if %%#==2 ( for /f "tokens=1" %%1 in ("^!args^!") do (%\n%
	set /a "turtleX+=(%%~1 + 1) * ^!cos(x):x=turtleAngle^!", "turtleY+=(%%~1 + 1) * ^!sin(x):x=turtleAngle^!"%\n%
	^!plot^! ^^!turtleX^^! ^^!turtleY^^! 255 Û%\n%
)) else set args=

rem backward distance
set backward=for %%# in (1 2) do if %%#==2 ( for /f "tokens=1" %%1 in ("^!args^!") do (%\n%
	set /a "turtleX+=(%%~1 + 1) * ^!sin(x):x=turtleAngle^!", "turtleY+=(%%~1 + 1) * ^!cos(x):x=turtleAngle^!"%\n%
	for /f "tokens=1,2" %%a in ("^!turtleX^! ^!turtleY^!") do ^!plot^! %%a %%b 255 Û%\n%
)) else set args=

rem turnLeft DEGREES(0-360)
set turnLeft=for %%# in (1 2) do if %%#==2 ( for /f "tokens=1" %%1 in ("^!args^!") do (%\n%
	set /a "turtleAngle-=(%%~1)"%\n%
)) else set args=

rem turnRight DEGREES(0-360)
set turnRight=for %%# in (1 2) do if %%#==2 ( for /f "tokens=1" %%1 in ("^!args^!") do (%\n%
	set /a "turtleAngle+=(%%~1)"%\n%
)) else set args=

rem math functions
	set "_SIN=a-a*a/1920*a/312500+a*a/1920*a/15625*a/15625*a/2560000-a*a/1875*a/15360*a/15625*a/15625*a/16000*a/44800000"
    set "SIN(x)=(a=(x * 31416 / 180)%%62832, c=(a>>31|1)*a, a-=(((c-47125)>>31)+1)*((a>>31|1)*62832)  +  (-((c-47125)>>31))*( (((c-15709)>>31)+1)*(-(a>>31|1)*31416+2*a)  ), %_SIN%) / 10000"
	set "COS(x)=(a=(15708 - x * 31416 / 180)%%62832, c=(a>>31|1)*a, a-=(((c-47125)>>31)+1)*((a>>31|1)*62832)  +  (-((c-47125)>>31))*( (((c-15709)>>31)+1)*(-(a>>31|1)*31416+2*a)  ), %_SIN%) / 10000"
    set "_SIN="
goto :eof


:turtleScreen cls          -- Shows the turtle Screen --
	if "%~1" equ "" (
		<nul set /p "=!screen!" & set "screen="
	) else if "%~1" equ "cls" (
		<nul set /p "=%esc%[2J!screen!" & set "screen="
	)
goto :eof

REM n - number of pixels
REM h - how many times
:forward n h     -- DRAW --
	if "%~2" equ "" ( set "forTimes=1" ) else ( set /a "forTimes=%~2")
	for /l %%a in (1,1,!forTimes!) do (
		set /a "turtleX+=(%~1 + 1) * !cos(x):x=turtleAngle!", "turtleY+=(%~1 + 1) * !sin(x):x=turtleAngle!"
		%plot% !turtleX! !turtleY! 255 Û
	)
goto :eof

REM n - number of pixels
REM h - how many times
:forward_ND n h   -- NO DRAW --
	if "%~2" equ "" ( set "forTimes=1" ) else ( set /a "forTimes=%~2")
	for /l %%a in (1,1,!forTimes!) do (
		set /a "turtleX+=(%~1 + 1) * !cos(x):x=turtleAngle!", "turtleY+=(%~1 + 1) * !sin(x):x=turtleAngle!"
	)
goto :eof


:turnLeft DEGREES
	set /a "turtleAngle-=(%~1)"
goto :eof


rem rotate right
:turnRight DEGREES
	set /a "turtleAngle+=(%~1)"
goto :eof