@echo off & setlocal enableDelayedExpansion

::::BgetDescription#Various sorting algorithms.
::::BgetAuthor#Icarus
::::BgetCategory#library

echo.
for /l %%a in (1,1,10) do set /a "n=!random! %% 101" & set "numbers=!numbers!!n! "

echo  Numbers: %numbers%
echo.
call :bubble "%numbers%"
call :selection "%numbers%"

set "list=cow dog bird cat mouse camel moose donkey chicken rabbit bunny hamster"

echo. & echo.
echo  Sorting alphabetically
echo.
echo  %list%
echo.
call :sort "%list%"

for /l %%a in (1,1,12) do echo %%a) !sorted[%%a]!

pause > nul & exit



rem sort alphabetically
:sort
	pushd %temp%
		if defined s[1] for /f "tokens=1 delims==" %%a in ('set s[') do set "%%a="
		( for %%a in (%~1) do echo=%%~a>>tmpSort.txt)
		(for /f "tokens=*" %%a in ('sort tmpSort.txt') do ( set /a "s+=1" & set "sorted[!s!]=%%a"))
		( del /f /q tmpSort.txt ) & set "s="
	popd
goto :eof

rem sort numbers
:bubble
	( set "c=0" & for %%a in (x %~1) do ( set /a "c+=1", "n[!c!]=%%a" )) & set /a "cm=c - 1"
	( for /l %%l in (0,1,!cm!) do for /l %%c in (1,1,!cm!) do ( set /a "x=%%c + 1"
		for %%x in (!x!) do if !n[%%c]! gtr !n[%%x]! set /a "save=n[%%c]", "n[%%c]=n[%%x]", "n[%%x]=save"
	)) & ( for /l %%y in (2,1,!c!) do ( <nul set /p "=!n[%%y]! ")) & echo.
goto :eof

rem sort numbers
:selection
	( set "c=0" & for %%a in (x %~1) do ( set /a "c+=1", "n[!c!]=%%a" ))
	( for %%c in (%~1) do ( set /a "lowest=1000" 
		for /l %%n in (1,1,!c!) do if !n[%%n]! lss !lowest! set /a "lowest=n[%%n]", "ln=%%n"
		set "n[!ln!]=1000" & set "nl=!nl! !lowest!"
	)) & echo !nl:~1!
goto :eof
