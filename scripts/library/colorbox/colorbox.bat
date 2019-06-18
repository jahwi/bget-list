@echo off & setlocal enableDelayedExpansion
( for /f %%a in ('echo prompt $E^| cmd') do set "esc=%%a" ) & <nul set /p "=!esc![?25l"

REM SYNTAX:
rem 
rem call :messageBox X Y TitleForeCol TitleTextCol BoxForeCol BoxTextCol "TITLE" "TEXT" "TEXT" "TEXT" "TEXT" "TEXT" "TEXT"
rem
rem echo %messageBox%
::::BgetDescription#easily create colourful textboxes in the console window.
::::BgetAuthor#Icarus
::::BgetCategory#library



call :messageBox 25 25 12 15 7 16 "New Message Box" "Line number 1" "Omg its line number 2" "Third line bubba" "omg 4 lines"

call :messageBox 50 25 11 9 7 16 "This box has no text but a long title"  " " " " " " " " " " " "

call :messageBox 50 50 9 10 7 16 "MY TITLE" "Some text here" "Next Line" "Line 3 here"

call :messageBox 25 50 10 4 7 16 "All the examples...." "Some text here" "Next Line" "Line 3 here"

pause >nul & exit


:messageBox
	setlocal
		for %%# in (%*) do (
			set /a "args+=1"
			if !args! lss 7 ( set /a "arg[!args!]=%%~#" ) else set "arg[!args!]=%%~#"
		)
		
		set "box=%esc%[%arg[2]%;%arg[1]%H"
		
		for /l %%a in (7,1,%args%) do (
			set "s=!arg[%%a]!#" & set "len=0"
			for %%P in (8192 4096 2048 1024 512 256 128 64 32 16 8 4 2 1) do ( if "!s:~%%P,1!" NEQ "" ( set /a "len+=%%P" & set "s=!s:~%%P!" ) )
			set "len[%%a]=!len!"
			if not defined longest (
				set /a "longest=!len[%%a]!"
			) else if !len[%%a]! gtr !longest! set /a "longest=len[%%a]"
		)
		
		set /a "lng=longest + 2"

		for /l %%a in (7,1,%args%) do (
			set "bar="
			for /l %%b in (!len[%%a]!,1,%longest%) do set "bar=!bar!Û"
			if %%a equ 7 (
				set "box=!box!%esc%[48;5;%arg[3]%m%esc%[38;5;%arg[4]%m %arg[7]%%esc%[38;5;%arg[3]%m!bar!%esc%[%lng%D%esc%[B"
			) else (
				set "box=!box!%esc%[48;5;%arg[5]%m%esc%[38;5;%arg[6]%m !arg[%%a]!%esc%[38;5;%arg[5]%m!bar!%esc%[%lng%D%esc%[B"
			)
		)
		(endlocal
			echo %box%
		)
goto :eof















