@echo off&setlocal&color 0c&mode con cols=65 lines=30

::::BgetDescription#YAHTZEE in batch.
::::BgetAuthor#aGerman
::::BgetCategory#game
chcp 437>nul
title YAHTZEE
for /f %%i in ('"prompt $H&echo on&for %%j in (1) do rem"') do set "BS=%%i"
:again
cls
for /l %%i in (0,1,9) do echo.
echo                     '''''''''''''''''''
echo     ,-.            ''                 ''    ,-.           ,-.
echo    / \_\    ,-.   ''  YAHTZEE In Batch ''  / \_\   ,-.   / \_\
echo    \ / /   / \_\  ''                   ''  \ / /  / \_\  \ / /
echo     `-'    \ / /  ''      aGerman      ''   `-'   \ / /   `-'
echo             `-'    ''                 ''           `-'
echo                     '''''''''''''''''''
for /l %%i in (0,1,8) do echo.
set /p "name=%BS% Enter your name: "
if not defined name goto again
set "top=ÚÄÄÄÄÄÄÄÄÄ¿"
set "bottom=ÀÄÄÄÄÄÄÄÄÄÙ"
for %%a in ("[1,1]" "[1,2]" "[1,4]" "[1,5]" "[2,1]" "[2,3]" "[2,5]" "[3,2]" "[3,4]" "[4,1]" "[4,3]" "[4,5]" "[5,2]" "[5,4]" "[6,2]" "[6,4]") do (
  set "%%~a=³         ³"
)
for %%a in ("[1,3]" "[3,3]" "[5,3]") do set "%%~a=³    @    ³"
for %%a in ("[4,2]" "[4,4]" "[6,1]" "[6,3]" "[6,5]") do set "%%~a=³  @   @  ³"
for %%a in ("[5,1]" "[5,5]") do set "%%~a=³ @     @ ³"
set "[2,2]=³     @   ³"
set "[2,4]=³   @     ³"
set "[3,1]=³ @       ³"
set "[3,5]=³       @ ³"
set "rolls=0"
for /l %%i in (1,1,13) do set "roll%%i= "
for /l %%i in (1,1,13) do set "score%%i=0"
color f1&mode con cols=65 lines=50
:start
set /a rolls+=1
set "iteration=0"
set "fixed="
for /l %%i in (1,1,5) do set "fixed%%i="
for /l %%i in (1,1,5) do set "safe%%i=    "
for /l %%i in (1,1,5) do set "fix%%i=0"
call :calccard
:loop
if %iteration%==3 (
  pause>nul|set /p "=%BS% Register ... "
  goto register
)
set /a iteration+=1
for /l %%i in (0,1,2) do (
  call :displaycard
  call :process
)
if %iteration%==3 (
  pause>nul|set /p "=%BS% Register ... "
  goto register
) else (
  call :fix
  goto loop
)
:register
setlocal enabledelayedexpansion
for /l %%i in (1,1,5) do (
  for /l %%j in (1,1,5) do (
    if !d%%i! lss !d%%j! (
      set "temp=!d%%i!"
      set "d%%i=!d%%j!"
      set "d%%j=!temp!"
    )
  )
)
endlocal&set "d1=%d1%"&set "d2=%d2%"&set "d3=%d3%"&set "d4=%d4%"&set "d5=%d5%"
:loop2
call :calccard
call :displaycard
echo.
echo   Your roll was: %d1%, %d2%, %d3%, %d4%, %d5%
echo.
set "choice="
set "var1="
set "var2="
set /p "choice=%BS% Enter the category number: "
if "%choice%"=="1" (
  set "var1=roll1"
  set "var2=score1"
  call :test1
  goto forward
)
if "%choice%"=="2" (
  set "var1=roll2"
  set "var2=score2"
  call :test2
  goto forward
)
if "%choice%"=="3" (
  set "var1=roll3"
  set "var2=score3"
  call :test3
  goto forward
)
if "%choice%"=="4" (
  set "var1=roll4"
  set "var2=score4"
  call :test4
  goto forward
)
if "%choice%"=="5" (
  set "var1=roll5"
  set "var2=score5"
  call :test5
  goto forward
)
if "%choice%"=="6" (
  set "var1=roll6"
  set "var2=score6"
  call :test6
  goto forward
)
if "%choice%"=="7" (
  set "var1=roll7"
  set "var2=score7"
  call :testThreeOAK
  goto forward
)
if "%choice%"=="8" (
  set "var1=roll8"
  set "var2=score8"
  call :testFourOAK
  goto forward
)
if "%choice%"=="9" (
  set "var1=roll9"
  set "var2=score9"
  call :testFullHouse
  goto forward
)
if "%choice%"=="10" (
  set "var1=roll10"
  set "var2=score10"
  call :testSStraight
  goto forward
)
if "%choice%"=="11" (
  set "var1=roll11"
  set "var2=score11"
  call :testLStraight
  goto forward
)
if "%choice%"=="12" (
  set "var1=roll12"
  set "var2=score12"
  call :testYahtzee
  goto forward
)
if "%choice%"=="13" (
  set "var1=roll13"
  set "var2=score13"
  call :testChance
  goto forward
)
goto :loop2
:forward
set "choice="
if %return%==F (
  set /p "=%BS% This category is disabled. "
  goto loop2
)
if %return%==0 (
  echo  You'll get no score points!
  set /p "choice=%BS% Are you really sure? (y/n) "
) else (
  set "choice=y"
)
if /i "%choice%"=="y" (
  set "%var1%=%d1%, %d2%, %d3%, %d4%, %d5%"
  set "%var2%=%return%"
  call :calccard
  call :displaycard
) else (
  goto :loop2
)
pause>nul|set /p "=%BS% Continue ... "
if %rolls% lss 13 goto start
set "xtime=%time::=.%"
>>"%~0" echo *:%grandtotal%:%date% %xtime:~,5%:%name%
echo.
echo   Final Score: %grandtotal%
echo.
pause>nul|set /p "=%BS% Display Ranking ... "
cls&color 4e
for /f "delims=: tokens=1,3,4*" %%a in ('findstr /b /l /c:"*:" "%~0"^|findstr /n .') do (
  set "LScore%%a=%%b"
  set "LTime%%a=%%c"
  set "LName%%a=%%d"
  set /a n=%%a
)
setlocal enabledelayedexpansion
for /l %%i in (1,1,%n%) do (
  for /l %%j in (1,1,%n%) do (
    if !LScore%%i! gtr !LScore%%j! (
      set "tScore=!LScore%%i!"
      set "LScore%%i=!LScore%%j!"
      set "LScore%%j=!tScore!"
      set "tTime=!LTime%%i!"
      set "LTime%%i=!LTime%%j!"
      set "LTime%%j=!tTime!"
      set "tName=!LName%%i!"
      set "LName%%i=!LName%%j!"
      set "LName%%j=!tName!"
    )
  )
)
(
  @echo off
  echo Ranking List
  echo ÍÍÍÍÍÍÍÍÍÍÍÍ
  echo.
  echo  Place   Score      Date / Time        Name
  echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
  for /l %%a in (1,1,%n%) do (
    set "no=     %%a"
    call set "no=%%no:~-6%%"
    call set "LScore%%a=     %%LScore%%a%%"
    call set "LScore%%a=%%LScore%%a:~-6%%"
    call set "LTime%%a=         %%LTime%%a%%"
    call set "LTime%%a=%%LTime%%a:~-20%%"
    call echo %%no%%. %%LScore%%a%% %%LTime%%a%%    %%LName%%a%%
  )
)|more
endlocal
echo.
pause>nul|set /p "=%BS%   QUIT YAHTZEE ... "
goto :eof
:: ***************************** end of main **********************************

