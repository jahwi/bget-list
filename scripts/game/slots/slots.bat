@echo off & setlocal enableDelayedExpansion & mode 50,50

::::BgetDescription#test your luck in this clickable slots machine game.[Win10 Only]
::::BgetAuthor#Icarus
::::BgetCategory#game

if "%~1" neq "" goto :%~1

call :macros
call :cMouse
	
	%button% 20 33
	%button% 25 33
	%button% 30 33
	%button% 10 16
	%button% 10 19
	%button% 10 25
	%button% 10 28
	%button% 48  2
	set "money=500"
	set /a "i1=1", "i2=3", "i3=5"
	for %%a in ("" "" "" "  1. Master" "  2. Daring" "  3. Getting there!" "  4. Slug" "  5. Dead sloth" "") do echo=%%~a
	set /p "difficulty=Select difficulty: "
	if !difficulty! gtr 15 set "difficulty=15"
	if !difficulty! lss 1 set "difficulty=1"
	echo. & echo 	Current funds: %money%
	set /p "bet=How much do you want to bet?: "
	if !bet! gtr %money% set /a "bet=money"
	if !bet! lss 1 set "bet=1"
	set /a "speed=difficulty"
	set "b[6]=true"
	
if exist getClickInfo.txt del /f /q getClickInfo.txt
( start /b cmd /c "%~nx0" Controller ) | "%~nx0" GAME_ENGINE
goto :eof


