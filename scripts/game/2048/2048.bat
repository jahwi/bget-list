::copyright Justin Quinn 2018
::no part of this code may be altered, modified or reproduced without express written permission from Justin Quinn

::::BgetDescription#2048 game in batch.
::::BgetAuthor#JustinQuinn
::::BgetCategory#game
::::Bgettags#numbers;number

@echo off
TITLE 2048
mode con cols=35 lines=21
:main
echo.
echo           ÕÕª …Õª ∫ ∫ …Õª
echo             ∫ ∫ ∫ ∫ ∫ ∫ ∫
echo           …Õº ∫ ∫ »Õπ ÃÕπ
echo           ∫   ∫ ∫   ∫ ∫ ∫
echo           »ÕÕ »Õº   ∫ »Õº
for %%a in (5) do echo.
set loop=0
:loopa
echo.
set /a loop=%loop%+1
if %loop% LSS 6 goto loopa
pause
set loop=0
:loopb
echo.
set /a loop=%loop%+1
if %loop% LSS 21 goto loopb

:setup
set a1=0
set a2=0
set a3=0
set a4=0
set b1=0
set b2=0
set b3=0
set b4=0
set c1=0
set c2=0
set c3=0
set c4=0
set d1=0
set d2=0
set d3=0
set d4=0
set score=0

