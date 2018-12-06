title Portal CMD V2
color 0f
setlocal enableDelayedExpansion
mode 32,24
@echo off

::::BgetDescription#Batch implementation of the Valve game of the same name.
::::BgetAuthor#RetroKitty
::::BgetCategory#game
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::PORTAL CMD V2                                          ::
::Created by Domenic "RetroKitty" Viczian :3             ::
::Version 2.1.0                                          ::
::Last Updated September 23, 2015                        ::
::                                                       ::
::This is a recreation of the original Portal CMD,       ::
::which was based on the game by Valve Software. In this ::
::new version, all of the code has been completely       ::
::rewritten to lower game size and smooth out gameplay.  ::
::                                                       ::
::Note:                                                  ::
::                                                   ::
::R L U D                                                ::
::                                                       ::
::Version History                                        ::
::1.0.0 (Date Unknown)                                   ::
:: -Basic game physics worked                            ::
::1.2.5 (Date Unknown)                                   ::
:: -Most of the physics rewritten                        ::
:: -Fancy intro added                                    ::
::2.0.0 (2015-07-05)                                     ::
:: -Restarted game, starting from scratch                ::
:: -Completely rewrote all code                          ::
:: -Purely functional with test room                     ::
::2.1.0 (2015-09-23)                                     ::
:: -Redid screen code                                    ::
:: -Revised a bit of code                                ::
:: -New test level                                       ::
::2.2.5 (2015-09-24)                                     ::
:: -Added 2 levels for a total of 3                      ::
:: -Fixed exit being a portal                            ::
:: -Added exit sequence and game finish screen           ::
:: -Fixed teleporting when destination portal not placed ::
::                                                       ::
::Personal Notes                                         ::
:: -Portal firing script should be a for loop            ::
:: -Shooting/Portal logic can probably be improved       ::
:: -Need proper death logic (as opposed to just resetting::
::  the level each time)                                 ::
:: -Fix teleportation when destination portal hasn't been::
::  placed                                               ::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:intro
 cls
 echo          __    _
 echo         /  \  / \
 echo        ^|    ^|/ _ \
 echo         \__//  \\_)
 echo            /    \
 echo           ^| ^|\   \    _
 echo          / /  \   \  / )
 echo         (_/    ^|   \/ /
 echo                ^| ^|\__/
 echo                 \ \
 echo                  \_)
 echo                __
 echo              _^|  ^|_
 echo              \    /
 echo               \  /
 echo                \/
 echo           ____________
 echo   ...--"""            """--...
 echo  (         PORTAL CMD         )
 echo   """--...____________...--"""
 echo/
 echo      Created By: RetroKitty
 echo        Version Beta 2.2.5
 pause >nul

:setup
 cls
 echo Resizing screen...
 mode 29,27
 echo Setting startup variables...
 set level=1
 set win=0
:setbase
 cls
 echo Setting base variables...
 set char=
 set buffer= 
 set p1x=0
 set p1y=0
 set p2x=0
 set p2y=0
:setscreen
 echo Setting level variables...
 call :clearlevel
 call :level%level%
 goto screen

