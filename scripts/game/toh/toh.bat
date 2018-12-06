@echo off
TITLE Towers of Hanoi - Batch
::::BgetDescription#Towers of Hanoi in batch.
::::BgetAuthor#FaceRadiation
::::BgetCategory#game
:start
cls
echo.
echo         __¦¦¦¦¦                                                               
echo       ¦¦¦¦¦¦¦¯¦¦¦¦                                                          
echo       ¦¦¦¦¦¦¦  ¦¦¦¦                                                         
echo        ¦¦¦¦                                                                   
echo        ¦¦¦¦ ¦       _¦_                                                  
echo        ¦¦¦¦¦¦¦  ¦¦_ ¦¦¦¦  ¦¦_      ___                               
echo        ¦¦¦¦¦¦¦ _¦ ¦ ¦¦¦¦ _¦ ¦     ¦¯¯¯¦   ___  ¦_ _¦¦ ¦¦¦¦¦  __     
echo        ¦¦¦¦    ¦¦¦¦ ¦ ¦  ¦¦¦¦    ¦¦      ¦  ¦  ¦¦¦¦¦¦ ¦¦    ¦       
echo        ¦¦¦¦    ¦¦¦¦ ¦¦   ¦¦¦¦    ¦¦  ¯¦ _¦¦¦¦  ¦¦ ¦¦¦ ¦¦¯¯   ¯¦     
echo       ¦¦¦¦¦¦¦       ¦ ¦          ¦¦¦¦¦¯ ¦¦¦¦¦ ¦¦  ¦¦ ¦¦¦__  ¦_¦    
echo                     ¦ ¦¦   
echo.
echo PRESENTS...
echo.
echo http://faragames.webs.com
ping localhost -n 3 >nul
:reset
set l1=0
set l2=0
set l3=0
set l4=0
set l5=0

set m1=5
set m2=4
set m3=3
set m4=2
set m5=1

set r1=0
set r2=0
set r3=0
set r4=0
set r5=0

:main
cls
echo.
echo Type "help" for instructions and "com" for commands
echo.
echo.
echo        %l5%     %m5%     %r5%
echo        %l4%     %m4%     %r4%
echo        %l3%     %m3%     %r3%
echo        %l2%     %m2%     %r2%
echo       _%l1%_   _%m1%_   _%r1%_
echo.
echo        1     2     3
echo.
if %l1% == 5 if %l2% == 4 if %l3% == 3 if %l4% == 2 if %l5% == 1 (
	echo You win!
	echo.
)
if %r1% == 5 if %r2% == 4 if %r3% == 3 if %r4% == 2 if %r5% == 1 (
	echo You win!
	echo.
)
set /p command=Command: 
echo.
if "%command%" == "reset" goto reset
if "%command%" == "help" goto help
if "%command%" == "com" goto com

