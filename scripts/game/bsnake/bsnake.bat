:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: SNAKE.BAT - A pure native Windows batch implementation of the classic game
:: ------------------------------------------------------------------------------
::::BgetDescription#Snake game made in batch.
::::BgetAuthor#Dave Benham
::::BgetCategory#game
:: Written by Dave Benham with some debugging help and technique pointers from
:: DosTips users - See http://www.dostips.com/forum/viewtopic.php?f=3&t=4741
::
:: The game should work on any Windows machine from XP onward using only batch
:: and native external commands. However, there will most likely be some screen
:: flicker due to the CLS command issued upon every screen refresh.
::
:: The screen flicker can be eliminated by adding Aacini's CursorPos.exe to the
:: same folder that contains SNAKE.BAT. The flicker free feature is "cheating"
:: in that it is not pure native batch since it relies on a 3rd party tool.
:: But it really improves the game experience. A script to create CursorPos.exe
:: is available at http://goo.gl/hr6Kkn.
::
:: Note that user preferences and high scores are stored in %USERPROFILE%\Snake
:: User saved games have an implicit .snake.txt "extension", and are saved and
:: loaded from the current directory.
::
:: Version History
::
:: 3.7  2014-08-03
::   - Reduced screen flicker when playing without CursorPos.exe by building
::     entire screen in one variable before CLS and ECHOing the screen.
::
:: 3.6  2014-04-09
::   - Pause after displaying CursorPos.exe message at end if game was launced
::     via double click or START menu.
::
:: 3.5  2014-02-03
::   - Made growth rate user configurable. High scores are now stored for each
::     growth rate played.
::   - Added optional support for Aacini's CursorPos.exe to eliminate screen
::     flicker.
::   - Redesigned storage of configuration options within saved games to make
::     it easier to extend in the future. Existing saved games are automatically
::     converted to the new format.
::   - Simplified replay abort mechanics.
::
:: 3.4  2013-12-26
::   - Added ability to abort a game replay.
::
:: 3.3  2013-12-24
::   - Added Pause functionality.
::
:: 3.2  2013-12-08
::   - Fixed a replay bug. Note that attempting to delete a non-existent file
::     does not raise an error!
::   - Added ability to save a previous game or a High score game to a user
::     named file in the current directory.
::   - Added ability to load and replay a user saved game from the current
::     directory.
::
:: 3.1  2013-12-08
::   - Fixed a bug with the game logs. Must include key mappings in log.
::     High scores from version 3.0 should be deleted from %USERPROFILE%\Snake.
::
:: 3.0  2013-12-07
::   - Made control keys user configurable, including option for 2 key
::     (left/right) or 4 key (left/right/up/down) input.
::   - Made graphics user configurable.
::   - Added ability to display replay of previous game.
::   - Added High Score list, with ability to display replay of High Score games.
::
:: 2.3  2013-12-01
::   - Added elapsed game time to the display.
::
:: 2.2  2013-08-06
::   - Improved comments / internal documentation
::   - A few inconsequential code changes
::
:: 2.1  2013-07-20
::   - Reworked interprocess communication. No more hanging games (I hope).
::   - Fixed parameterization of movement key definition.
::   - Temp file location now controlled by TEMP (or TMP) environment variable.
::   - Implemented a game session lock into temp file names so multiple game
::     instances can share the same TEMP folder without interference.
::
:: 2.0  2013-07-17
::   - First attempt at using XCOPY instead of CHOICE. Game now runs as
::     pure native batch on all Windows versions from XP onward.
::
:: 1.0  2013-07-13  to  1.x
::   - Game required CHOICE command, so did not work on XP without download of
::     a non-standard exe or com file.
::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

@echo off
if "%~1" == "startGame" goto :game
if "%~1" == "startController" goto :controller


::---------------------------------------------------------------------
:: setup some global variables used by both the game and the controller

