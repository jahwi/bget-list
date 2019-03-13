@echo off & setlocal enableDelayedExpansion

::::BgetDescription#Simulate gravity in batch graphics.
::::BgetAuthor#Icarus
::::BgetCategory#library

set /a "gravity=1", "hei=wid=100", "objects=5", "frameRate=9", "distanceSensitivity=3"
for /l %%o in (1,1,%objects%) do set /a "x[%%o]=!random! %% (wid-50) + 10", "y[%%o]=!random! %% 10", "mass[%%o]=!random! %% 3 + 1"

call :init                                                                                                                                 %= initialize math functions and macros for performance and readability reasons =%
for /l %%# in () do ( set /a "frames+=1"                                                                                                   %= Being infinite loop, initialize a frame count =%
	for /l %%a in (1,1,%objects%) do (                                                                                                 %= For all objects =%
		2>nul set /a "%every:n=frameRate%" && (                                                                                    %= EVERY is a macro that does something inside () every FRAMERATE amount of loops =%
			set /a "!gravityY:#=%%a!"                                                                                          %= GRAVITY is a constant formula in motion, objects are always "falling" =%
			set /a "!applyforceX:#=%%a!"                                                                                       %= If any forces are applied to current velocity_X, apply them to X position =% 
			(for /l %%b in (1,1,%objects%) do if %%a neq %%b (                                                                 %= For all objects that are not the same as our current object =%
				set /a "x1=x[%%a]", "x2=x[%%b]", "y1=y[%%a]", "y2=y[%%b]", "dist[%%a][%%b]=%getDistance%"                  %= Calculate the distance between current object, and new object =%
				2>nul set /a "!ifObjectsAreTouching:x=dist[%%a][%%b]!" && (                                                %= If the distance between the two objects is within the distanceSensitivity =%
					if !x[%%a]! lss !x2! (  set /a "velocity_x[%%a]+=1", "velocity_x[%%b]-=1"                          %= Check if the current object is on the left or right by seeing which is larger =%
					) else ( 				set /a "velocity_x[%%a]-=1", "velocity_x[%%b]+=1" )        %= Add or Subtract 1 from current and new objects velocity_X depending on the case =%
					set /a "velocity_x[%%a]*=-1", "velocity_x[%%b]*=-1", "velocity_y[%%a]*=-1", "velocity_y[%%b]*=-1"  %= Invert current and new velocity_X and velocity_Y =%
				)
			))
		)
		2>nul set /a "!HorzEdgeDetection:x=x[%%a]!" && set /a "i[%%a]*=-1", "velocity_x[%%a]*=-1"                                  %= If we hit the sides of the screen, bounce off them =%
		2>nul set /a "!VertEdgeDetection:x=y[%%a]!" && set /a "j[%%a]*=-1", "velocity_y[%%a]*=-1"                                  %= If we hit the top or bottom of the screen, bounce off of those, too =%
		2>nul set /a "1/((~(y[%%a]-hei)>>31)&1)" && set /a "y[%%a]=hei - 3"                                                        %= if current Y is geq than hei of the screen, correct that =%
		set "screen=!screen!%esc%[!y[%%a]!;!x[%%a]!H%esc%[38;5;%%am!ball!"
	)
	rem display everything
	<nul set /p "=%esc%[?25l%esc%[2J!screen!" & set "screen="                                                                          %= Display the entire screen =%
)

:init
mode %wid%,%hei%
for /F %%a in ('echo prompt $E^| cmd') do set "ESC=%%a"
set "getDistance=( @=x2-x1, $=y2-y1, ?=(((@>>31|1)*@-(($>>31|1)*$))>>31)+1, ?*(2*(@>>31|1)*@-($>>31|1)*$-((@>>31|1)*@-($>>31|1)*$)) + ^^^!?*((@>>31|1)*@-($>>31|1)*$-((@>>31|1)*@-($>>31|1)*$*2)) )"
set "ifObjectsAreTouching=1/((~(distanceSensitivity-x)>>31)&1)"
set "if_Too_Many_Objects=1/(((~((objects+1)-x)>>31)&1)&((~(x-(objects+1))>>31)&1))"
set "every=1/(((~(0-(frames%%n))>>31)&1)&((~((frames%%n)-0)>>31)&1))"
set "HorzEdgeDetection=1/((((x-(wid-3))>>31)&1)^(((3-x)>>31)&1))"
set "VertEdgeDetection=1/((((x-(hei-3))>>31)&1)^(((3-x)>>31)&1))"
set "odds=1/((((^!random^!%%100)-x)>>31)&1)"
set "applyforceX=x[#]+=velocity_x[#]"
set "gravityY=acceleration_y[#]+=(gravity * mass[#]), velocity_y[#]+=acceleration_y[#], acceleration_y[#]*=0, y[#]+=velocity_y[#]"
set "ball=Û%ESC%[1B%ESC%[2DÛ Û%ESC%[1B%ESC%[2DÛ"
goto :eof