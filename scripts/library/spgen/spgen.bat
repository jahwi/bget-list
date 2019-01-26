@echo off & setlocal enableDelayedExpansion

::::BgetDescription#Game movement engine.
::::BgetAuthor#Icarus
::::BgetCategory#library
::::Bgettags#graphics

%multithread_dispatcher%
	if not exist %temp%\Canvas_3.txt call :map
	call :updateCanvas /f 3
	call :mathMacros
	set /a "dx=18", "dy=14"
	set /a "totalSheep=2", "sheepMoveSpeed=0", "maxSheepRadarDistance=8"
	for /l %%a in (0,1,%totalSheep%) do set /a "sheep_x[%%a]=18 - (%%a + 2)", "sheep_y[%%a]=19 - %%a"
call :multiThread GAME_ENGINE "wasd"
goto :eof

:GAME_ENGINE

	(	for /l %%# in () do (		set /a "frame+=1", "sheepMoveChance=frame %% (sheepMoveSpeed + 1)", "currentSheep=frame %% (totalSheep + 1)"
			
			REM Collect input from user and set coordinates
			%controller% & %move% w a s d . . . . dx dy
			
			REM Draw all sheep
			for /l %%0 in (0,1,%totalSheep%) do %plot% sheep_x[%%0] sheep_y[%%0] !c[%%0]!
			
			REM Begin CURRENT NPC com-munication
			for /f "tokens=1" %%0 in ("!currentSheep!") do ( set "com=nul"
				
				REM Reset the totalRaffles for sheep movement, and DirectionIDs
				set /a "dirID[%%0]*=0", "totalRaffles[%%0]*=0"
				
				REM To allow sheep to stop/move every    "sheepMoveChance=frame %% (sheepMoveSpeed + 1)"    frames
				if !sheepMoveChance! equ 0 (
				
					REM Calculate nearby coordinates for (currentSheep %%0)
					for %%b in ("-1 -1","0 -1","1 -1","1 0","1 1","0 1","-1 1","-1 0") do (
						for /f "tokens=1,2" %%c in (%%b) do set /a "sheep[%%0][!dirID[%%0]!]X=%%c + sheep_x[%%0]", "sheep[%%0][!dirID[%%0]!]Y=%%d + sheep_y[%%0]"
						set /a "dirID[%%0]+=1" 
					)

					for /l %%b in (0,1,7) do (
						for /l %%c in (0,1,!totalSheep!) do (
							
							REM Sheep Heard
							if not %%c == %%0 (
								set /a "t1[%%0]=sheep[%%0][%%b]X - sheep_x[%%c]", "t2[%%0]=sheep[%%0][%%b]Y - sheep_y[%%c]", "distance=%Max%"
										   if !distance! leq 3 ( set /a "sheep[%%0][%%b]+=2000"
									) else if !distance! equ 4 ( set /a "sheep[%%0][%%b]+=1500"
									) else if !distance! equ 5 ( set /a "sheep[%%0][%%b]+=1400"
									) else if !distance! equ 6 ( set /a "sheep[%%0][%%b]+=1300"
									) else if !distance! equ 7 ( set /a "sheep[%%0][%%b]+=1200"
									) else if !distance! geq 8 ( set /a "sheep[%%0][%%b]+=1100"
								)
							)
							
							REM Sheep awareness of DOG
							set /a "t1[%%0]=dx - sheep_x[%%0]", "t2[%%0]=dy - sheep_y[%%0]", "t3[%%0]=t1[%%0] * t1[%%0]", "distance_D=%Max%"
							if !distance_D! geq %maxSheepRadarDistance% (
								set "c[%%0]=0"
										   if !distance_D! leq 3 ( set /a "sheep[%%0][%%b]-=3000"
									) else if !distance_D! equ 4 ( set /a "sheep[%%0][%%b]-=2000"
									) else if !distance_D! equ 5 ( set /a "sheep[%%0][%%b]-=1600"
									) else if !distance_D! equ 6 ( set /a "sheep[%%0][%%b]-=250"
									) else if !distance_D! equ 7 ( set /a "sheep[%%0][%%b]-=100"
									) else if !distance_D! geq 8 ( set /a "sheep[%%0][%%b]-=50"
								)
							) else ( set "c[%%0]=1" )

						)
						
						set /a "totalRaffles[%%0]+=!sheep[%%0][%%b]!"
					)
					
					set /a "selectedRaffle=!random! %% !totalRaffles[%%0]!"
					for /l %%b in (0,1,7) do (
						set /a "selectedRaffle-=!sheep[%%0][%%b]!"
						if !selectedRaffle! LEQ 7 if "!com!" equ "nul" set "com=%%b" & set /a "sheep[%%0][%%b]=1"
					)
					
				)
				
				%move% 1 7 5 3 4 6 2 0 sheep_x[%%0] sheep_y[%%0]
			)

			%adjustCamera% dx dy
			call:showCanvas !dx! !dy! D
			call:updateCanvas /v 3
	)	)
