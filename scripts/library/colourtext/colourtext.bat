@echo off
:: Original author: Kenzix
:: Editor: Mr Kenzix
::::BgetDescription#Natively display independently colored text in batch.
::::BgetAuthor#Kenzix
::::BgetCategory#library
::::Bgettags#color
REM To write a text before colored text, use a SET/P-command before the CALL-command.
REM To write a text between two colored texts, use a SET/P-command between two CALL-commands.
REM To write a text after all colored texts, use an ECHO-command. If you do not want to write anything after it, use "ECHO." 
REM The last colored text should have "end" as third parameter.
title Colour Text
echo These are the colored texts:
echo.
call :ColorText 0a "GREEN"
set /p ".= " <nul
call :ColorText 0c "red."
set /p ".= " <nul
call :ColorText 09 "BLUE"
set /p ".= " <nul
call :ColorText 0d "PINK"
set /p ".= " <nul
call :ColorText 0e "YELLOW"
set /p ".= " <nul
call :ColorText 08 "GRAY" end
echo.
echo.

set /p ".=Text before " <nul
call :ColorText 0a "GREEN "
set /p ".= and between green and " <nul
call :ColorText 0c "RED" end
echo. and after red.
echo.
echo.
pause
exit

:: Keep this label exactly as it is and do not change anything here!
:ColorText [%1 = Color] [%2 = Text]
set /p ".=." > "%~2" <nul
findstr /v /a:%1 /R "^$" "%~2" nul 2>nul
set /p ".=" <nul
if "%3" == "end" set /p ".= " <nul
del "%~2" >nul 2>nul
exit /b
pause