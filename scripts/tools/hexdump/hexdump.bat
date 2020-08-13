@if (@X)==(@Y) @end /* Harmless hybrid line that begins a JScript comment
:::
:::HEXDUMP [/Option [Value]]...
:::
:::  Writes the content of stdin as hexadecimal to stdout, with 16 bytes per line,
:::  using the following format:
:::
:::    OOOOOOO XX XX XX XX XX XX XX XX  XX XX XX XX XX XX XX XX   AAAAAAAAAAAAAAAA
:::
:::  where:
:::
:::    0000000          = the hexadecimal offset within the input
:::    XX               = the hexadecimal value of a byte
:::    AAAAAAAAAAAAAAAA = the bytes as ASCII (control codes and non-ASCII as .)
:::
:::  Output is encoded as ASCII, with each line terminated by CarriageReturn
:::  LineFeed.
:::
:::  The behavior can be modified by appending any combination of the following
:::  options:
:::
:::    /I InFile  - Input from InFile instead of stdin
:::    /O OutFile - Output to OutFile instead of stdout: - overwrites InFile
:::    /NA - No ASCII
:::    /NO - No Offsets
:::    /R  - Raw hexadecimal on a single line, with no space between bytes
:::    /LF - LineFeed as line terminator instead of CarriageReturn LineFeed
:::    /NL - No Line terminators, all output on one line without line terminator
:::    /U  - Unicode encoded output with BOM (UTF-16)
:::    /V  - Write version info to stdout
:::    /?  - Write this help to stdout
:::
:::HEXDUMP.BAT version 2.1 was written by Dave Benham
:::and is maintained at https://www.dostips.com/forum/viewtopic.php?f=3&t=8816
::::BgetDescription#Writes the content of stdin as hexadecimal to stdout
::::BgetAuthor#DaveBenham
::::BgetCategory#tools

@echo off
setlocal disableDelayedExpansion
set "tempRoot="

:: Define options
set "/options= /I:"" /LF: /NA: /NL: /NO: /O:"" /R: /U: /V: /?: "

:: Set default option values
for %%O in (%/options%) do for /f "tokens=1,* delims=:" %%A in ("%%O") do set "%%A=%%~B"
set "/?="

:GetOptions
if not "%~1"=="" (
  set "/test=%~1"
  setlocal enableDelayedExpansion
  if "!/test:~0,1!" neq "/" call :exitErr "Invalid argument" 1
  set "/test=!/options:*%~1:=! "
  if "!/test!"=="!/options! " (
      endlocal
      call :exitErr "Invalid option %~1" 1
  ) else if "!/test:~0,1!"==" " (
      endlocal
      set "%~1=1"
  ) else (
      endlocal
      set "%~1=%~2"
      shift /1
  )
  shift /1
  goto :GetOptions
)

if defined /? (
  for /f "delims=: tokens=*" %%A in ('findstr "^:::" "%~f0"') do @echo(%%A
  exit /b 0
)

if defined /V (
  for /f "delims=: tokens=*" %%A in ('findstr /bic:":::HEXDUMP.BAT version" "%~f0"') do echo(%%A
  exit /b 0
)

if "%/O%"=="-" if not defined /I call :exitErr "Cannot write to stdin" 1

set /a "type= 11 - 0%/NA% - 0%/NO%*2"
if %type%==9 set "type=5"
if defined /R set "type=12"
set /a "type|= (0%/LF%*0x80000000 | 0%/NL%*0x40000000)"
if %type% lss 0 cmd /c exit /b %type%
if %type% lss 0 set "type=0x%=exitCode%"

set "unicode="
if defined /U set "unicode=-UnicodeText"

if defined /I set "in=%/I%" & goto :getOutput
call :getTempRoot
set "in=%tempRoot%.stdin"
cscript //nologo //E:JScript "%~f0" "%in%"

:getOutput
if "%/O%" equ "-" set "out=%~1" & goto :go
if defined /O set "out=%/O%" & goto :go
if not defined tempRoot call :getTempRoot
set "out=%tempRoot%.hexdump"

:go
(certutil %unicode% -f -encodehex "%in%" "%out%" %type% || echo ERROR: HexDump failed during CertUtil processing) | findstr "ERROR" >&2 && call :exit 1

if not defined /O (findstr "^" "%out%") else echo Hexdump successfully written to "%out%".
call :exit 0

:getTempRoot
set "tempRoot="
if defined temp for %%T in ("%temp%") do set "tempRoot=%%~fT\"
if not defined tempRoot if defined tmp for %%T in ("%tmp%") do set "tempRoot=%%~fT\"
set "tempRoot=%tempRoot%%~nx0.%time::=_%.%random%"
if exist "%tempRoot%.lock" goto :getTempRoot
2>nul (break >"%tempRoot%.lock") || goto :getTempRoot
exit /b

:exitErr
>&2 echo ERROR: %~1.
shift
:: Fall through to :exit

:exit
if defined tempRoot del "%tempRoot%.*"
(goto) 2>nul & exit /b %1


************* JScript portion - read stdin and write to file defined by arg0 **********/
var fso = new ActiveXObject("Scripting.FileSystemObject");
var out = fso.OpenTextFile(WScript.Arguments(0),2,true);
var chr;
while( !WScript.StdIn.AtEndOfStream ) {
  chr=WScript.StdIn.Read(1000000);
  out.Write(chr);
}