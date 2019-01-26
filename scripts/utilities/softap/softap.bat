::::BgetDescription#Create a soft wireless access point.  You should have a wired and wireless connection to provide internet.
::::BgetAuthor#b00st3d
::::BgetCategory#utilities
::::Bgettags#network;hotspot
@echo off
title SoftAP
CLS 
:checkPrivileges 
NET FILE 1>NUL 2>NUL
if '%errorlevel%' == '0' ( goto gotPrivileges ) else ( goto getPrivileges ) 

:getPrivileges 
if '%1'=='ELEV' (shift & goto gotPrivileges)  
ECHO. 
ECHO +=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=+
ECHO + This script requires admin rights in order to create access points.       +
ECHO +=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=+

setlocal DisableDelayedExpansion
set "batchPath=%~0"
setlocal EnableDelayedExpansion
ECHO Set UAC = CreateObject^("Shell.Application"^) > "%temp%\OEgetPrivileges.vbs" 
ECHO UAC.ShellExecute "!batchPath!", "ELEV", "", "runas", 1 >> "%temp%\OEgetPrivileges.vbs" 
"%temp%\OEgetPrivileges.vbs" 
exit /B 

:gotPrivileges 
::::::::::::::::::::::::::::
:run
::::::::::::::::::::::::::::
setlocal & pushd .
:start
cls
echo +=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=+
call :animate
echo +                                 +
call :animate
echo + 1.) Create a new AP             +
call :animate
echo +                                 +
call :animate
echo + 2.) Stop an existing AP         +
call :animate
echo +                                 +
call :animate
echo + 3.) Show current AP Stats       +
call :animate
echo +=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=+
call :animate
echo + 4.) HELP                        +
call :animate
echo +                                 +
call :animate
echo + 5.) EXIT                        +
call :animate
echo +                                 +
call :animate
echo +=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=+
call :animate
Set /p choice=Please make a selection: 
if %choice% == 1 ( goto ap )
if %choice% == 2 ( goto stopAP )
if %choice% == 3 ( goto show )
if %choice% == 4 ( goto help )
if %choice% == 5 ( exit )
echo You have made an invalid selection...
timeout 1 >nul
goto start



:ap

REM Clearing any previous hostednetwork that is still on the machine
echo preparing hosted network...
netsh wlan stop hostednetwork >nul
timeout 1 >nul
netsh wlan set hostednetwork mode=disallow >nul
timeout 1 >nul

cls
echo +=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=+
call :animate
echo +SSID:                                            
call :animate
echo +=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=+
call :animate
set /p ssid=Please enter an SSID:
cls 
echo +=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=+
call :animate
echo +SSID: %ssid%                                     
call :animate
echo +=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=+
call :animate
set /p key=Please enter a network key: 
cls
echo +=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=+
call :animate
echo +SSID: %ssid%                                     
call :animate
echo +                                                 
call :animate
echo +Creating your new Access point.  Please wait.    
call :animate
echo +=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=+

netsh wlan set hostednetwork ssid=%ssid% key=%key% keyUsage=persistent mode=allow
timeout 1 >nul
netsh wlan start hostednetwork
timeout 2 >nul
goto setIP

:stopAP
cls
echo +=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=+
call :animate
echo + Stopping your Accesspoint                       
call :animate
echo +=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=+
REM Clearing any previous hostednetwork that is still on the machine
netsh wlan stop hostednetwork >nul
netsh wlan set hostednetwork mode=disallow >nul
goto start

:show
cls
netsh wlan show hostednetwork
pause
goto start

:animate

ping localhost -n 1 > nul
goto :EOF