:screen
 cls
 if %win%==0 set x%px%y%py%=%char%
 set x%p1x%y%p1y%=O
 set x%p2x%y%p2y%=0
 if "%buffer%"=="°" goto :setbase
 if "%buffer%"=="@" set win=1
 if %win%==7 goto levelup
 echo.
 echo.
 echo.
 echo.     %x1y1%%x2y1%%x3y1%%x4y1%%x5y1%%x6y1%%x7y1%%x8y1%%x9y1%%x10y1%%x11y1%%x12y1%%x13y1%%x14y1%%x15y1%%x16y1%%x17y1%%x18y1%%x19y1%
 echo.     %x1y2%%x2y2%%x3y2%%x4y2%%x5y2%%x6y2%%x7y2%%x8y2%%x9y2%%x10y2%%x11y2%%x12y2%%x13y2%%x14y2%%x15y2%%x16y2%%x17y2%%x18y2%%x19y2%
 echo.     %x1y3%%x2y3%%x3y3%%x4y3%%x5y3%%x6y3%%x7y3%%x8y3%%x9y3%%x10y3%%x11y3%%x12y3%%x13y3%%x14y3%%x15y3%%x16y3%%x17y3%%x18y3%%x19y3%
 echo.     %x1y4%%x2y4%%x3y4%%x4y4%%x5y4%%x6y4%%x7y4%%x8y4%%x9y4%%x10y4%%x11y4%%x12y4%%x13y4%%x14y4%%x15y4%%x16y4%%x17y4%%x18y4%%x19y4%
 echo.     %x1y5%%x2y5%%x3y5%%x4y5%%x5y5%%x6y5%%x7y5%%x8y5%%x9y5%%x10y5%%x11y5%%x12y5%%x13y5%%x14y5%%x15y5%%x16y5%%x17y5%%x18y5%%x19y5%
 echo.     %x1y6%%x2y6%%x3y6%%x4y6%%x5y6%%x6y6%%x7y6%%x8y6%%x9y6%%x10y6%%x11y6%%x12y6%%x13y6%%x14y6%%x15y6%%x16y6%%x17y6%%x18y6%%x19y6%
 echo.     %x1y7%%x2y7%%x3y7%%x4y7%%x5y7%%x6y7%%x7y7%%x8y7%%x9y7%%x10y7%%x11y7%%x12y7%%x13y7%%x14y7%%x15y7%%x16y7%%x17y7%%x18y7%%x19y7%
 echo.     %x1y8%%x2y8%%x3y8%%x4y8%%x5y8%%x6y8%%x7y8%%x8y8%%x9y8%%x10y8%%x11y8%%x12y8%%x13y8%%x14y8%%x15y8%%x16y8%%x17y8%%x18y8%%x19y8%
 echo.     %x1y9%%x2y9%%x3y9%%x4y9%%x5y9%%x6y9%%x7y9%%x8y9%%x9y9%%x10y9%%x11y9%%x12y9%%x13y9%%x14y9%%x15y9%%x16y9%%x17y9%%x18y9%%x19y9%
 echo.     %x1y10%%x2y10%%x3y10%%x4y10%%x5y10%%x6y10%%x7y10%%x8y10%%x9y10%%x10y10%%x11y10%%x12y10%%x13y10%%x14y10%%x15y10%%x16y10%%x17y10%%x18y10%%x19y10%
 echo.     %x1y11%%x2y11%%x3y11%%x4y11%%x5y11%%x6y11%%x7y11%%x8y11%%x9y11%%x10y11%%x11y11%%x12y11%%x13y11%%x14y11%%x15y11%%x16y11%%x17y11%%x18y11%%x19y11%
 echo.     %x1y12%%x2y12%%x3y12%%x4y12%%x5y12%%x6y12%%x7y12%%x8y12%%x9y12%%x10y12%%x11y12%%x12y12%%x13y12%%x14y12%%x15y12%%x16y12%%x17y12%%x18y12%%x19y12%
 echo.     %x1y13%%x2y13%%x3y13%%x4y13%%x5y13%%x6y13%%x7y13%%x8y13%%x9y13%%x10y13%%x11y13%%x12y13%%x13y13%%x14y13%%x15y13%%x16y13%%x17y13%%x18y13%%x19y13%
 echo.     %x1y14%%x2y14%%x3y14%%x4y14%%x5y14%%x6y14%%x7y14%%x8y14%%x9y14%%x10y14%%x11y14%%x12y14%%x13y14%%x14y14%%x15y14%%x16y14%%x17y14%%x18y14%%x19y14%
 echo.     %x1y15%%x2y15%%x3y15%%x4y15%%x5y15%%x6y15%%x7y15%%x8y15%%x9y15%%x10y15%%x11y15%%x12y15%%x13y15%%x14y15%%x15y15%%x16y15%%x17y15%%x18y15%%x19y15%
 echo.     %x1y16%%x2y16%%x3y16%%x4y16%%x5y16%%x6y16%%x7y16%%x8y16%%x9y16%%x10y16%%x11y16%%x12y16%%x13y16%%x14y16%%x15y16%%x16y16%%x17y16%%x18y16%%x19y16%
 echo.     %x1y17%%x2y17%%x3y17%%x4y17%%x5y17%%x6y17%%x7y17%%x8y17%%x9y17%%x10y17%%x11y17%%x12y17%%x13y17%%x14y17%%x15y17%%x16y17%%x17y17%%x18y17%%x19y17%
 echo.     %x1y18%%x2y18%%x3y18%%x4y18%%x5y18%%x6y18%%x7y18%%x8y18%%x9y18%%x10y18%%x11y18%%x12y18%%x13y18%%x14y18%%x15y18%%x16y18%%x17y18%%x18y18%%x19y18%
 echo.     %x1y19%%x2y19%%x3y19%%x4y19%%x5y19%%x6y19%%x7y19%%x8y19%%x9y19%%x10y19%%x11y19%%x12y19%%x13y19%%x14y19%%x15y19%%x16y19%%x17y19%%x18y19%%x19y19%
 echo.     %x1y20%%x2y20%%x3y20%%x4y20%%x5y20%%x6y20%%x7y20%%x8y20%%x9y20%%x10y20%%x11y20%%x12y20%%x13y20%%x14y20%%x15y20%%x16y20%%x17y20%%x18y20%%x19y20%
 echo.     %x1y21%%x2y21%%x3y21%%x4y21%%x5y21%%x6y21%%x7y21%%x8y21%%x9y21%%x10y21%%x11y21%%x12y21%%x13y21%%x14y21%%x15y21%%x16y21%%x17y21%%x18y21%%x19y21%
 if not %win%==0 goto win
 choice /c:wasdior >nul
 if "%errorlevel%"=="1" call :moveup
 if "%errorlevel%"=="2" call :moveleft
 if "%errorlevel%"=="3" call :movedown
 if "%errorlevel%"=="4" call :moveright
 if "%errorlevel%"=="5" call :shoot 1
 if "%errorlevel%"=="6" call :shoot 2
 if "%errorlevel%"=="7" goto setbase
 goto screen

