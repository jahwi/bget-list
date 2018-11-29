@echo off

rem ReadFormattedLine.bat: Read a line from keyboard with specific format
rem Antonio Perez Ayala

::::BgetDescription#Read a line from keyboard with specific format
::::BgetAuthor#Aacini
::::BgetCategory#library

cls
echo Read a line from keyboard with specific format
echo/
echo call :ReadFormattedLine var="mask"  [/M "message"]  [/P]  [/A^|/W^|/F]
echo/
echo The mask specify valid input characters per position via the following chars:
echo/
echo    #  -  Any digit
echo    _  -  Any letter
echo    +  -  A letter that is converted to uppercase
echo    ?  -  Any letter or digit
echo    @  -  Letter or digit, convert letter to uppercase
echo/
echo The following characters are just displayed/inserted at their positions:
echo    $  /  \  (  )  [  ]  :  ;  ,  .  -  space  letters  digits
echo/
echo Any character in the mask different than previous ones cause an error.
echo/
echo If /P (password) switch is given, input characters are displayed as asterisks.
echo/
echo Normally the input is completed when Enter key is pressed after read at least
echo one character, but the following switches changes this behavior.
echo/
echo    /A (auto):   Input is auto-completed after the last character; Enter key
echo                 is ignored.
echo    /W (whole):  Enter key is accepted at first or last input positions only,
echo                 that is, when input is empty or whole.
echo    /F (fields): Enter key fills the field with spaces and move the cursor to
echo                 the next input field in the line.
echo/
echo To input a whole value terminated by Enter, use /W switch and insert any
echo character at the first position in the mask.
echo/
echo/
echo Some examples:
echo/

setlocal
rem Define the following variable before call the subroutine
set "thisFile=%~F0"
call :ReadFormattedLine test="(_-#-+-#-_)" /M "Enter (_-#-+-#-_): " /W
echo Read: "%test%"
echo/
call :ReadFormattedLine number="#####" /M "Enter a number of up to 5 digits: "
echo Number: "%number%"
echo/
call :ReadFormattedLine pass="########" /M "Enter your password (8 digits): " /P /A
echo Password: "%pass%"
echo/
call :ReadFormattedLine phone="(###)###-####" /M "Enter the telephone with area code: " /W
echo Telephone: "%phone%"
echo/
call :ReadFormattedLine RFC="[++++-######-@@@]" /M "Enter your RFC [4letters-6digits-3alpha]: " /W
echo RFC: "%RFC%"
echo/
call :ReadFormattedLine timeStamp="####/##/##  HH:MM: ##:##" /M "Enter a time-stamp.  YYYY/MM/DD: " /W
echo Time-stamp: "%timeStamp%"
echo/
call :ReadFormattedLine name="+_______________  Last name: +_______________" /M "First name: " /F
echo Name: "%name%"
echo/
echo Enter the list of IP addresses
echo (press Enter in an empty line to end the list)
set i=0
:nextIP
   set /A i+=1
   call :ReadFormattedLine IP[%i%]="###.###.###.###" /M "%i%-  " /W