if "%command%" == "1to2" (
	if %l1% == 0 (
		echo There is nothing to move.
		echo.
		pause
	)
	if %l1% gtr 0 if %l2% == 0 (
		if %m1% == 0 (
			set /a m1 = %l1%
			set /a l1 = 0
			goto main
		)
		if %m1% gtr 0 if %m2% == 0 (
			if %l1% lss %m1% (
				set /a m2 = %l1%
				set /a l1 = 0
				goto main
			)
		)
		if %m2% gtr 0 if %m3% == 0 (
			if %l1% lss %m2% (
				set /a m3 = %l1%
				set /a l1 = 0
				goto main
			)
		)
		if %m3% gtr 0 if %m4% == 0 (
			if %l1% lss %m3% (
				set /a m4 = %l1%
				set /a l1 = 0
				goto main
			)
		)
		if %m4% gtr 0 (
			if %l1% lss %m4% (
				set /a m5 = %l1%
				set /a l1 = 0
				goto main
			)
		)
	)
	if %l2% gtr 0 if %l3% == 0 (
		if %m1% == 0 (
			set /a m1 = %l2%
			set /a l2 = 0
			goto main
		)
		if %m1% gtr 0 if %m2% == 0 (
			if %l2% lss %m1% (
				set /a m2 = %l2%
				set /a l2 = 0
				goto main
			)
		)
		if %m2% gtr 0 if %m3% == 0 (
			if %l2% lss %m2% (
				set /a m3 = %l2%
				set /a l2 = 0
				goto main
			)
		)
		if %m3% gtr 0 if %m4% == 0 (
			if %l2% lss %m3% (
				set /a m4 = %l2%
				set /a l2 = 0
				goto main
			)
		)
		if %m4% gtr 0 (
			if %l2% lss %m4% (
				set /a m5 = %l2%
				set /a l2 = 0
				goto main
			)
		)


	)
	if %l3% gtr 0 if %l4% == 0 (
		if %m1% == 0 (
			set /a m1 = %l3%
			set /a l3 = 0
			goto main
		)
		if %m1% gtr 0 if %m2% == 0 (
			if %l3% lss %m1% (
				set /a m2 = %l3%
				set /a l3 = 0
				goto main
			)
		)
		if %m2% gtr 0 if %m3% == 0 (
			if %l3% lss %m2% (
				set /a m3 = %l3%
				set /a l3 = 0
				goto main
			)
		)
		if %m3% gtr 0 if %m4% == 0 (
			if %l3% lss %m3% (
				set /a m4 = %l3%
				set /a l3 = 0
				goto main
			)
		)
		if %m4% gtr 0 (
			if %l3% lss %m4% (
				set /a m5 = %l3%
				set /a l3 = 0
				goto main
			)
		)
	)
	if %l4% gtr 0 if %l5% == 0 (
		if %m1% == 0 (
			set /a m1 = %l4%
			set /a l4 = 0
			goto main
		)
		if %m1% gtr 0 if %m2% == 0 (
			if %l4% lss %m1% (
				set /a m2 = %l4%
				set /a l4 = 0
				goto main
			)
		)
		if %m2% gtr 0 if %m3% == 0 (
			if %l4% lss %m2% (
				set /a m3 = %l4%
				set /a l4 = 0
				goto main
			)
		)
		if %m3% gtr 0 if %m4% == 0 (
			if %l4% lss %m3% (
				set /a m4 = %l4%
				set /a l4 = 0
				goto main
			)
		)
		if %m4% gtr 0 (
			if %l4% lss %m4% (
				set /a m5 = %l4%
				set /a l4 = 0
				goto main
			)
		)
	)
	if %l5% gtr 0 (
		if %m1% == 0 (
			set /a m1 = %l5%
			set /a l5 = 0
			goto main
		)
		if %m1% gtr 0 if %m2% == 0 (
			if %l5% lss %m1% (
				set /a m2 = %l5%
				set /a l5 = 0
				goto main
			)
		)
		if %m2% gtr 0 if %m3% == 0 (
			if %l5% lss %m2% (
				set /a m3 = %l5%
				set /a l5 = 0
				goto main
			)
		)
		if %m3% gtr 0 if %m4% == 0 (
			if %l5% lss %m3% (
				set /a m4 = %l5%
				set /a l5 = 0
				goto main
			)
		)
		if %m4% gtr 0 (
			if %l5% lss %m4% (
				set /a m5 = %l5%
				set /a l5 = 0
				goto main
			)
		)
	)
)

