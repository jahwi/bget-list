@echo off
setlocal EnableDelayedExpansion

rem AnalogClock.bat by Antonio Perez Ayala

rem http://www.dostips.com/forum/viewtopic.php?f=3&t=5028&p=45842#p45842

::::BgetDescription#Another analog clock.
::::BgetAuthor#Aacini
::::BgetCategory#graphics
::::Bgettags#time

rem Size of clock face: use same values in X & Y for square fonts (like bitmap font 8x8)
rem Set to different values for oval face or to adjust aspect ratio; for example, in Lucida Console 8x14 use xres=70, yres=40
set /A xres=70, yres=70

rem Specification parameters
set /A xrad[Hour]=xres/4, yrad[Hour]=yres/4, wide[Hour]=5,  xrad[Min]=xres*3/8, yrad[Min]=yres*3/8, wide[Min]=3,  xrad[Sec]=xres/2-1, yrad[Sec]=yres/2-2, wide[Sec]=1
set "char[Hour]=°" & set "char[Min]=±" & set "char[Sec]=Û"
set /A HourMin=HourMax=MinMin=MinMax=SecMin=SecMax=0

rem Define SIN(x) function; PI=31416
set "SIN=a-a*a/1920*a/312500+a*a/1920*a/15625*a/15625*a/2560000-a*a/1875*a/15360*a/15625*a/15625*a/16000*a/44800000"
set "SIN(x)=(a=(x)%%62832, c=(a>>31|1)*a, a-=(((c-47125)>>31)+1)*(a>>31|1)*62832 - ((c-47125)>>31)*(((c-15709)>>31)+1)*(2*a-(a>>31|1)*31416), %SIN%)"
set "SIN="

rem Initialize the clock face
for /L %%x in (1,1,%xres%) do set "line=!line! "
for /L %%y in (1,1,%yres%) do set "line[%%y]=%line%"
set /A col=(xres-14)/2, line=yres/4
for %%a in (" ²²²  ²²²  ²²²"
            " ² ²  ² ²  ² ²"
            " ²²²  ²²²  ²²²"
            " ² ²  ²    ² ²"
            " ² ²  ²    ² ²") do (
   for /F "tokens=1,2" %%x in ("!col! !line!") do set "c=!line[%%y]:~%%x!" & set "line[%%y]=!line[%%y]:~0,%%x!%%~a!c:~14!"
   set /A line+=1
)
set /A xradius=xrad[Sec], yradius=yrad[Sec]
for /L %%a in (6,6,354) do (
   set "Angle=%%a"
   set /A "x2=xres/2+%SIN(x):x=15708-Angle*31416/180%*xradius/10000, y2=yres/2+%SIN(x):x=Angle*31416/180%*yradius/10000"
   for /F "tokens=1,2" %%x in ("!x2! !y2!") do set "c=!line[%%y]:~%%x!" & set "line[%%y]=!line[%%y]:~0,%%x!.!c:~1!"
)
for /L %%a in (0,30,330) do (
   set "Angle=%%a"
   set /A "x2=xres/2+%SIN(x):x=15708-Angle*31416/180%*xradius/10000, y2=yres/2+%SIN(x):x=Angle*31416/180%*yradius/10000"
   for /F "tokens=1,2" %%x in ("!x2! !y2!") do set "c=!line[%%y]:~%%x!" & set "line[%%y]=!line[%%y]:~0,%%x!Û!c:~1!"
)
set /A xradius+=1, yradius+=1
for /L %%a in (0,90,270) do (
   set "Angle=%%a"
   set /A "x2=xres/2+%SIN(x):x=15708-Angle*31416/180%*xradius/10000, y2=yres/2+%SIN(x):x=Angle*31416/180%*yradius/10000"
   for /F "tokens=1,2" %%x in ("!x2! !y2!") do set "c=!line[%%y]:~%%x!" & set "line[%%y]=!line[%%y]:~0,%%x!Û!c:~1!"
)
for /F "tokens=1-3 delims=:.," %%a in ("%time: =0%") do (
   set /A "angHour=(10%%a%%100*30+270)%%360, Min=1%%b%%100, angMin=(Min*6+270)%%360, lastSec=1%%c%%100, angSec=(lastSec*6+270)%%360,  angHour+=Min/20*10"
)
call :DrawHand Hour
call :DrawHand Min