if defined IP[%i%] goto nextIP
set /A n=i-1
echo/
echo IP addresses read: %n%
set IP[
echo/
echo/
echo End of examples
pause
goto :EOF


:ReadFormattedLine var="mask" [/M "message"] [/P] [/F /W /A]

if "%~2" equ "" echo ERROR: Missing parameters & exit /B 1
setlocal EnableDelayedExpansion

set "var=%~1"
set "mask=%~2"
shift & shift
set "message="
if /I "%1" equ "/M" set "message=%~2" & shift & shift
set "password="
if /I "%1" equ "/P" set "password=1" & shift
set "switch=%~1"

set quote="
set "digit= 0 1 2 3 4 5 6 7 8 9 "
set "letter= A B C D E F G H I J K L M N O P Q R S T U V W X Y Z "
set "alphaNum=%digit%%letter%"
set "fmt=#_+?@"
set "show=$/\()[]:;,.- %digit: =%%letter: =%"
for /F %%a in ('copy /Z "%thisFile%" NUL') do set "CR=%%a"
for /F %%a in ('echo prompt $H ^| cmd') do set "BS=%%a" & set "SP=.%%a "

< NUL (
   set /P "=%message%"
   for /F "eol=| delims=" %%a in ('cmd /U /C echo !mask!^| find /V ""') do (
      if "!fmt:%%a=!" neq "%fmt%" (
         set /P "=Û"
      ) else if "%%a" neq " " (
         set /P "=%%a"
      ) else (
         set /P "=!SP!"
      )
   )
   set /P "=!SP!!CR!%message%"
)
set "input="
set /A i=0, key=0
goto checkFormat

:nextKey
   set "key="
   for /F "delims=" %%a in ('xcopy /W "%thisFile%" "%thisFile%" 2^>NUL') do if not defined key set "key=%%a"
   if "!key:~-1!" neq "!CR!" goto endif
      if /I "%switch%" equ "/A" goto nextKey
      if /I "%switch%" neq "/F" goto check/W
         :nextField
         set "format=!mask:~%i%,1!"
         if "%format%" equ "" goto endRead
         if "!fmt:%format%=!" equ "%fmt%" goto checkFormat
         set /P "=Û" < NUL
         set "input=%input% "
         set /A i+=1
         goto nextField
      :check/W
      if /I "%switch%" neq "/W" goto checkEmpty
         if %i% equ 0 goto endRead
         if "%format%" equ "" goto endRead
         goto nextKey
      :checkEmpty
      if %i% gtr 0 goto endRead
      goto nextKey
   :endif
   set "key=!key:~-1!"
   if "!key!" equ "!BS!" (
      if %i% gtr 0 (
         if "%format%" equ "" (
            set /P "=!SP!!BS!!BS!Û!BS!" < NUL
         ) else (
            set /P "=Û!BS!!BS!Û!BS!" < NUL
         )
         set "input=%input:~0,-1%"
         set /A i-=1
         if !i! equ 0 set key=0
      )
      goto checkFormat
   )
   if "%format%" equ "" goto nextKey
   if "!key!" equ "=" goto nextKey
   if "!key!" equ "!quote!" goto nextKey
   if "%format%" equ "#" ( rem Any digit
      if "!digit: %key% =!" equ "%digit%" goto nextKey
   ) else if "%format%" equ "_" ( rem Any letter
      if "!letter: %key% =!" equ "%letter%" goto nextKey
   ) else if "%format%" equ "+" ( rem Any letter, convert it to uppercase
      if "!letter: %key% =!" equ "%letter%" goto nextKey
      for %%a in (%letter%) do if /I "!key!" equ "%%a" set "key=%%a"
   ) else (
      rem Rest of formats are alphanumeric: ? @
      if "!alphaNum: %key% =!" equ "%alphaNum%" goto nextKey
      if "%format%" equ "@" ( rem Convert letters to uppercase
         for %%a in (%letter%) do if /I "!key!" equ "%%a" set "key=%%a"
      ) else if "%format%" neq "?" echo ERROR: Invalid format in mask: "%format%" & exit /B 2
      )
   )
   if defined password (
      set /P "=*" < NUL
   ) else (
      set /P "=%key%" < NUL
   )
   set "input=%input%%key%"

   :nextFormat
   set /A i+=1
   :checkFormat
   set "format=!mask:~%i%,1!"
   if "%format%" equ "" (
      if /I "%switch%" equ "/A" goto endRead
      if /I "%switch%" equ "/M" goto endRead
      goto nextKey
   )
   if "!show:%format%=!" neq "%show%" (
      if "!key!" equ "!BS!" (
         if "%format%" neq " " (
            set /P "=%format%!BS!!BS!Û!BS!" < NUL
         ) else (
            set /P "=!SP!!BS!!BS!Û!BS!" < NUL
         )
         set "input=%input:~0,-1%"
         set /A i-=1
         if !i! equ 0 set key=0
         goto checkFormat
      ) else (
         if "%format%" neq " " (
            set /P "=%format%" < NUL
         ) else (
            set /P "=!SP!" < NUL
         )
         set "input=%input%%format%"
         goto nextFormat
      )
   )
   if "%input:~-1%!key!" equ " !BS!" (
      set /P "=Û!BS!!BS!" < NUL
      set "input=%input:~0,-1%"
      set /A i-=1
      goto checkFormat
   )

goto nextKey
:endRead
echo/
endlocal & set "%var%=%input%"
exit /B