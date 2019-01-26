:: WUMPUS.BAT Version 1.0
::
::::BgetDescription#Hunt The Wumpus- batch version.
::::BgetAuthor#DaveBenham
::::BgetCategory#game
::::Bgettags#port
:: "Hunt The Wumpus" game by Gregory Yob, circa 1972
::
:: Ported to Windows batch by Dave Benham, based on original BASIC code found at
:: http://www.atariarchives.org/bcc1/showpage.php?page=247
::
:: This port hss two modes of operation - Original, and Enhanced. The game
:: will prompt you to choose, unless E or O is provided as the first argument
:: on the command line used to launch the game.
::
:: The Original mode is intended to be a faithful emulation of the original game.
:: It uses the exact same room layout, rules, messages, and text spacing as
:: the original, except for a slightly different spacing when listing tunnels.
::
:: The Enhanced mode has the following changes:
::   - Text is now mixed case.
::   - Many messages are modified, and a few extra line feeds are added.
::   - Streamlined turn entry: each move or shot is entered on a single line.
::   - Rooms are randomly assigned unique numbers. You cannot re-use maps when
::     you start a new game.
::   - There are fewer restrictions during initial random placement - a single
::     room may contain a bat, a pit, and the Wumpus.
::   - If you walk into a room with both a bat and a pit, the bat will snatch
::     you before you fall.
::   - A bat snatch that drops you in the Wumpus room is no longer instant death;
::     instead you will "bump the Wumpus", the same as if you walked into the room.
::   - Arrows will never randomly select a room. If the arrow attempts to travel
::     to an invalid location, or attempts to back-track, then it will always
::     result in a miss-fire and player death.
::   - A Quit option has been added at the end of each game.
::
:: There is a debug mode that can be enabled by providing D as a command line
:: argument when launching. The debug mode will list the room numbers of all
:: hazards at the start of each turn. It will also list the path taken by the
:: arrow. Debug works for both Original and Enhanced modes.
::
:: History:
::   2016-06-29 Version 1.0 - Initial release
::

:: Original Instructions
::::WELCOME TO 'HUNT THE WUMPUS'
::::  THE WUMPUS LIVES IN A CAVE OF 20 ROOMS. EACH ROOM
::::HAS 3 TUNNELS LEADING TO OTHER ROOMS. (LOOK AT A
::::DODECAHEDRON TO SEE HOW THIS WORKS-IF YOU DON'T KNOW
::::WHAT A DODECAHEDRON IS, ASK SOMEONE)
::::
::::     HAZARDS:
:::: BOTTOMLESS PITS - TWO ROOMS HAVE BOTTOMLESS PITS IN THEM
::::     IF YOU GO THERE, YOU FALL INTO THE PIT (& LOSE^!)
:::: SUPER BATS - TWO OTHER ROOMS HAVE SUPER BATS. IF YOU
::::     GO THERE, A BAT GRABS YOU AND TAKES YOU TO SOME OTHER
::::     ROOM AT RANDOM. (WHICH MIGHT BE TROUBLESOME)
::::
::::     WUMPUS:
:::: THE WUMPUS IS NOT BOTHERED BY THE HAZARDS (HE HAS SUCKER
:::: FEET AND IS TOO BIG FOR A BAT TO LIFT).  USUALLY
:::: HE IS ASLEEP. TWO THINGS WAKE HIM UP: YOUR ENTERING
:::: HIS ROOM OR YOUR SHOOTING AN ARROW.
::::     IF THE WUMPUS WAKES, HE MOVES (P=.75) ONE ROOM
:::: OR STAYS STILL (P=.25). AFTER THAT, IF HE IS WHERE YOU
:::: ARE, HE EATS YOU UP (& YOU LOSE^!)
::::
::::     YOU:
:::: EACH TURN YOU MAY MOVE OR SHOOT A CROOKED ARROW
::::   MOVING: YOU CAN GO ONE ROOM (THRU ONE TUNNEL)
::::   ARROWS: YOU HAVE 5 ARROWS. YOU LOSE WHEN YOU RUN OUT.
::::   EACH ARROW CAN GO FROM 1 TO 5 ROOMS. YOU AIM BY TELLING
::::   THE COMPUTER THE ROOM#S YOU WANT THE ARROW TO GO TO.
::::   IF THE ARROW CAN'T GO THAT WAY (IE NO TUNNEL) IT MOVES
::::   AT RAMDOM TO THE NEXT ROOM.
::::     IF THE ARROW HITS THE WUMPUS, YOU WIN.
::::     IF THE ARROW HITS YOU, YOU LOSE.
::::
::::    WARNINGS:
::::     WHEN YOU ARE ONE ROOM AWAY FROM WUMPUS OR HAZARD,
::::    THE COMPUTER SAYS:
:::: WUMPUS-  'I SMELL A WUMPUS'
:::: BAT   -  'BATS NEARBY'
:::: PIT   -  'I FEEL A DRAFT'
::::

