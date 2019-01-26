@echo off & setlocal enableDelayedExpansion & mode 60,60

::::BgetDescription#Algorithmically draws an animated rotating 2D star.[Win10 Only]
::::BgetAuthor#Icarus
::::BgetCategory#graphics
::::Bgettags#shapes;shape
rem these macros are LINE, PLOT, SIN, COS, ABS
call :macros

rem initialize position, size, sides, angle, and rotation.
set /a "x=30", "y=30", "radius=15", "sides=5", "angle=360 / sides", "rotationSpeed=12", "shape=1"

rem infinite loop
	for /l %%# in () do (
	
		set /a "frame+=1", "changeColor=frame %% 3"
		if !changeColor! equ 0 set /a "h+=1", "hue=h %% 256 + 16"
		
		rem calculate osculation
		set /a "radius=20 * !sin(x):x=frame!", "radius=!abs(x):x=radius!"
		rem if osculation has completed once, change angles
		if !radius! equ 0 set /a "shape+=1"
		rem calculate the rotation of the star
		set /a "currentAngle+=rotationSpeed", "T_maxAngle=360 - angle + currentAngle", "p=0"
		for /l %%c in (!currentAngle!,!angle!,!T_maxAngle!) do (
			rem calculate the points of a polygon and grab every other point
			set /a "p+=1", "n=p + 1", "tA=%%c + (angle * shape)"
			set /a "x!p!=radius * !cos(x):x=%%c! + x", "y!p!=radius * !sin(x):x=%%c! + y"
			set /a "i!n!=radius * !cos(x):x=tA!  + x", "j!n!=radius * !sin(x):x=tA!  + y"
			rem draw the star
			for /f "tokens=1,2" %%a in ("!p! !n!") do ( %line% !x%%a! !y%%a! !i%%b! !j%%b! !hue! )
		)
		rem display everything
		<nul set /p "=%esc%[2J!screen!" & set "screen="
	)
rem ----------------------------------------------------------------------------




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
				for /f "tokens=1" %%6 in ("^!ya^!") do (%\n%
					if 0 leq %%x if %%x lss 199 if 0 leq %%~6 if %%~6 lss 199 ^!plot^! %%x %%~6 %%i Û%\n%
				)%\n%
			)%\n%
		) else (%\n%
			set /a "fraction=%%~a - (%%~b >> 1)"%\n%
			for /l %%y in (%%~e,%%~h,%%~f) do (%\n%
				for /f "tokens=1" %%6 in ("^!fraction^!") do if %%~6 geq 0 set /a "xa+=%%~g", "fraction-=%%~b"%\n%
				set /a "fraction+=%%~a"%\n%
				for /f "tokens=1" %%6 in ("^!xa^!") do (%\n%
					if 0 leq %%~6 if %%~6 lss 199 if 0 leq %%y if %%y lss 199 ^!plot^! %%~6 %%y %%i Û%\n%
				)%\n%
			)%\n%
		)%\n%
	)%\n%
)) else set args=

	set "_SIN=a-a*a/1920*a/312500+a*a/1920*a/15625*a/15625*a/2560000-a*a/1875*a/15360*a/15625*a/15625*a/16000*a/44800000"
    set "SIN(x)=(a=(x * 31416 / 180)%%62832, c=(a>>31|1)*a, a-=(((c-47125)>>31)+1)*((a>>31|1)*62832)  +  (-((c-47125)>>31))*( (((c-15709)>>31)+1)*(-(a>>31|1)*31416+2*a)  ), %_SIN%) / 10000"
	set "COS(x)=(a=(15708 - x * 31416 / 180)%%62832, c=(a>>31|1)*a, a-=(((c-47125)>>31)+1)*((a>>31|1)*62832)  +  (-((c-47125)>>31))*( (((c-15709)>>31)+1)*(-(a>>31|1)*31416+2*a)  ), %_SIN%) / 10000"
    set "_SIN="
    set "Abs(x)=(((x)>>31|1)*(x))"

goto :eof