:GAME_ENGINE
for /l %%# in () do (
	
	rem ----------------------------------------------------------------------------------------------------------------------------
	rem scrolling number engine
	if "!stopScroll!" neq "true" (
		set /a "frame+=1", "sd=frame %% speed"
		if !sd! equ 0 (
			set /a "gframe+=1"
			if "!l1!" equ "" if "!b[6]!" neq "true" ( set /a "i1=(!random! %% 5 + 5)" ) else ( set /a "i1=((gframe + 1) + 1) %% 10" )
			if "!l2!" equ "" if "!b[6]!" neq "true" ( set /a "i2=(!random! %% 5 + 5)" ) else ( set /a "i2=((gframe + 3) + 1) %% 10" )
			if "!l3!" equ "" if "!b[6]!" neq "true" ( set /a "i3=(!random! %% 5 + 5)" ) else ( set /a "i3=((gframe + 5) + 1) %% 10" )
		)
		( for %%p in (%button[8](c):c=16%) do %plot% %%~p )
	) else (
		for %%r in (%button[1](c):c=16% %button[2](c):c=16% %button[3](c):c=16% ) do %plot% %%~r
	)
	rem ----------------------------------------------------------------------------------------------------------------------------
	
	
	
	rem ----------------------------------------------------------------------------------------------------------------------------
	rem capture clickable information
	if exist getClickInfo.txt ( < getClickInfo.txt ( set /p "mx=" & set /p "my=" ))
	
	rem Stop game
	if !my! geq 1 if !my! leq 3 if !mx! geq 47 if !mx! leq 50 ( ( for %%p in (%button[8](c):c=9%) do %plot% %%~p )
		if "!stopScroll!" neq "true" ( set "stopScroll=true" & set "l1=" & set "l2=" & set "l3=" ) else ( set "stopScroll=false")
	)
	
	rem Scrolling numbers buttons
	if !my! geq 30 if !my! leq 32 (
		if !mx! geq 18 if !mx! leq 21 ( ( for %%p in (%button[1](c):c=10%) do %plot% %%~p ) & set /a "l1=i1" )
		if !mx! geq 23 if !mx! leq 26 ( ( for %%p in (%button[2](c):c=10%) do %plot% %%~p ) & set /a "l2=i2" )
		if !mx! geq 28 if !mx! leq 31 ( ( for %%p in (%button[3](c):c=10%) do %plot% %%~p ) & set /a "l3=i3" )
	)
	
	rem Scrolling or Random Numbers buttons
	if !my! geq 23 if !my! leq 25 if !mx! geq 9 if !mx! leq 12 ( set "b[6]=true"  & <nul set /p "=%esc%[2J")
	if !my! geq 26 if !my! leq 28 if !mx! geq 9 if !mx! leq 12 ( set "b[6]=false" & <nul set /p "=%esc%[2J")
	if "!b[6]!" equ "true" ( for %%r in (%button[6](c):c=11%) do ( %plot% %%~r ) ) else ( for %%r in (%button[7](c):c=11%) do ( %plot% %%~r ) )
	
	rem Toggle BET:MORE/LESS buttons
	if "!turnOffButton!" equ "" (
		if !my! geq 14 if !my! leq 16 if !mx! geq 9 if !mx! leq 12 ( set /a "turnOffButton=frame + 10" & set "b[4]=true" & if !bet! leq 10000 set /a "bet*=2" & <nul set /p "=%esc%[2J")
		if !my! geq 17 if !my! leq 19 if !mx! geq 9 if !mx! leq 12 ( set /a "turnOffButton=frame + 10" & set "b[5]=true" & if !bet! geq     5 set /a "bet/=2" & <nul set /p "=%esc%[2J")
	)
	if "!b[4]!" equ "true" if !frame! gtr !turnOffButton! ( ( for %%r in (%button[4](c):c=16%) do ( %plot% %%~r )) & set "b[4]=false" & set "turnOffButton=" ) else ( ( for %%p in (%button[4](c):c=9%) do %plot% %%~p ) )
	if "!b[5]!" equ "true" if !frame! gtr !turnOffButton! ( ( for %%r in (%button[5](c):c=16%) do ( %plot% %%~r )) & set "b[5]=false" & set "turnOffButton=" ) else ( ( for %%p in (%button[5](c):c=9%) do %plot% %%~p ) )
	
	( set "mx=" & set "my=") & if exist getClickInfo.txt del /f /q getClickInfo.txt
	rem ----------------------------------------------------------------------------------------------------------------------------
	
	rem This is what happens when all the buttons are clicked
	if "!l1!" equ "4" if "!l2!" equ "0" if "!l3!" equ "4" ( call :winningOdds )
	if defined l1 if defined l2 if defined l3 ( if "!l1!" equ "!l2!" ( if "!l2!" equ "!l3!" ( call :winningOdds ) else ( call :losingOdds ) ) else ( call :losingOdds ) )
	rem ----------------------------------------------------------------------------------------------------------------------------
	
	
	
	
	
	rem ----------------------------------------------------------------------------------------------------------------------------
	rem draw sevenSegmentDisplay
	call :sevenSegmentDisplay !i1! 43 20 20
	call :sevenSegmentDisplay !i2! 57 25 20
	call :sevenSegmentDisplay !i3! 90 30 20
	
	rem draw clickable buttons
	%plot% 1 16 10 "BET:More"
	%buttonDisplay%  9 15 7
	%plot% 1 19 10 "BET:Less"
	%buttonDisplay%  9 18 7
	
	%plot% 2 25 11 "Scroll"
	%buttonDisplay%  9 24 7
	%plot% 2 28 11 "Random"
	%buttonDisplay%  9 27 7
	
	%plot% 42 2 9 "STOP"
	%buttonDisplay% 47 1 7
	
	%buttonDisplay% 19 32 7
	%buttonDisplay% 24 32 7
	%buttonDisplay% 29 32 7
	rem ----------------------------------------------------------------------------------------------------------------------------
	rem display the screen
	<nul set /p "=!screen! %esc%[6;5H Difficulty - !difficulty!	Money: !money!	Bet: !bet!" & set "screen="
)
:exit
exit

:Controller
	for %%a in (c x y) do set "%%a="
	for /f "tokens=1-3" %%W in ('"%temp%\Mouse.exe"') do set /a "mc=%%W,mx=%%X,my=%%Y"
	(   echo !mx!
        echo !my!
    )>getClickInfo.txt