:moveup
 if not "%char%"=="" (
  set char=
  exit /b
 )
 set /a check=%py%-1
 if "%check%"=="0" exit /b
 if "!x%px%y%check%!"=="Û" exit /b
 if "!x%px%y%check%!"=="O" (if %p2x%==0 exit /b)
 if "!x%px%y%check%!"=="0" (if %p1x%==0 exit /b)
 set x%px%y%py%=%buffer%
 set buffer=!x%px%y%check%!
 set py=%check%
 if "%buffer%"=="O" call :outportal 2
 if "%buffer%"=="0" call :outportal 1
 exit /b

:moveleft
 if not "%char%"=="" (
  set char=
  exit /b
 )
 set /a check=%px%-1
 if "%check%"=="0" exit /b
 if "!x%check%y%py%!"=="Û" exit /b
 if "!x%check%y%py%!"=="O" (if %p2x%==0 exit /b)
 if "!x%check%y%py%!"=="0" (if %p1x%==0 exit /b)
 set x%px%y%py%=%buffer%
 set buffer=!x%check%y%py%!
 set px=%check%
 if "%buffer%"=="O" call :outportal 2
 if "%buffer%"=="0" call :outportal 1
 exit /b

:movedown
 if not "%char%"=="" (
  set char=
  exit /b
 )
 set /a check=%py%+1
 if "%check%"=="22" exit /b
 if "!x%px%y%check%!"=="Û" exit /b
 if "!x%px%y%check%!"=="O" (if %p2x%==0 exit /b)
 if "!x%px%y%check%!"=="0" (if %p1x%==0 exit /b)
 set x%px%y%py%=%buffer%
 set buffer=!x%px%y%check%!
 set py=%check%
 if "%buffer%"=="O" call :outportal 2
 if "%buffer%"=="0" call :outportal 1
 exit /b

:moveright
 if not "%char%"=="" (
  set char=
  exit /b
 )
 set /a check=%px%+1
 if "%check%"=="20" exit /b
 if "!x%check%y%py%!"=="Û" exit /b
 if "!x%check%y%py%!"=="O" (if %p2x%==0 exit /b)
 if "!x%check%y%py%!"=="0" (if %p1x%==0 exit /b)
 set x%px%y%py%=%buffer%
 set buffer=!x%check%y%py%!
 set px=%check%
 if "%buffer%"=="O" call :outportal 2
 if "%buffer%"=="0" call :outportal 1
 exit /b

:outportal
 if "!p%~1d!"=="1" (
  set /a check=!p%~1y!-1
  set char=
  set dir=1
 )
 if "!p%~1d!"=="2" (
  set /a check=!p%~1x!+1
  set char=
  set dir=2
 )
 if "!p%~1d!"=="3" (
  set /a check=!p%~1y!+1
  set char=
  set dir=1
 )
 if "!p%~1d!"=="4" (
  set /a check=!p%~1x!-1
  set char=
  set dir=2
 )
 if "%dir%"=="1" (
  set px=!p%~1x!
  set py=%check%
 )
 if "%dir%"=="2" (
  set px=%check%
  set py=!p%~1y!
 )
 set buffer=!x%px%y%py%!
 exit /b