:design
:a1
if %a1% EQU 0 set a001a=       
if %a1% GEQ 2 set a001a=∞∞∞∞∞∞∞
if %a1% EQU 0 set a001b=       
if %a1% EQU 2 set a001b=∞∞∞2∞∞∞
if %a1% EQU 4 set a001b=∞∞∞4∞∞∞
if %a1% EQU 8 set a001b=∞∞∞8∞∞∞
if %a1% EQU 16 set a001b=∞∞∞16∞∞
if %a1% EQU 32 set a001b=∞∞∞32∞∞
if %a1% EQU 64 set a001b=∞∞∞64∞∞
if %a1% EQU 128 set a001b=∞∞128∞∞
if %a1% EQU 256 set a001b=∞∞256∞∞
if %a1% EQU 512 set a001b=∞∞512∞∞
if %a1% EQU 1024 set a001b=∞∞1024∞
if %a1% EQU 2048 set a001b=∞∞2048∞
:a2
if %a2% EQU 0 set a002a=       
if %a2% GEQ 2 set a002a=∞∞∞∞∞∞∞
if %a2% EQU 0 set a002b=       
if %a2% EQU 2 set a002b=∞∞∞2∞∞∞
if %a2% EQU 4 set a002b=∞∞∞4∞∞∞
if %a2% EQU 8 set a002b=∞∞∞8∞∞∞
if %a2% EQU 16 set a002b=∞∞∞16∞∞
if %a2% EQU 32 set a002b=∞∞∞32∞∞
if %a2% EQU 64 set a002b=∞∞∞64∞∞
if %a2% EQU 128 set a002b=∞∞128∞∞
if %a2% EQU 256 set a002b=∞∞256∞∞
if %a2% EQU 512 set a002b=∞∞512∞∞
if %a2% EQU 1024 set a002b=∞∞1024∞
if %a2% EQU 2048 set a002b=∞∞2048∞
:a3
if %a3% EQU 0 set a003a=       
if %a3% GEQ 2 set a003a=∞∞∞∞∞∞∞
if %a3% EQU 0 set a003b=       
if %a3% EQU 2 set a003b=∞∞∞2∞∞∞
if %a3% EQU 4 set a003b=∞∞∞4∞∞∞
if %a3% EQU 8 set a003b=∞∞∞8∞∞∞
if %a3% EQU 16 set a003b=∞∞∞16∞∞
if %a3% EQU 32 set a003b=∞∞∞32∞∞
if %a3% EQU 64 set a003b=∞∞∞64∞∞
if %a3% EQU 128 set a003b=∞∞128∞∞
if %a3% EQU 256 set a003b=∞∞256∞∞
if %a3% EQU 512 set a003b=∞∞512∞∞
if %a3% EQU 1024 set a003b=∞∞1024∞
if %a3% EQU 2048 set a003b=∞∞2048∞
:a4
if %a4% EQU 0 set a004a=       
if %a4% GEQ 2 set a004a=∞∞∞∞∞∞∞
if %a4% EQU 0 set a004b=       
if %a4% EQU 2 set a004b=∞∞∞2∞∞∞
if %a4% EQU 4 set a004b=∞∞∞4∞∞∞
if %a4% EQU 8 set a004b=∞∞∞8∞∞∞
if %a4% EQU 16 set a004b=∞∞∞16∞∞
if %a4% EQU 32 set a004b=∞∞∞32∞∞
if %a4% EQU 64 set a004b=∞∞∞64∞∞
if %a4% EQU 128 set a004b=∞∞128∞∞
if %a4% EQU 256 set a004b=∞∞256∞∞
if %a4% EQU 512 set a004b=∞∞512∞∞
if %a4% EQU 1024 set a004b=∞∞1024∞
if %a4% EQU 2048 set a004b=∞∞2048∞
:b1
if %b1% EQU 0 set b001a=       
if %b1% GEQ 2 set b001a=∞∞∞∞∞∞∞
if %b1% EQU 0 set b001b=       
if %b1% EQU 2 set b001b=∞∞∞2∞∞∞
if %b1% EQU 4 set b001b=∞∞∞4∞∞∞
if %b1% EQU 8 set b001b=∞∞∞8∞∞∞
if %b1% EQU 16 set b001b=∞∞∞16∞∞
if %b1% EQU 32 set b001b=∞∞∞32∞∞
if %b1% EQU 64 set b001b=∞∞∞64∞∞
if %b1% EQU 128 set b001b=∞∞128∞∞
if %b1% EQU 256 set b001b=∞∞256∞∞
if %b1% EQU 512 set b001b=∞∞512∞∞
if %b1% EQU 1024 set b001b=∞∞1024∞
if %b1% EQU 2048 set b001b=∞∞2048∞
:b2
if %b2% EQU 0 set b002a=       
if %b2% GEQ 2 set b002a=∞∞∞∞∞∞∞
if %b2% EQU 0 set b002b=       
if %b2% EQU 2 set b002b=∞∞∞2∞∞∞
if %b2% EQU 4 set b002b=∞∞∞4∞∞∞
if %b2% EQU 8 set b002b=∞∞∞8∞∞∞
if %b2% EQU 16 set b002b=∞∞∞16∞∞
if %b2% EQU 32 set b002b=∞∞∞32∞∞
if %b2% EQU 64 set b002b=∞∞∞64∞∞
if %b2% EQU 128 set b002b=∞∞128∞∞
if %b2% EQU 256 set b002b=∞∞256∞∞
if %b2% EQU 512 set b002b=∞∞512∞∞
if %b2% EQU 1024 set b002b=∞∞1024∞
if %b2% EQU 2048 set b002b=∞∞2048∞
:b3
if %b3% EQU 0 set b003a=       
if %b3% GEQ 2 set b003a=∞∞∞∞∞∞∞
if %b3% EQU 0 set b003b=       
if %b3% EQU 2 set b003b=∞∞∞2∞∞∞
if %b3% EQU 4 set b003b=∞∞∞4∞∞∞
if %b3% EQU 8 set b003b=∞∞∞8∞∞∞
if %b3% EQU 16 set b003b=∞∞∞16∞∞
if %b3% EQU 32 set b003b=∞∞∞32∞∞
if %b3% EQU 64 set b003b=∞∞∞64∞∞
if %b3% EQU 128 set b003b=∞∞128∞∞
if %b3% EQU 256 set b003b=∞∞256∞∞
if %b3% EQU 512 set b003b=∞∞512∞∞
if %b3% EQU 1024 set b003b=∞∞1024∞
if %b3% EQU 2048 set b003b=∞∞2048∞
:b4
if %b4% EQU 0 set b004a=       
if %b4% GEQ 2 set b004a=∞∞∞∞∞∞∞
if %b4% EQU 0 set b004b=       
if %b4% EQU 2 set b004b=∞∞∞2∞∞∞
if %b4% EQU 4 set b004b=∞∞∞4∞∞∞
if %b4% EQU 8 set b004b=∞∞∞8∞∞∞
if %b4% EQU 16 set b004b=∞∞∞16∞∞
if %b4% EQU 32 set b004b=∞∞∞32∞∞
if %b4% EQU 64 set b004b=∞∞∞64∞∞
if %b4% EQU 128 set b004b=∞∞128∞∞
if %b4% EQU 256 set b004b=∞∞256∞∞
if %b4% EQU 512 set b004b=∞∞512∞∞
if %b4% EQU 1024 set b004b=∞∞1024∞
if %b4% EQU 2048 set b004b=∞∞2048∞
:c1
if %c1% EQU 0 set c001a=       
if %c1% GEQ 2 set c001a=∞∞∞∞∞∞∞
if %c1% EQU 0 set c001b=       
if %c1% EQU 2 set c001b=∞∞∞2∞∞∞
if %c1% EQU 4 set c001b=∞∞∞4∞∞∞
if %c1% EQU 8 set c001b=∞∞∞8∞∞∞
if %c1% EQU 16 set c001b=∞∞∞16∞∞
if %c1% EQU 32 set c001b=∞∞∞32∞∞
if %c1% EQU 64 set c001b=∞∞∞64∞∞
if %c1% EQU 128 set c001b=∞∞128∞∞
if %c1% EQU 256 set c001b=∞∞256∞∞
if %c1% EQU 512 set c001b=∞∞512∞∞
if %c1% EQU 1024 set c001b=∞∞1024∞
if %c1% EQU 2048 set c001b=∞∞2048∞
:c2
if %c2% EQU 0 set c002a=       
if %c2% GEQ 2 set c002a=∞∞∞∞∞∞∞
if %c2% EQU 0 set c002b=       
if %c2% EQU 2 set c002b=∞∞∞2∞∞∞
if %c2% EQU 4 set c002b=∞∞∞4∞∞∞
if %c2% EQU 8 set c002b=∞∞∞8∞∞∞
if %c2% EQU 16 set c002b=∞∞∞16∞∞
if %c2% EQU 32 set c002b=∞∞∞32∞∞
if %c2% EQU 64 set c002b=∞∞∞64∞∞
if %c2% EQU 128 set c002b=∞∞128∞∞
if %c2% EQU 256 set c002b=∞∞256∞∞
if %c2% EQU 512 set c002b=∞∞512∞∞
if %c2% EQU 1024 set c002b=∞∞1024∞
if %c2% EQU 2048 set c002b=∞∞2048∞
:c3
if %c3% EQU 0 set c003a=       
if %c3% GEQ 2 set c003a=∞∞∞∞∞∞∞
if %c3% EQU 0 set c003b=       
if %c3% EQU 2 set c003b=∞∞∞2∞∞∞
if %c3% EQU 4 set c003b=∞∞∞4∞∞∞
if %c3% EQU 8 set c003b=∞∞∞8∞∞∞
if %c3% EQU 16 set c003b=∞∞∞16∞∞
if %c3% EQU 32 set c003b=∞∞∞32∞∞
if %c3% EQU 64 set c003b=∞∞∞64∞∞
if %c3% EQU 128 set c003b=∞∞128∞∞
if %c3% EQU 256 set c003b=∞∞256∞∞
if %c3% EQU 512 set c003b=∞∞512∞∞
if %c3% EQU 1024 set c003b=∞∞1024∞
if %c3% EQU 2048 set c003b=∞∞2048∞
:c4
if %c4% EQU 0 set c004a=       
if %c4% GEQ 2 set c004a=∞∞∞∞∞∞∞
if %c4% EQU 0 set c004b=       
if %c4% EQU 2 set c004b=∞∞∞2∞∞∞
if %c4% EQU 4 set c004b=∞∞∞4∞∞∞
if %c4% EQU 8 set c004b=∞∞∞8∞∞∞
if %c4% EQU 16 set c004b=∞∞∞16∞∞
if %c4% EQU 32 set c004b=∞∞∞32∞∞
if %c4% EQU 64 set c004b=∞∞∞64∞∞
if %c4% EQU 128 set c004b=∞∞128∞∞
if %c4% EQU 256 set c004b=∞∞256∞∞
if %c4% EQU 512 set c004b=∞∞512∞∞
if %c4% EQU 1024 set c004b=∞∞1024∞
if %c4% EQU 2048 set c004b=∞∞2048∞
:d1
if %d1% EQU 0 set d001a=       
if %d1% GEQ 2 set d001a=∞∞∞∞∞∞∞
if %d1% EQU 0 set d001b=       
if %d1% EQU 2 set d001b=∞∞∞2∞∞∞
if %d1% EQU 4 set d001b=∞∞∞4∞∞∞
if %d1% EQU 8 set d001b=∞∞∞8∞∞∞
if %d1% EQU 16 set d001b=∞∞∞16∞∞
if %d1% EQU 32 set d001b=∞∞∞32∞∞
if %d1% EQU 64 set d001b=∞∞∞64∞∞
if %d1% EQU 128 set d001b=∞∞128∞∞
if %d1% EQU 256 set d001b=∞∞256∞∞
if %d1% EQU 512 set d001b=∞∞512∞∞
if %d1% EQU 1024 set d001b=∞∞1024∞
if %d1% EQU 2048 set d001b=∞∞2048∞
:d2
if %d2% EQU 0 set d002a=       
if %d2% GEQ 2 set d002a=∞∞∞∞∞∞∞
if %d2% EQU 0 set d002b=       
if %d2% EQU 2 set d002b=∞∞∞2∞∞∞
if %d2% EQU 4 set d002b=∞∞∞4∞∞∞
if %d2% EQU 8 set d002b=∞∞∞8∞∞∞
if %d2% EQU 16 set d002b=∞∞∞16∞∞
if %d2% EQU 32 set d002b=∞∞∞32∞∞
if %d2% EQU 64 set d002b=∞∞∞64∞∞
if %d2% EQU 128 set d002b=∞∞128∞∞
if %d2% EQU 256 set d002b=∞∞256∞∞
if %d2% EQU 512 set d002b=∞∞512∞∞
if %d2% EQU 1024 set d002b=∞∞1024∞
if %d2% EQU 2048 set d002b=∞∞2048∞
:d3
if %d3% EQU 0 set d003a=       
if %d3% GEQ 2 set d003a=∞∞∞∞∞∞∞
if %d3% EQU 0 set d003b=       
if %d3% EQU 2 set d003b=∞∞∞2∞∞∞
if %d3% EQU 4 set d003b=∞∞∞4∞∞∞
if %d3% EQU 8 set d003b=∞∞∞8∞∞∞
if %d3% EQU 16 set d003b=∞∞∞16∞∞
if %d3% EQU 32 set d003b=∞∞∞32∞∞
if %d3% EQU 64 set d003b=∞∞∞64∞∞
if %d3% EQU 128 set d003b=∞∞128∞∞
if %d3% EQU 256 set d003b=∞∞256∞∞
if %d3% EQU 512 set d003b=∞∞512∞∞
if %d3% EQU 1024 set d003b=∞∞1024∞
if %d3% EQU 2048 set d003b=∞∞2048∞
:d4
if %d4% EQU 0 set d004a=       
if %d4% GEQ 2 set d004a=∞∞∞∞∞∞∞
if %d4% EQU 0 set d004b=       
if %d4% EQU 2 set d004b=∞∞∞2∞∞∞
if %d4% EQU 4 set d004b=∞∞∞4∞∞∞
if %d4% EQU 8 set d004b=∞∞∞8∞∞∞
if %d4% EQU 16 set d004b=∞∞∞16∞∞
if %d4% EQU 32 set d004b=∞∞∞32∞∞
if %d4% EQU 64 set d004b=∞∞∞64∞∞
if %d4% EQU 128 set d004b=∞∞128∞∞
if %d4% EQU 256 set d004b=∞∞256∞∞
if %d4% EQU 512 set d004b=∞∞512∞∞
if %d4% EQU 1024 set d004b=∞∞1024∞
if %d4% EQU 2048 set d004b=∞∞2048∞

