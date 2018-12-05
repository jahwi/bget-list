@if (@CodeSection == @Batch) @then


@echo off
setlocal EnableDelayedExpansion

::::BgetDescription#Batch-Jscript hybrid menu.
::::BgetAuthor#Aacini
::::BgetCategory#example

rem Multi-line menu with options selection via DOSKEY
rem Antonio Perez Ayala

rem Define the options
set numOpts=0
for %%a in (First Second Third Fourth Fifth) do (
   set /A numOpts+=1
   set "option[!numOpts!]=%%a Option"
)
set /A numOpts+=1
set "option[!numOpts!]=exit"

rem Clear previous doskey history
doskey /REINSTALL
rem Fill doskey history with menu options
cscript //nologo /E:JScript "%~F0" EnterOpts
for /L %%i in (1,1,%numOpts%) do set /P "var="

:nextOpt
cls
echo MULTI-LINE MENU WITH OPTIONS SELECTION
echo/
rem Send a F7 key to open the selection menu
cscript //nologo /E:JScript "%~F0"
set /P "var=Select the desired option: "
echo/
if "%var%" equ "exit" goto :EOF
echo Option selected: "%var%"
pause
goto nextOpt


@end

var wshShell = WScript.CreateObject("WScript.Shell"),
    envVar = wshShell.Environment("Process"),
    numOpts = parseInt(envVar("numOpts"));

if ( WScript.Arguments.Length ) {
   // Enter menu options
   for ( var i=1; i <= numOpts; i++ ) {
      wshShell.SendKeys(envVar("option["+i+"]")+"{ENTER}");
   }
} else {
   // Enter a F7 to open the menu
   wshShell.SendKeys("{F7}");
}