:process
if %fix1%==0 set /a d1=(%random%)%%6+1
if %fix2%==0 set /a d2=(%random%)%%6+1
if %fix3%==0 set /a d3=(%random%)%%6+1
if %fix4%==0 set /a d4=(%random%)%%6+1
if %fix5%==0 set /a d5=(%random%)%%6+1
echo ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
echo  ROLL %iteration%
echo.
echo     Dice 1       Dice 2       Dice 3       Dice 4       Dice 5
echo.     %safe1%         %safe2%         %safe3%         %safe4%         %safe5%
echo  %top%  %top%  %top%  %top%  %top%
for /l %%i in (1,1,5) do call echo  %%[%d1%,%%i]%%  %%[%d2%,%%i]%%  %%[%d3%,%%i]%%  %%[%d4%,%%i]%%  %%[%d5%,%%i]%%
echo  %bottom%  %bottom%  %bottom%  %bottom%  %bottom%
echo.
goto :eof

:calccard
set /a subtotal=%score1%+%score2%+%score3%+%score4%+%score5%+%score6%
if %subtotal% lss 63 (set "bonus=0") else set "bonus=35"
set /a total1=%subtotal%+%bonus%
set /a total2=%score7%+%score8%+%score9%+%score10%+%score11%+%score12%+%score13%
set /a grandtotal=%total1%+%total2%
call :addspaces "%name%" 40 r StrName
call :addspaces "%roll1%" 13 r StrRoll1
call :addspaces "%score1%" 6 l StrScore1
call :addspaces "%roll2%" 13 r StrRoll2
call :addspaces "%score2%" 6 l StrScore2
call :addspaces "%roll3%" 13 r StrRoll3
call :addspaces "%score3%" 6 l StrScore3
call :addspaces "%roll4%" 13 r StrRoll4
call :addspaces "%score4%" 6 l StrScore4
call :addspaces "%roll5%" 13 r StrRoll5
call :addspaces "%score5%" 6 l StrScore5
call :addspaces "%roll6%" 13 r StrRoll6
call :addspaces "%score6%" 6 l StrScore6
call :addspaces "%roll7%" 13 r StrRoll7
call :addspaces "%score7%" 6 l StrScore7
call :addspaces "%roll8%" 13 r StrRoll8
call :addspaces "%score8%" 6 l StrScore8
call :addspaces "%roll9%" 13 r StrRoll9
call :addspaces "%score9%" 6 l StrScore9
call :addspaces "%roll10%" 13 r StrRoll10
call :addspaces "%score10%" 6 l StrScore10
call :addspaces "%roll11%" 13 r StrRoll11
call :addspaces "%score11%" 6 l StrScore11
call :addspaces "%roll12%" 13 r StrRoll12
call :addspaces "%score12%" 6 l StrScore12
call :addspaces "%roll13%" 13 r StrRoll13
call :addspaces "%score13%" 6 l StrScore13
call :addspaces "%subtotal%" 6 l StrSubtotal
call :addspaces "%bonus%" 6 l StrBonus
call :addspaces "%total1%" 6 l StrTotal1
call :addspaces "%total2%" 6 l StrTotal2
call :addspaces "%grandtotal%" 6 l StrGrandtotal
goto :eof

