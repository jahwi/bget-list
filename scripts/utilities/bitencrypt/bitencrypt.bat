@echo off
cd %~dp0"
setlocal ENABLEDELAYEDEXPANSION
color b
cls
::::BgetDescription#Interactive Bitlocker encryption script.
::::BgetAuthor#b00st3d
::::BgetCategory#utilities
::::::::::::::::::::::
::checking for admin::
::::::::::::::::::::::

:checkPrivileges 
NET FILE 1>NUL 2>NUL
if '%errorlevel%' == '0' ( goto gotPrivileges ) else ( goto getPrivileges ) 

:getPrivileges 
if '%1'=='ELEV' (shift & goto gotPrivileges)  
ECHO. 
ECHO **************************************
ECHO Invoking UAC for Privilege Escalation 
ECHO **************************************

setlocal DisableDelayedExpansion
set "batchPath=%~0"
setlocal EnableDelayedExpansion
ECHO Set UAC = CreateObject^("Shell.Application"^) > "%temp%\OEgetPrivileges.vbs" 
ECHO UAC.ShellExecute "!batchPath!", "ELEV", "", "runas", 1 >> "%temp%\OEgetPrivileges.vbs" 
"%temp%\OEgetPrivileges.vbs" 
exit /B 

:gotPrivileges 
::::::::::::::::::::::::::::
:START
::::::::::::::::::::::::::::
setlocal & pushd .

:::::::::::::::::::::::::
::Start the script here::
:::::::::::::::::::::::::

color e
echo +==========================================+
echo + Encrypt your stuff with BitLocker here.  +
echo + All you need is a hard drive to encrypt  +
echo + and windows 7 Ultimate or Enterprise.    +
echo + update: or Windows 10 version above home +
echo +                                          +
echo +                                          +
echo + written by b00st3d                       +
echo +                                          +
echo +==========================================+
timeout -t 6 > nul
cls
:location
cls
echo +==========================================+
echo + will this be performed on the            +
echo + local computer or a remote computer?     +
echo +                                          +
echo +                                          +
echo + press 1 for local computer               +
echo + press 2 for remote computer              +
echo +                                          +
echo +==========================================+
set /p location=Please make a selection: 
if %location%==1 goto local
if %location%==2 goto remote
echo.
echo you have made an invalid selection...
timeout -t 3 > nul
goto location

::this is simple set the computername to local and send to the volume prompt

:local
cls
set compname=%computername%
goto next

::A little more work here. Ask the user for a computername, ping the computer and 
::tell the user is the computer is online.  If not its an error or the computer is down
::echo either way they have some more work to do.  Otherwise simple selection if the
::computer name pings. 

:remote
cls
set /p compname=Please enter the computername of the remote computer: 
set state=up
echo.
ping %compname% -n 1 | find /i "bytes" || set state=down
cls
if %state%==down goto down
if %state%==up goto up
:down
    echo %compname% is not responding to ping is the computername correct?
    echo.
    set /p correct=Y or N: 
        if %correct%==N goto remote
        if %correct%==n goto remote
        if %correct%==y (
            echo.
            echo fix your network!
            ping localhost -n 3 > nul
            goto eof
                )
        if %correct%==Y (
            echo.
            echo fix your network!
            ping localhost -n 3 > nul
            goto eof
                )
                
cls
echo you made an invalid selection...start over!
timeout -t 3 > nul
goto remote

:up
    echo %compname% is responding to my ping.
    echo please verify that the computername correct?
    echo.
    set /p correct=Y or N: 
        if %correct%==n goto remote
        if %correct%==N goto remote
        if %correct%==y goto next
        if %correct%==Y goto next
        )
cls
echo you made an invalid selection...start over!
timeout -t 3 > nul
goto remote

::find out what volume the user wants to interact with.

:volume
cls
wmic logicaldisk get deviceid, volumename, description
echo.
set /p dl=Please set the volume letter:

:setvolume
set dl=%dl:~,1%
set volume=%dl%:
cls
echo you have selected drive %volume% 
echo is this correct?
echo.
set /p choice=Press Y or N: 
if %choice%==y (
    if %userselection%==1 goto encrypt
    if %userselection%==2 goto decrypt
    if %userselection%==3 goto status
                    )
if %choice%==Y (
    if %userselection%==1 goto encrypt
    if %userselection%==2 goto decrypt
    if %userselection%==3 goto status
                )
if %choice%==n goto volume
if %choice%==N goto volume
echo.
echo you have made an invalid selection...
timeout -t 3 > nul
goto volume

:next
cls
echo +==========================================+
echo + press 1 to encrypt                       +
echo + press 2 to decrypt                       +
echo + press 3 to check status                  +
echo +                                          +
echo +==========================================+
set /p userselection=Please make a selection: 
if %userselection%==1 goto volume
if %userselection%==2 goto volume
if %userselection%==3 goto check2
echo.
echo you have made an invalid selection...
timeout -t 3 > nul
goto next

::now we start the fun part: encryption

:encrypt
cls
manage-bde -cn %compname% -on %volume% -pw
timeout -t 3 > nul
cls
goto status

:decrypt
cls
manage-bde -cn %compname% -off %volume%
timeout -t 3 > nul
cls
goto status

:check2
cls
echo +==========================================+
echo + I just need some basic info to check     +
echo + the status of your BitLocker Drive       +
echo +                                          +
echo + 1.) Single drive                         +
echo + 2.) Show all drives                      +
echo +==========================================+
set /p check2=Please make a selection: 
    if %check2%==1 goto volume
    if %check2%==2 goto check3
    
:check3
cls
set volume=
goto statusall

:status
cls
echo +==========================================+
echo + Checking status.  Do you want this to be +
echo + manual or automatic?                     +
echo +                                          +
echo + 1.) manual                               +
echo + 2.) automatic                            +
echo +                                          +
echo + 3.) exit                                 +
echo +==========================================+
set /p selection=please make a selection: 
    if %selection%==1 goto manual
    if %selection%==2 goto automatic
    if %selection%==3 goto eof
echo you have made an invalid selection...
timeout -t 3 > nul
goto status
:statusall
cls
echo +==========================================+
echo + Checking status.  Do you want this to be +
echo + manual or automatic?                     +
echo +                                          +
echo + 1.) manual                               +
echo + 2.) automatic                            +
echo +                                          +
echo + 3.) exit                                 +
echo +==========================================+
set /p selection=please make a selection: 
    if %selection%==1 goto manual
    if %selection%==2 goto automaticall
    if %selection%==3 goto eof
echo you have made an invalid selection...
timeout -t 3 > nul
goto statusall

:manual
cls
manage-bde -status -cn %compname% %volume%
echo.
pause
goto status

:automatic
cls
echo PRESS CTRL+C TO EXIT
echo.
echo.
set encrypted=yes
manage-bde -status -cn %compname% %volume%
manage-bde -status -cn %compname% %volume% | find /i "100%" || set encrypted=no
if %encrypted%==yes goto wait
timeout -t 2 > nul
goto automatic
:automaticall
cls
echo PRESS CTRL+C TO EXIT
echo.
echo.
manage-bde -status -cn %compname% %volume%
timeout -t 10 > nul
goto automatic

:wait
echo.
echo your drive is 100% encrypted.
echo.
echo press any key to exit.
pause > nul

:eof
cls
echo          _       _
echo         /_\     /_\
echo        // \\   // \\
echo       //   \\_//   \\
echo      //  _  \_/  _  \\
echo      \\ :_:     :_: //
echo       \\    / \    //
echo        \\  // \\  //
echo         \\//   \\//
echo          \/     \/
timeout -t 3 > nul
exit