:score
set /a score=%a1%+%a2%+%a3%+%a4%+%b1%+%b2%+%b3%+%b4%+%c1%+%c2%+%c3%+%c4%+%d1%+%d2%+%d3%+%d4%

:board
cls
echo  SCORE: %score%
echo  …ÕÕÕÕÕÕÕÀÕÕÕÕÕÕÕÀÕÕÕÕÕÕÕÀÕÕÕÕÕÕÕª
echo  ∫%a001a%∫%a002a%∫%a003a%∫%a004a%∫
echo  ∫%a001b%∫%a002b%∫%a003b%∫%a004b%∫
echo  ∫%a001a%∫%a002a%∫%a003a%∫%a004a%∫
echo  ÃÕÕÕÕÕÕÕŒÕÕÕÕÕÕÕŒÕÕÕÕÕÕÕŒÕÕÕÕÕÕÕπ
echo  ∫%b001a%∫%b002a%∫%b003a%∫%b004a%∫
echo  ∫%b001b%∫%b002b%∫%b003b%∫%b004b%∫
echo  ∫%b001a%∫%b002a%∫%b003a%∫%b004a%∫
echo  ÃÕÕÕÕÕÕÕŒÕÕÕÕÕÕÕŒÕÕÕÕÕÕÕŒÕÕÕÕÕÕÕπ
echo  ∫%c001a%∫%c002a%∫%c003a%∫%c004a%∫
echo  ∫%c001b%∫%c002b%∫%c003b%∫%c004b%∫
echo  ∫%c001a%∫%c002a%∫%c003a%∫%c004a%∫
echo  ÃÕÕÕÕÕÕÕŒÕÕÕÕÕÕÕŒÕÕÕÕÕÕÕŒÕÕÕÕÕÕÕπ
echo  ∫%d001a%∫%d002a%∫%d003a%∫%d004a%∫
echo  ∫%d001b%∫%d002b%∫%d003b%∫%d004b%∫
echo  ∫%d001a%∫%d002a%∫%d003a%∫%d004a%∫
echo  »ÕÕÕÕÕÕÕ ÕÕÕÕÕÕÕ ÕÕÕÕÕÕÕ ÕÕÕÕÕÕÕº
echo  PRESS W,S,A,D TO SLIDE THE TILES
choice /c wasd /n
if %errorlevel% EQU 1 call:up
if %errorlevel% EQU 2 call:left
if %errorlevel% EQU 3 call:down
if %errorlevel% EQU 4 call:right

