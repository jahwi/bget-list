@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION

::::BgetDescription#Fill the grid by visiting every cell. Watch out for eaters.
::::BgetAuthor#chazjn
::::BgetCategory#game

:: set vars
SET HEIGHT=10
SET WIDTH=20
SET TICKCOUNT=0
SET FILLCOUNT=0
SET /A CELLCOUNT=%HEIGHT%*%WIDTH%
SET DEAD=FALSE
SET MINECOUNT=10
SET LIFECOUNT=2
SET MONSTER=FALSE
SET MONSTER_CLEAN=FALSE
:: define N as New Line character
(SET N=^
%=Do not remove this line=%
)

:: set sprites
SET SP_HERO=#
SET SP_HERO-DEAD=x
SET SP_MINE=o
SET SP_FILL=*
SET SP_MONSTER-UP=V
SET SP_MONSTER-DOWN=^^
SET SP_MONSTER-LEFT=^>
SET SP_MONSTER-RIGHT=^<
SET SP_MONSTER-DEAD=-

:: set starting position, approx centre
SET /A X=%WIDTH%/2
SET /A Y=%HEIGHT%/2

:: set previous position, same as start
SET PREV_X=%X%
SET PREV_Y=%Y%

:: set empty grid
FOR /L %%h IN (1, 1, %HEIGHT%) DO (
		FOR /L %%w IN (1, 1, %WIDTH%) DO (
			SET "G[%%w][%%h]= "
		)	
)

:: set starting position
SET G[%X%][%Y%]=%SP_HERO%

:: Set top/bot of grid
FOR /L %%w IN (1, 1, %width%) DO (SET "GRIDTOP=_!GRIDTOP!" & SET "GRIDBOT=~!GRIDBOT!")
SET "GRIDTOP=.%GRIDTOP%." & SET "GRIDBOT='!GRIDBOT!'"


:START
CLS
ECHO Fill. Version 1.0. ChazJN 29/04/2017
ECHO/
ECHO KEYS: 
ECHO      I - Up
ECHO      K - Down
ECHO      J - Left
ECHO      L - Right
ECHO      Z - Drop Mine
ECHO      P - Pause
ECHO      Q - Quit
ECHO/
PAUSE


:TOP
SET /A TICKCOUNT=%TICKCOUNT%+1

:: As we draw each cell we can count how many are filled
:: SET FILLCOUNT to 1 because we need to count the hero
:: we are also check for 'X' (died)
SET FILLCOUNT=1
SET SCREEN=
FOR /L %%h IN (1, 1, %height%) DO (
	
	SET ROW=
	FOR /L %%w IN (1, 1, %WIDTH%) DO (
			IF [!G[%%w][%%h]!]==[%SP_FILL%] (
				SET /A FILLCOUNT=!FILLCOUNT!+1
			)
			IF [!G[%%w][%%h]!]==[%SP_HERO-DEAD%] (
				SET DEAD=TRUE
			)
			
			SET ROW=!ROW!!G[%%w][%%h]!
	)
	
	SET SCREEN=!SCREEN!!N!^|!ROW!^|
)

SET MINE_DISPLAY=
FOR /L %%m IN (1, 1, %MINECOUNT%) DO (
	SET MINE_DISPLAY=!MINE_DISPLAY!%SP_MINE%
)

SET LIFE_DISPLAY=
FOR /L %%l IN (1, 1, %LIFECOUNT%) DO (
	SET LIFE_DISPLAY=!LIFE_DISPLAY!%SP_HERO%
)

SET SCREEN=%GRIDTOP%!SCREEN!!N!%GRIDBOT%!N!MINES: %MINE_DISPLAY%!N!LIVES: %LIFE_DISPLAY%!N!FILLS: %FILLCOUNT%/%CELLCOUNT%!N!TICKS: %TICKCOUNT%
CLS
ECHO !SCREEN!


