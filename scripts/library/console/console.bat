@\echo off
goto :console

::CONSOLE.BAT version 2.2 by Dave Benham
::
::::BgetDescription#Allows advanced ability to get or set console attributes.
::::BgetAuthor#DaveBenham
::::BgetCategory#library
::::Bgettags#window;script
::  Release History:
::    2.2  2016-05-14: Added ability to set attributes relative to current value
::    2.1  2016-05-13: Added /S option to sleep for N msec
::                     Bug fix - syntax error parsing some string literals
::    2.0  2016-04-28: Major rewrite
::                     - Speed improved by launching parallel process
::                     - Option syntax reworked
::                     - Added options for writing strings to the console
::                     - Added option to set the window position relative
::                       to the buffer space
::    1.0  2016-03-30: Initial release - slow due to PowerShell startup time
::
:: ========================= DOCUMENTATION ==========================
:::
:::console  [/option[=value]] ...
:::
:::  Utility for manipulating the console window within a batch script.
:::  This utility works by launching a parallel PowerShell process within the
:::  same window to service requests in a timely fashion. The initial call also
:::  defines a series of environment variables with names beginning with console_
:::  that must be preserved until the PowerShell process is stopped.
:::
:::  Options are generally processed from left to right.
:::
:::  A call without options displays this help.
:::
:::  Admin Options: Used to start and stop the PowerShell process.
:::
:::    /START - Start the PowerShell process. Only needed if the first call
:::             to console.bat does not have any other options.
:::
:::    /STOP  - Stop the PowerShell process immediately.
:::
:::  Output Options: Used to write strings directly to the console (not stdout).
:::
:::      Note: Quoted string literals require the following escape sequences:
:::        " -> ""
:::        ! -> ^!  (or ^^! if delayed expansion is enabled)
:::        ^ -> ^^  (or ^^^^ if delayed expansion is enabled)
:::
:::    /WS="{String}"      - Write a string literal, without a newline.
:::
:::    /WV={VariableName}  - Write a variable, without a newline.
:::
:::    /WSN="{String}"     - Write a string literal, terminated by a newline.
:::
:::    /WVN={VariableName} - Write a variable, terminated by a newline
:::
:::  Set Options: Used to set console attributes:
:::
:::    Without sign represents absolute value
:::    With + or - sign represents increase or decrease from current setting
:::      /BW=[+|-]{BufferWidth}
:::      /BH=[+|-]{BufferHeight}
:::      /WW=[+|-]{WindowWidth}
:::      /WH=[+|-]{WindowHeight}
:::      /WX=[+|-]{WindowPositionX}
:::      /WY=[+|-]{WindowPositionY}
:::      /CX=[+|-]{CursorPositionX}
:::      /CY=[+|-]{CursorPositionY}
:::
:::    Absolute values only
:::      /CS={CursorSize}       - integer from 0-100
:::      /BC={BackgroundColor}  - integer from 0-15 or color name
:::      /FC={ForegroundColor}  - integer from 0-15 or color name
:::      /PI={PollingInterval}  - in msec, initial value=10, continuous=0
:::
:::  Get Options: Used to retrieve console attributes. Get options are always
:::    processed after all other options, regardless of order. These options
:::    cannot be combined with /STOP.
:::
:::    /G - Get various console attributes and store the values in the
:::         following environment variables:
:::
:::           console.BufferSize.Height
:::           console.BufferSize.Width
:::           console.ColorBackground.Name
:::           console.ColorBackground.Num
:::           console.ColorForeground.Name
:::           console.ColorForeground.Num
:::           console.CursorPosition.X
:::           console.CursorPosition.Y
:::           console.CursorSize
:::           console.PollingInterval
:::           console.WindowMaxPhysicalSize.Height
:::           console.WindowMaxPhysicalSize.Width
:::           console.WindowMaxSize.Height
:::           console.WindowMaxSize.Width
:::           console.WindowPosition.X
:::           console.WindowPosition.Y
:::           console.WindowSize.Height
:::           console.WindowSize.Width
:::
:::    /D - Get the same console attributes described for /G but write the
:::         values to stdout instead of storing them in environment variables.
:::
:::    /D and /G can be combined to both store the values in environment
:::    variables and write the values to stdout.
:::
:::  Miscellaneous:
:::
:::    /S={msec} - Sleep for the specified number of msec. Note that there may
:::                be additional delay for batch parsing, plus as much as the
:::                polling interval delay for PowerShell to receive the command.
:::
:::  CONSOLE.BAT version 2.1 was written by Dave Benham
:::