:up
set num=0
:upmove
if %a1% EQU 0 (
set a1=%b1%
set b1=0
)
if %b1% EQU 0 (
set b1=%c1%
set c1=0
)
if %c1% EQU 0 (
set c1=%d1%
set d1=0
)
if %a2% EQU 0 (
set a2=%b2%
set b2=0
)
if %b2% EQU 0 (
set b2=%c2%
set c2=0
)
if %c2% EQU 0 (
set c2=%d2%
set d2=0
)
if %a3% EQU 0 (
set a3=%b3%
set b3=0
)
if %b3% EQU 0 (
set b3=%c3%
set c3=0
)
if %c3% EQU 0 (
set c3=%d3%
set d3=0
)
if %a4% EQU 0 (
set a4=%b4%
set b4=0
)
if %b4% EQU 0 (
set b4=%c4%
set c4=0
)
if %c4% EQU 0 (
set c4=%d4%
set d4=0
)
set /a num=%num%+1
if %num% LSS 3 goto upmove

:upadd
if %a1% EQU %b1% (
set /a a1=%a1%*2
set b1=0
)
if %b1% EQU %c1% (
set /a b1=%b1%*2
set c1=0
)
if %c1% EQU %d1% (
set /a c1=%c1%*2
set d1=0
)
if %a2% EQU %b2% (
set /a a2=%a2%*2
set b2=0
)
if %b2% EQU %c2% (
set /a b2=%b2%*2
set c2=0
)
if %c2% EQU %d2% (
set /a c2=%c2%*2
set d2=0
)
if %a3% EQU %b3% (
set /a a3=%a3%*2
set b3=0
)
if %b3% EQU %c3% (
set /a b3=%b3%*2
set c3=0
)
if %c3% EQU %d3% (
set /a c3=%c3%*2
set d3=0
)
if %a4% EQU %b4% (
set /a a4=%a4%*2
set b4=0
)
if %b4% EQU %c4% (
set /a b4=%b4%*2
set c4=0
)
if %c4% EQU %d4% (
set /a c4=%c4%*2
set d4=0
)

