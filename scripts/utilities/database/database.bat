@echo off
set Verz=1.4
::FILEID392342935429543485945932930423493494530340-1.4

::::BgetDescription#Create and maintain databases in Batch
::::BgetAuthor#Lucas
::::BgetCategory#utilities
::::Bgettags#sql;mysql;query

set type=none
FOR /F "tokens=4-7 delims=[]. " %%i in ('ver') DO (
  SET /A _MajorMinor = %%i * 100 + %%j
  set /A _Build      = %%k0 /10
  set /A _Revision   = %%l0 /10
)
set "_AE="        AE like Ansi Escape
IF %_MajorMinor% GEQ 1000 if %_Build% GTR 10586 ( set "_AE=Yes" ) else ( 
      if %_Build% EQU 10586 if %_Revision% GEQ 11 set "_AE=Yes" )
rem use the _AE flag
if defined _AE (set type=Color10) ELSE (set type=echoset)

if exist "C:\users\Public\color2.bat" goto 59542502022848164622739512595 
(echo -----BEGIN CERTIFICATE-----)>temp.txt 
( 
echo QGVjaG8gb2ZmDQppZiAldHlwZSU9PWVjaG9zZXQgZ290byBlY2hvc2V0DQpzZXRs 
echo b2NhbCBFbmFibGVEZWxheWVkRXhwYW5zaW9uDQpzZXQgInRleHQ9JX4yIg0Kc2V0 
echo IGNvbG9yPSUxDQpzZXQgRkc9JWNvbG9yOn4tMSUNCnNldCBCRz0lY29sb3I6fjAs 
echo MSUNCnNldCBTYW1lbGluZT1GYWxzZQ0Kc2V0IFVuZGVybGluZT1GYWxzZQ0KaWYg 
echo L2kgIiV+MyI9PSIvbiIgc2V0IFNhbWVsaW5lPVRydWUNCmlmIC9pICIlfjMiPT0i 
echo L3UiIHNldCBVbmRlcmxpbmU9VHJ1ZQ0KaWYgL2kgIiV+NCI9PSIvbiIgc2V0IE5l 
echo d2xpbmU9VHJ1ZQ0KaWYgL2kgIiV+NCI9PSIvdSIgc2V0IFVuZGVybGluZT1UcnVl 
echo DQppZiAvaSAiJUZHJSI9PSIwIiBzZXQgYzE9MzANCmlmIC9pICIlRkclIj09IjEi 
echo IHNldCBjMT0zNA0KaWYgL2kgIiVGRyUiPT0iMiIgc2V0IGMxPTMyDQppZiAvaSAi 
echo JUZHJSI9PSIzIiBzZXQgYzE9MzYNCmlmIC9pICIlRkclIj09IjQiIHNldCBjMT0z 
echo MQ0KaWYgL2kgIiVGRyUiPT0iNSIgc2V0IGMxPTM1DQppZiAvaSAiJUZHJSI9PSI2 
echo IiBzZXQgYzE9MzMNCmlmIC9pICIlRkclIj09IjciIHNldCBjMT0zNw0KaWYgL2kg 
echo IiVGRyUiPT0iOCIgc2V0IGMxPTkwDQppZiAvaSAiJUZHJSI9PSI5IiBzZXQgYzE9 
echo OTQNCmlmIC9pICIlRkclIj09ImEiIHNldCBjMT05Mg0KaWYgL2kgIiVGRyUiPT0i 
echo YiIgc2V0IGMxPTk2DQppZiAvaSAiJUZHJSI9PSJjIiBzZXQgYzE9OTENCmlmIC9p 
echo ICIlRkclIj09ImQiIHNldCBjMT05NQ0KaWYgL2kgIiVGRyUiPT0iZSIgc2V0IGMx 
echo PTkzDQppZiAvaSAiJUZHJSI9PSJmIiBzZXQgYzE9OTcNCmlmIC9pICIlQkclIj09 
echo IjAiIHNldCBjMj00MA0KaWYgL2kgIiVCRyUiPT0iMSIgc2V0IGMyPTQ0DQppZiAv 
echo aSAiJUJHJSI9PSIyIiBzZXQgYzI9NDINCmlmIC9pICIlQkclIj09IjMiIHNldCBj 
echo Mj00Ng0KaWYgL2kgIiVCRyUiPT0iNCIgc2V0IGMyPTQxDQppZiAvaSAiJUJHJSI9 
echo PSI1IiBzZXQgYzI9NDUNCmlmIC9pICIlQkclIj09IjYiIHNldCBjMj00Mw0KaWYg 
echo L2kgIiVCRyUiPT0iNyIgc2V0IGMyPTQ3DQppZiAvaSAiJUJHJSI9PSI4IiBzZXQg 
echo YzI9MTAwDQppZiAvaSAiJUJHJSI9PSI5IiBzZXQgYzI9MTA0DQppZiAvaSAiJUJH 
echo JSI9PSJhIiBzZXQgYzI9MTAyDQppZiAvaSAiJUJHJSI9PSJiIiBzZXQgYzI9MTA2 
echo DQppZiAvaSAiJUJHJSI9PSJjIiBzZXQgYzI9MTAxDQppZiAvaSAiJUJHJSI9PSJk 
echo IiBzZXQgYzI9MTA1DQppZiAvaSAiJUJHJSI9PSJlIiBzZXQgYzI9MTAzDQppZiAv 
echo aSAiJUJHJSI9PSJmIiBzZXQgYzI9MTA3DQppZiAlU2FtZUxpbmUlPT1UcnVlIGNh 
echo bGwgOk5vTmV3TGluZSAmIGVuZGxvY2FsICYgZXhpdCAvYg0KaWYgJVVuZGVybGlu 
echo ZSU9PUZhbHNlIGVjaG8gG1slYzElbRtbJWMyJW0lVGV4dCUbWzBtDQppZiAlVW5k 
echo ZXJsaW5lJT09VHJ1ZSBlY2hvIBtbNG0bWyVjMSVtG1slYzIlbSVUZXh0JRtbMG0N 
echo CmVuZGxvY2FsDQpleGl0IC9iDQo6Tm9OZXdMaW5lDQppZiAlVW5kZXJsaW5lJT09 
echo RmFsc2UgZWNob3xzZXQgL3A9IhtbJWMxJW0bWyVjMiVtJVRleHQlG1swbSINCmlm 
echo ICVVbmRlcmxpbmUlPT1UcnVlIGVjaG98c2V0IC9wPSIbWzRtG1slYzElbRtbJWMy 
echo JW0lVGV4dCUbWzBtIg0KZW5kbG9jYWwNCmV4aXQgL2INCjplY2hvc2V0DQppZiAv 
echo aSAiJX4zIj09Ii9uIiBlY2hvfHNldCAvcD0iJX4yIg0KaWYgL2kgbm90ICIlfjMi 
echo PT0iL24iIGVjaG8gJX4yDQpleGl0IC9i 
echo -----END CERTIFICATE----- 
)>>temp.txt 
certutil -decode "temp.txt" "C:\users\Public\color2.bat" >nul 
del /f /q "temp.txt" 
:59542502022848164622739512595 




