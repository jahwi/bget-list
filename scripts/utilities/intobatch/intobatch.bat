@echo off

::::BgetDescription#Convert any program into a script you can put in your batch script.
::::BgetAuthor#Lucas
::::BgetCategory#utilities
::::Bgettags#wrapper;wrap;container
if "%~1"=="" goto help
if /i "%~1"=="/s" echo /S cannot be before file name. & echo. & goto help
if /i "%~1"=="/h" goto help
if /i "%~1"=="/?" goto help
if /i "%~1"=="/help" goto help
if /i "%~1"=="/F" shift & goto force
if /i "%~2"=="/F" goto force
echo %~1|find "\" >nul
if %errorlevel%==1 goto skip
for %%i in ("%~1") do SET "mypath=%%~Pi"
for %%i in ("%~1") do SET "mydrive=%%~di"
for %%i in ("%~1") do SET "filenme=%%~ni"
for %%i in ("%~1") do SET "ext=%%~xi"
set filenme=%filenme%%ext%
pushd %mydrive%%mypath%
echo %filenme%|find " " >nul
if %errorlevel%==0 set filenme="%filnme%"
call :skip %filenme% %2 %3 %4
exit /b



:skip
set num=%random%%random%%random%%random%%random%%random%
set var=%1
echo %var%| findstr /c:" " >nul
if %errorlevel%==0 set set quote=Yes
:nt
echo attempting to convert "%~1"
set file=%~1
set input=%~1.temp
if not exist "%file%" echo FILE NOT FOUND. Use /h for help & exit /b
set output="%~1.txt"
echo.
setlocal

    echo Begining Conversion. Note that files over 100KB may take a minute or two.
	echo Very large files might take a couple hours.
certutil -encode "%file%" "temp.txt" >nul
echo if exist "%file%" goto %num% >%output%
setlocal EnableDelayedExpansion
for /f "tokens=*" %%A in (temp.txt) do (echo (echo %%A^)^>temp.txt>> %output% & goto s)
:s
echo ( >> %output%
for /f "tokens=* skip=1" %%A in (temp.txt) do ( echo echo %%A>> %output% )
echo )^>^>temp.txt >> %output%
echo certutil -decode "temp.txt" "%file%" ^>nul >> %output%
echo del /f /q "temp.txt" >> %output%
echo :%num% >> %output%
echo.
echo Completed. Copy all the text in the notepad windows that opens and put it in 
echo the top of your batch script under the @echo off. (You can have multiples of these in one file, one after the other.)
del /f /q "temp.txt"
if /i "%2"=="/S" exit /b
if /i "%3"=="/S" exit /b
notepad %output%
exit /b




:force
echo attempting to convert "%~1"
set file=%~1
set input=%~1.temp
if not exist "%file%" echo FILE NOT FOUND. Use /h for help & exit /b
set output="%~1.txt"
echo.
setlocal

    echo Begining Conversion. Note that files over 100KB may take a minute or two.
	echo Very large files might take a couple hours.
certutil -encode "%file%" "temp.txt" >nul
setlocal EnableDelayedExpansion
for /f "tokens=*" %%A in (temp.txt) do (echo (echo %%A^)^>temp.txt> %output% & goto s2)
:s2
echo ( >> %output%
for /f "tokens=* skip=1" %%A in (temp.txt) do ( echo echo %%A>> %output% )
echo )^>^>temp.txt >> %output%
echo certutil -decode "temp.txt" "%file%" ^>nul >> %output%
echo del /f /q "temp.txt" >> %output%
echo.
echo Completed. Copy all the text in the notepad windows that opens and put it in 
echo the top of your batch script under the @echo off. (You can have multiples of these in one file, one after the other.)
del /f /q "temp.txt"
if /i "%2"=="/S" exit /b
if /i "%3"=="/S" exit /b
notepad %output%
exit /b



:help

set ThisFile=%0

echo This tool allows you to store any type of file inside your batch code.
echo the Syntax is:  %ThisFile%  FileName [/F] [/S]
echo.
echo Example: %ThisFile% Icon.png
echo          This example will create a text document with a batch script in it (and will open said text document)
echo          copy that script into the top of your file (after '@echo off' if you have it), and when the batch file
echo          starts, if Icon.png does not exist it will create it!
echo.
echo the /F option makes a script that will replace the file you convert every time it runs. wether it exists or not.
echo the /S option does not open the file at the end of the conversion, and does not prompt for force.
echo.
echo Questions or problems? Contact us at Support@ITCommand.tech!
echo script written by Lucas Elliott with IT Command www.itcommand.tech
if "%1"=="" pause
endlocal
exit /b
