::::BgetDescription#Library of string manipulation functions.
::::BgetAuthor#Icarus
::::BgetCategory#library

@echo off & setlocal enableDelayedExpansion

set ^"LF=^

^" Above empty line is required - do not remove
set ^"\n=^^^%LF%%LF%^%LF%%LF%^^"
for /F %%a in ('echo prompt $E^| cmd') do set "ESC=%%a"

call :reverse "This sentence is reversed"
call :length "The length of this string is 31"
call :upper "this sentence is all uppercase"
call :lower "THIS SENTENCE IS ALL LOWERCASE"
call :color 10 5 10 "This text is colored"

pause > nul & exit

:color x y color "text"
	set "text=%~4" & <nul set /p "=%esc%7%esc%[%~2;%~1H%esc%[38;5;%~3m!text!%esc%8"
goto :eof

:upper "text" outVar
	set "input=%~1" & for %%i IN ("a=A" "b=B" "c=C" "d=D" "e=E" "f=F" "g=G" "h=H" "i=I" "j=J" "k=K" "l=L" "m=M" "n=N" "o=O" "p=P" "q=Q" "r=R" "s=S" "t=T" "u=U" "v=V" "w=W" "x=X" "y=Y" "z=Z") do set "upper=!input:%%~i!" & set "input=!upper!"
	if "%~2" neq "" ( set "%~2=!upper!" ) else ( echo !upper! )
goto :eof

:lower "text" outVar
	set "input=%~1" & for %%i IN ("A=a" "B=b" "C=c" "D=d" "E=e" "F=f" "G=g" "H=h" "I=i" "J=j" "K=k" "L=l" "M=m" "N=n" "O=o" "P=p" "Q=q" "R=r" "S=s" "T=t" "U=u" "V=v" "W=w" "X=x" "Y=y" "Z=z") do set "lower=!input:%%~i!" & set "input=!lower!"
	if "%~2" neq "" ( set "%~2=!lower!" ) else ( echo !lower! )
goto :eof

:length "text" outVar
    setlocal
        set "str=X%~1"
        set length=0
        for /L %%a in (8,-1,0) do (
            set /a "length|=1<<%%a"
            for %%b in (!length!) do if "!str:~%%b,1!" equ "" set /a "length&=~1<<%%a"
        )
    (endlocal
        if "%~2" neq "" ( set "%2=%length%" ) else echo %length%
    )
goto :eof

:reverse "text" outVar
	set "input=%~1" & set "input=!input: =.!"
	call :length "%input%" c
	( for /l %%c in (0,1,!c!) do ( if "!input:~%%c,1!" neq "" ( set "reverse=!input:~%%c,1!!reverse!" ) else ( ( if "%~2" neq "" ( set "%~2=!reverse:.= !" ) else ( echo !reverse:.= ! )) & goto :eof )))
goto :eof

