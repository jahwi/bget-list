@echo off & setlocal enableDelayedExpansion
mode 100,100

::::BgetDescription#graphical zombie shooter feat Bario.[Win10 Only]
::::BgetAuthor#Icarus
::::BgetCategory#game

if "%~1" neq "" goto :%~1

REM INITIALIZE -----------------------------------------------------------------------------
call :macros

set /a "x=10"
set /a "y=53"
set /a "points=0"

set /a "health=maxHealth=100"
set "healthBar=лллллллллллллллллллллллллллллллллллллллллллллллллл"

set /a "ammo=maxAmmo=16"
set /a "reloadDelay=9"
set "reload=false"

set "colorTable1="0;0;0","0;255;0","255;0;0","128;196;0","255;222;173","139;69;19""
set "colorTable2="0;0;0","255;0;0","0;0;255","255;140;64","255;222;173","139;69;19""
set "colorTable3="0;0;0","0;0;255","0;255;0","0;128;196","255;222;173","139;69;19""

set /a "monsterMoveChance=2", "monsterMoveFrame=1", "monsterDamage=4"

for /l %%a in (26,9,80) do (
	set /a "mx%%a=84", "monsterSize%%a=2", "monsterColor%%a=10", "damage%%a=1"
	set /a "cta=!random! %% 3 + 1"
	set "i=0" & for %%c in (!cta!) do for %%b in (!colorTable%%c!) do (set "c!i!_%%a=%%~b" & set /a "i+=1")
)


for %%a in (""
			""
			""
			""
			"                       <----- THIS IS YOUR AMMO   THIS IS YOUR POINTS ----->"
			""
			""
			""
			"  CONTROLS:"
			""
			"   W - MOVE UP"
			""
			"   A - RELOAD"
			""
			"   S - MOVE DOWN"
			""
			"   D - SHOOT"
			""
			""
			""
			""
			""
			""
			"                                  PRESS ANY BUTTON TO START PLAYING"
) do echo=%%~a

%plot%  4 5 0 111 AMMO:--:!ammo!/%maxAmmo%
%plot% 80 5 0 170 POINTS:--:!points!

echo !screen!
<nul set /p "=%ickySprite%"
pause>nul

REM ----------------------------------------------------------------------------------------
if exist "%temp%\%~n0_signal.txt" del "%temp%\%~n0_signal.txt"
"%~F0" Controller WASD >"%temp%\%~n0_signal.txt" | "%~F0" GAME_ENGINE <"%temp%\%~n0_signal.txt"