exit

























:canvas
set ^"LF=^

^" Above empty line is required - do not remove
set ^"\n=^^^%LF%%LF%^%LF%%LF%^^"
		call:macros
		call:cursorpos 2>nul
		if "%~2" neq "" ( set /a "width=%~1 - 1", "height=%~2 - 1" ) else ( goto :eof )
        if "%~3" neq "" ( set "canvasChar=%~3" ) else ( set "canvasChar=#" )
        if "%~4" neq "" ( set "title=%~4" ) else ( set "title=CANVAS" )
		if "%~7" neq "" ( if /i "%~5" equ "/c" (
				set "CAM=/c"
				set /a "CAM_Y=0", "CAM_X=0", "maxX=%~6", "winMaxY=%~7","cols=maxX + 5", "rows=winMaxY + 8"
				if not defined outerBuffer ( for /l %%a in (-1,1,!maxX!) do ( 
					set "outerBuffer=!outerBuffer!%canvasChar%") )
				if !maxX!    geq %width%  set /a "maxX=width"
				if !winMaxY! geq %height% set /a "winMaxY=height"
			)
		) else (
			set /a "cols=width + 5", "rows=height + 8"
			if not defined outerBuffer ( for /l %%a in (-2,1,%width%) do ( 
				set "outerBuffer=!outerBuffer!%canvasChar%") )
		)
		if not defined Controller ( set "Controller=set "com="^^& set /p "com="" )
		if not defined multithread_dispatcher ( set "multithread_dispatcher=if "%%~1" neq "" call :%%~1 "%%~2"" )
        for /l %%a in (0,1,%width%)  do set "widthBuffer=!widthBuffer! "
        call:updateCanvas
        if exist "%temp%\cursorpos.exe" ( 
            set "cls="%temp%\cursorpos.exe" 0 1" ) else ( set "cls=cls" )
        mode con: cols=%cols% lines=%rows%
		title %title%
    goto :eof
	
    :saveCanvas
        if "%~2" neq "" ( if /i "%~1" equ "/f" (
                if exist "%tmp%\Canvas_%~2.txt" ( del /f /q "%tmp%\Canvas_%~2.txt" 2>nul )
                for /l %%a in (0,1,%height%) do ( echo="!_[%%a]!">>"%tmp%\Canvas_%~2.txt")
                <nul set /p ".=:: "%width%+1" "%height%+1" "%canvasChar%" "%title%" "%CAM%" "%maxX%" "%winMaxY%" ">>"%tmp%\Canvas_%~2.txt"   
			) else if /i "%~1" equ "/v" ( for /l %%a in (0,1,%height%) do ( set "tmp_%~2_[%%a]=!_[%%a]!") 
        ) else if /i "%~1" equ "/d" ( if exist "%tmp%\Canvas_%~2.txt" ( del /f /q "%tmp%\Canvas_%~2.txt" 2>nul ) ) )
    :updateCanvas
        if "%~2" neq "" ( if /i "%~1" equ "/f" ( if exist "%tmp%\Canvas_%~2.txt" (
                    set "_=-1"
                    for /f "tokens=*" %%a in (%tmp%\Canvas_%~2.txt) do ( 
                        set /a "_+=1" & set "tmp_%~2_[!_!]=%%~a"
                        call set "expanded_=%%tmp_%~2_[!_!]%%"
                        if "!expanded_:~0,2!" equ "::" call:canvas !expanded_:~3!
                    )
                    call:updateCanvas /v %~2
                )
			) else if /i "%~1" equ "/v" ( for /l %%a in (0,1,%height%) do ( set "_[%%a]=!tmp_%~2_[%%a]!" ) ) 
        ) else ( for /l %%a in (0,1,%height%) do ( set "_[%%a]=%widthBuffer%" ) )
    goto :eof

    :showCanvas
        %cls%
        echo= %outerBuffer%
        if /i "%CAM%" neq "/c" (
			for /l %%a in (0,1,%height%) do ( echo= %canvasChar:~0,1%!_[%%a]!%canvasChar:~0,1%)
		) else if "%~3" neq "" (
			set /a "maxY=CAM_Y + winMaxY", "_line=%~1 + 1" & if !maxY! gtr %height% set /a "maxY=height"
			for /l %%a in (!CAM_Y!,1,!maxY!) do (
				set "line=!_[%%a]!"
				if "%%a" equ "%~2" for /f "tokens=1-3" %%a in ("%~1 %~3 !_line!") do set "line=!line:~0,%%a!%%b!line:~%%c!"
				echo= !canvasChar:~0,1!!line:~%CAM_X%,%maxX%!!canvasChar:~0,1!
			)
		) else echo Missing Parameters
        echo= %outerBuffer%
    goto :eof
	
	:multiThread
		if exist "%temp%\%~n0_signal.txt" del "%temp%\%~n0_signal.txt"
		"%~F0" Controller %~2 >"%temp%\%~n0_signal.txt" | "%~F0" %1 <"%temp%\%~n0_signal.txt"
	goto :eof
	
	:Controller
		( for /l %%# in () do for /f "tokens=*" %%a in ('choice /c:%~1 /n') do <nul set /p ".=%%a" )
goto :eof


:macros
:: Canvas Macros -------------------------------------------------------------------
rem %PLOT%
set plot=for %%# in (1 2) do if %%#==2 ( for /f "tokens=1-3" %%1 in ("^!args^!") do (%\n%
	set /a "_y=%%2", "_x=%%1", "_x2=%%1 + 1"%\n%
	for /f "tokens=1-4" %%a in ("_y ^!_y^! ^!_x^! ^!_x2^!") do set "_[^!%%a^!]=^!_[%%b]:~0,%%c^!%%3^!_[%%b]:~%%d^!"%\n%
)) else set args=