IF [%DEAD%]==[TRUE] (
	SET /A LIFECOUNT=%LIFECOUNT%-1
	IF %LIFECOUNT% EQU -1 (
		GOTO GAMEOVER
	) ELSE (
		SET DEAD=FALSE
	)
)

IF %FILLCOUNT% EQU %CELLCOUNT% (
	GOTO COMPLETE
)


:: 1 X = default (no move)
:: 2 I = up
:: 3 J = left
:: 4 K = down
:: 5 L = right
:: 6 Z = bomb
:: 7 P = pause
:: 8 Q = quit
CHOICE /C XIJKLZPQ /T 1 /D X /N > nul
SET EL=!ERRORLEVEL!


:: right
IF !EL! EQU 5 (
	IF !X! EQU !WIDTH! (
		SET /A X=1
	) ELSE (
		SET /A X=!X!+1
	)
	GOTO KEYPRESS
)

::down
IF !EL! EQU 4 (
	IF !Y! EQU !HEIGHT! (
		SET /A Y=1
	) ELSE (
		SET /A Y=!Y!+1
	)
	GOTO KEYPRESS
)

::left
IF !EL! EQU 3 (
	IF !X! EQU 1 (
		SET /A X=!WIDTH!
	) ELSE (
		SET /A X=!X!-1
	)
	GOTO KEYPRESS
)

::up
IF !EL! EQU 2 (
	IF !Y! EQU 1 (
		SET /A Y=!HEIGHT!
	) ELSE (
		SET /A Y=!Y!-1
	)
	GOTO KEYPRESS
)

:: bomb
IF !EL! EQU 6 (
	
	IF %MINECOUNT% EQU 0 (
		GOTO TOP
	)
	IF [!G[%X%][%Y%]!]==[%SP_MINE%] (
		GOTO TOP
	)
	
	SET DROPPEDBOMB=TRUE
	SET /A MINECOUNT=%MINECOUNT%-1
	GOTO KEYPRESS
)


:: quit
IF !EL! EQU 8 (
	GOTO GAMEOVER
)

:: pause
IF !EL! EQU 7 (
	PAUSE
)


:KEYPRESS
:: If NOT nothing
IF NOT !EL! EQU 1 (

	IF !DROPPEDBOMB!==TRUE (
		SET G[!X!][!Y!]=%SP_MINE%
		SET DROPPEDBOMB=FALSE
	) ELSE (
		%=== see if we have a bomb there to pickup ===%
		IF [!G[%X%][%Y%]!]==[%SP_MINE%] (
			SET /A MINECOUNT=%MINECOUNT%+1
		)
		
		%=== set the 'head' ===%
		SET G[!X!][!Y!]=%SP_HERO%
		
		%=== set the 'tail' ===%
		IF NOT [!G[%PREV_X%][%PREV_Y%]!]==[%SP_MINE%] (
			SET G[!PREV_X!][!PREV_Y!]=%SP_FILL%
		)
	)

	SET PREV_X=!X!
	SET PREV_Y=!Y!
)


:: randomly spawn 'monsters'
:: monsters move in 
:: > left 
:: < right
:: ^ down
:: v up 

:: first clean up the last monster
IF [%MONSTER_CLEAN%]==[TRUE] (
	SET "G[%x_prev_monster%][%y_prev_monster%]= "
	SET MONSTER_CLEAN=FALSE
	SET MONSTER=FALSE
)