:displaycard
cls
echo  ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo  ³Name: %StrName% ³
echo  ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
echo  ÃÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄ´
echo  ³ No.³ Category:       ³ Roll:         ³ Score: ³
echo  ÃÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄ´
echo  ³  1 ³           Ones: ³ %StrRoll1% ³ %StrScore1% ³
echo  ³  2 ³           Twos: ³ %StrRoll2% ³ %StrScore2% ³
echo  ³  3 ³         Threes: ³ %StrRoll3% ³ %StrScore3% ³
echo  ³  4 ³          Fours: ³ %StrRoll4% ³ %StrScore4% ³
echo  ³  5 ³          Fives: ³ %StrRoll5% ³ %StrScore5% ³
echo  ³  6 ³          Sixes: ³ %StrRoll6% ³ %StrScore6% ³
echo  ÃÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄ´
echo  ³ -------------------------- SUBTOTAL: ³ %StrSubtotal% ³
echo  ³ ----------------------------- BONUS: ³ %StrBonus% ³
echo  ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄ´
echo  ³ ~~~~~~~~~~~~~~~~~~~~~~~~~~~ TOTAL 1: ³ %StrTotal1% ³
echo  ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄ´
echo  ÃÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄ´
echo  ³  7 ³    3 Of A Kind: ³ %StrRoll7% ³ %StrScore7% ³
echo  ³  8 ³    4 Of A Kind: ³ %StrRoll8% ³ %StrScore8% ³
echo  ³  9 ³     Full House: ³ %StrRoll9% ³ %StrScore9% ³
echo  ³ 10 ³ Small Straight: ³ %StrRoll10% ³ %StrScore10% ³
echo  ³ 11 ³ Large Straight: ³ %StrRoll11% ³ %StrScore11% ³
echo  ³ 12 ³        Yahtzee: ³ %StrRoll12% ³ %StrScore12% ³
echo  ³ 13 ³         Chance: ³ %StrRoll13% ³ %StrScore13% ³
echo  ÃÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄ´
echo  ³ ~~~~~~~~~~~~~~~~~~~~~~~~~~~ TOTAL 2: ³ %StrTotal2% ³
echo  ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄ´
echo  ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄ´
echo  ³                                      ³        ³
echo  ³ *********************** GRAND TOTAL: ³ %StrGrandtotal% ³
echo  ³                                      ³        ³
echo  ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÙ
goto :eof

:fix
set /p "fixed=%BS% Enter the dices you want to save (1,2,3,4,5): "
if not defined fixed goto :eof
set fixed=%fixed: =%
if not defined fixed goto :eof
set fixed=%fixed:,=%
if not defined fixed goto :eof
set "fixed1=%fixed:~,1%
set "fixed2=%fixed:~1,1%
set "fixed3=%fixed:~2,1%
set "fixed4=%fixed:~3,1%
set "fixed5=%fixed:~4,1%
if defined fixed1 (set "fix%fixed1%=1"&set "safe%fixed1%=SAFE")
if defined fixed2 (set "fix%fixed2%=1"&set "safe%fixed2%=SAFE")
if defined fixed3 (set "fix%fixed3%=1"&set "safe%fixed3%=SAFE")
if defined fixed4 (set "fix%fixed4%=1"&set "safe%fixed4%=SAFE")
if defined fixed5 (set "fix%fixed5%=1"&set "safe%fixed5%=SAFE")
set /a fixsum=%fix1%+%fix2%+%fix3%+%fix4%+%fix5%
if %fixsum%==5 set /a iteration=3
goto :eof

