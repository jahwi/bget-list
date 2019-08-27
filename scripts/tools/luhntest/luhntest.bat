@echo off
setlocal enabledelayedexpansion

::::BgetDescription#Performs a Luhn test [checks if a credit card number is valid according to the luhn test]
::::BgetAuthor#RosettaCode
::::BgetCategory#tools

if /i "%~1"=="" (
	echo Luhn Test ^(Credit Card Number Checker^)
	echo.
	echo Usage: %0 [credit card number]
	echo Example: %0 49927398716
	exit /b 1
)
call :luhn "%~1"
exit /b 0
 
:luhn
set input=%~1
set cnt=0
set s1=0&set s2=0
:digit_loop
	set /a cnt-=1
	set /a isOdd=^(-%cnt%^)%%2
 
	if !isodd! equ 1 (
		set /a s1+=!input:~%cnt%,1!
	) else (
		set /a twice=!input:~%cnt%,1!*2
		if !twice! geq 10 (
			set /a s2+=!twice:~0,1!+!twice:~1,1!
		) else (
			set /a s2+=!twice!
		)
	)
	if "!input:~%cnt%!"=="!input!" (
		set /a sum=^(!s1!+!s2!^)%%10
		if !sum! equ 0 (echo !input! is valid.) else (echo !input! is not valid.)
		goto :EOF
	)
	goto digit_loop