:help
cls
echo +=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=+
call :animate                                                                 
echo + After creating your access point it may be                                +
call :animate                                                                  
echo + neccessary to make some changes to the virtual                            +
call :animate                                                                   
echo + WiFi Miniport Adapter that was created.                                   +
call :animate                                                                   
echo +                                                                           +
call :animate                                                                   
echo + To do this, after the the ap has been created,                            +
call :animate                                                                    
echo + open your adapter settings.  Find your connection to the internet.        +
call :animate                                
echo +                                                                           +
call :animate
echo + 1.) Right click select properties.                                        +
call :animate
echo + 2.) Click the 'Sharing' tab.                                              +
call :animate
echo + 3.) Check Allow other netwrok users to connect through this...            +
call :animate
echo + 4.) Select your new connection (It should show your SSID in it)           +
call :animate
echo + 5.) Click ok                                                              +
call :animate
echo +                                                                           +
call :animate
echo + When finished, press any key to continue                                  +
call :animate
echo +=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=+
pause >nul
cls
echo +=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=+
call :animate
echo + 1.) Right click the new Connection and select prperties                   +
call :animate
echo + 2.) Select Internet Protocol Version 4(TCP/IPv4)                          +
call :animate
echo + 3.) Click Properties                                                      +
call :animate
echo + 4.) Click use the following IP address radio button                       +
call :animate
echo + 5.) Enter an IP address (ie. 10.0.10.1)                                   +
call :animate
echo +         This will be your network. It can be whatever you want.           +
call :animate
echo +                                                                           +
call :animate
echo + 6.) In Subnet Mask enter 255.255.255.0                                    +
call :animate
echo + 7.) Leave Default gateway blank                                           +
call :animate
echo + 8.) In prefered DNS enter 8.8.8.8                                         +
call :animate
echo + 9.) In Alternate DNS enter 8.8.4.4                                        +
call :animate
echo +          (You can use any DNS you want these are easy)                    +
call :animate
echo + 10.) Click OK and Close.                                                  +
call :animate
echo +                                                                           +
call :animate
echo + You should now be able to access the internet through your computer.      +
call :animate
echo +                                                                           +
call :animate
echo + When finished, press any key to retrun to the menu                        +
call :animate
echo +=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=+
pause >nul
goto start


:setIP

REM FIND THE NAME OF THE INTERFACE THAT IS HOSTING WIRELESS CONNECTION

REM Find MAC address of hostednetwork (bssid)

for /f "tokens=3 delims= " %%A in ('netsh wlan show hostednetwork ^| FIND "BSSID"') DO (
set mac=%%A
)

REM replace all the : with - so it matches up to the ipconfig output
REM Next determin the line number of the MAC so we can get the interface name above it.

set mac=%mac::=-%
for /f "tokens=1 delims=[" %%A in ('ipconfig/all ^| find /n /i "%mac%"') DO (
set linenbr=%%A
)
set linenbr=%linenbr:~0,2%
set /A linenbr=%linenbr% - 4

REM run IPCONFIG with line numbers then parse the output for the line number

for /f "tokens=* delims=:" %%A in ('ipconfig/all ^| find /n " " ^| find "[%linenbr%]"') DO (
for /f "tokens=* delims=]" %%B in ("%%A") DO set apName=%%B
)

REM Parse the line containing the interface name

setlocal enabledelayedexpansion
REM set linenbr=[%linenbr%]
set "find=*adapter "
call set apName=%%apName:!find!=%%
ENDLOCAL & SET name=%apName%

REM this is the network adapter name
set name=%name:~0,-1%


REM locates an available IP Address


:openIP
REM Some defaults for IP address
set /a third=111
set /a fourth=1

REM locate a clear Class C network
echo finding IP
:check1
for /f "tokens=* delims=" %%A in ('ipconfig ^| Find "192.168.%third%.%fourth%"') DO (
	if %%A NEQ "" (

	REM Skip the next available net

	set /a third=%third% + 2
		goto check1
	)
	
)
echo.
echo validating IP range
echo.

REM Check that the network is clear...this isn't required so I'll make it quick

:next
set ipAdd=192.168.%third%
for /f "tokens=* delims=" %%A in ('ipconfig ^| Find "%ipAdd%.%fourth%"') DO (
	if %%A NEQ "" (
	set /a third=%third% + 1
	goto check1

	)
	
)
:final
REM just spot checking here

	set /a fourth=%fourth% + 3
	if %fourth% GEQ 255  (goto finish)
	goto next

:finish
REM This is the IP Address that we'll assign to the network.
set ipAdd=192.168.%third%.1
echo.
echo %ipAdd% set for your network

REM Actually setting the IP address to the network here
NETSH interface ip set address name="%name%" static %ipAdd% 255.255.255.0 %ipAdd% 1
timeout 2 >nul
NETSH interface ip set dns name="%name%" static 8.8.8.8
NETSH interface ip add dns name="%name%" 8.8.4.4 index=2
pause
cls
goto start






