:test1
if "%roll1%" neq " " (set "return=F"&goto :eof)
setlocal enabledelayedexpansion
set /a one=0
for /l %%i in (1,1,5) do (
  if !d%%i!==1 set /a one+=1
)
endlocal&set "return=%one%"
goto :eof

:test2
if "%roll2%" neq " " (set "return=F"&goto :eof)
setlocal enabledelayedexpansion
set /a two=0
for /l %%i in (1,1,5) do (
  if !d%%i!==2 set /a two+=2
)
endlocal&set "return=%two%"
goto :eof

:test3
if "%roll3%" neq " " (set "return=F"&goto :eof)
setlocal enabledelayedexpansion
set /a three=0
for /l %%i in (1,1,5) do (
  if !d%%i!==3 set /a three+=3
)
endlocal&set "return=%three%"
goto :eof

:test4
if "%roll4%" neq " " (set "return=F"&goto :eof)
setlocal enabledelayedexpansion
set /a four=0
for /l %%i in (1,1,5) do (
  if !d%%i!==4 set /a four+=4
)
endlocal&set "return=%four%"
goto :eof

:test5
if "%roll5%" neq " " (set "return=F"&goto :eof)
setlocal enabledelayedexpansion
set /a five=0
for /l %%i in (1,1,5) do (
  if !d%%i!==5 set /a five+=5
)
endlocal&set "return=%five%"
goto :eof

:test6
if "%roll6%" neq " " (set "return=F"&goto :eof)
setlocal enabledelayedexpansion
set /a six=0
for /l %%i in (1,1,5) do (
  if !d%%i!==6 set /a six+=6
)
endlocal&set "return=%six%"
goto :eof

:testThreeOAK
if "%roll7%" neq " " (set "return=F"&goto :eof)
setlocal
set /a ThreeOAK=0
for /l %%i in (1,1,6) do (
  echo %d1%%d2%%d3%%d4%%d5%|findstr /c:"%%i%%i%%i">nul&&set /a ThreeOAK=%d1%+%d2%+%d3%+%d4%+%d5%
)
endlocal&set "return=%ThreeOAK%"
goto :eof

:testFourOAK
if "%roll8%" neq " " (set "return=F"&goto :eof)
setlocal
set /a FourOAK=0
for /l %%i in (1,1,6) do (
  echo %d1%%d2%%d3%%d4%%d5%|findstr /c:"%%i%%i%%i%%i">nul&&set /a FourOAK=%d1%+%d2%+%d3%+%d4%+%d5%
)
endlocal&set "return=%FourOAK%"
goto :eof

:testFullHouse
if "%roll9%" neq " " (set "return=F"&goto :eof)
setlocal
set /a FullHouse=0
for /l %%i in (1,1,6) do (
  for /l %%j in (%%i,1,6) do (
    echo %d1%%d2%%d3%%d4%%d5%|findstr "%%i%%i%%i%%j%%j %%i%%i%%j%%j%%j">nul&&(
      endlocal
      set "return=25"
      goto :eof
    )
  )
)
endlocal&set "return=%FullHouse%"
goto :eof

:testSStraight
if "%roll10%" neq " " (set "return=F"&goto :eof)
setlocal enabledelayedexpansion
set /a SStraight=0
set "test=%d1%%d2%%d3%%d4%%d5%"
for /l %%i in (1,1,6) do (
  set "test=!test:%%i%%i=%%i!"
)
echo %test%|findstr "1234 2345 3456">nul&&set /a SStraight=30
endlocal&set "return=%SStraight%"
goto :eof

:testLStraight
if "%roll11%" neq " " (set "return=F"&goto :eof)
setlocal
set /a LStraight=0
echo %d1%%d2%%d3%%d4%%d5%|findstr "12345 23456">nul&&set /a LStraight=40
endlocal&set "return=%LStraight%"
goto :eof

:testYahtzee
if "%roll12%" neq " " (set "return=F"&goto :eof)
setlocal
set /a Yahtzee=0
for /l %%i in (1,1,6) do (
  echo %d1%%d2%%d3%%d4%%d5%|findstr /c:"%%i%%i%%i%%i%%i">nul&&set /a Yahtzee=60
)
endlocal&set "return=%Yahtzee%"
goto :eof

:testChance
if "%roll13%" neq " " (set "return=F"&goto :eof)
set /a return=%d1%+%d2%+%d3%+%d4%+%d5%
goto :eof

:addspaces
setlocal
set "spaces=                                        "
if "%~3"=="r" (
  set "string=%~1%spaces%"
  call set "string=%%string:~,%~2%%
) else (
  set "string=%spaces%%~1"
  call set "string=%%string:~-%~2%%
)
endlocal&set "%~4=%string%"
goto :eof