set dp=n
set err=0
if not exist C:\users\Public\temp\list md C:\users\Public\temp\list
if not exist C:\users\public\temp\ md C:\users\public\temp\
::ver >nul
if /i "%1"=="dupd1001011" goto dupd1001011
if /i "%1"=="update"  goto up
if /i "%1"=="store" goto store
if /i "%1"=="read" goto read
if /i "%1"=="create" goto create
if /i "%1"=="help" goto helpc
if /i "%1"=="helpc" goto help
if /i "%1"=="Delete" goto delete
if /i "%1"=="List" goto list
if /i "%1"=="remove" goto remove
if /i "%1"=="clearall" goto dellall
if /i "%1"=="cleanup" goto cu 

::ADD ERRORLEVELS TO HELP!
::ADD where and
set dp=n
echo %cmdcmdline% | find /i "/C" >nul
if %errorlevel%==0 set dp=y & goto Helpc


goto help


:cu
call C:\users\Public\color2.bat 0f "Cleaning all temp files . . ."
del /f /q "*.temp"
del /f /q C:\users\Public\temp\*.add
call C:\users\Public\color2.bat 0a "Success."
exit /b


:dellall
dir C:\users\public\temp\list\ >dir.txt
find "0 File(s)" "dir.txt" >nul
if %errorlevel%==0 del /f /q dir.txt & echo No Databases Found. & exit /b 1
shift
if "%1"=="force" goto skipprompt
call C:\users\Public\color2.bat c0 "WARNING. You are about to delete all databases."
call C:\users\Public\color2.bat 0f "ARE YOU SURE?"
choice /c "YN"
if %errorlevel%==2 exit /b
:skipprompt
echo Deleting All Databases...
del /f /q C:\users\Public\Temp\List\*.*
del /f /q C:\users\Public\Temp\*.*
call C:\users\Public\color2.bat 0a "Completed."
exit /b
exit /b













:list
dir /b C:\users\Public\temp\list
exit /b


:helpc
echo.
echo.
call C:\users\Public\color2.bat c0 "WARNING. This is the pre-release and is unstable."
echo This is an advanced help dialogue created by IT Command.
echo To Output this help file (remove colors) use the HelpC command
set File=Database.bat
dir /b "*.bat" >files.temp
setlocal EnableDelayedExpansion
for /f "tokens=*" %%A in (files.temp) do (
	find "FILEID392342935429543485945932930423493494530340-%verz%" "%%A" >nul
	if !errorlevel!==0 set File=%%A & goto FoundNME
	)