setlocal disableDelayedExpansion
:getSession
if defined temp (set "tempFileBase=%temp%\") else if defined tmp set "tempFileBase=%tmp%\"
set "tempFileBase=%tempFileBase%Snake%time::=_%"
set "keyFile=%tempFileBase%_key.txt"
set "cmdFile=%tempFileBase%_cmd.txt"
set "gameLock=%tempFileBase%_gameLock.txt"
set "gameLog=%tempFileBase%_gameLog.txt"
set "signal=%tempFileBase%_signal.txt"
set "saveLoc=%userprofile%\Snake"
set "userPref=%saveLoc%\SnakeUserPref.txt"
set "hiFile=%saveLoc%\Snake!growth!Hi"


::------------------------------------------
:: Lock this game session and launch.
:: Loop back and try a new session if failure.
:: Cleanup and exit when finished

call :launch 7>"%gameLock%" || goto :getSession
del "%tempFileBase%*"
exit /b


::------------------------------------------
:launch the game and the controller

call :fixLogs
copy nul "%keyFile%" >nul
copy nul "%cmdFile%" >nul
start "" /b cmd /c ^""%~f0" startController 9^>^>"%keyFile%" 8^<"%cmdFile%" 2^>nul ^>nul^"
cmd /c ^""%~f0" startGame 9^<"%keyFile%" 8^>^>"%cmdFile%" ^<nul^"
echo(


::--------------------------------------------------------------
:: Upon exit, wait for the controller to close before returning

:close
2>nul (>>"%keyFile%" call )||goto :close
if not exist "%~dp0CursorPos.exe" (
  echo Game play can be improved by installing
  echo Aacini's CursorPos.exe, available at
  echo http://goo.gl/hr6Kkn
  echo(
  echo %cmdcmdline%|find /i "%~f0">nul&&pause
)
exit /b 0


::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:game
title %~nx0
cls

::---------------------------------------
:: Playfield size
:: max playing field: (width-2)*(height-2) <= 1365

set "width=40"   max=99
set "height=25"  max=99

::----------------------------
:: resize the console window

set /a cols=width+1, lines=height+10, area=(width-2)*(height-2)
if %area% gtr 1365 (
  echo ERROR: Playfield area too large
  %sendCmd% quit
  exit
)
if %lines% lss 14 set lines=14
if %cols% lss 46 set cols=46
mode con: cols=%cols% lines=%lines%


::----------------------------
:: define variables

set "configOptions=diffCode difficulty growth moveKeys up down left right"
set "configOptionCnt=9"

set "moveKeys=4"

set "up=W"
set "down=S"
set "left=A"
set "right=D"
set "pause=P"

set "space= "
set "bound=#"
set "food=+"
set "head=@"
set "body=O"
set "death=X"

set "growth=1"

if exist "%userPref%" for /f "usebackq delims=" %%V in ("%userPref%") do set "%%V"

set "spinner1=-"
set "spinner2=\"
set "spinner3=|"
set "spinner4=/"
set "spinner= spinner1 spinner2 spinner3 spinner4 "

set "delay1=20"
set "delay2=15"
set "delay3=10"
set "delay4=7"
set "delay5=5"
set "delay6=3"

set "desc1=Sluggard"
set "desc2=Crawl"
set "desc3=Slow"
set "desc4=Normal"
set "desc5=Fast"
set "desc6=Insane"

set "spinnerDelay=3"

set /a "width-=1, height-=1"

:: define LF as a Line Feed (newline) character
set ^"LF=^

^" Above empty line is required - do not remove

:: define CR as a Carriage Return character
for /f %%A in ('copy /Z "%~dpf0" nul') do set "CR=%%A"

:: define BS as a BackSpace character
for /f %%A in ('"prompt $H&for %%B in (1) do rem"') do set "BS=%%A"

set "upper=A B C D E F G H I J K L M N O P Q R S T U V W X Y Z"
set "invalid=*~="


::---------------------------
:: define macros

if exist "%~dp0CursorPos.exe" (
  set "cls=CursorPos 0 0"
  set "ClearLine=echo(                                   &CursorPos 0 -1"
  set "ClearPrev=CursorPos 0 -0&echo(                                   "
) else (
  set "cls=cls"
  set "ClearLine="
  set "ClearPrev="
)

:: define a newline with line continuation
set ^"\n=^^^%LF%%LF%^%LF%%LF%^^"

:: setErr
:::  Sets the ERRORLEVEL to 1
set "setErr=(call)"

:: clrErr
:::  Sets the ERRORLEVEL to 0
set "clrErr=(call )"


:: sendCmd  command
:::  sends a command to the controller
set "sendCmd=>&8 echo"


:: getKey  [ValidKey]  [ValidKey...]
::: Check for keypress from the controller. Only accept a ValidKey.
::: Token delimiters and poison characters must be quoted.
::: Accept any key if no ValidKey specified.
::: Return result in Key variable. Key is undefined if no valid keypress.
set getKey=%\n%
for %%# in (1 2) do if %%#==2 (%\n%
  set key=%\n%
  set inKey=%\n%
  set keyTest=%\n%
  ^<^&9 set /p "inKey="%\n%
  if defined inKey (%\n%
    set inKey=!inKey:~0,-1!%\n%
    for %%C in (!args!) do set /a keyTest=1^&if /i !inKey! equ %%~C set key=!inKey!%\n%
  )%\n%
  if not defined keyTest set key=!inKey!%\n%
) else set args=


:: draw
:::  draws the board
set draw=%\n%
set screen=%\n%
for /l %%Y in (0,1,%height%) do set screen=!screen!!line%%Y!!LF!%\n%
set screen=!screen!Speed = !Difficulty! !replay!!LF!Growth Rate = !growth!   HighScore = !hi!!LF!Score = !score!   Time = !m!:!s!%\n%
if defined replay if not defined replayFinished (%\n%
  set screen=!screen!!LF!!LF!Press a key to abort the replay%\n%
)%\n%
%cls%^&echo(!screen!

:: test  X  Y  ValueListVar
:::  tests if value at coordinates X,Y is within contents of ValueListVar
set test=%\n%
for %%# in (1 2) do if %%#==2 (for /f "tokens=1-3" %%1 in ("!args!") do (%\n%
  for %%A in ("!line%%2:~%%1,1!") do if "!%%3:%%~A=!" neq "!%%3!" %clrErr% else %setErr%%\n%
)) else set args=


:: plot  X  Y  ValueVar
:::  places contents of ValueVar at coordinates X,Y
set plot=%\n%
for %%# in (1 2) do if %%#==2 (for /f "tokens=1-3" %%1 in ("!args!") do (%\n%
  set "part2=!line%%2:~%%1!"%\n%
  set "line%%2=!line%%2:~0,%%1!!%%3!!part2:~1!"%\n%
)) else set args=