:console
if "%~1"=="" (
  for /f "tokens=* delims=:" %%A in ('findstr "^:::" "%~f0"') do echo(%%A
  exit /b
)

if defined console_config.lockFile ((call ) 9>>"%console_config.lockFile%") 2>nul || goto :skipInit
call :init 2>nul
:skipInit

setlocal enableDelayedExpansion
set "console_cmd="
set "console_get="
set "console_var="
set "console_show="
set "console_write= /WS /WV /WSN /WVN "

:parse
if "%~1"=="" goto :go
if /i "%~1"=="/G" (
  set /a console_get=console_var=1
) else if /i "%~1"=="/D" (
  set /a console_get=console_show=1
) else if /i "%~1"=="/START" (
  (call )
) else if /i "%~1"=="/STOP" (
  set "console_cmd=!console_cmd!del $cmdFile;exit;"
  set "console_config.stop=1"
) else (
  if "%~2" == "" (
    >&2 echo Missing value for option %~1
    exit /b 1
  )
  if /i "%~1"=="/PI" (
    set "console_cmd=!console_cmd!$delay=%~2;"
  ) else if /i "%~1"=="/S" (
    set "console_cmd=!console_cmd!sleep -m %~2;"
  ) else if "!console_write: %~1 =!" neq "!console_write!" (
    set "console_test=%~1"
    if "!console_test:S=!" neq "!console_test!" (
      set "console_str=%~2"!
    ) else (
      set "console_str=!%~2!"
      if defined console_str (
        set "console_str=!console_str:"=""!"
      )
    )
    if defined console_str (
      set "console_str=!console_str:`=``!"
      set "console_str=!console_str:$=`$!"
      set "console_cmd=!console_cmd!write-host "!console_str!""
      if "!console_test:N=!" equ "!console_test!" (
        set "console_cmd=!console_cmd! -noNewLine;"
      ) else set "console_cmd=!console_cmd!;"
    ) else if /i "%~1" == "/WVN" set "console_cmd=!console_cmd!write-host $empty;"
  ) else if defined console_obj_%~1 (
    for /f "delims=+ tokens=1*" %%A in ("%~2") do if "%%A" neq "%~2" (
      set "console_cmd=!console_cmd!$O=$U.!console_obj_%~1!;$O.!console_att_%~1!+=%%A%%B;$U.!console_obj_%~1!=$O;"
    ) else for /f "delims=- tokens=1*" %%A in ("%~2") do if "%%A" neq "%~2" (
      set "console_cmd=!console_cmd!$O=$U.!console_obj_%~1!;$O.!console_att_%~1!-=%%A%%B;$U.!console_obj_%~1!=$O;"
    ) else (
      set "console_cmd=!console_cmd!$O=$U.!console_obj_%~1!;$O.!console_att_%~1!=%~2;$U.!console_obj_%~1!=$O;"
    )
  ) else if defined console_att_%~1 (
    set ^"console_cmd=!console_cmd!$U.!console_att_%~1!="%~2";"
  ) else (
    >&2 echo Invalid option: %~1
    exit /b 1
  )
  shift /1
)
shift /1
goto :parse

:go
if defined console_get (
  set console_cmd=!console_cmd!"$($U.WindowSize) $($U.BufferSize) $($U.WindowPosition) $($U.MaxWindowSize) $($U.MaxPhysicalWindowSize) $($U.CursorPosition) $($U.CursorSize) $($U.BackgroundColor) $($U.ForegroundColor) $($delay)";
)

if not defined console_cmd exit /b
echo(!console_cmd! >"%console_config.cmdFile%"
:wait
if exist "%console_config.cmdFile%" goto :wait
(for /f "usebackq tokens=1-16 delims=, " %%A in (
  "%console_config.outFile%"
) do for /f "tokens=1,2" %%Q in ("!console_color.%%N! !console_color.%%O!") do (
  if defined console_var endlocal&set "console_config.stop=%console_config.stop%"
  set /a console.WindowSize.Width=%%A,^
         console.WindowSize.Height=%%B,^
         console.BufferSize.Width=%%C,^
         console.BufferSize.Height=%%D,^
         console.WindowPosition.X=%%E,^
         console.WindowPosition.Y=%%F,^
         console.WindowMaxSize.Width=%%G,^
         console.WindowMaxSize.Height=%%H,^
         console.WindowMaxPhysicalSize.Width=%%I,^
         console.WindowMaxPhysicalSize.Height=%%J,^
         console.CursorPosition.X=%%K,^
         console.CursorPosition.Y=%%L,^
         console.CursorSize=%%M,^
         console.PollingInterval=%%P,^
         console.ColorBackground.Num=%%Q,^
         console.ColorForeground.Num=%%R
  set "console.ColorBackground.Name=%%N"
  set "console.ColorForeground.Name=%%O"
  if "%console_show%"=="1" set console.
)) 2>nul
:stop
if defined console_config.stop (
  del "%console_config.outFile%" 2>nul >nul
  del "%console_config.lockFile%" 2>nul >nul
  if exist "%console_config.lockFile%" goto :stop
)
exit /b 0

:init

:: Clean up dead sessions
for %%F in ("%temp%\console.??.??.*.lock.???") do (
  del "%%F"
  if not exist "%%F" for %%G in ("%%~dpnF") do del "%%~dpnG.*%%~xF"
) >nul

for %%v in (console_ color.) do for /f "delims==" %%V in ('set %%v 2^>nul') do set "%%V="
set "console_obj_/ww=WindowSize"
set "console_obj_/wh=WindowSize"
set "console_obj_/wx=WindowPosition"
set "console_obj_/wy=WindowPosition"
set "console_obj_/bw=BufferSize"
set "console_obj_/bh=BufferSize"
set "console_obj_/cx=CursorPosition"
set "console_obj_/cy=CursorPosition"
set "console_att_/cs=CursorSize"
set "console_att_/bc=BackgroundColor"
set "console_att_/fc=ForegroundColor"
set "console_att_/ww=Width"
set "console_att_/wh=Height"
set "console_att_/wx=X"
set "console_att_/wy=Y"
set "console_att_/bw=Width"
set "console_att_/bh=Height"
set "console_att_/cx=X"
set "console_att_/cy=Y"
set "console_config.base=%temp%\console.%time::=.%"
set "console_config.seq=1"
set /a console_color.Black=0,console_color.DarkBlue=1,console_color.DarkGreen=2,^
       console_color.DarkCyan=3,console_color.DarkRed=4,console_color.DarkMagenta=5,^
       console_color.DarkYellow=6,console_color.Gray=7,console_color.DarkGray=8,^
       console_color.Blue=9,console_color.Green=10,console_color.Cyan=11,^
       console_color.Red=12,console_color.Magenta=13,console_color.Yellow=14,^
       console_color.White=15

for /f "delims=.= tokens=1-3" %%A in ('set console_color.') do set "%%A.%%C=%%B"

:retry
set "console_config.cmdFile=%console_config.base%.cmd.%console_config.seq%"
set "console_config.outFile=%console_config.base%.out.%console_config.seq%"
set "console_config.lockFile=%console_config.base%.lock.%console_config.seq%"

setlocal
set "console_config.cmdFile=%console_config.cmdFile:`=``%"
set "console_config.cmdFile=%console_config.cmdFile:$=`$%"
set "console_config.outFile=%console_config.outFile:`=``%"
set "console_config.outFile=%console_config.outFile:$=`$%"

start "" /b powershell -command ^
$empty="""""""";^
$delay=10;^
$cmdFile=""""%console_config.cmdFile%"""";^
$outFile=""""%console_config.outFile%"""";^
$U=$Host.ui.rawui;^
while (1){^
  if (test-path $cmdFile){^
    $cmd=gc $cmdFile;^
    iex $cmd ^| out-file $outFile -width 100 -encoding default;^
    del $cmdFile;^
  };^
  sleep -m $delay;^
} 9>"%console_config.lockFile%" || (
  endlocal
  set /a console_config.seq+=1
  goto :retry
)

endlocal
exit /b