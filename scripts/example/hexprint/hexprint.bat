@echo off & setlocal enableDelayedExpansion

set LF=^


::above lines are critical
::::BgetDescription#Displays ascii characters in specified code pages.
::::BgetAuthor#Icarus
::::BgetCategory#example
chcp 437 >nul


call :hexPrint 0x1A out

echo %out%


pause & exit



:hexPrint  string  [rtnVar]
    for /f eol^=^%LF%%LF%^ delims^= %%A in (
        'forfiles /p "%~dp0." /m "%~nx0" /c "cmd /c echo(%~1"'
    ) do if "%~2" neq "" (set %~2=%%A) else echo(%%A
goto :eof