rem %adjustCamera%
set adjustCamera=for %%# in (1 2) do if %%#==2 ( for /f "tokens=1,2" %%1 in ("^!args^!") do (%\n%
	for /f "tokens=1,2" %%a in ("^!maxX^! ^!winMaxY^!") do set /a "CAM_X=%%1 - (%%a / 2)", "CAM_Y=%%2 - (%%b / 2)"%\n%
	for /f "tokens=1,2" %%x in ("^!CAM_X^! ^!CAM_Y^!") do (%\n%
		if %%x leq 0 set CAM_X=0%\n%
		if %%y leq 0 set CAM_Y=0%\n%
	)%\n%
)) else set args=

rem %CIRCLE%
set circle=for %%# in (1 2) do if %%#==2 ( for /f "tokens=1-5" %%1 in ("^!args^!") do (%\n%
        for /l %%y in (-%%3,1,%%3) do for /l %%x in (-%%3,1,%%3) do (%\n%
            set /a "S=(%%x * %%x) + (%%y * %%y) - (%%3 * %%3)", "_3div2=%%3 / 2"%\n%
			for /f "tokens=1,2" %%a in ("^!S^! ^!_3div2^!") do (%\n%
					   if "%%5" equ "/f" ( if %%a leq 1    ( ^!plot^! %%x+%%1 %%y+%%2 %%~4 )%\n%
				) else if "%%5" equ "/n" ( if %%a geq -%%3 ( ^!plot^! %%x+%%1 %%y+%%2 %%~4 )%\n%
				) else if %%a geq -%%3 if %%a leq %%b      ( ^!plot^! %%x+%%1 %%y+%%2 %%~4 )%\n%
		))%\n%
        set "s="%\n%
)) else set args=
:: End Canvas Macros ---------------------------------------------------------------

:: Engine Macros -------------------------------------------------------------------
:: %checkSpace%
set checkSpace=for %%# in (1 2) do if %%#==2 ( for /f "tokens=1-2" %%1 in ("^!args^!") do (%\n%
	set /a "_x=%%1", "_y=%%2"%\n%
	for /f "tokens=1-2" %%x in ("^!_x^! ^!_y^!") do (%\n%
			   if "^!_[%%y]:~%%x,1^!" equ "?" ( set "CSerr=1"%\n%
		) else if "^!_[%%y]:~%%x,1^!" equ "1" ( set "CSerr=1"%\n%
		) else if "^!_[%%y]:~%%x,1^!" equ "0" ( set "CSerr=1"%\n%
		) else if "^!_[%%y]:~%%x,1^!" equ "D" ( set "CSerr=1"%\n%
		) else set "CSerr=0"%\n%
	)%\n%
)) else set args=

