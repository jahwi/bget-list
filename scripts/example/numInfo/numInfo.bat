@echo off & setlocal enableDelayedExpansion

::::BgetDescription#Shows the properties of a number e.g. its binary; hexadecimal equivalents as well as bitwise operations.
::::BgetAuthor#Icarus
::::BgetCategory#example
::::Bgettags#number; info

( for /f %%a in ('echo prompt $E^| cmd') do set "esc=%%a" ) & <nul set /p "=!esc![?25l"
mode 70,50

echo %esc%[5;1HThe point of this script is to show possible outcomes from a number.
echo %esc%[6;1HIt will show the binary, and hex value, as well as bit twiddle hacks
echo %esc%[7;1Hto show near by numbers.%esc%[1;1H
set /p "numIn=Choose a number: "
cls

echo Current number %numIn%& echo.

<nul set /p "=BIN = "
call :numToBin %numIn%
echo.
<nul set /p "=HEX = "
call :numToHex %numIn%
echo. & echo.

echo Shift 1 to the right
set /a "i=numIn >> 1"
echo %i%
<nul set /p "=BIN = "
call :numToBin %i%
echo.
<nul set /p "=HEX = "
call :numToHex %i%
echo. & echo ---------------------&echo.&echo.

echo Shift 1 to the left
set /a "i=numIn << 1"
echo %i%
<nul set /p "=BIN = "
call :numToBin %i%
echo.
<nul set /p "=HEX = "
call :numToHex %i%
echo. & echo ---------------------&echo.&echo.

echo AND 1
set /a "i=numIn & 1"
echo %i%
<nul set /p "=BIN = "
call :numToBin %i%
echo.
<nul set /p "=HEX = "
call :numToHex %i%
echo. & echo ---------------------&echo.&echo.

echo OR 1
set /a "i=numIn | 1"
echo %i%
<nul set /p "=BIN = "
call :numToBin %i%
echo.
<nul set /p "=HEX = "
call :numToHex %i%
echo. & echo ---------------------&echo.&echo.

echo XOR 1
set /a "i=numIn ^ 1"
echo %i%
<nul set /p "=BIN = "
call :numToBin %i%
echo.
<nul set /p "=HEX = "
call :numToHex %i%
echo. & echo ---------------------&echo.&echo.

pause & exit


:numToBin
	for /l %%b in (0, 1, 7) do set /a "bit[%%b]=(%~1>>%%~b)&1"
	set "binaryOut=!bit[7]!!bit[6]!!bit[5]!!bit[4]!!bit[3]!!bit[2]!!bit[1]!!bit[0]!"
	<nul set /p "=%binaryOut% "
goto :eof

:numToHex
	set "hex="
	set "dec=%~1"
	if not defined map set "map=0123456789ABCDEF"
	for /L %%N in (1,1,8) do (
		set /a "d=dec&15,dec>>=4"
		for %%D in (!d!) do set "hex=!map:~%%D,1!!hex!"
	)
	for /f "tokens=* delims=0" %%A in ("%hex%") do set "hex=%%A"&if not defined hex set "hex=0"
	if "%hex:~1,1%" equ "" set "hex=0!hex!"
	<nul set /p "=%hex%"
goto :eof