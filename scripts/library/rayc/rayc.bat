::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: Dos Batch Raycast ver. 0.5.3 BETA  by Francesco Poscetti aka einstein1969
::
::--------------------------------------------------------------------------
::
:: Ref: http://www.dostips.com/forum/viewtopic.php?f=3&t=5824
::
:: Thanks to Aacini, foxidrive, dbenham, penpen, jeb, neorobin, Liviu, aGerman
::
:: Tested on Windows 7
::
:: Changelog
::
:: ver. 0.5.3   2016-04-03 einstein1969
::  - Disabled parallel processing for a cuncurrent access problem see:
::    http://www.dostips.com/forum/viewtopic.php?f=3&t=7053
::
:: ver. 0.5.2   2016-03-22 einstein1969
::  - Add new SIN(x) calculus using Aacini method. Improved speed (~20%)
::
:: ver. 0.5.1   2015-10-17 einstein1969
::  - Add choice emulation. Now it should run on XP platform. Not tested.
::
:: ver. 0.5.0   2015-10-16 einstein1969
::  - Implemented DDA algorithm. Improved speed (~40%)
::  - Moved output of execution time on title + Add FPS counter.
::  - "H" now display Help.
::  - "M" now toggle the view of the Map
::  - Improved speed by clear the environment + other optimization (~10-15% on reference system)
::  - Map more readable.
::  - revert "reduce CALLs and rearrange code to minimize CALL distance" for easy code develop. TODO later. See ver. 0.4.x
::  - revert fast 3D clipping
::
:: ver. 0.4.1   2015-08-30  dbenham
::  - Limit number of processes to maximum of 8
::  - Move Transpose inside of :raycast
::  - Optionally use Aacini's CursorPos.exe to eliminate screen flicker
::    Implementation is the same as for SNAKE.BAT
::    Code is available at http://goo.gl/hr6Kkn
::
:: ver. 0.4     2015-08-30  dbenham
::  - Many minor optimizations:
::      - consolidate and minimize SET /A statements
::      - main loop is now an endless FOR /L loop running in a child process
::      - reduce CALLs and rearrange code to minimize CALL distance
::      - remove dynamic title
::  - Nearly instantaneous drawing of 2D map
::  - Player character now indicates orientation
::  - Implemented parallel processing of ray cast partitions based on NUMBER_OF_PROCESSORS
::  - "Z" now toggles between Old and New rendering algorithm
::  - "Q" quits the program
::  - New (fast) rendering now 2-3 times faster on quad-core machine (4-5 frames per second)
::  - Old (slow) rendering now 4+ times faster on quad-core machine  (1-2 frames per second)
::
:: ver. 0.3     jeb  2015-08-25
::  - Improved speed by inlining the Sinus calculation (~15% on reference system)
::  - Improved speed by direct calculating the next gridX/Y coordinates (~60%)
::
:: ver. 0.2     20/08/2015
::  - Not clear the screen until next.
::  - Added moviment on left/ritgh and key "K" "L" for rotate.
::  - Fixed bug on calculate distance
::  - Added partial clipping on Z (Distance)
::
:: ver. 0.1     04/07/2015
::  - New faster algorithm. Not optimizated for now.
::  - Use transpose trick of penpen
::  - Use new set of character for better visualize and fast antialiasing.
::  - Detect when a player slamming against the wall.
::  - You can use WASD for move!
::  - You can view the player in the MAP.
::  - You can modify the MAP more easily.
::
:: Ver. 0.01b   10/08/2014 
::  - Added temporary dir and use swapout mechanism for manage env.
::
:: Ver. 0.01a   09/08/2014
::  - Initial version + some fixes
::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

::::BgetDescription#Raycast implementation in pure batch
::::BgetAuthor#Einstein1969
::::BgetCategory#library

@echo off
:: Multithread dispatcher
if "%~1" neq "" goto %1

setlocal EnableDelayedExpansion

:: Initialize some stuff...
call :Init

:: Load the Map grid. 1/2=wall ./0=empty 9=player position

Set /A MapsizeX=33, MapsizeY=10, y=1, MapWidth=MapsizeX+1, MapsizeX-=1

for %%D in (
"1212121212...2121212121.........."
"2........1...1........2..121....."
"1........21212....121.1.2...2...."
"2..................1..21.....1..."
"1...9.........................2.."
"2....1...12121................2.."
"1....2...2...2.....1..11.....1..."
"1....1...1...1....12..2.2...2...."
"2....2...2...2........1..121....."
"1212212121...1212121212.........."
) do (
  set Map[!y!]=%%~D
  for %%Y in (!y!) do for /L %%X in (0,1,!MapSizeX!) do (
    if "!Map[%%Y]:~%%X,1!" equ "9" (
      set /A nx=%%X+1
      for %%Z in (!nx!) do set Map[!y!]=!Map[%%Y]:~0,%%X!.!Map[%%Y]:~%%Z!
      set /A Playerx = %%X, Playery = !y!
      set nx=
    ) 
  )
  set /A y+=1
)
set y=