:shoot
 set portal=%~1
 if "%char%"=="" call :shootv 21 -1 1
 if "%char%"=="" call :shooth 1 1 2
 if "%char%"=="" call :shootv 1 1 3
 if "%char%"=="" call :shooth 19 -1 4
 exit /b

:shootv
 set a=%~1
 set tempv=0
:shootvloop
 if "!x%px%y%a%!"=="Û" set tempv=%a%
 if "!x%px%y%a%!"=="O" set tempv=0
 if "!x%px%y%a%!"=="0" set tempv=0
 set /a a+=%~2
 if "%a%"=="%py%" goto :shootvend
 goto shootvloop
:shootvend
 set x!p%portal%x!y!p%portal%y!=Û
 set p%portal%x=%px%
 set p%portal%y=%tempv%
 set p%portal%d=%~3
 exit /b

:shooth
 set a=%~1
 set tempv=0
:shoothloop
 if "!x%a%y%py%!"=="Û" set tempv=%a%
 if "!x%a%y%py%!"=="O" set tempv=0
 if "!x%a%y%py%!"=="0" set tempv=0
 set /a a+=%~2
 if "%a%"=="%px%" goto :shoothend
 goto shoothloop
:shoothend
 set x!p%portal%x!y!p%portal%y!=Û
 set p%portal%x=%tempv%
 set p%portal%y=%py%
 set p%portal%d=%~3
 exit /b

:win
 if %win%==6 (
  set x%px%y%py%= 
  set win=7
  ping localhost -n 1 >nul
 )
 if %win%==5 (
  set x%px%y%py%=.
  set win=6
  ping localhost -n 1 >nul
 )
 if %win%==4 (
  set x%px%y%py%=,
  set win=5
  ping localhost -n 1 >nul
 )
 if %win%==3 (
  set x%px%y%py%=o
  set win=4
  ping localhost -n 1 >nul
 )
 if %win%==2 (
  set x%px%y%py%=O
  set win=3
  ping localhost -n 1 >nul
 )
 if %win%==1 (
  set buffer=0
  set x%px%y%py%=0
  set win=2
  ping localhost -n 1 >nul
 )
 goto screen

:levelup
 cls
 set win=0
 set /a level+=1
 if %level%==4 goto gamewin
 goto setbase

:gamewin
 mode 28,17
 echo.
 echo.      Congratulations^^!
 echo. You've beaten every level^^!
 echo.       Have a trophy^^!
 echo.
 echo.         __________
 echo.      __^|    O_    ^|__
 echo.     / _^|    /\_   ^|_ \
 echo.    ^| ^| ^|     /    ^| ^| ^|
 echo.     \ \_\   __   /_/ /
 echo.      \___\ (__) /___/
 echo.           \    /
 echo.            \__/
 echo.             ^|^|
 echo.         ____^|^|____
 echo.        ^|__________^|
 pause >nul

:clearlevel
 for /l %%a in (1,1,21) do (
  for /l %%b in (1,1,19) do (
   set x%%by%%a= 
  )
 )
 exit /b

::WALL - Û
::HOLE - °

:grid
 set px=10
 set py=19
 for /l %%a in (1,1,19) do (set x%%ay1=Û)
 for /l %%a in (1,1,19) do (set x%%ay5=Û)
 for /l %%a in (1,1,19) do (set x%%ay9=Û)
 for /l %%a in (1,1,19) do (set x%%ay13=Û)
 for /l %%a in (1,1,19) do (set x%%ay17=Û)
 for /l %%a in (1,1,19) do (set x%%ay21=Û)
 for /l %%a in (1,1,21) do (set x1y%%a=Û)
 for /l %%a in (1,1,21) do (set x7y%%a=Û)
 for /l %%a in (1,1,21) do (set x13y%%a=Û)
 for /l %%a in (1,1,21) do (set x19y%%a=Û)
 exit /b