:upmoveb
if %b1% EQU 0 (
set b1=%c1%
set c1=0
)
if %b2% EQU 0 (
set b2=%c2%
set c2=0
)
if %b3% EQU 0 (
set b3=%c3%
set c3=0
)
if %b4% EQU 0 (
set b4=%c4%
set c4=0
)
if %c1% EQU 0 (
set d1=%d1%
)
if %c2% EQU 0 (
set d2=%d2%
)
if %c3% EQU 0 (
set d3=%d3%
)
if %c4% EQU 0 (
set d4=%d4%
)
goto newtile


:down
set num=0
:downmove
if %d1% EQU 0 (
set d1=%c1%
set c1=0
)
if %c1% EQU 0 (
set c1=%b1%
set b1=0
)
if %b1% EQU 0 (
set b1=%a1%
set a1=0
)
if %d2% EQU 0 (
set d2=%c2%
set c2=0
)
if %c2% EQU 0 (
set c2=%b2%
set b2=0
)
if %b2% EQU 0 (
set b2=%a2%
set a2=0
)
if %d3% EQU 0 (
set d3=%c3%
set c3=0
)
if %c3% EQU 0 (
set c3=%b3%
set b3=0
)
if %b3% EQU 0 (
set b3=%a3%
set a3=0
)
if %d4% EQU 0 (
set d4=%c4%
set c4=0
)
if %c4% EQU 0 (
set c4=%b4%
set b4=0
)
if %b4% EQU 0 (
set b4=%a4%
set a4=0
)
set /a num=%num%+1
if %num% LSS 3 goto downmove

