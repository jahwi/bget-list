@echo off & setlocal enableDelayedExpansion

::::BgetDescription#Brickbreaker-type game.
::::BgetAuthor#Icarus
::::BgetCategory#game
::::Bgettags#block
rem icky lives

if "%~1" neq "" goto %~1

call :canvas 40 35

:: generate ball
call :generate_ball

:: generate self
set /a "mx=14", "my=height - 5", "mxl=mx + 9"
set /a "lives=5"

:: generate_objects
set "list="7,5" "13,5" "19,5" "25,5" "31,5" "7,7" "13,7" "19,7" "25,7" "31,7" "7,11" "13,11" "19,11" "25,11" "31,11" "win""

if exist %temp%\out.txt del %temp%\out.txt
"%~F0" Controller >%temp%\out.txt | "%~F0" Engine <%temp%\out.txt
goto :eof

:Engine

    for /l %%. in () do (
        rem pick up input from out.txt
        set "com=" & set /p "com="
        
        rem use player input
        if /i "!com!" equ "A" if !mx!  geq 2       set /a "mx-=2"
        if /i "!com!" equ "D" if !mxl! lss %width% set /a "mx+=2"

        rem move the ball, and myself
        set /a "bx+=bi","_x2=bx + 1"
        set /a "by+=bj", "mxl=mx + 9"
        
        rem Bounce off top, bottom, and right walls
        if !bx! geq %width%  set /a "bx=width",  "bi*=-1"
        if !bx! leq 0        set /a "bx=0",      "bi*=-1"
        if !by! leq 0        set /a "by=0",      "bj*=-1"
        
        rem Detect if we miss the ball
        if !by! gtr %height% (
            call :generate_ball
            set /a "lives-=1"
            if !points! geq 0 set /a "points-=5"
            if !lives! equ 0 (
                cls & for /l %%a in (1,1,17) do echo.
                echo                   You lose! & pause > nul & exit
            )
        )
        
        rem Detect if we hit the ball
        if !by! equ !my! if !bx! geq !mx! if !bx! leq !mxl! set /a "bj*=-1", "points+=1"
        
        rem Detect if it hits object
        if !by! leq 12 (
            set "newList="
            for %%a in (!list!) do for /f "tokens=1,2 delims=," %%0 in ("%%~a") do (
                if !bx! equ %%0 if !by! equ %%1 (
					call set "_[!by!]=%%_[!by!]:~0,!bx!%% %%_[!by!]:~!_x2!%%"
                    set /a "bj*=-1", "points+=3"
                    set "newList=!list:"%%0,%%1"=!"
                )
            )
            if defined newList set "list=!newList!"
        )

        rem Detect if we hit all the objects
		if "!list!" equ "win" (
			cls
			for /l %%a in (1,1,17) do echo.
			echo                   You Win!& echo.
			echo                  SCORE: !points!
			pause > nul & exit
        )
		
		rem Place leftover Objects
		for %%a in (!list!) do for /f "tokens=1,2 delims=," %%0 in ("%%~a") do (
			set /a "_x4=%%0 + 1"
			call set "_[%%1]=%%_[%%1]:~0,%%0%%X%%_[%%1]:~!_x4!%%"
		)
		
        rem This is ball!
        call set "_[!by!]=%%_[!by!]:~0,!bx!%%O%%_[!by!]:~!_x2!%%"

        rem This is me!
		call set "_[!my!]=%%_[!my!]:~0,!mx!%%---------%%_[!my!]:~!mxl!%%"
        
        call :showCanvas
        call :updateCanvas
        echo= A/D - Move   Points = !points!    Lives = !lives!
    )
exit /b

rem collect user input
:Controller
		( for /l %%# in () do for /f "tokens=*" %%a in ('choice /c:ad /n') do <nul set /p ".=%%a" )
		
:generate_ball
    set /a "bx=19", "by=13", "bi=(!random! %% 2) - 1", "bj=(!random! %% 2) - 1"
    set /a "cfi=!random! %% 2 + 1", "cfj=!random! %% 2 + 1"
    if !bj! equ 0 if !cfj! equ 2 ( set /a "bj-=1" ) else ( set /a "bj+=1" )
    if !bi! equ 0 if !cfi! equ 2 ( set /a "bi-=1" ) else ( set /a "bi+=1" )
goto :eof

:canvas
        set /a "width=%~1 - 1", "height=%~2 - 1", "conWidth=width + 5", "conHeight=height + 6"
        for /l %%a in (-2,1,%width%) do set "outerBuffer=!outerBuffer!Û"
        for /l %%a in (0,1,%width%)  do set "widthBuffer=!widthBuffer! "
        call :updateCanvas
        if exist "%temp%\cursorpos.exe" ( set "cls="%temp%\cursorpos.exe" 0 0") else ( set "cls=cls")
        mode con: cols=%conWidth% lines=%conHeight%
    goto :eof
    
    :updateCanvas
            for /l %%a in (0,1,%height%) do set "_[%%a]=%widthBuffer%"
    goto :eof
    
    :showCanvas
        cls
        echo. & echo= %outerBuffer%
        for /l %%a in (0,1,%height%) do echo= Û!_[%%a]!Û
        echo= %outerBuffer%
    goto :eof
goto :eof