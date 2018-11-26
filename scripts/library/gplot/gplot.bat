@echo off
:begin
cls
::::BgetDescription#Crude quadratic graph plotter.
::::BgetAuthor#Jahwi
::::BgetCategory#library
setlocal enabledelayedexpansion
call :trash a b c minus minusb minusc
set pn=Quadratic Graph Plotter
title !pn!
echo Quadratic graph plotter in batch
echo Made by Jahwi in 2016
echo.
echo.
echo.
echo                        Quick Help:
set spc=          
echo !spc!Suppose you have a quadratic equation such as:
echo      !spc!Xý+2X+3
echo !spc!to use this script, you must divide the equation onto three sections:
echo.
ECHO !spc!SECTION      A  B  C
echo              !spc!Xý+2X+3
echo !spc!When propmted for A, input the COEFFICIENT OF Xý ^(which is 1 in the above example)
echo !spc!when prompted for B, input the COEFFICIENT of X ^(which is 2 in the above example^)
echo !spc!when prompted for C, ehter the CONSTANT (which is 3 in the above example)
echo.
echo.
echo !spc!^[PRESS ANY KEY^]
pause >nul
set /p a=Enter A:
set /p b=Enter B:
echo !b!|findstr /c:"-" >nul 2>&1
if !errorlevel!==1 set b=+!b!
set /p c=Enter C:
echo !c!|findstr /c:"-" >nul 2>&1
if !errorlevel!==1 set c=+!c!
choice /c yn /n /m "Your expression is !a!Xý!b!X!c!^? ^(y/n^)"
if !errorlevel!==2 goto :begin
set exp=!a!Xý!b!X!c!
cls
echo Generating Table of values for !exp!...
echo using range of -3 to 3,
set es=     
::call :qlen !a!
echo.
echo.
::echo on
for %%b in (-3 -2 -1 0 1 2 3) do (
	set da=
	set db=
	set dy=
	set /a da=!a!*%%b*%%b
	set fx%%b=!da!
	echo !da!|findstr /c:"-" >nul 2>&1
	if !errorlevel!==1 set da=+!da!
	set fl=!fl!!es!!fx%%b!
	set /a db=%%b*!b!
	echo !db!|findstr /c:"-" >nul 2>&1
	if !errorlevel!==1 set db=+!db!
	set sx%%b=!db!
	set sl=!sl!!es!!sx%%b!
	set /a dy=!da!!db!!c!
	set yx%%b=!dy!
	set yl=!yl!!es!!yx%%b!
)
call :trash da db dy
::echo !fl!
::echo !sl!
echo ---------------------------------------------------------
echo [X]      -3    -2    -1     0     1     2     3   
echo _________________________________________________________
echo ---------------------------------------------------------
echo [!a!Xý]!fl!
echo [!b!X]!sl!
echo [!c!] !es!!c!     !c!     !c!      !c!     !c!    !c!     !c!
echo _________________________________________________________
echo ---------------------------------------------------------
echo [Y]  !yl!
set maxy=-1000
set miny=1000
for %%c in (-3 -2 -1 0 1 2 3) do (
	if !yx%%c! GTR !maxy! set maxy=!yx%%c!
	if !yx%%c! LSS !miny! set miny=!yx%%c!
)
echo Maximum value on the Y axis is !maxy!
echo Minumum value on the Y axis is !miny!
echo !spc!^[PRESS ANY KEY^]
pause >nul
cls
set mis=   
echo Plotting Graph:
if !miny! GTR 0 set miny=-1
for /l %%d in (!maxy!,-1,!miny!) do (
	for %%f in (-3 -2 -1 0 1 2 3) do (
		if "!yx%%f!"=="%%d" (
				set si%%f=*
				set mis= 
				
			
		)
	)
	if "!si0!"=="" set si0=I
	echo            !si-3!!mis!!si-2!!mis!!si-1!!mis!%%d!si0!!mis!!si1!!mis!!si2!!mis!!si3!
	call :clean

)
echo !spc!^[PRESS ANY KEY^]
pause >nul
exit
:trash
::resets unused variables
set takeout=%*
for %%a in (!takeout!) do (
	set %%a=
)
set takeout=
exit /b
:qlen
set str=%*
::queries the length of input
::got it from stack Overflow
ECHO !str!>%temp%\tempfile.txt
FOR %%? IN (%temp%\tempfile.txt) DO ( SET /A sl=%%~z? - 2 )
set str=
exit /b
:clean
for %%c in (-3 -2 -1 0 1 2 3) do (
	set si%%c=
)
exit /b