:level1
 set px=10
 set py=15
 for /l %%a in (14,1,18) do (for /l %%b in (5,1,9) do (set x%%ay%%b=°))
 for /l %%a in (2,1,6) do (for /l %%b in (10,1,16) do (set x%%ay%%b=°))
 for /l %%a in (8,1,13) do (for /l %%b in (18,1,20) do (set x%%ay%%b=°))
 for /l %%a in (2,1,18) do (set x%%ay9=°)
 for /l %%a in (2,1,18) do (set x%%ay17=°)
 for /l %%a in (9,1,20) do (set x7y%%a=°)
 for /l %%a in (2,1,12) do (set x13y%%a=°)
 for /l %%a in (1,1,19) do (set x%%ay1=Û)
 for /l %%a in (1,1,13) do (set x%%ay5=Û)
 for /l %%a in (7,1,19) do (set x%%ay13=Û)
 for /l %%a in (7,1,13) do (set x%%ay17=Û)
 for /l %%a in (1,1,19) do (set x%%ay21=Û)
 for /l %%a in (1,1,21) do (set x1y%%a=Û)
 for /l %%a in (1,1,21) do (set x19y%%a=Û)
 set x7y9=Û
 set x13y9=Û
 set x10y1=@
 exit /b

:level2
 set px=4
 set py=19
 for /l %%a in (2,1,7) do (for /l %%b in (2,1,4) do (set x%%ay%%b=°))
 for /l %%a in (8,1,12) do (for /l %%b in (6,1,9) do (set x%%ay%%b=°))
 for /l %%a in (8,1,12) do (for /l %%b in (14,1,17) do (set x%%ay%%b=°))
 for /l %%a in (2,1,18) do (set x%%ay5=°)
 for /l %%a in (2,1,18) do (set x%%ay13=°)
 for /l %%a in (2,1,16) do (set x7y%%a=°)
 for /l %%a in (6,1,20) do (set x13y%%a=°)
 for /l %%a in (1,1,19) do (set x%%ay1=Û)
 for /l %%a in (7,1,13) do (set x%%ay5=Û)
 for /l %%a in (13,1,19) do (set x%%ay9=Û)
 for /l %%a in (2,1,7) do (set x%%ay17=Û)
 for /l %%a in (13,1,19) do (set x%%ay17=Û)
 for /l %%a in (1,1,19) do (set x%%ay21=Û)
 for /l %%a in (1,1,21) do (set x1y%%a=Û)
 for /l %%a in (9,1,13) do (set x7y%%a=Û)
 for /l %%a in (17,1,21) do (set x7y%%a=Û)
 for /l %%a in (9,1,13) do (set x13y%%a=Û)
 for /l %%a in (1,1,21) do (set x19y%%a=Û)
 set x10y5=°
 set x7y11=°
 set x13y11=°
 set x4y17=°
 set x4y13=Û
 set x10y13=Û
 set x16y21=@
 exit /b

:level3
 set px=10
 set py=11
 for /l %%a in (17,1,18) do (for /l %%b in (6,1,8) do (set x%%ay%%b=°))
 for /l %%a in (8,1,12) do (for /l %%b in (17,1,20) do (set x%%ay%%b=Û))
 for /l %%a in (2,1,6) do (set x%%ay2=°)
 for /l %%a in (2,1,12) do (set x%%ay5=°)
 for /l %%a in (2,1,12) do (set x%%ay9=°)
 for /l %%a in (2,1,18) do (set x%%ay13=°)
 for /l %%a in (2,1,6) do (set x%%ay16=°)
 for /l %%a in (6,1,8) do (set x7y%%a=°)
 for /l %%a in (2,1,4) do (set x13y%%a=°)
 for /l %%a in (1,1,19) do (set x%%ay1=Û)
 for /l %%a in (13,1,19) do (set x%%ay5=Û)
 for /l %%a in (13,1,19) do (set x%%ay9=Û)
 for /l %%a in (7,1,13) do (set x%%ay13=Û)
 for /l %%a in (1,1,19) do (set x%%ay17=Û)
 for /l %%a in (1,1,19) do (set x%%ay21=Û)
 for /l %%a in (1,1,21) do (set x1y%%a=Û)
 for /l %%a in (2,1,5) do (set x7y%%a=Û)
 for /l %%a in (9,1,21) do (set x7y%%a=Û)
 for /l %%a in (9,1,21) do (set x13y%%a=Û)
 for /l %%a in (1,1,21) do (set x19y%%a=Û)
 for /l %%a in (7,1,13) do (set x%%ay19=°)
 set x7y3=°
 set x16y9=°
 set x7y11=°
 set x4y17=°
 set x16y17=°
 set x13y3=Û
 set x10y5=Û
 set x13y7=Û
 set x4y9=Û
 set x10y9=Û
 set x4y13=Û
 set x16y13=Û
 set x7y15= 
 set x10y17=@
 exit /b