:GAME_ENGINE
	(	for /l %%# in () do (		set /a "frame+=1", "hue=(x * (y * 100)) %% 255"
	
			rem лser Controller
			set "com=" & set /p "com="
			rem End Game Screen
			if !health! lss 1 (
				%cls%
				%plot% 45 52 0 10 YOURлSCOREл!points!
				%plot% 41 54 0 11 Youлlastedл!frame!лframes
				%plot% 42 56 0 170 Youлusedл!shotsFired!лbullets
				<nul set /p "=!screen!"
				exit 2>nul
			)
			
			rem display ammo in color.. & visually stimulating display lines
			%plot%  4 5 0 111 AMMO:--:!ammo!/%maxAmmo%
			%plot% 80 5 0 170 POINTS:--:!points!
			%plot% 20 20 !healthColor! 0 ^!health^!/^!maxHealth^!
			%plot% 30 20 !healthColor! 0 !healthBar!
			for /l %%a in (26,9,94) do %plot% 0 %%a 27 0 --------------------------------------------------------------------------------------------------
			for /l %%a in (26,3,94) do %plot% 14 %%a 130 0 ^|^|^|^|
			
			rem if you're not reloading, you can move and shoot using WASD, reloading causes intentional brief delay to movement input.
			if /i "!reload!" equ "false" (
					   if /i "!com!" equ "w" ( if !y! gtr 26 ( set /a "y-=9" )
				) else if /i "!com!" equ "s" ( if !y! lss 80 ( set /a "y+=9" )
				) else if /i "!com!" equ "d" ( 
					if !ammo! gtr 0 ( 
						set /a "ammo-=1", "points+=1", "shotsFired+=1", "damagedFrame=frame + 4"
						set "damageID=!damageID!!y! "
						set "damaged!y!=true"
					) else if !ammo! equ 0 (
						set /a "reloadMsg=frame + 20 - 1"
						set "reloadRequired=true"
					)
				) else if /i "!com!" equ "a" (
					set /a "ammo=maxAmmo", "reloadTime=frame + reloadDelay - 1"
					set "reload=true"
				)
			) else if /i "!reload!" equ "true" (
				set /a "reloadTimeFrame=frame %% reloadTime"
				if !reloadTimeFrame! equ 0 ( set "reload=false")
			)
			
			rem Monsters
			for /l %%a in (26,9,80) do (
				if /i "!damaged%%a!" neq "true" (
					set /a "monsterMoveSpeed=!random! %% 2 + 1"
					set /a "m1=frame %% monsterMoveFrame", "m2=!random! %% monsterMoveChance"
					if !m1! equ 0 if !m2! equ 0 set /a "mx%%a-=monsterMoveSpeed"

					rem catch if monster gets to you
					if !mx%%a! leq 18 (
						%length% !healthBar!
						set /a "points-=1", "health-=monsterDamage", "hp=monsterDamage / 2"
						set /a "dmgSpotX=30 + length - 2", "damagedFrame=frame + 4"
						for %%b in (!hp!) do set "healthBar=!healthBar:~0,-%%b!"
						set "damageID=!damageID!%%a "
						set "damaged%%a=true"
					)
				)
				
				if /i "!damaged%%a!" neq "true" (
					set "overlay=!overlay!%zombie%"
				) else (
					%fastCircle% !mx%%a! %%a !monsterSize%%a! !monsterSize%%a! !monsterColor%%a!
				)
			)
			
			rem catch if damaged. Purely for visual
			for %%a in (!damageID!) do (
				if /i "!damaged%%a!" equ "true" (
					set /a "dF%%a=frame %% damagedFrame"
					if !dF%%a! neq 0 (
						%plot% !dmgSpotX! 20 15 0 лл
						set /a "monsterSize%%a+=1", "monsterColor%%a-=1", "monsterMoveSpeed=0"
					) else (
						set "damaged%%a=false"
						set "damageID="
						set /a "monsterSize%%a=2", "monsterColor%%a=10", "mx%%a=84"
					)
				)
			)

			rem catch if ammo is empty
			if /i "!reloadRequired!" equ "true" (
				set /a "aE=frame %% reloadMsg"
				if !aE! neq 0 ( %plot% 50 50 0 9 "RELOAD" ) else ( set "reloadRequired=false")
			)
			
			rem read the health bar
			if !health! geq 75 ( set "healthColor=10"
			) else if !health! lss 75 if !health! gtr 50 ( set "healthColor=11"
			) else if !health! lss 50 if !health! gtr 25 ( set "healthColor=9"
			) else if !health! lss 25 if !health! gtr 1  ( set "healthColor=1" )
			
			rem player
			
			set "screen=!screen!%marioSprite%"

		cls & <nul set /p "=!screen!" & set "screen="
		<nul set /p "=!overlay!" & set "overlay="
		REM <nul set /p "=!esc![2J!screen!" & <nul set /p "=!screen!" & set "screen="
	)	)
