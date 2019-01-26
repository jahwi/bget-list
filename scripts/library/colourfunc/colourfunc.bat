@echo off
::::BgetDescription#Natively display independently colored text in batch.
::::BgetAuthor#DaveBenham
::::BgetCategory#library
::::BgetTags#color;colour
setlocal

call :initColorPrint

call :colorPrint 0a "a"
call :colorPrint 0b "b"
set "txt=^" & call :colorPrintVar 0c txt
call :colorPrint 0d "<"
call :colorPrint 0e ">"
call :colorPrint 0f "&"
call :colorPrint 1a "|"
call :colorPrint 1b " "
call :colorPrint 1c "%%%%"
call :colorPrint 1d ^"""
call :colorPrint 1e "*"
call :colorPrint 1f "?"
call :colorPrint 2a "!"
call :colorPrint 2b "."
call :colorPrint 2c ".."
call :colorPrint 2d "/"
call :colorPrint 2e "\"
call :colorPrint 2f "q:" /n
echo(
set complex="c:\hello world!/.\..\\a//^<%%>&|!" /^^^<%%^>^&^|!\
call :colorPrintVar 74 complex /n

call :cleanupColorPrint

exit /b

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:colorPrint Color  Str  [/n]
setlocal
set "str=%~2"
call :colorPrintVar %1 str %3
exit /b

:colorPrintVar  Color  StrVar  [/n]
if not defined %~2 exit /b
setlocal enableDelayedExpansion
set "str=a%DEL%!%~2:\=a%DEL%\..\%DEL%%DEL%%DEL%!"
set "str=!str:/=a%DEL%/..\%DEL%%DEL%%DEL%!"
set "str=!str:"=\"!"
pushd "%temp%"
findstr /p /A:%1 "." "!str!\..\x" nul
if /i "%~3"=="/n" echo(
exit /b

:initColorPrint
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do set "DEL=%%a"
<nul >"%temp%\x" set /p "=%DEL%%DEL%%DEL%%DEL%%DEL%%DEL%.%DEL%"
exit /b

:cleanupColorPrint
del "%temp%\x"
exit /b