:: Enhanced Instructions
:::!
:::!Welcome to "Hunt the Wumpus", by Gregory Yob
:::!Ported to Windows batch, with minor enhancements, by Dave Benham
:::!
:::!Your goal is to slay the Wumpus, a beast that lives in a cave of 20 rooms.
:::!Each room has 3 tunnels leading to other rooms. (Look at a dodecahedron to
:::!see how this works - If you don't know what a dodecahedron is, then ask
:::!someone^!). At the beginning of the game, each room is randomly assigned
:::!a unique number from 1 to 20.
:::!
:::!Hazards:
:::!  Bottomless Pits - Two rooms contain bottomless pits. Enter one, and you
:::!     will fall endlessly - a fate worse than death^!
:::!  Super Bats - Two rooms have super bats that will transport you to some
:::!     other room at random, which could be troublesome. But if you encounter
:::!     a bat in a room with a pit, then the bat will whisk you away before you
:::!     fall to your doom - unless the new room happens to also have a pit^!
:::!
:::!Wumpus: One room has the fearsome Wumpus. The Wumpus is not bothered by
:::!     hazards - his sucker feet save him from the pit, and he is too heavy
:::!     for the bats to move. The Wumpus normally sleeps peacefully. But if you
:::!     stumble into him, or if you fire an arrow, then he awakens momentarily,
:::!     with a 75% chance that he will move to a neighboring room. If he is
:::!     alone in the room with you at the end of the turn, then he realizes he
:::!     is hungry, and devours you. Not a pleasant way to die^!
:::!
:::!You: Each turn you have two options:
:::!   - Move by entering "M #", where # is the room number of one of the
:::!     neighboring rooms.
:::!   - Shoot one of your crooked arrows by entering "S # ...". You may enter
:::!     up to 5 room numbers. The arrow will turn corners to follow your entered
:::!     path. But if you give it an invalid direction, or if it reverses course,
:::!     then it back fires and you die. If the arrow hits the Wumpus - you win^!
:::!     Run out of arrows and you lose - you would eventually be eaten anyway^!
:::!
:::!Warnings: At the start of each turn, the computer will warn you if there is a
:::!hazard in a room next door. Any of the following warning messages may appear:
:::!  Wumpus - "You smell a Wumpus^!"
:::!  Bat    - "You hear flapping wings!^"
:::!  Pit    - "You feel a draft"
:::!
:::!Happy hunting^!

@echo off
setlocal enableDelayedExpansion
set "version=%~1"
set "dbug="
if /i "%~1" equ "D" set dbug=1
if /i "%~2" equ "D" set dbug=1
goto :start

:getVersion
set /p "version=Enhanced or Original version (E,O)? "