exit

	
:Controller
	( for /l %%# in () do ( for /f "tokens=*" %%a in ('choice /c:WASD /n') do ( <nul set /p ".=%%a" ) ) )

:macros
set ^"LF=^

^" Above empty line is required - do not remove
set ^"\n=^^^%LF%%LF%^%LF%%LF%^^"
for /F %%a in ('echo prompt $E^| cmd') do set "ESC=%%a"
<nul set /p "=!esc![?25l"
set "setCursor(x;y)=%ESC%[x;yf"

set "marioSprite=%setCursor(x;y):x;y=^!y^!;2%[s[3C[38;2;255;0;0mллллл[1B[6D[38;2;255;0;0mллллллллл[1B[9D[38;2;139;69;19mллл[38;2;255;222;173mлл[38;2;0;0;0mл[38;2;255;222;173mл[1B[8D[38;2;139;69;19mл[38;2;255;222;173mл[38;2;139;69;19mл[38;2;255;222;173mллл[38;2;0;0;0mл[38;2;255;222;173mлл[1B[9D[38;2;139;69;19mл[38;2;255;222;173mл[38;2;139;69;19mлл[38;2;255;222;173mллл[38;2;0;0;0mл[38;2;255;222;173mллл[0m[1B[11D[38;2;139;69;19mлл[38;2;255;222;173mлллл[38;2;0;0;0mлллл[1B[8D[38;2;255;222;173mллллллл[1B[8D[38;2;255;0;0mлл[38;2;0;0;255mл[38;2;255;0;0mллл[1B[7D[38;2;255;0;0mллл[38;2;0;0;255mл[38;2;255;0;0mлл[38;2;0;0;255mл[38;2;255;0;0mллл[1B[11D[38;2;255;0;0mлллл[38;2;0;0;255mлллл[38;2;255;0;0mлллл[0m[1B[12D[38;2;255;222;173mлл[38;2;255;0;0mл[38;2;0;0;255mл[38;2;255;140;64mл[38;2;0;0;255mлл[38;2;255;140;64mл[38;2;0;0;255mл[38;2;255;0;0mл[38;2;255;222;173mлл[0m[1B[12D[38;2;255;222;173mллл[38;2;0;0;255mлллллл[38;2;255;222;173mллл[0m[1B[12D[38;2;255;222;173mлл[38;2;0;0;255mлллллллл[38;2;255;222;173mлл[0m[1B[10D[38;2;0;0;255mллл[2C[38;2;0;0;255mллл[1B[9D[38;2;139;69;19mллл[4C[38;2;139;69;19mллл[1B[11D[38;2;139;69;19mлллл[4C[38;2;139;69;19mлллл[0m[1B[12D[0m[8[u"
set "ickySprite=%setCursor(x;y):x;y=42;34%[s[22C[38;2;64;64;64mл[1B[1D[38;2;64;64;64mлллл[1B[4D[38;2;64;64;64mллллл[1B[4D[38;2;64;64;64mлллллл[1B[7D[38;2;64;64;64mлллллллл[1B[30D[38;2;64;64;64mлл[13C[38;2;64;64;64mллллллллллллллллл[1B[32D[38;2;64;64;64mллллллллллллллллллллллллллллллллл[1B[33D[38;2;64;64;64mлллллллллллллллллллллллллллллл[38;2;0;204;204mлл[38;2;64;64;64mлл[1B[34D[38;2;64;64;64mллллллллллллллллллллллллллллл[38;2;0;204;204mллл[38;2;64;64;64mлл[1B[32D[38;2;64;64;64mлллллллллллл[38;2;0;204;204mллллл[38;2;64;64;64mлллллллллл[38;2;0;204;204mллл[38;2;64;64;64mллл[0m[1B[30D[38;2;64;64;64mлллллллл[38;2;0;204;204mлллллллл[38;2;64;64;64mллллллл[38;2;0;204;204mлллл[38;2;64;64;64mллл[0m[1B[28D[38;2;64;64;64mлллллл[38;2;0;204;204mлллллллл[38;2;64;64;64mллллллл[38;2;0;204;204mлллл[38;2;64;64;64mллл[0m[1B[27D[38;2;64;64;64mлллллл[38;2;0;204;204mлллллл[38;2;64;64;64mллллллллл[38;2;0;204;204mлл[38;2;64;64;64mллл[1B[24D[38;2;64;64;64mллллл[38;2;0;204;204mлллл[38;2;64;64;64mлллллллллллллл[1B[21D[38;2;64;64;64mлллллллллллллллллллл[1B[15D[38;2;64;64;64mллллллллллллл[8[u"
set "zombie=[%%a;^!mx%%a^!f[s[4C[38;2;^!c1_%%a^!mлллллл[1B[8D[38;2;^!c1_%%a^!mлллллллллл[1B[11D[38;2;^!c1_%%a^!mллл[38;2;^!c4_%%a^!mлл[38;2;^!c1_%%a^!mлллл[38;2;^!c4_%%a^!mлл[38;2;^!c1_%%a^!mл[1B[12D[38;2;^!c1_%%a^!mлл[38;2;^!c4_%%a^!mлллл[38;2;^!c1_%%a^!mлл[38;2;^!c4_%%a^!mлллл[1B[13D[38;2;^!c1_%%a^!mллл[38;2;^!c4_%%a^!mлл[38;2;^!c0_%%a^!mлл[38;2;^!c1_%%a^!mлл[38;2;^!c4_%%a^!mлл[38;2;^!c0_%%a^!mлл[1B[13D[38;2;^!c1_%%a^!mллл[38;2;^!c4_%%a^!mлл[38;2;^!c0_%%a^!mлл[38;2;^!c1_%%a^!mлл[38;2;^!c4_%%a^!mлл[38;2;^!c0_%%a^!mлл[1B[13D[38;2;^!c1_%%a^!mлллл[38;2;^!c4_%%a^!mлл[38;2;^!c1_%%a^!mлллл[38;2;^!c4_%%a^!mлл[38;2;^!c1_%%a^!mлл[0m[1B[14D[38;2;^!c1_%%a^!mлллллллллллллл[0m[1B[14D[38;2;^!c1_%%a^!mлллллллллллллл[0m[1B[14D[38;2;^!c1_%%a^!mлллллллллллллл[0m[1B[14D[38;2;^!c1_%%a^!mлллллллллллллл[0m[1B[14D[38;2;^!c1_%%a^!mлл[1C[38;2;^!c1_%%a^!mллл[2C[38;2;^!c1_%%a^!mллл[1C[38;2;^!c1_%%a^!mлл[0m[1B[14D[38;2;^!c1_%%a^!mл[3C[38;2;^!c1_%%a^!mлл[2C[38;2;^!c1_%%a^!mлл[3C[38;2;^!c1_%%a^!mл[0m[8[u"


rem %plot% x y 0-255 0-255 CHAR
set plot=for %%# in (1 2) do if %%#==2 ( for /f "tokens=1-5" %%1 in ("^!args^!") do (%\n%
  set "screen=^!screen^!!esc![%%2;%%1H!esc![38;5;%%3m!esc![48;5;%%4m%%~5!esc![0m"%\n%
)) else set args=