:: 1 = Up, 2 = Down, 3 = Left, 4 = Right
:: first calculate starting direction (up, down, left right)
:: then calculate starting X, Y (has to be on edge)
:: then calculate the speed.
:: (1) normal speed = moves every ticks
:: (2,3) slow speed = on even ticks
IF [%MONSTER%]==[FALSE] (

	set x_monster=1
	set y_monster=1

	%=== calculate probability of monster appearing ===%
	SET /A probability_monster=%RANDOM% * 20 / 32768 + 1
	IF !probability_monster! GEQ 20 (
	
		SET MONSTER=TRUE
		SET /A speed_monster=%RANDOM% * 3 / 32768 + 1	
		SET /A direct_monster=%RANDOM% * 4 / 32768 + 1
		IF !direct_monster! EQU 1 (
			SET /A x_monster=%RANDOM% * %width% / 32768 + 1
			SET /A y_monster=%height%
			GOTO DRAW_MONSTER
		)
		IF !direct_monster! EQU 2 (
			SET /A x_monster=%RANDOM% * %width% / 32768 + 1
			SET /A y_monster=1
			GOTO DRAW_MONSTER
		)
		IF !direct_monster! EQU 3 (
			SET /A x_monster=%width%
			SET /A y_monster=%RANDOM% * %height% / 32768 + 1
			GOTO DRAW_MONSTER
		)
		IF !direct_monster! EQU 4 (
			SET /A x_monster=1
			SET /A y_monster=%RANDOM% * %height% / 32768 + 1
			GOTO DRAW_MONSTER
		)		
	)
) 


:DRAW_MONSTER
IF [%MONSTER%]==[TRUE] (

	IF !speed_monster! GEQ 2 (
		SET /A EVEN=%TICKCOUNT% %% 2
		IF !EVEN! NEQ 0 GOTO TOP
	)

	%=== get this current monster cell so we can set it as blank on the next display ===%
	SET x_prev_monster=%x_monster%
	SET y_prev_monster=%y_monster%
	
	%=== see if a monster has touched a bomb ===%
	IF [!G[%x_monster%][%y_monster%]!]==[%SP_MINE%] (
		SET G[%x_monster%][%y_monster%]=%SP_MONSTER-DEAD%
		SET MONSTER_CLEAN=TRUE
	) ELSE (

		IF !direct_monster! EQU 1 (
			SET G[%x_monster%][%y_monster%]=^%SP_MONSTER-UP%
			SET /A y_monster=%y_monster%-1
			IF %y_monster% EQU 1 (SET MONSTER_CLEAN=TRUE) 
		)
		IF !direct_monster! EQU 2 (
			SET G[%x_monster%][%y_monster%]=^%SP_MONSTER-DOWN%
			SET /A y_monster=%y_monster%+1
			IF %y_monster% EQU %height% (SET MONSTER_CLEAN=TRUE) 
		)
		IF !direct_monster! EQU 3 (
			SET G[%x_monster%][%y_monster%]=^%SP_MONSTER-LEFT%
			SET /A x_monster=%x_monster%-1
			IF %x_monster% EQU 1 (SET MONSTER_CLEAN=TRUE)
		)
		IF !direct_monster! EQU 4 (
			SET G[%x_monster%][%y_monster%]=^%SP_MONSTER-RIGHT%
			SET /A x_monster=%x_monster%+1
			IF %x_monster% EQU %width% (SET MONSTER_CLEAN=TRUE) 
		)
	)

	SET "G[%x_prev_monster%][%y_prev_monster%]= "	
	
	:: monster collision detection
	IF [!G[%X%][%Y%]!]==[^%SP_MONSTER-DOWN%] (
		SET G[!X!][!Y!]=%SP_HERO-DEAD%
		SET DEAD=TRUE & GOTO TOP
	)
	IF [!G[%X%][%Y%]!]==[^%SP_MONSTER-UP%] (
		SET G[!X!][!Y!]=%SP_HERO-DEAD%
		SET DEAD=TRUE & GOTO TOP
	)
	IF [!G[%X%][%Y%]!]==[^%SP_MONSTER-LEFT%] (
		SET G[!X!][!Y!]=%SP_HERO-DEAD%
		SET DEAD=TRUE & GOTO TOP
	)
	IF [!G[%X%][%Y%]!]==[^%SP_MONSTER-RIGHT%] (
		SET G[!X!][!Y!]=%SP_HERO-DEAD%
		SET DEAD=TRUE & GOTO TOP
	)
)
GOTO TOP


:COMPLETE
ECHO Congratulations^^!
GOTO EOF


:GAMEOVER
ECHO Game over^^!
GOTO EOF

:EOF