goto :controller

:winningOdds
	%plot% 24 15 10 "WINNER"
	( set /a "money+=(bet + (bet / difficulty) + 10)", "i1=1", "i2=3", "i3=5") & set "l1=" & set "l2=" & set "l3="
	for %%r in (%button[1](c):c=16% %button[2](c):c=16% %button[3](c):c=16% ) do %plot% %%~r
	call :particleAnimation
goto :eof

:losingOdds
	( set /a "i1=1", "i2=3", "i3=5") & set "l1=" & set "l2=" & set "l3="
	for %%r in (%button[1](c):c=16% %button[2](c):c=16% %button[3](c):c=16% ) do %plot% %%~r
goto :eof

:particleAnimation
	for /l %%p in (0,1,50) do (
		set /a "tx[%%p]=%%p", "ty[%%p]=!random! %% 10 + 50", "alpha[%%p]=255", "lifeSpan[%%p]=!random! %% 10 + 15" & set "a[%%p]=true"
	)
	for /l %%# in (1,1,20) do (
		for /l %%p in (1,1,50) do (	
			if "!a[%%p]!" equ "true" (
				set /a "ty[%%p]+=-1", "lifeSpan[%%p]-=1", "alpha[%%p]-=1"
				if !lifeSpan[%%p]! leq 0 ( set "a[%%p]=false" ) else ( %plot% !tx[%%p]! !ty[%%p]! !alpha[%%p]! Û )
			) else ( 
				set /a "ty[%%p]=!random! %% 10 + 50", "alpha[%%p]=255", "lifeSpan[%%p]=!random! %% 10 + 15" & set "a[%%p]=true"
			)
		)
		for /l %%a in (1,15,1000000) do rem
		<nul set /p "=!screen!" & set "screen="
	)
		<nul set /p "=%esc%[2J"
goto :eof

:sevenSegmentDisplay
	if not defined n[9] (
		set /a "n[0]=0x7E", "n[1]=0x30", "n[2]=0x6D", "n[3]=0x79", "n[4]=0x33", "n[5]=0x5B", "n[6]=0x5F", "n[7]=0x70", "n[8]=0x7F", "n[9]=0x7B"
	)
	set /a "index=%~1", "posX_1=%~3", "posX_2=%~3 + 1", "posX_3=%~3 + 2", "posX_4=%~3 - 1", "posY_1=%~4", "posY_2=%~4 + 1", "posY_3=%~4 + 2", "posY_4=%~4 + 3", "posY_5=%~4 + 4", "posY_6=%~4 + 5", "posY_7=%~4 + 6"

	for %%i in (!index!) do (
		set /a "a=%~2 * ((n[%%i] >> 6) & 1)"
		%plot% !posX_1! !posY_1! !a! Û
		%plot% !posX_2! !posY_1! !a! Û
		set /a "a=%~2 * ((n[%%i] >> 5) & 1)"
		%plot% !posX_3! !posY_2! !a! Û
		%plot% !posX_3! !posY_3! !a! Û
		set /a "a=%~2 * ((n[%%i] >> 4) & 1)"
		%plot% !posX_3! !posY_5! !a! Û
		%plot% !posX_3! !posY_6! !a! Û
		set /a "a=%~2 * ((n[%%i] >> 3) & 1)"
		%plot% !posX_1! !posY_7! !a! Û
		%plot% !posX_2! !posY_7! !a! Û
		set /a "a=%~2 * ((n[%%i] >> 2) & 1)"
		%plot% !posX_4! !posY_5! !a! Û
		%plot% !posX_4! !posY_6! !a! Û
		set /a "a=%~2 * ((n[%%i] >> 1) & 1)"
		%plot% !posX_4! !posY_2! !a! Û
		%plot% !posX_4! !posY_3! !a! Û
		set /a "a=%~2 * ((n[%%i] >> 0) & 1)"
		%plot% !posX_1! !posY_4! !a! Û
		%plot% !posX_2! !posY_4! !a! Û
	)
