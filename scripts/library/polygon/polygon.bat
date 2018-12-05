@echo off & setlocal enableDelayedExpansion
call :macros

::::BgetDescription#Polydon-drawing function.
::::BgetAuthor#Icarus
::::BgetCategory#library

rem triangle
call :poly 10 10 3 5 10 270

rem square
call :poly 20 10 4 5 10 45

rem polygon
call :poly 40 20 5 15 10 270

rem hexagon
call :poly 80 20 6 15 10 270

rem octogon
call :poly 30 60 8 25 10 270


<nul set /p "=!screen!" & set "screen="

pause >nul & exit

:poly
	set /a "angle=360 / %~3", "tri=0", "s=0 + %~6", "e=360 + %~6" 
	for /l %%c in (!s!,!angle!,!e!) do ( set /a "tri+=1"
		set /a "x[!tri!]=%~4 * !cos(x):x=%%c! + %~1", "y[!tri!]=%~4 * !sin(x):x=%%c! + %~2"
	)
	for /l %%c in (1,1,%~3) do ( set /a "d=%%c + 1"
		for %%b in (!d!) do (
			if %%b gtr %~3 ( %line% !x[%%c]! !y[%%c]! !x[1]! !y[1]! %~5
			) else ( %line% !x[%%c]! !y[%%c]! !x[%%b]! !y[%%b]! %~5 )
		)
	)
goto :eof















:macros
set ^"LF=^

^" Above empty line is required - do not remove
set ^"\n=^^^%LF%%LF%^%LF%%LF%^^"
for /F %%a in ('echo prompt $E^| cmd') do set "ESC=%%a"
<nul set /p "=!esc![?25l"

rem %plot% x y 0-255 CHAR
set plot=for %%# in (1 2) do if %%#==2 ( for /f "tokens=1-4" %%1 in ("^!args^!") do (%\n%
  set "screen=^!screen^!!esc![%%2;%%1H!esc![38;5;%%3m%%~4!esc![0m"%\n%
)) else set args=

rem line x1 y1 x2 y2 color
set line=for %%# in (1 2) do if %%#==2 ( for /f "tokens=1-5" %%1 in ("^!args^!") do (%\n%
	if "%%~5" equ "" ( set "hue=30" ) else ( set "hue=%%~5")%\n%
	set /a "xa=%%~1", "ya=%%~2", "xb=%%~3", "yb=%%~4", "dx=%%~3 - %%~1", "dy=%%~4 - %%~2"%\n%
	for /f "tokens=1-2" %%6 in ("^!dx^! ^!dy^!") do (%\n%
		if %%~7 lss 0 ( set /a "dy=-%%~7", "stepy=-1" ) else ( set "stepy=1" )%\n%
		if %%~6 lss 0 ( set /a "dx=-%%~6", "stepx=-1" ) else ( set "stepx=1" )%\n%
		set /a "dx<<=1", "dy<<=1"%\n%
	)%\n%
	for /f "tokens=1-9" %%a in ("^!dx^! ^!dy^! ^!xa^! ^!xb^! ^!ya^! ^!yb^! ^!stepx^! ^!stepy^! ^!hue^!") do (%\n%
		if %%~a gtr %%~b (%\n%
			set /a "fraction=%%~b - (%%~a >> 1)"%\n%
			for /l %%x in (%%~c,%%~g,%%~d) do (%\n%
				for /f "tokens=1" %%6 in ("^!fraction^!") do if %%~6 geq 0 set /a "ya+=%%~h", "fraction-=%%~a"%\n%
				set /a "fraction+=%%~b"%\n%
				for /f "tokens=1" %%6 in ("^!ya^!") do ^!plot^! %%x %%~6 %%i Û%\n%
			)%\n%
		) else (%\n%
			set /a "fraction=%%~a - (%%~b >> 1)"%\n%
			for /l %%y in (%%~e,%%~h,%%~f) do (%\n%
				for /f "tokens=1" %%6 in ("^!fraction^!") do if %%~6 geq 0 set /a "xa+=%%~g", "fraction-=%%~b"%\n%
				set /a "fraction+=%%~a"%\n%
				for /f "tokens=1" %%6 in ("^!xa^!") do ^!plot^! %%~6 %%y %%i Û%\n%
			)%\n%
		)%\n%
	)%\n%
)) else set args=

    set "_SIN=a-a*a/1920*a/312500+a*a/1920*a/15625*a/15625*a/2560000-a*a/1875*a/15360*a/15625*a/15625*a/16000*a/44800000"
    set "SIN(x)=(a=(x * 31416 / 180)%%62832, c=(a>>31|1)*a, a-=(((c-47125)>>31)+1)*((a>>31|1)*62832)  +  (-((c-47125)>>31))*( (((c-15709)>>31)+1)*(-(a>>31|1)*31416+2*a)  ), %_SIN%) / 10000"
	set "COS(x)=(a=(15708 - x * 31416 / 180)%%62832, c=(a>>31|1)*a, a-=(((c-47125)>>31)+1)*((a>>31|1)*62832)  +  (-((c-47125)>>31))*( (((c-15709)>>31)+1)*(-(a>>31|1)*31416+2*a)  ), %_SIN%) / 10000"
    set "_SIN="
goto :eof