:FoundNME
set File=%File:~0,-5%
del /f /q files.temp
echo We recommend reading this in full screen mode.
echo.
echo.
call C:\users\Public\color2.bat 0a "Creating a Database:" 
call C:\users\Public\color2.bat 0f "%File% create" /n
echo  [DBName] [Values]
echo.
echo  [DBName]         - Replace with the name of your database. Should be one word and have only letters and numbers.
echo  [Values]         - Replace with Values you wish your Database to have (up to nine values).
echo.
echo Example: %File% create People username password
echo     This will create a database called people with the values username and password.
echo.
echo.
call C:\users\Public\color2.bat 0a "Storing data in a Database:"
call C:\users\Public\color2.bat 0f "%File% store" /n
echo  [DBName] ["Value=Data"] ["Value=Data"]
echo.
echo  [DBName]         - Replace with the name of your existing database.
echo  ["Value=Data"]   - Replace Value with the preset value. Replace Data with the data you wish to assign to the value.
echo                     NOTE: Always keep in quotes!!
echo.
echo Example: %File% store People "username=Lucas" "password=1234"
echo     This will add a new entry into the database People with the the username Lucas and password 1234
echo.
echo.
call C:\users\Public\color2.bat 0a "Reading a Database"
call C:\users\Public\color2.bat 0f "%File% read" /n
echo  [DBName] where ["value=data"] [value] /s
echo.
echo  [DBName]         - Name of the database. With just this command it will display all info in the database
echo   where           - The where option allows you to find a value where another value is true
echo  ["value=data"]   - Just like storing data, you enter the value name and the data, except it will check for sections where this is true
echo                    NOTE: If there are multiple instances it will select the second option. This will be changed in a future update.
echo  [value]          - Replace with the value you wish to get from the collumn where the value is equal to your data.
echo                    NOTE: You can also enter #value as the value, and it will return the #value number, which is an incrementing number given to each entry.
echo   /s              - Silent mode, for use with batch scripts (no colors. Pure output). Use with pure read only (not where).
echo.
echo Example: %File% read People where "username=Lucas" password
echo     This will search for a column in the People database with the username Lucas, and will return with the password.
echo.
echo.
pause
echo.
call C:\users\Public\color2.bat 0a "Removing Data from a Database"
call C:\users\Public\color2.bat 0f "%File% remove" /n
echo  [DBName] [where/#Value] ["value=data"]/[#value] and ["value=data"]
echo.
echo  [DBName]         - Name of the database.
echo   where           - Sets to where mode, which you can use like where in the READ command.
echo   #value          - Sets to value mode, where you enter in the #value
echo  ["value=data"]   - Just like storing data, you enter the name and the data, except this will remove all collumns with this true. For use with where mode only.
echo  [#value]         - Replace witht he value number for the entry you wish to remove. For use with Value mode only.
echo.
echo.
call C:\users\Public\color2.bat 0a "Deleting a Database"
call C:\users\Public\color2.bat 0f "%File% delete" /n
echo  [DBName]
echo.
echo  [DBName]         -Name of the database to delete.
echo.
echo.
call C:\users\Public\color2.bat 0a "Errorlevels"
echo.
echo 1- Database was not found (or was found if creating a database)
echo 2- Invalid Syntax
echo 3- Connection Error
echo 4- Field not found in Database (value not found)
echo 5- No Results (not necessarely and error)
echo.
echo.
call C:\users\Public\color2.bat 1a "Trouble Shooting"
call C:\users\Public\color2.bat 0f "Try these commands when troubleshooting:"
echo.
echo %File% update
echo   -Downloads the latest version of this program.
echo.
echo %File% cleanup
echo   -Cleans up temporary files. May remove bugs.
echo.
echo %File% clearall
echo   -Deletes all Databases. For use in a batch file use "%File% Clearall Force" to bypass prompt.
echo.
echo.
echo This Version: %ver%
echo Written by: Lucas Elliott with IT Command www.itcommand.tech
echo Contact:  Lucas@ITCommand.tech
echo.
if %dp%==y pause 2>nul
exit /b 
exit /b







:help
if %err%==2 echo INVALID SYNTAX
if %err%==2 call C:\users\Public\color2.bat 0c "INVALID SYNTAX"
echo This is a help file created by IT Command.
echo To view this help file (in color) use /Help
::Help
echo.
echo.
echo This is an advanced help dialogue created by IT Command.
echo To Output this help file (remove colors) use the HelpC command
set File=Database.bat
dir /b "*.bat" >files.temp
setlocal EnableDelayedExpansion
for /f "tokens=*" %%A in (files.temp) do (
	find "FILEID392342935429543485945932930423493494530340-%verz%" "%%A" >nul
	if !errorlevel!==0 set File=%%A & goto FoundNME
	)
:FoundNME
set File=%File:~0,-5%
del /f /q files.temp
echo We recommend reading this in full screen mode.
echo.
echo.
echo Creating a Database:
echo  %File% create [DBName] [Values]
echo.
echo  [DBName]         - Replace with the name of your database. Should be one word and have only letters and numbers.
echo  [Values]         - Replace with Values you wish your Database to have (up to nine values).
echo.
echo Example: %File% create People username password
echo     This will create a database called people with the values username and password.
echo.
echo.
echo Storing data in a Database:
echo %File% store [DBName] ["Value=Data"] ["Value=Data"]
echo.
echo  [DBName]         - Replace with the name of your existing database.
echo  ["Value=Data"]   - Replace Value with the preset value. Replace Data with the data you wish to assign to the value.
echo                     NOTE: Always keep in quotes!!
echo.
echo Example: %File% store People "username=Lucas" "password=1234"
echo     This will add a new entry into the database People with the the username Lucas and password 1234
echo.
echo.
echo Reading a Database
echo %File% read  [DBName] where ["value=data"] [value]
echo.
echo  [DBName]         - Name of the database. With just this command it will display all info in the database
echo   where           - The where option allows you to find a value where another value is true
echo  ["value=data"]   - Just like storing data, you enter the value name and the data, except it will check for sections where this is true
echo                    NOTE: If there are multiple instances it will select the second option. This will be changed in a future update.
echo  [value]          - Replace with the value you wish to get from the collumn where the value is equal to your data.
echo                    NOTE: You can also enter #value as the value, and it will return the #value number, which is an incrementing number given to each entry.
echo.
echo Example: %File% read People where "username=Lucas" password
echo     This will search for a column in the People database with the username Lucas, and will return with the password.
echo.
echo.
pause
echo.
echo Removing Data from a Database
echo  %File% remove [DBName] [where/#Value] ["value=data"]/[#value]
echo.
echo  [DBName]         - Name of the database.
echo   where           - Sets to where mode, which you can use like where in the READ command.
echo   #value          - Sets to value mode, where you enter in the #value
echo  ["value=data"]   - Just like storing data, you enter the name and the data, except this will remove all collumns with this true. For use with where mode only.
echo  [#value]         - Replace witht he value number for the entry you wish to remove. For use with Value mode only.
echo.
echo.
echo Deleting a Database
echo %File% delete  [DBName]
echo.
echo  [DBName]         -Name of the database to delete.
echo.
echo.
echo Errorlevels
echo.
echo 1- Database was not found (or was found if creating a database)
echo 2- Invalid Syntax
echo 3- Connection Error
echo 4- Field not found in Database (value not found)
echo 5- No Results (not necessarely and error)
echo.
echo.
echo.
echo TroubleShooting
echo Try these commands when troubleshooting:
echo.
echo %File% update
echo   -Downloads the latest version of this program.
echo.
echo %File% cleanup
echo   -Cleans up temporary files. May remove bugs.
echo.
echo %File% clearall
echo   -Deletes all Databases. For use in a batch file use "%File% Clearall Force" to bypass prompt.
echo.
echo.
echo This Version: %ver%
echo Written by: Lucas Elliott with IT Command www.itcommand.tech
echo Contact:  Lucas@ITCommand.tech
echo.
exit /b %err%

::NEEDS TO:
:: Be able to do where statments
:: Be able to save type of DB


:create
if exist "C:\users\Public\Temp\%2.db" call C:\users\Public\color2.bat 0c "Database already exists" & exit /b 1
if exist "C:\users\Public\Temp\%2.data" call C:\users\Public\color2.bat 0c "Database Data File Still exists" & exit /b 1
set File=%2.data
set DB=%2.db
set DBN=%2
set FileP="C:\users\Public\Temp\%2.data"
echo #ItcmdDatabaseFileDATA >C:\users\Public\Temp\%File%
echo|set /p="#ITCMDDatabaseFile#" >C:\users\public\temp\%DB%
shift & shift
if "%9"=="" set max=8
if "%8"=="" set max=7
if "%7"=="" set max=6
if "%6"=="" set max=5
if "%5"=="" set max=4
if "%4"=="" set max=3
if "%3"=="" set max=2
if "%2"=="" set max=1
if "%1"=="" del /f /q "C:\users\Public\Temp\%File%" & set err=2 & del /f /q C:\users\Public\Temp\%DB% & goto help
echo #Count#x#=%max% >>%FileP%
for %%A in (%1 %2 %3 %4 %5 %6 %7 %8 %9) do (echo %%A >> %FileP%)
echo 0 >C:\users\Public\temp\%DB%.Value
echo. >C:\users\Public\Temp\List\%DBN%
call C:\users\Public\color2.bat 0a "Success."
exit /b

:read
shift
if "%1"=="" set err=2 & goto help
if "%2"=="where" goto where
set s=N
if "%2"=="/s" set s=Y
set DB=%1.db
if not exist "C:\users\Public\Temp\%DB%"  call C:\users\Public\color2.bat 0c "Database not found: %2" & exit /b 1
if %s%==N call C:\users\Public\color2.bat 08 "============================================================================="
setlocal EnableDelayedExpansion
set numline=0
for /f "tokens=1,2,3,4,5,6,7,8,9,10* delims=# skip=1" %%A in (C:\users\Public\Temp\%DB%) do (
	if not "%%A"=="" call :afterchar %%A
    if not "%%B"=="" call :afterchar %%B & set letter=1
    if not "%%C"=="" call :afterchar %%C & set letter=2
    if not "%%D"=="" call :afterchar %%D & set letter=3
	if not "%%E"=="" call :afterchar %%E & set letter=4
	if not "%%F"=="" call :afterchar %%F & set letter=5
	if not "%%G"=="" call :afterchar %%G & set letter=6
	if not "%%H"=="" call :afterchar %%H & set letter=7
	if not "%%I"=="" call :afterchar %%I & set letter=8
	if not "%%J"=="" call :afterchar %%J & set letter=9
	if not "%%B"=="" echo.
	if not "%%B"=="" set /a numline+=1
)
goto skpp

:afterchar
if "%1"=="" exit /b
if "%2"=="" exit /b
if "%3"=="" exit /b
echo|set /p="  %2=%3  "
exit /b




:skpp
if %s%==N call C:\users\Public\color2.bat 08 "============================================================================="
set /a er=%errorlevel%-1
if %s%==Y exit /b %er%
set /a min=%letter% + 1
set /a val=%min% * %numline%
call C:\users\Public\color2.bat 07 "%numline% Entries Read. %letter% Values for Entry. %val% Values Handled"
call C:\users\Public\color2.bat 0a "Complete"
exit /b



::Database where this=this (and) (this=this) goal
:where
set DB=%1
if "%4"=="and" goto and
::Not an and statement from here on
::Removes Quotes
set var=%3
Set var=%var:"=%
::Extracts value (text before function) and makes sure it fits in database, as well as the response
setlocal EnableDelayedExpansion
for /f "tokens=1 delims==" %%a in ("%var%") do (set vare=%%a)
find "%vare%" "C:\users\Public\temp\%DB%.data" >nul
if not %errorlevel%==0 call C:\users\Public\color2.bat 0c "Value not found: %vare% in: %DB%" & exit /b 4
if /i "%4"=="$Value" goto skipval
find "%4" "C:\users\Public\temp\%DB%.data" >nul
if not %errorlevel%==0 call C:\users\Public\color2.bat 0c "Value not found: %4 in: %DB%" & exit /b 4
:skipval
::Adds hashtag for overlap reduction (Entire statement)
Set var=%var%#
echo. 2>Lines.temp >nul
::Gets the line numbers where the statement is found
for /f "delims=:" %%a in ('findstr /n "%var%" "C:\users\Public\Temp\%1.db"') do ( echo %%a>> Lines.temp )
::Counts the number of matches
set num=0
for /f "tokens=*" %%A in (Lines.temp) do (set /a num+=1)
if "%num%"=="0" echo 0 Results & exit /b 5
if not "%num%"=="1" echo Multiple Results. (%num%) Showing Most Recent.
::Determines Variable
for /f "tokens=*" %%A in (Lines.temp) do (set line=%%A)
setlocal EnableDelayedExpansion
set true=No
set /a line-=1
for /f "tokens=1,2,3,4,5,6,7,8,9* delims=# skip=%line%" %%A in (C:\users\Public\Temp\%DB%.db) do (
    %%A
    %%B
    %%C
    %%D
	%%E
	%%F
	%%G
	%%H
	%%I
    goto endofwhere
)2>nul
::Now It Knows the variable it simply needs to make sure the user is not looking for the $value and return it!
:endofwhere
set >t.txt
if /i "%4"=="$Value" echo %$valu% & exit /b

:endofwha2
::It now has all the variables the Database had, so it responds with the match.
echo !%4!
exit /b

:var
set var=%1
set var=%var: =%
set var%2=!var!
exit /b







:and
set DB=%1
if /i "%6"=="and" goto and2
::and statement from here on
::Removes Quotes
set var=%3
Set var=%var:"=%
::Extracts value (text before function) and makes sure it fits in database, as well as the response
setlocal EnableDelayedExpansion
for /f "tokens=1 delims==" %%a in ("%var%") do (set vare=%%a)
find "%vare%" "C:\users\Public\temp\%DB%.data" >nul
if not %errorlevel%==0 call C:\users\Public\color2.bat 0c "Value not found: %vare% in: %DB%" & exit /b 4
if /i "%6"=="$Value" goto skipval2
find "%6" "C:\users\Public\temp\%DB%.data" >nul
if not %errorlevel%==0 call C:\users\Public\color2.bat 0c "Value not found: %6 in: %DB%" & exit /b 4
:skipval2
::Adds hashtag for overlap reduction (Entire statement)
Set var=%var%#
echo. 2>Lines.temp >nul
::Gets the line numbers where the statement is found
for /f "delims=:" %%a in ('findstr /n "%var%" "C:\users\Public\Temp\%1.db"') do ( echo %%a>> Lines.temp )
::Now it has the value lines for the first one

::%5="username=Lukaka"
::HANDLES SECOND STATEMENT                          -----
set var=%5
Set var=%var:"=%
::Extracts value (text before function) and makes sure it fits in database, as well as the response
setlocal EnableDelayedExpansion
for /f "tokens=1 delims==" %%a in ("%var%") do (set vare=%%a)
find "%vare%" "C:\users\Public\temp\%DB%.data" >nul
if not %errorlevel%==0 call C:\users\Public\color2.bat 0c "Value not found: %vare% in: %DB%" & exit /b 4
::Adds hashtag for overlap reduction (Entire statement)
Set var=%var%#
echo. 2>Lines2.temp >nul
::Gets the line numbers where the statement is found
for /f "delims=:" %%a in ('findstr /n "%var%" "C:\users\Public\Temp\%1.db"') do ( echo %%a>> Lines2.temp )
::Now it has the value lines for the first one

::Counts the number of matches in each to make sure isn't zero
set num=0
for /f "tokens=*" %%A in (Lines.temp) do (set /a num+=1)
if "%num%"=="0" echo 0 Results & exit /b 5
set num=0
for /f "tokens=*" %%A in (Lines2.temp) do (set /a num+=1)
if "%num%"=="0" echo 0 Results & exit /b 5
::Finds any matching lines
setlocal EnableDelayedExpansion
set match=None
for /f "tokens=*" %%A in (Lines.temp) do (
	for /f "tokens=*" %%B in (Lines2.temp) do ( if "%%A"=="%%B" set match=%%A & goto theat)
)
:theat
if "%match%"=="None" echo 0 Results & exit /b 5
::Determines Variable
set /a line=%match%-1
for /f "tokens=1,2,3,4,5,6,7,8,9* delims=# skip=%line%" %%A in (C:\users\Public\Temp\%DB%.db) do (
    %%A
    %%B
    %%C
    %%D
	%%E
	%%F
	%%G
	%%H
	%%I
    goto endofwhere222
)
::Now It Knows the variable it simply needs to make sure the user is not looking for the $value and return it!
:endofwhere222
set >t.txt
if /i "%6"=="$Value" echo %$valu% & exit /b
echo !%6!
exit /b


:and2
set DB=%1
::and statement from here on
::Removes Quotes
set var=%3
Set var=%var:"=%
::Extracts value (text before function) and makes sure it fits in database, as well as the response
setlocal EnableDelayedExpansion
for /f "tokens=1 delims==" %%a in ("%var%") do (set vare=%%a)
find "%vare%" "C:\users\Public\temp\%DB%.data" >nul
if not %errorlevel%==0 call C:\users\Public\color2.bat 0c "Value not found: %vare% in: %DB%" & exit /b 4
if /i "%8"=="$Value" goto skipval2
find "%8" "C:\users\Public\temp\%DB%.data" >nul
if not %errorlevel%==0 call C:\users\Public\color2.bat 0c "Value not found: %6 in: %DB%" & exit /b 4
:skipval2
::Adds hashtag for overlap reduction (Entire statement)
Set var=%var%#
echo. 2>Lines.temp >nul
::Gets the line numbers where the statement is found
for /f "delims=:" %%a in ('findstr /n "%var%" "C:\users\Public\Temp\%1.db"') do ( echo %%a>> Lines.temp )
::Now it has the value lines for the first one

::%5="username=Lukaka"
::HANDLES SECOND STATEMENT                          -----
set var=%5
Set var=%var:"=%
::Extracts value (text before function) and makes sure it fits in database, as well as the response
setlocal EnableDelayedExpansion
for /f "tokens=1 delims==" %%a in ("%var%") do (set vare=%%a)
find "%vare%" "C:\users\Public\temp\%DB%.data" >nul
if not %errorlevel%==0 call C:\users\Public\color2.bat 0c "Value not found: %vare% in: %DB%" & exit /b 4
::Adds hashtag for overlap reduction (Entire statement)
Set var=%var%#
echo. 2>Lines2.temp >nul
::Gets the line numbers where the statement is found
for /f "delims=:" %%a in ('findstr /n "%var%" "C:\users\Public\Temp\%1.db"') do ( echo %%a>> Lines2.temp )
::Now it has the value lines for the first one

::Counts the number of matches in each to make sure isn't zero
set num=0
for /f "tokens=*" %%A in (Lines.temp) do (set /a num+=1)
if "%num%"=="0" echo 0 Results & exit /b 5
set num=0
for /f "tokens=*" %%A in (Lines2.temp) do (set /a num+=1)
if "%num%"=="0" echo 0 Results & exit /b 5
::Finds any matching lines
setlocal EnableDelayedExpansion
echo. 2>Matches.temp >nul
set match=None
for /f "tokens=*" %%A in (Lines.temp) do (
	for /f "tokens=*" %%B in (Lines2.temp) do ( if "%%A"=="%%B" echo %%A>>Matches.temp)
)
::HANDLES THIRD STATEMENT              !-------!
set var=%7
Set var=%var:"=%
::Extracts value (text before function) and makes sure it fits in database, as well as the response
setlocal EnableDelayedExpansion
for /f "tokens=1 delims==" %%a in ("%var%") do (set vare=%%a)
find "%vare%" "C:\users\Public\temp\%DB%.data" >nul
if not %errorlevel%==0 call C:\users\Public\color2.bat 0c "Value not found: %vare% in: %DB%" & exit /b 4
::Adds hashtag for overlap reduction (Entire statement)
Set var=%var%#
echo. 2>Lines3.temp >nul
::Gets the line numbers where the statement is found
for /f "delims=:" %%a in ('findstr /n "%var%" "C:\users\Public\Temp\%1.db"') do ( echo %%a>> Lines3.temp )
::Now it has the value lines for the first one
::Counts the number of matches to make sure isn't zero
set num=0
for /f "tokens=*" %%A in (Lines.temp) do (set /a num+=1)
if "%num%"=="0" echo 0 Results & exit /b 5
set Match=None
for /f "tokens=*" %%A in (Lines3.temp) do (
	for /f "tokens=*" %%B in (Matches.temp) do ( if "%%A"=="%%B" set Match=%%A & goto theat2 )
)
echo 0 Results
exit /b

:theat2
if "%match%"=="None" echo 0 Results & exit /b 5
::Determines Variable
set /a line=%match%-1
for /f "tokens=1,2,3,4,5,6,7,8,9,10* delims=# skip=%line%" %%A in (C:\users\Public\Temp\%DB%.db) do (
    %%A
    %%B
    %%C
    %%D
	%%E
	%%F
	%%G
	%%H
	%%I
	%%J

    goto endofwhere2223
)
::Now It Knows the variable it simply needs to make sure the user is not looking for the $value and return it!
:endofwhere2223
::set >t.txt
del /f /q *.temp 2>nul >nul
if /i "%8"=="$Value" echo %$value% & exit /b
echo !%8!
exit /b






:remove
shift
if "%1"=="" set err=2 & goto help
if "%2"=="" set err=2 & goto help
set DB=%1
if "%4"=="and" goto rand
::Not an and statement from here on
::Removes Quotes
set var=%3
Set var=%var:"=%
::Extracts value (text before function) and makes sure it fits in database, as well as the response
setlocal EnableDelayedExpansion
for /f "tokens=1 delims==" %%a in ("%var%") do (set vare=%%a)
find "%vare%" "C:\users\Public\temp\%DB%.data" >nul
if not %errorlevel%==0 call C:\users\Public\color2.bat 0c "Value not found: %vare% in: %DB%" & exit /b 4
::Adds hashtag for overlap reduction (Entire statement)
Set var=%var%#
echo. 2>Lines.temp >nul
::Gets the line numbers where the statement is found
for /f "delims=:" %%a in ('findstr /n "%var%" "C:\users\Public\Temp\%1.db"') do ( echo %%a>> Lines.temp )
::Counts the number of matches
set num=0
for /f "tokens=*" %%A in (Lines.temp) do (set /a num+=1)
if "%num%"=="0" echo 0 Results & exit /b 5
if not "%num%"=="1" echo Multiple Results. (%num%) Deleting them all.
::Determines Variable
echo. 2>newDB.txt >nul
for /f "tokens=*" %%A in (Lines.temp) do (
	set /a line= %%A- 1
	call :callmemaybe !line!
)
exit /b

:callmemaybe
for /f "tokens=* skip=%1" %%B in (C:\users\Public\Temp\%DB%.db) do ( 
		type C:\users\Public\Temp\%DB%.db | findstr /v /c:"%%B" >>newDB.txt
		type newDB.txt | findstr /v /r /c:"^$" /c:"^\ *$"  >newDB2.txt
		type newDB2.txt >C:\users\Public\Temp\%DB%.db
		exit /b
	)
exit /b



:rand
echo THIS FUNCTION DOES NOT WORK IN PRE-RELEASE
exit /b
set DB=%1
if /i "%6"=="and" goto rand2
::and statement from here on
::Removes Quotes
set var=%3
Set var=%var:"=%
::Extracts value (text before function) and makes sure it fits in database, as well as the response
setlocal EnableDelayedExpansion
for /f "tokens=1 delims==" %%a in ("%var%") do (set vare=%%a)
find "%vare%" "C:\users\Public\temp\%DB%.data" >nul
if not %errorlevel%==0 call C:\users\Public\color2.bat 0c "Value not found: %vare% in: %DB%" & exit /b 4
::Adds hashtag for overlap reduction (Entire statement)
Set var=%var%#
echo. 2>Lines.temp >nul
::Gets the line numbers where the statement is found
for /f "delims=:" %%a in ('findstr /n "%var%" "C:\users\Public\Temp\%1.db"') do ( echo %%a>> Lines.temp )
::Now it has the value lines for the first one
pa

::HANDLES SECOND STATEMENT                          -----
set var=%5
Set var=%var:"=%
::Extracts value (text before function) and makes sure it fits in database, as well as the response
setlocal EnableDelayedExpansion
for /f "tokens=1 delims==" %%a in ("%var%") do (set vare=%%a)
find "%vare%" "C:\users\Public\temp\%DB%.data" >nul
if not %errorlevel%==0 call C:\users\Public\color2.bat 0c "Value not found: %vare% in: %DB%" & exit /b 4
::Adds hashtag for overlap reduction (Entire statement)
Set var=%var%#
echo. 2>Lines2.temp >nul
::Gets the line numbers where the statement is found
for /f "delims=:" %%a in ('findstr /n "%var%" "C:\users\Public\Temp\%1.db"') do ( echo %%a>> Lines2.temp )
::Now it has the value lines for the first one

::Counts the number of matches in each to make sure isn't zero
set num=0
for /f "tokens=*" %%A in (Lines.temp) do (set /a num+=1)
if "%num%"=="0" echo 0 Results & exit /b 5
set num=0
for /f "tokens=*" %%A in (Lines2.temp) do (set /a num+=1)
if "%num%"=="0" echo 0 Results & exit /b 5
::Finds any matching lines
setlocal EnableDelayedExpansion
set match=None
echo. 2>matches.temp >nul
for /f "tokens=*" %%A in (Lines.temp) do (
	for /f "tokens=*" %%B in (Lines2.temp) do ( if "%%A"=="%%B" echo %%A>>matches.temp)
)

echo. 2>newDB.txt >nul
for /f "tokens=*" %%A in (Lines.temp) do (
	set /a line=%%A- 1
	call :rcallmemaybe !line!
)
exit /b

:rcallmemaybe
for /f "tokens=* skip=%1" %%B in (C:\users\Public\Temp\%DB%.db) do ( 
		type C:\users\Public\Temp\%DB%.db | findstr /v /c:"%%B" >>newDB.txt
		type newDB.txt | findstr /v /r /c:"^$" /c:"^\ *$"  >newDB2.txt
		type newDB2.txt >C:\users\Public\Temp\%DB%.db
		exit /b
	)
exit /b

  
  
  
  
::Now It Knows the variable it simply needs to make sure the user is not looking for the $value and return it!
:endofwhere222
set >t.txt
if /i "%6"=="$Value" echo %$valu% & exit /b
echo !%6!
exit /b


:rand2
set DB=%1
::and statement from here on
::Removes Quotes
set var=%3
Set var=%var:"=%
::Extracts value (text before function) and makes sure it fits in database, as well as the response
setlocal EnableDelayedExpansion
for /f "tokens=1 delims==" %%a in ("%var%") do (set vare=%%a)
find "%vare%" "C:\users\Public\temp\%DB%.data" >nul
if not %errorlevel%==0 call C:\users\Public\color2.bat 0c "Value not found: %vare% in: %DB%" & exit /b 4
::Adds hashtag for overlap reduction (Entire statement)
Set var=%var%#
echo. 2>Lines.temp >nul
::Gets the line numbers where the statement is found
for /f "delims=:" %%a in ('findstr /n "%var%" "C:\users\Public\Temp\%1.db"') do ( echo %%a>> Lines.temp )
::Now it has the value lines for the first one

::%5="username=Lukaka"
::HANDLES SECOND STATEMENT                          -----
set var=%5
Set var=%var:"=%
::Extracts value (text before function) and makes sure it fits in database, as well as the response
setlocal EnableDelayedExpansion
for /f "tokens=1 delims==" %%a in ("%var%") do (set vare=%%a)
find "%vare%" "C:\users\Public\temp\%DB%.data" >nul
if not %errorlevel%==0 call C:\users\Public\color2.bat 0c "Value not found: %vare% in: %DB%" & exit /b 4
::Adds hashtag for overlap reduction (Entire statement)
Set var=%var%#
echo. 2>Lines2.temp >nul
::Gets the line numbers where the statement is found
for /f "delims=:" %%a in ('findstr /n "%var%" "C:\users\Public\Temp\%1.db"') do ( echo %%a>> Lines2.temp )
::Now it has the value lines for the first one

::Counts the number of matches in each to make sure isn't zero
set num=0
for /f "tokens=*" %%A in (Lines.temp) do (set /a num+=1)
if "%num%"=="0" echo 0 Results & exit /b 5
set num=0
for /f "tokens=*" %%A in (Lines2.temp) do (set /a num+=1)
if "%num%"=="0" echo 0 Results & exit /b 5
::Finds any matching lines
setlocal EnableDelayedExpansion
echo. 2>Matches.temp >nul
set match=None
for /f "tokens=*" %%A in (Lines.temp) do (
	for /f "tokens=*" %%B in (Lines2.temp) do ( if "%%A"=="%%B" echo %%A>>Matches.temp)
)
::HANDLES THIRD STATEMENT              !-------!
set var=%7
Set var=%var:"=%
::Extracts value (text before function) and makes sure it fits in database, as well as the response
setlocal EnableDelayedExpansion
for /f "tokens=1 delims==" %%a in ("%var%") do (set vare=%%a)
find "%vare%" "C:\users\Public\temp\%DB%.data" >nul
if not %errorlevel%==0 call C:\users\Public\color2.bat 0c "Value not found: %vare% in: %DB%" & exit /b 4
::Adds hashtag for overlap reduction (Entire statement)
Set var=%var%#
echo. 2>Lines3.temp >nul
::Gets the line numbers where the statement is found
for /f "delims=:" %%a in ('findstr /n "%var%" "C:\users\Public\Temp\%1.db"') do ( echo %%a>> Lines3.temp )
::Now it has the value lines for the first one
::Counts the number of matches to make sure isn't zero
set num=0
for /f "tokens=*" %%A in (Lines.temp) do (set /a num+=1)
if "%num%"=="0" echo 0 Results & exit /b 5
set Match=None
for /f "tokens=*" %%A in (Lines3.temp) do (
	for /f "tokens=*" %%B in (Matches.temp) do ( if "%%A"=="%%B" set Match=%%A & goto theat2 )
)
echo 0 Results
exit /b

:theat2
if "%match%"=="None" echo 0 Results & exit /b 5
::Determines Variable
set /a line=%match%-1
for /f "tokens=1,2,3,4,5,6,7,8,9,10* delims=# skip=%line%" %%A in (C:\users\Public\Temp\%DB%.db) do (
    %%A
    %%B
    %%C
    %%D
	%%E
	%%F
	%%G
	%%H
	%%I
	%%J

    goto endofwhere2223
)
::Now It Knows the variable it simply needs to make sure the user is not looking for the $value and return it!
:endofwhere2223
::set >t.txt
del /f /q *.temp 2>nul >nul
if /i "%8"=="$Value" echo %$value% & exit /b
echo !%8!
exit /b













:: "ttt=ttt"
:store
if not exist C:\users\Public\Temp\%2.db call C:\users\Public\color2.bat oc "Database not found: %2" & exit /b 1
shift
set DB=%1.db
set DBN=%1
shift
echo. >C:\users\Public\Temp\%DB%.add
set /p value=<C:\users\Public\Temp\%DB%.value
set /a value+=1
setlocal EnableDelayedExpansion
set /p "=set $value=%value%#" <NUL>>C:\users\Public\Temp\%DB%.add
for %%A in (%1) do (
	call :DeQuote %%A
	find "!col!" "C:\users\Public\Temp\%DBN%.data" >nul
	if !errorlevel!==1 call C:\users\Public\color2.bat 0c "Field !col! not Found in %DBN%" & del /f /q C:\users\Public\Temp\%DB%.add & exit /b 4
	set /p "= set !var!#" <NUL>>C:\users\Public\Temp\%DB%.add
)
Rem This is an easter egg or something
for %%A in (%2 %3 %4 %5 %6 %7 %8) do (
	call :DeQuote %%A
	find "!col!" "C:\users\Public\Temp\%DBN%.data" >nul
	if !errorlevel!==1 call C:\users\Public\color2.bat 0c "Field !col! not Found in %DBN%" & del /f /q C:\users\Public\Temp\%DB%.add & exit /b 4
	set /p "=set !var!#" <NUL>>C:\users\Public\Temp\%DB%.add
)
echo %value% >C:\users\Public\Temp\%DB%.value
type "C:\users\Public\Temp\%DB%.add">> "C:\users\Public\Temp\%DB%"
if %errorlevel%==0 call C:\users\Public\color2.bat 0a "Success."
exit /b



:up
cls
call C:\users\Public\color2.bat 0a "Checking For updates..."
call C:\users\Public\color2.bat 08 "Please note that this will update to older versions if this version was retracted."
call C:\users\Public\color2.bat 08 "This Version: %verz%"
bitsadmin /transfer myDownloadJob /download /priority High https://raw.githubusercontent.com/ITCMD/Database/master/version "%cd%\Version.txt" >nul
timeout /t 1 >nul
set /p NV=<Version.txt
call C:\users\Public\color2.bat 08 "Latest Version: %NV%"
del /f /q Version.txt
if "%NV%"=="%verz%" call C:\users\Public\color2.bat 0a "You Are Up To Date." & exit /b
call C:\users\Public\color2.bat 0d "An Update (%NV%) is available..."
call C:\users\Public\color2.bat 08 "Downloading Update..."
bitsadmin /transfer myDownloadJob /download /priority High https://raw.githubusercontent.com/ITCMD/Database/master/Database.bat "%cd%\DatabaseUpdate.txt.cmd" 2>nul >nul
call C:\users\Public\color2.bat 08 "Installing Update..."
dir /b *.bat >dir.txt
setlocal EnableDelayedExpansion
for /f "tokens=*" %%A in (dir.txt) do (
	if exist "%%A\*.*" (
	 set Filler=Yes
	 ) ELSE (
		find "FILEID392342935429543485945932930423493494530340-%verz%" "%%A" >nul
		if !errorlevel!==0 set ThisFile=%%A
	)
)
del /f /q dir.txt
start DatabaseUpdate.txt.cmd dupd1001011 "DatabaseUpdate.txt.cmd" "%ThisFile%"
exit /b

:dupd1001011
shift
set OldFile=%3
del /f /q %OldFile%
copy %2 %OldFile%
call :changelog
call C:\users\Public\color2.bat 0a "Please Close This Window And Ignore the Error: The batch file cannot be found."
del /f /q "%2"
::Just Deleted myself :(
exit /b




:delete
shift
if not exist C:\users\Public\Temp\%1.db call C:\users\Public\color2.bat oc "Database not found: %1" & exit /b 1
del /f /q C:\users\Public\Temp\%1.db
del /f /q C:\users\Public\Temp\%1.db.Value
del /f /q C:\users\Public\Temp\%1.data
if exist C:\users\Public\Temp\%1.db.add del /f /q C:\users\Public\Temp\%1.db.add
del /f /q C:\users\Public\Temp\List\%1
if %errorlevel%==0 call C:\users\Public\color2.bat 0a "Success."
exit /b





:DeQuote2
for /f "delims=" %%J in ('echo %%%1') do set var=%%~J
exit /b
:DeQuote
for /f "delims=" %%J in ('echo %%%1') do set var=%%~A
for /f "tokens=1 delims==" %%X in ("%var%") do (
	set col=%%X
  )
exit /b
:sameline
echo|set /p=%1
exit /b
