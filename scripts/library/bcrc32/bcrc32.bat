:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: CRC32 version 0.1c by einstein1969.
:: ----------------------------------------------------------------
::
:: Thanks to: penpen, Magialisk, jeb, dbenham, foxidrive
::
:: 19/06/2014 ver. 0.1c
::            - Tuning performance. Doubled the speed.
::            - Fixed filename with ! bug.
::            - Other code optimization.
::   
:: TODO: Async Mode with pipe and SET/P read.
::
:: Rif: http://www.dostips.com/forum/viewtopic.php?p=30336#p30336
::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::::BgetDescription#Calculates the CRC32 of the input string or file.
::::BgetAuthor#Einstein1969
::::BgetCategory#library
::::Bgettags#hash;checksum
@echo off & setlocal DisableDelayedExpansion

:: Show Syntax
if "%~1"=="" (
  echo(
  echo CRC32 ^<string^|filename^> [^<variable^>]
  echo       Calculates the CRC32 of the input string or file.
  echo       Optionally stores it in "variable".
  echo(
  echo Example:
  echo CRC32 "123456789"
  Echo CRC32:0xCBF43926
  exit /b
)

set "inFile=%~1"

setlocal EnableDelayedExpansion

:: String MODE
IF not exist !inFile! (
   set SM=1
   <nul set /p ".=%inFile%" > "%temp%\crc32.tmp"
   call "%~f0" "%temp%\crc32.tmp" %~2
   del "%temp%\crc32.tmp"
   :: Pass the result back over the second endlocal barrier
   if Not "%~2"=="" for %%a in (!crc32!) DO (endlocal & endlocal & set %~2=%%a)
   exit /b
)

:: create dummy file (of @=40Hex) of dim %~Z1 for compare with FC. Jeb's technique.
set "$t=%temp%\crc32_$$$.tmp"
set "$t2=%temp%\crc32_$$$2.tmp"
type nul > "!$t2!"
<nul > "!$t!" set /p ".=@" 
set "ds=%~z1" 
for /l %%n in (1,1,32) do (
  set /a "r=ds %% 2, ds/=2"
  if !r! equ 1 type "!$t!" >> "!$t2!"
  if !ds! gtr 0 type "!$t!" >> "!$t!"
)
set ds=%~z1

:: Compare and write to tmp file
if !ds! gtr 50000 echo Wait...
>"!$t!" fc /B "!inFile!" "!$t2!"

:: Prepare progress bar
set "L0=_" & set "L1=°" & set "L2=±" & set "L3=²" & set "L4=Û"
for /L %%l in (0,1,4) do for /L %%c in (0,1,49) do set L%%l=!L%%l!!L%%l:~0,1!

:: prepare for fast execute
setlocal
(
for /F "Tokens=1 delims==" %%v in ('set') do set "%%v="
for /f %%a in ('copy /Z "%~f0" nul') do set "_CR=%%a"

:: Init b=CRC
set /a b=0xFFFFFFFF

>"%temp%\time_t0.tmp" echo %time%

:: Scan tmp file
set /a I=1
for /F "usebackq skip=1 tokens=1,2 delims=: " %%b in ("%$t%") do (

  :: Fill gaps
  for /L %%B in (!I!, 1, 0x%%b) do (
    set /a "a=(b ^ 0x40) & 0xff"
    for /L %%i in (0,1,7) do set /a "a=((a>>1) & 0x7FFFFFFF) ^ (0xEDB88320 * (a & 1))"
    set /a "b = ((b >> 8)&0x00FFFFFF) ^ a"
  )

  :: CRC core calculation
  set /a "a=((((b ^ 0x%%c) & 0xff)>>1) & 0x7FFFFFFF) ^ (0xEDB88320 * ((b ^ 0x%%c) & 1)), a=((a>>1) & 0x7FFFFFFF) ^ (0xEDB88320 * (a & 1)), a=((a>>1)&0x7FFFFFFF) ^ (0xEDB88320 * (a & 1)), a=((a>>1) & 0x7FFFFFFF) ^ (0xEDB88320 * (a & 1)), a=((a>>1)&0x7FFFFFFF) ^ (0xEDB88320 * (a & 1)), a=((a>>1) & 0x7FFFFFFF) ^ (0xEDB88320 * (a & 1)), a=((a>>1)&0x7FFFFFFF) ^ (0xEDB88320 * (a & 1)), a=((a>>1) & 0x7FFFFFFF) ^ (0xEDB88320 * (a & 1)), b = ((b >> 8)&0x00FFFFFF) ^ a, I=0x%%b+2"

  :: Progress bar.
  if "!i:~-4!"=="0000" call :progress %ds% "%temp%\time_t0.tmp" %L0% %L1% %L2% %L3% %L4%
)

:: Final Bytes/gap
for /L %%B in (!I!, 1, %~z1) do (
  set /a "a=(b ^ 0x40) & 0xff"
  for /L %%i in (0,1,7) do set /a "a=((a>>1) & 0x7FFFFFFF) ^ (0xEDB88320 * (a & 1))"
  set /a "b = ((b >> 8)&0x00FFFFFF) ^ a"
)

:: Progress bar. Final
if %ds% gtr 10000 (set I=%~z1 & call :progress %ds% "%temp%\time_t0.tmp" %L0% %L1% %L2% %L3% %L4%)

)
endlocal & set b=%b%

:: Final operations
set /a "CRC32=b ^ 0xffffffff"

:: Convert to Hexdecimal
call cmd /c exit /b !CRC32!
set crc32=!=ExitCode!

:: Print out result.
echo(
echo CRC32:!CRC32!

:: If requested return into variable.
IF NOT "%~2"=="" IF !SM! equ 1 (endlocal & endlocal & set CRC32=%CRC32%) else (endlocal & endlocal & set %~2=%CRC32%)
exit /b

:progress
(   set "t1=!time!" & set/p "t0=" <"%~2"
    for /F "tokens=1-8 delims=:.," %%a in ("!t0: =0!:!t1: =0!") do set /a "a=(((1%%e-1%%a)*60)+1%%f-1%%b)*6000+1%%g%%h-1%%c%%d, a+=(a>>31) & 8640000"
    set /a "max=%1, parz=max/4, k=i/parz, n=k+1, rapp=(i-k*parz)*50/parz, d=50-rapp, vel=I*100/a, pt=I*100/max"
    set L0=%3&set L1=%4&set L2=%5&set L3=%6&set L4=%7&set L5=%7
    for %%k in (!k!) do set LL0=!L%%k!
    for %%n in (!n!) do set LL1=!L%%n!
    for %%r in (!rapp!) do for %%d in (!d!) do <nul set /p "=^<!LL1:~0,%%r!!LL0:~0,%%d!^> !pt!%% - !vel!B/s  !_CR!"
    for /F "Tokens=1 delims==" %%v in ('set') do if /I not "%%v"=="I" if /I not "%%v"=="b" if /I not "%%v"=="_CR" set "%%v="
exit /b )