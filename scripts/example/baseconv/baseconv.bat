@echo off & setlocal enableDelayedExpansion

::::BgetDescription#Converts strings and numbers from one base to another.
::::BgetAuthor#Icarus
::::BgetCategory#example
::::Bgettags#number; hex; bin; binary; hexadecimal; base

call :stringToHex "Hello World" 
echo.
call :numToBin 14
echo.
call :numToHex 9124
echo.
call :binToNum 00001110
echo.
call :hexToNum 23A4

pause & exit

:binToNum
    set "bin=%~1"
    set dec=0
    for /l %%i in (1,1,32) do if defined bin (
       set /a "dec=(dec<<1)|!bin:~0,1!"
       set "bin=!bin:~1!"
    )
    if "%~2" neq "" ( set "%~2=%dec%" ) else echo %dec% 
goto :eof

:hexToNum
    set /a "hTN=0x%~1"
    if "%~2" neq "" ( set "%~2=%hTN%" ) else echo %hTN% 
goto :eof

:stringToHex
    <nul set /p "=%~1">tmpHexFile.txt
    certutil -encodeHex tmpHexFile.txt tmpHexFile.hex >nul
    for /f "tokens=2 delims=    " %%h in (tmpHexFile.hex) do set "tmpHexString=%%h"
    if "%~2" neq "" ( set "%~2=!tmpHexString:~0,48!" ) else echo !tmpHexString:~0,48!
    del /f /q tmpHexFile.*
goto :eof

:numToBin
    for /l %%b in (0, 1, 7) do set /a "bit[%%b]=(%~1>>%%~b)&1"
    set "binaryOut=!bit[7]!!bit[6]!!bit[5]!!bit[4]!!bit[3]!!bit[2]!!bit[1]!!bit[0]!"
    if "%~2" neq "" ( set "%~2=%binaryOut%" ) else echo %binaryOut%
goto :eof

:numToHex
    set "hex="
    set "dec=%~1"
    if not defined map set "map=0123456789ABCDEF"
    for /L %%N in (1,1,8) do (
        set /a "d=dec&15,dec>>=4"
        for %%D in (!d!) do set "hex=!map:~%%D,1!!hex!"
    )
    REM !!!! REMOVE LEADING ZEROS by activating the next line, e.g. will return 1A instead of 0000001A
    for /f "tokens=* delims=0" %%A in ("%hex%") do set "hex=%%A"&if not defined hex set "hex=0"
    if "%hex:~1,1%" equ "" set "hex=0!hex!"
        IF "%~2" NEQ "" (SET %~2=%hex%) ELSE ECHO.%hex%
goto :eof