:: setting player position
set /A Playerx*=MulPlayer, Playery*=MulPlayer, OldPlayerx=Playerx, OldPlayery=Playery

:: prepare map for draw
call :prepareMap

:: Prepare for multithread engines
call :InitEngines

"%COMSPEC%" /d /v:on /c "%~f0" :mainLoop
exit /b

:mainLoop
for /l %%. in () do (
  set /a gridX=Playerx/MulPlayer, gridy=Playery/MulPlayer
  for %%X in (!gridx!) do for %%Y in (!gridy!) do if "!Map[%%Y]:~%%X,1!" geq "1" (
    set /A Playerx = OldPlayerx, Playery = OldPlayery
    set /P ".=%BEL%"<nul
  ) else (

    set /A "StepY=%SIN(x):x=!Angle! * PI / 180%, StepX=%SIN(x):x=PI_div_2-!Angle! * PI / 180%"

    call :raycast

    %= Draw Map =%
    if "!SeeMap!" equ "1" (
      set /a "pos=(PlayerY/MulPlayer-1)*mapWidth+PlayerX/MulPlayer, pos2=pos+1"
      for /f "tokens=1-3" %%1 in ("!pos! !pos2! !Angle!") do echo !map:~0,%%1!!P%%3!!map:~%%2,-1!
      set pos=&set pos2=
    )

    echo PlayerX/Y:!Playerx!/!Playery! OldplayerX/Y:!oldplayerX!/!oldplayerY!%space%& rem FastRotate=!Fastrotate!
    echo !method!: Angle:!Angle! GridX/Y:!gridx!/!gridy! StepX/Y=!StepX!/!StepY! wait=!wait!%space%

    set /A OldPlayerx = Playerx, OldPlayery = Playery

  )
  call :choice wksladhmfzqu >nul
  rem "%COMSPEC%\..\choice.exe" /N /C wksladhmfzqu >nul
  if errorlevel 12 (
    %= U - Redraw =%
    (call )
  ) else if errorlevel 11 (
    %= Q - Quit =%
    for /l %%N in (1 1 !childCnt!) do >"%base%%%N_job.bat.tmp" echo del "%%~f0"^&exit
    ren "%base%*_job.bat.tmp" *.
    for /l %%. in () do if not exist "%base%*_job.bat" del "%base%*.render"&exit
  ) else if errorlevel 10 (
    %= Z - Toggle oldSys =%
    set /a "oldSys=^!oldSys"
    if !oldSys!==0 (set "method=FAST") else set "method=SLOW"
  ) else if errorlevel 9 (
    %= F - Toggle Fastrotate =%
    set /a "fastRotate=^!fastrotate"
  ) else if errorlevel 8 (
    %= M - Toggle Map =%
    set /a "SeeMap=^!SeeMap"
    if "!SeeMap!" equ "0" cls
  ) else if errorlevel 7 (
    %= H - Help =%
    call :Help
  ) else if errorlevel 6 (
    %= D - Right =%
    set /A "PlayerX-=StepY/2, PlayerY+=StepX/2"
  ) else if errorlevel 5 (
    %= A - Left =%
    set /A "PlayerX+=StepY/2, PlayerY-=StepX/2"
  ) else if errorlevel 4 (
    %= L - Rotate Right =%
    set /A "Angle=(Angle+15+360) %% 360" & set Rotate=Right
  ) else if errorlevel 3 (
    %= S - Down - Backward =%
    set /A "PlayerX-=StepX/2, PlayerY-=StepY/2"
  ) else if errorlevel 2 (
    %= K - Rotate Left =%
    set /A "Angle=(Angle-15+360) %% 360" & set Rotate=Left
  ) else if errorlevel 1 (
    %= W - Up - Forward =%
    set /A "PlayerX+=StepX/1, PlayerY+=StepY/1"
  )
)