:: %move%
set move=for %%# in (1 2) do if %%#==2 ( for /f "tokens=1-10" %%a in ("^!args^!") do (%\n%
		   if /i "^!com^!" equ "%%a" ( ^!checkSpace^! %%i %%j-1%\n%
		if "^!CSerr^!" neq "1" set /a "%%j-=1"%\n%
	) else if /i "^!com^!" equ "%%b" ( ^!checkSpace^! %%i-1 %%j%\n%
		if "^!CSerr^!" neq "1" set /a "%%i-=1"%\n%
	) else if /i "^!com^!" equ "%%c" ( ^!checkSpace^! %%i %%j+1%\n%
		if "^!CSerr^!" neq "1" set /a "%%j+=1"%\n%
	) else if /i "^!com^!" equ "%%d" ( ^!checkSpace^! %%i+1 %%j%\n%
		if "^!CSerr^!" neq "1" set /a "%%i+=1"%\n%
	) else if /i "^!com^!" equ "%%e" ( ^!checkSpace^! %%i-1 %%j-1%\n%
		if "^!CSerr^!" neq "1" set /a "%%i-=1", "%%j-=1"%\n%
	) else if /i "^!com^!" equ "%%f" ( ^!checkSpace^! %%i+1 %%j-1%\n%
		if "^!CSerr^!" neq "1" set /a "%%i+=1", "%%j-=1"%\n%
	) else if /i "^!com^!" equ "%%g" ( ^!checkSpace^! %%i-1 %%j+1%\n%
		if "^!CSerr^!" neq "1" set /a "%%i-=1", "%%j+=1"%\n%
	) else if /i "^!com^!" equ "%%h" ( ^!checkSpace^! %%i+1 %%j+1%\n%
		if "^!CSerr^!" neq "1" set /a "%%i+=1", "%%j+=1")%\n%
)) else set args=

:: End Engine Macros ---------------------------------------------------------------
goto :eof

:map
for %%a in (
			"??????????????????????????????????????????????????"
			"???????????????????????????????????????????????? ?"
			"???????????????????????????????????????????????? ?"
			"?????        T ???             ????????????????? ?"
			"?????                             ?????????????? ?"
			"?????                              ????????????? ?"
			"?????                                ??????????? ?"
			"?????                                 ?????????? ?"
			"???                                           ????"
			"???                                           ????"
			"???                                           ????"
			"???                                           ????"
			"???                                           ????"
			"???                                           ????"
			"???                                           ????"
			"???                                           ????"
			"???                                           ????"
			"???                                           ????"
			"???                                           ????"
			"???                                           ????"
			"???                                           ????"
			"???                                           ????"
			"???                                           ????"
			"???                                           ????"
			"???                                           ????"
			"???                                           ????"
			"???                                           ????"
			"???                                           ????"
			"???                                           ????"
			"???                                           ????"
			"???                                           ????"
			"???                                           ????"
			"???                                           ????"
			"???                                           ????"
			"???                                           ????"
			"???                                           ????"
			"???                                           ????"
			"???                                           ????"
			"???                                           ????"
			"???                                           ????"
			"?????????                               ???????? ?"
			"???????????                           ?????????? ?"
			"????????????                         ??????????? ?"
			"??????????????                     ????????????? ?"
			"???????????????                   ?????????????? ?"
			"??????????????????             ????????????????? ?"
			"???????????????????????????????????????????????? ?"
			"???????????????????????????????????????????????? ?"
			"?                  ???????????                   ?"
			"??????????????????????????????????????????????????"
			":: "49+1" "49+1" "#" "Game" "/c" "30" "30" "
) do echo %%~a>>%temp%\Canvas_3.txt

:mathMacros
    if not exist FP?-Module.js (
        echo WScript.Stdout.WriteLine(eval(WScript.Stdin.ReadLine^(^).replace(/\x22/g,""^)^)^);> FP?-Module.js
        attrib +h +s FP?-Module.js
    )
	
	set "TWO_PI=2 * Math.PI"
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
	set "Max=( ?=((t1[%%0]-t2[%%0])>>31)+1, ?*(2*t1[%%0]-t2[%%0]-(t1[%%0]-t2[%%0])) + ^^^!?*(t1[%%0]-t2[%%0]-(t1[%%0]-t2[%%0]*2)) )"
   
    set "swap(x,y)=t=x, x=y, y=t"
    set "translate=x+=width / 2, y+=height / 2"
    set "checkBounds=if ^!x^! leq %width% if ^!y^! leq %height% if ^!x^! geq 0 if ^!y^! geq 0"
    goto :eof
    
    :math rtnvar expr
        echo "%~2" >%TMP%\in.txt
        Cscript //nologo FP?-Module.js <%TMP%\in.txt >%TMP%\out.txt
        set /p "%1=" <%TMP%\out.txt
        set "%1=!%1:,=.!"
    goto :eof
goto :eof