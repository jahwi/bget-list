@echo off
setlocal EnableDelayedExpansion

rem set/PBig: Input and output of bigger characters
rem Antonio Perez Ayala

::::BgetDescription#Display big text without altering fonts.
::::BgetAuthor#Aacini
::::BgetCategory#library
::::Bgettags#font;enlarge;large
call :set/PBigInit
echo/
call :set/PBig "THIS IS A TEST"
call :set/PBig name="ENTER YOUR NAME; "
echo Name read: "%name%"
goto :EOF



rem This is the main set/PBig I/O subroutine

:set/PBig [var=]"msg"

if "%~2" equ "" (set "var=" & set "msg=%~1") else set "var=%~1" & set "msg=%~2"

rem Assemble and show the msg "prompt"
for /L %%i in (1,1,%vSize%) do set "line[%%i]="
for /L %%j in (0,1,%cols%) do for /F "delims= eol=" %%c in ("!msg:~%%j,1!") do (
   for /L %%i in (1,1,%vSize%) do set "line[%%i]=!line[%%i]!!char[%%c%%i]!"
)
for /L %%i in (1,1,%vSizeM1%) do echo !line[%%i]!
set /P "=.%BS%!line[%vSize%]!" < NUL
if not defined var goto endSet/PBig

rem Start reading loop
set "input="
set "i=0"

:nextKey
   set "key="
   for /F "delims=" %%a in ('xcopy /W _ _ 2^>NUL') do if not defined key set "key=%%a"

   rem If key is CR: terminate input
   if "!key:~-1!" equ "!CR!" goto endRead

   rem If key is BS: delete last char, if any
   set "key=!key:~-1!"
   if "!key!" equ "%BS%" (
      if %i% gtr 0 (
         for /F %%s in ("!hSize[%input:~-1%]!") do (
            for /L %%i in (1,1,%vSize%) do set "line[%%i]=!line[%%i]:~0,-%%s!"
            set "last=!SPs:~0,%%s!!BSs:~0,%%s!"
         )
         set "input=%input:~0,-1%"
         set /A i-=1
         goto refresh
      )
      goto nextKey
   )

   rem Insert here any filter on the key
   if "!charSet:%key%=!" equ "%charSet%" goto nextKey

   rem Else: accept the key
   for /F "delims= eol=" %%c in ("!key!") do (
      for /L %%i in (1,1,%vSize%) do set "line[%%i]=!line[%%i]!!char[%%c%%i]!"
   )
   set "input=%input%%key%"
   set /A i+=1
   set "last="

   :refresh
   echo/
   echo %TAB%%BSs%
   for /L %%i in (1,1,%vSizeM1%) do echo !line[%%i]!%last%
   set /P "=.%BS%!line[%vSize%]!%last%" < NUL

goto nextKey

:endRead
set "%var%=%input%"

:endSet/PBig
echo/
echo/
exit /B


rem Definition and initialization of variables
rem This subroutine requires an active "setlocal EnableDelayedExpansion" scope

:set/PBigInit

set /A "vSize=3, vSizeM1=vSize-1"

set "size1[0]=1 I"
set "size1[1]=³Â"
set "size1[2]=³³"
set "size1[3]=³Á"

set "size2[0]=. "," ";" 3 7 C E F L"
set "size2[1]=      Ä¿Ä¿ÚÄÚÄÚÄ³ "
set "size2[2]=     .Ä´ ³³ ÃÄÃÄ³ "
set "size2[3]= . , .ÄÙ ³ÀÄÀÄ³ ÀÄ"

set "size3[0]= 0  2  4  5  6  8  9  A  B  D  G  H  J  K  N  O  P  Q  R  S  T  U  V  W  X  Y  Z "
set "size3[1]=ÚÄ¿ Ä¿³ ³ÚÄ ÚÄ ÚÄ¿ÚÄ¿ÚÄ¿ÚÄoÚÄoÚÄ ³ ³  ³³ /Ú ³ÚÄ¿ÚÄ¿ÚÄ¿ÚÄ¿ÚÄ ÄÂÄ³ ³      \ /\ /îî/"
set "size3[2]=³ ³ÚÄÙÀÄ´ÀÄ¿ÃÄ¿ÃÄ´ÀÄ´ÃÄ´ÃÄ´³ ³ÃÄ¿ÃÄ´  ³Ã< ³\³³ ³ÃÄÙ³ ³ÃÄÙÀÄ¿ ³ ³ ³\ /\ / X  Y  / "
set "size3[3]=ÀÄÙÀÄ   ³ ÄÙÀÄÙÀÄÙ ÄÙ³ ³ÀÄ§ÀÄ§ÀÄÙ³ ³ÀÄÙ³ \³ ÙÀÄÙ³  ÀÄ\³ \ ÄÙ ³ ÀÄÙ V  W / \ ³ /__"

set "size4[0]=M"
set "size4[1]=Ú  ¿"
set "size4[2]=³\/³"
set "size4[3]=³  ³"

set "charSet= "
for /L %%i in (1,1,%vSize%) do set "char[ %%i]=   "
set "hSize[ ]=3"
for %%s in (1 2 3 4) do (
   set "j=0"
   for %%c in (!size%%s[0]!) do for %%j in (!j!) do (
      set "charSet=!charSet!%%~c"
      for /L %%i in (1,1,%vSize%) do set "char[%%~c%%i]=!size%%s[%%i]:~%%j,%%s!"
      set "hSize[%%~c]=%%s"
      set /A "j+=%%s"
   )
)

REM SET CHAR[ | MORE

echo > _
for /F %%a in ('copy /Z _ NUL') do set "CR=%%a"
for /F %%a in ('echo prompt $H ^| cmd') do set "BS=%%a"
set "TAB="
for /F "skip=4 delims=pR tokens=2" %%a in ('reg query hkcu\environment /v temp' ) do set "TAB=%%a"
for /F "tokens=2 delims=0" %%a in ('shutdown /? ^| findstr /BC:E') do if not defined TAB set "TAB=%%a"

set i=0
for /F "tokens=2 delims=:" %%a in ('mode') do (
   set /A i+=1
   if !i! equ 2 (
      set /A "cols=(%%a+2)/3, numBSs=2 + (%%a/8+1) * vSize"
   ) else if !i! equ 5 (
      set /A "cp=%%a"
   )
)
set "SPs=    " & set "BSs="
for /L %%i in (1,1,%numBSs%) do set "BSs=!BSs!%BS%"

chcp 850 > NUL
exit /B