:raycast

  :: Save start time
  set "t1=!time: =0!"

  :: Create Jobs
  set/A  from=Angle-32, to=Angle+32, chunk=65/proc, end=from+chunk-1
  for /l %%N in (1 1 %childCnt%) do (
    >"%base%%%N_job.bat.tmp" echo set /a "from=!from!, to=!end!, Angle=!Angle!, playerX=!playerX!, playerY=!playerY!"
    set /a from+=chunk, end+=chunk
    ren "%base%%%N_job.bat.tmp" *.
  )

  :computeEngine
  setlocal & ( %= For Empty Environment =%
  %= Empty Environment =%
  for %%v in (MaxIter1 MaxIter2 Mul1 MulPlayer base file files childCnt comspec
    Angle MapSizeX MapSizeY MapWidth BEL OldPlayerX OldPlayerY TMP MM M10
    cls Number_of_Processors pathext proc seemap space t1 turbo wait pathext end 
    formx formy grix gridy mul mulx muly chunk fastrotate dis files
    P345 P0 P15 P30 P45 P60 P75 P90 P105 P120 P135 P150 P165 P180 P195 method
    P210 P225 P240 P255 P270 P285 P300 P315 P330 PI PI32 PIx2 PI_div_2 SIN(x^) prompt
    GridX GridY LF MAP StepX StepY oldSys
  ) do set "%%v="
    rem (set&pause)>con
    
  %computeEngineBegin%
  >"%file%" (
    for /L %%Z in (!from!,1,!to!) do (

      set /A "Z=%%Z, aStepY=%SIN(x):x=Z * 31416 / 180%"
      set /A "aStepX=%SIN(x):x=15708-(Z * 31416 / 180)%"
      set/A  "A=%Angle%, corr=%SIN(x):x=15708-(Z-A) * 31416 / 180%"

      if "%oldSys%"=="1" (

        set "BREAK="
        set /A DistanceCount=%MaxIter1%, ax =PlayerX*%Mul1%, ay = PlayerY*%Mul1%

        %= Precompute how mulX/Y has to be computed =%
        if !aStepX! equ 0 (
          set "formX=set mul=%MaxIter1%"
          set mulX=%MaxIter1%
        ) else if !aStepX! GTR 0 (
          set "formX=set /a mulX=(aStepX+%MM%-(ax %% %MM%))/aStepX, mul=mulX"
        ) else if !aStepX! LSS 0 (
          set "formX=set /a mulX=-(ax %% %MM%)/aStepX+1, mul=mulX"
        )
        if !aStepY! equ 0 (
          set "formY="
          set mulY=%MaxIter1%
        ) else if !aStepY! GTR 0 (
          set "formY=set /a mulY=(aStepY+%MM%-(ay %% %MM%))/aStepY"
        ) else if !aStepY! LSS 0 (
          set "formY=set /a mulY=-(ay %% %MM%)/aStepY+1"
        )
        set dis=0
        for /L %%? in (1,1,20) do if not defined BREAK (
          !formX!
          !formY!            
          if !mulX! GEQ !mulY! set /a mul=mulY
          set /a ax+=aStepX*mul, ay+=aStepY*mul,dis+=mul, gridX=ax/%MM%, gridY=ay/%MM%
          for /f "tokens=1,2" %%X in ("!gridX! !gridY!") do if "!Map[%%Y]:~%%X,1!" geq "1" set BREAK=true & set /a DistanceCount=dis
        )
      
        %= Last Step =%
        set "BREAK="
        set /A "Zaccumul=DistanceCount*(10000/%Mul1%), ax=(ax-aStepX)*10, ay=(ay-aStepY)*10, DistanceCount=%MaxIter2%"
        set dis=0
        for /L %%? in (1,1,20) do if not defined BREAK (
          if !aStepX! equ 0 (set mulX=90) ELSE if !aStepX! GTR 0 (
            set /a "mulX=(aStepX+%M10%-(ax %% %MM%))/aStepX"
          ) else (
            set /a "mulX=((ax %% %M10%))/-aStepX+1"
          )
          if !aStepY! equ 0 (set mulY=90) ELSE if !aStepY! GTR 0 (
            set /a "mulY=(aStepY+%M10%-(ay %% %M10%))/aStepY"
          ) else (
            set /a "mulY=((ay %% %M10%))/-aStepY+1"
          )
                
          if !mulX! GEQ !mulY! (set /a mul=mulY) else set mul=!mulX!
          set /a ax+=aStepX*mul, ay+=aStepY*mul, dis+=mul, gridX=ax/%M10%, gridY=ay/%M10%
          for /f "tokens=1,2" %%X in ("!gridX! !gridY!") do if "!Map[%%Y]:~%%X,1!" geq "1" set BREAK=true & set /a DistanceCount=dis
        )
        for /f "tokens=1,2" %%X in ("!gridX! !gridY!") do set "C=!Map[%%Y]:~%%X,1!"
        set /A "distance=350/((((DistanceCount+Zaccumul)*corr/%Mulplayer%+555)/1000)+1), len=distance*2, st=(50-len)/2"

      ) else (

        set /A $X=%PlayerX%/10000, $Y=%PlayerY%/10000

        if !aStepX! equ 0 (
          set /A $tx=Dtx=100000000, $SX=0
        ) else if !aStepX! lss 0 (
                     set /A "$tx=($X*10000-PlayerX)*10000/aStepX, Dtx=-10000*10000/aStepX, $SX=-1"
              ) else set /A "$tx=(($X+1)*10000-PlayerX)*10000/aStepX, Dtx=10000*10000/aStepX, $SX=1"
        if !aStepY! equ 0 (
          set /A $ty=Dty=100000000, $SY=0
        ) else if !aStepY! lss 0 (
                     set /A "$ty=($Y*10000-PlayerY)*10000/aStepY, Dty=-10000*10000/aStepY, $SY=-1"
              ) else set /A "$ty=(($Y+1)*10000-PlayerY)*10000/aStepY, Dty=10000*10000/aStepY, $SY=1"

        set "$B=" & set /A "Distance=21*10000"

        for /L %%£ in (1,1,3) do if not defined $B for /L %%? in (1,1,7) do if not defined $B (
          if !$tx! lss !$ty! (
            set /A $tx+=Dtx, $X+=$SX
            for /f "tokens=1,2" %%X in ("!$X! !$Y!") do if "!Map[%%Y]:~%%X,1!" geq "1" (
              set /A Distance=$tx-Dtx, Side=0, $B=!Map[%%Y]:~%%X,1!
            )
          ) else (
            set /A $ty+=Dty, $Y+=$SY
            for /f "tokens=1,2" %%X in ("!$X! !$Y!") do if "!Map[%%Y]:~%%X,1!" geq "1" (
              set /A Distance=$ty-Dty, Side=1, $B=!Map[%%Y]:~%%X,1!
            )
          )
       )
       if not defined $B set "$B=1"
       set /A "distance=350/((((k=(Distance*corr))/%Mulplayer%+555)/1000)+1), len=distance*2, st=(50-len)/2"
       set /A C=$B
      )
      %= 2D-clipping =%
      if !st! lss 1 (set st=1) else if !st! gtr 50 set st=50
      for /f "tokens=1,2" %%X in ("!st! !len!") do (
        if !C! equ 1 (
            echo -!S_:~0,%%X!°±²Û²±°!SS:~0,%%Y!°±²Û²±°!SP:~0,%%X!-
        ) else (
          echo -!S_:~0,%%X!°±²Û²±°!S2:~0,%%Y!°±²Û²±°!SP:~0,%%X!-
        )
      )
      set C=&set Distance=&set len=&set st=&set ZAccumul=
    )
  )
  %computeEngineEnd%
  ) & endlocal %= For Empty Environment =%

  set /a wait=0
  :waitForJobCompletion
  if exist "%base%*_job.bat" (
    set /a wait+=1
    goto :waitForJobCompletion
  )

  :: Transpose and display results
  setlocal
  set /A LineN=0
  for /f usebackq^ delims^=^ eol^= %%A in (%files%) do (
    set /A LineN+=1
    set "N!LineN!=%%A"
  )

  set "transposedLine="
  for /L %%m in (1, 1, !LineN!) do set "transposedLine=!transposedLine!^!N%%m:~%%n,1^!"

  set/A MaxN=65
  %cls%
  echo(
  for /L %%n in (0, 1, !LineN!) do echo( ^|%transposedLine%^|
  endlocal
  
  :: Compute and display rendering time
  for /F "tokens=1-8 delims=:.," %%a in ("!t1!:!time: =0!") do set /a "a=(((1%%e-1%%a)*60)+1%%f-1%%b)*6000+1%%g%%h-1%%c%%d, a+=(a>>31)&8640000, FPS=10000/a"
  Title Raycast Dos Batch  -  Press H for help  -  Time Elapsed:!a!0ms - FPS: !FPS:~0,-2!.!FPS:~-2!
  set a=&set t1=
exit /b

:choice
setlocal EnableDelayedExpansion
set "c=" &set "e=" &set "map=%~1"
if not defined map endlocal &exit /b 0
for /f "delims=" %%i in ('2^>nul %COMSPEC%\..\xcopy /lw "%~f0" "%~f0"') do if not defined c set "c=%%i"
set "c=%c:~-1%"
if defined c (
  For /L %%i in (0,1,127) do (
    set "e=!map:~%%i,1!"
    if not defined e endlocal &<nul set /p "=%BEL%" >CON&exit /b 0
    if /i "!e!"=="!c!" (
      echo(!c!
      set /A n=%%i+1
      for /f %%j in ("!n!") do endlocal &exit /b %%j
    )
  )
)
endlocal &<nul set /p "=%BEL%" >CON &goto choice
exit /b

:prepareMap
set ^"LF=^

^" The above empty line is critical - DO NOT REMOVE
  set "map="
  for /L %%Y in (1,1,!MapsizeY!) do (
    for /L %%X in (0,1,!MapsizeX!) do (
      if "!Map[%%Y]:~%%X,1!" geq "1" (
        set "map=!map!Û"
      ) else (
        set "map=!map! "
      )
    )
    set "map=!map!!LF!"
  )
exit /b

:Help
  cls
  echo(
  echo  For best view use raster font 8x8 or 16x8.
  echo(
  echo  Use keyboard:
  echo(
  echo   WASD for move 
  echo   KL   for turn/rotate.
  echo   Z    for old rendering system.
  echo   U    for redraw
  echo   M    for view map ON/OFF
  echo   F    for Fastrotate ON/OFF (Not implemented)
  echo   Q    for quit
  echo   H    for Help
  echo(
  pause
exit /b


:InitEngines
:: Initialize and launch compute engines
  set "base=%tmp%\%~nx0"
  2>nul del "%base%*_job.bat"
  set ^"computeEngineBegin=for /l %%. in () do if exist "^!job^!" ( call "^!job^!"^"
  set ^"computeEngineEnd=del "^!job^!")^"
rem disabling parallel processing :
rem see http://www.dostips.com/forum/viewtopic.php?f=3&t=7053 
rem  set /a proc=NUMBER_OF_PROCESSORS, childCnt=proc-1
  set /a proc=1, childCnt=proc-1
  if %proc% gtr 8 set /a proc=8
  for /l %%N in (1 1 !childCnt!) do (
    set "file=%base%%%N.render"
    set "job=%base%%%N_job.bat"
    >nul 2>nul <nul start "" /b "%comspec%" /d /v:on /c "%~f0" :computeEngine
  )
  set "file=%base%!proc!.render"
  set "files="
  for /l %%N in (1 1 !proc!) do set files=!files! "%base%%%N.render"
  set "computeEngineBegin="
  set "computeEngineEnd="
exit/b

:Init

  Title Raycast Dos Batch - Loading...
  mode 69,80
  color 0F
  cls

  :: capture del BEL char
  for /f %%i in ('forfiles /m "%~nx0" /c "cmd /c echo 0x07"') do set "BEL=%%i"

  :: empty environment
  set "preserve= TMP BEL COMSPEC NUMBER_OF_PROCESSORS preserve "
  for /f "delims==" %%v in ('set') do if "!preserve: %%v =!" equ "!preserve!" set "%%v="
  set "preserve="

  :: Setting output char
  set "SS=°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°"
  set "S_=úúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúúú"
  set "S2=±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±"
  set "SP=__________________________"
  set "SC=///////////////////////////////////////////////////"

  :: Trigonometric variables
  set /a "PI=(35500000/113+5)/10, PI_div_2=(35500000/113/2+5)/10, PIx2=2*PI, PI32=PI+PI_div_2"
  set "SIN=(a - a*a/1920*a/312500 + a*a/1920*a/15625*a/15625*a/2560000 - a*a/1875*a/15360*a/15625*a/15625*a/16000*a/44800000)"
  set "SIN(x)=(a=(x)%%62832, c=(a>>31|1)*a, a-=(((c-47125)>>31)+1)*((a>>31|1)*62832)  +  (-((c-47125)>>31))*( (((c-15709)>>31)+1)*(-(a>>31|1)*31416+2*a)  ), %SIN%)"
  set SIN=

  :: Define player characters:
  for %%# in (
    "345   0  15  >"
    " 30  45  60  \"
    " 75  90 105  v"
    "120 135 150  /"
    "165 180 195  <"
    "210 225 240  \"
    "255 270 285  ^"
    "300 315 330  /"
  ) do for /f "tokens=1-4" %%A in (%%#) do (
    set "P%%A=%%D"
    set "P%%B=%%D"
    set "P%%C=%%D"
  )

  set /A MulPlayer=10000, Mul1=25, MaxIter1=500, MaxIter2=50, MM=MulPlayer*Mul1, M10=MM*10
  set /A Angle=0, oldSys=0, FastRotate=0, SeeMap=1

  :: Define some screen management variables and macros
  if exist "%~dp0CursorPos.exe" (
    set "cls=CursorPos 0 0"
  ) else (
    set "cls=cls"
  )
  set "method=FAST"
  set "space=            "  

exit /b