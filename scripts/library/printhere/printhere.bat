@echo off & setlocal disableDelayedExpansion & goto :start
::PrintHere.bat version 1.0 by Dave Benham
:::
:::call PrintHere [/E] [/- "TrimList"] :Label ["%~f0"]
:::call PrintHere [/E] [/- "TrimList"] :Label "%~f0" | someCommand & goto :Label
:::PrintHere /?
:::PrintHere /V
:::
::::BgetDescription#Provides functionality similar to the unix here doc feature.
::::BgetAuthor#DaveBenham
::::BgetCategory#library
:::  PrintHere.bat provides functionality similar to the unix here doc feature.
:::  It prints all content between the CALL PrintHere :Label line and the
:::  terminating :Label. The :Label must be a valid label supported by GOTO, with
:::  the additional constraint that it not contain *. Lines are printed verbatim,
:::  with the following exceptions and limitations:
:::
:::    - Lines are lmited to 1021 bytes long
:::    - Trailing control characters are stripped from each line
:::
:::  The code should look something like the following:
:::
:::     call PrintHere :Label
:::         Spacing    and blank lines are preserved
:::
:::     Special characters like & < > | ^ ! % are printed normally
:::     :Label
:::
:::  If the /E option is used, then variables between exclamation points are
:::  expanded, and ! and ^ literals must be escaped as ^! and ^^. The limitations
:::  are different when /E is used:
:::
:::    - Lines are limited to ~8191 bytes long
:::    - All characters are preserved, except !variables! are expanded and ^! and
:::      ^^ are transformed into ! and ^
:::
:::  Here is an example using /E:
:::
:::     call PrintHere /E :SubstituteExample
:::       Hello !username!^!
:::     :SubstituteExample
:::
:::  If the /- "TrimList" option is used, then leading "TrimList" characters
:::  are trimmed from the output. The trim characters are case sensitive, and
:::  cannot include a quote. If "TrimList" includes a space, then it must
:::  be the last character in the list.
:::
:::  Multiple PrintHere blocks may be defined within one script, but each
:::  :Label must be unique within the file.
:::
:::  PrintHere must not be used within a parenthesized code block.
:::
:::  Scripts that use PrintHere must use \r\n for line termination, and all lines
:::  output by PrintHere will be terminated by \r\n.
:::
:::  All redirection associated with a PrintHere must appear at the end of the
:::  command. Also, the CALL can include path information:
:::
:::     call "c:\utilities\PrintHere.bat" :MyBlock>test.txt
:::       This line is written to test.txt
:::     :MyBlock
:::
:::  PrintHere may be used with a pipe, but only on the left side, and only
:::  if the source script is included as a 2nd argument, and the right side must
:::  explicitly and unconditionally GOTO the terminating :Label.
:::
:::     call PrintHere :PipedBlock "%~f0" | more & goto :PipedBlock
:::       text goes here
:::     :PipedBlock
:::
:::  Commands concatenated after PrintHere are ignored. For example:
:::
:::     call PrintHere :ignoreConcatenatedCommands & echo This ECHO is ignored
:::       text goes here
:::     :ignoreConcatenatedCommands
:::
:::  PrintHere uses FINDSTR to locate the text block by looking for the
:::  CALL PRINTHERE :LABEL line. The search string length is severely limited
:::  on XP. To minimize the risk of PrintHere failure when running on XP, it is
:::  recommended that PrintHere.bat be placed in a folder included within PATH
:::  so that the utility can be called without path information.
:::
:::  PrintHere /? prints out this documentation.
:::
:::  PrintHere /V prints out the version information
:::
:::  PrintHere.bat was written by Dave Benham. Devlopment history may be traced at:
:::    http://www.dostips.com/forum/viewtopic.php?f=3&t=
:::

:start
set "tab=	"   NOTE: This value must be a single tab (0x09), not one or more spaces
set "sp=[ %tab%=,;]"
set "sp+=%sp%%sp%*"
set "opt="
set "/E="
set "/-="

:getOptions
if "%~1" equ "" call :exitErr Invalid call to PrintHere - Missing :Label argument
if "%~1" equ "/?" (
  for /f "tokens=* delims=:" %%L in ('findstr "^:::" "%~f0"') do echo(%%L
  exit /b 0
)
if /i "%~1" equ "/V" (
  for /f "tokens=* delims=:" %%L in ('findstr /rc:"^::PrintHere\.bat version" "%~f0"') do echo(%%L
  exit /b 0
)
if /i %1 equ /E (
  set "/E=1"
  set "opt=%sp+%.*"
  shift /1
  goto :getOptions
)
if /i %1 equ /- (
  set "/-=%~2"
  set "opt=%sp+%.*"
  shift /1
  shift /1
  goto :getOptions
)
echo %1|findstr "^:[^:]" >nul || call :exitErr Invalid PrintHere :Label
if "%~2" equ "" (
  (goto) 2>nul
  setlocal enableDelayedExpansion
  if "!!" equ "" (
    endlocal
    call %0 %* "%%~f0"
  ) else (
    >&2 echo ERROR: PrintHere must be used within a batch script.
    (call)
  )
)
set ^"call=%0^"
set ^"label=%1^"
set "src=%~2"
setlocal enableDelayedExpansion
set "call=!call:\=[\\]!"
set "label=!label:\=[\\]!"
for %%C in (. [ $ ^^ ^") do (
  set "call=!call:%%C=\%%C!"
  set "label=!label:%%C=\%%C!"
)
set "search=!sp!*call!sp+!!call!!opt!!sp+!!label!"
set "cnt="
for /f "delims=:" %%N in ('findstr /brinc:"!search!$" /c:"!search![<>|&!sp:~1!" "!src!"') do if not defined skip set "skip=%%N"
if not defined skip call :exitErr Unable to locate CALL PrintHere %1
for /f "delims=:" %%N in ('findstr /brinc:"!sp!*!label!$" /c:"!sp!*!label!!sp!" "!src!"') do if %%N gtr %skip% if not defined cnt set /a cnt=%%N-skip-1
if not defined cnt call :exitErr PrintHere end label %1 not found
if defined /E (
  for /f "skip=%skip% delims=" %%L in ('findstr /n "^^" "!src!"') do (
    if !cnt! leq 0 goto :break
    set "ln=%%L"
    if not defined /- (echo(!ln:*:=!) else for /f "tokens=1* delims=%/-%" %%A in (^""%/-%!ln:*:=!") do (
      setlocal disableDelayedExpansion
      echo(%%B
      endlocal
    )
    set /a cnt-=1
  )
) else (
  for /l %%N in (1 1 %skip%) do set /p "ln="
  for /l %%N in (1 1 %cnt%) do (
    set "ln="
    set /p "ln="
    if not defined /- (echo(!ln!) else for /f "tokens=1* delims=%/-%" %%A in (^""%/-%!ln:*:=!") do (
      setlocal disableDelayedExpansion
      echo(%%B
      endlocal
    )
  )
) <"!src!"
:break
(goto) 2>nul & goto %~1


:exitErr
>&2 echo ERROR: %*
(goto) 2>nul & exit /b 1