:downadd
if %c1% EQU %d1% (
set /a d1=%d1%*2
set c1=0
)
if %b1% EQU %c1% (
set /a c1=%c1%*2
set b1=0
)
if %a1% EQU %b1% (
set /a b1=%b1%*2
set a1=0
)
if %c2% EQU %d2% (
set /a d2=%d2%*2
set c2=0
)
if %b2% EQU %c2% (
set /a c2=%c2%*2
set b2=0
)
if %a2% EQU %b2% (
set /a b2=%b2%*2
set a2=0
)
if %c3% EQU %d3% (
set /a d3=%d3%*2
set c3=0
)
if %b3% EQU %c3% (
set /a c3=%c3%*2
set b3=0
)
if %a3% EQU %b3% (
set /a b3=%b3%*2
set a3=0
)
if %c4% EQU %d4% (
set /a d4=%d4%*2
set c4=0
)
if %b4% EQU %c4% (
set /a c4=%c4%*2
set b4=0
)
if %a4% EQU %b4% (
set /a b4=%b4%*2
set a4=0
)

:downmoveb
if %c1% EQU 0 (
set c1=%b1%
set b1=0
)
if %c2% EQU 0 (
set c2=%b2%
set b2=0
)
if %c3% EQU 0 (
set c3=%b3%
set b3=0
)
if %c4% EQU 0 (
set c4=%b4%
set b4=0
)
if %b1% EQU 0 (
set b1=%a1%
set a1=0
)
if %b2% EQU 0 (
set b2=%a2%
set a2=0
)
if %b3% EQU 0 (
set b3=%a3%
set a3=0
)
if %b4% EQU 0 (
set b4=%a4%
set a4=0
)
goto newtile


:left
set num=0
:leftmove
if %a1% EQU 0 (
set a1=%a2%
set a2=0
)
if %a2% EQU 0 (
set a2=%a3%
set a3=0
)
if %a3% EQU 0 (
set a3=%a4%
set a4=0
)
if %b1% EQU 0 (
set b1=%b2%
set b2=0
)
if %b2% EQU 0 (
set b2=%b3%
set b3=0
)
if %b3% EQU 0 (
set b3=%b4%
set b4=0
)
if %c1% EQU 0 (
set c1=%c2%
set c2=0
)
if %c2% EQU 0 (
set c2=%c3%
set c3=0
)
if %c3% EQU 0 (
set c3=%c4%
set c4=0
)
if %d1% EQU 0 (
set d1=%d2%
set d2=0
)
if %d2% EQU 0 (
set d2=%d3%
set d3=0
)
if %d3% EQU 0 (
set d3=%d4%
set d4=0
)
set /a num=%num%+1
if %num% LSS 3 goto leftmove