:start
if /i "!version!" equ "E" (
  set "title=Hunt the Wumpus"
  set "helpQuery=Would you like instructions (Y,N)? "
  set "locateMsg=You are in room  "
  set "pathMsg=Tunnels lead to  "
  set "actionQuery=Next action (M #, or S # [#]...)? "
  set "badAction=Invalid action, try again."
  set "badMove=You cannot go there."
  set "miss=Missed"
  set "loseMsg=Ha Ha Ha - YOU LOSE^!"
  set "winMsg=Hee Hee Hee - YOU WON^! But the Wumpus'll getcha next time^!^!"
  set "warnWumpus=You smell a Wumpus^!"
  set "warnBat=You hear flapping wings^!"
  set "warnPit=You feel a draft"
  set "bumpWumpus=...OOPS^! You bumped a Wumpus^!"
  set "batSnatch=ZAP--Super Bat snatch^! You go for a ride^!"
  set "pitDeath=YYYIIIIEEEE . . . You fell into a pit!"
  set "noArrows=You've run out of arrows"
  set "wumpusDeath=TSK TSK TSK- Wumpus got you^!"
  set "arrowDeath=OUCH^! You shot yourself^!"
  set "killWumpus=AHA^! You got the Wumpus^!"
  set "replayQuery=Quit, Replay same game, or New game (Q,R,N)? "
  set "helpSearch=^^:::^!"
  set "enhanced=^!"
  set "getMove=getEnhancedMove"
  set "lostCnt=0"
) else if /i "!version!" equ "O" (
  set "title=HUNT THE WUMPUS"
  set "helpQuery=INSTRUCTIONS (Y-N)?"
  set "locateMsg=YOU ARE IN ROOM  "
  set "pathMsg=TUNNELS LEAD TO  "
  set "actionQuery=SHOOT OR MOVE (S-M)?"
  set "moveQuery=WHERE TO?"
  set "badMove=NOT POSSIBLE -"
  set "shootQuery=NO. OF ROOMS(1-5)?"
  set "roomQuery=ROOM #?"
  set "badShot=ARROWS AREN'T THAT CROOKED - TRY ANOTHER ROOM"
  set "miss=MISSED"
  set "loseMsg=HA HA HA - YOU LOSE^!"
  set "winMsg=HEE HEE HEE - THE WUMPUS'LL GETCHA NEXT TIME^!^!"
  set "warnWumpus=I SMELL A WUMPUS^!"
  set "warnBat=BATS NEARBY^!"
  set "warnPit=I FEEL A DRAFT"
  set "bumpWumpus=...OOPS^! BUMPED A WUMPUS^!"
  set "batSnatch=ZAP--SUPER BAT SNATCH! ELSEWHEREVILLE FOR YOU^!"
  set "pitDeath=YYYIIIIEEEE . . . FELL IN PIT"
  set "wumpusDeath=TSK TSK TSK- WUMPUS GOT YOU^!"
  set "arrowDeath=OUCH^! ARROW GOT YOU^!"
  set "killWumpus=AHA^! YOU GOT THE WUMPUS^!"
  set "replayQuery=SAME SET-UP (Y-N)?"
  set "helpSearch=^::::"
  set "enhanced="
  set "testWumpus="
  set "getMove=getOriginalMove"
  for /l %%N in (1 1 20) do set /a "name%%N=room%%N=%%N"
  set "names= 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 "
  set "lostCnt=2"
) else goto :getVersion

