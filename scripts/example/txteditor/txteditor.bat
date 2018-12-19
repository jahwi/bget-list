@echo off
title txteditor
::::BgetDescription#Crude text editor in batch.
::::BgetAuthor#Jahwi
::::BgetCategory#example

:redo
set/p txtoutput=Enter output filename:
if exist "%txtoutput%.txt" choice /c yn /n /m "%txtoutput%.txt exists. Overwrite? [y/n]"
if "%errorlevel%"=="2" goto :redo
cls
echo [Press CTRL+Z AND THEN ENTER AFTER YOU'RE DONE TYPING.]
copy con %txtoutput%.txt>nul
echo Saved.
pause 