:leftadd
if %d3% EQU %d4% (
set /a d3=%d3%*2
set d4=0
)
if %d2% EQU %d3% (
set /a d2=%d2%*2
set d3=0
)
if %d1% EQU %d2% (
set /a d1=%d1%*2
set d2=0
)
if %c3% EQU %c4% (
set /a c3=%c3%*2
set c4=0
)
if %c2% EQU %c3% (
set /a c2=%c2%*2
set c3=0
)
if %c1% EQU %c2% (
set /a c1=%c1%*2
set c2=0
)
if %b3% EQU %b4% (
set /a b3=%b3%*2
set b4=0
)
if %b2% EQU %b3% (
set /a b2=%b2%*2
set b3=0
)
if %b1% EQU %b2% (
set /a b1=%b1%*2
set b2=0
)
if %a3% EQU %a4% (
set /a a3=%a3%*2
set a4=0
)
if %a2% EQU %a3% (
set /a a2=%a2%*2
set a3=0
)
if %a1% EQU %a2% (
set /a a1=%a1%*2
set a2=0
)

:leftmoveb
if %a2% EQU 0 (
set a2=%a3%
set a3=0
)
if %b2% EQU 0 (
set b2=%b3%
set b3=0
)
if %c2% EQU 0 (
set c2=%c3%
set c3=0
)
if %d2% EQU 0 (
set d2=%d3%
set d3=0
)
if %a3% EQU 0 (
set a3=%a4%
set a4=0
)
if %b3% EQU 0 (
set b3=%b4%
set b4=0
)
if %c3% EQU 0 (
set c3=%c4%
set c4=0
)
if %d3% EQU 0 (
set d3=%d4%
set d4=0
)
goto newtile

:right
set num=0
:rightmove
if %a2% EQU 0 (
set a2=%a1%
set a1=0
)
if %a3% EQU 0 (
set a3=%a2%
set a2=0
)
if %a4% EQU 0 (
set a4=%a3%
set a3=0
)
if %b2% EQU 0 (
set b2=%b1%
set b1=0
)
if %b3% EQU 0 (
set b3=%b2%
set b2=0
)
if %b4% EQU 0 (
set b4=%b3%
set b3=0
)
if %c2% EQU 0 (
set c2=%c1%
set c1=0
)
if %c3% EQU 0 (
set c3=%c2%
set c2=0
)
if %c4% EQU 0 (
set c4=%c3%
set c3=0
)
if %d2% EQU 0 (
set d2=%d1%
set d1=0
)
if %d3% EQU 0 (
set d3=%d2%
set d2=0
)
if %d4% EQU 0 (
set d4=%d3%
set d3=0
)
set /a num=%num%+1
if %num% LSS 3 goto rightmove

:rightadd
if %d3% EQU %d4% (
set /a d4=%d4%*2
set d3=0
)
if %d2% EQU %d3% (
set /a d3=%d3%*2
set d2=0
)
if %d1% EQU %d2% (
set /a d2=%d2%*2
set d1=0
)
if %c3% EQU %c4% (
set /a c4=%c4%*2
set c3=0
)
if %c2% EQU %c3% (
set /a c3=%c3%*2
set c2=0
)
if %c1% EQU %c2% (
set /a c2=%c2%*2
set c1=0
)
if %b3% EQU %b4% (
set /a b4=%b4%*2
set b3=0
)
if %b2% EQU %b3% (
set /a b3=%b3%*2
set b2=0
)
if %b1% EQU %b2% (
set /a b2=%b2%*2
set b1=0
)
if %a3% EQU %a4% (
set /a a4=%a4%*2
set a3=0
)
if %a2% EQU %a3% (
set /a a3=%a3%*2
set a2=0
)
if %a1% EQU %a2% (
set /a a2=%a2%*2
set a1=0
)