::--------------------------------------
:: start the game
setlocal enableDelayedExpansion
if not exist "%saveLoc%\" md "%saveLoc%"
set "replay= Aborting... "
set "replayAvailable="
call :loadHighScores
call :mainMenu


::--------------------------------------
:: main loop (infinite loop)
for /l %%. in () do (

  %=== check for and process abort signal if in replay mode ===%
  if defined replay if exist "%signal%" (
    del "%signal%"
    set "replayFinished=1"
    %draw%
    echo(
    %ClearLine%
    <nul set /p "=Aborting... "
    call :purge
    for %%A in (!configOptions!) do set "%%A=!%%ASave!"
    call :mainMenu
  )

  %=== compute time since last move ===%
  for /f "tokens=1-4 delims=:.," %%a in ("!time: =0!") do set /a "t2=(((1%%a*60)+1%%b)*60+1%%c)*100+1%%d-36610100, tDiff=t2-t1"
  if !tDiff! lss 0 set /a tDiff+=24*60*60*100

  if !tDiff! geq !delay! (
    %=== delay has expired, so time for movement ===%
    set /a t1=t2

    %=== compute game time ===%
    if not defined gameStart set "gameStart=!t2!"
    set /a "gameTime=(t2-gameStart)"
    if !gameTime! lss 0 set /a "gameTime+=24*60*60*100"
    set /a "gameTime=(gameTime-pauseTime)/100, m=gameTime/60, s=gameTime%%60"
    if !m! lss 10 set "m=0!m!"
    if !s! lss 10 set "s=0!s!"

    %=== get keypress ===%
    %getKey% !keys!
    if /i !key! equ !pause! (

      %=== pause game ===%
      echo(
      call :ask "PAUSED - Press a key to continue..."
      %ClearPrev%
      %sendCmd% go
      for /f "tokens=1-4 delims=:.," %%a in ("!time: =0!") do set /a "t2=(((1%%a*60)+1%%b)*60+1%%c)*100+1%%d-36610100, tDiff=t2-t1"
      if !tDiff! lss 0 set /a tDiff+=24*60*60*100
      set /a pauseTime+=tDiff

    ) else (

      %=== establish direction ===%
      if not defined replay (echo(!key!.) >>"!gameLog!"
      for %%K in (!key!) do if !moveKeys! equ 2 (
        set /a "xDiff=xTurn%%K*!yDiff!, yDiff=yTurn%%K*!xDiff!"
      ) else if "!%%KAxis!" neq "!axis!" (
        set /a "xDiff=xDiff%%K, yDiff=yDiff%%K"
        set "axis=!%%KAxis!"
      )

      %=== erase the tail ===%
      set "TX=!snakeX:~-2!"
      set "TY=!snakeY:~-2!"
      set "snakeX=!snakeX:~0,-2!"
      set "snakeY=!snakeY:~0,-2!"
      %plot% !TX! !TY! space

      %=== compute new head location and attempt to move ===%
      set /a "X=PX+xDiff, Y=PY+yDiff"
      set "X= !X!"
      set "Y= !Y!"
      set "X=!X:~-2!"
      set "Y=!Y:~-2!"
      (%test% !X! !Y! playerSpace) && (

        %=== move successful ===%

        %=== remove the new head location from the empty list ===%
        for %%X in ("!X!") do for %%Y in ("!Y!") do set "empty=!empty:#%%~X %%~Y=!"

        %=== eat any food that may be present ===%
        (%test% !X! !Y! food) && (
          %=== initiate growth ===%
          set /a grow+=growth

          %=== locate and draw new food ===%
          if defined replay (
            <&9 set /p "F="
          ) else (
            set /a "F=(!random!%%(emptyCnt-1))*6+1"
            (echo !F!) >>"!gameLog!"
          )
          for %%F in (!F!) do (%plot% !empty:~%%F,5! food)
        )

        if !grow! gtr 0 (
          %=== restore the tail ===%
          %plot% !TX! !TY! body
          set "snakeX=!snakeX!!TX!"
          set "snakeY=!snakeY!!TY!"
          set /a emptyCnt-=1

          %=== manage score ===%
          set /a "score+=1, grow-=1"
          if not defined replay if !score! gtr !hi! set /a "hi+=1, newHi=1"

        ) else (
          %=== add the former tail position to the empty list ===%
          set "empty=!empty!#!TX! !TY!"
        )

        %=== draw the new head ===%
        if defined snakeX (%plot% !PX! !PY! body)
        %plot% !X! !Y! head

        %=== Add the new head position to the snake strings ===%
        set "snakeX=!X!!snakeX!"
        set "snakeY=!Y!!snakeY!"
        set "PX=!X!"
        set "PY=!Y!"

        %draw%

      ) || (

        %=== failed move - game over ===%
        set "replayFinished=1"
        %plot% !TX! !TY! body
        call :spinner !PX! !PY! death
        %draw%
        if defined newHi (
          echo(
          echo New High Score - Congratulations^^!
          set "hi!diffCode!=!score!"
          copy "!gameLog!" "%hiFile%!diffCode!.txt" >nul
          >>"%hiFile%!diffCode!.txt" echo ::!score!
        )
        echo(
        %ClearLine%
        call :ask "Press a key to continue..."
        for %%A in (!configOptions!) do set "%%A=!%%ASave!"
        call :mainMenu
      )
    )
  )
)


::-------------------------------------
:getString  Prompt  Var  MaxLen
:: Prompt for a string with max lengh of MaxLen.
:: Valid keys are alpha-numeric, space, underscore, and dash
:: String is terminated by Enter
:: Backspace works to delete previous character
:: Result is returned in Var
set /a "maxLen=%3"
set "%2="
%sendCmd% prompt
<nul set /p "=%~1 "
call :purge
:getStringLoop
(%getKey% !upper! 0 1 2 3 4 5 6 7 8 9 " " _ - {Enter} !BS!)
if defined key (
  if !key! equ {Enter} (
    echo(
    exit /b
  )
  if !key! neq !BS! if !maxLen! gtr 0 (
    set /a maxLen-=1
    <nul set /p "=.!BS!!key!"
    set "%2=!%2!!key!
  )
  if !key! equ !BS! if defined %2 (
    set /a maxLen+=1
    <nul set /p "=!BS! !BS!"
    set "%2=!%2:~0,-1!"
  )
)
if defined inKey %sendCmd% one
goto :getStringLoop


::-------------------------------------
:ask  Prompt  ValidKey [Validkey]...
:: Prompt for a keypress.
:: Wait until a ValidKey is pressed and return result in Key variable.
:: Token delimiters, ), and poison characters must be quoted.
%sendCmd% prompt
<nul set /p "=%~1 "
(set validKeys=%*)
(set validKeys=!validKeys:%1=!)
call :purge
:getResponse
(%getKey% !validKeys!)
if not defined key (
  if defined inKey %sendCmd% one
  goto :getResponse
)
exit /b


:purge
set "inKey="
for /l %%N in (1 1 1000) do (
  set /p "inKey="
  if "!inKey!" equ "{purged}." exit /b
)<&9
goto :purge


::-------------------------------------
:spinner  X  Y  ValueVar
set /a d1=-1000000
for /l %%N in (1 1 5) do for %%C in (%spinner%) do (
  call :spinnerDelay
  %plot% %1 %2 %%C
  %draw%
)
call :spinnerDelay
(%plot% %1 %2 %3)
exit /b


::-------------------------------------
:delay  centiSeconds
setlocal
for /f "tokens=1-4 delims=:.," %%a in ("!time: =0!") do set /a "spinnerDelay=%1, d1=(((1%%a*60)+1%%b)*60+1%%c)*100+1%%d-36610100"
:: fall through to :spinnerDelay

::-------------------------------------
:spinnerDelay
for /f "tokens=1-4 delims=:.," %%a in ("!time: =0!") do set /a "d2=(((1%%a*60)+1%%b)*60+1%%c)*100+1%%d-36610100, dDiff=d2-d1"
if %dDiff% lss 0 set /a dDiff+=24*60*60*100
if %dDiff% lss %spinnerDelay% goto :spinnerDelay
set /a d1=d2
exit /b


::-------------------------------------
:mainMenu
cls
set "loadAvailable="
echo Growth rate = !growth!
echo(
echo Main Menu:
echo(
echo   N - New game
if defined replayAvailable echo   R - Replay previous game
if defined saveAvailable   echo   S - Save a game
if exist *.snake.txt       echo   L - Load and watch a saved game&set "loadAvailable=L"

echo   C - Control options
echo   G - Graphic options
echo   Q - Quit
echo(
set "hiAvailable="
for /l %%N in (1 1 6) do if defined hi%%N (
  if not defined hiAvailable (
    echo Replay High Score:
    echo(
  )
  set "desc=!desc%%N!........"
  set "hiAvailable=!hiAvailable! %%N"
  echo   %%N - !desc:~0,8! !hi%%N!
)
if defined hiAvailable echo(
set "keys=N C G Q !hiAvailable! !replayAvailable! !saveAvailable! !loadAvailable!"
call :ask ">" !keys!
if /i !key! equ Q (
  %sendCmd% quit
  cls
  exit
)
if /i !key! equ N (
  set "replay="
  set "replayAvailable=R"
  set "saveAvailable=S"
  goto :initialize
)
if /i !key! equ S (
  if defined replayAvailable (
    call :ask "HighScore # or P for Previous:" !hiAvailable! P
  ) else (
    call :ask "HighScore #:" !hiAvailable!
  )
  echo !key!
  if /i !key! equ P (set "src=!gameLog!") else set "src=%hiFile%!key!.txt"
  call :getString "Save file name:" file 20
  copy "!src!" "!file!.snake.txt"
  call :ask "Press a key to continue..."
)
if /i !key! equ L (
  call :getString "Load file name:" file 20
  if exist "!file!.snake.txt" (
    set "replay=!file!.snake.txt"
    goto :initialize
  )
  echo Error: File "!file!.snake.txt" not found
  call :ask "Press a key to continue..."
)
if /i !key! equ R (
  set "replay=!gameLog!"
  goto :initialize
)
if !key! geq 1 if !key! leq 6 (
  set "replay=%hiFile%!key!.txt"
  goto :initialize
)
if /i !key! equ C call :controlOptions
if /i !key! equ G call :graphicOptions
goto :mainMenu


::-------------------------------------
:controlOptions
cls
set "keys={Enter} T L R P"
if !moveKeys! equ 4 set "keys=!keys! U D"
                    echo Control Options:
                    echo(
                    echo   T - Type... = !moveKeys! keys
                    echo(
                    echo   L - Left... = !left!
                    echo   R - Right.. = !right!
if !moveKeys! equ 4 echo   U - Up..... = !up!
if !moveKeys! equ 4 echo   D - Down... = !down!
                    echo(
                    echo   P - Pause.. = !pause!
                    echo(
                    echo   {Enter} - Return to Main Menu
                    echo(
call :ask ">" !keys!
if !key! equ {Enter} goto :saveUserPrefs
if /i !key! equ T (
  if !moveKeys! equ 2 (set "moveKeys=4") else set "moveKeys=2"
  goto :controlOptions
)
set "option= LLeft RRight UUp DDown PPause"
for /f %%O in ("!option:* %key%=!") do (
  call :ask "Press a key for %%O:"
  for %%K in (0 1 2) do if "!key!" equ "!invalid:~%%K,1!" goto :controlOptions
  for %%C in (!upper!) do set "key=!key:%%C=%%C!"
  set "%%O=!key!"
)
goto :controlOptions


::-------------------------------------
:graphicOptions
cls
echo Graphic Options:
echo(
echo   B - Border...... = !bound!
echo   E - Empty space. = !space!
echo   H - snake Head.. = !head!
echo   S - Snake body.. = !body!
echo   F - Food........ = !food!
echo   D - Death....... = !death!
echo(
echo   G - Growth rate. = !growth!
echo(
echo   {Enter} - Rturn to Main Menu
echo(
call :ask ">" B E H S F D G {Enter}
if !key! equ {Enter} goto :saveUserPrefs
if /i !key! equ G (
  call :ask "Press a digit for growth rate (0 = 10)" 0 1 2 3 4 5 6 7 8 9
  if !key! equ 0 set "key=10"
  set "growth=!key!"
  call :loadHighScores
) else (
  set "option=-BBorder:bound:-EEmpty Space:space:-HSnake Head:head:-SSnake Body:body:-FFood:food:-DDeath:death:"
  for /f "tokens=1,2 delims=:" %%A in ("!option:*-%key%=!") do (
    call :ask "Press a key for %%A"
    for %%K in (0 1 2) do if "!key!" equ "!invalid:~%%K,1!" goto :graphicOptions
    set "%%B=!key!"
  )
)
goto :graphicOptions


::------------------------------------
:saveUserPrefs
(for %%V in (moveKeys up down left right space bound food head body death pause growth) do echo %%V=!%%V!) >"%userPref%"
exit /b


::-------------------------------------
:initialize
cls
if defined replay (
  echo Replay Speed Options:
) else (
  echo Speed Options:
)
echo                       delay
echo    #   Description  (seconds)
echo   ---  -----------  ---------
for /l %%N in (1 1 6) do (
  set "delay=0!delay%%N!"
  set "desc=!desc%%N!           "
  echo    %%N   !desc:~0,11!    0.!delay:~-2!
)
echo(
call :ask "Pick a speed (1-6):" 1 2 3 4 5 6
set "difficulty=!desc%key%!"
set "delay=!delay%key%!"
set "diffCode=%key%"
echo %key% - %difficulty%
echo(
<nul set /p "=Initializing."
set "axis=X"
set "xDiff=+1"
set "yDiff=+0"
set "empty="
set /a "PX=1, PY=height/2, FX=width/2+1, FY=PY, score=0, emptyCnt=0, t1=-1000000"
set "gameStart="
set "m=00"
set "s=00"
set "snakeX= %PX%"
set "snakeY= %PY%"
set "snakeX=%snakeX:~-2%"
set "snakeY=%snakeY:~-2%"
for /l %%Y in (0 1 %height%) do (
  <nul set /p "=."
  set "line%%Y="
  for /l %%X in (0,1,%width%) do (
    set "cell="
    if %%Y equ 0        set "cell=%bound%"
    if %%Y equ %height% set "cell=%bound%"
    if %%X equ 0        set "cell=%bound%"
    if %%X equ %width%  set "cell=%bound%"
    if %%X equ %PX% if %%Y equ %PY% set "cell=%head%"
    if not defined cell (
      set "cell=%space%"
      set "eX= %%X"
      set "eY= %%Y"
      set "empty=!empty!#!eX:~-2! !eY:~-2!"
      set /a emptyCnt+=1
    )
    if %%X equ %FX% if %%Y equ %FY% set "cell=%food%"
    set "line%%Y=!line%%Y!!cell!"
  )
)
for %%A in (!configOptions!) do set "%%ASave=!%%A!"
set "replayFinished="
if defined replay (
  %sendCmd% replay
  %sendCmd% !replay!
  call :waitForSignal
  set "replay=(REPLAY at !difficulty!)"
  set "read=1"
  <&9 (
    for /l %%N in (1 1 !configOptionCnt!) do if defined read (
      set /p "ln="
      if "!ln!" equ "END" (set read=) else set "!ln!"
    )
  )
  set "keys="
  set "hi=0"
  for /f "delims=:" %%A in ('findstr "^::" "%hiFile%!diffCode!.txt" 2^>nul') do set "hi=%%A"
  (%draw%)
  call :delay 100
) else (
  if defined hi%diffCode% (set "hi=!hi%diffCode%!") else set "hi=0"
  (%draw%)
  >"!gameLog!" ( 
    for %%A in (!configOptions!) do (echo %%A=!%%A!)
    (echo END)
  )
  echo(
  if !moveKeys! equ 4 (
    echo Controls: !up!=up !down!=down !left!=left !right!=right !pause!=pause
  ) else (
    echo Controls: !left!=left !right!=right !pause!=pause
  )
  echo Avoid running into yourself (!body!!body!!head!^) or wall (!bound!^)
  echo Eat food (!food!^) to grow.
  echo(
  call :ask "Press a key to start..."
  %sendCmd% go
)
set "pauseTime=0"
set "xDiff!up!=+0"
set "xDiff!down!=+0"
set "xDiff!left!=-1"
set "xDiff!right!=+1"
set "yDiff!up!=-1"
set "yDiff!down!=+1"
set "yDiff!left!=+0"
set "yDiff!right!=+0"
set "!up!Axis=Y"
set "!down!Axis=Y"
set "!left!Axis=X"
set "!right!Axis=X"
set "xTurn!left!=1"
set "xTurn!right!=-1"
set "yTurn!left!=-1"
set "yTurn!right!=1"
set "playerSpace=!space!!food!"
set ^"keys="!left!" "!right!" "!pause!"^"
set "newHi="
set "grow=0"
if !moveKeys! equ 4 set ^"keys=!keys! "!up!" "!down!"^"
cls
exit /b


::-------------------------------------
:waitForSignal
if not exist "%signal%" goto :waitForSignal
del "%signal%"
exit /b


::-------------------------------------
:loadHighScores
set "saveAvailable="
for /l %%N in (1 1 6) do (
  set "hi%%N="
  for /f "delims=:" %%A in ('findstr "^::" "%hiFile%%%N.txt" 2^>nul') do (
    set "hi%%N=%%A"
    set "saveAvailable=S"
  )
)
exit /b


::-------------------------------------
:fixLogs
setlocal enableDelayedExpansion
for %%F in (*.snake) do (
  ren "%%F" "%%F.txt"
  call :fixLog "%%F.txt"
)
pushd "%SaveLoc%"
for /f "delims=" %%F in ('dir /b SnakeHi*.txt 2^>nul') do (
  set "file=%%~nF"
  set "file=Snake1Hi!file:~-1!.txt"
  ren "%%F" "!file!"
  call :fixLog "!file!"
)
popd
exit /b

:fixLog  filePath
>"%~1.new" (
  <"%~1" (
    for %%A in (diffCode difficulty moveKeys up down left right) do (
      set /p "val="
      (echo %%A=!val!)
    )
  )
  (echo growth=1)
  (echo END)
  more +7 "%~1"
)
move /y "%~1.new" "%~1" >nul
exit /b


::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:controller
:: Detects keypresses and sends the information to the game via a key file.
:: The controller has various modes of input that are activated by commands sent
:: from the game via a cmd file.
::
:: Modes:
::
::   hold   - No input, wait for command
::
::   go     - Continuously get/send key presses
::
::   prompt - Send {purged} marker to allow game to purge input buffer, then
::            get/send a single key press and hold
::
::   one    - Get/send a single key press and hold
::
::   replay - Copy a game log to the key file. The next line in cmd file
::            specifies name of log file to copy. During replay, the controller
::            will send an abort signal to the game if a key is pressed.
::
::   quit   - Immediately exit the controller process
::
:: As written, this routine incorrectly reports ! as ), but that doesn't matter
:: since we don't need that key. Both <CR> and Enter key are reported as {Enter}.
:: An extra character is appended to the output to preserve any control chars
:: when read by SET /P.

setlocal enableDelayedExpansion
for /f %%a in ('copy /Z "%~dpf0" nul') do set "CR=%%a"
set "cmd=hold"
set "inCmd="
set "key="
for /l %%. in () do (
  if "!cmd!" neq "hold" (
    for /f "delims=" %%A in ('xcopy /w "%~f0" "%~f0" 2^>nul') do (
      if not defined key set "key=%%A"
    )
    set "key=!key:~-1!"
    if !key! equ !CR! set "key={Enter}"
  )
  <&8 set /p "inCmd="
  if defined inCmd (
    if !inCmd! equ quit exit
    set "cmd=!inCmd!"
    if !inCmd! equ replay (
      <&8 set /p "file="
      type "!file!" >&9
      copy nul "%signal%"
    )
    set "inCmd="
  )
  if defined key (
    if "!cmd!" equ "prompt" (echo {purged}.)
    if "!cmd!" equ "replay" (
      copy nul "%signal%" >nul
      (echo {purged}.)
      set "cmd=go"
    ) else (echo(!key!.)
    if "!cmd!" neq "go" set "cmd=hold"
    set "key="
  )>&9
)