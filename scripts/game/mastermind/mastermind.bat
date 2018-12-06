:: BatchMasterMind.bat
::
:: Version History
:: 1.0  2014-12-31
::
:: Written by Dave Benham and Originally posted at
:: http://www.dostips.com/forum/viewtopic.php?f=3&t=6153
::
::::BgetDescription#Batch Mastermind implementation.
::::BgetAuthor#DaveBenham
::::BgetCategory#game
@echo off
setlocal enableDelayedExpansion

:: GameConfiguration
set "symbolCnt=8"
set "symbols=12345678"
set "matchPosSymbol=X"
set "matchSymSymbol=O"
set "noMatchSymbol=_"
set "maskSymbol=-"
set "maxGuesses=12"
set "codeLen=5"

:: Initialize
set /a codeStop=codelen-1
set "noMatch="
set "mask="
for /l %%N in (1 1 %codeLen%) do (
  set "noMatch=!noMatch!%noMatchSymbol%"
  set "mask=!mask!!maskSymbol!"
)

:: Show Help
cls
echo(
echo You have %maxGuesses% guesses to deduce the %codeLen% character code
echo consisting of any combination of the following symbols:
echo !symbols!
echo(
echo There may be duplicate symbols in the code.
echo(
echo The number of !matchPosSymbol! characters tells you how many symbols
echo match and are in the correct position.
echo(
echo The number of !matchSymSymbol! characters tells you how many symbols
echo match but are in the wrong position.
echo(
pause

:play

:: GetCode
set "code="
for /l %%N in (0 1 %codeStop%) do (
  set /a "n=!random!%%symbolCnt"
  for %%A in (!n!) do set "code=!code!!symbols:~%%A,1!"
)

:: ClearTurns
for /l %%N in (1 1 %maxGuesses%) do if %%N lss 10 (
  set "turn[%%N]=  %%N"
) else (
  set "turn[%%N]= %%N"
)

:: Turn Loop
for /l %%T in (%maxGuesses% -1 1) do (

  call :showBoard mask
  call :getGuess

  %= Compute Score =%
  for /l %%A in (0 1 %codeStop%) do (
    set "guess[%%A]=!guess:~%%A,1!"
    set "code[%%A]=!code:~%%A,1!"
  )
  set "matchPos="
  for /l %%A in (0 1 %codeStop%) do if !guess[%%A]! equ !code[%%A]! (
    set "matchPos=!matchPos!!matchPosSymbol!"
    set "guess[%%A]="
    set "code[%%A]="
  )
  set "matchSym="
  for /l %%A in (0 1 %codeStop%) do for /l %%B in (0 1 %codeStop%) do if defined guess[%%A] if !guess[%%A]! equ !code[%%B]! (
    set "matchSym=!matchSym!!matchSymSymbol!"
    set "guess[%%A]="
    set "code[%%B]="
  )
  set "score=!matchPos!!matchSym!!noMatch!"
  set "score=!score:~0,%codeLen%!"

  %= Define Turn =%
  set "turn[%%T]=!turn[%%T]!   !guess!  !score!"

  %= Check for winner =%
  if !guess! equ !code! goto :endGame
)


:endGame
call :showBoard code
if !guess! equ !code! (echo You WIN^^!) else (echo You LOSE^^!)
echo(
set "again="
set /p "again=Play again [YN]? "
if /i "%again%" equ "Y" goto :play
exit /b


:getGuess
set "guess="
set /p "guess=Guess "
if not defined guess goto :getGuess
for /f "delims=%symbols% eol=%symbols:~0,1%" %%A in ("%guess%") do goto :getGuess
if "!guess:~%codeLen%!" neq "" goto :getGuess
if "!guess:~%codeStop%!" equ "" goto :getGuess
exit /b


:showBoard  target
cls
echo(
echo       !%1!  [!symbols!]
echo(
for /l %%N in (%maxGuesses% -1 1) do echo !turn[%%N]!
echo(
exit /b