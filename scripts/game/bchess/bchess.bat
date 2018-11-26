@echo off
@title Batch Chess v0.8 By Kolto101
@setlocal EnableDelayedExpansion

::  By Kolto101 and Kolt Koding   ::
:: Creating batch games is an art ::

:: What I haven't coded but NEEDS to be added ::
REM -Stale/Checkmate System

::::BgetDescription#batch implementation of chess.
::::BgetAuthor#Kolt101
::::BgetCategory#game

:: What could be added ::
REM Add game log to save for later.
REM Pawn: Make sure a promoted pawn isn't used in castling.
REM Different colored pieces.
REM Autoupdating [REMarked out in current code due to site issues]
REM LAN Play?
REM Time limit


call :default


:menu
title Batch Chess v0.8 By Kolto101
if exist "tmp.txt" del tmp.txt
if exist "config.bat" call config.bat
set variant=
cls
echo.
echo      _-_ _,,           ,       ,,            ,- _~. ,,                      
echo         -/  )    _    ^|^|       ^|^|           (' /^|   ^|^|                      
echo        ~^|^|_^<    ^< \, =^|^|=  _-_ ^|^|/\\       ((  ^|^|   ^|^|/\\  _-_   _-_,  _-_, 
echo         ^|^| \\   /-^|^|  ^|^|  ^|^|   ^|^| ^|^|       ((  ^|^|   ^|^| ^|^| ^|^| \\ ^|^|_.  ^|^|_.  
echo         ,/--^|^| (( ^|^|  ^|^|  ^|^|   ^|^| ^|^|        ( / ^|   ^|^| ^|^| ^|^|/    ~ ^|^|  ~ ^|^| 
echo        _--_-'   \/\\  \\, \\,/ \\ ^|/         -____- \\ ^|/ \\,/  ,-_-  ,-_-  
echo       (                          _/                   _/
echo.
echo               ,....,                                        ,....,
echo             ,::::::^<                                        ^>::::::,
echo            ,::/^^\"``.                                      .``"/^^\::,
echo           ,::/, `   O`.        ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»        .`O   ` ,\::,
echo          ,::; ^|        '.      º     -Menu-     º      .'        ^| ;::,
echo          ,::^|  \___,-.  o)     ÌÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹     (o  .-,___/  ^|::,
echo          ;::^|     \   '-'      º  1. Play       º      `-'   /     ^|::;
echo          ;::^|      \           º  2. Load Game  º           /      ^|::;
echo          ;::^|   _.=`\          º  3. Configure  º          /`=._   ^|::;
echo          `;:^|.=` _.=`\         º  4. Tutorial   º         /`=._ `=.^|:;"
echo            '^|_.=`   __\        º  5. Playback   º        /__   `=._^|'
echo             `\_..==`` /        º  6. About      º        \ ``==.._/`  
echo              .'.___.-'.        º  7. Exit       º        .'-.___.'.
echo             /          \       ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼       /          \
echo            ('--......--')                              ('--......--')
echo            /'--......--'\                              /'--......--'\
echo            `"--......--"`                              `"--......--"`
set /p choose=^>                              Choose a number: 
if "!choose!" == "1" goto play
if "!choose!" == "2" goto loadgame
if "!choose!" == "3" goto config
if "!choose!" == "4" goto tutorial
if "!choose!" == "5" goto gameplayback
if "!choose!" == "6" goto about
if "!choose!" == "7" exit
goto menu


:loadgame
cls
echo.
echo Enter the name of the game you wish to continue.
echo.
echo -b/Back
echo.
set /p name=File name: 
if /i "!name!" == "-b" goto menu
if /i not exist "!name!" set name=!name!.sav
if /i not exist "!name!" (
echo.
echo File not found^^!
echo.
pause
goto loadgame
)
set scr=1
set file=
set rank=
set tw=White
set tb=Black
set vn=1
for %%d in (piece v_file1 v_file2 v_rank1 v_rank2) do set %%d=
for /l %%r in (1,1,8) do set r%%r= 
for /l %%s in (1,1,64) do set a%%s=!bbb!
for /f "tokens=1,2 delims==" %%a in (!name!) do set %%a=%%b
for %%w in (a1 a3 a5 a7 a10 a12 a14 a16 a17 a19 a21 a23 a26 a28 a30 a32 a33 a35 a37 a39 a42 a44 a46 a48 a49 a51 a53 a55 a58 a60 a62 a64) do (
if "!%%w!" == "!bbb!" set %%w=!www!
)
goto game


REM =============================== GAME ===============================

:play
cls
echo.
echo -b/Back
echo.
set /p wplayer=White's name: 
if /i "!wplayer!" == "-b" goto menu
echo.
set /p bplayer=Black's name: 
if /i "!bplayer!" == "-b" goto play
title Batch Chess - !wplayer! vs. !bplayer!

if exist "tmp.txt" del tmp.txt
set movec=0
set scr=1
set file=
set rank=
set vn=1
for %%d in (piece v_file1 v_file2 v_rank1 v_rank2) do set %%d=
set wkingpos=
set bkingpos=
set draw=
for %%r in (a1 a8 a57 a64) do set %%rrook=

if /i "!first!" == "w" (set turn=w) ELSE set turn=b
set tw=White
set tb=Black
set wpieces=16
set bpieces=16

for /l %%s in (1,1,64) do set a%%s=!bbb!
for %%w in (a1 a3 a5 a7 a10 a12 a14 a16 a17 a19 a21 a23 a26 a28 a30 a32 a33 a35 a37 a39 a42 a44 a46 a48 a49 a51 a53 a55 a58 a60 a62 a64) do set %%w=!www!
for /l %%a in (1,1,8) do set f%%a= 
for /l %%a in (1,1,8) do set r%%a= 

for /l %%p in (9,1,16) do set bpawn%%p=orig
for /l %%p in (49,1,56) do set wpawn%%p=orig

REM White
for /l %%P in (49,1,56) do set a%%P=!wPawn!
for %%R in (a57 a64) do set %%R=!wRook!
for %%K in (a58 a63) do set %%K=!wKnight!
for %%B in (a59 a62) do set %%B=!wBishop!
set a60=!wQueen!
set a61=!wKing!
set wkinglocate=61

REM Black
for /l %%P in (9,1,16) do set a%%P=!bPawn!
for %%R in (a1 a8) do set %%R=!bRook!
for %%K in (a2 a7) do set %%K=!bKnight!
for %%B in (a3 a6) do set %%B=!bBishop!
set a4=!bQueen!
set a5=!bKing!
set bkinglocate=5

:variants
cls
echo.
echo Choose a game type:
echo.
echo 1. Normal Play
echo 2. Last Army Standing
echo 3. Knights and Pawns
echo 4. Bishops and Pawns
echo 5. Rooks and Pawns
echo.
echo b/Back
echo.
set /p choose=Choose a number: 
if /i "!choose!" == "b" goto menu
if "!choose!" == "1" goto game
if "!choose!" == "2" (set variant=las) && goto game
if "!choose!" == "3" for %%k in (a1 a2 a3 a4 a6 a7 a8) do set %%k=!bKnight!
if "!choose!" == "3" for %%k in (a57 a58 a59 a60 a62 a63 a64) do set %%k=!wKnight!
if "!choose!" == "4" for %%b in (a1 a2 a3 a4 a6 a7 a8) do set %%b=!bBishop!
if "!choose!" == "4" for %%b in (a57 a58 a59 a60 a62 a63 a64) do set %%b=!wBishop!
if "!choose!" == "5" for %%r in (a1 a2 a3 a4 a6 a7 a8) do set %%r=!bRook!
if "!choose!" == "5" for %%r in (a57 a58 a59 a60 a62 a63 a64) do set %%r=!wRook!
if !choose! GEQ 1 if !choose! LEQ 5 goto game
goto variants



:game
cls
echo.
echo          !t%turn%!'s move [!%turn%player!]
echo.
call :r!scr!
echo.
echo.
echo  k/Let go   L-R/Rotate   o/Options   s/Resign
echo.
choice /c:12345678abcdefghklrso /n
REM Skip turn: if ERRORLEVEL # (if "!turn!" == "w" (set turn=b) ELSE set turn=w) && goto game
if ERRORLEVEL 21 goto options
if ERRORLEVEL 20 goto resign
REM weird bug for 18 and 19...
if "!ERRORLEVEL!"=="19" (set rotater=r) && goto rotater
if "!ERRORLEVEL!"=="18" (set rotater=l) && goto rotater
if ERRORLEVEL 17 goto drop_piece
if ERRORLEVEL 16 (set v_file!vn!=H) && (set seed=8) && (for /l %%a in (1,1,8) do set f%%a= ) && (set f!seed!=!file!) && goto game
if ERRORLEVEL 15 (set v_file!vn!=G) && (set seed=7) && (for /l %%a in (1,1,8) do set f%%a= ) && (set f!seed!=!file!) && goto game
if ERRORLEVEL 14 (set v_file!vn!=F) && (set seed=6) && (for /l %%a in (1,1,8) do set f%%a= ) && (set f!seed!=!file!) && goto game
if ERRORLEVEL 13 (set v_file!vn!=E) && (set seed=5) && (for /l %%a in (1,1,8) do set f%%a= ) && (set f!seed!=!file!) && goto game
if ERRORLEVEL 12 (set v_file!vn!=D) && (set seed=4) && (for /l %%a in (1,1,8) do set f%%a= ) && (set f!seed!=!file!) && goto game
if ERRORLEVEL 11 (set v_file!vn!=C) && (set seed=3) && (for /l %%a in (1,1,8) do set f%%a= ) && (set f!seed!=!file!) && goto game
if ERRORLEVEL 10 (set v_file!vn!=B) && (set seed=2) && (for /l %%a in (1,1,8) do set f%%a= ) && (set f!seed!=!file!) && goto game
if ERRORLEVEL 9  (set v_file!vn!=A) && (set seed=1) && (for /l %%a in (1,1,8) do set f%%a= ) && (set f!seed!=!file!) && goto game
if ERRORLEVEL 8  (set v_rank!vn!=8) && call set plus=0
if ERRORLEVEL 7  (set v_rank!vn!=7) && call set plus=8
if ERRORLEVEL 6  (set v_rank!vn!=6) && call set plus=16
if ERRORLEVEL 5  (set v_rank!vn!=5) && call set plus=24
if ERRORLEVEL 4  (set v_rank!vn!=4) && call set plus=32
if ERRORLEVEL 3  (set v_rank!vn!=3) && call set plus=40
if ERRORLEVEL 2  (set v_rank!vn!=2) && call set plus=48
if ERRORLEVEL 1  (set v_rank!vn!=1) && call set plus=56



for /l %%a in (1,1,8) do set r%%a= 
set /a r=(!plus!/8)+1
set r!r!=!rank!
if not defined seed goto game
set /a getpos=!seed!+!plus!
set seed=
set plus=


if defined piece goto moveto
call set piece=%%a%getpos%%%
if "!piece!" == "!bbb!" (set piece=) && goto game
if "!piece!" == "!www!" (set piece=) && goto game

REM Check against picking up other players pieces...

if not "!piece!" == "!%turn%Pawn!" (
if not "!piece!" == "!%turn%Rook!" (
if not "!piece!" == "!%turn%Knight!" (
if not "!piece!" == "!%turn%Bishop!" (
if not "!piece!" == "!%turn%Queen!" (
if not "!piece!" == "!%turn%King!" (
echo.
echo You cannot pick up the other player's pieces^^!
echo.
set illegal=
set piece=
set v_file1=
set v_rank1=
set origpos=
set getpos=
pause
goto game
))))))
set origpos=!getpos!
set vn=2
goto game

:drop_piece
set vn=1
for %%d in (v_file1 v_file2 v_rank1 v_rank2 piece) do set %%d=
goto game

:moveto
set !turn!lastp=
if "!turn!" == "w" (set opp=b) ELSE set opp=w
if "!turn!" == "w" (set ps=-) ELSE set ps=+
if "!getpos!" == "!origpos!" goto samesquare

call set captured=%%a!getpos!%%
if /i "!piece!" == "!%turn%Pawn!" goto pawn_rules
if /i "!piece!" == "!%turn%Rook!" goto rook_rules
if /i "!piece!" == "!%turn%Knight!" goto knight_rules

if /i "!piece!" == "!%turn%Bishop!" goto bishop_rules

if /i "!piece!" == "!%turn%Queen!" goto rook_rules
if /i "!piece!" == "!%turn%King!" goto king_rules
REM Queen is a combination of rook_rules and bishop_rules

REM ========================== Check ==========================
:next
REM Anti-capture-your-own-piece
if "!captured!" == "!%turn%Pawn!" set illegal=true
if "!captured!" == "!%turn%Rook!" set illegal=true
if "!captured!" == "!%turn%Knight!" set illegal=true
if "!captured!" == "!%turn%Bishop!" set illegal=true
if "!captured!" == "!%turn%Queen!" set illegal=true
if "!captured!" == "!%turn%King!" set illegal=true
if /i "!illegal!" == "true" (
echo.
echo You cannot do that^^!
echo.
pause
:samesquare
set vn=1
call set !turn!pawn!origpos!=!prepawn!
for %%d in (illegal piece origpos getpos promo v_rank1 v_rank2 v_file1 v_file2) do set %%d=
goto game
)
set a!origpos!=!bbb!
for %%w in (a1 a3 a5 a7 a10 a12 a14 a16 a17 a19 a21 a23 a26 a28 a30 a32 a33 a35 a37 a39 a42 a44 a46 a48 a49 a51 a53 a55 a58 a60 a62 a64) do (
if "!%%w!" == "!bbb!" set %%w=!www!
)
set a!getpos!=!piece!
if "!variant!" == "las" goto las

:check
REM Knight Moves
set /a v1=!%turn%kinglocate!-15
set /a v2=!%turn%kinglocate!-17
set /a v3=!%turn%kinglocate!-6
set /a v4=!%turn%kinglocate!-10
set /a v5=!%turn%kinglocate!+15
set /a v6=!%turn%kinglocate!+17
set /a v7=!%turn%kinglocate!+6
set /a v8=!%turn%kinglocate!+10
for /l %%c in (1,1,8) do (
call set m=%%a!v%%c!%%
if "!m!" == "!%opp%Knight!" set illegal=true
)
if "!illegal!" == "true" goto badmove

REM Pawn/King
if "!ps!" == "-" (set oppps=+) ELSE set opps=-
set /a v1=!%turn%kinglocate!!ps!9
set /a v2=!%turn%kinglocate!-8
set /a v3=!%turn%kinglocate!!ps!7
set /a v4=!%turn%kinglocate!-1
set /a v5=!%turn%kinglocate!+1
set /a v6=!%turn%kinglocate!!oppps!7
set /a v7=!%turn%kinglocate!+8
set /a v8=!%turn%kinglocate!!oppps!9
for /l %%v in (1,1,8) do (
call set m=%%a!v%%v!%%
if "!m!" == "!%opp%King!" set illegal=true
if "%%v" == "1" if "!m!" == "!%opp%Pawn!" set illegal=true
if "%%v" == "3" if "!m!" == "!%opp%Pawn!" set illegal=true
)
if "!illegal!" == "true" goto badmove

for /l %%v in (1,1,14) do set v%%v=

REM Rook/Queen
REM L and R
call :check_vals
for /l %%v in (1,1,7) do (
set /a seed-=1
set /a n-=1
if !seed! GEQ 1 set v%%v=!n!
)
call :check_vals
for /l %%v in (8,1,14) do (
set /a seed+=1
set /a n+=1
if !seed! LEQ 8 set v%%v=!n!
)
for /l %%v in (7,-1,1) do (
call set m=%%a!v%%v!%%
if "!m!" == "!%opp%Rook!" set illegal=true
if "!m!" == "!%opp%Queen!" set illegal=true
if not "!m!" == "!bbb!" if not "!m!" == "!www!" if not "!m!" == "!%opp%Rook!" if not "!m!" == "!%opp%Queen!" set illegal=
)
if "!illegal!" == "true" goto badmove
for /l %%v in (14,-1,8) do (
call set m=%%a!v%%v!%%
if "!m!" == "!%opp%Rook!" set illegal=true
if "!m!" == "!%opp%Queen!" set illegal=true
if not "!m!" == "!bbb!" if not "!m!" == "!www!" if not "!m!" == "!%opp%Rook!" if not "!m!" == "!%opp%Queen!" set illegal=
)
if "!illegal!" == "true" goto badmove

for /l %%v in (1,1,14) do set v%%v=

REM Up/Down
set n=!%turn%kinglocate!
for /l %%v in (1,1,7) do (
set /a n-=8
if !n! GEQ 1 set v%%v=!n!
)
set n=!%turn%kinglocate!
for /l %%v in (8,1,14) do (
set /a n+=8
if !n! LEQ 64 set v%%v=!n!
)
for /l %%v in (14,-1,8) do (
call set m=%%a!v%%v!%%
if "!m!" == "!%opp%Rook!" set illegal=true
if "!m!" == "!%opp%Queen!" set illegal=true
if not "!m!" == "!bbb!" if not "!m!" == "!www!" if not "!m!" == "!%opp%Rook!" if not "!m!" == "!%opp%Queen!" set illegal=
)
if "!illegal!" == "true" goto badmove
for /l %%v in (7,-1,1) do (
call set m=%%a!v%%v!%%
if "!m!" == "!%opp%Rook!" set illegal=true
if "!m!" == "!%opp%Queen!" set illegal=true
if not "!m!" == "!bbb!" if not "!m!" == "!www!" if not "!m!" == "!%opp%Rook!" if not "!m!" == "!%opp%Queen!" set illegal=
)
if "!illegal!" == "true" goto badmove
for /l %%v in (1,1,28) do set v%%v=



REM Bishop/Queen
call :check_vals
for /l %%v in (1,1,7) do (
set /a seed-=1
set /a n+=7
if !seed! GEQ 1 set v%%v=!n!
)
call :check_vals
for /l %%v in (8,1,14) do (
set /a seed+=1
set /a n-=7
if !seed! LEQ 8 set v%%v=!n!
)
call :check_vals
for /l %%v in (15,1,21) do (
set /a seed-=1
set /a n-=9
if !seed! GEQ 1 set v%%v=!n!
)
call :check_vals
for /l %%v in (22,1,28) do (
set /a seed+=1
set /a n+=9
if !seed! LEQ 8 set v%%v=!n!
)
(set n=28) && (set n2=22)
for /l %%f in (1,1,2) do (
for /l %%v in (!n!,-1,!n2!) do (
call set m=%%a!v%%v!%%
if "!m!" == "!%opp%Bishop!" set illegal=true
if "!m!" == "!%opp%Queen!" set illegal=true
if not "!m!" == "!bbb!" if not "!m!" == "!www!" if not "!m!" == "!%opp%Bishop!" if not "!m!" == "!%opp%Queen!" set illegal=
)
(set n=21) && (set n2=15)
if "!illegal!" == "true" goto badmove
)
(set n=14) && (set n2=8)
for /l %%f in (1,1,2) do (
for /l %%v in (!n!,-1,!n2!) do (
call set m=%%a!v%%v!%%
if "!m!" == "!%opp%Bishop!" set illegal=true
if "!m!" == "!%opp%Queen!" set illegal=true
if not "!m!" == "!bbb!" if not "!m!" == "!www!" if not "!m!" == "!%opp%Bishop!" if not "!m!" == "!%opp%Queen!" set illegal=
)
(set n=7) && (set n2=1)
if "!illegal!" == "true" goto badmove
)


:badmove
if "!illegal!" == "true" (
set a!origpos!=!piece!
set a!getpos!=!captured!
if "!piece!" == "!%turn%King!" set %turn%kinglocate=!origpos!
if "!piece!" == "!%turn%Pawn!" set %turn%pawn%origpos%=!prepawn!
set promo=
set piece=
set origpos=
set getpos=
echo.
echo Your king is either already in check, or you are attempting
echo to make a move that will put your king in check.
echo.
pause
goto game
)
if "!oppcheck!" == "t" exit /b

:las
set lastmove=Last move: [!piece!] !v_file1!!v_rank1!  Ä^!ar!  !v_file2!!v_rank2!
if /i not "!displastmove!" == "On " set lastmove=
echo !piece!-!origpos!-!getpos!>>tmp.txt
if "!turn!" == "!first!" set /a movec+=1

if "!turn!" == "w" (set oppt=b) ELSE set oppt=w
if not "!captured!" == "!www!" if not "!captured!" == "!bbb!" set /a !oppt!pieces-=1
if "!%oppt%pieces!" == "0" (set winner=!turn!) && goto gameover

if "!piece!" == "!%turn%King!" set !turn!kingpos=moved
if "!piece!" == "!%turn%Rook!" set a!origpos!rook=moved
if "!promo!" == "t" call :promo
set piece=
set v_file1=
set v_file2=
set v_rank1=
set v_rank2=
set vn=1
set origpos=
set getpos=
if "!turn!" == "w" (call set turn=b) ELSE call set turn=w
set rotater=r
if /i "!autorotate!" == "On " (call :rotate) && (call :rotate)
goto game


:check_vals
set /a seed=!%turn%kinglocate!%%8
if "!seed!" == "0" set seed=8
set n=!%turn%kinglocate!
exit /b

rem =================================== End of check ===================================

:pawn_rules
set prepawn=!%turn%pawn%origpos%!
set /a v1=!origpos!!ps!8
set /a v2=!origpos!!ps!7
set /a v3=!origpos!!ps!9
set /a v4=!origpos!!ps!16
if not "!getpos!" == "!v1!" (
if not "!getpos!" == "!v2!" (
if not "!getpos!" == "!v3!" (
if not "!getpos!" == "!v4!" (
set illegal=true
goto next
))))
set !turn!pawn!origpos!=moved
REM 2 Spaces
if "!getpos!" == "!v4!" (
if not "!a%v1%!" == "!bbb!" if not "!a%v1%!" == "!www!" set illegal=true
if not "!captured!" == "!bbb!" if not "!captured!" == "!www!" set illegal=true
if not "!prepawn!" == "orig" set illegal=true
if not "!illegal!" == "true" (set !turn!pawn!origpos!=2spaces) && set !turn!lastp=!getpos!
)
REM Straight
if "!getpos!" == "!v1!" if not "!captured!" == "!bbb!" if not "!captured!" == "!www!" set illegal=true
REM Right/Left
if "!getpos!" == "!v2!" goto lfpawn
if "!getpos!" == "!v3!" (
:lfpawn
if "!captured!" == "!bbb!" set illegal=true
if "!captured!" == "!www!" set illegal=true
set /a enp=!getpos!-!ps!8
REM set m=!a%enp%!
if "!a%enp%!" == "!%opp%Pawn!" if "!enp!" == "!%opp%lastp!" (
if "!captured!" == "!bbb!" (set a!enp!=!bbb!) && set illegal=
if "!captured!" == "!www!" (set a!enp!=!bbb!) && set illegal=
)
)
if "!turn!" == "w" for /l %%p in (1,1,8) do if "!getpos!" == "%%p" set promo=t
if "!turn!" == "b" for /l %%p in (57,1,64) do if "!getpos!" == "%%p" set promo=t
goto antiteleport


:rook_rules
set illegal=true
set /a seed=!origpos!%%8
if "!seed!" == "0" set seed=8
set /a seed2=!getpos!%%8
if "!seed2!" == "0" set seed2=8

set s1=-
set s2=GEQ 1
set n=!origpos!

REM Left and Right
if not "!seed!" == "!seed2!" (
if !getpos! GTR !origpos! ((set s1=+) && (set s2=LEQ 8))
for /l %%v in (1,1,7) do (
set /a seed!s1!=1
set /a n!s1!=1
if !seed! %s2% set v%%v=!n!
))

REM Up and Down
if "!seed!" == "!seed2!" (
if !getpos! GTR !origpos! ((set s1=+) && (set s2=LEQ 64))
for /l %%v in (1,1,7) do (
set /a n!s1!=8
if !n! %s2% set v%%v=!n!
))
for /l %%i in (1,1,7) do if "!getpos!" == "!v%%i!" set illegal=

if not "!piece!" == "!%turn%Queen!" if "!illegal!" == "true" goto next

REM Check against jumping over pieces...
if not "!illegal!" == "true" (
for /l %%j in (7,-1,1) do (
call set m=%%a!v%%j!%%
if not "!m!" == "!bbb!" if not "!m!" == "!www!" set illegal=true
if "!getpos!" == "!v%%j!" set illegal=
))
if "!illegal!" == "true" if "!piece!" == "!%turn%Queen!" goto bishop_rules
goto next



:knight_rules
set illegal=true
set /a v1=!origpos!-15
set /a v2=!origpos!-17
set /a v3=!origpos!-6
set /a v4=!origpos!-10
set /a v5=!origpos!+15
set /a v6=!origpos!+17
set /a v7=!origpos!+6
set /a v8=!origpos!+10
for /l %%c in (1,1,8) do if "!getpos!" == "!v%%c!" set illegal=
goto antiteleport


:bishop_rules
set illegal=true

REM Get direction...
set /a seed=!origpos!%%8
if "!seed!" == "0" set seed=8
set c=!seed!
set n=!origpos!
set /a seed2=!getpos!%%8


if "!seed2!" == "0" set seed2=8
if !getpos! GTR !origpos! set s3=+
if !getpos! LSS !origpos! set s3=-

REM echo !origpos! !getpos! !seed! !seed2! 

if !seed2! GTR !seed! ((set s1=+) && (set s2=LEQ 8)) 
if !seed2! LSS !seed! ((set s1=-) && (set s2=GEQ 1))

set inc=7
if "!s1!" == "+" if !getpos! GTR !origpos! set inc=9
if "!s1!" == "-" if !getpos! LSS !origpos! set inc=9

REM echo !s1! !s2! !s3! -- !inc!
REM pause

REM Check for valid moves...
for /l %%v in (1,1,7) do (
set /a c!s1!=1
set /a n=!n!!s3!!inc!
REM echo !c! !s2!  -- !n!
if !c! %s2% set v%%v=!n!
)
for /l %%i in (1,1,7) do if "!getpos!" == "!v%%i!" set illegal=
if "!illegal!" == "true" goto next

REM Check against jumping over pieces...
for /l %%j in (7,-1,1) do (
call set m=%%a!v%%j!%%
if not "!m!" == "!bbb!" if not "!m!" == "!www!" set illegal=true
if "!getpos!" == "!v%%j!" set illegal=
)
goto next

REM queen_rules is a combination of rook_rules and bishop_rules

:king_rules
set illegal=true
set /a v1=!origpos!-9
set /a v2=!origpos!-8
set /a v3=!origpos!-7
set /a v4=!origpos!-1
set /a v5=!origpos!+1
set /a v6=!origpos!+7
set /a v7=!origpos!+8
set /a v8=!origpos!+9
set /a v9=!origpos!-2
set /a v10=!origpos!+2
for /l %%c in (1,1,10) do if "!getpos!" == "!v%%c!" set illegal=

if "!getpos!" == "!v9!" (
if "!%turn%kingpos!" == "moved" (set illegal=true) && goto next
set /a n=!origpos!-3
if "!turn!" == "b" if not "!a1!" == "!%turn%Rook!" set illegal=true
if "!turn!" == "w" if not "!a57!" == "!%turn%Rook!" set illegal=true
if "!turn!" == "b" if "!a1rook!" == "moved" set illegal=true
if "!turn!" == "w" if "!a57rook!" == "moved" set illegal=true
for /l %%r in (!origpos!,-1,!n!) do (
if not "!a%%r!" == "!bbb!" if not "!a%%r!" == "!www!" if not "!a%%r!" == "!%turn%King!" set illegal=true
)
if not "!illegal!" == "true" (
if "!turn!" == "b" (set a1= ) && set a4=!%turn%Rook!
if "!turn!" == "w" (set a57= ) && set a60=!%turn%Rook!
)
goto next
)
if "!getpos!" == "!v10!" (
if "!%turn%kingpos!" == "moved" (set illegal=true) && goto next
set /a n=!origpos!+2
if "!turn!" == "b" if not "!a8!" == "!%turn%Rook!" set illegal=true
if "!turn!" == "w" if not "!a64!" == "!%turn%Rook!" set illegal=true
if "!turn!" == "b" if "!a8rook!" == "moved" set illegal=true
if "!turn!" == "w" if "!a64rook!" == "moved" set illegal=true
for /l %%r in (!origpos!,1,!n!) do (
if not "!a%%r!" == "!bbb!" if not "!a%%r!" == "!www!" if not "!a%%r!" == "!%turn%King!" set illegal=true
)
if not "!illegal!" == "true" (
if "!turn!" == "b" (set a8= ) && set a6=!%turn%Rook!
if "!turn!" == "w" (set a64= ) && set a62=!%turn%Rook!
)
goto next
)


:antiteleport
set /a tele1=!origpos!%%8
if "!tele1!" == "0" set tele1=8
set /a tele2=!getpos!%%8
if "!tele2!" == "0" set tele2=8
set /a anti=!tele1!-!tele2!
if !anti! LSS 0 set /a anti*=-1
if !anti! GTR 2 set illegal=true
if not "!illegal!" == "true" if "!piece!" == "!%turn%King!" set %turn%kinglocate=!getpos!
goto next

:promo
cls
echo.
echo.
call :r!scr!
ping localhost -n 2 >nul
:promo2
cls
echo Your pawn has reached its 8th rank.
echo Promote Pawn to:
echo.
echo 1. Queen
echo 2. Knight
echo 3. Bishop
echo 4. Rook
echo.
set /p choose=Choose a number: 
if /i "!choose!" == "1" ((set a!getpos!=!%turn%Queen!) && (set promo=) && exit /b)
if /i "!choose!" == "2" ((set a!getpos!=!%turn%Knight!) && (set promo=) && exit /b)
if /i "!choose!" == "3" ((set a!getpos!=!%turn%Bishop!) && (set promo=) && exit /b)
if /i "!choose!" == "4" ((set a!getpos!=!%turn%Rook!) && (set promo=) && exit /b)
goto promo2

:resign
cls
echo.
echo !%turn%player!, do you really wish to resign?
echo.
set /p choose=[y/n]: 
if /i "!choose!" == "n" goto game
if /i "!choose!" == "y" (
if "!turn!" == "w" (set winner=b) ELSE set winner=w
goto gameover
)
goto resign


:rotater
REM Yes, this is necessary to counter a weird bug.
call :rotate
goto game

:rotate
for /l %%a in (1,1,8) do set r%%a= 
for /l %%a in (1,1,8) do set f%%a= 
if "!rotater!" == "r" set /a scr+=1
if "!rotater!" == "l" set /a scr-=1
if !scr! LSS 1 set scr=4
if !scr! GTR 4 set scr=1
if "!scr!" == "1" (set file=) && (set rank=)
if "!scr!" == "2" (set rank=) && (set file=)
if "!scr!" == "3" (set file=) && (set rank=)
if "!scr!" == "4" (set rank=) && (set file=)
exit /b

REM Up
:r1
echo          A   B   C   D   E   F   G   H
echo.         !f1!   !f2!   !f3!   !f4!   !f5!   !f6!   !f7!   !f8!
echo        !tlc!!bar!!tcn!!bar!!tcn!!bar!!tcn!!bar!!tcn!!bar!!tcn!!bar!!tcn!!bar!!tcn!!bar!!trc!
echo     8!r1! !ver! !a1! !ve2! !a2! !ve2! !a3! !ve2! !a4! !ve2! !a5! !ve2! !a6! !ve2! !a7! !ve2! !a8! !ver!  8   [!piece!] !v_file1!!v_rank1!  Ä^>  !v_file2!!v_rank2!
echo        !lcn!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!rcn!
echo     7!r2! !ver! !a9! !ve2! !a10! !ve2! !a11! !ve2! !a12! !ve2! !a13! !ve2! !a14! !ve2! !a15! !ve2! !a16! !ver!  7   !lastmove!
echo        !lcn!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!rcn!
echo     6!r3! !ver! !a17! !ve2! !a18! !ve2! !a19! !ve2! !a20! !ve2! !a21! !ve2! !a22! !ve2! !a23! !ve2! !a24! !ver!  6
echo        !lcn!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!rcn!
echo     5!r4! !ver! !a25! !ve2! !a26! !ve2! !a27! !ve2! !a28! !ve2! !a29! !ve2! !a30! !ve2! !a31! !ve2! !a32! !ver!  5
echo        !lcn!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!rcn!
echo     4!r5! !ver! !a33! !ve2! !a34! !ve2! !a35! !ve2! !a36! !ve2! !a37! !ve2! !a38! !ve2! !a39! !ve2! !a40! !ver!  4
echo        !lcn!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!rcn!
echo     3!r6! !ver! !a41! !ve2! !a42! !ve2! !a43! !ve2! !a44! !ve2! !a45! !ve2! !a46! !ve2! !a47! !ve2! !a48! !ver!  3
echo        !lcn!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!rcn!
echo     2!r7! !ver! !a49! !ve2! !a50! !ve2! !a51! !ve2! !a52! !ve2! !a53! !ve2! !a54! !ve2! !a55! !ve2! !a56! !ver!  2
echo        !lcn!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!rcn!
echo     1!r8! !ver! !a57! !ve2! !a58! !ve2! !a59! !ve2! !a60! !ve2! !a61! !ve2! !a62! !ve2! !a63! !ve2! !a64! !ver!  1
echo        !blc!!bar!!bcn!!bar!!bcn!!bar!!bcn!!bar!!bcn!!bar!!bcn!!bar!!bcn!!bar!!bcn!!bar!!brc!
echo.  
echo          A   B   C   D   E   F   G   H
exit /b

REM Right
:r2
echo          1   2   3   4   5   6   7   8
echo.         !r8!   !r7!   !r6!   !r5!   !r4!   !r3!   !r2!   !r1!
echo        !tlc!!bar!!tcn!!bar!!tcn!!bar!!tcn!!bar!!tcn!!bar!!tcn!!bar!!tcn!!bar!!tcn!!bar!!trc!
echo     A!f1! !ver! !a57! !ve2! !a49! !ve2! !a41! !ve2! !a33! !ve2! !a25! !ve2! !a17! !ve2! !a9! !ve2! !a1! !ver!  A   [!piece!] !v_file1!!v_rank1!  Ä^>  !v_file2!!v_rank2!
echo        !lcn!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!rcn!
echo     B!f2! !ver! !a58! !ve2! !a50! !ve2! !a42! !ve2! !a34! !ve2! !a26! !ve2! !a18! !ve2! !a10! !ve2! !a2! !ver!  B   !lastmove!
echo        !lcn!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!rcn!
echo     C!f3! !ver! !a59! !ve2! !a51! !ve2! !a43! !ve2! !a35! !ve2! !a27! !ve2! !a19! !ve2! !a11! !ve2! !a3! !ver!  C
echo        !lcn!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!rcn!
echo     D!f4! !ver! !a60! !ve2! !a52! !ve2! !a44! !ve2! !a36! !ve2! !a28! !ve2! !a20! !ve2! !a12! !ve2! !a4! !ver!  D
echo        !lcn!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!rcn!
echo     E!f5! !ver! !a61! !ve2! !a53! !ve2! !a45! !ve2! !a37! !ve2! !a29! !ve2! !a21! !ve2! !a13! !ve2! !a5! !ver!  E
echo        !lcn!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!rcn!
echo     F!f6! !ver! !a62! !ve2! !a54! !ve2! !a46! !ve2! !a38! !ve2! !a30! !ve2! !a22! !ve2! !a14! !ve2! !a6! !ver!  F
echo        !lcn!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!rcn!
echo     G!f7! !ver! !a63! !ve2! !a55! !ve2! !a47! !ve2! !a39! !ve2! !a31! !ve2! !a23! !ve2! !a15! !ve2! !a7! !ver!  G
echo        !lcn!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!rcn!
echo     H!f8! !ver! !a64! !ve2! !a56! !ve2! !a48! !ve2! !a40! !ve2! !a32! !ve2! !a24! !ve2! !a16! !ve2! !a8! !ver!  H
echo        !blc!!bar!!bcn!!bar!!bcn!!bar!!bcn!!bar!!bcn!!bar!!bcn!!bar!!bcn!!bar!!bcn!!bar!!brc!
echo.  
echo          1   2   3   4   5   6   7   8
exit /b


REM Down
:r3
echo          H   G   F   E   D   C   B   A
echo.         !f8!   !f7!   !f6!   !f5!   !f4!   !f3!   !f2!   !f1!
echo        !tlc!!bar!!tcn!!bar!!tcn!!bar!!tcn!!bar!!tcn!!bar!!tcn!!bar!!tcn!!bar!!tcn!!bar!!trc!
echo     1!r8! !ver! !a64! !ve2! !a63! !ve2! !a62! !ve2! !a61! !ve2! !a60! !ve2! !a59! !ve2! !a58! !ve2! !a57! !ver!  1   [!piece!] !v_file1!!v_rank1!  Ä^>  !v_file2!!v_rank2!
echo        !lcn!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!rcn!
echo     2!r7! !ver! !a56! !ve2! !a55! !ve2! !a54! !ve2! !a53! !ve2! !a52! !ve2! !a51! !ve2! !a50! !ve2! !a49! !ver!  2   !lastmove!
echo        !lcn!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!rcn!
echo     3!r6! !ver! !a48! !ve2! !a47! !ve2! !a46! !ve2! !a45! !ve2! !a44! !ve2! !a43! !ve2! !a42! !ve2! !a41! !ver!  3
echo        !lcn!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!rcn!
echo     4!r5! !ver! !a40! !ve2! !a39! !ve2! !a38! !ve2! !a37! !ve2! !a36! !ve2! !a35! !ve2! !a34! !ve2! !a33! !ver!  4
echo        !lcn!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!rcn!
echo     5!r4! !ver! !a32! !ve2! !a31! !ve2! !a30! !ve2! !a29! !ve2! !a28! !ve2! !a27! !ve2! !a26! !ve2! !a25! !ver!  5
echo        !lcn!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!rcn!
echo     6!r3! !ver! !a24! !ve2! !a23! !ve2! !a22! !ve2! !a21! !ve2! !a20! !ve2! !a19! !ve2! !a18! !ve2! !a17! !ver!  6
echo        !lcn!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!rcn!
echo     7!r2! !ver! !a16! !ve2! !a15! !ve2! !a14! !ve2! !a13! !ve2! !a12! !ve2! !a11! !ve2! !a10! !ve2! !a9! !ver!  7
echo        !lcn!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!rcn!
echo     8!r1! !ver! !a8! !ve2! !a7! !ve2! !a6! !ve2! !a5! !ve2! !a4! !ve2! !a3! !ve2! !a2! !ve2! !a1! !ver!  8
echo        !blc!!bar!!bcn!!bar!!bcn!!bar!!bcn!!bar!!bcn!!bar!!bcn!!bar!!bcn!!bar!!bcn!!bar!!brc!
echo.  
echo          H   G   F   E   D   C   B   A
exit /b


REM Left
:r4
echo          8   7   6   5   4   3   2   1
echo.         !r1!   !r2!   !r3!   !r4!   !r5!   !r6!   !r7!   !r8!
echo        !tlc!!bar!!tcn!!bar!!tcn!!bar!!tcn!!bar!!tcn!!bar!!tcn!!bar!!tcn!!bar!!tcn!!bar!!trc!
echo     A!f1! !ver! !a8! !ve2! !a16! !ve2! !a24! !ve2! !a32! !ve2! !a40! !ve2! !a48! !ve2! !a56! !ve2! !a64! !ver!  A   [!piece!] !v_file1!!v_rank1!  Ä^>  !v_file2!!v_rank2!
echo        !lcn!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!rcn!
echo     B!f2! !ver! !a7! !ve2! !a15! !ve2! !a23! !ve2! !a31! !ve2! !a39! !ve2! !a47! !ve2! !a55! !ve2! !a63! !ver!  B   !lastmove!
echo        !lcn!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!rcn!
echo     C!f3! !ver! !a6! !ve2! !a14! !ve2! !a22! !ve2! !a30! !ve2! !a38! !ve2! !a46! !ve2! !a54! !ve2! !a62! !ver!  C
echo        !lcn!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!rcn!
echo     D!f4! !ver! !a5! !ve2! !a13! !ve2! !a21! !ve2! !a29! !ve2! !a37! !ve2! !a45! !ve2! !a53! !ve2! !a61! !ver!  D
echo        !lcn!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!rcn!
echo     E!f5! !ver! !a4! !ve2! !a12! !ve2! !a20! !ve2! !a28! !ve2! !a36! !ve2! !a44! !ve2! !a52! !ve2! !a60! !ver!  E
echo        !lcn!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!rcn!
echo     F!f6! !ver! !a3! !ve2! !a11! !ve2! !a19! !ve2! !a27! !ve2! !a35! !ve2! !a43! !ve2! !a51! !ve2! !a59! !ver!  F
echo        !lcn!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!rcn!
echo     G!f7! !ver! !a2! !ve2! !a10! !ve2! !a18! !ve2! !a26! !ve2! !a34! !ve2! !a42! !ve2! !a50! !ve2! !a58! !ver!  G
echo        !lcn!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!rcn!
echo     H!f8! !ver! !a1! !ve2! !a9! !ve2! !a17! !ve2! !a25! !ve2! !a33! !ve2! !a41! !ve2! !a49! !ve2! !a57! !ver!  H
echo        !blc!!bar!!bcn!!bar!!bcn!!bar!!bcn!!bar!!bcn!!bar!!bcn!!bar!!bcn!!bar!!bcn!!bar!!brc!
echo.  
echo          8   7   6   5   4   3   2   1
exit /b



:options
cls
echo.
echo Options
echo.
echo 1. Continue
echo 2. Declare Draw
echo 3. View game history
echo 4. View Pieces
echo 5. Save game for later
echo 6. Take Screenshot [.bat]
echo 7. Quit
echo.
set /p choose=Choose a number: 
if "!choose!" == "1" goto game
if "!choose!" == "2" (set draw=true) && goto gameover
if "!choose!" == "3" (
cls
set /a h=!movec!+!movec!+7
if !h! LSS 30 set h=30
mode 80,!h!
echo.
echo Game History
echo.
for /f "tokens=1,2-3 delims=-" %%a in (tmp.txt) do (
set n=1
set l=%%b
for /l %%h in (1,1,2) do ((
set /a filen=!l!%%8
set /a rankn=!l!/8
if not "!filen!" == "0" set /a rankn+=1
if "!filen!" == "1" set file!n!=a
if "!filen!" == "2" set file!n!=b
if "!filen!" == "3" set file!n!=c
if "!filen!" == "4" set file!n!=d
if "!filen!" == "5" set file!n!=e
if "!filen!" == "6" set file!n!=f
if "!filen!" == "7" set file!n!=g
if "!filen!" == "0" set file!n!=h
if "!rankn!" == "1" set rank!n!=8
if "!rankn!" == "2" set rank!n!=7
if "!rankn!" == "3" set rank!n!=6
if "!rankn!" == "4" set rank!n!=5
if "!rankn!" == "5" set rank!n!=4
if "!rankn!" == "6" set rank!n!=3
if "!rankn!" == "7" set rank!n!=2
if "!rankn!" == "8" set rank!n!=1
)
set l=%%c
set n=2
)
echo [%%a] !file1!!rank1! -^> !file2!!rank2!>>temphist.txt
echo [%%a] !file1!!rank1! -^> !file2!!rank2!
)
echo.
set /p save=Save history? [y/n]: 
if /i "!save!" == "y" (
echo.
set /p name=Save as: 
find /v "exit /b" <temphist.txt> "!name!.txt"
)
if /i exist "temphist.txt" del temphist.txt
mode 80,30
)


if "!choose!" == "4" (
cls
echo.
echo    ÚÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄ¿
echo    ³  Type  ³ White ³ Black ³
echo    ÃÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄ´
echo    ³  Pawn  ³   !wPawn!   ³   !bPawn!   ³
echo    ÃÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄ´
echo    ³  Rook  ³   !wRook!   ³   !bRook!   ³
echo    ÃÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄ´
echo    ³ Knight ³   !wKnight!   ³   !bKnight!   ³
echo    ÃÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄ´
echo    ³ Bishop ³   !wBishop!   ³   !bBishop!   ³
echo    ÃÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄ´
echo    ³ Queen  ³   !wQueen!   ³   !bQueen!   ³
echo    ÃÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄ´
echo    ³  King  ³   !wKing!   ³   !bKing!   ³
echo    ÀÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÙ
echo.
pause
)

if "!choose!" == "5" (
echo.
echo -b/Back
echo.
set /p name=Save game as: 
if /i "!name!" == "-b" goto options
echo.
if /i exist "!name!.sav" (
echo.
echo File already exists^^!
echo.
pause
goto options
)
for /l %%s in (1,1,64) do (
if "!a%%s!" == "!bPawn!" echo a%%s=^^!bPawn^^!>>!name!.sav
if "!a%%s!" == "!bRook!" echo a%%s=^^!bRook^^!>>!name!.sav
if "!a%%s!" == "!bKnight!" echo a%%s=^^!bKnight^^!>>!name!.sav
if "!a%%s!" == "!bBishop!" echo a%%s=^^!bBishop^^!>>!name!.sav
if "!a%%s!" == "!bQueen!" echo a%%s=^^!bQueen^^!>>!name!.sav
if "!a%%s!" == "!bKing!" echo a%%s=^^!bKing^^!>>!name!.sav
if "!a%%s!" == "!wPawn!" echo a%%s=^^!wPawn^^!>>!name!.sav
if "!a%%s!" == "!wRook!" echo a%%s=^^!wRook^^!>>!name!.sav
if "!a%%s!" == "!wKnight!" echo a%%s=^^!wKnight^^!>>!name!.sav
if "!a%%s!" == "!wBishop!" echo a%%s=^^!wBishop^^!>>!name!.sav
if "!a%%s!" == "!wQueen!" echo a%%s=^^!wQueen^^!>>!name!.sav
if "!a%%s!" == "!wKing!" echo a%%s=^^!wKing^^!>>!name!.sav
)
for /l %%p in (9,1,16) do echo bpawn%%p=!bpawn%%p!>>!name!.sav
for /l %%p in (49,1,56) do echo wpawn%%p=!wpawn%%p!>>!name!.sav
echo wlastp=!wlastp!>>!name!.sav
echo blastp=!blastp!>>!name!.sav
echo variant=!variant!>>!name!.sav
echo wpieces=!wpieces!>>!name!.sav
echo bpieces=!bpieces!>>!name!.sav
for %%r in (a1 a8 a57 a64) do echo %%rrook=!%%rrook!>>!name!.sav
for %%k in (w b) do echo %%kkinglocate=!%%kkinglocate!>>!name!.sav
for %%k in (w b) do echo %%kkingpos=!%%kkingpos!>>!name!.sav
for %%n in (w b) do echo %%nplayer=!%%nplayer!>>!name!.sav
echo first=!first!>>!name!.sav
echo scr=!scr!>>!name!.sav
echo movec=!movec!>>!name!.sav
echo turn=!turn!>>!name!.sav
echo Game saved to "!name!.sav"
echo.
pause
)
if "!choose!" == "6" (
:scrshot
set ar=Ä
echo.
echo -b/Back
echo.
set /p name=Screenshot name: 
if /i "!scr!" == "pbscr" if /i "!name!" == "-b" exit /b
if /i "!name!" == "-b" goto options
REM I'm awesome.
call :r!scr!>screenshot.txt
echo @echo off>>!name!.bat
echo echo.>>!name!.bat
for /f "tokens=1,2 delims=" %%a in (screenshot.txt) do echo echo.%%a>>!name!.bat
echo echo.>>!name!.bat
echo pause^>nul>>!name!.bat
del screenshot.txt
echo.
echo A screenshot of the board has been taken and stored to "!name!.bat"
echo.
pause
set ar=^>
if /i "!scr!" == "pbscr" exit /b
)
if "!choose!" == "7" goto menu
goto options

:gameover
if "!winner!" == "w" (set loser=b) ELSE set loser=w
cls
if not "!draw!" == "true" (
title Batch Chess - !%winner%player! Wins^^!
echo.
echo !%winner%player! [!t%winner%!] wins against !%loser%player! [!t%loser%!] in !movec! moves^^!
echo.
)
if "!draw!" == "true" (
echo.
echo Game ends in a draw.
echo.
)
set /p choose=Save game for playback? [y/n]: 
if /i "!choose!" == "n" if exist "tmp.txt" del tmp.txt
if /i "!choose!" == "n" goto menu
if /i "!choose!" == "y" (
echo.
echo -b/Back
echo.
set /p name=Save playback as: 
if /i "!name!" == "-b" goto gameover
if exist "!name!.txt" echo !name!.txt already exists!
if exist "!name!.txt" goto gameover
find /v "exit /b" <tmp.txt> "!name!.txt"
if exist "tmp.txt" del tmp.txt
echo.
echo Game playback saved.
echo.
pause
goto menu
)
goto gameover

REM =============================== END OF GAME ===============================

:default

set bf=07
set first=w
set autorotate=Off
set autoupdate=Off
set displastmove=On 
call :d1
call :d2
exit /b
:d1
set wPawn=P
set wRook=R
set wKnight=N
set wBishop=B
set wQueen=Q
set wKing=K
set bPawn=p
set bRook=r
set bKnight=n
set bBishop=b
set bQueen=q
set bKing=k
exit /b
:d2
set tlc=É
set trc=»
set blc=È
set brc=¼
set cro=Å
set bar=ÍÍÍ
set ver=º
set tcn=Ñ
set bcn=Ï
set lcn=Ç
set rcn=¶
set ba2=ÄÄÄ
set ve2=³
set www=Û
set bbb= 
exit /b

:save
if exist "config.bat" del config.bat
for %%w in (wPawn wRook wKnight wBishop wQueen wKing) do echo set %%w=!%%w!>>config.bat
for %%b in (bPawn bRook bKnight bBishop bQueen bKing) do echo set %%b=!%%b!>>config.bat
for %%B in (ve2 tlc trc blc brc cro bar ver tcn bcn lcn rcn ba2) do echo set %%B=!%%B!>>config.bat
echo set bf=!bf!>>config.bat
echo set first=!first!>>config.bat
echo set autorotate=!autorotate!>>config.bat
REM echo set autoupdate=!autoupdate!>>config.bat
echo set displastmove=!displastmove!>>config.bat
echo set www=!www!>>config.bat
echo set bbb=!bbb!>>config.bat
exit /b


:gameplayback
set ar=^>
echo.
echo Grab some popcorn...
echo.
set /p name=File name [-b/Back]: 
if /i "!name!" == "-b" goto menu
if /i not exist "!name!" set name=!name!.txt
if /i not exist "!name!" (
echo.
echo File not found^^!
echo.
pause
goto menu
)
if /i "!name!" == "b" goto menu
echo.
set /p speed=Playback speed [0 = Fastest]: 
if /i "!speed!" == "b" goto menu
:marker
echo.
set /p marker=Marker for current piece [3 characters]: 
if /i "!marker!" == "b" goto menu
if "!marker:~2!"=="" (
:notthree
echo.
echo The marker must be 3 characters long^^!
echo.
pause
cls
goto marker
)
if not "!marker:~3!"=="" goto notthree

call :scrload
set file1=
set file2=
set rank1=
set rank2=
call :screen

for /f "tokens=1,2-3 delims=-" %%a in (!name!) do (
set piece=!a%%b!
set a%%b=!marker!
set file2=
set rank2=
set /a file1=%%b%%8
set /a rank1=%%b/8
if not "!file1!" == "0" set /a rank1+=1
if "!file1!" == "1" set file1=a
if "!file1!" == "2" set file1=b
if "!file1!" == "3" set file1=c
if "!file1!" == "4" set file1=d
if "!file1!" == "5" set file1=e
if "!file1!" == "6" set file1=f
if "!file1!" == "7" set file1=g
if "!file1!" == "0" set file1=h
set rset=
if "!rank1!" == "1" (set rank1=8) && set rset=t
if "!rank1!" == "2" (set rank1=7) && set rset=t
if "!rank1!" == "3" (set rank1=6) && set rset=t
if "!rank1!" == "4" (set rank1=5) && set rset=t
if not "!rset!" == "t" (
if "!rank1!" == "5" set rank1=4
if "!rank1!" == "6" set rank1=3
if "!rank1!" == "7" set rank1=2
if "!rank1!" == "8" set rank1=1
set rset=
)

call :screen
set a%%b= !bbb! 
for %%w in (a1 a3 a5 a7 a10 a12 a14 a16 a17 a19 a21 a23 a26 a28 a30 a32 a33 a35 a37 a39 a42 a44 a46 a48 a49 a51 a53 a55 a58 a60 a62 a64) do (
if "!%%w!" == " !bbb! " set %%w= !www! 
)
set a%%c=!marker!
set /a file2=%%c%%8
set /a rank2=%%c/8
if not "!file2!" == "0" set /a rank2+=1
if "!file2!" == "1" set file2=a
if "!file2!" == "2" set file2=b
if "!file2!" == "3" set file2=c
if "!file2!" == "4" set file2=d
if "!file2!" == "5" set file2=e
if "!file2!" == "6" set file2=f
if "!file2!" == "7" set file2=g
if "!file2!" == "0" set file2=h
set rset=
if "!rank2!" == "1" (set rank2=8) && set rset=t
if "!rank2!" == "2" (set rank2=7) && set rset=t
if "!rank2!" == "3" (set rank2=6) && set rset=t
if "!rank2!" == "4" (set rank2=5) && set rset=t
if not "!rset!" == "t" (
if "!rank2!" == "5" set rank2=4
if "!rank2!" == "6" set rank2=3
if "!rank2!" == "7" set rank2=2
if "!rank2!" == "8" set rank2=1
set rset=
)
call :screen
set a%%c=!piece!
call :screen
)
echo.
echo  Game ends.
echo.
ping localhost -n 2 >nul
pause
goto menu

:screen
cls
call :rpbscr
echo.
echo  f/Fast Forward    p/Pause
choice /t:!speed! /d:f /c:pf /n >nul

if "!ERRORLEVEL!" == "1" (
echo.
echo 1. Continue
echo 2. Take Screenshot
echo 3. Quit and go to menu
echo.
set /p choose=Choose a number: 
cls
if "!choose!" == "2" set scr=pbscr
if "!choose!" == "2" call :scrshot
if "!choose!" == "3" goto menu
)
exit /b

:rpbscr
echo.
echo          A   B   C   D   E   F   G   H
echo.  
echo        ÉÍÍÍÑÍÍÍÑÍÍÍÑÍÍÍÑÍÍÍÑÍÍÍÑÍÍÍÑÍÍÍ»
echo     8  º!a1!³!a2!³!a3!³!a4!³!a5!³!a6!³!a7!³!a8!º  8    [!piece!] !file1!!rank1! Ä^!ar! !file2!!rank2!
echo        ÇÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄ¶
echo     7  º!a9!³!a10!³!a11!³!a12!³!a13!³!a14!³!a15!³!a16!º  7
echo        ÇÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄ¶
echo     6  º!a17!³!a18!³!a19!³!a20!³!a21!³!a22!³!a23!³!a24!º  6
echo        ÇÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄ¶
echo     5  º!a25!³!a26!³!a27!³!a28!³!a29!³!a30!³!a31!³!a32!º  5
echo        ÇÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄ¶
echo     4  º!a33!³!a34!³!a35!³!a36!³!a37!³!a38!³!a39!³!a40!º  4
echo        ÇÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄ¶
echo     3  º!a41!³!a42!³!a43!³!a44!³!a45!³!a46!³!a47!³!a48!º  3
echo        ÇÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄ¶
echo     2  º!a49!³!a50!³!a51!³!a52!³!a53!³!a54!³!a55!³!a56!º  2
echo        ÇÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄ¶
echo     1  º!a57!³!a58!³!a59!³!a60!³!a61!³!a62!³!a63!³!a64!º  1
echo        ÈÍÍÍÏÍÍÍÏÍÍÍÏÍÍÍÏÍÍÍÏÍÍÍÏÍÍÍÏÍÍÍ¼
echo.  
echo          A   B   C   D   E   F   G   H
exit /b

:scrload
for /l %%s in (1,1,64) do set a%%s= !bbb! 
for %%w in (a1 a3 a5 a7 a10 a12 a14 a16 a17 a19 a21 a23 a26 a28 a30 a32 a33 a35 a37 a39 a42 a44 a46 a48 a49 a51 a53 a55 a58 a60 a62 a64) do set %%w= !www! 
set piece=


REM Black
for /l %%P in (9,1,16) do set a%%P= !bPawn! 
for %%R in (a1 a8) do set %%R= !bRook! 
for %%K in (a2 a7) do set %%K= !bKnight! 
for %%B in (a3 a6) do set %%B= !bBishop! 
set a4= !bQueen! 
set a5= !bKing! 


REM White
for /l %%P in (49,1,56) do set a%%P= !wPawn! 
for %%R in (a57 a64) do set %%R= !wRook! 
for %%K in (a58 a63) do set %%K= !wKnight! 
for %%B in (a59 a62) do set %%B= !wBishop! 
set a60= !wQueen! 
set a61= !wKing! 
exit /b

::=============================================================================================


:about
title Batch Chess v0.8 By Kolt Koding
cls
echo.
echo                                  Release v0.8
echo.
echo.
echo             Batch Chess                                  __
echo                                                         /  \
echo    Entirely coded and produced by      "We're all       \__/
echo       Kolto101 and Kolt Koding                         /____\     in the game
echo                                           just pawns    ^|  ^|   
echo     ASCII Pawn/left Knight by "jgs"                     ^|__^|    of life."
echo                                                        (====)
echo          Copyright (C) 2012                            }===={
echo                                                       (______)
echo.
echo  Release Notes:
echo.
echo  Tested and works on Windows: XP (with choice.COM), Vista, and 7
echo.
echo  Batch Chess has almost everything that a normal chess game would have,
echo  EXCEPT for a checkmate system. It does, however, have a check system.
echo  It also has many other features, some which are still experimental. Enjoy^^!
echo.
echo  ** PLEASE report ANY bugs or crashes that may occur to: kolto101@gmail.com **
echo.             Visit http://www.koltkoding.tk/ for updates and more
echo.
echo.
echo  b/Back   u/Check for updates   y/Kolto101's Youtube   k/Kolt Koding Website
echo.
set /p choose=Choose a letter: 
if /i "!choose!" == "b" goto menu
if /i "!choose!" == "k" start http://www.koltkoding.tk/
if /i "!choose!" == "y" start http://www.youtube.com/user/kolto101/videos
if /i "!choose!" == "u" start http://www.koltkoding.tk/batchchess/
goto about

:config
mode 80,30
cls
echo.
echo  ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo  º       Configure       º
echo  ÌÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹
echo  º 1. Customize Pieces   º
echo  º 2. Customize Board    º
echo  º 3. Themes             º
echo  º 4. Settings           º
echo  º 5. Debug              º
echo  º                       º
echo  º  Press b to go back   º
echo  ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo.
set /p choose=Choose a number: 
if /i "!choose!" == "b" goto menu
if "!choose!" == "1" goto customize
if "!choose!" == "2" goto customboard
if "!choose!" == "3" goto themes
if "!choose!" == "4" goto settings
if "!choose!" == "5" goto debug
goto config


:settings
mode 80,30
cls
set tw=White
set tb=Black
echo.
echo  ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo  º            Settings            º
echo  ÌÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹
echo  º                                º
echo  º   1. First turn         !t%first%!  º
echo  º   2. Auto-rotate          !autorotate!  º
echo  º   3. DisplayLastMove      !displastmove!  º
REM echo  º   4. Automatic Updating   !autoupdate!  º
echo  º                                º
echo  º      Press b to go back        º
echo  ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo.
set /p choose=Choose a number: 
if /i "!choose!" == "b" goto config
if "!choose!" == "1" (
if "!first!" == "w" (set first=b) ELSE set first=w
)
if "!choose!" == "2" (
if "!autorotate!" == "Off" (set autorotate=On ) ELSE set autorotate=Off
)
if "!choose!" == "3" (
if "!displastmove!" == "Off" (set displastmove=On ) ELSE set displastmove=Off
)
REM if "!choose!" == "4" (
REM if "!autoupdate!" == "Off" (set autoupdate=On ) ELSE set autoupdate=Off
REM )
call :save
goto settings


:debug
REM Debug by Kolto101 and Kolt Koding
cls
mode 80,30
echo If you are familiar with Batch scripting, then use the debug for whatever.
echo For example, typing "set" would execute the set command and give a full list
echo of variables. Type "(command name here) /?" to find out what a command does.
echo.
echo b/Back
echo.
set /p debug=Debug code: 
call :debugcheck
echo.
echo Executing code...
mode 100,10000
@echo on
Prompt $S
%debug%
@echo off
echo.
pause
goto debug

:debugcheck
if not "%debug:~1%"=="" exit /b
if not '%debug%' == 'b' (exit /b) ELSE (
if '%debugexit%' == 'true' (
set debugexit=
goto play)
goto config
)

:themes
set previousbf=%bf%
cls
echo.
echo                           0 = Black      8 = Gray
echo                           1 = Blue       9 = Light Blue
echo                           2 = Green      A = Light Green
echo                           3 = Aqua       B = Light Aqua
echo                           4 = Red        C = Light Red
echo                           5 = Purple     D = Light Purple
echo                           6 = Yellow     E = Light Yellow
echo                           7 = White      F = Bright White
echo.
echo                                  Default: 0A
echo                                  OS Default: 07
echo.
echo               Set the background color and the foreground color.
echo               The first letter/number is the background color,
echo               the second is the foreground. Do not use spaces.
echo.
echo                               Type "m" to go back.
echo.
set /p bf=Set Background/Foreground: 
if /i "%bf%" == "m" (
set bf=%previousbf%
goto config)
if %bf% LSS a if %bf% GTR 99 goto themes
if not "%bf:~2%"=="" (
echo The color code cannot be more than 2 characters long.
echo.
pause
goto themes
)
if %bf% GTR FF goto themes
if %bf% LSS 00 goto themes
color %bf%
call :save
goto themes

:customboard
mode 80,30
cls
call :scrload
echo.
echo    Choose a number next to the graphic.         Current Values
echo.
echo     !tlc!!bar!!tcn!!bar!!tcn!!bar!!tcn!!bar!!tcn!!bar!!tcn!!bar!!tcn!!bar!!tcn!!bar!!trc!           1: !tlc!	 2: !trc!
echo     !ver!!a1!!ve2!!a2!!ve2!!a3!!ve2!!a4!!ve2!!a5!!ve2!!a6!!ve2!!a7!!ve2!!a8!!ver!
echo     !lcn!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!rcn!           3: !blc!	 4: !brc!
echo     !ver!!a9!!ve2!!a10!!ve2!!a11!!ve2!!a12!!ve2!!a13!!ve2!!a14!!ve2!!a15!!ve2!!a16!!ver!
echo     !lcn!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!rcn!           5: !cro!	 6: !bar!
echo     !ver!!a17!!ve2!!a18!!ve2!!a19!!ve2!!a20!!ve2!!a21!!ve2!!a22!!ve2!!a23!!ve2!!a24!!ver!
echo     !lcn!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!rcn!           7: !ver!	 8: !tcn!
echo     !ver!!a25!!ve2!!a26!!ve2!!a27!!ve2!!a28!!ve2!!a29!!ve2!!a30!!ve2!!a31!!ve2!!a32!!ver!
echo     !lcn!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!rcn!           9: !bcn!	10: !lcn!
echo     !ver!!a33!!ve2!!a34!!ve2!!a35!!ve2!!a36!!ve2!!a37!!ve2!!a38!!ve2!!a39!!ve2!!a40!!ver!
echo     !lcn!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!rcn!          11: !rcn!	12: !ba2!
echo     !ver!!a41!!ve2!!a42!!ve2!!a43!!ve2!!a44!!ve2!!a45!!ve2!!a46!!ve2!!a47!!ve2!!a48!!ver!
echo     !lcn!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!rcn!          13: !ve2!
echo     !ver!!a49!!ve2!!a50!!ve2!!a51!!ve2!!a52!!ve2!!a53!!ve2!!a54!!ve2!!a55!!ve2!!a56!!ver!
echo     !lcn!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!cro!!ba2!!rcn!          14: White Squares - !www!
echo     !ver!!a57!!ve2!!a58!!ve2!!a59!!ve2!!a60!!ve2!!a61!!ve2!!a62!!ve2!!a63!!ve2!!a64!!ver!          15: Black Squares - !bbb!
echo     !blc!!bar!!bcn!!bar!!bcn!!bar!!bcn!!bar!!bcn!!bar!!bcn!!bar!!bcn!!bar!!bcn!!bar!!brc!
echo.
echo.
echo  b/Back   d/Default
echo.
set /p choose=Choose a number: 
if /i "!choose!" == "b" goto config
if /i "!choose!" == "d" call :d2
if "!choose!" == "1" (set tochange=tlc) && call :changegraphic
if "!choose!" == "2" (set tochange=trc) && call :changegraphic
if "!choose!" == "3" (set tochange=blc) && call :changegraphic
if "!choose!" == "4" (set tochange=brc) && call :changegraphic
if "!choose!" == "5" (set tochange=cro) && call :changegraphic
if "!choose!" == "6" (set tochange=bar) && call :changegraphic
if "!choose!" == "7" (set tochange=ver) && call :changegraphic
if "!choose!" == "8" (set tochange=tcn) && call :changegraphic
if "!choose!" == "9" (set tochange=bcn) && call :changegraphic
if "!choose!" == "10" (set tochange=lcn) && call :changegraphic
if "!choose!" == "11" (set tochange=rcn) && call :changegraphic
if "!choose!" == "12" (set tochange=ba2) && call :changegraphic
if "!choose!" == "13" (set tochange=ve2) && call :changegraphic
if "!choose!" == "14" (set tochange=www) && call :changegraphic
if "!choose!" == "15" (set tochange=bbb) && call :changegraphic
set bar=!bar:~0,1!!bar:~0,1!!bar:~0,1!
set ba2=!ba2:~0,1!!ba2:~0,1!!ba2:~0,1!
call :save
goto customboard

:customize
mode 80,30
cls
echo.   
echo    ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo    ³                        ³
echo    ³    Customize Pieces    ³
echo    ³                        ³
echo    ÃÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄ´
echo    ³  Type  ³ White ³ Black ³
echo    ÃÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄ´
echo    ³  Pawn  ³ 1  !wPawn!  ³ 7   !bPawn! ³
echo    ÃÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄ´
echo    ³  Rook  ³ 2  !wRook!  ³ 8   !bRook! ³
echo    ÃÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄ´
echo    ³ Knight ³ 3  !wKnight!  ³ 9   !bKnight! ³
echo    ÃÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄ´
echo    ³ Bishop ³ 4  !wBishop!  ³ 10  !bBishop! ³
echo    ÃÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄ´
echo    ³ Queen  ³ 5  !wQueen!  ³ 11  !bQueen! ³
echo    ÃÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄ´
echo    ³  King  ³ 6  !wKing!  ³ 12  !bKing! ³
echo    ÀÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÙ
echo.
echo  b/Back   d/Default
echo.
set /p choose=Choose a number to change the current graphic: 
if /i "!choose!" == "b" goto config
if "!choose!" == "1" set tochange=wPawn
if "!choose!" == "2" set tochange=wRook
if "!choose!" == "3" set tochange=wKnight
if "!choose!" == "4" set tochange=wBishop
if "!choose!" == "5" set tochange=wQueen
if "!choose!" == "6" set tochange=wKing
if "!choose!" == "7" set tochange=bPawn
if "!choose!" == "8" set tochange=bRook
if "!choose!" == "9" set tochange=bKnight
if "!choose!" == "10" set tochange=bBishop
if "!choose!" == "11" set tochange=bQueen
if "!choose!" == "12" set tochange=bKing
if !choose! GEQ 1 (
if !choose! LEQ 12 (
call :changegraphic
))
if /i "!choose!" == "d" call :d1 && call :save
goto customize


:changegraphic
cls
echo.
echo Currently editting: !tochange! !%tochange%!
echo.
echo Enter a character below, or choose and extended character.
echo.
echo -b/Back   -s/Open extended characters
echo.
set /p symbol=Chracter: 
if /i "!symbol!" == "-b" exit /b
if "!symbol!" == "" goto changegraphic

if not "!symbol:~1!"=="" (
if /i not "!symbol!" == "-s" (
echo You may only use 1 character.
echo.
pause
goto changegraphic
))
if /i "!symbol!" == "-s" call :symbolstart
if /i "!symbol!" == "-s" goto changegraphic

REM add checker against same graphics
set !tochange!=!symbol!
call :save
exit /b




:symbolstart
mode 80,50
cls
call :symbolecho
set symbolnum=
echo b/Back
echo.
set /p symbolnum=Enter the character number to output #
if /i "!symbolnum!" == "b" exit /b

if not !symbolnum! GTR 0 goto symbolstart
if !symbolnum! GTR 254 goto symbolstart
call :symbol
if !symbolnum! GEQ 32 (
if !symbolnum! LEQ 126 (
echo.
echo Characters 32-126 can be accessed via keyboard.
pause>nul
goto symbolstart
))
if "!symbol!" == "N/A" goto symbolstart
:symbolask
cls
echo.
echo Symbol: !symbol!
echo.
echo Would you like to use this symbol?
set /p choose=[y/n]: 
if /i "!choose!" == "n" goto symbolstart
if /i "!choose!" == "y" exit /b
goto symbolask

:symbol
set symbol=N/A
if "!symbolnum!" == "1" set symbol=
if "!symbolnum!" == "2" set symbol=
if "!symbolnum!" == "3" set symbol=
if "!symbolnum!" == "4" set symbol=
if "!symbolnum!" == "5" set symbol=
if "!symbolnum!" == "6" set symbol=
if "!symbolnum!" == "11" set symbol=
if "!symbolnum!" == "12" set symbol=
if "!symbolnum!" == "14" set symbol=
if "!symbolnum!" == "15" set symbol=
if "!symbolnum!" == "16" set symbol=
if "!symbolnum!" == "17" set symbol=
if "!symbolnum!" == "18" set symbol=
if "!symbolnum!" == "19" set symbol=
if "!symbolnum!" == "20" set symbol=
if "!symbolnum!" == "21" set symbol=
if "!symbolnum!" == "22" set symbol=
if "!symbolnum!" == "23" set symbol=
if "!symbolnum!" == "24" set symbol=
if "!symbolnum!" == "25" set symbol=
if "!symbolnum!" == "27" set symbol=
if "!symbolnum!" == "28" set symbol=
if "!symbolnum!" == "29" set symbol=
if "!symbolnum!" == "30" set symbol=
if "!symbolnum!" == "31" set symbol=
REM 32 - 126 are accessible via Keyboard
if "!symbolnum!" == "127" set symbol=
if "!symbolnum!" == "128" set symbol=€
if "!symbolnum!" == "129" set symbol=
if "!symbolnum!" == "130" set symbol=‚
if "!symbolnum!" == "131" set symbol=ƒ
if "!symbolnum!" == "132" set symbol=„
if "!symbolnum!" == "133" set symbol=…
if "!symbolnum!" == "134" set symbol=†
if "!symbolnum!" == "135" set symbol=‡
if "!symbolnum!" == "136" set symbol=ˆ
if "!symbolnum!" == "137" set symbol=‰
if "!symbolnum!" == "138" set symbol=Š
if "!symbolnum!" == "139" set symbol=‹
if "!symbolnum!" == "140" set symbol=Œ
if "!symbolnum!" == "141" set symbol=
if "!symbolnum!" == "142" set symbol=
if "!symbolnum!" == "143" set symbol=
if "!symbolnum!" == "144" set symbol=
if "!symbolnum!" == "145" set symbol=‘
if "!symbolnum!" == "146" set symbol=’
if "!symbolnum!" == "147" set symbol=“
if "!symbolnum!" == "148" set symbol=”
if "!symbolnum!" == "149" set symbol=•
if "!symbolnum!" == "150" set symbol=–
if "!symbolnum!" == "151" set symbol=—
if "!symbolnum!" == "152" set symbol=˜
if "!symbolnum!" == "153" set symbol=™
if "!symbolnum!" == "154" set symbol=š
if "!symbolnum!" == "155" set symbol=›
if "!symbolnum!" == "156" set symbol=œ
if "!symbolnum!" == "157" set symbol=
if "!symbolnum!" == "158" set symbol=
if "!symbolnum!" == "159" set symbol=Ÿ
if "!symbolnum!" == "160" set symbol= 
if "!symbolnum!" == "161" set symbol=¡
if "!symbolnum!" == "162" set symbol=¢
if "!symbolnum!" == "163" set symbol=£
if "!symbolnum!" == "164" set symbol=¤
if "!symbolnum!" == "165" set symbol=¥
if "!symbolnum!" == "166" set symbol=¦
if "!symbolnum!" == "167" set symbol=§
if "!symbolnum!" == "168" set symbol=¨
if "!symbolnum!" == "169" set symbol=©
if "!symbolnum!" == "170" set symbol=ª
if "!symbolnum!" == "171" set symbol=«
if "!symbolnum!" == "172" set symbol=¬
if "!symbolnum!" == "173" set symbol=­
if "!symbolnum!" == "174" set symbol=®
if "!symbolnum!" == "175" set symbol=¯
if "!symbolnum!" == "176" set symbol=°
if "!symbolnum!" == "177" set symbol=±
if "!symbolnum!" == "178" set symbol=²
if "!symbolnum!" == "179" set symbol=³
if "!symbolnum!" == "180" set symbol=´
if "!symbolnum!" == "181" set symbol=µ
if "!symbolnum!" == "182" set symbol=¶
if "!symbolnum!" == "183" set symbol=·
if "!symbolnum!" == "184" set symbol=¸
if "!symbolnum!" == "185" set symbol=¹
if "!symbolnum!" == "186" set symbol=º
if "!symbolnum!" == "187" set symbol=»
if "!symbolnum!" == "188" set symbol=¼
if "!symbolnum!" == "189" set symbol=½
if "!symbolnum!" == "190" set symbol=¾
if "!symbolnum!" == "191" set symbol=¿
if "!symbolnum!" == "192" set symbol=À
if "!symbolnum!" == "193" set symbol=Á
if "!symbolnum!" == "194" set symbol=Â
if "!symbolnum!" == "195" set symbol=Ã
if "!symbolnum!" == "196" set symbol=Ä
if "!symbolnum!" == "197" set symbol=Å
if "!symbolnum!" == "198" set symbol=Æ
if "!symbolnum!" == "199" set symbol=Ç
if "!symbolnum!" == "200" set symbol=È
if "!symbolnum!" == "201" set symbol=É
if "!symbolnum!" == "202" set symbol=Ê
if "!symbolnum!" == "203" set symbol=Ë
if "!symbolnum!" == "204" set symbol=Ì
if "!symbolnum!" == "205" set symbol=Í
if "!symbolnum!" == "206" set symbol=Î
if "!symbolnum!" == "207" set symbol=Ï
if "!symbolnum!" == "208" set symbol=Ğ
if "!symbolnum!" == "209" set symbol=Ñ
if "!symbolnum!" == "210" set symbol=Ò
if "!symbolnum!" == "211" set symbol=Ó
if "!symbolnum!" == "212" set symbol=Ô
if "!symbolnum!" == "213" set symbol=Õ
if "!symbolnum!" == "214" set symbol=Ö
if "!symbolnum!" == "215" set symbol=×
if "!symbolnum!" == "216" set symbol=Ø
if "!symbolnum!" == "217" set symbol=Ù
if "!symbolnum!" == "218" set symbol=Ú
if "!symbolnum!" == "219" set symbol=Û
if "!symbolnum!" == "220" set symbol=Ü
if "!symbolnum!" == "221" set symbol=İ
if "!symbolnum!" == "222" set symbol=Ş
if "!symbolnum!" == "223" set symbol=ß
if "!symbolnum!" == "224" set symbol=à
if "!symbolnum!" == "225" set symbol=á
if "!symbolnum!" == "226" set symbol=â
if "!symbolnum!" == "227" set symbol=ã
if "!symbolnum!" == "228" set symbol=ä
if "!symbolnum!" == "229" set symbol=å
if "!symbolnum!" == "230" set symbol=æ
if "!symbolnum!" == "231" set symbol=ç
if "!symbolnum!" == "232" set symbol=è
if "!symbolnum!" == "233" set symbol=é
if "!symbolnum!" == "234" set symbol=ê
if "!symbolnum!" == "235" set symbol=ë
if "!symbolnum!" == "236" set symbol=ì
if "!symbolnum!" == "237" set symbol=í
if "!symbolnum!" == "238" set symbol=î
if "!symbolnum!" == "239" set symbol=ï
if "!symbolnum!" == "240" set symbol=ğ
if "!symbolnum!" == "241" set symbol=ñ
if "!symbolnum!" == "242" set symbol=ò
if "!symbolnum!" == "243" set symbol=ó
if "!symbolnum!" == "244" set symbol=ô
if "!symbolnum!" == "245" set symbol=õ
if "!symbolnum!" == "246" set symbol=ö
if "!symbolnum!" == "247" set symbol=÷
if "!symbolnum!" == "248" set symbol=ø
if "!symbolnum!" == "249" set symbol=ù
if "!symbolnum!" == "250" set symbol=ú
if "!symbolnum!" == "251" set symbol=û
if "!symbolnum!" == "252" set symbol=ü
if "!symbolnum!" == "253" set symbol=ı
if "!symbolnum!" == "254" set symbol=ş
exit /b

:symbolecho
echo.
echo      1:      2:      3:      4:      5:      6:      11:     12: 
echo.
echo      14:     15:     16:     17:     18:     19:     20:     21: 
echo.
echo      22:     23:     24:     25:     27:     28:     29:     30:    
echo.
echo      31: 
echo.
echo                 Characters 32-126 can be accessed via keyboard.
echo.
echo.
echo      127:    128: €   129:    130: ‚   131: ƒ   132: „   133: …   134: †
echo.
echo      135: ‡   136: ˆ   137: ‰   138: Š   139: ‹   140: Œ   141:    142: 
echo.
echo      143:    144:    145: ‘   146: ’   147: “   148: ”   149: •   150: –
echo.
echo      151: —   152: ˜   153: ™   154: š   155: ›   156: œ   157:    158: 
echo.
echo      159: Ÿ   160:     161: ¡   162: ¢   163: £   164: ¤   165: ¥   166: ¦
echo.
echo      167: §   168: ¨   169: ©   170: ª   171: «   172: ¬   173: ­   174: ®
echo.
echo      175: ¯   176: °   177: ±   178: ²   179: ³   180: ´   181: µ   182: ¶
echo.
echo      183: ·   184: ¸   185: ¹   186: º   187: »   188: ¼   189: ½   190: ¾
echo.
echo      191: ¿   192: À   193: Á   194: Â   195: Ã   196: Ä   197: Å   198: Æ
echo.
echo      199: Ç   200: È   201: É   202: Ê   203: Ë   204: Ì   205: Í   206: Î
echo.
echo      207: Ï   208: Ğ   209: Ñ   210: Ò   211: Ó   212: Ô   213: Õ   214: Ö
echo.
echo      215: ×   216: Ø   217: Ù   218: Ú   219: Û   220: Ü   221: İ   222: Ş
echo.
echo      223: ß   224: à   225: á   226: â   227: ã   228: ä   229: å   230: æ
echo.
echo      231: ç   232: è   233: é   234: ê   235: ë   236: ì   237: í   238: î
echo.
echo      239: ï   240: ğ   241: ñ   242: ò   243: ó   244: ô   245: õ   246: ö
echo.
echo      247: ÷   248: ø   249: ù   250: ú   251: û   252: ü   253: ı   254: ş
echo.
echo.
exit /b

:tutorial
cls
echo.
echo Batch Chess is played like normal chess, except there is no checkmate system.
echo There is, however a check system. Each player must manually check to see
echo if their king is in checkmate. If it is, the player must resign.
echo.
echo Would you like to read the rules at: "..wikipedia.org/wiki/Rules_of_chess" ?
echo.
set /p choose=[y/n]: 
if /i "!choose!" == "y" start http://en.wikipedia.org/wiki/Rules_of_chess
if /i "!choose!" == "n" goto menu
goto tutorial