rem Show the clock and start it
title APA - Analog Clock
color 0B
chcp 850 > NUL
set /A col=xres+1, line=yres+1
mode %col%,%line%
for /L %%# in () do (

   ping -n 2 localhost >NUL
   for /F "tokens=1-3 delims=:.," %%a in ("!time: =0!") do set /A "Hour=10%%a%%100, Min=1%%b%%100, Sec=1%%c%%100"
   if !lastSec! lss 59 (  rem Just advance Sec hand
      set /A "lastSec+=1"
   ) else (  rem Update Min hand

      rem Remove Sec hand from clock face
      for /L %%i in (!SecMin!,1,!SecMax!) do (
         set "line[%%i]=!Sec[%%i]!"
         set "Sec[%%i]="
      )
      set /A "SecMin=SecMax=0"

      set /A "MinMod20=Min%%20"
      if !MinMod20! leq 2 (  rem Update Hour hand, every 20 minutes; 3 times to be sure...

         rem Remove Min hand from clock face
         for /L %%i in (!MinMin!,1,!MinMax!) do (
            set "line[%%i]=!Min[%%i]!"
            set "Min[%%i]="
         )
         set /A "MinMin=MinMax=0"

         set /A "angHour=(Hour*30+Min/20*10+270)%%360"
         call :DrawHand Hour
      )
      set /A "angMin=(Min*6+270)%%360"
      call :DrawHand Min
      set /A "lastSec=0"

   )
   set /A "angSec=(lastSec*6+270)%%360"
   call :DrawHand Sec

   cls & for /L %%i in (1,1,%yres%) do echo/!line[%%i]!

)
never exit /B


:DrawHand Type

set /A xradius=xrad[%1], yradius=yrad[%1], Wide=wide[%1], Wide2=Wide/2, Angle=ang%1
set "Char="
for /L %%i in (1,1,%Wide%) do set "Char=!Char!!char[%1]!"

rem Recover clock face as it was before this hand was shown
for /L %%i in (!%1Min!,1,!%1Max!) do (
   set "line[%%i]=!%1[%%i]!"
   set "%1[%%i]="
)
set /A %1Min=xres, %1Max=0

rem Place this hand in face
set /A "x1=xres/2, y1=yres/2, x2=xres/2+%SIN(x):x=15708-Angle*31416/180%*xradius/10000, y2=yres/2+%SIN(x):x=Angle*31416/180%*yradius/10000, dx=x2-x1, dx=dx*(dx>>31|1), dy=y2-y1, dy=dy*(dy>>31|1)"
if !dy! leq !dx! (set "A=x" & set "B=y") else (set "A=y" & set "B=x" & set /A x1-=Wide2, x2-=Wide2)
for /F "tokens=1,2" %%X in ("!A! !B!") do (
   if !%%X2! lss !%%X1! set /A t=x2, x2=x1, x1=t, t=y2, y2=y1, y1=t
   set /A "yincr=-((%%Y1-%%Y2)>>31|1), d=2*d%%Y-d%%X, Eincr=2*d%%Y, NEincr=2*(d%%Y-d%%X)"
   for /L %%I in (!%%X1!,1,!%%X2!) do (
      if %%X equ x (
         set /A yL=y1-Wide2, yR=y1+Wide2
         for /L %%y in (!yL!,1,!yR!) do (
            if %%y gtr !%1Max! set "%1Max=%%y"
            if %%y lss !%1Min! set "%1Min=%%y"
            if not defined %1[%%y] set "%1[%%y]=!line[%%y]!"
            set "c=!line[%%y]:~%%I!" & set "line[%%y]=!line[%%y]:~0,%%I!%Char:~0,1%!c:~1!"
         )
      ) else (
         if %%I gtr !%1Max! set "%1Max=%%I"
         if %%I lss !%1Min! set "%1Min=%%I"
         if not defined %1[%%I] set "%1[%%I]=!line[%%I]!"
         for /F "tokens=1,2" %%x in ("!x1! !Wide!")  do set "c=!line[%%I]:~%%x!" & set "line[%%I]=!line[%%I]:~0,%%x!!Char:~0,%%y!!c:~%%y!"
      )
      set /A "dP=(d>>31)+1, d+=^!dP*Eincr+dP*NEincr, %%Y1+=dP*yincr"
   )
)
exit /B