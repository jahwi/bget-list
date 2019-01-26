@echo off & setlocal enableDelayedExpansion
::::BgetDescription#Algorithmically draws and animates a fidget spinner.[Win10 Only]
::::BgetAuthor#Icarus
::::BgetCategory#graphics

REM INITIALIZE -----------------------------------------------------------------------------
call :macros

	rem initialize SCREEN 0
	set /a "hei=wid=90", "heixwid=hei*wid"
	mode con: cols=%wid% lines=%hei%
	for /l %%a in (0,1,%heixwid%) do set "updateScreen0=!updateScreen0! "
	set "screen0=%updateScreen0%"
	
:: define x and y
set /a "x=!random! %% 90 + 1", "y=!random! %% 90 + 1"
REM ----------------------------------------------------------------------------------------


rem infinite loop---------------------------------------------------------------------------
	for /l %%# in () do (		
		
		rem calculate frame, xyFrame, and hue
		set /a "frame+=1", "xyFrame+=5", "hue=(frame %% 256) + 16"
	
		rem calculate path of fidget spinner
		set /a "x=20 * !cos(x):x=xyFrame! + 45", "y=20 * !sin(x):x=xyFrame! + 45"
		
		rem calculate position of each ball around CENTER ball
		set /a "fr000+=20", "fr120=fr000 + 90", "fr240=fr120 + 90", "fr360=fr240 + 90"
		set /a "rx0=8 * !cos(x):x=fr000! + x", "ry0=8 * !sin(x):x=fr000! + y"
		set /a "rx1=8 * !cos(x):x=fr120! + x", "ry1=8 * !sin(x):x=fr120! + y"
		set /a "rx2=8 * !cos(x):x=fr240! + x", "ry2=8 * !sin(x):x=fr240! + y"
		set /a "rx3=8 * !cos(x):x=fr360! + x", "ry3=8 * !sin(x):x=fr360! + y"
		
		rem draw our circle on SCREEN 0
		for /l %%a in (0,1,3) do (
			rem cc = circle color - give each ball a color 16-256
			set /a "cc=(%%a + 1) * ((%%a + 2) * (%%a + 1)) %% 256 + 16"
			rem ultilize Line 26-31 to position/draw each ball
			%fastCircle% !rx%%a! !ry%%a! 3 3 !cc! 0
		)

		rem draw our sprite on SCREEN 1
		%fastCircle% !x! !y! 2 2 !hue! 1
		
		rem display everything using VT100 2J sequence to clear the screen first.
		<nul set /p "=%ESC%[2J!screen0!"
		<nul set /p "=%ESC%[0;0H!screen1!%ESC%[0m"
		
		rem update both screens
		set "screen0="
		set "screen1="

	)
rem end infinite loop ------ (but there is no end, it's infinite.) --------------------------
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	


:macros
set ^"LF=^

^" Above empty line is required - do not remove
set ^"\n=^^^%LF%%LF%^%LF%%LF%^^"
for /F %%a in ('echo prompt $E^| cmd') do set "ESC=%%a"
<nul set /p "=!esc![?25l"

cls

rem %plot% x y 0-255 0-255 CHAR
set plot=for %%# in (1 2) do if %%#==2 ( for /f "tokens=1-6" %%1 in ("^!args^!") do (%\n%
  set "screen%%6=^!screen%%6^!!esc![%%2;%%1H!esc![38;5;%%3m!esc![48;5;%%4m%%~5!esc![0m"%\n%
)) else set args=

rem %fastCircle% x y ch cw color screenID
set fastCircle=for %%# in (1 2) do if %%#==2 ( for /f "tokens=1-8" %%1 in ("^!args^! sin^(x^) cos^(x^)") do (%\n%
	for /l %%a in (0,30,360) do (%\n%
		set /a "xa=%%~3 * ^!%%~7:x=%%a^! + %%~1"%\n%
		set /a "ya=%%~4 * ^!%%~8:x=%%a^! + %%~2"%\n%
		for /f "tokens=1,2" %%x in ("^!xa^! ^!ya^!") do ^!plot^! %%x %%y %%~5 0 Û %%6%\n%
	)%\n%
)) else set args=

	set /a "PI=(35500000/113+5)/10, PI_div_2=(35500000/113/2+5)/10, PIx2=2*PI, PI32=PI+PI_div_2"
    set "_SIN=a-a*a/1920*a/312500+a*a/1920*a/15625*a/15625*a/2560000-a*a/1875*a/15360*a/15625*a/15625*a/16000*a/44800000"
    set "SIN(x)=(a=(x * 31416 / 180)%%62832, c=(a>>31|1)*a, a-=(((c-47125)>>31)+1)*((a>>31|1)*62832)  +  (-((c-47125)>>31))*( (((c-15709)>>31)+1)*(-(a>>31|1)*31416+2*a)  ), %_SIN%) / 10000"
    set "COS(x)=(a=(15708 - x * 31416 / 180)%%62832, c=(a>>31|1)*a, a-=(((c-47125)>>31)+1)*((a>>31|1)*62832)  +  (-((c-47125)>>31))*( (((c-15709)>>31)+1)*(-(a>>31|1)*31416+2*a)  ), %_SIN%) / 10000"
    set "_SIN="
goto :eof