:rightmoveb
if %a3% EQU 0 (
set a3=%a2%
set a2=0
)
if %b3% EQU 0 (
set b3=%b2%
set b2=0
)
if %c3% EQU 0 (
set c3=%c2%
set c2=0
)
if %d3% EQU 0 (
set d3=%d2%
set d2=0
)
if %a2% EQU 0 (
set a2=%a1%
set a1=0
)
if %b2% EQU 0 (
set b2=%b1%
set b1=0
)
if %c2% EQU 0 (
set c2=%c1%
set c1=0
)
if %d2% EQU 0 (
set d2=%d1%
set d1=0
)
goto newtile

:newtile
set /a slot=%random%*16/32767+1
set /a num=%random%*10/32767+1

if %slot% EQU 1 goto seta1
if %slot% EQU 2 goto seta2
if %slot% EQU 3 goto seta3
if %slot% EQU 4 goto seta4
if %slot% EQU 5 goto setb1
if %slot% EQU 6 goto setb2
if %slot% EQU 7 goto setb3
if %slot% EQU 8 goto setb4
if %slot% EQU 9 goto setc1
if %slot% EQU 10 goto setc2
if %slot% EQU 11 goto setc3
if %slot% EQU 12 goto setc4
if %slot% EQU 13 goto setd1
if %slot% EQU 14 goto setd2
if %slot% EQU 15 goto setd3
if %slot% EQU 16 goto setd4

:seta1
if %a1% EQU 0 goto seta1b
goto newtile
:seta2
if %a2% EQU 0 goto seta2b
goto newtile
:seta3
if %a3% EQU 0 goto seta3b
goto newtile
:seta4
if %a4% EQU 0 goto seta4b
goto newtile
:setb1
if %b1% EQU 0 goto setb1b
goto newtile
:setb2
if %b2% EQU 0 goto setb2b
goto newtile
:setb3
if %b3% EQU 0 goto setb3b
goto newtile
:setb4
if %b4% EQU 0 goto setb4b
goto newtile
:setc1
if %c1% EQU 0 goto setc1b
goto newtile
:setc2
if %c2% EQU 0 goto setc2b
goto newtile
:setc3
if %c3% EQU 0 goto setc3b
goto newtile
:setc4
if %c4% EQU 0 goto setc4b
goto newtile
:setd1
if %d1% EQU 0 goto setd1b
goto newtile
:setd2
if %d2% EQU 0 goto setd2b
goto newtile
:setd3
if %d3% EQU 0 goto setd3b
goto newtile
:setd4
if %d4% EQU 0 goto setd4b
goto newtile


:seta1b
set a1=2
if %num% EQU 9 set a1=4
goto newtileend
:seta2b
set a2=2
if %num% EQU 9 set a2=4
goto newtileend
:seta3b
set a3=2
if %num% EQU 9 set a3=4
goto newtileend
:seta4b
set a4=2
if %num% EQU 9 set a4=4
goto newtileend

:setb1b
set b1=2
if %num% EQU 9 set b1=4
goto newtileend
:setb2b
set b2=2
if %num% EQU 9 set b2=4
goto newtileend
:setb3b
set b3=2
if %num% EQU 9 set b3=4
goto newtileend
:setb4b
set b4=2
if %num% EQU 9 set b4=4
goto newtileend

:setc1b
set c1=2
if %num% EQU 9 set c1=4
goto newtileend
:setc2b
set c2=2
if %num% EQU 9 set c2=4
goto newtileend
:setc3b
set c3=2
if %num% EQU 9 set c3=4
goto newtileend
:setc4b
set c4=2
if %num% EQU 9 set c4=4
goto newtileend

:setd1b
set d1=2
if %num% EQU 9 set d1=4
goto newtileend
:setd2b
set d2=2
if %num% EQU 9 set d2=4
goto newtileend
:setd3b
set d3=2
if %num% EQU 9 set d3=4
goto newtileend
:setd4b
set d4=2
if %num% EQU 9 set d4=4
goto newtileend

:newtileend
goto design
pause