goto :eof

:macros
rem ----------------------------------------------------------------------------------------------------------------------------
set ^"LF=^

^" Above empty line is required - do not remove
set ^"\n=^^^%LF%%LF%^%LF%%LF%^^"
for /F %%a in ('echo prompt $E^| cmd') do set "ESC=%%a"
<nul set /p "=!esc![?25l"

rem %plot% x y 0-255 CHAR
set plot=for %%# in (1 2) do if %%#==2 ( for /f "tokens=1-4" %%1 in ("^!args^!") do (%\n%
	set "screen=^!screen^!!esc![%%2;%%1H!esc![38;5;%%3m%%~4!esc![0m"%\n%
)) else set args=

rem %button% x y - This macro creates an array of buttons with the data in place for you.
rem Example output ( "X Y C Û" "X+1 Y C Û")
rem Example output clarified ( "20 30 C Û" "21 30 C Û")
rem USAGE:
REM 	%button% 20 30
REM 	%button% 23 30
REM 	echo %button[1](c):c=10%
REM 	echo %button[2](c):c=10%
rem We do this because C is variable, and we want to be able to change colors on the fly.
rem Here is example of how to display this button
rem 	for %a in (%buttonDisplay[1](c):c=9%) do PLOT %~a
rem Since the button data is an array of information we want to loop through it, and plot the data
set "buttons="
set button=for %%# in (1 2) do if %%#==2 ( for /f "tokens=1-3" %%1 in ("^!args^!") do (%\n%
	set /a "$bxp1=%%~1 + 1", "buttons+=1"%\n%
	for /f "tokens=1-2" %%b in ("^!$bxp1^! ^!buttons^!") do ( set "button[%%c]^(c^)="%%~1 %%~2 c Û" "%%~b %%~2 c Û"")%\n%
)) else set args=

rem %buttonDisplay% x y c - This macro is used to display a border around the buttons we created from BUTTON
set buttonDisplay=for %%# in (1 2) do if %%#==2 ( for /f "tokens=1-3" %%1 in ("^!args^!") do (%\n%
	set /a "$bx1=%%~1", "$bx2=$bx1 + 1", "$bx3=$bx1 + 2", "$bx4=$bx1 + 3", "$by1=%%~2", "$by2=$by1 + 1", "$by3=$by1 + 2", "$bc=%%~3"%\n%
	for %%b in ("^!$bx1^! ^!$by1^! ^!$bc^! É" "^!$bx2^! ^!$by1^! ^!$bc^! Í" "^!$bx3^! ^!$by1^! ^!$bc^! Í" "^!$bx4^! ^!$by1^! ^!$bc^! »" "^!$bx4^! ^!$by2^! ^!$bc^! º" "^!$bx4^! ^!$by3^! ^!$bc^! ¼" "^!$bx3^! ^!$by3^! ^!$bc^! Í" "^!$bx2^! ^!$by3^! ^!$bc^! Í" "^!$bx1^! ^!$by3^! ^!$bc^! È" "^!$bx1^! ^!$by2^! ^!$bc^! º") do ( ^!plot^! %%~b )%\n%
)) else set args=

rem ----------------------------------------------------------------------------------------------------------------------------
goto :eof