if "%command%" == "1to3" (
	if %l1% == 0 (
		echo There is nothing to move.
		echo.
		pause
	)
	if %l1% gtr 0 if %l2% == 0 (
		if %r1% == 0 (
			set /a r1 = %l1%
			set /a l1 = 0
			goto main
		)
		if %r1% gtr 0 if %r2% == 0 (
			if %l1% lss %r1% (
				set /a r2 = %l1%
				set /a l1 = 0
				goto main
			)
		)
		if %r2% gtr 0 if %r3% == 0 (
			if %l1% lss %r2% (
				set /a r3 = %l1%
				set /a l1 = 0
				goto main
			)
		)
		if %r3% gtr 0 if %r4% == 0 (
			if %l1% lss %r3% (
				set /a r4 = %l1%
				set /a l1 = 0
				goto main
			)
		)
		if %r4% gtr 0 (
			if %l1% lss %r4% (
				set /a r5 = %l1%
				set /a l1 = 0
				goto main
			)
		)
	)
	if %l2% gtr 0 if %l3% == 0 (
		if %r1% == 0 (
			set /a r1 = %l2%
			set /a l2 = 0
			goto main
		)
		if %r1% gtr 0 if %r2% == 0 (
			if %l2% lss %r1% (
				set /a r2 = %l2%
				set /a l2 = 0
				goto main
			)
		)
		if %r2% gtr 0 if %r3% == 0 (
			if %l2% lss %r2% (
				set /a r3 = %l2%
				set /a l2 = 0
				goto main
			)
		)
		if %r3% gtr 0 if %r3% == 0 (
			if %l2% lss %r3% (
				set /a r4 = %l2%
				set /a l2 = 0
				goto main
			)
		)
		if %r4% gtr 0 (
			if %l2% lss %r4% (
				set /a r5 = %l2%
				set /a l2 = 0
				goto main
			)
		)
	)
	if %l3% gtr 0 if %l4% == 0 (
		if %r1% == 0 (
			set /a r1 = %l3%
			set /a l3 = 0
			goto main
		)
		if %r1% gtr 0 if %r2% == 0 (
			if %l3% lss %r1% (
				set /a r2 = %l3%
				set /a l3 = 0
				goto main
			)
		)
		if %r2% gtr 0 if %r3% == 0 (
			if %l3% lss %r2% (
				set /a r3 = %l3%
				set /a l3 = 0
				goto main
			)
		)
		if %r3% gtr 0 if %r4% == 0 (
			if %l3% lss %r3% (
				set /a r4 = %l3%
				set /a l3 = 0
				goto main
			)
		)
		if %r4% gtr 0 (
			if %l3% lss %r4% (
				set /a r5 = %l3%
				set /a l3 = 0
				goto main
			)
		)
	)
	if %l4% gtr 0 if %l5% == 0 (
		if %r1% == 0 (
			set /a r1 = %l4%
			set /a l4 = 0
			goto main
		)
		if %r1% gtr 0 if %r2% == 0 (
			if %l4% lss %r1% (
				set /a r2 = %l4%
				set /a l4 = 0
				goto main
			)
		)
		if %r2% gtr 0 if %r3% == 0 (
			if %l4% lss %r2% (
				set /a r3 = %l4%
				set /a l4 = 0
				goto main
			)
		)
		if %r3% gtr 0 if %r4% == 0 (
			if %l4% lss %r3% (
				set /a r4 = %l4%
				set /a l4 = 0
				goto main
			)
		)
		if %r4% gtr 0 (
			if %l4% lss %r4% (
				set /a r5 = %l4%
				set /a l4 = 0
				goto main
			)
		)
	)
	if %l5% gtr 0 (
		if %r1% == 0 (
			set /a r1 = %l5%
			set /a l5 = 0
			goto main
		)
		if %r1% gtr 0 if %r2% == 0 (
			if %l5% lss %r1% (
				set /a r2 = %l5%
				set /a l5 = 0
				goto main
			)
		)
		if %r2% gtr 0 if %r3% == 0 (
			if %l5% lss %r2% (
				set /a r3 = %l5%
				set /a l5 = 0
				goto main
			)
		)
		if %r3% gtr 0 if %r4% == 0 (
			if %l5% lss %r3% (
				set /a r4 = %l5%
				set /a l5 = 0
				goto main
			)
		)
		if %r4% gtr 0 (
			if %l5% lss %r4% (
				set /a r5 = %l5%
				set /a l5 = 0
				goto main
			)
		)
	)
)
if "%command%" == "2to1" (
	if %m1% == 0 (
		echo There is nothing to move.
		echo.
		pause
	)
	if %m1% gtr 0 if %m2% == 0 (
		if %l1% == 0 (
			set /a l1 = %m1%
			set /a m1 = 0
			goto main
		)
		if %l1% gtr 0 if %l2% == 0 (
			if %m1% lss %l1% (
				set /a l2 = %m1%
				set /a m1 = 0
				goto main
			)
		)
		if %l2% gtr 0 if %l3% == 0 (
			if %m1% lss %l2% (
				set /a l3 = %m1%
				set /a m1 = 0
				goto main
			)
		)
		if %l3% gtr 0 if %l4% == 0 (
			if %m1% lss %l3% (
				set /a l4 = %m1%
				set /a m1 = 0
				goto main
			)
		)
		if %l4% gtr 0 (
			if %m1% lss %l4% (
				set /a l5 = %m1%
				set /a m1 = 0
				goto main
			)
		)
	)
	if %m2% gtr 0 if %m3% == 0 (
		if %l1% == 0 (
			set /a l1 = %m2%
			set /a m2 = 0
			goto main
		)
		if %l1% gtr 0 if %l2% == 0 (
			if %m2% lss %l1% (
				set /a l2 = %m2%
				set /a m2 = 0
				goto main
			)
		)
		if %l2% gtr 0 if %l3% == 0 (
			if %m2% lss %l2% (
				set /a l3 = %m2%
				set /a m2 = 0
				goto main
			)
		)
		if %l3% gtr 0 if %l4% == 0 (
			if %m2% lss %l3% (
				set /a l4 = %m2%
				set /a m2 = 0
				goto main
			)
		)
		if %l4% gtr 0 (
			if %m2% lss %l4% (
				set /a l5 = %m2%
				set /a m2 = 0
				goto main
			)
		)
	)
	if %m3% gtr 0 if %m4% == 0 (
		if %l1% == 0 (
			set /a l1 = %m3%
			set /a m3 = 0
			goto main
		)
		if %l1% gtr 0 if %l2% == 0 (
			if %m3% lss %l1% (
				set /a l2 = %m3%
				set /a m3 = 0
				goto main
			)
		)
		if %l2% gtr 0 if %l3% == 0 (
			if %m3% lss %l2% (
				set /a l3 = %m3%
				set /a m3 = 0
				goto main
			)
		)
		if %l3% gtr 0 if %l4% == 0 (
			if %m3% lss %l3% (
				set /a l4 = %m3%
				set /a m3 = 0
				goto main
			)
		)
		if %l4% gtr 0 (
			if %m3% lss %l4% (
				set /a l5 = %m3%
				set /a m3 = 0
				goto main
			)
		)
	)
	if %m4% gtr 0 if %m5% == 0 (
		if %l1% == 0 (
			set /a l1 = %m4%
			set /a m4 = 0
			goto main
		)
		if %l1% gtr 0 if %l2% == 0 (
			if %m4% lss %l1% (
				set /a l2 = %m4%
				set /a m4 = 0
				goto main
			)
		)
		if %l2% gtr 0 if %l3% == 0 (
			if %m4% lss %l2% (
				set /a l3 = %m4%
				set /a m4 = 0
				goto main
			)
		)
		if %l3% gtr 0 if %l4% == 0 (
			if %m4% lss %l3% (
				set /a l4 = %m4%
				set /a m4 = 0
				goto main
			)
		)
		if %l4% gtr 0 (
			if %m4% lss %l4% (
				set /a l5 = %m4%
				set /a m4 = 0
				goto main
			)
		)
	)
	if %m5% gtr 0 (
		if %l1% == 0 (
			set /a l1 = %m5%
			set /a m5 = 0
			goto main
		)
		if %l1% gtr 0 if %l2% == 0 (
			if %m5% lss %l1% (
				set /a l2 = %m5%
				set /a m5 = 0
				goto main
			)
		)
		if %l2% gtr 0 if %l3% == 0 (
			if %m5% lss %l2% (
				set /a l3 = %m5%
				set /a m5 = 0
				goto main
			)
		)
		if %l3% gtr 0 if %l4% == 0 (
			if %m5% lss %l3% (
				set /a l4 = %m5%
				set /a m5 = 0
				goto main
			)
		)
		if %l4% gtr 0 (
			if %m5% lss %l4% (
				set /a l5 = %m5%
				set /a m5 = 0
				goto main
			)
		)
	)
)
if "%command%" == "2to3" (
	if %m1% == 0 (
		echo There is nothing to move.
		echo.
		pause
	)
	if %m1% gtr 0 if %m2% == 0 (
		if %r1% == 0 (
			set /a r1 = %m1%
			set /a m1 = 0
			goto main
		)
		if %r1% gtr 0 if %r2% == 0 (
			if %m1% lss %r1% (
				set /a r2 = %m1%
				set /a m1 = 0
				goto main
			)
		)
		if %r2% gtr 0 if %r3% == 0 (
			if %m1% lss %r2% (
				set /a r3 = %m1%
				set /a m1 = 0
				goto main
			)
		)
		if %r3% gtr 0 if %r4% == 0 (
			if %m1% lss %r3% (
				set /a r4 = %m1%
				set /a m1 = 0
				goto main
			)
		)
		if %r4% gtr 0 (
			if %m1% lss %r3% (
				set /a r5 = %m1%
				set /a m1 = 0
				goto main
			)
		)
	)
	if %m2% gtr 0 if %m3% == 0 (
		if %r1% == 0 (
			set /a r1 = %m2%
			set /a m2 = 0
			goto main
		)
		if %r1% gtr 0 if %r2% == 0 (
			if %m2% lss %r1% (
				set /a r2 = %m2%
				set /a m2 = 0
				goto main
			)
		)
		if %r2% gtr 0 if %r3% == 0 (
			if %m2% lss %r2% (
				set /a r3 = %m2%
				set /a m2 = 0
				goto main
			)
		)
		if %r3% gtr 0 if %r4% == 0 (
			if %m2% lss %r3% (
				set /a r4 = %m2%
				set /a m2 = 0
				goto main
			)
		)
		if %r4% gtr 0 (
			if %m2% lss %r4% (
				set /a r5 = %m2%
				set /a m2 = 0
				goto main
			)
		)
	)
	if %m3% gtr 0 if %m4% == 0 (
		if %r1% == 0 (
			set /a r1 = %m3%
			set /a m3 = 0
			goto main
		)
		if %r1% gtr 0 if %r2% == 0 (
			if %m3% lss %r1% (
				set /a r2 = %m3%
				set /a m3 = 0
				goto main
			)
		)
		if %r2% gtr 0 if %r3% == 0 (
			if %m3% lss %r2% (
				set /a r3 = %m3%
				set /a m3 = 0
				goto main
			)
		)
		if %r3% gtr 0 if %r4% == 0 (
			if %m3% lss %r3% (
				set /a r4 = %m3%
				set /a m3 = 0
				goto main
			)
		)
		if %r4% gtr 0 (
			if %m3% lss %r4% (
				set /a r5 = %m3%
				set /a m3 = 0
				goto main
			)
		)
	)
	if %m4% gtr 0 if %m5% == 0 (
		if %r1% == 0 (
			set /a r1 = %m4%
			set /a m4 = 0
			goto main
		)
		if %r1% gtr 0 if %r2% == 0 (
			if %m4% lss %r1% (
				set /a r2 = %m4%
				set /a m4 = 0
				goto main
			)
		)
		if %r2% gtr 0 if %r3% == 0 (
			if %m4% lss %r2% (
				set /a r3 = %m4%
				set /a m4 = 0
				goto main
			)
		)
		if %r3% gtr 0 if %r4% == 0 (
			if %m4% lss %r3% (
				set /a r4 = %m4%
				set /a m4 = 0
				goto main
			)
		)
		if %r4% gtr 0 (
			if %m4% lss %r4% (
				set /a r5 = %m4%
				set /a m4 = 0
				goto main
			)
		)
	)
	if %m5% gtr 0 (
		if %r1% == 0 (
			set /a r1 = %m5%
			set /a m5 = 0
			goto main
		)
		if %r1% gtr 0 if %r2% == 0 (
			if %m5% lss %r1% (
				set /a r2 = %m5%
				set /a m5 = 0
				goto main
			)
		)
		if %r2% gtr 0 if %r3% == 0 (
			if %m5% lss %r2% (
				set /a r3 = %m5%
				set /a m5 = 0
				goto main
			)
		)
		if %r3% gtr 0 if %r4% == 0 (
			if %m5% lss %r3% (
				set /a r4 = %m5%
				set /a m5 = 0
				goto main
			)
		)
		if %r4% gtr 0 (
			if %m5% lss %r4% (
				set /a r5 = %m5%
				set /a m5 = 0
				goto main
			)
		)
	)
)
if "%command%" == "3to1" (
	if %r1% == 0 (
		echo There is nothing to move.
		echo.
		pause
	)
	if %r1% gtr 0 if %r2% == 0 (
		if %l1% == 0 (
			set /a l1 = %r1%
			set /a r1 = 0
			goto main
		)
		if %l1% gtr 0 if %l2% == 0 (
			if %r1% lss %l1% (
				set /a l2 = %r1%
				set /a r1 = 0
				goto main
			)
		)
		if %l2% gtr 0 if %l3% == 0 (
			if %r1% lss %l2% (
				set /a l3 = %r1%
				set /a r1 = 0
				goto main
			)
		)
		if %l3% gtr 0 if %l4% == 0 (
			if %r1% lss %l3% (
				set /a l4 = %r1%
				set /a r1 = 0
				goto main
			)
		)
		if %l4% gtr 0 (
			if %r1% lss %l4% (
				set /a l5 = %r1%
				set /a r1 = 0
				goto main
			)
		)
	)
	if %r2% gtr 0 if %r3% == 0 (
		if %l1% == 0 (
			set /a l1 = %r2%
			set /a r2 = 0
			goto main
		)
		if %l1% gtr 0 if %l2% == 0 (
			if %r2% lss %l1% (
				set /a l2 = %r2%
				set /a r2 = 0
				goto main
			)
		)
		if %l2% gtr 0 if %l3% == 0 (
			if %r2% lss %l2% (
				set /a l3 = %r2%
				set /a r2 = 0
				goto main
			)
		)
		if %l3% gtr 0 if %l4% == 0 (
			if %r2% lss %l3% (
				set /a l4 = %r2%
				set /a r2 = 0
				goto main
			)
		)
		if %l4% gtr 0 (
			if %r2% lss %l4% (
				set /a l5 = %r2%
				set /a r2 = 0
				goto main
			)
		)
	)
	if %r3% gtr 0 if %r4% == 0 (
		if %l1% == 0 (
			set /a l1 = %r3%
			set /a r3 = 0
			goto main
		)
		if %l1% gtr 0 if %l2% == 0 (
			if %r3% lss %l1% (
				set /a l2 = %r3%
				set /a r3 = 0
				goto main
			)
		)
		if %l2% gtr 0 if %l3% == 0 (
			if %r3% lss %l2% (
				set /a l3 = %r3%
				set /a r3 = 0
				goto main
			)
		)
		if %l3% gtr 0 if %l4% == 0 (
			if %r3% lss %l3% (
				set /a l4 = %r3%
				set /a r3 = 0
				goto main
			)
		)
		if %l4% gtr 0 (
			if %r3% lss %l4% (
				set /a l5 = %r3%
				set /a r3 = 0
				goto main
			)
		)
	)
	if %r4% gtr 0 if %r5% == 0 (
		if %l1% == 0 (
			set /a l1 = %r4%
			set /a r4 = 0
			goto main
		)
		if %l1% gtr 0 if %l2% == 0 (
			if %r4% lss %l1% (
				set /a l2 = %r4%
				set /a r4 = 0
				goto main
			)
		)
		if %l2% gtr 0 if %l3% == 0 (
			if %r4% lss %l2% (
				set /a l3 = %r4%
				set /a r4 = 0
				goto main
			)
		)
		if %l3% gtr 0 if %l4% == 0 (
			if %r4% lss %l3% (
				set /a l4 = %r4%
				set /a r4 = 0
				goto main
			)
		)
		if %l4% gtr 0 (
			if %r4% lss %l4% (
				set /a l5 = %r4%
				set /a r4 = 0
				goto main
			)
		)
	)
	if %r5% gtr 0 (
		if %l1% == 0 (
			set /a l1 = %r5%
			set /a r5 = 0
			goto main
		)
		if %l1% gtr 0 if %l2% == 0 (
			if %r5% lss %l1% (
				set /a l2 = %r5%
				set /a r5 = 0
				goto main
			)
		)
		if %l2% gtr 0 if %l3% == 0 (
			if %r5% lss %l2% (
				set /a l3 = %r5%
				set /a r5 = 0
				goto main
			)
		)
		if %l3% gtr 0 if %l4% == 0 (
			if %r5% lss %l3% (
				set /a l4 = %r5%
				set /a r5 = 0
				goto main
			)
		)
		if %l4% gtr 0 (
			if %r5% lss %l4% (
				set /a l5 = %r5%
				set /a r5 = 0
				goto main
			)
		)
	)
)
if "%command%" == "3to2" (
	if %r1% == 0 (
		echo There is nothing to move.
		echo.
		pause
	)
	if %r1% gtr 0 if %r2% == 0 (
		if %m1% == 0 (
			set /a m1 = %r1%
			set /a r1 = 0
			goto main
		)
		if %m1% gtr 0 if %m2% == 0 (
			if %r1% lss %m1% (
				set /a m2 = %r1%
				set /a r1 = 0
				goto main
			)
		)
		if %m2% gtr 0 if %m3% == 0 (
			if %r1% lss %m2% (
				set /a m3 = %r1%
				set /a r1 = 0
				goto main
			)
		)
		if %m3% gtr 0 if %m4% == 0 (
			if %r1% lss %m3% (
				set /a m4 = %r1%
				set /a r1 = 0
				goto main
			)
		)
		if %m4% gtr 0 (
			if %r1% lss %m4% (
				set /a m5 = %r1%
				set /a r1 = 0
				goto main
			)
		)
	)
	if %r2% gtr 0 if %r3% == 0 (
		if %m1% == 0 (
			set /a m1 = %r2%
			set /a r2 = 0
			goto main
		)
		if %m1% gtr 0 if %m2% == 0 (
			if %r2% lss %m1% (
				set /a m2 = %r2%
				set /a r2 = 0
				goto main
			)
		)
		if %m2% gtr 0 if %m3% == 0 (
			if %r2% lss %m2% (
				set /a m3 = %r2%
				set /a r2 = 0
				goto main
			)
		)
		if %m3% gtr 0 if %m4% == 0 (
			if %r2% lss %m3% (
				set /a m4 = %r2%
				set /a r2 = 0
				goto main
			)
		)
		if %m4% gtr 0 (
			if %r2% lss %m4% (
				set /a m5 = %r2%
				set /a r2 = 0
				goto main
			)
		)
	)
	if %r3% gtr 0 if %r4% == 0 (
		if %m1% == 0 (
			set /a m1 = %r3%
			set /a r3 = 0
			goto main
		)
		if %m1% gtr 0 if %m2% == 0 (
			if %r3% lss %m1% (
				set /a m2 = %r3%
				set /a r3 = 0
				goto main
			)
		)
		if %m2% gtr 0 if %m3% == 0 (
			if %r3% lss %m2% (
				set /a m3 = %r3%
				set /a r3 = 0
				goto main
			)
		)
		if %m3% gtr 0 if %m4% == 0 (
			if %r3% lss %m3% (
				set /a m4 = %r3%
				set /a r3 = 0
				goto main
			)
		)
		if %m4% gtr 0 (
			if %r3% lss %m4% (
				set /a m5 = %r3%
				set /a r3 = 0
				goto main
			)
		)
	)
	if %r4% gtr 0 if %r5% == 0 (
		if %m1% == 0 (
			set /a m1 = %r4%
			set /a r4 = 0
			goto main
		)
		if %m1% gtr 0 if %m2% == 0 (
			if %r4% lss %m1% (
				set /a m2 = %r4%
				set /a r4 = 0
				goto main
			)
		)
		if %m2% gtr 0 if %m3% == 0 (
			if %r4% lss %m2% (
				set /a m3 = %r4%
				set /a r4 = 0
				goto main
			)
		)
		if %m3% gtr 0 if %m4% == 0 (
			if %r4% lss %m3% (
				set /a m4 = %r4%
				set /a r4 = 0
				goto main
			)
		)
		if %m4% gtr 0 (
			if %r4% lss %m4% (
				set /a m5 = %r4%
				set /a r4 = 0
				goto main
			)
		)
	)
	if %r5% gtr 0 (
		if %m1% == 0 (
			set /a m1 = %r5%
			set /a r5 = 0
			goto main
		)
		if %m1% gtr 0 if %m2% == 0 (
			if %r5% lss %m1% (
				set /a m2 = %r5%
				set /a r5 = 0
				goto main
			)
		)
		if %m2% gtr 0 if %m3% == 0 (
			if %r5% lss %m2% (
				set /a m3 = %r5%
				set /a r5 = 0
				goto main
			)
		)
		if %m3% gtr 0 if %m4% == 0 (
			if %r5% lss %m3% (
				set /a m4 = %r5%
				set /a r5 = 0
				goto main
			)
		)
		if %m4% gtr 0 (
			if %r5% lss %m4% (
				set /a m5 = %r5%
				set /a r5 = 0
				goto main
			)
		)
	)
)
goto main

:help
cls
echo.
echo INSTRUCTIONS:
echo.
echo The "Towers of Hanoi" is a simple puzzle game where the objective is to set up
echo the tower on either the left or right side in as little moves as possible.
echo.
echo There are 2 rules:
echo.
echo Rule 1) You cannot have a larger number on top of a smaller number
echo.
echo Rule 2) You can only move one number at a time
echo.
pause
goto main

:com
cls
echo.
echo COMMANDS:
echo.
echo To move a tower, you put the number of the tower you're moving from, then "to"
echo and finally, the tower you are moving to.
echo.
echo Example, "1to2" moves the top number from tower 1 to tower 2
echo.
echo The command "reset" also resets the game
echo.
pause
goto main