set length=for %%# in (1 2) do if %%#==2 ( for /f "tokens=1-2" %%1 in ("^!args^!") do (%\n%
	set "str=X%%~1"%\n%
	set length=0%\n%
	for /L %%a in (8,-1,0) do (%\n%
		set /a "length|=1<<%%a"%\n%
		for /f "tokens=1" %%b in ("^!length^!") do if "^!str:~%%b,1^!" equ "" set /a "length&=~1<<%%a"%\n%
	)%\n%
)) else set args=

set fastCircle=for %%# in (1 2) do if %%#==2 ( for /f "tokens=1-7" %%1 in ("^!args^! sin^(x^) cos^(x^)") do (%\n%
	for /l %%a in (0,30,360) do (%\n%
		set /a "xa=%%~3 * ^!%%~6:x=%%a^! + %%~1"%\n%
		set /a "ya=%%~4 * ^!%%~7:x=%%a^! + %%~2"%\n%
		for /f "tokens=1,2" %%x in ("^!xa^! ^!ya^!") do ^!plot^! %%x %%y %%~5 0 л%\n%
	)%\n%
)) else set args=

	set /a "PI=(35500000/113+5)/10, PI_div_2=(35500000/113/2+5)/10, PIx2=2*PI, PI32=PI+PI_div_2"
    set "_SIN=a-a*a/1920*a/312500+a*a/1920*a/15625*a/15625*a/2560000-a*a/1875*a/15360*a/15625*a/15625*a/16000*a/44800000"
    set "SIN(x)=(a=(x * 31416 / 180)%%62832, c=(a>>31|1)*a, a-=(((c-47125)>>31)+1)*((a>>31|1)*62832)  +  (-((c-47125)>>31))*( (((c-15709)>>31)+1)*(-(a>>31|1)*31416+2*a)  ), %_SIN%) / 10000"
    set "COS(x)=(a=(15708 - x * 31416 / 180)%%62832, c=(a>>31|1)*a, a-=(((c-47125)>>31)+1)*((a>>31|1)*62832)  +  (-((c-47125)>>31))*( (((c-15709)>>31)+1)*(-(a>>31|1)*31416+2*a)  ), %_SIN%) / 10000"
    set "_SIN="
    set "Sqrt(N)=( x=(N)/(11*1024)+40, x=((N)/x+x)/2, x=((N)/x+x)/2, x=((N)/x+x)/2, x=((N)/x+x)/2, x=((N)/x+x)/2 )"
    set "Sign(n)=(n>>31)|((-n>>31)&1)"
    set "Abs(x)=(((x)>>31|1)*(x))"
	REM  Max1(x)=  if (x geq y)  then x    else y
	set "Max(x)=( ?=((x-y)>>31)+1, ?*x + ^^^!?*y )"
	set "Max=( ?=(((((t1)>>31|1)*(t1))-(((t2)>>31|1)*(t2)))>>31)+1, ?*(2*(((t1)>>31|1)*(t1))-(((t2)>>31|1)*(t2))-((((t1)>>31|1)*(t1))-(((t2)>>31|1)*(t2)))) + ^^^!?*((((t1)>>31|1)*(t1))-(((t2)>>31|1)*(t2))-((((t1)>>31|1)*(t1))-(((t2)>>31|1)*(t2))*2)) )"
	set "getDistance(x2,x1,y2,y1)=( @=x2-x1, $=y2-y1, ?=(((@>>31|1)*@-(($>>31|1)*$))>>31)+1, ?*(2*(@>>31|1)*@-($>>31|1)*$-((@>>31|1)*@-($>>31|1)*$)) + ^^^!?*((@>>31|1)*@-($>>31|1)*$-((@>>31|1)*@-($>>31|1)*$*2)) )"
    set "swap(x,y)=t=x, x=y, y=t"
goto :eof