:cMouse
    if not exist "%temp%\mouse.exe" (
        for %%a in ("TVqQAAMAAAAEAAAA//8AALgAAAAAAAAAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
                    "AAAAAAAAAAAAAAAAgAAAAA4fug4AtAnNIbgBTM0hVGhpcyBwcm9ncmFtIGNhbm5v"
                    "dCBiZSBydW4gaW4gRE9TIG1vZGUuDQ0KJAAAAAAAAABQRQAATAECAAAAAAAAAAAA"
                    "AAAAAOAADwMLAQYAAAAAAAAAAAAAAAAAQBEAAAAQAAAAIAAAAABAAAAQAAAAAgAA"
                    "BAAAAAAAAAAEAAAAAAAAAFAhAAAAAgAAAAAAAAMAAAAAABAAABAAAAAAEAAAEAAA"
                    "AAAAABAAAAAAAAAAAAAAACAgAAA8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
                    "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
                    "AAAAAAAAAABcIAAALAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAC50ZXh0AAAA"
                    "ABAAAAAQAAAAAgAAAAIAAAAAAAAAAAAAAAAAACAAAGAuZGF0YQAAAFABAAAAIAAA"
                    "UgEAAAAEAAAAAAAAAAAAAAAAAABAAADAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
                    "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABVieWB7AgAAACQjUX6UOgs"
                    "AAAAg8QED79F/lAPv0X8UA+2RfpQuAAgQABQ6IgBAACDxBC4AAAAAOkAAAAAycNV"
                    "ieWB7CQAAACQuPb///9Q6GwBAACJRfy4AAAAAIlF3I1F+FCLRfxQ6FwBAACLRfiD"
                    "yBCD4L+D4N9Qi0X8UOhOAQAAi0XchcAPhAUAAADpnAAAAI1F9FC4AQAAAFCNReBQ"
                    "i0X8UOgvAQAAD7dF4IP4Ag+FcwAAAItF6IP4AbgAAAAAD5TAiUXchcAPhA8AAACL"
                    "RQi5AQAAAIgI6SMAAACLReiD+AK4AAAAAA+UwIlF3IXAD4QKAAAAi0UIuQIAAACI"
                    "CItF3IXAD4QdAAAAi0UIg8ACD79N5GaJCItFCIPAAoPAAg+/TeZmiQjpVP///4tF"
                    "+FCLRfxQ6JUAAADJwwAAAFWJ5YHsFAAAAJC4AAAAAIlF7LgAAAMAULgAAAEAUOh9"
                    "AAAAg8QIuAEAAABQ6HcAAACDxASNRexQuAAAAABQjUX0UI1F+FCNRfxQ6GEAAACD"
                    "xBSLRfRQi0X4UItF/FDoXf7//4PEDIlF8ItF8FDoRgAAAIPEBMnDAP8lXCBAAAAA"
                    "/yV0IEAAAAD/JXggQAAAAP8lfCBAAAAA/yWAIEAAAAD/JWAgQAAAAP8lZCBAAAAA"
                    "/yVoIEAAAAD/JWwgQAAAACVkICVkICVkAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
                    "iCAAAAAAAAAAAAAAtCAAAFwgAACgIAAAAAAAAAAAAAD9IAAAdCAAAAAAAAAAAAAA"
                    "AAAAAAAAAAAAAAAAvyAAAMggAADVIAAA5iAAAPYgAAAAAAAACiEAABkhAAAqIQAA"
                    "OyEAAAAAAAC/IAAAyCAAANUgAADmIAAA9iAAAAAAAAAKIQAAGSEAACohAAA7IQAA"
                    "AAAAAG1zdmNydC5kbGwAAABwcmludGYAAABfY29udHJvbGZwAAAAX19zZXRfYXBw"
                    "X3R5cGUAAABfX2dldG1haW5hcmdzAAAAZXhpdABrZXJuZWwzMi5kbGwAAABHZXRT"
                    "dGRIYW5kbGUAAABHZXRDb25zb2xlTW9kZQAAAFNldENvbnNvbGVNb2RlAAAAUmVh"
                    "ZENvbnNvbGVJbnB1dEEAAAAA") do echo %%~a>>cMouse.txt
       
        certutil -decode cMouse.txt %temp%\mouse.exe >nul
        del /f /q cmouse.txt
    )
goto :eof