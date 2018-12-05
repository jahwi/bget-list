@echo off & setlocal enableDelayedExpansion & mode 50,50

::::BgetDescription#POC on using macros to generate particles.
::::BgetAuthor#Icarus
::::BgetCategory#example

call :macros

for /l %%p in (0,1,50) do (
	set /a "tx[%%p]=%%p", "ty[%%p]=!random! %% 10 + 50", "alpha[%%p]=255", "lifeSpan[%%p]=!random! %% 10 + 15" & set "a[%%p]=true"
)

for /l %%# in () do (
	for /l %%p in (1,1,50) do (	
		if "!a[%%p]!" equ "true" (
			set /a "ty[%%p]+=-1", "lifeSpan[%%p]-=1", "alpha[%%p]-=1"
			if !lifeSpan[%%p]! leq 0 ( set "a[%%p]=false" ) else ( %plot% !tx[%%p]! !ty[%%p]! !alpha[%%p]! Û )
		) else ( 
			set /a "ty[%%p]=!random! %% 10 + 50", "alpha[%%p]=255", "lifeSpan[%%p]=!random! %% 10 + 15" & set "a[%%p]=true"
		)
	)
	for /l %%a in (1,35,1000000) do rem
	<nul set /p "=%esc%[2J!screen!" & set "screen="
)















:macros
set ^"LF=^

^" Above empty line is required - do not remove
set ^"\n=^^^%LF%%LF%^%LF%%LF%^^"
for /F %%a in ('echo prompt $E^| cmd') do set "ESC=%%a"
<nul set /p "=!esc![?25l"

rem %plot% x y 0-255 CHAR
set plot=for %%# in (1 2) do if %%#==2 ( for /f "tokens=1-4" %%1 in ("^!args^!") do (%\n%
  set "screen=^!screen^!!esc![%%2;%%1H!esc![38;5;%%3m%%~4!esc![0m"%\n%
)) else set args=
goto :eof