cls
:help
set "input="
set /p "input=!helpQuery!"
if /i !input! equ Y (
  for /f "delims=:! tokens=*" %%A in ('findstr "!helpSearch!" "%~f0"') do echo(%%A
) else if /i !input! neq N goto :help

:: Create map
set "map1=,2,5,8,"
set "map2=,1,3,10,"
set "map3=,2,4,12,"
set "map4=,3,5,14,"
set "map5=,1,4,6,"
set "map6=,5,7,15,"
set "map7=,6,8,17,"
set "map8=,1,7,9,"
set "map9=,8,10,18,"
set "map10=,2,9,11,"
set "map11=,10,12,19,"
set "map12=,3,11,13,"
set "map13=,12,14,20,"
set "map14=,4,13,15,"
set "map15=,6,14,16,"
set "map16=,15,17,20,"
set "map17=,7,16,18,"
set "map18=,9,17,19,"
set "map19=,11,18,20,"
set "map20=,13,16,19,"

:newGame
:: Name the rooms
if defined enhanced (
  set "names= 1 2 3 4 5 6 7 8 91011121314151617181920"
  for /l %%N in (20 -1 1) do (
    set /a "a=(!random!%%%%N)*2, b=a+2"
    for %%A in (!a!) do for %%B in (!b!) do (
      set /a "name=!names:~%%A,2!"
      set /a "room%%N=name, name!name!=%%N"
      set "names=!names:~0,%%A!!names:~%%B!"
    )
  )
)

:: Place the hazards and player
call :placeItem _wumpus
call :placeItem _pit1   %enhanced% %_wumpus%  !
call :placeItem _pit2   %_pit1%    %enhanced% %_wumpus% !
call :placeItem _bat1   %enhanced% %_wumpus%  %_pit1%   %_pit2% !
call :placeItem _bat2   %_bat1%    %enhanced% %_wumpus% %_pit2% %_bat1% !
call :placeItem _player %_wumpus%  %_pit1%    %_pit2%   %_bat1% %_bat2%

:replayGame
set /a "wumpus=_wumpus, pit1=_pit1, pit2=_pit2, bat1=_bat1, bat2=_bat2, player=_player, arrowCnt=5"

if defined enhanced echo(
echo(!title!

:mainLoop
call :showLocation
call :%getMove%
call :processAction && goto :mainLoop
if errorlevel 1 (
  echo(!winMsg!
) else (
  echo(!loseMsg!
)

:endGame
set "input="
set /p "input=!replayQuery!"
if defined enhanced (
  if /i !input! equ R goto :replayGame
  if /i !input! equ N goto :newGame
  if /i !input! equ Q exit /b
) else (
  if /i !input! equ Y goto :replayGame
  if /i !input! equ N goto :newGame
)
goto :endGame

:showLocation
echo(
set "msg= "
for %%A in (!map%player%!) do (
  call :reportHazard %%A wumpus warnWumpus
  call :reportHazard %%A pit1 warnPit
  call :reportHazard %%A pit2 warnPit
  call :reportHazard %%A bat1 warnBat
  call :reportHazard %%A bat2 warnBat
)
for %%A in (%msg%) do echo(!%%A!
if defined dbug call :dbug
echo(!locateMsg!!room%player%!
set "msg=!pathMsg!"
for %%A in (!map%player%!) do set "msg=!msg!!room%%A!    "
echo(!msg!
echo(
exit /b

:reportHazard  location  item  msg
if %1 equ !%2! (
  if defined enhanced (
    set "msg=!msg: %3=! %3"
  ) else echo(!%3!
)
exit /b

:dbug
set "msg="
for %%I in (wumpus pit1 pit2 bat1 bat2) do for %%N in (!%%I!) do set "msg=!msg!%%I=!room%%N! "
echo(!msg!
exit /b

:retryGetEnhancedMove
echo(!badAction!

:getEnhancedMove
set "action=x"
set /p "action=!actionQuery!"
for /f "tokens=1-7" %%A in ("!action!") do (
  if "%%~B" equ "" goto :retryGetEnhancedMove
  if /i "%%~A" neq "M" if /i "%%~A" neq "S" goto :retryGetEnhancedMove
  if /i "%%~A" equ "S" if /i "%%~G" neq ""  goto :retryGetEnhancedMove
  if /i "%%~A" equ "M" if /i "%%~C" neq ""  goto :retryGetEnhancedMove
)
exit /b

:getOriginalMove
set "action="
set /p "action=!actionQuery!"
if /i !action! equ M goto :move
if /i !action! equ S goto :shoot
goto :getOriginalMove

:move
set "input="
set /p "input=!moveQuery!"
if "!names: %input% =!" equ "!names!" goto :move
set "test=,%player%!map%player%!"
if "!test:%input%=!" equ "!test!" <nul set /p "=!badMove!" & goto :move
set "action=%action% %input%"
exit /b

:shoot
set "cnt="
set "test= 1 2 3 4 5 "
set /p "cnt=!shootQuery!"
if "!test: %cnt% =!" equ "!test!" goto :shoot
set /a "prev2=prev1=0"

:getPath
set "input="
set /p "input=!roomQuery!"
if "!names: %input% =!" equ "!names!" goto :getPath
if "!input!" equ "!prev2!" echo(!badShot!&goto :getPath
set "action=!action! !input!"
set /a "prev2=prev1, prev1=input, cnt-=1"
if !cnt! leq 0 exit /b
goto :getPath
exit /b

:processAction
for /f "tokens=1*" %%A in ("!action!") do (
  if /i %%A equ M ( %= Move =%
    set "test=,%player%!map%player%!"
    for %%a in (",!name%%B!,") do if "!test:%%~a=!" equ "!test!" echo(!badMove!&exit /b 0
    set "player=!name%%B!"
    if defined enhanced set "testWumpus=1"
    if !player! equ !wumpus! set "testWumpus=" & call :bumpWumpus
    if !player! equ !bat1!   call :batSnatch bat1
    if !player! equ !bat2!   call :batSnatch bat2
    if !player! equ !pit1!   echo(!pitDeath!&exit /b -1
    if !player! equ !pit2!   echo(!pitDeath!&exit /b -1
    if !player! equ !wumpus! if defined testWumpus call :bumpWumpus
  ) else (          %= Shoot =%
    set /a "cnt=0, prev2=prev1=arrow=player, arrowCnt-=1"
    for %%N in (%%B) do for %%A in (!arrow!) do (
      set "lost="
      for %%a in (",!name%%N!,") do if "!map%%A:%%~a=!" equ "!map%%A!" set "lost=1"
      set /a "prev2=prev1, prev1=arrow, cnt+=1"
      if !cnt! gtr !lostCnt! if "!name%%N!" equ "!prev2!" set "lost=1"
      if defined lost (
        if defined enhanced (set "arrow=!player!") else call :randomArrow
      ) else set /a "arrow=!name%%N!"
      if defined dbug echo(prev2=!prev2! prev1=!prev1! lost=!lost! arrow=!arrow!
      if !arrow! equ !wumpus! echo(!killWumpus!&exit /b 1
      if !arrow! equ !player! echo(!arrowDeath!&exit /b -1
    )
    echo(!miss!
    call :wakeWumpus
  )
  if !player! equ !wumpus! echo(!wumpusDeath!&exit /b -1
  if !arrowCnt! leq 0 (
    if defined enhanced echo(!noArrows!
    exit /b -1
  )
)
exit /b 0

:randomArrow
set /a "N=!random!%%3"
for /f "tokens=1-3 delims=," %%0 in ("!map%arrow%!") do set /a "arrow=%%%N%"
exit /b

:batSnatch item
echo(!batSnatch!
call :placeItem %1 %bat1% %bat2%
set "player=!%1!"
exit /b

:bumpWumpus
echo(!bumpWumpus!

:wakeWumpus
set /a "N=!random!%%4"
for /f "tokens=1-4 delims=," %%0 in ("%wumpus%!map%wumpus%!") do set "wumpus=%%%N%"
exit /b

:placeItem item check [check1] [check2] [check3] [check4] [check5]
set /a "%1=!random!%%20+1"
if "!%1!" equ "%2" goto :placeItem
if "!%1!" equ "%3" goto :placeItem
if "!%1!" equ "%4" goto :placeItem
if "!%1!" equ "%5" goto :placeItem
if "!%1!" equ "%6" goto :placeItem
exit /b