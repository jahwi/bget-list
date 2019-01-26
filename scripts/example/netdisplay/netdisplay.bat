@ECHO OFF
REM This script generates a html file showing a view of the active hosts in the local subnet.
::::BgetDescription#This script generates an html file showing a view of the active hosts in the local subnet.
::::BgetAuthor#Annikk
::::BgetCategory#example
::::Bgettags#network
set skipIntro=0
title NetDisplay

REM BASIC PROGRAM STRUCTURE
REM Initialise basic variables
set /a currentPass=1
goto :init
:doneInit
REM Display the intro
if %skipIntro% == 0 call :intro

REM Autodetect the current subnet
call :detectSubnet

REM Display the subnet we're scanning if this is the first pass
if "%currentPass%" EQU "1" call :splash

REM Writing the html header information and the beginning of the main table to a new file called temp.html, overwriting previous (if it exists)
call :beginHTML

	REM Here we enter the main loop of the program.
	:MainLoop

	REM Increment the current IP address
	set /a currentIP+=1
	
	REM Ping the currently selected IP address, but don't output the results onscreen
	ping %subnet%%currentIP% -4 -n 1 -w 500 > nul

	REM Check the error level to see whether there was a reply
	if not errorlevel 1 call :scan
	REM If there was a reply, run a scan on the address.
	
	REM If we did a scan, the %update% variable should be set to 1.  Lets check.  If a scan took place, update the Shell Message with the new information
	if %update% == 1 echo    %subnet%%currentIP% >> shellMessage.txt
	
	if %update% == 1 GOTO FillCell
	REM If a scan took place, fill the table cell with the information we have gathered
	:DoneFillCell
	
	REM Display a message on the Command Prompt window to show how we're doing
	GOTO ShellMessage
	:DoneShellMessage
	
	REM We've finished the cell.  Have we reached the end of the subnet?  If so, it's time to exit this loop, end the table, and start over from :Init
	REM Also, we may have been writing to the reservations file, in which case we should now stop.
	if %currentIP% == 254 GOTO EndTable

	REM We're totally done with this IP now, so we no longer need to know if it has been updated or not.  Reset the variable..
	set /a update=0
	REM ok lets look at the next IP Address..	

	GOTO MainLoop
	
:EndOfTheProgram
	

	
REM FUNCTIONS
:init
	
	set copyPath=NetDisplay.html
	set workingDir=%cd%\data\
	IF NOT EXIST "%workingDir%" md "%workingDir%"
	cd "%workingDir%"

	set shellLines=16
	echo. > shellMessage.txt
	set generatePath=temp.html
	set reservationsPath=reservations.txt
	set writeToReservations=False
	IF NOT EXIST %reservationsPath% set writeToReservations=True& echo MAC ADDRESS \ ICON \ DESCRIPTION > %reservationsPath%

	set /a currentIP=0
	set /a entriesPerRow=8
	set /a currentEntry=0
	set /a update=0
	set /a lightId=1
	set /a phoneId=1
	set /a letterId=1
	
goto :doneInit
	
	
:splash
	echo Scanning subnet %subnet%0 255.255.255.0
	ECHO.
	ECHO.
	ECHO.
goto :eof


:detectSubnet
	
	for /f "usebackq tokens=3,4" %%a in (`route print 0.0.0.0 ^| findstr 0.0.0.0 ^| findstr /V Default `) do (
	set gateway=%%a
	set ipaddress=%%b
	)
	
	for /f "tokens=1-4 delims=." %%i in ("%IPADDRESS%") do (
	set ipoct1=%%i
	set ipoct2=%%j
	set ipoct3=%%k
	set ipoct4=%%l
	) 

	set subnet=%ipoct1%.%ipoct2%.%ipoct3%.
	set thisHost=%ipoct4%

goto :eof


:scan
	REM Machine on! Increment currentEntry
	set /a currentEntry+=1
	set /a update=1

	for /f "usebackq tokens=2" %%a in (`ping -a -n 1 %subnet%%currentIP% ^| find "Pinging"`) do (set hostName=%%a)
	if "%hostName%" == "%subnet%%currentIP%" set hostName=_

	REM Error checking in case we fail to find MAC
	set "beforeMAC=%_mac%"	

	if not "%currentIP%" EQU "%thishost%" (
		for /f "usebackq tokens=2" %%a in (`arp -a %subnet%%currentIP% ^| Findstr %subnet%%currentIP%`) do (set "_mac=%%a")
	)
	
	REM If this is the ip address where NetDisplay is running we use a different method to determine the hostname and mac address.
	if "%currentIP%" EQU "%thishost%" set hostName=%computername%
	if "%currentIP%" EQU "%thishost%" for /f "tokens=1-4" %%a in ('nbtstat -a %subnet%%currentIP% ^| Findstr MAC') do (set "_mac=%%d")
	
	REM If we still weren't able to get the MAC address, try alternative method
	if "%_mac%" == "%beforeMAC%" for /f "tokens=1-4" %%a in ('nbtstat -a %subnet%%currentIP% ^| Findstr MAC') do (set "_mac=%%d")
	
	REM Perhaps we got a MAC Address but it was nul, try alternative method
	if "%_mac%" == "00-00-00-00-00-00" for /f "tokens=1-4" %%a in ('nbtstat -a %subnet%%currentIP% ^| Findstr MAC') do (set "_mac=%%d")

	REM Failing all else, if the MAC is still nul, try a new ping without the hostname then try the original method again
	if "%_mac%" == "00-00-00-00-00-00" ping -n 4 %subnet%%currentIP% >nul
	if "%_mac%" == "00-00-00-00-00-00" for /f "tokens=2" %%a in ('arp -a %subnet%%currentIP% ^| Findstr %subnet%%currentIP%') do (set "_mac=%%a")

	set description=_
	
	REM If we're writing to reservations, write the information now
	if "%writeToReservations%" EQU "True" call :writeReservations
	
	REM Check if this machine has reservation information
	if "%writeToReservations%" EQU "False" call :parseReservationInfo %_mac%

goto :eof



:writeReservations
	REM Don't write to reservations if the mac is nul
	if "%_mac%" == "00-00-00-00-00-00" (
		set iconIndex=0
		set "description=ERROR - NUL MAC"
		goto :eof
	)

	REM If there is a hostname, add with a Computer icon
	if NOT "%hostName%" EQU "_" (
		echo %_mac% \ 1 \ %hostName% >> %reservationsPath%
		set iconIndex=1
		set description=%hostName%
	)
	REM Otherwise, add with a Switch icon
	if "%hostName%" EQU "_" (
		echo %_mac% \ 0 \ No description yet >> %reservationsPath%
		set iconIndex=0
		set "description= No description yet"
	)
goto :eof


:parseReservationInfo

	REM %1 is the MAC address we wish to find in %reservationsPath%
	set iconIndex=0
	for /f "tokens=1,2,3 skip=1 delims=\" %%a in ('find "%_mac%" %reservationsPath%') do (
		set "iconIndex=%%b"
		set "description=%%c"
	)

	REM Don't write to reservations if we have a nul Mac
	if "%_mac%" == "00-00-00-00-00-00" (
		set iconIndex=0
		set "description=ERROR - NUL MAC"
		goto :eof
	)

	REM This might be a new entry.  If it is, add it
	if "%iconIndex%" EQU "" (
		set iconIndex=0
		set description=_
		echo %_mac% \ 0 \ _ >> %reservationsPath%
	)
goto :eof


:FillCell
	
	REM First Create the div for the node
	echo ^<div class="node" id="node%currentEntry%" onmousedown="nodeClicked(%currentEntry%);"^> >> %generatePath%

	REM Render an svg image to represent this host.  0=Switch, 1=Computer
	if "%iconIndex: =%" == "0" GOTO DrawSwitch
	if "%iconIndex: =%" == "1" GOTO DrawComp
	if "%iconIndex: =%" == "2" GOTO DrawPhone
	if "%iconIndex: =%" == "3" GOTO DrawMFP
	REM If we drew something, we'll return to the :DoneDraw label.  If there was an error, default to drawing a switch
	GOTO DrawSwitch
	:DoneDraw

	REM Display the name of the host
	REM If the hostname is empty, colour it black
	if "%hostname%" EQU "_" echo ^<p class="host_name" style="color:#000000;"^>%hostName%^</p^> >> %generatePath%

	REM Otherwise just display it normally
	if "%hostname%" NEQ "_" echo ^<p class="host_name"^>%hostName%^</p^> >> %generatePath%
	
	REM Is this us?  If it is, add a note to say so
	if %currentIP% == %thisHost% echo ^<p class="here"^>You are here^</p^> >> %generatePath%& goto :itWasUs

	REM If it's not us, add the description instead.
	if "%description: =%" NEQ "_" echo ^<p class="description"^>%description%^</p^> >> %generatePath%
	REM If the description is blank, display in bold
	if "%description: =%" EQU "_" echo ^<p class="descriptionWarning"^>UNIDENTIFIED HOST^</p^> >> %generatePath%

	:itWasUs
	REM Next lets show the IP address of this node
	echo ^<p^>%subnet%%currentIP%^</p^>^<p^> >> %generatePath%
	
	REM And we'll also want to display the MAC Address
	echo ^</p^>^<p^>%_mac%^</p^> >> %generatePath%
		
	REM If this is a domain, we should try to show which users are logged on
	call :domainUsers
	
	REM We've finished this node.  Lets end the div.
	echo ^</div^> >> %generatePath%
GOTO DoneFillCell


:domainUsers
	REM Enters the info into the cell about any users connected to the machine on the target IP address

	REM Reset this so we don't show a user from a previously scanned machine
	set IsLoggedOnLocally=
	
	REM First, obtain a readout from the target machine and copy to a temporary file
	query session /server:%hostName% 1>session.txt 2>nul

	REM If the scan didn't work, session.txt will be empty.
	for %%R in (session.txt) do if %%~zR equ 0 goto ScanFailed

	REM If we're still here, the scan has worked so lets set up the table
	echo ^<table^> >> %generatePath%
	
	REM First lets check if anyone is logged on locally.  Look for the line that contains the word "console"
	FOR /F "tokens=1,2,3,4 delims== " %%i in ('findstr "console" session.txt') do (
		REM Ok... now if nobody is logged on, batch will have parsed the second variable (j) with a 0, which is always the ID number of the disconnected console session.
		set IsLoggedOnLocally=%%j
		set localusertest=%%k
	)
	
	ECHO ^<tr^>^<td class="lUserL"^>L:^&nbsp;^</td^>^<td class="lUserR"^> >> %generatePath%%

	if "%localusertest%" == "Conn" goto NoLocalLogon

	REM If we are at this point in the script, the second variable ISN'T equal to 0 - so there must be someone logged on locally.
	REM ...
	ECHO %IsLoggedOnLocally%^</font^>^<br^> >> %generatePath%
	goto DoneConsole

	:NoLocalLogon
	REM There isn't anyone logged on locally, so display a blank space:
	echo -^</td^>^</tr^> >> %generatePath%
	echo.

	:DoneConsole
	REM We have finished displaying the user that is logged in locally (if any).

	REM Next we need to parse the temporary file again to check for remote desktop connections.
	REM We'll look for active connections first.
	FOR /F "tokens=2 delims== " %%x in ('findstr "rdp-tcp.*Active" session.txt') do (
	echo ^<tr^>^<td class="rUserL"^>R:^&nbsp;^</td^>^<td class="rUserR"^>%%x^</td^>^</tr^> >> %generatePath%
	)
	
	echo ^</font^> >> %generatePath%
	REM Now we have displayed the Active remote desktop connections.

	REM Next we need to display the Disconnected logons.
	set serv=services
	FOR /F "tokens=1 delims== " %%a in ('findstr "Disc" session.txt') do (

		REM Don't display the "services" user
		if NOT %%a == %serv% (
			echo ^<tr^>^<td class="dUserL"^>D:^&nbsp;^</td^>^<td class="dUserR"^>%%a^</td^>^</tr^> >> %generatePath%
			)

	)
	
	REM We've displayed all the users, end the table
	echo ^</table^> >> %generatePath%

	:ScanFailed

	:DoneParse
	del session.txt
goto :eof


:ShellMessage
	cls
	echo.
	echo ## Scanning %subnet%%currentIP%
	echo ##                             
	if "%currentEntry%" EQU "1" echo ## Found %currentEntry% host
	if "%currentEntry%" NEQ "1" echo ## Found %currentEntry% hosts
	echo ##
	echo ## Pass: %currentPass%
	echo.
	set /a numToSkip=%currentEntry% - %shellLines%
	if %numToSkip% LSS 1 set numToSkip=1
	for /f "skip=%numToSkip%" %%a in (shellMessage.txt) do (echo    %%a)
GOTO DoneShellMessage

	
:beginHTML
	REM The first echo command uses a single > symbol, this indicates that it should overwrite the existing file if it exists, rather than appending to it.
	echo ^<!DOCTYPE html^>^<html lang="en"^> > %generatePath%

	REM Generate the header
	echo 	^<head^> >> %generatePath%
	REM Set the title that will be display in the browser's title bar
	echo 		^<meta http-equiv="content-type" content="text/html; charset=UTF-8"^> >> %generatePath%
	echo 		^<meta charset="utf-8" http-equiv="X-UA-Compatible" content="IE=Edge"^> >> %generatePath%
	echo 		^<title^>NetDisplay^</title^> >> %generatePath%
	echo 		^<meta name="description" content=""^> >> %generatePath%
	echo 		^<meta name="author" content=""^> >> %generatePath%
	
	REM CSS Style Configuration
	echo 		^<style type="text/css"^> >> %generatePath%
	echo 			body >> %generatePath%
	echo 			{ >> %generatePath%
	echo 				background-color:black; >> %generatePath%
	echo 				color:green; >> %generatePath%
	echo 				font-family:"lucida console", arial, sans-serif; >> %generatePath%
	echo 			} >> %generatePath%

	echo 			#wrapper >> %generatePath%
	echo 			{ >> %generatePath%
	echo 				width:80.4%%; >> %generatePath%
	echo 				margin: 0 auto; >> %generatePath%
	echo 				position: relative; >> %generatePath%
	echo 				margin-left: auto; >> %generatePath%
	echo 				margin-right: auto; >> %generatePath%
	echo 				margin-top: 0px; >> %generatePath%
	echo 			} >> %generatePath%

	echo 			#header >> %generatePath%
	echo 			{ >> %generatePath%
	echo 				width:100%%; >> %generatePath%
	echo 			} >> %generatePath%

	echo 			h1 >> %generatePath%
	echo 			{ >> %generatePath%
	echo 				text-align:center; >> %generatePath%
	echo 			} >> %generatePath%

	echo 			input >> %generatePath%
	echo 			{ >> %generatePath%
	echo 				box-shadow: >> %generatePath%
	echo 				5px 0px 18px #000066, >> %generatePath%
	echo 				-5px 0px 25px #AA0000, >> %generatePath%

	echo 				2px 0px 1px #000099, >> %generatePath%
	echo 				-2px 0px 1px #AA0000, >> %generatePath%
	
	echo 				inset 3px 0px 13px #550000, >> %generatePath%
	echo 				inset -3px 0px 13px #000055; >> %generatePath%
	
	echo 				text-shadow: >> %generatePath%
	echo 				1px 0px 5px #666666, >> %generatePath%
	echo 				-1px 0px 5px #666666; >> %generatePath%
	
	echo 				outline:none; >> %generatePath%
	echo 				margin:3px; >> %generatePath%
	echo 				padding:2px; >> %generatePath%
	echo 				border-width:0px; >> %generatePath%
	echo 				border-color:black; >> %generatePath%
	echo 				font-family:"lucida console", arial, sans-serif; >> %generatePath%
	echo 				color: #AAAAAA; >> %generatePath%
	echo 				background-color: black; >> %generatePath%
	echo 				z-index: -20 >> %generatePath%
	echo 			} >> %generatePath%
	
	echo 			input[type="submit"]:active >> %generatePath%
	echo 			{ >> %generatePath%
	echo 				color:#FFFFFF; >> %generatePath%
	echo 				text-shadow: >> %generatePath%
	echo 				2px 0px 5px #FFFFFF, >> %generatePath%
	echo 				-2px 0px 5px #FFFFFF; >> %generatePath%
	echo 			} >> %generatePath%

	echo 			p >> %generatePath%
	echo 			{ >> %generatePath%
	echo 				padding:0px; >> %generatePath%
	echo 				margin:0px; >> %generatePath%
	echo 				color:cyan; >> %generatePath%
	echo 				text-align:center; >> %generatePath%
	echo 				font-size:9pt; >> %generatePath%
	echo 			} >> %generatePath%

	echo 			.blankLine >> %generatePath%
	echo 			{ >> %generatePath%
	echo 				padding:0px; >> %generatePath%
	echo 				margin:0px; >> %generatePath%
	echo 				color:black; >> %generatePath%
	echo 				text-align:center; >> %generatePath%
	echo 				font-size:9pt; >> %generatePath%
	echo 			} >> %generatePath%
	
	echo 			table >> %generatePath%
	echo 			{ >> %generatePath%
	echo 				font-size:9pt; >> %generatePath%
	echo 				margin-left: auto; >> %generatePath%
	echo 				margin-right: auto; >> %generatePath%
	echo 				border:0px solid black; >> %generatePath%
	echo 			} >> %generatePath%
	
	echo 			td >> %generatePath%
	echo 			{ >> %generatePath%
	echo 				padding:0px; >> %generatePath%
	echo 			} >> %generatePath%
	
	echo 			svg >> %generatePath%
	echo 			{ >> %generatePath%
	echo 				float:left; >> %generatePath%
	echo 				padding:5px; >> %generatePath%
	echo 			} >> %generatePath%

	echo 			.node >> %generatePath%
	echo 			{ >> %generatePath%
	echo 				width:170px; >> %generatePath%
	echo 				height:250px; >> %generatePath%
	echo 				float:left; >> %generatePath%
	echo 				overflow:hidden; >> %generatePath%
	echo 				margin-top:1em; >> %generatePath%
	echo 			} >> %generatePath%

	echo			.phone >> %generatePath%
	echo			{ >> %generatePath%
	echo				margin-left: 18px; >> %generatePath%
	echo				margin-right: auto; >> %generatePath%
	echo				display:block; >> %generatePath%
	echo			} >> %generatePath%

	echo			.switch >> %generatePath%
	echo			{ >> %generatePath%
	echo				margin-top: 15px; >> %generatePath%
	echo				margin-bottom: auto; >> %generatePath%
	echo				display:block; >> %generatePath%
	echo			} >> %generatePath%

	echo			.MFP >> %generatePath%
	echo			{ >> %generatePath%
	echo				margin-left: 16px; >> %generatePath%
	echo				margin-right: auto; >> %generatePath%
	echo				display:block; >> %generatePath%
	echo			} >> %generatePath%
	
	echo 			.host_name >> %generatePath%
	echo 			{ >> %generatePath%
	echo 				font-size:12pt; >> %generatePath%
	echo 				clear:both; >> %generatePath%
	echo 			} >> %generatePath%

	echo 			.description >> %generatePath%
	echo 			{ >> %generatePath%
	echo 				font-size:9pt; >> %generatePath%
	echo 				color:#9999BB; >> %generatePath%
	echo 				text-shadow: >> %generatePath%
	echo 				1px 0px 5px #555577, >> %generatePath%
	echo 				-1px 0px 5px #555577; >> %generatePath%
	echo 			} >> %generatePath%

	echo 			.descriptionWarning >> %generatePath%
	echo 			{ >> %generatePath%
	echo 				font-size:9pt; >> %generatePath%
	echo 				font-weight:bold; >> %generatePath%
	echo 				color:#FF5555; >> %generatePath%
	echo 				text-shadow: >> %generatePath%
	echo 				1px 0px 5px #DD1111, >> %generatePath%
	echo 				-1px 0px 5px #DD1111; >> %generatePath%
	echo 			} >> %generatePath%

	echo 			.here >> %generatePath%
	echo 			{ >> %generatePath%
	echo 				color:#0A0; >> %generatePath%
	echo 				font-weight:900; >> %generatePath%
	echo 				clear:both; >> %generatePath%
	echo 				text-shadow:0.1em 0.1em 0.45em #030, >> %generatePath%
	echo 				-0.1em 0.1em 0.45em #030, >> %generatePath%
	echo 				0.1em -0.1em 0.45em #030, >> %generatePath%
	echo 				-0.1em -0.1em 0.45em #030; >> %generatePath%
	echo 			} >> %generatePath%

	echo 			.lUserL >> %generatePath%
	echo 			{ >> %generatePath%
	echo 				text-align:right; >> %generatePath%
	echo 				color:#090; >> %generatePath%
	echo 				font-weight:bold; >> %generatePath%
	echo 				text-shadow:0.1em 0.1em 0.2em #050, >> %generatePath%
	echo 				-0.1em 0.1em 0.2em #050, >> %generatePath%
	echo 				0.1em -0.1em 0.2em #050, >> %generatePath%
	echo 				-0.1em -0.1em 0.2em #050; >> %generatePath%
	echo				line-height:80%%; >> %generatePath%
	echo 			} >> %generatePath%
	
	echo 			.lUserR >> %generatePath%
	echo 			{ >> %generatePath%
	echo 				text-align:left; >> %generatePath%
	echo 				color:#090; >> %generatePath%
	echo 				text-shadow:0.1em 0.1em 0.1em #040, >> %generatePath%
	echo 				-0.1em 0.1em 0.1em #040, >> %generatePath%
	echo 				0.1em -0.1em 0.1em #040, >> %generatePath%
	echo 				-0.1em -0.1em 0.1em #040; >> %generatePath%
	echo				line-height:80%%; >> %generatePath%
	echo 			} >> %generatePath%
	
	echo 			.rUserL >> %generatePath%
	echo 			{ >> %generatePath%
	echo 				text-align:right; >> %generatePath%
	echo 				color:red; >> %generatePath%
	echo 				font-weight:bold; >> %generatePath%
	echo 				text-shadow:0.1em 0.1em 0.2em #900, >> %generatePath%
	echo 				-0.1em 0.1em 0.2em #900, >> %generatePath%
	echo 				0.1em -0.1em 0.2em #900, >> %generatePath%
	echo 				-0.1em -0.1em 0.2em #900; >> %generatePath%
	echo				line-height:80%%; >> %generatePath%
	echo 			} >> %generatePath%
	
	echo 			.rUserR >> %generatePath%
	echo 			{ >> %generatePath%
	echo 				text-align:left; >> %generatePath%
	echo 				color:red; >> %generatePath%
	echo 				text-shadow:0.1em 0.1em 0.1em #900, >> %generatePath%
	echo 				-0.1em 0.1em 0.1em #900, >> %generatePath%
	echo 				0.1em -0.1em 0.1em #900, >> %generatePath%
	echo 				-0.1em -0.1em 0.1em #900; >> %generatePath%
	echo				line-height:80%%; >> %generatePath%
	echo 			} >> %generatePath%
	
	echo 			.dUserL >> %generatePath%
	echo 			{ >> %generatePath%
	echo 				text-align:right; >> %generatePath%
	echo 				color:grey; >> %generatePath%
	echo 				font-weight:bold; >> %generatePath%
	echo 				text-shadow:0.1em 0.1em 0.3em #233, >> %generatePath%
	echo 				-0.1em 0.1em 0.2em #222, >> %generatePath%
	echo 				0.1em -0.1em 0.2em #222, >> %generatePath%
	echo 				-0.1em -0.1em 0.2em #222; >> %generatePath%
	echo				line-height:80%%; >> %generatePath%
	echo 			} >> %generatePath%
	
	echo 			.dUserR >> %generatePath%
	echo 			{ >> %generatePath%
	echo 				text-align:left; >> %generatePath%
	echo 				color:grey; >> %generatePath%
	echo 				text-shadow:0.1em 0.1em 0.1em #222, >> %generatePath%
	echo 				-0.1em 0.1em 0.1em #222, >> %generatePath%
	echo 				0.1em -0.1em 0.1em #222, >> %generatePath%
	echo 				-0.1em -0.1em 0.1em #222; >> %generatePath%
	echo				line-height:80%%; >> %generatePath%
	echo 			} >> %generatePath%
	
	echo 			div#spacer >> %generatePath%
	echo 			{ >> %generatePath%
	echo 				position:relative; >> %generatePath%
	echo 				width: 100%%; >> %generatePath%
	echo 				margin-left:auto; >> %generatePath%
	echo 				margin-right:auto; >> %generatePath%
	echo 				clear: both; >> %generatePath%
	echo 				height: 200px; >> %generatePath%
	echo 			} >> %generatePath% >> %generatePath%
	
	echo 			div#netDisplayLogo >> %generatePath%
	echo 			{ >> %generatePath%
	echo 				position:relative; >> %generatePath%
	echo 				width: 402px; >> %generatePath%
	echo 				height: 0px; >> %generatePath%
	echo 				bottom: 5px;  >> %generatePath%
	echo 				margin-left:auto; >> %generatePath%
	echo 				margin-right:auto; >> %generatePath%
	echo 				margin-top:0px; >> %generatePath%
	echo 				margin-bottom:0px; >> %generatePath%
	echo 				background-color:black;  >> %generatePath%
	echo 				padding:0px; >> %generatePath%
	echo 			} >> %generatePath%
	
	echo 			div#searchBox >> %generatePath%
	echo 			{ >> %generatePath%
	echo 				position: relative; >> %generatePath%
	echo 				height: 0px; >> %generatePath%
	echo 				bottom: 40px; >> %generatePath%
	echo 				width: 254px; >> %generatePath%
	echo 				margin-left:auto; >> %generatePath%
	echo 				margin-right:auto; >> %generatePath%
	echo 				margin-top:0px; >> %generatePath%
	echo 				margin-bottom:70px; >> %generatePath%
	echo 				padding:0px; >> %generatePath%
	echo 				background-color:black;  >> %generatePath%
	echo 				font-size:4pt; >> %generatePath%
	echo 				line-height:200%%; >> %generatePath%
	echo 			} >> %generatePath%
	
	echo 			div#footer >> %generatePath%
	echo 			{ >> %generatePath%
	echo 				position: fixed; >> %generatePath%
	echo 				overflow: hidden; >> %generatePath%
	echo 				bottom: 0px; >> %generatePath%
	echo 				left: 0px; >> %generatePath%
	echo 				height: 210px; >> %generatePath%
	echo 				max-height: 20%%; >> %generatePath%
	echo				min-height: 190px; >> %generatePath%
	echo 				width: 600px; >> %generatePath%
	echo 				background: rgb(0,0,0); >> %generatePath%
	echo 				background: rgba(0,0,0,0) >> %generatePath%
	echo 			} >> %generatePath%

	echo 			#generatedAt >> %generatePath%
	echo 			{ >> %generatePath%
	echo 				font-size:9pt; >> %generatePath%
	echo 				color:#BB9999; >> %generatePath%
	echo 				margin-top:2px; >> %generatePath%
	echo 				text-shadow: >> %generatePath%
	echo 				1px 0px 5px #775555, >> %generatePath%
	echo 				-1px 0px 5px #775555; >> %generatePath%
	echo 			} >> %generatePath%
	
	echo 			#lastRefresh >> %generatePath%
	echo 			{ >> %generatePath%
	echo 				font-size:9pt; >> %generatePath%
	echo 				color:#9999BB; >> %generatePath%
	echo 				margin-top:5px; >> %generatePath%
	echo 				text-shadow: >> %generatePath%
	echo 				1px 0px 5px #555577, >> %generatePath%
	echo 				-1px 0px 5px #555577; >> %generatePath%
	echo 			} >> %generatePath%
	echo 		^</style^> >> %generatePath%

	REM Javascript
 	echo 	^<script type="text/javascript"^> >> %generatePath%
	echo 		// AUTO REFRESH CODE >> %generatePath%
	echo 		;(function(){  >> %generatePath%
	echo 		var addEvent = (function(){return window.addEventListener? function(el, ev, f){  >> %generatePath%
	echo 		el.addEventListener(ev, f, false);  >> %generatePath%
	echo 		}:window.attachEvent? function(el, ev, f){  >> %generatePath%
	echo 		el.attachEvent('on' + ev, function(){f.call(el);});  >> %generatePath%
	echo 		}:function(){return;};  >> %generatePath%
	echo 		})(), timer;  >> %generatePath%
	echo 		function setreset() >> %generatePath%
	echo 		{ >> %generatePath%
	echo 			clearTimeout(timer);  >> %generatePath%
	echo 			timer = setTimeout(function(){location.reload(true);}, 45 * 60 * 10);  >> %generatePath%
	echo 		}  >> %generatePath%
	echo 		addEvent(document, 'keydown', setreset);  >> %generatePath%
	echo 		setreset();  >> %generatePath%
	echo 		})();  >> %generatePath%
	
	echo 		// ##### Init Global Variables ##### >> %generatePath%
	
	echo 		// MODIFIABLE INITS >> %generatePath%
	echo 		// 1a. General Modifiable Inits >> %generatePath%
	echo 		var animate = true;				// set to false to disable animations - you might want to do this to save a small amount of CPU for example. >> %generatePath%
	
	echo 		// 1b. Node-Showing Modifiable Inits >> %generatePath%
	echo 		var nodeVisibleTimer = 100;		// how long should clicking a node show it? >> %generatePath%
	echo 		var nodeVisibleTimerCurrent = 0;	// This will be set to the nodeVisibleTimer and decrement each cycle >> %generatePath%
	echo 		var nodeTarget = 1;			// Used for selecting which node remains opaque after a click >> %generatePath%
	
	echo 		// 1c. Lights Modifiable Inits >> %generatePath%
	echo 		var increment = 0.25;			// controls light flashing speed - larger is faster >> %generatePath%
	
	echo 		// 1d. Logo Modifiable Inits >> %generatePath%
	echo 		var logoIncrement = -0.045;		// controls the speed of the phasing - larger is faster, negative is backwards >> %generatePath%
	echo 		var scale = 65					// controls colour scale - 255 is maximum colourfulness, 1 and everything stays black >> %generatePath%
	
	echo 		// 1e. Thanks Modifiable Inits >> %generatePath%
	echo 		var textGoTime = 200;			// how long to wait before showing the text >> %generatePath%
	echo 		var phoneTextGoTime = 170;		// how long to wait before showing the phone text >> %generatePath%
	echo 		var textTimerStep = 1;			// how much to increase the timer per cycle >> %generatePath%
	echo 		var opacityLimit = 0.6;			// the maximum opacity to make a letter before moving onto the next letter >> %generatePath%
	echo 		var phoneOpacityLimit = 0.9;			// the maximum opacity to make a phoneLetter before moving onto the next phoneLetter >> %generatePath%
	echo 		var opacityStep = 0.3;			// the amount to step up the opacity of each letter.  it best if this multiplies up to exactly opacityLimit >> %generatePath%
	echo 		var opacityFadeStep = 0.01;		// the amount to fade out ALL letters per cycle when they have all been displayed. >> %generatePath%
	
	echo 		// 2a.  General Inits >> %generatePath%
	echo 		var glowTimer = 0; >> %generatePath%
	echo 		var terms; >> %generatePath%
	
	echo 		// 2b. Node-Showing Inits >> %generatePath%
	
	echo 		// 2c. Lights Inits >> %generatePath%
	echo 		var count = 0; >> %generatePath%
	echo 		var lights; >> %generatePath%
	echo 		var lighhtId; >> %generatePath%
	echo 		var theLight; >> %generatePath%
	echo 		var flashInProgress = false; >> %generatePath%
	
	echo 		// 2d. Logo Inits >> %generatePath%
	echo 		var logoCount = 0; >> %generatePath%
	echo 		var offset = 0; >> %generatePath%
	echo 		var sinresult; >> %generatePath%
	echo 		var dec; >> %generatePath%
	echo 		var hex; >> %generatePath%
	echo 		var currentOffset; >> %generatePath%
	echo 		var red=0; >> %generatePath%
	echo 		var green=0; >> %generatePath%
	echo 		var blue=0; >> %generatePath%
	echo 		var redHex; >> %generatePath%
	echo 		var greenHex; >> %generatePath%
	echo 		var blueHex; >> %generatePath%
	echo 		var redShift = 0; >> %generatePath%
	echo 		var blueShift = (Math.PI / 3); >> %generatePath%
	echo 		var greenShift = ((Math.PI * 2) / 3); >> %generatePath%
	
	echo 		// 2e. Thanks Inits >> %generatePath%
	echo 		var letters; >> %generatePath%
	echo 		var numComps; >> %generatePath%
	echo 		var selectedComp; >> %generatePath%
	echo 		var firstLetterId; >> %generatePath%
	echo 		var lastLetterId; >> %generatePath%
	echo 		var currentLetterId; >> %generatePath%
	echo 		var currentLetter; >> %generatePath%
	echo 		var currentLetterOpacity = 0; >> %generatePath%
	echo 		var textTimer = 0; >> %generatePath%
	echo 		var thanksFade = false; >> %generatePath%
	echo 		var thanksInProgress = false; >> %generatePath%
	
	echo		// 2f. Phone Inits >> %generatePath%
	echo		var phoneLetters; >> %generatePath%
	echo		var numPhones; >> %generatePath%
	echo 		var selectedPhone; >> %generatePath%
	echo 		var firstPhoneLetterId; >> %generatePath%
	echo 		var lastPhoneLetterId; >> %generatePath%
	echo 		var currentPhoneLetterId; >> %generatePath%
	echo 		var currentPhoneLetter = 1; >> %generatePath%
	echo 		var currentPhoneLetterOpacity = 0; >> %generatePath%
	echo 		var phoneTextTimer = 0; >> %generatePath%
	echo 		var phoneFade = false; >> %generatePath%
	echo 		var phoneInProgress = false; >> %generatePath%
	
	echo 		// ###### General Functions ##### >> %generatePath%
	
	echo 		function Init() >> %generatePath%
	echo 		{ >> %generatePath%
	echo 			// Focus the text cursor on the search box >> %generatePath%
	echo 			FocusOnInput() >> %generatePath%
	echo 			// node-scrolling inits - Always run these >> %generatePath%
	echo 			nodes = document.getElementsByClassName("node"); >> %generatePath%
	echo 			// Init stuff for the glowing search terms  >> %generatePath%
	echo 			terms = document.getElementById("search"); >> %generatePath%

	echo 			// only init the other stuff if animations are turned on >> %generatePath%
	echo 			if (animate) >> %generatePath%
	echo 			{ >> %generatePath%
	
	echo 				// logo inits >> %generatePath%
	echo 				var stop1 = document.getElementById("stop1"); >> %generatePath%
	echo 				var stop2 = document.getElementById("stop2"); >> %generatePath%
	echo 				var stop3 = document.getElementById("stop3"); >> %generatePath%
	
	echo 				// lights inits >> %generatePath%
	echo 				lights = document.getElementsByClassName("light"); >> %generatePath%
	
	echo 				// thanks inits >> %generatePath%
	echo 				letters = document.getElementsByClassName("letter"); >> %generatePath%
	echo 				numComps = (letters.length / 31); >> %generatePath%
	
	echo				// phone inits >> %generatePath%
	echo				phoneLetters = document.getElementsByClassName("phoneLetter"); >> %generatePath%
	echo				numPhones = (phoneLetters.length / 9); >> %generatePath%

	echo 				// showtime! >> %generatePath%
	echo 				setInterval(RunAnimations,30); >> %generatePath%
	echo 			} >> %generatePath%
	
	echo 			// alternatively, if animation is off, it's time to run just the node-scrolling >> %generatePath%
	echo 			if (animate == false) >> %generatePath%
	echo 			{ >> %generatePath%
	echo 				setInterval(ShowNodes,30); >> %generatePath%
	echo 			} >> %generatePath%
	echo 		} >> %generatePath%
	
	echo 		function FocusOnInput()  >> %generatePath%
	echo 		{  >> %generatePath%
	echo 			document.getElementById("search").focus();  >> %generatePath%
	echo 		} >> %generatePath%
	
	echo 		function RunAnimations() >> %generatePath%
	echo 		{ >> %generatePath%
	echo			if (lights.length ^> 0) { >> %generatePath%
	echo 				FlashingLights() >> %generatePath%
	echo			} >> %generatePath%
	echo			if (numComps ^> 0) { >> %generatePath%
	echo	 			Thanks() >> %generatePath%
	echo			} >> %generatePath%
	echo 			if (numPhones ^> 0) { >> %generatePath%
	echo				Phone() >> %generatePath%
	echo			} >> %generatePath%
	echo 			AnimateLogo() >> %generatePath%
	echo 			ShowNodes() >> %generatePath%
	echo 			GlowTerms() >> %generatePath%
	echo 		} >> %generatePath%
	
	echo		function GlowSearchTerms() >> %generatePath%
	echo		{ // run when Google Search button is clicked or enter key is pressed >> %generatePath%
	echo		glowTimer = 30; >> %generatePath%
	echo		} >> %generatePath%

	echo 		function GlowTerms() >> %generatePath%
	echo 		{	// run continously >> %generatePath%
	echo 			if (glowTimer ^> 0) >> %generatePath%
	echo 			{ >> %generatePath%			
	echo 				terms.setAttribute("style","text-shadow: " + glowTimer + "px 0px " + glowTimer + "px #FFFFFF, " + (glowTimer * -1) + "px 0px "+ glowTimer + "px #FFFFFF; color: #DDDDFF; "); >> %generatePath%
	echo 				if (glowTimer == 1) >> %generatePath%
	echo 				{ >> %generatePath%
	echo 					terms.setAttribute("style","text-shadow: 1px 0px 5px #666666, -1px 0px 5px #666666; color: #AAAAAA; "); >> %generatePath%
	echo 				} >> %generatePath%
	echo 				glowTimer = glowTimer - 1; >> %generatePath%
	echo 			} >> %generatePath%
	echo 		} >> %generatePath%

	echo 		// ##### Logo Animation ##### >> %generatePath%
	echo 		function AnimateLogo() >> %generatePath%
	echo 		{ >> %generatePath%
	echo 			^<!-- logoIncrement the logoCounter --^> >> %generatePath%
	echo 			logoCount = logoCount + logoIncrement; >> %generatePath%
	
	echo 			^<!-- FIRST STOP --^> >> %generatePath%
	echo 			currentOffset = 0; >> %generatePath%
	echo 			redHex = CalculateStopHex(currentOffset,redShift); >> %generatePath%
	echo 			greenHex = CalculateStopHex(currentOffset,greenShift); >> %generatePath%
	echo 			blueHex = CalculateStopHex(currentOffset,blueShift); >> %generatePath%
	echo 			stop1.setAttribute("style", ("stop-color:#"+redHex+greenHex+blueHex)); >> %generatePath%
	
	echo 			^<!-- SECOND STOP --^> >> %generatePath%
	echo 			currentOffset = (Math.PI / 3); >> %generatePath%
	echo 			redHex = CalculateStopHex(currentOffset,redShift); >> %generatePath%
	echo 			greenHex = CalculateStopHex(currentOffset,greenShift); >> %generatePath%
	echo 			blueHex = CalculateStopHex(currentOffset,blueShift); >> %generatePath%
	echo 			stop2.setAttribute("style", ("stop-color:#"+redHex+greenHex+blueHex)); >> %generatePath%
	
	echo 			^<!-- THIRD STOP --^> >> %generatePath%
	echo 			currentOffset = ((2 * Math.PI) / 3); >> %generatePath%
	echo 			redHex = CalculateStopHex(currentOffset,redShift); >> %generatePath%
	echo 			greenHex = CalculateStopHex(currentOffset,greenShift); >> %generatePath%
	echo 			blueHex = CalculateStopHex(currentOffset,blueShift); >> %generatePath%
	echo 			stop3.setAttribute("style", ("stop-color:#"+redHex+greenHex+blueHex)); >> %generatePath%
	echo 		} >> %generatePath%

	echo 		function CalculateStopHex(offset, shift) >> %generatePath%
	echo 		{ >> %generatePath%
	echo 			^<!-- takes stop offset and colour shift as variables, returns a hex colour code --^> >> %generatePath%
	echo 			sinresult = Math.sin(logoCount + shift + offset); >> %generatePath%
	echo 			dec = Math.round(((sinresult + 1) / 2) * scale); >> %generatePath%
	echo 			hex = dec.toString(16); >> %generatePath%
	echo 			if (hex.length == 1) >> %generatePath%
	echo 			{ >> %generatePath%
	echo 				^<!-- Trap single digit values and add a leading zero --^> >> %generatePath%
	echo 				hex = "0" + hex; >> %generatePath%
	echo 			} >> %generatePath%
	echo 			return hex; >> %generatePath%
	echo 		} >> %generatePath%
	
	echo 		// ##### Flashing Lights ##### >> %generatePath%
	echo 		function FlashingLights() >> %generatePath%
	echo 		{ >> %generatePath%
	echo 			if (count ^>= 3.14159265) >> %generatePath%
	echo 			{ >> %generatePath%
	echo 				^<!-- we have reached the end of a cycle.  Set the light to be properly transparent, and turn off the latch --^> >> %generatePath%
	echo 				theLight.setAttribute("fill-opacity", 0); >> %generatePath%
	echo 				flashInProgress = false; >> %generatePath%
	echo 			} >> %generatePath%

	echo 			if (!flashInProgress) >> %generatePath%
	echo 			{ >> %generatePath%
	echo 				^<!-- we are not currently running a flash, so lets select a random ligt for flashing --^> >> %generatePath%
	echo 				lightId = Math.ceil((Math.random() * lights.length)); >> %generatePath%
	echo 				^<!-- we will also need to reset the counter so that the flash starts from the off state.   one full cycle has passed when count == math.pi --^> >> %generatePath%
	echo 				count = 0; >> %generatePath%
	echo 				^<!-- and we need to latch this so that it is not triggered next time --^> >> %generatePath%
	echo 				flashInProgress = true; >> %generatePath%
	echo 			} >> %generatePath%
	
	echo 			if (flashInProgress) >> %generatePath%
	echo 			{ >> %generatePath%
	echo 				^<!-- we are currently flashing the box that has id boxid.  calculate its opacity and increment the counter--^> >> %generatePath%
	echo 				var sinresult = Math.sin(count); >> %generatePath%
	echo 				theLight = document.getElementById("light"+lightId) >> %generatePath%
	echo 				theLight.setAttribute("fill-opacity", sinresult); >> %generatePath%
	echo 				count = count + increment; >> %generatePath%
	echo 			} >> %generatePath%
	echo 		}			 >> %generatePath%
	
	echo 		// ##### Thanks ##### >> %generatePath%

	echo 		function Thanks() >> %generatePath%
	echo 		{ >> %generatePath%
	echo 			textTimer = textTimer + textTimerStep; >> %generatePath%
	
	echo 			if (textTimer ^>= textGoTime) >> %generatePath%
	echo 			{ >> %generatePath%
	echo 				StartLogo(); >> %generatePath%
	echo 			} >> %generatePath%

	echo 			if (thanksInProgress) >> %generatePath%
	echo 			{ >> %generatePath%
	echo 				// increase the opacity of the current letter by whatever the step value is >> %generatePath%
	echo 				currentLetterOpacity = currentLetterOpacity + opacityStep; >> %generatePath%
	echo 				currentLetter.setAttribute("fill-opacity", currentLetterOpacity); >> %generatePath%
	echo 				// check if we've reached opacityLimit (fully opaque) yet >> %generatePath%
	echo 				if (currentLetterOpacity ^>= opacityLimit) >> %generatePath%
	echo 				{	// we've reached fully opaque.  Next letter! >> %generatePath%
	echo 					currentLetterOpacity = 0; >> %generatePath%
	echo 					currentLetterId = currentLetterId + 1; >> %generatePath%
	echo 					currentLetter = document.getElementById("letter"+currentLetterId); >> %generatePath%
	echo 				} >> %generatePath%

	echo 				// have we finished? >> %generatePath%
	echo 				if (currentLetterId ^> lastLetterId) >> %generatePath%
	echo 				{	// we've just finished displaying the last letter >> %generatePath%
	echo 					thanksFade = true; >> %generatePath%
	echo 					currentLetterOpacity = opacityLimit; >> %generatePath%
	echo 					thanksInProgress = false; >> %generatePath%
	echo 					textTimer = 0; >> %generatePath%
	echo 				} >> %generatePath%
	echo 			}	 >> %generatePath%

	echo 			if (thanksFade) >> %generatePath%
	echo 			{ >> %generatePath%
	echo 				// decrease the current opacity by the FadeStep amount >> %generatePath%
	echo 				currentLetterOpacity = currentLetterOpacity - opacityFadeStep; >> %generatePath%

	echo 				// set that amount of opacity on ALL the letters >> %generatePath%
	echo 				for (var i=firstLetterId; i^<=lastLetterId; i++) >> %generatePath%
	echo 				{ >> %generatePath%
	echo 					currentLetter = document.getElementById("letter"+i); >> %generatePath%
	echo 					currentLetter.setAttribute("fill-opacity", currentLetterOpacity); >> %generatePath%
	echo 				} >> %generatePath%
	
	echo 				// are we done with the fadeout? >> %generatePath%
	echo 				if (currentLetterOpacity ^<= 0) >> %generatePath%
	echo 				{ >> %generatePath%
	echo 					currentLetterOpacity = 0; >> %generatePath%
	echo 					thanksFade = false; >> %generatePath%
	echo 					textTimer = 0; >> %generatePath%
	echo 				} >> %generatePath%
	echo 			} >> %generatePath%
	echo 		} >> %generatePath%

	echo 		function StartLogo() >> %generatePath%
	echo 		{ >> %generatePath%
	echo 			// select a comp >> %generatePath%
	echo 			selectedComp = Math.ceil((Math.random() * numComps)); >> %generatePath%
	echo 			lastLetterId = selectedComp * 31; >> %generatePath%
	echo 			firstLetterId = lastLetterId - 30; >> %generatePath%
	echo 			currentLetterId = firstLetterId; >> %generatePath%
	echo 			// select the first letter >> %generatePath%
	echo 			currentLetter = document.getElementById("letter"+currentLetterId); >> %generatePath%
	echo 			thanksInProgress = true; >> %generatePath%
	echo 			// stop the timer so we don't instantly select a different computer... >> %generatePath%
	echo 			textTimer = 0; >> %generatePath%
	echo 		} >> %generatePath%
	
	echo 		// ##### I'm a phone ##### >> %generatePath%
	echo 		function Phone() >> %generatePath%
	echo 		{ >> %generatePath%
	echo 			phoneTextTimer = phoneTextTimer + textTimerStep; >> %generatePath%
	
	echo 			if (phoneTextTimer ^>= phoneTextGoTime) >> %generatePath%
	echo 			{ >> %generatePath%
	echo 				StartPhone(); >> %generatePath%
	echo 			} >> %generatePath%

	echo 			if (phoneInProgress) >> %generatePath%
	echo 			{ >> %generatePath%
	echo 				// increase the opacity of the current letter by whatever the step value is >> %generatePath%
	echo 				currentPhoneLetterOpacity = currentPhoneLetterOpacity + opacityStep; >> %generatePath%
	echo 				currentPhoneLetter.setAttribute("fill-opacity", currentPhoneLetterOpacity); >> %generatePath%
	echo 				// check if we've reached opacityLimit (fully opaque) yet >> %generatePath%
	echo 				if (currentPhoneLetterOpacity ^>= phoneOpacityLimit) >> %generatePath%
	echo 				{	// we've reached fully opaque.  Next letter! >> %generatePath%
	echo 					currentPhoneLetterOpacity = 0; >> %generatePath%
	echo 					currentPhoneLetterId = currentPhoneLetterId + 1; >> %generatePath%
	echo 					currentPhoneLetter = document.getElementById("phoneLetter"+currentPhoneLetterId); >> %generatePath%
	echo 				} >> %generatePath%

	echo 				// have we finished? >> %generatePath%
	echo 				if (currentPhoneLetterId ^> lastPhoneLetterId) >> %generatePath%
	echo 				{	// we've just finished displaying the last letter >> %generatePath%
	echo 					phoneFade = true; >> %generatePath%
	echo 					currentPhoneLetterOpacity = phoneOpacityLimit; >> %generatePath%
	echo 					phoneInProgress = false; >> %generatePath%
	echo 					phoneTextTimer = 0; >> %generatePath%
	echo 				} >> %generatePath%
	echo 			}	 >> %generatePath%

	echo 			if (phoneFade) >> %generatePath%
	echo 			{ >> %generatePath%
	echo 				// decrease the current opacity by the FadeStep amount >> %generatePath%
	echo 				currentPhoneLetterOpacity = currentPhoneLetterOpacity - opacityFadeStep; >> %generatePath%
	echo 				// set that amount of opacity on ALL the letters >> %generatePath%
	echo 				for (var i=firstPhoneLetterId; i^<=lastPhoneLetterId; i++) >> %generatePath%
	echo 				{ >> %generatePath%
	echo 					currentPhoneLetter = document.getElementById("phoneLetter"+i); >> %generatePath%
	echo 					currentPhoneLetter.setAttribute("fill-opacity", currentPhoneLetterOpacity); >> %generatePath%
	echo 				} >> %generatePath%
	echo 				// are we done with the fadeout? >> %generatePath%
	echo 				if (currentPhoneLetterOpacity ^<= 0) >> %generatePath%
	echo 				{ >> %generatePath%
	echo 					currentPhoneLetterOpacity = 0; >> %generatePath%
	echo 					phoneFade = false; >> %generatePath%
	echo 					phoneTextTimer = 0; >> %generatePath%
	echo 				} >> %generatePath%
	echo 			} >> %generatePath%
	echo 		} >> %generatePath%

	echo 		function StartPhone() >> %generatePath%
	echo 		{ >> %generatePath%
	echo 			// select a comp >> %generatePath%
	echo 			selectedPhone = Math.ceil((Math.random() * numPhones)); >> %generatePath%
	echo 			lastPhoneLetterId = selectedPhone * 9; >> %generatePath%
	echo 			firstPhoneLetterId = lastPhoneLetterId - 8; >> %generatePath%
	echo 			currentPhoneLetterId = firstPhoneLetterId; >> %generatePath%
	echo 			// select the first letter >> %generatePath%
	echo 			currentPhoneLetter = document.getElementById("phoneLetter"+currentPhoneLetterId); >> %generatePath%
	echo 			phoneInProgress = true; >> %generatePath%
	echo 			// stop the timer so we don't instantly select a different phone... >> %generatePath%
	echo 			phoneTextTimer = 0; >> %generatePath%
	echo 		} >> %generatePath%

	echo 		// ##### Node Showing ##### >> %generatePath%
	echo 		function ShowNodes() >> %generatePath%
	echo 		{	// activated continously >> %generatePath%
	echo			for (var i=1; i^<=nodes.length; i++) >> %generatePath%
	echo			{ >> %generatePath%
	echo				var div = document.getElementById("node"+i);	// assign the current node to a variable called "div" >> %generatePath%
	echo				if (i == nodeTarget ^&^& nodeVisibleTimerCurrent ^> 0)	// If this node is the one that was clicked, and the timer is still going.. >> %generatePath%
	echo				{ >> %generatePath%
	echo					for (var j=1; j^<=nodes.length; j++)	>> %generatePath%
	echo					{	// ..Go through each of the other divs... >> %generatePath%
	echo						if (j != i) >> %generatePath%
	echo						{	// ..And set them to be hidden/semi-transparent >> %generatePath%
	echo							var otherdiv = document.getElementById("node"+j); >> %generatePath%
	echo							otherdiv.setAttribute("style","overflow:hidden; opacity:0.2;"); >> %generatePath%
	echo						} >> %generatePath%
	echo					} >> %generatePath%
	echo					// Also, set this div to be visible and opaque >> %generatePath%
	echo					div.setAttribute("style","overflow:visible; opacity:1;"); >> %generatePath%
	echo				} >> %generatePath%
	echo			}  >> %generatePath%

	echo		// Maybe the timer ran out >> %generatePath%
	echo		if (nodeVisibleTimerCurrent == 1) >> %generatePath%
	echo		{ >> %generatePath%
	echo			for (var i=1; i^<=nodes.length; i++) >> %generatePath%
	echo			{ >> %generatePath%
	echo				var div = document.getElementById("node"+i);	// assign the current node to a variable called "div" >> %generatePath%
	echo				div.setAttribute("style","overflow:hidden; opacity:1;"); >> %generatePath%
	echo			} >> %generatePath%
	echo			nodeVisibleTimerCurrent = nodeVisibleTimerCurrent - 1; >> %generatePath%
	echo		} >> %generatePath%

	echo		if (nodeVisibleTimerCurrent ^> 1) // if it didn't run out, we'd better decrement it... >> %generatePath%
	echo		{ >> %generatePath%
	echo			nodeVisibleTimerCurrent = nodeVisibleTimerCurrent - 1; >> %generatePath%
	echo		} >> %generatePath%
	echo	} >> %generatePath%
	echo	function nodeClicked(nodeId) >> %generatePath%
	echo	{	// the node has been clicked >> %generatePath%
	echo		if (nodeVisibleTimerCurrent ^> 1 ^&^& nodeId != nodeTarget) // If a different node has previously been clicked, we now want to unselect it. >> %generatePath%
	echo		{ >> %generatePath%
	echo			nodeVisibleTimerCurrent = 1; >> %generatePath%
	echo		} >> %generatePath%
	echo		else >> %generatePath%
	echo		{ >> %generatePath%
	echo			if (nodeId != 0) // node ID 0 is used only for deselecting so don't allow it to trigger the timer >> %generatePath%
	echo			{ >> %generatePath%
	echo				nodeVisibleTimerCurrent = nodeVisibleTimer;	// this is a timer to shown the node until 0 is reached >> %generatePath%
	echo				nodeTarget=nodeId; >> %generatePath%
	echo			} >> %generatePath%
	echo		} >> %generatePath%
	echo	} >> %generatePath%
	echo 	^</script^> >> %generatePath%
	
	echo ^</head^> >> %generatePath%
	
	
	REM Begin Body and define SVG gradients and blurs
	echo ^<body onload="Init();"^> >> %generatePath%
	
	echo 	^<!-- SVG Defs for Switch, Comp and Phone --^> >> %generatePath%
	echo 	^<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" width="0" height="0"^> >> %generatePath%
	echo 		^<defs^> >> %generatePath%

	echo			^<-- PHONE DEFS --^> >> %generatePath%

	echo	^<linearGradient id="linGradStops1"^> >> %generatePath%
	echo		^<stop id="linGradStops1Stop1" style="stop-color:#000000;stop-opacity:0.339" offset="0" /^> >> %generatePath%
	echo		^<stop id="linGradStops1Stop2" style="stop-color:#000079;stop-opacity:0.339" offset="1" /^> >> %generatePath%
	echo	^</linearGradient^> >> %generatePath%
	echo	^<linearGradient x1="381.626" y1="207.194" x2="424.665" y2="207.194" id="linGrad1" xlink:href="#linGradStops1" gradientUnits="userSpaceOnUse" gradientTransform="translate(98.027,-0.675)" /^> >> %generatePath%
	
	echo	^<linearGradient id="linGradStops2"^> >> %generatePath%
	echo		^<stop id="linGradStops2Stop1" style="stop-color:#007900;stop-opacity:0.794" offset="0" /^> >> %generatePath%
	echo		^<stop id="linGradStops2Stop2" style="stop-color:#000000;stop-opacity:1" offset="0.086" /^> >> %generatePath%
	echo		^<stop id="linGradStops2Stop3" style="stop-color:#000000;stop-opacity:1" offset="0.888" /^> >> %generatePath%
	echo		^<stop id="linGradStops2Stop4" style="stop-color:#175200;stop-opacity:1" offset="1" /^> >> %generatePath%
	echo	^</linearGradient^> >> %generatePath%
	echo	^<linearGradient x1="324.264" y1="278.202" x2="471.757" y2="278.202" id="linGrad2" xlink:href="#linGradStops2" gradientUnits="userSpaceOnUse" gradientTransform="matrix(1,0,-0.052,1,14.579,0)" /^> >> %generatePath%
	
	echo 			^<!-- SWITCH DEFS --^> >> %generatePath%

	echo 			^<!-- gradient right panel --^> >> %generatePath%
	echo 			^<linearGradient >> %generatePath%
	echo 				id="gR"^> >> %generatePath%
	echo 				^<stop style="stop-color:#ef1b27" offset="0" /^> >> %generatePath%
	echo 				^<stop style="stop-color:#440d13" offset="0.555" /^> >> %generatePath%
	echo 				^<stop style="stop-color:#000000" offset="1" /^> >> %generatePath%
	echo 			^</linearGradient^> >> %generatePath%

	echo 			^<!-- gradient front panel --^> >> %generatePath%
	echo 			^<linearGradient >> %generatePath%
	echo 				id="gF"^> >> %generatePath%
	echo 				^<stop style="stop-color:#000000" offset="0" /^> >> %generatePath%
	echo 				^<stop style="stop-color:#19171b" offset="0.05" /^> >> %generatePath%
	echo 				^<stop style="stop-color:#000000" offset="0.15" /^> >> %generatePath%
	echo 				^<stop style="stop-color:#29292e" offset="0.3" /^> >> %generatePath%
	echo 				^<stop style="stop-color:#000000" offset="0.45" /^> >> %generatePath%
	echo 				^<stop style="stop-color:#1b1e1b" offset="0.55" /^> >> %generatePath%
	echo 				^<stop style="stop-color:#000000" offset="0.65" /^> >> %generatePath%
	echo 				^<stop style="stop-color:#272924" offset="0.75" /^> >> %generatePath%
	echo 				^<stop style="stop-color:#000000" offset="0.85" /^> >> %generatePath%
	echo 				^<stop style="stop-color:#2b272e" offset="0.9" /^> >> %generatePath%
	echo 				^<stop style="stop-color:#000000" offset="1" /^> >> %generatePath%
	echo 			^</linearGradient^> >> %generatePath%
	
	echo 			^<!-- gradient top panel --^> >> %generatePath%
	echo 			^<linearGradient >> %generatePath%
	echo 				id="gT"^> >> %generatePath%
	echo 				^<stop style="stop-color:#000000" offset="0" /^> >> %generatePath%
	echo 				^<stop style="stop-color:#000000" offset="0.125" /^> >> %generatePath%
	echo 				^<stop style="stop-color:#8d0000" offset="0.298" /^> >> %generatePath%
	echo 				^<stop style="stop-color:#000000" offset="0.75" /^> >> %generatePath%
	echo 				^<stop style="stop-color:#000000" offset="1" /^> >> %generatePath%
	echo 			^</linearGradient^> >> %generatePath%

	echo 			^<!-- GRADIENTS FOR SWITCH BODY --^> >> %generatePath%
	echo 			^<linearGradient >> %generatePath%
	echo 				x1="0.838" >> %generatePath%
	echo 				y1="1000.381" >> %generatePath%
	echo 				x2="79.136" >> %generatePath%
	echo 				y2="1000.381" >> %generatePath%
	echo 				id="GrT" >> %generatePath%
	echo 				xlink:href="#gT" >> %generatePath%
	echo 				gradientUnits="userSpaceOnUse" >> %generatePath%
	echo 				gradientTransform="matrix(1.5293816,0,0,1.5293816,-1.1509339,-551.84853)" >> %generatePath%
	echo 				spreadMethod="reflect" >> %generatePath%
	echo 			/^> >> %generatePath%
	echo 			^<linearGradient >> %generatePath%
	echo 				x1="0.838" >> %generatePath%
	echo 				y1="1015.188" >> %generatePath%
	echo 				x2="58.849" >> %generatePath%
	echo 				y2="1015.188" >> %generatePath%
	echo 				id="GrF" >> %generatePath%
	echo 				xlink:href="#gF" >> %generatePath%
	echo 				gradientUnits="userSpaceOnUse" >> %generatePath%
	echo 				gradientTransform="matrix(1.5293816,0,0,1.5293816,-1.1509339,-551.84853)" >> %generatePath%
	echo 				spreadMethod="repeat" >> %generatePath%
	echo 			/^> >> %generatePath%
	echo 			^<linearGradient >> %generatePath%
	echo 				x1="58.849" >> %generatePath%
	echo 				y1="1018.095" >> %generatePath%
	echo 				x2="79.136" >> %generatePath%
	echo 				y2="1018.095" >> %generatePath%
	echo 				id="GrR" >> %generatePath%
	echo 				xlink:href="#gR" >> %generatePath%
	echo 				gradientUnits="userSpaceOnUse" >> %generatePath%
	echo 				gradientTransform="matrix(1.5293816,0,0,1.5293816,-1.1509339,-551.84853)" >> %generatePath%
	echo 			/^> >> %generatePath%

	echo 			^<!-- FILTERS - BLURRING FOR THE LIGHTS --^> >> %generatePath%
	echo 			^<filter >> %generatePath%
	echo 				x="-0.523" >> %generatePath%
	echo 				y="-0.352" >> %generatePath%
	echo 				width="2.046" >> %generatePath%
	echo 				height="1.704" >> %generatePath%
	echo 				color-interpolation-filters="sRGB" >> %generatePath%
	echo 				id="bM"^> >> %generatePath%
	echo 				^<feGaussianBlur stdDeviation="0.131" /^> >> %generatePath%
	echo 			^</filter^> >> %generatePath%
	echo 			^<filter >> %generatePath%
	echo 				x="-0.519" >> %generatePath%
	echo 				y="-0.406" >> %generatePath%
	echo 				width="2.039" >> %generatePath%
	echo 				height="1.812" >> %generatePath%
	echo 				color-interpolation-filters="sRGB" >> %generatePath%
	echo 				id="bN"^> >> %generatePath%
	echo 				^<feGaussianBlur stdDeviation="0.117" /^> >> %generatePath%
	echo 			^</filter^> >> %generatePath%
	echo 			^<filter >> %generatePath%
	echo 				x="-0.516" >> %generatePath%
	echo 				y="-0.371" >> %generatePath%
	echo 				width="2.033" >> %generatePath%
	echo 				height="1.742" >> %generatePath%
	echo 				color-interpolation-filters="sRGB" >> %generatePath%
	echo 				id="bL"^> >> %generatePath%
	echo 				^<feGaussianBlur stdDeviation="0.151" /^> >> %generatePath%
	echo 			^</filter^> >> %generatePath%
	echo 			^<filter >> %generatePath%
	echo 				x="-0.561" >> %generatePath%
	echo 				y="-0.32" >> %generatePath%
	echo 				width="2.122" >> %generatePath%
	echo 				height="1.64" >> %generatePath%
	echo 				color-interpolation-filters="sRGB" >> %generatePath%
	echo 				id="bK"^> >> %generatePath%
	echo 				^<feGaussianBlur stdDeviation="0.156" /^> >> %generatePath%
	echo 			^</filter^> >> %generatePath%
	echo 			^<filter >> %generatePath%
	echo 				x="-0.483" >> %generatePath%
	echo 				y="-0.318" >> %generatePath%
	echo 				width="1.967" >> %generatePath%
	echo 				height="1.636" >> %generatePath%
	echo 				color-interpolation-filters="sRGB" >> %generatePath%
	echo 				id="bJ"^> >> %generatePath%
	echo 				^<feGaussianBlur stdDeviation="0.171" /^> >> %generatePath%
	echo 			^</filter^> >> %generatePath%
	echo 			^<filter >> %generatePath%
	echo 				x="-0.55" >> %generatePath%
	echo 				y="-0.267" >> %generatePath%
	echo 				width="2.1" >> %generatePath%
	echo 				height="1.535" >> %generatePath%
	echo 				color-interpolation-filters="sRGB" >> %generatePath%
	echo 				id="bI"^> >> %generatePath%
	echo 				^<feGaussianBlur stdDeviation="0.163" /^> >> %generatePath%
	echo 			^</filter^> >> %generatePath%
	echo 			^<filter >> %generatePath%
	echo 				x="-0.452" >> %generatePath%
	echo 				y="-0.299" >> %generatePath%
	echo 				width="1.904" >> %generatePath%
	echo 				height="1.598" >> %generatePath%
	echo 				color-interpolation-filters="sRGB" >> %generatePath%
	echo 				id="bH"^> >> %generatePath%
	echo 				^<feGaussianBlur stdDeviation="0.201" /^> >> %generatePath%
	echo 			^</filter^> >> %generatePath%
	echo 			^<filter >> %generatePath%
	echo 				x="-0.488" >> %generatePath%
	echo 				y="-0.285" >> %generatePath%
	echo 				width="1.976" >> %generatePath%
	echo 				height="1.570" >> %generatePath%
	echo 				color-interpolation-filters="sRGB" >> %generatePath%
	echo 				id="bG"^> >> %generatePath%
	echo 				^<feGaussianBlur stdDeviation="0.235" /^> >> %generatePath%
	echo 			^</filter^> >> %generatePath%
	echo 			^<filter >> %generatePath%
	echo 				x="-0.434" >> %generatePath%
	echo 				y="-0.307" >> %generatePath%
	echo 				width="1.869" >> %generatePath%
	echo 				height="1.614" >> %generatePath%
	echo 				color-interpolation-filters="sRGB" >> %generatePath%
	echo 				id="bF"^> >> %generatePath%
	echo 				^<feGaussianBlur stdDeviation="0.28" /^> >> %generatePath%
	echo 			^</filter^> >> %generatePath%
	echo 			^<filter >> %generatePath%
	echo 				x="-0.461" >> %generatePath%
	echo 				y="-0.295" >> %generatePath%
	echo 				width="1.923" >> %generatePath%
	echo 				height="1.590" >> %generatePath%
	echo 				color-interpolation-filters="sRGB" >> %generatePath%
	echo 				id="bE"^> >> %generatePath%
	echo 				^<feGaussianBlur stdDeviation="0.3" /^> >> %generatePath%
	echo 			^</filter^> >> %generatePath%
	echo 			^<filter >> %generatePath%
	echo 				x="-0.413" >> %generatePath%
	echo 				y="-0.318" >> %generatePath%
	echo 				width="1.826" >> %generatePath%
	echo 				height="1.637" >> %generatePath%
	echo 				color-interpolation-filters="sRGB" >> %generatePath%
	echo 				id="bD"^> >> %generatePath%
	echo 				^<feGaussianBlur stdDeviation="0.37" /^> >> %generatePath%
	echo 			^</filter^> >> %generatePath%
	echo 			^<filter >> %generatePath%
	echo 				x="-0.471" >> %generatePath%
	echo 				y="-0.291" >> %generatePath%
	echo 				width="1.943" >> %generatePath%
	echo 				height="1.582" >> %generatePath%
	echo 				color-interpolation-filters="sRGB" >> %generatePath%
	echo 				id="bC"^> >> %generatePath%
	echo 				^<feGaussianBlur stdDeviation="0.381" /^> >> %generatePath%
	echo 			^</filter^> >> %generatePath%
	echo 			^<filter >> %generatePath%
	echo 				x="-0.431" >> %generatePath%
	echo 				y="-0.308" >> %generatePath%
	echo 				width="1.862" >> %generatePath%
	echo 				height="1.617" >> %generatePath%
	echo 				color-interpolation-filters="sRGB" >> %generatePath%
	echo 				id="bB"^> >> %generatePath%
	echo 				^<feGaussianBlur stdDeviation="0.474" /^> >> %generatePath%
	echo 			^</filter^> >> %generatePath%
	echo 			^<filter >> %generatePath%
	echo 				x="-0.46" >> %generatePath%
	echo 				y="-0.295" >> %generatePath%
	echo 				width="1.920" >> %generatePath%
	echo 				height="1.591" >> %generatePath%
	echo 				color-interpolation-filters="sRGB" >> %generatePath%
	echo 				id="bA"^> >> %generatePath%
	echo 				^<feGaussianBlur stdDeviation="0.568" /^> >> %generatePath%
	echo 			^</filter^> >> %generatePath%
	
	echo 			^<!-- COMP DEFS --^> >> %generatePath%
	echo 			^<linearGradient id="gradStops1"^> >> %generatePath%
	echo 				^<stop style="stop-color:#1e1e1e" offset="0" /^> >> %generatePath%
	echo 				^<stop style="stop-color:#1e1e1e" offset="0.75" /^> >> %generatePath%
	echo 				^<stop style="stop-color:#1e1e1e;stop-opacity:0" offset="1" /^> >> %generatePath%
	echo 			^</linearGradient^> >> %generatePath%
	echo 			^<linearGradient id="gradStops2"^> >> %generatePath%
	echo 				^<stop style="stop-color:#ababab" offset="0" /^> >> %generatePath%
	echo 				^<stop style="stop-color:#bfbfbf;stop-opacity:0" offset="1" /^> >> %generatePath%
	echo 			^</linearGradient^> >> %generatePath%
	echo 			^<linearGradient id="gradStops3"^> >> %generatePath%
	echo 				^<stop style="stop-color:#919191" offset="0" /^> >> %generatePath%
	echo 				^<stop style="stop-color:#d7d7d7" offset="1" /^> >> %generatePath%
	echo 			^</linearGradient^> >> %generatePath%
	echo 			^<linearGradient id="gradStops4"^> >> %generatePath%
	echo 				^<stop style="stop-color:#737373" offset="0" /^> >> %generatePath%
	echo 				^<stop style="stop-color:#505050;stop-opacity:0" offset="1" /^> >> %generatePath%
	echo 			^</linearGradient^> >> %generatePath%
	echo 			^<linearGradient id="gradStops5"^> >> %generatePath%
	echo 				^<stop style="stop-color:#646464" offset="0" /^> >> %generatePath%
	echo 				^<stop style="stop-color:#828282" offset="1" /^> >> %generatePath%
	echo 			^</linearGradient^> >> %generatePath%
	echo 			^<linearGradient id="gradStops6"^> >> %generatePath%
	echo 				^<stop style="stop-color:#000000" offset="0" /^> >> %generatePath%
	echo 				^<stop style="stop-color:#323232" offset="0.257" /^> >> %generatePath%
	echo 				^<stop style="stop-color:#5f5f5f" offset="0.752" /^> >> %generatePath%
	echo 				^<stop style="stop-color:#646464;stop-opacity:0" offset="1" /^> >> %generatePath%
	echo 			^</linearGradient^> >> %generatePath%
	echo 			^<linearGradient id="gradStops7"^> >> %generatePath%
	echo 				^<stop style="stop-color:#000000" offset="0" /^> >> %generatePath%
	echo 				^<stop style="stop-color:#076400" offset="1" /^> >> %generatePath%
	echo 			^</linearGradient^> >> %generatePath%

	echo 			^<filter >> %generatePath%
	echo 				x="-0.13" >> %generatePath%
	echo 				y="-0.1" >> %generatePath%
	echo 				width="1.27" >> %generatePath%
	echo 				height="1.21" >> %generatePath%
	echo 				color-interpolation-filters="sRGB" >> %generatePath%
	echo 				id="filter1"^> >> %generatePath%
	echo 				^<feGaussianBlur stdDeviation="0.3" /^> >> %generatePath%
	echo 			^</filter^> >> %generatePath%

	echo 			^<linearGradient x1="212.63" y1="674.13" x2="308.33" y2="674.13" id="grad1" xlink:href="#gradStops7" gradientUnits="userSpaceOnUse" gradientTransform="matrix(0.82,0,0,0.76,29.38,193.72)" /^> >> %generatePath%
	echo 			^<linearGradient x1="168.72" y1="774.39" x2="291.78" y2="774.39" id="grad2" xlink:href="#gradStops6" gradientUnits="userSpaceOnUse" gradientTransform="matrix(0.82,0,0,0.76,29.38,174.25)" /^> >> %generatePath%
	echo 			^<linearGradient x1="240.91" y1="744.83" x2="250.78" y2="744.83" id="grad3" xlink:href="#gradStops5" gradientUnits="userSpaceOnUse" gradientTransform="matrix(0.82,0,0,0.28,29.38,535.45)" /^> >> %generatePath%
	echo 			^<linearGradient x1="250.78" y1="746.33" x2="268.31" y2="746.33" id="grad4" xlink:href="#gradStops4" gradientUnits="userSpaceOnUse" gradientTransform="matrix(0.82,0,0,0.28,29.38,535.45)" /^> >> %generatePath%
	echo 			^<linearGradient x1="208.02" y1="672.99" x2="315.57" y2="672.99" id="grad5" xlink:href="#gradStops3" gradientUnits="userSpaceOnUse" gradientTransform="matrix(0.82,0,0,0.76,29.38,193.72)" /^> >> %generatePath%
	echo 			^<linearGradient x1="315.57" y1="672.97" x2="323.77" y2="672.97" id="grad6" xlink:href="#gradStops2" gradientUnits="userSpaceOnUse" gradientTransform="matrix(0.82,0,0,0.76,29.38,193.72)" /^> >> %generatePath%
	echo 			^<linearGradient x1="236.23" y1="787.65" x2="292.28" y2="787.65" id="grad7" xlink:href="#gradStops1" gradientUnits="userSpaceOnUse" gradientTransform="matrix(0.82,0,0,0.76,29.38,174.25)" /^> >> %generatePath%

	echo 		^</defs^> >> %generatePath%
	echo 	^</svg^> >> %generatePath%
	
	REM Begin the wrapper, create the header, set up the nodes area
	echo 		^<div id="wrapper"^> >> %generatePath%
	echo 		^<div id="header"^>^</div^>  >> %generatePath%
	echo 		^<div id="nodes"^> >> %generatePath%

goto :eof


:EndTable

	REM We've finished a pass.  It might have been the first pass ever, so stop writing to reservations.
	set writeToReservations=False

	REM We finished a pass, so increment the current pass counter.
	set /a currentPass+=1

	echo 		^</div^> >> %generatePath%
	echo 	^</div^> >> %generatePath%
	echo ^</div^> >> %generatePath%

	echo ^<div id="spacer"^>^</div^> >> %generatePath%
	
	echo ^<div id="footer" style="width:100%%;clear:both;padding:0em;margin:0px" onmousedown="nodeClicked(0);"^> >> %generatePath%
	echo 	^<div id="netDisplayLogo"^> >> %generatePath%
	echo 		^<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="401.53564" height="107.58125"^> >> %generatePath%
	echo 			^<defs id="defs4"^> >> %generatePath%
	echo 				^<linearGradient id="rainbowStops"^> >> %generatePath%
	echo 					^<stop id="stop3757" style="stop-color:#000000" offset="0" /^> >> %generatePath%
	echo 					^<stop id="stop1" style="stop-color:#ff0000" offset="0.25" /^> >> %generatePath%
	echo 					^<stop id="stop2" style="stop-color:#00ff00" offset="0.5" /^> >> %generatePath%
	echo 					^<stop id="stop3" style="stop-color:#0000ff" offset="0.75" /^> >> %generatePath%
	echo 					^<stop id="stop3759" style="stop-color:#000000" offset="1" /^> >> %generatePath%
	echo 				^</linearGradient^> >> %generatePath%
	echo 				^<linearGradient >> %generatePath%
	echo 					x1="-1.0101526" >> %generatePath%
	echo 					y1="99.742355" >> %generatePath%
	echo 					x2="400.52548" >> %generatePath%
	echo 					y2="99.742355" >> %generatePath%
	echo 					id="rainbowGradient" >> %generatePath%
	echo 					xlink:href="#rainbowStops" >> %generatePath%
	echo 					gradientUnits="userSpaceOnUse" >> %generatePath%
	echo 					gradientTransform="matrix(1,0,0,0.53924052,0.24233143,852.57702)" >> %generatePath%
	echo 					spreadMethod="pad" >> %generatePath%
	echo 				/^> >> %generatePath%
	echo 				^<filter >> %generatePath%
	echo 					x="-0.2373163" >> %generatePath%
	echo 					y="-0.74528432" >> %generatePath%
	echo 					width="1.4746326" >> %generatePath%
	echo 					height="2.4905686" >> %generatePath%
	echo 					color-interpolation-filters="sRGB" >> %generatePath%
	echo 					id="filter3935"^> >> %generatePath%
	echo 					^<feGaussianBlur stdDeviation="46.896333" >> %generatePath%
	echo 				/^> >> %generatePath%
	echo 				^</filter^> >> %generatePath%
	echo 				^<filter color-interpolation-filters="sRGB" id="filter3855"^> >> %generatePath%
	echo 					^<feGaussianBlur stdDeviation="1.1038281" /^> >> %generatePath%
	echo 				^</filter^> >> %generatePath%
	echo 				^<mask id="netDisplayText"^> >> %generatePath%
	echo 					^<g >> %generatePath%
	echo 						transform="matrix(0.89356042,0,0,0.89356042,1.3363872,864.71988)" >> %generatePath%
	echo 						id="g3861" >> %generatePath%
	echo 						style="fill:#ff4dff;filter:url(#filter3855)" >> %generatePath%
	echo 					^> >> %generatePath%
	echo 						^<path d="m 32.40625,65.102646 0,-40.21875 5.8125,0 18.40625,29.15625 0.0625,0 0,-29.03125 5.03125,0 0,40.09375 -5.6875,0 -18.53125,-29.375 -0.09375,0 0,29.375 z" /^> >> %generatePath%
	echo 						^<path d="m 100.71875,63.758896 c -4.270863,1.416667 -8.187526,2.124999 -11.75,2.125 -5.83335,-10e-7 -10.317721,-1.499999 -13.453125,-4.5 -3.135423,-2.999993 -4.703129,-7.291656 -4.703125,-12.875 -4e-6,-5.270811 1.505202,-9.60414 4.515625,-13 3.010405,-3.3958 6.838526,-5.093715 11.484375,-5.09375 4.687475,3.5e-5 8.140596,1.406283 10.359375,4.21875 2.218717,2.812528 3.328095,7.187523 3.328125,13.125 l 0,1.96875 -23.125,0 c 0.458322,7.687508 4.604151,11.531254 12.4375,11.53125 3.312473,4e-6 6.947886,-0.791662 10.90625,-2.375 z m -23.15625,-18.65625 16.375,0 0,-0.875 c -2.8e-5,-6.124973 -2.552108,-9.18747 -7.65625,-9.1875 -2.458351,3e-5 -4.45314,0.885446 -5.984375,2.65625 -1.531262,1.770859 -2.44272,4.239606 -2.734375,7.40625 z" /^> >> %generatePath%
	echo 						^<path d="m 139.46875,65.071396 c -3.08336,0.541666 -6.06253,0.812499 -8.9375,0.8125 -5.02085,-10e-7 -8.43752,-0.901042 -10.25,-2.703125 -1.81251,-1.80208 -2.71876,-5.213535 -2.71875,-10.234375 l 0,-16.375 -8.46875,0 0,-4.625 8.46875,0 0,-7.3125 6.1875,0 0,7.3125 15.03125,0 0,4.625 -15.03125,0 0,17.375 c -2e-5,1.937509 0.11977,3.270841 0.35938,4 0.23956,0.729173 0.75518,1.364589 1.54687,1.90625 1.41664,0.937504 3.47914,1.406254 6.1875,1.40625 2.56247,4e-6 5.10413,-0.291663 7.625,-0.875 z" /^> >> %generatePath%
	echo 						^<path d="m 147.71875,65.102646 0,-40.09375 12.09375,0 c 13.3333,4e-5 19.99996,6.4167 20,19.25 -4e-5,5.937515 -1.44795,10.739593 -4.34375,14.40625 -1.81253,2.312504 -4.0469,3.963544 -6.70313,4.953125 -2.65627,0.989584 -6.19272,1.484375 -10.60937,1.484375 z m 6.15625,-4.625 3.09375,0 c 5.87498,5e-6 10.05727,-1.166661 12.54687,-3.5 2.48956,-2.333323 3.73435,-6.249986 3.73438,-11.75 -3e-5,-5.583308 -1.12503,-9.578096 -3.375,-11.984375 -2.25002,-2.406216 -6.00002,-3.60934 -11.25,-3.609375 l -4.75,0 z" /^> >> %generatePath%
	echo 						^<path d="m 200.03125,65.102646 0,-29.3125 -12.34375,0 0,-4.625 18.5,0 0,33.9375 z m -0.78125,-41.625 0,-7.71875 7.71875,0 0,7.71875 z" /^> >> %generatePath%
	echo 						^<path d="m 226.75,63.727646 0,-5.5625 c 4.77082,2.062505 8.89582,3.093754 12.375,3.09375 2.49998,4e-6 4.56769,-0.505204 6.20312,-1.515625 1.6354,-1.01041 2.4531,-2.286451 2.45313,-3.828125 -3e-5,-1.979156 -1.94794,-3.593737 -5.84375,-4.84375 l -6.59375,-2.15625 c -5.14584,-1.666649 -7.71876,-4.604146 -7.71875,-8.8125 -1e-5,-3.083305 1.16145,-5.46872 3.48437,-7.15625 2.32291,-1.687466 5.60936,-2.531215 9.85938,-2.53125 3.18748,3.5e-5 6.88539,0.489618 11.09375,1.46875 l 0,5 c -4.06253,-1.229137 -7.77086,-1.84372 -11.125,-1.84375 -2.25002,3e-5 -4.04689,0.40628 -5.39063,1.21875 -1.34376,0.812528 -2.01563,1.906277 -2.01562,3.28125 -1e-5,1.687524 1.53124,3.062522 4.59375,4.125 l 7.78125,2.71875 c 2.83331,1.000018 4.86976,2.192725 6.10937,3.578125 1.23956,1.38543 1.85935,3.182304 1.85938,5.390625 -3e-5,3.20834 -1.32295,5.765629 -3.96875,7.671875 -2.64586,1.90625 -6.19794,2.859374 -10.65625,2.859375 -3.89585,-10e-7 -8.06251,-0.71875 -12.5,-2.15625 z" /^> >> %generatePath%
	echo 						^<path d="m 265.125,77.446396 0,-46.28125 6.15625,0 0,6.375 c 2.97915,-4.749968 6.67706,-7.124965 11.09375,-7.125 3.85414,3.5e-5 6.8906,1.484408 9.10937,4.453125 2.21872,2.968777 3.32809,7.015648 3.32813,12.140625 -4e-5,5.625012 -1.31253,10.177091 -3.9375,13.65625 -2.62503,3.479168 -6.06253,5.218749 -10.3125,5.21875 -3.64585,-10e-7 -6.7396,-1.541666 -9.28125,-4.625 l 0,16.1875 z m 6.15625,-20.8125 c 2.85415,3.083339 5.66665,4.625004 8.4375,4.625 2.70831,4e-6 4.80727,-1.192703 6.29687,-3.578125 1.48956,-2.385407 2.23435,-5.723945 2.23438,-10.015625 -3e-5,-7.999975 -2.38544,-11.999971 -7.15625,-12 -3.47918,2.9e-5 -6.75001,2.166694 -9.8125,6.5 z" /^> >> %generatePath%
	echo 						^<path d="m 316.65625,65.102646 0,-44.71875 -13.09375,0 0,-4.625 19.28125,0 0,49.34375 z" /^> >> %generatePath%
	echo 						^<path d="m 362.875,61.008896 c -3.72919,3.125001 -7.44794,4.687499 -11.15625,4.6875 -3.10418,-10e-7 -5.66147,-0.885416 -7.67188,-2.65625 -2.01042,-1.77083 -3.01562,-4.010411 -3.01562,-6.71875 0,-3.520821 1.56249,-6.354152 4.6875,-8.5 3.12499,-2.145814 7.24998,-3.21873 12.375,-3.21875 l 3.8125,0 0,-2.90625 c -3e-5,-2.395808 -0.53127,-4.104139 -1.59375,-5.125 -1.06252,-1.020804 -2.82294,-1.53122 -5.28125,-1.53125 -3.56251,3e-5 -7.25001,1.000029 -11.0625,3 l 0,-5.28125 c 4.37499,-1.562466 8.47915,-2.343715 12.3125,-2.34375 4.31248,3.5e-5 7.35935,0.8542 9.14062,2.5625 1.78122,1.708364 2.67185,4.656277 2.67188,8.84375 l 0,14.21875 c -3e-5,2.041674 0.21872,3.432297 0.65625,4.171875 0.43747,0.739587 1.26038,1.109379 2.46875,1.109375 0.3958,4e-6 1.04163,-0.104163 1.9375,-0.3125 l 0.5625,3.6875 c -2.06253,0.666666 -3.62503,0.999999 -4.6875,1 -3.0417,-10e-7 -5.09378,-1.562499 -6.15625,-4.6875 z m -0.96875,-4 0,-8.5625 -1.84375,0 c -8.43751,1.7e-5 -12.65626,2.281264 -12.65625,6.84375 -10e-6,1.645841 0.54166,2.968757 1.625,3.96875 1.08332,1.000005 2.52082,1.500004 4.3125,1.5 2.68748,4e-6 5.54164,-1.249994 8.5625,-3.75 z" /^> >> %generatePath%
	echo 						^<path d="m 379.84375,77.446396 0,-4.625 2.5,0 c 2.33332,-8e-6 4.03124,-0.375007 5.09375,-1.125 1.06249,-0.750006 2.17707,-2.364588 3.34375,-4.84375 l 1.53125,-3.25 -14.25,-32.4375 6.375,0 11.09375,25.40625 11.1875,-25.40625 5.53125,0 -17.09375,38.28125 c -1.33335,2.979159 -2.9271,5.057282 -4.78125,6.234375 -1.85418,1.177072 -4.48959,1.765613 -7.90625,1.765625 z" /^> >> %generatePath%
	echo 				  ^</g^> >> %generatePath%
	echo 				^</mask^> >> %generatePath%
	echo 			^</defs^> >> %generatePath%

	echo 			^<g transform="translate(0.76782227,-852.57153)" ^> >> %generatePath%
	echo 			^<rect >> %generatePath%
	echo 			   width="401.53564" >> %generatePath%
	echo 			   height="107.58125" >> %generatePath%
	echo 			   x="-0.76782227" >> %generatePath%
	echo 			   y="852.57153" >> %generatePath%
	echo 			   mask="url(#netDisplayText)" >> %generatePath%
	echo 			   id="rect2985" >> %generatePath%
	echo 			   style="fill:url(#rainbowGradient)" /^> >> %generatePath%
	echo 			^</g^> >> %generatePath%

	echo 		^</svg^> >> %generatePath%
	echo 	^</div^> >> %generatePath%

	echo 	^<div id="searchBox"^> >> %generatePath%
	echo 		^<h1^> >> %generatePath%
	echo 			^<form method="get" action="http://www.google.com/search"^>  >> %generatePath%
	echo 				^<input type="text" id="search" name="q" size="31" maxlength="255" /^>  >> %generatePath%
	echo 				^<input type="submit" value="Google Search" id="search" onclick="GlowSearchTerms()"/^>^<br/^>  >> %generatePath%
	echo 				^<input type="button" name="web" value="web" onclick="this.parentNode.setAttribute('action','http://google.com/search');this.parentNode.web.setAttribute('style','text-shadow: 2px 0px 5px #FFFFFF, -2px 0px 5px #FFFFFF; color:#FFFFFF'); this.parentNode.img.setAttribute('style','text-shadow: 1px 0px 5px #666666, -1px 0px 5px #666666; color:#AAAAAA')"^>  >> %generatePath%
	echo 				^<input type="button" name="img" value="img" onclick="this.parentNode.setAttribute('action','http://images.google.com/images'); this.parentNode.img.setAttribute('style','text-shadow: 2px 0px 5px #FFFFFF, -2px 0px 5px #FFFFFF; color:#FFFFFF'); this.parentNode.web.setAttribute('style','text-shadow: 1px 0px 5px #666666, -1px 0px 5px #666666;; color:#AAAAAA')"^>  >> %generatePath%
	echo 			^</form^> >> %generatePath%
	echo 			^<p id="lastRefresh"^>Last refresh  >> %generatePath%
	echo 			^<script language="javascript"^>  >> %generatePath%
	echo 				var MyDate = new Date();  >> %generatePath%
	echo 				var MyDateString;  >> %generatePath%
	echo 				MyDateString = ('0' + (MyDate.getHours())).slice(-2) + ':' + ('0' + (MyDate.getMinutes())).slice(-2) + ':' + ('0' + MyDate.getSeconds()).slice(-2);  >> %generatePath%
	echo 				document.write(MyDateString)  >> %generatePath%
	echo 			^</script^>^</p^> >> %generatePath%

	REM Get the current time and parse it so it looks presentable
	for /f "tokens=1-3 delims=." %%t in ("%time: =0%") do set parsetime=%%t
	for /f "tokens=1-4 delims=:" %%i in ("%parsetime%") do (
	set hour=%%i
	set minute=%%j
	set second=%%k
	)

	echo ^<p id="generatedAt"^>Generated at >> %generatePath%
	echo %hour%:%minute%:%second%^</p^> >> %generatePath%
	
	echo 		^</h1^> >> %generatePath%
	echo 	^</div^> >> %generatePath%
	echo ^</body^> >> %generatePath%
	echo ^</html^> >> %generatePath%
	
	REM We're done, copy the temp file to the live file
	cd..

	copy "%workingDir%\%generatePath%" %copyPath% /Y >nul

	REM Don't show the intro next time... once is enough
	set skipIntro=1
GOTO Init


:DrawMFP

	echo ^<svg class="MFP" xmlns="http://www.w3.org/2000/svg" version="1.1" width="128" height="134"^> >> %generatePath%
	echo ^<g transform="translate(0,-918.362)"^> >> %generatePath%
	echo ^<path d="m 25.948,940.869 76.103,0 -1.944,18.331 0,90.269 -71.382,0 0,-89.435 z" style="fill:#808080;stroke:#000000;stroke-width:2.488;stroke-linejoin:round" /^> >> %generatePath%
	echo ^<rect width="50.689" height="4.027" x="38.863" y="930.453" style="fill:#666666;stroke:#1a1a1a;stroke-width:0" /^> >> %generatePath%
	echo ^<path d="m 29.836,1031.416 69.715,0" style="stroke:#000000;stroke-width:0.972" /^> >> %generatePath%
	echo ^<rect width="36.383" height="4.762" x="46.502" y="1042.981" style="fill:#1a1a1a;stroke:#1a1a1a;stroke-width:0.972;stroke-linejoin:round" /^> >> %generatePath%
	echo ^<rect width="36.383" height="4.762" x="46.505" y="1025.686" style="fill:#1a1a1a;stroke:#1a1a1a;stroke-width:0.972;stroke-linejoin:round" /^> >> %generatePath%
	echo ^<rect width="40.829" height="16.665" x="43.585" y="967.533" style="fill:#1a1a1a;stroke:#1a1a1a;stroke-width:0.972;stroke-linejoin:round" /^> >> %generatePath%
	echo ^<path d="m 29.753,1013.64 69.715,0" style="stroke:#000000;stroke-width:0.972" /^> >> %generatePath%
	echo ^<path d="m 26.225,939.48 6.666,-6.11 60.272,0 8.61,6.666 z" style="fill:#b3b3b3;stroke:#000000;stroke-width:1.555;stroke-linejoin:round" /^> >> %generatePath%
	echo ^<path d="m 48.723,934.689 15.762,0 1.041,2.985 -18.053,0 z" id="MFPscreenback" style="fill:#414141;fill-opacity:1;stroke:#000000;stroke-width:0.194" /^> >> %generatePath%
	echo ^<path d="m 32.891,932.744 2.291,-10.762 50.203,-1.874 0.902,1.597 -32.01,3.541 1.18,4.235 0.833,0.416 35.76,0 1.041,2.708 -7.429,0 0,-0.833 -0.972,-0.486 -44.717,0 -0.833,0.416 -0.069,0.972 z" style="fill:#b3b3b3;stroke:#000000;stroke-width:0.194" /^> >> %generatePath%
	
	echo ^<path d="m 48.723,934.689 15.762,0 1.041,2.985 -18.053,0 z" style="fill:#33CCFF;stroke:#000000;stroke-width:0.194" class="light" fill-opacity="0" >> %generatePath%
	echo 	id="light%lightId%" /^> >> %generatePath%
	set /a lightId+=1
	
	echo ^</g^> >> %generatePath%
	echo ^</svg^> >> %generatePath%

goto DoneDraw


:DrawPhone

	echo ^<svg class="phone" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" width="128" height="134"^> >> %generatePath%
	echo	^<!-- Black background --^> >> %generatePath%
	echo	^<g transform="matrix(0.197,0,0,0.232,1.463,-31.192)"^> >> %generatePath%
	echo		^<rect width="752.857" height="645" x="-39.847" y="113.045" style="fill:#000000" /^> >> %generatePath%
	echo	^</g^> >> %generatePath%
	echo	^<!-- Phone body --^> >> %generatePath%
	echo	^<g transform="matrix(0.247,0,0,0.247,-9.635,-43.648)"^> >> %generatePath%
	echo		^<path d="m 175,174.505 371.428,72.857 -143.571,480 L 47.857,596.647 z" style="fill:#333333"/^> >> %generatePath%
	echo	^</g^> >> %generatePath%
	echo	^<!-- Phone screen --^> >> %generatePath%
	echo	^<g transform="matrix(0.247,0,0,0.247,-9.635,-43.648)"^> >> %generatePath%
	echo		^<path d="m 337.362,240.199 -12.883,43.436 134.807,32.569 12.312,-44.533 z" id="phoneScreen" style="fill:#008080;stroke:url(#linGrad2);stroke-width:1px" /^> >> %generatePath%
	echo	^</g^> >> %generatePath%
	echo	^<g transform="matrix(0.248,0,0,0.248,-9.635,-43.648)"^> >> %generatePath%
	echo		^<!-- Phone receiver --^> >> %generatePath%
	echo		^<g transform="matrix(1.424,0.011,-0.011,1.567,-104.127,-154.568)" style="fill:#000000"^> >> %generatePath%
	echo			^<path d="m 196.979,260.907 c -3.763,81.248 -12.963,107.412 -55.053,153.543 l 73.236,24.748 c 7.707,-79.253 9.428,-95.796 53.538,-158.088 z" style="stroke:#1a1a1a;stroke-width:1px" /^> >> %generatePath%
	echo			^<path d="m 270.714,272.005 a 38.928,37.5 0 1 1 -77.857,0 38.928,37.5 0 1 1 77.857,0 z" style="stroke-width:0" /^> >> %generatePath%
	echo			^<path d="m 270.714,272.005 a 38.928,37.5 0 1 1 -77.857,0 38.928,37.5 0 1 1 77.857,0 z" transform="translate(-53.214,154.642)" style="stroke:#666666;stroke-width:0" /^> >> %generatePath%
	echo		^</g^> >> %generatePath%
	echo		^<!-- Text on phone screen --^> >> %generatePath%
	echo		^<g transform="translate(-5.892,4.107)" style="fill:#000000"^> >> %generatePath%
	echo			^<!--I--^>^<path d="m 343.931,250.138 1.817,-7.874 1.041,0.241 -1.817,7.874 z" fill-opacity="0" class="phoneLetter" id="phoneLetter%phoneId%" /^> >> %generatePath%
		set /a phoneId+=1
	echo			^<!--'--^>^<path d="m 347.861,245.688 0.092,-1.528 0.303,-1.315 1.101,0.254 -0.303,1.315 -0.597,1.412 z" fill-opacity="0" class="phoneLetter" id="phoneLetter%phoneId%" /^> >> %generatePath%
		set /a phoneId+=1
	echo			^<!--m--^>^<path d="m 348.787,251.259 1.316,-5.704 0.864,0.199 -0.184,0.8 c 0.243,-0.238 0.533,-0.407 0.869,-0.509 0.336,-0.101 0.694,-0.108 1.074,-0.021 0.422,0.097 0.748,0.265 0.978,0.503 0.229,0.237 0.363,0.527 0.402,0.867 0.604,-0.561 1.269,-0.759 1.992,-0.592 0.565,0.13 0.964,0.387 1.196,0.771 0.232,0.383 0.272,0.901 0.122,1.552 l -0.903,3.915 -0.961,-0.221 0.829,-3.593 c 0.089,-0.386 0.122,-0.672 0.098,-0.856 -0.023,-0.184 -0.105,-0.347 -0.246,-0.489 -0.14,-0.141 -0.322,-0.238 -0.544,-0.289 -0.401,-0.092 -0.764,-0.036 -1.091,0.169 -0.326,0.205 -0.557,0.602 -0.693,1.189 l -0.765,3.313 -0.966,-0.223 0.855,-3.706 c 0.099,-0.429 0.094,-0.77 -0.013,-1.021 -0.107,-0.251 -0.34,-0.418 -0.699,-0.5 -0.272,-0.062 -0.54,-0.049 -0.804,0.04 -0.264,0.089 -0.479,0.26 -0.647,0.512 -0.167,0.251 -0.311,0.637 -0.431,1.156 l -0.683,2.959 z" fill-opacity="0" class="phoneLetter" id="phoneLetter%phoneId%" /^> >> %generatePath%
		set /a phoneId+=1
	echo			^<!--a--^>^<path d="m 364.896,254.237 c -0.428,0.221 -0.822,0.356 -1.182,0.405 -0.36,0.048 -0.73,0.029 -1.109,-0.058 -0.626,-0.144 -1.072,-0.408 -1.338,-0.792 -0.265,-0.383 -0.343,-0.813 -0.233,-1.29 0.064,-0.279 0.186,-0.519 0.367,-0.721 0.18,-0.201 0.389,-0.348 0.627,-0.44 0.238,-0.092 0.494,-0.144 0.768,-0.156 0.201,-0.006 0.498,0.011 0.892,0.053 0.802,0.087 1.402,0.108 1.80,0.065 0.034,-0.131 0.055,-0.215 0.063,-0.251 0.091,-0.393 0.063,-0.692 -0.081,-0.895 -0.196,-0.275 -0.538,-0.469 -1.025,-0.581 -0.454,-0.104 -0.808,-0.102 -1.062,0.007 -0.253,0.109 -0.478,0.354 -0.676,0.734 l -0.915,-0.347 c 0.179,-0.384 0.396,-0.678 0.65,-0.882 0.254,-0.203 0.583,-0.329 0.986,-0.377 0.403,-0.048 0.85,-0.015 1.34,0.097 0.486,0.112 0.869,0.261 1.147,0.445 0.277,0.184 0.468,0.38 0.571,0.587 0.103,0.206 0.152,0.449 0.148,0.727 -0.006,0.172 -0.058,0.473 -0.157,0.902 l -0.297,1.289 c -0.207,0.898 -0.318,1.471 -0.331,1.719 -0.013,0.247 0.014,0.494 0.086,0.741 l -1.009,-0.233 c -0.054,-0.223 -0.064,-0.47 -0.031,-0.748 z m 0.417,-2.177 c -0.383,0.062 -0.938,0.062 -1.663,6.7e-4 -0.41,-0.034 -0.706,-0.034 -0.887,-0.001 -0.181,0.033 -0.332,0.108 -0.453,0.226 -0.121,0.117 -0.201,0.259 -0.24,0.428 -0.059,0.257 -0.011,0.495 0.143,0.712 0.155,0.216 0.421,0.368 0.797,0.455 0.372,0.086 0.722,0.081 1.05,-0.015 0.327,-0.096 0.592,-0.269 0.793,-0.521 0.154,-0.194 0.28,-0.504 0.378,-0.93 z" fill-opacity="0" class="phoneLetter" id="phoneLetter%phoneId%" /^> >> %generatePath%
		set /a phoneId+=1
	echo			^<!--p--^>^<path d="m 369.681,258.385 1.821,-7.89 0.88,0.203 -0.171,0.741 c 0.274,-0.242 0.559,-0.405 0.854,-0.49 0.29,-0.084 0.628,-0.084 1.001,0.002 0.487,0.112 0.887,0.337 1.202,0.673 0.314,0.336 0.513,0.755 0.598,1.255 0.084,0.5 0.063,1.022 -0.062,1.566 -0.134,0.583 -0.36,1.085 -0.678,1.503 -0.317,0.418 -0.704,0.706 -1.161,0.863 -0.456,0.156 -0.905,0.184 -1.345,0.082 -0.322,-0.074 -0.595,-0.209 -0.82,-0.404 -0.224,-0.195 -0.395,-0.415 -0.512,-0.661 l -0.641,2.776 z m 2.031,-4.803 c -0.169,0.734 -0.146,1.31 0.07,1.73 0.216,0.419 0.535,0.678 0.958,0.775 0.429,0.099 0.839,0.002 1.229,-0.29 0.39,-0.292 0.673,-0.82 0.849,-1.583 0.167,-0.726 0.143,-1.305 -0.071,-1.736 -0.215,-0.43 -0.53,-0.694 -0.946,-0.789 -0.411,-0.095 -0.82,0.013 -1.226,0.325 -0.405,0.311 -0.693,0.834 -0.862,1.568 z" fill-opacity="0" class="phoneLetter" id="phoneLetter%phoneId%" /^> >> %generatePath%
		set /a phoneId+=1
	echo			^<!--h--^>^<path d="m 376.308,257.613 1.817,-7.874 0.966,0.223 -0.652,2.825 c 0.571,-0.418 1.201,-0.548 1.889,-0.389 0.422,0.097 0.77,0.265 1.043,0.503 0.273,0.238 0.442,0.52 0.509,0.844 0.066,0.324 0.035,0.766 -0.093,1.324 l -0.834,3.614 -0.966,-0.223 0.834,-3.614 c 0.111,-0.483 0.088,-0.859 -0.07,-1.128 -0.158,-0.268 -0.429,-0.447 -0.812,-0.535 -0.286,-0.066 -0.573,-0.054 -0.859,0.036 -0.286,0.09 -0.513,0.25 -0.679,0.479 -0.166,0.229 -0.300,0.567 -0.404,1.015 l -0.720,3.12 z" fill-opacity="0" class="phoneLetter" id="phoneLetter%phoneId%" /^> >> %generatePath%
		set /a phoneId+=1
	echo			^<!--o--^>^<path d="m 382.73,256.091 c 0.243,-1.0563 0.718,-1.771 1.422,-2.143 0.588,-0.309 1.234,-0.382 1.94,-0.219 0.784,0.181 1.365,0.585 1.744,1.214 0.379,0.628 0.464,1.396 0.254,2.302 -0.169,0.734 -0.412,1.286 -0.73,1.655 -0.317,0.37 -0.713,0.622 -1.187,0.758 -0.474,0.135 -0.96,0.145 -1.458,0.031 -0.798,-0.184 -1.384,-0.589 -1.758,-1.215 -0.374,-0.625 -0.45,-1.42 -0.227,-2.383 z m 0.993,0.229 c -0.168,0.73 -0.135,1.314 0.099,1.751 0.234,0.437 0.593,0.711 1.077,0.822 0.479,0.11 0.921,0.02 1.324,-0.271 0.403,-0.291 0.69,-0.811 0.863,-1.56 0.162,-0.705 0.126,-1.276 -0.11,-1.714 -0.236,-0.437 -0.593,-0.711 -1.069,-0.821 -0.483,-0.111 -0.926,-0.023 -1.328,0.264 -0.402,0.288 -0.687,0.797 -0.856,1.527 z" fill-opacity="0" class="phoneLetter" id="phoneLetter%phoneId%" /^> >> %generatePath%
		set /a phoneId+=1
	echo			^<!--n--^>^<path d="m 388.554,260.44 1.316,-5.704 0.87,0.2 -0.187,0.811 c 0.563,-0.53 1.241,-0.703 2.032,-0.521 0.343,0.079 0.645,0.214 0.905,0.404 0.259,0.19 0.438,0.401 0.535,0.635 0.097,0.233 0.142,0.494 0.135,0.783 -0.006,0.187 -0.06,0.504 -0.163,0.952 l -0.809,3.507 -0.966,-0.223 0.801,-3.469 c 0.091,-0.393 0.121,-0.697 0.091,-0.909 -0.03,-0.212 -0.127,-0.399 -0.292,-0.559 -0.164,-0.16 -0.376,-0.27 -0.633,-0.33 -0.411,-0.095 -0.797,-0.046 -1.156,0.145 -0.359,0.192 -0.623,0.653 -0.791,1.384 l -0.719,3.115 z" fill-opacity="0" class="phoneLetter" id="phoneLetter%phoneId%" /^> >> %generatePath%
		set /a phoneId+=1
	echo			^<!--e--^>^<path d="m 399.006,260.919 0.97,0.354 c -0.292,0.547 -0.688,0.932 -1.189,1.156 -0.5,0.223 -1.081,0.259 -1.744,0.106 -0.834,-0.192 -1.436,-0.602 -1.806,-1.228 -0.37,-0.626 -0.448,-1.403 -0.234,-2.331 0.221,-0.959 0.64,-1.647 1.257,-2.063 0.616,-0.415 1.318,-0.532 2.106,-0.351 0.762,0.176 1.325,0.579 1.689,1.21 0.363,0.63 0.436,1.417 0.219,2.358 -0.013,0.057 -0.035,0.142 -0.064,0.256 l -4.253,-0.982 c -0.108,0.634 -0.042,1.155 0.199,1.562 0.241,0.406 0.6,0.664 1.077,0.774 0.354,0.081 0.678,0.058 0.972,-0.069 0.293,-0.128 0.561,-0.379 0.802,-0.754 z m -2.813,-2.295 3.185,0.735 c 0.067,-0.489 0.029,-0.877 -0.115,-1.163 -0.221,-0.443 -0.578,-0.721 -1.068,-0.835 -0.444,-0.102 -0.851,-0.04 -1.222,0.187 -0.371,0.227 -0.63,0.586 -0.777,1.076 z" fill-opacity="0" class="phoneLetter" id="phoneLetter%phoneId%" /^> >> %generatePath%
		set /a phoneId+=1
	echo		^</g^> >> %generatePath%
	echo	^</g^> >> %generatePath%
	echo	^<g transform="matrix(0.247,0,0,0.247,-9.635,-43.648)"^> >> %generatePath%
	echo		^<!-- Three buttons just below the phone screen --^> >> %generatePath%
	echo		^<g transform="matrix(0.967,0.238,-0.232,0.972,0,0)" style="fill:#999999;stroke:url(#linGrad1);stroke-width:2"^> >> %generatePath%
	echo			^<rect width="42.039" height="10.838" ry="1.937" x="381.733" y="201.227" /^> >> %generatePath%
	echo			^<rect width="42.039" height="10.838" ry="1.937" x="480.153" y="201.100" /^> >> %generatePath%
	echo			^<rect width="42.039" height="10.838" ry="1.937" x="430.765" y="201.134" /^> >> %generatePath%
	echo		^</g^> >> %generatePath%
	echo		^<g transform="matrix(0.284,0.05,-0.05,0.284,250.43,391.099)" style="stroke:#000000"^> >> %generatePath%
	echo			^<!-- OK button background --^> >> %generatePath%
	echo			^<path d="m 358.571,-166.209 a 54.285,54.285 0 1 1 -108.571,0 54.285,54.285 0 1 1 108.571,0 z" transform="matrix(1.283,-1.283,1.283,1.283,224.11,380.505)" style="fill:#000000" /^> >> %generatePath%
	echo			^<path d="m 358.571,-166.209 a 54.285,54.285 0 1 1 -108.571,0 54.285,54.285 0 1 1 108.571,0 z" transform="matrix(1.256,-1.256,1.256,1.256,227.605,368.452)" style="fill:#444444" /^> >> %generatePath%
	echo			^<!-- Diagonal lines on OK button --^> >> %generatePath%
	echo			^<path d="M 333.055,-154.664 469.127,-290.736" style="stroke-width:3px" /^> >> %generatePath%
	echo			^<path d="M 469.126,-154.664 333.055,-290.736" style="stroke-width:3px" /^> >> %generatePath%
	echo			^<!-- Central circle of OK button --^> >> %generatePath%
	echo			^<path d="m 358.571,-166.209 a 54.285,54.285 0 1 1 -108.571,0 54.285,54.285 0 1 1 108.571,0 z" transform="matrix(0.707,-0.707,0.707,0.707,303.456,109.989)" style="fill:#999999" /^> >> %generatePath%
	echo			^<!-- Arrows on OK button --^> >> %generatePath%
	echo			^<g transform="translate(-0.367,0.766)" style="fill:#000000;stroke:none"^> >> %generatePath%
	echo				^<!-- Left arrow on OK button --^>^<path d="m 338.928,-236.209 0,26.766 -23.449,-13.538 z" /^> >> %generatePath%
	echo				^<!-- Right arrow on OK button --^>^<path d="m 463.989,-237.449 0,26.766 23.449,-13.538 z"/^> >> %generatePath%
	echo				^<!-- Up arrow on OK button --^>^<path d="m 389.407,-285.784 26.766,0 -13.538,-23.449 z"/^> >> %generatePath%
	echo				^<!-- Down arrow on OK button --^>^<path d="m 388.045,-161.148 26.766,0 -13.538,23.449 z"/^> >> %generatePath%
	echo			^</g^> >> %generatePath%
	echo			^<!-- OK text on OK button --^> >> %generatePath%
	echo			^<g transform="translate(-148.947,25.651)" style="fill:none"^> >> %generatePath%
	echo				^<path d="m 548.214,-282.637 a 21.428,21.428 0 1 1 -42.857,0 21.428,21.428 0 1 1 42.857,0 z" transform="matrix(0.479,0,0,0.533,285.843,-98.011)" style="stroke-width:11"/^> >> %generatePath%
	echo				^<path d="m 556.071,-262.89 0,29.081" style="stroke-width:6" /^> >> %generatePath%
	echo				^<path d="m 557.853,-251.544 10.361,-10.918 6.073,0 -10.54,10.39 10.423,17.798 -6.315,0 -9.093,-15.525" style="fill:#000000;stroke-width:1px" /^> >> %generatePath%
	echo			^</g^> >> %generatePath%
	echo		^</g^> >> %generatePath%
	echo		^<!-- Number buttons on phone --^> >> %generatePath%
	echo		^<g transform="matrix(0.976,0,0,0.956,-245.305,74.18)" style="fill:#2ca089;stroke:#004455;stroke-width:10"^> >> %generatePath%
	echo			^<!-- 1 --^>^<path d="m 370.726,-34.057 a 29.799,29.799 0 1 1 -59.599,0 29.799,29.799 0 1 1 59.599,0 z" transform="matrix(0.392,0.199,-0.199,0.392,414.602,394.641)" /^> >> %generatePath%
	echo			^<!-- 2 --^>^<path d="m 370.726,-34.057 a 29.799,29.799 0 1 1 -59.599,0 29.799,29.799 0 1 1 59.599,0 z" transform="matrix(0.396,0.201,-0.201,0.396,447.242,402.58)" /^> >> %generatePath%
	echo			^<!-- 3 --^>^<path d="m 370.726,-34.057 a 29.799,29.799 0 1 1 -59.599,0 29.799,29.799 0 1 1 59.599,0 z" transform="matrix(0.4,0.203,-0.203,0.4,479.868,410.513)" /^> >> %generatePath%
	echo			^<!-- 4 --^>^<path d="m 370.726,-34.057 a 29.799,29.799 0 1 1 -59.599,0 29.799,29.799 0 1 1 59.599,0 z" transform="matrix(0.392,0.199,-0.199,0.392,405.963,429.291)" /^> >> %generatePath%
	echo			^<!-- 5 --^>^<path d="m 370.726,-34.057 a 29.799,29.799 0 1 1 -59.599,0 29.799,29.799 0 1 1 59.599,0 z" transform="matrix(0.396,0.201,-0.201,0.396,438.603,437.229)" /^> >> %generatePath%
	echo			^<!-- 6 --^>^<path d="m 370.726,-34.057 a 29.799,29.799 0 1 1 -59.599,0 29.799,29.799 0 1 1 59.599,0 z" transform="matrix(0.4,0.203,-0.203,0.4,471.229,445.163)" /^> >> %generatePath%
	echo			^<!-- 7 --^>^<path d="m 370.726,-34.057 a 29.799,29.799 0 1 1 -59.599,0 29.799,29.799 0 1 1 59.599,0 z" transform="matrix(0.392,0.199,-0.199,0.392,397.324,463.94)" /^> >> %generatePath%
	echo			^<!-- 8 --^>^<path d="m 370.726,-34.057 a 29.799,29.799 0 1 1 -59.599,0 29.799,29.799 0 1 1 59.599,0 z" transform="matrix(0.396,0.201,-0.201,0.396,429.964,471.879)" /^> >> %generatePath%
	echo			^<!-- 9 --^>^<path d="m 370.726,-34.057 a 29.799,29.799 0 1 1 -59.599,0 29.799,29.799 0 1 1 59.599,0 z" transform="matrix(0.4,0.203,-0.203,0.4,462.59,479.812)" /^> >> %generatePath%
	echo			^<!-- * --^>^<path d="m 370.726,-34.057 a 29.799,29.799 0 1 1 -59.599,0 29.799,29.799 0 1 1 59.599,0 z" transform="matrix(0.392,0.199,-0.199,0.392,388.684,498.59)" /^> >> %generatePath%
	echo			^<!-- 0 --^>^<path d="m 370.726,-34.057 a 29.799,29.799 0 1 1 -59.599,0 29.799,29.799 0 1 1 59.599,0 z" transform="matrix(0.396,0.201,-0.201,0.396,421.325,506.528)" /^> >> %generatePath%
	echo			^<!-- # --^>^<path d="m 370.726,-34.057 a 29.799,29.799 0 1 1 -59.599,0 29.799,29.799 0 1 1 59.599,0 z" transform="matrix(0.4,0.203,-0.203,0.4,453.951,514.461)" /^> >> %generatePath%
	echo		^</g^> >> %generatePath%
	echo		^<!-- Left buttons --^> >> %generatePath%
	echo		^<g transform="matrix(1.133,0.237,0,1.133,-383.489,-93.878)" style="fill:#808080;stroke:#000000;stroke-width:4;stroke-linejoin:round"^> >> %generatePath%
	echo			^<rect width="15.77" height="10.868" x="654.958" y="399.022" transform="matrix(1,0,-0.253,0.967,0,0)" /^> >> %generatePath%
	echo			^<rect width="15.77" height="10.868" x="654.257" y="420.071" transform="matrix(1,0,-0.253,0.967,0,0)" /^> >> %generatePath%
	echo			^<rect width="15.77" height="10.868" x="654.044" y="441.119" transform="matrix(1,0,-0.253,0.967,0,0)" /^> >> %generatePath%
	echo			^<rect width="15.77" height="10.868" x="653.62" y="462.168" transform="matrix(1,0,-0.253,0.967,0,0)" /^> >> %generatePath%
	echo		^</g^> >> %generatePath%
	echo		^<!-- Right buttons --^> >> %generatePath%
	echo		^<g transform="matrix(1.133,0.237,0,1.133,-217.033,-55.428)" style="fill:#808080;stroke:#000000;stroke-width:4;stroke-linejoin:round"^> >> %generatePath%
	echo			^<rect width="15.77" height="10.868" x="654.958" y="399.022" transform="matrix(1,0,-0.253,0.967,0,0)" /^> >> %generatePath%
	echo			^<rect width="15.77" height="10.868" x="654.257" y="420.071" transform="matrix(1,0,-0.253,0.967,0,0)" /^> >> %generatePath%
	echo			^<rect width="15.77" height="10.868" x="654.044" y="441.119" transform="matrix(1,0,-0.253,0.967,0,0)" /^> >> %generatePath%
	echo			^<rect width="15.77" height="10.868" x="653.62" y="462.168" transform="matrix(1,0,-0.253,0.967,0,0)" /^> >> %generatePath%
	echo		^</g^> >> %generatePath%
	echo		^<g style="fill:#808080;stroke:#000000;stroke-width:5px;stroke-linejoin:round"^> >> %generatePath%
	echo			^<!-- Volume button --^> >> %generatePath%
	echo			^<rect width="42.283" height="9.86" x="452.589" y="527.109" transform="matrix(0.95,0.309,-0.302,0.953,0,0)" /^> >> %generatePath%
	echo			^<!-- Speaker button --^> >> %generatePath%
	echo			^<rect width="18.249" height="10.991" x="366.869" y="525.927" transform="matrix(0.95,0.311,-0.275,0.961,0,0)" /^> >> %generatePath%
	echo			^<!-- Mute button --^> >> %generatePath%
	echo			^<rect width="17.809" height="10.809" x="411.193" y="531.283" transform="matrix(0.954,0.299,-0.274,0.961,0,0)" /^> >> %generatePath%
	echo			^<!-- Headset button --^> >> %generatePath%
	echo			^<rect width="18.239" height="10.996" x="488.026" y="526.834" transform="matrix(0.95,0.31,-0.275,0.961,0,0)" /^> >> %generatePath%
	echo		^</g^> >> %generatePath%
	echo		^<g transform="translate(-6,22)"^> >> %generatePath%
	echo			^<!-- White label --^> >> %generatePath%
	echo			^<rect width="133.98" height="30.808" x="387.313" y="292.041" transform="matrix(0.965,0.258,-0.258,0.965,0,0)" style="fill:#cccccc;stroke:#552200;stroke-width:1" /^> >> %generatePath%
	echo			^<!-- Bottom buttons for white label --^> >> %generatePath%
	echo			^<g style="fill:#808080;stroke:#999999;stroke-width:10"^> >> %generatePath%
	echo				^<!--1--^>^<path d="m 370.725,-34.056 a 29.799,29.799 0 1 1 -59.599,0 29.799,29.799 0 1 1 59.599,0 z" transform="matrix(0.182,0.089,-0.089,0.182,235.239,402.723)" /^> >> %generatePath%
	echo				^<!--2--^>^<path d="m 370.725,-34.056 a 29.799,29.799 0 1 1 -59.599,0 29.799,29.799 0 1 1 59.599,0 z" transform="matrix(0.184,0.089,-0.089,0.184,267.761,411.508)" /^> >> %generatePath%
	echo				^<!--3--^>^<path d="m 370.725,-34.056 a 29.799,29.799 0 1 1 -59.599,0 29.799,29.799 0 1 1 59.599,0 z" transform="matrix(0.186,0.09,-0.091,0.186,300.15,420.323)" /^> >> %generatePath%
	echo				^<!--4--^>^<path d="m 370.725,-34.056 a 29.799,29.799 0 1 1 -59.599,0 29.799,29.799 0 1 1 59.599,0 z" transform="matrix(0.188,0.091,-0.091,0.188,332.596,429.231)" /^> >> %generatePath%
	echo			^</g^> >> %generatePath%
	echo			^<!-- Top buttons for white label --^> >> %generatePath%
	echo			^<g transform="translate(15.621,-52.562)" style="fill:#808080;stroke:#999999;stroke-width:10"^> >> %generatePath%
	echo				^<!--1--^>^<path d="m 370.725,-34.056 a 29.799,29.799 0 1 1 -59.599,0 29.799,29.799 0 1 1 59.599,0 z" transform="matrix(0.182,0.089,-0.089,0.182,235.239,402.723)" /^> >> %generatePath%
	echo				^<!--2--^>^<path d="m 370.725,-34.056 a 29.799,29.799 0 1 1 -59.599,0 29.799,29.799 0 1 1 59.599,0 z" transform="matrix(0.184,0.089,-0.089,0.184,267.761,411.508)" /^> >> %generatePath%
	echo				^<!--3--^>^<path d="m 370.725,-34.056 a 29.799,29.799 0 1 1 -59.599,0 29.799,29.799 0 1 1 59.599,0 z" transform="matrix(0.186,0.09,-0.091,0.186,300.150,420.323)" /^> >> %generatePath%
	echo				^<!--4--^>^<path d="m 370.725,-34.056 a 29.799,29.799 0 1 1 -59.599,0 29.799,29.799 0 1 1 59.599,0 z" transform="matrix(0.188,0.091,-0.091,0.188,332.596,429.231)" /^> >> %generatePath%
	echo			^</g^> >> %generatePath%
	echo		^</g^> >> %generatePath%
	echo	^</g^> >> %generatePath%
	echo ^</svg^> >> %generatePath%
	
goto DoneDraw


:DrawSwitch
	
	echo 	^<svg class="switch" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" width="128" height="119"^>		^<!-- MAIN BODY OF SWITCH --^> >> %generatePath%
	echo 		^<g transform="matrix(1.0748647,0,0,1.0748647,-0.00795141,-1025.1722)"^> >> %generatePath%
	echo 			^<path d="M 0.13123423,957.30017 88.852953,1002.4654 119.87945,966.19087 38.274899,953.76862 z" style="fill:url(#GrT)" /^>	^<!-- TOP PANEL --^> >> %generatePath%
	echo 			^<path d="m 0.13123347,966.81109 88.72171953,77.41251 0,-41.7582 -88.72171953,-45.16523 z" style="fill:url(#GrF)" /^>			^<!-- FRONT PANEL --^> >> %generatePath%
	echo 			^<path d="M 0.20739759,959.99072 88.777667,1012.4165" style="stroke:#000000;stroke-width:0.4;stroke-linecap:round" /^>		^<!-- TOP LINE --^> >> %generatePath%
	echo 			^<path d="M 0.24611358,964.45453 88.775649,1033.4093" style="stroke:#000000;stroke-width:0.4;stroke-linecap:round" /^>		^<!-- BOTTOM LINE --^> >> %generatePath%
	echo 			^<path d="m 88.852953,1044.2236 0,-41.7582 31.026497,-36.27453 0,15.62817 z" style="fill:url(#GrR)" /^>						^<!-- RIGHT PANEL --^> >> %generatePath%
	echo 		^</g^> >> %generatePath%
	echo 		^<g transform="matrix(1.0748647,0,0,1.0748647,-0.00795141,19.985573)"^>														^<!-- SOCKETS --^> >> %generatePath%
	echo 			^<path d="m 68.641731,29.95529 7.809958,5.027689 0.05437,-6.694562 -7.875482,-3.998722 z" style="stroke:#ebebeb;stroke-width:0.448" /^> >> %generatePath%
	echo 			^<path d="M 64.2153,41.822985 81.447349,55.276344 81.412021,35.738953 64.191356,25.59227 z" style="fill:#000000;stroke:#ebebeb;stroke-width:0.366" /^> >> %generatePath%
	echo 			^<path d="m 68.645253,29.960184 7.833853,4.836669 0.0066,-6.527553 -7.851587,-3.97471 z" style="fill:#000000" /^> >> %generatePath%
	echo 			^<path d="m 50.561539,19.323641 5.042641,3.189219 0.02954,-5.261532 -5.090838,-2.665253 z" style="stroke:#ebebeb;stroke-width:0.4" /^> >> %generatePath%
	echo 			^<path d="m 46.861426,28.497484 12.117646,9.157325 0.013,-15.159537 -12.172899,-7.158577 z" style="fill:#000000;stroke:#ebebeb;stroke-width:0.4" /^> >> %generatePath%
	echo 			^<path d="m 50.576903,19.355605 5.018746,3.14135 0.01761,-5.24945 -5.054991,-2.629619 z" style="fill:#000000" /^> >> %generatePath%
	echo 			^<path d="M 35.627089,9.7120892 39.898372,12.085536 39.887055,8.6364752 35.61194,6.2561455 z" style="stroke:#ebebeb;stroke-width:0.4" /^> >> %generatePath%
	echo 			^<path d="m 32.910972,17.442196 9.706696,7.559274 0.013,-12.218842 -9.76195,-5.7523095 z" style="fill:#000000;stroke:#ebebeb;stroke-width:0.366" /^> >> %generatePath%
	echo 			^<path d="M 35.651254,9.7244772 39.922537,12.097771 39.91122,8.6488631 35.636105,6.2685336 z" style="fill:#000000" /^> >> %generatePath%
	echo 			^<path d="m 23.86011,2.9701314 3.527394,1.8443272 -0.0098,-3.2537594 -3.515517,-1.77519911 z" style="stroke:#ebebeb;stroke-width:0.285" /^> >> %generatePath%
	echo 			^<path d="m 21.965792,8.921246 7.46354,5.841473 0.013,-9.8230499 -7.518791,-4.44146188 z" style="fill:#000000;stroke:#ebebeb;stroke-width:0.326" /^> >> %generatePath%
	echo 			^<path d="m 23.866933,2.9860829 3.527394,1.8443272 -0.0098,-3.2537594 -3.515518,-1.77518387 z" style="fill:#000000" /^> >> %generatePath%
	echo 			^<path d="m 14.978764,-2.6411605 2.859421,1.65817076 -0.0077,-2.67527076 -2.833869,-1.4220955 z" style="stroke:#ebebeb;stroke-width:0.285" /^> >> %generatePath%
	echo 			^<path d="m 13.191836,2.1490064 5.713878,4.4402385 0.281924,-7.6984789 -5.769125,-3.4468745 z" style="fill:#000000;stroke:#ebebeb;stroke-width:0.285" /^> >> %generatePath%
	echo 			^<path d="m 14.964615,-2.6365051 2.859421,1.65817086 -0.0077,-2.67525556 -2.833869,-1.4221108 z" style="fill:#000000" /^> >> %generatePath%
	echo 			^<path d="M 7.8560031,-7.1830203 10.04204,-5.9594079 10.03664,-7.9043837 7.8626676,-9.0398119 z" style="stroke:#ebebeb;stroke-width:0.244" /^> >> %generatePath%
	echo 			^<path d="M 6.5249926,-3.0088025 11.070095,0.545251 11.276529,-5.8182765 6.5454369,-8.6588123 z" style="fill:#000000;stroke:#ebebeb;stroke-width:0.244" /^> >> %generatePath%
	echo 			^<path d="m 7.8519852,-7.2208419 2.1979858,1.2773855 -0.0054,-1.9449759 -2.1679962,-1.1175037 z" style="fill:#000000" /^> >> %generatePath%
	echo 			^<path d="m 2.2021017,-10.409053 1.7332536,1.1254882 -0.00545,-1.8488242 -1.7152138,-0.874301 z" style="stroke:#ebebeb;stroke-width:0.203" /^> >> %generatePath%
	echo 			^<path d="M 1.014429,-7.3033979 4.8079628,-4.3797861 5.05471,-9.5339245 1.1056311,-11.831576 z" style="fill:#000000;stroke:#ebebeb;stroke-width:0.203" /^> >> %generatePath%
	echo 			^<path d="m 2.2021014,-10.393514 1.7332535,1.1255031 -0.00543,-1.8488391 -1.7152138,-0.874286 z" style="fill:#000000" /^> >> %generatePath%
	echo 		^</g^> >> %generatePath%
	echo 		^<g transform="matrix(1.0748647,0,0,1.0748647,-0.00795141,19.985573)"^>														^<!-- LIGHT BACKGROUNDS --^> >> %generatePath%
	echo 			^<path d="m 76.716666,32.754376 4.528136,2.685991 0.0056,-4.727515 -4.523296,-2.335465 z" style="fill:#000000" /^> >> %generatePath%
	echo 			^<path d="m 64.363661,25.469308 4.037978,2.368553 -0.0033,-3.637635 -4.015412,-2.000278 z" style="fill:#000000" /^> >> %generatePath%
	echo 			^<path d="m 55.82489,20.401885 2.969236,1.751393 -0.0027,-3.342162 -2.952739,-1.467529 z" style="fill:#000000" /^> >> %generatePath%
	echo 			^<path d="m 47.04034,15.223419 3.294213,1.942217 7.83e-4,-2.655635 -3.276689,-1.612182 z" style="fill:#000000" /^> >> %generatePath%
	echo 			^<path d="m 40.10789,11.084166 2.362247,1.386622 0.0068,-2.5600489 -2.392516,-1.1820423 z" style="fill:#000000" /^> >> %generatePath%
	echo 			^<path d="M 33.049243,6.9082372 35.41149,8.3068077 35.412274,6.1709238 33.043655,4.9530359 z" style="fill:#000000" /^> >> %generatePath%
	echo 			^<path d="M 27.533069,3.6241609 29.296742,4.6703588 29.291542,2.5046046 27.52631,1.6391917 z" style="fill:#000000" /^> >> %generatePath%
	echo 			^<path d="m 22.082266,0.3993021 1.632241,0.9864557 7.75e-4,-1.65795211 -1.627827,-0.81164429 z" style="fill:#000000" /^> >> %generatePath%
	echo 			^<path d="m 17.979706,-2.0031102 1.088592,0.6578772 7.84e-4,-1.6758733 -1.090153,-0.5667048 z" style="fill:#000000" /^> >> %generatePath%
	echo 			^<path d="m 13.544905,-4.6427908 1.279586,0.83104 0.0188,-1.3153737 -1.293274,-0.6583682 z" style="fill:#000000" /^> >> %generatePath%
	echo 			^<path d="m 10.169196,-6.6236871 1.022698,0.6279197 8.74e-4,-1.2675805 -1.024438,-0.5269378 z" style="fill:#000000" /^> >> %generatePath%
	echo 			^<path d="m 6.6537259,-8.7440418 1.0704912,0.6398689 0.00685,-0.9867953 -1.0782048,-0.5149902 z" style="fill:#000000" /^> >> %generatePath%
	echo 			^<path d="m 4.0219956,-10.254285 0.9161889,0.5520245 0.00593,-0.9471975 -0.9109284,-0.423157 z" style="fill:#000000" /^> >> %generatePath%
	echo 			^<path d="m 1.2615694,-11.861329 0.8206024,0.498256 0.011914,-0.654462 -0.8332645,-0.41121 z" style="fill:#000000" /^> >> %generatePath%
	echo 		^</g^> >> %generatePath%
	
	echo 		^<g transform="matrix(1.0748647,0,0,1.0748647,-0.00795141,19.985573)"^>														^<!-- LIGHTS --^> >> %generatePath%
	echo 			^<path d="m 50.917015,45.672592 2.960762,1.756259 0.0037,-3.091128 -2.957598,-1.527065 z" transform="matrix(1.5293816,0,0,1.5293816,-1.1509339,-37.097848)" class="light" fill-opacity="0" style="fill:#00b300;filter:url(#bA)" >> %generatePath%
	echo 				id="light%lightId%" /^> >> %generatePath%
	set /a lightId+=1
	echo 			^<path d="m 42.839891,40.909183 2.640268,1.5487 -0.0022,-2.3785 -2.625514,-1.3079 z"	transform="matrix(1.5293816,0,0,1.5293816,-1.1509339,-37.097848)" class="light" fill-opacity="0" style="fill:#00b300;filter:url(#bB)" >> %generatePath%
	echo 				id="light%lightId%" /^> >> %generatePath%
	set /a lightId+=1
	echo 			^<path d="M 37.256738,37.595804 39.1982,38.740968 39.1964,36.555665 37.265725,35.596108 z" transform="matrix(1.5293816,0,0,1.5293816,-1.1509339,-37.097848)" class="light" fill-opacity="0" style="fill:#00b300;filter:url(#bC)" >> %generatePath%
	echo 				id="light%lightId%" /^> >> %generatePath%
	set /a lightId+=1
	echo 			^<path d="m 31.512881,34.209817 2.153951,1.269936 5.12e-4,-1.736411 -2.142493,-1.054139 z" transform="matrix(1.5293816,0,0,1.5293816,-1.1509339,-37.097848)" class="light" fill-opacity="0" style="fill:#00b300;filter:url(#bD)" >> %generatePath%
	echo 				id="light%lightId%" /^> >> %generatePath%
	set /a lightId+=1
	echo 			^<path d="m 26.980036,31.503328 1.544576,0.906655 0.0044,-1.673911 -1.564368,-0.772889 z" transform="matrix(1.5293816,0,0,1.5293816,-1.1509339,-37.097848)" class="light" fill-opacity="0" style="fill:#00b300;filter:url(#bE)" >> %generatePath%
	echo 				id="light%lightId%" /^> >> %generatePath%
	set /a lightId+=1
	echo 			^<path d="m 22.364676,28.772859 1.544576,0.914468 5.13e-4,-1.396567 -1.548743,-0.796327 z" transform="matrix(1.5293816,0,0,1.5293816,-1.1509339,-37.097848)" class="light" fill-opacity="0" style="fill:#00b300;filter:url(#bF)" >> %generatePath%
	echo 				id="light%lightId%" /^> >> %generatePath%
	set /a lightId+=1
	echo 			^<path d="m 18.757876,26.625536 1.153193,0.684066 -0.0034,-1.416098 -1.154212,-0.565858 z" transform="matrix(1.5293816,0,0,1.5293816,-1.1509339,-37.097848)" class="light" fill-opacity="0" style="fill:#00b300;filter:url(#bG)" >> %generatePath%
	echo 				id="light%lightId%" /^> >> %generatePath%
	set /a lightId+=1
	echo 			^<path d="m 15.193819,24.516933 1.067255,0.645003 5.07e-4,-1.084067 -1.064369,-0.530701 z" transform="matrix(1.5293816,0,0,1.5293816,-1.1509339,-37.097848)" class="light" fill-opacity="0" style="fill:#00b300;filter:url(#bH)" >> %generatePath%
	echo 				id="light%lightId%" /^> >> %generatePath%
	set /a lightId+=1
	echo 			^<path d="m 12.511323,22.946094 0.711786,0.430159 5.12e-4,-1.095784 -0.712806,-0.370545 z" transform="matrix(1.5293816,0,0,1.5293816,-1.1509339,-37.097848)" class="light" fill-opacity="0" style="fill:#00b300;filter:url(#bI)" >> %generatePath%
	echo 				id="light%lightId%" /^> >> %generatePath%
	set /a lightId+=1
	echo 			^<path d="m 9.6115888,21.220115 0.8366682,0.543383 0.01229,-0.860069 -0.8456182,-0.43048 z" transform="matrix(1.5293816,0,0,1.5293816,-1.1509339,-37.097848)" class="light" fill-opacity="0" style="fill:#00b300;filter:url(#bJ)" >> %generatePath%
	echo 				id="light%lightId%" /^> >> %generatePath%
	set /a lightId+=1
	echo 			^<path d="m 7.4043508,19.924889 0.668701,0.410571 5.71e-4,-0.828819 -0.669838,-0.344543 z" transform="matrix(1.5293816,0,0,1.5293816,-1.1509339,-37.097848)" class="light" fill-opacity="0" style="fill:#00b300;filter:url(#bK)" >> %generatePath%
	echo 				id="light%lightId%" /^> >> %generatePath%
	set /a lightId+=1
	echo 			^<path d="m 5.105729,18.538475 0.6999508,0.418384 0.0045,-0.645225 -0.7049944,-0.336731 z" transform="matrix(1.5293816,0,0,1.5293816,-1.1509339,-37.097848)" class="light" fill-opacity="0" style="fill:#00b300;filter:url(#bL)" >> %generatePath%
	echo 				id="light%lightId%" /^> >> %generatePath%
	set /a lightId+=1
	echo 			^<path d="m 3.3849483,17.550989 0.5990584,0.360946 0.00388,-0.619333 -0.5956188,-0.276685 z" transform="matrix(1.5293816,0,0,1.5293816,-1.1509339,-37.097848)" class="light" fill-opacity="0" style="fill:#00b300;filter:url(#bM)" >> %generatePath%
	echo 				id="light%lightId%" /^> >> %generatePath%
	set /a lightId+=1
	echo 			^<path d="M 1.5800187,16.500209 2.116577,16.825998 2.124367,16.398073 1.5795295,16.129199 z" transform="matrix(1.5293816,0,0,1.5293816,-1.1509339,-37.097848)" class="light" fill-opacity="0" style="fill:#00b300;filter:url(#bN)" >> %generatePath%
	echo 				id="light%lightId%" /^> >> %generatePath%
	set /a lightId+=1
	echo 		^</g^> >> %generatePath%
	
	echo 		^<g transform="matrix(1.0748647,0,0,1.0748647,-0.00795141,19.985573)"^>														^<!-- INSIDE SOCKETS --^> >> %generatePath%
	echo 			^<path d="M 47.086437,28.407562 57.558582,21.977724" style="stroke:#aaaaaa;stroke-width:0.152;stroke-linecap:round" /^> >> %generatePath%
	echo 			^<path d="M 64.44615,41.653889 76.417339,30.440995" style="stroke:#aaaaaa;stroke-width:0.152;stroke-linecap:round" /^> >> %generatePath%
	echo 			^<path d="m 33.112603,17.344357 9.326559,-3.97344" style="stroke:#aaaaaa;stroke-width:0.152;stroke-linecap:round" /^> >> %generatePath%
	echo 			^<path d="M 22.130051,8.8433102 29.230247,6.6529727" style="stroke:#aaaaaa;stroke-width:0.152;stroke-linecap:round" /^> >> %generatePath%
	echo 			^<path d="m 13.379228,2.029629 5.56253,-1.31167106" style="stroke:#aaaaaa;stroke-width:0.152;stroke-linecap:round" /^> >> %generatePath%
	echo 			^<path d="M 1.1285842,-7.3146541 4.8999855,-7.8828378" style="stroke:#aaaaaa;stroke-width:0.152;stroke-linecap:round" /^> >> %generatePath%
	echo 			^<path d="m 2.1964465,-11.112656 1.3818634,-0.174592" style="stroke:#aaaaaa;stroke-width:0.045;stroke-linecap:round" /^> >> %generatePath%
	echo 			^<path d="M 23.876837,1.8094547 26.507298,1.1509565" style="stroke:#aaaaaa;stroke-width:0.045;stroke-linecap:round" /^> >> %generatePath%
	echo 			^<path d="M 35.651881,8.8470006 38.485462,7.8599239" style="stroke:#aaaaaa;stroke-width:0.045;stroke-linecap:round" /^> >> %generatePath%
	echo 			^<path d="m 50.575299,17.754454 3.030728,-1.548646" style="stroke:#aaaaaa;stroke-width:0.045;stroke-linecap:round" /^> >> %generatePath%
	echo 			^<path d="m 68.665016,28.406358 3.126315,-2.498535" style="stroke:#aaaaaa;stroke-width:0.045;stroke-linecap:round" /^> >> %generatePath%
	echo 			^<path d="M 7.8601492,-7.7491789 9.761763,-8.019358" style="stroke:#aaaaaa;stroke-width:0.045;stroke-linecap:round" /^> >> %generatePath%
	echo 			^<path d="M 6.6624954,-3.0818457 11.092897,-3.8950409" style="stroke:#aaaaaa;stroke-width:0.152;stroke-linecap:round" /^> >> %generatePath%
	echo 			^<path d="m 14.981333,-3.4836373 2.266036,-0.4374551" style="stroke:#aaaaaa;stroke-width:0.045;stroke-linecap:round" /^> >> %generatePath%
	echo 		^</g^> >> %generatePath%
	echo 	^</svg^> >> %generatePath%

GOTO DoneDraw


:DrawComp
	
	echo 	^<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" width="128" height="134"^> >> %generatePath%
	echo 		^<g transform="translate(-168.72,-650.49)"^> >> %generatePath%
	echo 			^<path d="m 236.49,744.06 0,12.73 14.48,-1.15 0,-12.33 z" style="fill:url(#grad4)" /^> >> %generatePath%
	echo 			^<path d="m 228.34,743.33 8.15,0.86 0,11.72 -8.15,-1.33 z" style="fill:url(#grad3)" /^> >> %generatePath%
	echo 			^<path d="m 290.00,650.57 0,109.58 6.77,-1.19 0,-106.49 z" style="fill:url(#grad6)" /^> >> %generatePath%
	echo 			^<path d="m 201.18,688.71 88.81,-38.11 0,109.58 -88.81,-24.01 z" style="fill:url(#grad5)" /^> >> %generatePath%
	echo 			^<path d="m 204.98,691.62 79.02,-32.12 0.007,93.51 -78.98,-20.94 z" style="fill:url(#grad1)" /^> >> %generatePath%
	echo 			^<path d="m 168.72,756.66 55.75,26.82 45.87,-21.62 -64.19,-19.33 z" style="fill:url(#grad2)" /^> >> %generatePath%
	echo 			^<path d="m 224.47,783.46 0,1.03 46.28,-19.89 0,-2.92 z" style="fill:url(#grad7)" /^> >> %generatePath%
	echo 			^<path d="m 168.72,756.64 55.75,26.82 0,1.03 -55.75,-27.5 z" style="fill:#151515" /^> >> %generatePath%
	echo 			^<path d="m 306.2,736.52 2.13,0.6 0.03,2.25 -2.15,-0.6 z" transform="matrix(2.2276471,0,0,2.0507276,-402.84531,-758.62577)" style="fill:#000000" /^> >> %generatePath%
	echo 			^<path d="m 306.2,736.52 2.13,0.6 0.03,2.25 -2.15,-0.6 z" transform="matrix(2.2276471,0,0,2.0507276,-402.84531,-758.62577)" class="light" fill-opacity="0" style="fill:#44ff44;filter:url(#filter1)" >> %generatePath%
	echo 				id="light%lightId%"/^>			^<!-- The one light here must be incremented --^> >> %generatePath%
	set /a lightId+=1
	echo 			^<g transform="matrix(0.87654918,0,0,0.4598279,122.84119,379.6229)"^> >> %generatePath%
	echo 				^<!-- Letters Begin --^> >> %generatePath%
	echo 				^<path d="m 97.68,686.92 c 0,0 0,-4.93 0,-4.93 0,0 -0.56,0.39 -0.56,0.39 0,0 0,-0.81 0,-0.81 0,0 1.44,-1.03 1.44,-1.03 0,0 0,0.83 0,0.83 0,0 -0.58,0.41 -0.58,0.41 0,0 0,4.96 0,4.96 0,0 -0.28,0.16 -0.28,0.16" class="letter" fill-opacity="0" style="fill:#d7d7d7" >> %generatePath%
	echo 					id="letter%letterId%" /^>		^<!-- T --^> >> %generatePath%
	set /a letterId+=1
	echo 				^<path d="m 98.79,686.27 c 0,0 0,-7.21 0,-7.21 0,0 0.29,-0.22 0.29,-0.22 0,0 0,2.3 0,2.3 0,0 0,0.82 0,0.82 0.08,-0.73 0.22,-1.18 0.43,-1.32 0.28,-0.19 0.42,0.29 0.42,1.47 0,0 0,3.48 0,3.48 0,0 -0.3,0.18 -0.3,0.18 0,0 0,-3.21 0,-3.21 -1e-6,-0.36 -0.01,-0.6 -0.04,-0.72 -0.02,-0.12 -0.07,-0.15 -0.14,-0.11 -0.11,0.07 -0.23,0.45 -0.35,1.13 0,0 0,3.24 0,3.24 0,0 -0.29,0.17 -0.29,0.17" class="letter" fill-opacity="0" style="fill:#d7d7d7" >> %generatePath%
	echo 					id="letter%letterId%" /^>		^<!-- H --^> >> %generatePath%
	set /a letterId+=1
	echo 				^<path d="m 101.28,684.19 c -0.14,0.55 -0.29,0.87 -0.46,0.97 -0.14,0.08 -0.25,0.01 -0.34,-0.21 -0.08,-0.22 -0.13,-0.55 -0.13,-0.97 0,-0.54 0.06,-1.03 0.2,-1.45 0.13,-0.42 0.32,-0.71 0.54,-0.85 0,0 0.13,-0.08 0.13,-0.08 0,0 0,-0.34 0,-0.34 0,-0.33 -0.02,-0.55 -0.06,-0.66 -0.04,-0.10 -0.10,-0.12 -0.20,-0.06 -0.14,0.1 -0.31,0.36 -0.49,0.78 0,0 0,-0.93 0,-0.93 0.2,-0.39 0.38,-0.64 0.55,-0.76 0.19,-0.13 0.33,-0.09 0.41,0.12 0.08,0.21 0.12,0.65 0.12,1.31 0,0 0,2.14 0,2.14 0,0.29 0.008,0.47 0.02,0.55 0.01,0.07 0.04,0.1 0.08,0.08 0.0,-0.009 0.05,-0.04 0.11,-0.11 0,0 0.03,0.70 0.03,0.7 -0.1,0.18 -0.18,0.29 -0.23,0.32 -0.14,0.08 -0.24,-0.09 -0.28,-0.53 0,0 1e-5,10e-6 1e-5,10e-6 m -0.05,-0.7 c 0,0 0,-1.14 0,-1.14 0,0 -0.04,0.03 -0.04,0.03 -0.34,0.21 -0.51,0.63 -0.51,1.24 0,0.21 0.02,0.38 0.06,0.48 0.04,0.1 0.09,0.13 0.16,0.09 0.1,-0.06 0.22,-0.3 0.33,-0.71 0,0 0,0 0,0" class="letter" fill-opacity="0" style="fill:#d7d7d7" >> %generatePath%
	echo 					id="letter%letterId%" /^>		^<!-- A --^> >> %generatePath%
	set /a letterId+=1
	echo 				^<path d="m 102.11,684.32 c 0,0 0,-5.38 0,-5.38 0,0 0.34,-0.23 0.34,-0.23 0,0 0,0.98 0,0.98 0.09,-0.79 0.26,-1.28 0.5,-1.44 0.32,-0.22 0.48,0.29 0.48,1.55 0,0 0,3.74 0,3.74 0,0 -0.35,0.2 -0.35,0.2 0,0 0,-3.45 0,-3.45 0,-0.39 -0.01,-0.65 -0.05,-0.77 -0.03,-0.12 -0.08,-0.16 -0.16,-0.11 -0.13,0.08 -0.26,0.5 -0.41,1.23 0,0 0,3.48 0,3.48 0,0 -0.34,0.2 -0.34,0.2" class="letter" fill-opacity="0" style="fill:#d7d7d7" >> %generatePath%
	echo 					id="letter%letterId%" /^>		^<!-- N --^> >> %generatePath%
	set /a letterId+=1
	echo 				^<path d="m 104,683.2 c 0,0 0,-8.03 0,-8.03 0,0 0.36926,-0.27 0.36,-0.27 0,0 0,5.05 0,5.05 0,0 0.65,-3.04 0.65,-3.04 0,0 0.39,-0.27 0.39,-0.27 0,0 -0.67,3.03 -0.67,3.03 0,0 0.85,2.6 0.85,2.6 0,0 -0.47,0.28 -0.47,0.28 0,0 -0.74,-2.4 -0.74,-2.4 0,0 0,2.83 0,2.83 0,0 -0.36,0.21 -0.36,0.21" class="letter" fill-opacity="0" style="fill:#d7d7d7" >> %generatePath%
	echo 					id="letter%letterId%" /^>		^<!-- K --^> >> %generatePath%
	set /a letterId+=1
	echo 				^<path d="m 105.95,681.8 c 0,0 0,-1.09 0,-1.09 0.28,0.16 0.51,0.2 0.69,0.09 0.12,-0.07 0.23,-0.21 0.31,-0.41 0.08,-0.2 0.12,-0.41 0.12,-0.63 0,-0.28 -0.09,-0.45 -0.29,-0.52 0,0 -0.35,-0.13 -0.35,-0.13 -0.28,-0.1 -0.43,-0.53 -0.43,-1.27 0,-0.54 0.06,-1 0.19,-1.39 0.13,-0.38 0.31,-0.66 0.55,-0.83 0.17,-0.12 0.38,-0.18 0.64,-0.17 0,0 0,1.03 0,1.03 -0.25,-0.03 -0.46,0.008 -0.64,0.12 -0.11,0.07 -0.2,0.19 -0.26,0.35 -0.06,0.16 -0.09,0.33 -0.09,0.52 0,0.23 0.07,0.37 0.21,0.44 0,0 0.42,0.17 0.42,0.17 0.16,0.07 0.27,0.2 0.35,0.41 0.07,0.2 0.11,0.5 0.11,0.9 0,0.57 -0.07,1.08 -0.23,1.51 -0.15,0.43 -0.35,0.71 -0.6,0.86 -0.21,0.12 -0.44,0.13 -0.69,0.02 0,0 0,-10e-6 0,-10e-6" class="letter" fill-opacity="0" style="fill:#d7d7d7" >> %generatePath%
	echo 					id="letter%letterId%" /^>		^<!-- S --^> >> %generatePath%
	set /a letterId+=1
	echo 				^<path d="m 108.6,676.22 c 0,0 0,-1.82 0,-1.82 0,0 0.62,-0.43 0.62,-0.43 0,0 0,1.84 0,1.84 0,0 -0.62,0.41 -0.62,0.41 m 0,4.27 c 0,0 0,-1.82 0,-1.82 0,0 0.62,-0.38 0.62,-0.38 0,0 0,1.84 0,1.84 0,0 -0.62,0.36 -0.62,0.36" class="letter" fill-opacity="0" style="fill:#d7d7d7" >> %generatePath%
	echo 					id="letter%letterId%" /^>		^<!-- : --^> >> %generatePath%
	set /a letterId+=1
	echo 				^<path d="m 97.3,698.4 c 0,0 0,-5.7 0,-5.7 0,0 0.44,-0.2 0.44,-0.2 0.17,-0.08 0.29,-0.08 0.36,-0.006 0.16,0.17 0.25,0.56 0.25,1.17 -10e-7,0.41 -0.02,0.76 -0.08,1.06 -0.05,0.29 -0.14,0.57 -0.26,0.81 0,0 0.54,2.43 0.54,2.43 0,0 -0.32,0.11 -0.32,0.11 0,0 -0.47,-2.16 -0.47,-2.16 0,0 -0.16,0.06 -0.16,0.06 0,0 0,2.31 0,2.31 0,0 -0.27,0.09 -0.27,0.09 m 0.27,-3.23 c 0,0 0.09,-0.03 0.09,-0.03 0.11,-0.04 0.2,-0.17 0.27,-0.39 0.06,-0.21 0.1,-0.48 0.1,-0.8 -10e-7,-0.29 -0.02,-0.47 -0.07,-0.56 -0.04,-0.08 -0.14,-0.09 -0.28,-0.03 0,0 -0.11,0.05 -0.11,0.05 0,0 0,1.78 0,1.78" class="letter" fill-opacity="0" style="fill:#d7d7d7" >> %generatePath%
	echo 					id="letter%letterId%" /^>		^<!-- R --^> >> %generatePath%
	set /a letterId+=1
	echo 				^<path d="m 99.36,697.82 c -0.2,0.06 -0.36,-0.11 -0.48,-0.54 -0.11,-0.42 -0.17,-1.04 -0.17,-1.85 0,-0.8 0.05,-1.46 0.17,-1.98 0.11,-0.52 0.27,-0.83 0.48,-0.92 0.2,-0.09 0.37,0.07 0.49,0.49 0.12,0.42 0.18,1.05 0.18,1.88 0,0.83 -0.06,1.5 -0.18,2.03 -0.12,0.52 -0.28,0.81 -0.49,0.88 0,0 0,0 0,0 m 0,-0.85 c 0.1,-0.03 0.19,-0.22 0.25,-0.56 0.06,-0.33 0.09,-0.74 0.09,-1.37 -10e-7,-0.57 -0.03,-1.01 -0.09,-1.29 -0.0,-0.28 -0.14,-0.4 -0.25,-0.36 -0.1,0.04 -0.1,0.23 -0.25,0.57 -0.06,0.33 -0.09,0.78 -0.09,1.35 -10e-7,0.57 0.03,1 0.09,1.29 0.06,0.28 0.14,0.41 0.25,0.37 0,0 0,0 0,0" class="letter" fill-opacity="0" style="fill:#d7d7d7" >> %generatePath%
	echo 					id="letter%letterId%"/^>		^<!-- O --^> >> %generatePath%
	set /a letterId+=1
	echo 				^<path d="m 100.43,697.35 c 0,0 -0.26,-5.08 -0.26,-5.08 0,0 0.29,-0.13 0.29,-0.13 0,0 0.18,3.85 0.18,3.85 0,0 -0.04,0.01 -0.04,0.01 0,0 0.25,-3.58 0.25,-3.58 0,0 0.3,-0.13 0.3,-0.13 0,0 0.24,3.56 0.24,3.56 0,0 -0.04,0.01 -0.04,0.01 0,0 0.21,-4.23 0.21,-4.23 0,0 0.26,-0.11 0.26,-0.11 0,0 -0.3,5.45 -0.3,5.45 0,0 -0.31,0.1 -0.31,0.1 0,0 -0.25,-3.7 -0.25,-3.7 0,0 0.04,-0.01 0.04,-0.01 0,0 -0.28,3.88 -0.28,3.88 0,0 -0.3,0.1 -0.3,0.1" class="letter" fill-opacity="0" style="fill:#d7d7d7" >> %generatePath%
	echo 					id="letter%letterId%" /^>		^<!-- W --^> >> %generatePath%
	set /a letterId+=1
	echo 				^<path d="m 103.06,695.83 c -0.15,0.53 -0.32,0.83 -0.5,0.89 -0.15,0.05 -0.27,-0.05 -0.37,-0.3 -0.09,-0.25 -0.14,-0.6 -0.14,-1.04 0,-0.56 0.07,-1.05 0.22,-1.45 0.14,-0.4 0.34,-0.65 0.58,-0.75 0,0 0.14,-0.05 0.14,-0.05 0,0 0,-0.35 0,-0.35 0,-0.34 -0.02,-0.57 -0.06,-0.69 -0.04,-0.12 -0.11,-0.15 -0.22,-0.11 -0.15,0.06 -0.33,0.29 -0.53,0.68 0,0 0,-0.97 0,-0.97 0.21,-0.35 0.41,-0.57 0.59,-0.65 0.2,-0.09 0.35,-0.01 0.44,0.22 0.09,0.24 0.13,0.71 0.13,1.39 0,0 0,2.22 0,2.22 0,0.3 0.008,0.49 0.02,0.58 0.01,0.08 0.04,0.11 0.09,0.1 0.01,-0.006 0.05,-0.03 0.12,-0.09 0,0 0.03,0.73 0.03,0.73 -0.11,0.16 -0.2,0.25 -0.25,0.27 -0.15,0.05 -0.26,-0.15 -0.3,-0.62 0,0 0,2e-5 0,2e-5 m -0.06,-0.74 c 0,0 0,-1.18 0,-1.18 0,0 -0.05,0.02 -0.05,0.02 -0.36,0.14 -0.54,0.53 -0.54,1.16 0,0.22 0.02,0.39 0.06,0.51 0.04,0.11 0.1,0.16 0.17,0.13 0.11,-0.04 0.23,-0.25 0.36,-0.65 0,0 0,0 0,0" class="letter" fill-opacity="0" style="fill:#d7d7d7" >> %generatePath%
	echo 					id="letter%letterId%" /^>		^<!-- A --^> >> %generatePath%
	set /a letterId+=1
	echo 				^<path d="m 103.95,696.17 c 0,0 0,-5.58 0,-5.58 0,0 0.36,-0.16 0.36,-0.16 0,0 0,1.01 0,1.01 0.1,-0.8 0.28,-1.26 0.53,-1.37 0.34,-0.15 0.52,0.42 0.52,1.73 0,0 0,3.88 0,3.88 0,0 -0.38,0.12 -0.38,0.12 0,0 0,-3.58 0,-3.58 0,-0.4 -0.01,-0.68 -0.05,-0.82 -0.03,-0.14 -0.09,-0.19 -0.18,-0.15 -0.14,0.06 -0.29,0.45 -0.44,1.18 0,0 0,3.61 0,3.61 0,0 -0.36,0.12 -0.36,0.12" class="letter" fill-opacity="0" style="fill:#d7d7d7" >> %generatePath%
	echo 					id="letter%letterId%" /^>		^<!-- N --^> >> %generatePath%
	set /a letterId+=1
	echo 				^<path d="m 97.31,709.56 c 0,0 0,-0.87 0,-0.87 0,0 0.1,0.08 0.1,0.08 0.1,0.11 0.18,0.17 0.24,0.16 0.1,-0.01 0.17,-0.11 0.21,-0.3 0.04,-0.19 0.06,-0.55 0.06,-1.07 0,0 0,-2.91 0,-2.91 0,0 -0.51,0.09 -0.51,0.09 0,0 0,-0.81 0,-0.81 0,0 0.8,-0.16 0.8,-0.16 0,0 0,3.3 0,3.3 -10e-7,0.57 -0.009,1.01 -0.02,1.3 -0.01,0.29 -0.05,0.55 -0.11,0.78 -0.09,0.39 -0.22,0.60 -0.40,0.61 -0.09,0.007 -0.21,-0.05 -0.36,-0.19 0,0 10e-7,0 10e-7,0" class="letter" fill-opacity="0" style="fill:#d7d7d7" >> %generatePath%
	echo 					id="letter%letterId%" /^>		^<!-- J --^> >> %generatePath%
	set /a letterId+=1
	echo 				^<path d="m 99.62,708.87 c -0.13,0.46 -0.27,0.7 -0.43,0.71 -0.13,0.01 -0.23,-0.11 -0.32,-0.37 -0.08,-0.26 -0.12,-0.59 -0.12,-1.01 0,-0.53 0.06,-0.96 0.19,-1.3 0.12,-0.34 0.3,-0.52 0.51,-0.56 0,0 0.12,-0.01 0.12,-0.01 0,0 0,-0.32 0,-0.32 -10e-7,-0.32 -0.01,-0.54 -0.05,-0.66 -0.03,-0.12 -0.1,-0.17 -0.19,-0.16 -0.13,0.02 -0.29,0.19 -0.46,0.51 0,0 0,-0.9 0,-0.9 0.18,-0.27 0.35,-0.43 0.51,-0.46 0.18,-0.03 0.31,0.07 0.38,0.32 0.07,0.25 0.11,0.69 0.11,1.33 0,0 0,2.07 0,2.07 -2e-6,0.28 0.007,0.46 0.02,0.54 0.01,0.08 0.04,0.12 0.07,0.11 0.01,-0.001 0.04,-0.02 0.10,-0.05 0,0 0.02,0.69 0.02,0.69 -0.1,0.12 -0.17,0.19 -0.22,0.19 -0.13,0.01 -0.22,-0.2 -0.26,-0.65 0,0 3e-6,2e-5 3e-6,2e-5 m -0.05,-0.7 c 0,0 0,-1.1 0,-1.1 0,0 -0.04,0.006 -0.04,0.006 -0.32,0.043 -0.47,0.36 -0.47,0.95 0,0.21 0.01,0.37 0.05,0.49 0.03,0.12 0.08,0.17 0.15,0.17 0.1,-0.01 0.2,-0.18 0.31,-0.52 0,0 2e-6,0 2e-6,0" class="letter" fill-opacity="0" style="fill:#d7d7d7" >> %generatePath%
	echo 					id="letter%letterId%" /^>		^<!-- A --^> >> %generatePath%
	set /a letterId+=1
	echo 				^<path d="m 100.27,709.41 c 0,0 0,-5.18 0,-5.18 0,0 0.28,-0.05 0.28,-0.05 0,0 0,0.94 0,0.94 0.07,-0.71 0.17,-1.08 0.29,-1.11 0.14,-0.02 0.24,0.30 0.27,1.01 0,0 -0.03,0.006 -0.03,0.006 0.09,-0.72 0.21,-1.10 0.35,-1.13 0.1,-0.02 0.18,0.09 0.22,0.34 0.04,0.25 0.07,0.64 0.07,1.18 0,0 0,3.86 0,3.86 0,0 -0.3,0.02 -0.3,0.02 0,0 0,-3.8 0,-3.8 0,-0.26 -0.004,-0.43 -0.01,-0.5 -0.009,-0.07 -0.02,-0.1 -0.04,-0.1 -0.07,0.01 -0.15,0.37 -0.24,1.08 0,0 0,3.35 0,3.35 0,0 -0.29,0.02 -0.29,0.02 0,0 0,-3.59 0,-3.59 0,-0.33 -0.004,-0.54 -0.01,-0.63 -0.009,-0.08 -0.02,-0.13 -0.04,-0.12 -0.02,0.005 -0.06,0.11 -0.11,0.31 -0.04,0.2 -0.08,0.45 -0.12,0.74 0,0 0,3.31 0,3.31 0,0 -0.28,0.02 -0.28,0.02" class="letter" fill-opacity="0" style="fill:#d7d7d7" >> %generatePath%
	echo 					id="letter%letterId%" /^>		^<!-- M --^> >> %generatePath%
	set /a letterId+=1
	echo 				^<path d="m 103.49,708.9 c -0.22,0.26 -0.41,0.39 -0.58,0.41 -0.27,0.02 -0.49,-0.2 -0.64,-0.66 -0.14,-0.46 -0.22,-1.13 -0.22,-2.01 0,-0.82 0.07,-1.52 0.21,-2.08 0.14,-0.56 0.32,-0.87 0.54,-0.91 0.22,-0.04 0.39,0.15 0.5,0.59 0.11,0.44 0.16,1.14 0.16,2.09 0,0 0,0.4 0,0.4 0,0 -1.07,0.14 -1.07,0.14 0.01,1.04 0.19,1.55 0.54,1.52 0.15,-0.01 0.33,-0.15 0.54,-0.42 0,0 0,0.93 0,0.93 m -1.07,-2.94 c 0,0 0.69,-0.1 0.69,-0.1 0,0 0,-0.03 0,-0.03 0,-0.88 -0.1,-1.31 -0.32,-1.27 -0.1,0.01 -0.18,0.15 -0.25,0.42 -0.06,0.26 -0.1,0.59 -0.11,0.99 0,0 0,1e-5 0,1e-5" class="letter" fill-opacity="0" style="fill:#d7d7d7" >> %generatePath%
	echo 					id="letter%letterId%" /^>		^<!-- E --^> >> %generatePath%
	set /a letterId+=1
	echo 				^<path d="m 103.96,708.86 c 0,0 0,-1.05 0,-1.05 0.25,0.3 0.47,0.44 0.64,0.42 0.11,-0.01 0.21,-0.09 0.28,-0.24 0.074,-0.15 0.11,-0.33 0.11,-0.55 0,-0.27 -0.08,-0.48 -0.26,-0.65 0,0 -0.32,-0.3 -0.32,-0.3 -0.26,-0.24 -0.4,-0.72 -0.4,-1.4 0,-0.52 0.06,-0.93 0.18,-1.24 0.12,-0.3 0.29,-0.48 0.5,-0.52 0.16,-0.03 0.35,0.01 0.59,0.14 0,0 0,1 0,1 -0.23,-0.15 -0.43,-0.22 -0.59,-0.19 -0.1,0.01 -0.18,0.09 -0.24,0.21 -0.05,0.12 -0.08,0.27 -0.08,0.46 0,0.22 0.06,0.4 0.2,0.53 0,0 0.38,0.38 0.38,0.38 0.14,0.14 0.25,0.33 0.32,0.57 0.06,0.23 0.1,0.54 0.1,0.92 0,0.55 -0.07,1 -0.21,1.34 -0.14,0.33 -0.32,0.51 -0.55,0.53 -0.19,0.01 -0.41,-0.09 -0.64,-0.31 0,0 0,-1e-5 0,-1e-5" class="letter" fill-opacity="0" style="fill:#d7d7d7" >> %generatePath%
	echo 					id="letter%letterId%" /^>		^<!-- S --^> >> %generatePath%
	set /a letterId+=1
	echo 				^<path d="m 97.1,720.87 c 0,0 0.58,-5.65 0.58,-5.65 0,0 0.26,0.01 0.26,0.01 0,0 0.61,5.89 0.61,5.89 0,0 -0.29,-0.05 -0.29,-0.05 0,0 -0.14,-1.43 -0.14,-1.43 0,0 -0.64,-0.09 -0.64,-0.09 0,0 -0.14,1.36 -0.14,1.36 0,0 -0.23,-0.04 -0.23,-0.04 m 0.45,-2.13 c 0,0 0.49,0.06 0.49,0.06 0,0 -0.25,-2.52 -0.25,-2.52 0,0 -0.25,2.46 -0.25,2.46" class="letter" fill-opacity="0" style="fill:#d7d7d7" >> %generatePath%
	echo 					id="letter%letterId%" /^>		^<!-- A --^> >> %generatePath%
	set /a letterId+=1
	echo 				^<path d="m 99.3,721.25 c 0,0 0,-6.44 0,-6.44 0,0 -0.51,-0.01 -0.51,-0.01 0,0 0,-0.84 0,-0.84 0,0 0.82,0.01 0.82,0.01 0,0 0,7.34 0,7.34 0,0 -0.3,-0.05 -0.3,-0.05" class="letter" fill-opacity="0" style="fill:#d7d7d7" >> %generatePath%
	echo 					id="letter%letterId%" /^>		^<!-- L --^> >> %generatePath%
	set /a letterId+=1
	echo 				^<path d="m 100.93,721.53 c 0,0 0,-6.67 0,-6.67 0,0 -0.55,-0.01 -0.55,-0.01 0,0 0,-0.87 0,-0.87 0,0 0.88,0.01 0.88,0.01 0,0 0,7.6 0,7.6 0,0 -0.32,-0.05 -0.32,-0.05" class="letter" fill-opacity="0" style="fill:#d7d7d7" >> %generatePath%
	echo 					id="letter%letterId%" /^>		^<!-- L --^> >> %generatePath%
	set /a letterId+=1
	echo 				^<path d="m 105.23,722.06 c -0.21,0.22 -0.39,0.32 -0.53,0.29 -0.27,-0.04 -0.49,-0.43 -0.66,-1.15 -0.16,-0.71 -0.24,-1.61 -0.24,-2.7 0,-1.21 0.09,-2.2 0.28,-2.98 0.18,-0.78 0.43,-1.17 0.73,-1.17 0.44,0.009 0.66,0.8 0.66,2.37 0,0 0,3.24 0,3.24 0,0 0.19,0.02 0.19,0.02 0,0 0,0.83 0,0.83 0,0 -0.50,-0.07 -0.50,-0.07 0,0 0,-1.68 0,-1.68 -0.08,1.15 -0.21,1.71 -0.41,1.68 -0.11,-0.01 -0.20,-0.21 -0.27,-0.59 -0.06,-0.37 -0.1,-0.85 -0.1,-1.41 0,-0.77 0.05,-1.42 0.17,-1.96 0.11,-0.54 0.26,-0.8 0.44,-0.8 0.06,0.003 0.11,0.06 0.16,0.17 -0.03,-0.64 -0.16,-0.96 -0.37,-0.97 -0.19,-0.007 -0.36,0.31 -0.5,0.96 -0.13,0.64 -0.2,1.44 -0.2,2.4 0,0.85 0.06,1.56 0.18,2.12 0.12,0.55 0.27,0.85 0.46,0.88 0.12,0.02 0.29,-0.09 0.50,-0.34 0,0 0,0.86 0,0.86 m -0.07,-4.37 c 0,0 0,-0.8 0,-0.8 -0.05,-0.1 -0.1,-0.16 -0.14,-0.16 -0.1,-0.007 -0.18,0.16 -0.24,0.5 -0.06,0.34 -0.09,0.82 -0.09,1.44 0,0.77 0.03,1.16 0.1,1.15 0.04,-0.002 0.1,-0.2 0.18,-0.59 0.07,-0.39 0.14,-0.9 0.2,-1.53 0,0 0,10e-6 0,10e-6" class="letter" fill-opacity="0" style="fill:#d7d7d7" >> %generatePath%
	echo 					id="letter%letterId%" /^>		^<!-- @ --^> >> %generatePath%
	set /a letterId+=1
	echo 				^<path d="m 108.03,722.74 c 0,0 0,-7.08 0,-7.08 0,0 0.43,0.01 0.43,0.01 0,0 0,3.02 0,3.02 0,0 0.90,0.08 0.90,0.08 0,0 0,-3.07 0,-3.07 0,0 0.45,0.01 0.45,0.01 0,0 0,7.31 0,7.31 0,0 -0.45,-0.07 -0.45,-0.07 0,0 0,-3.14 0,-3.14 0,0 -0.9,-0.1 -0.9,-0.1 0,0 0,3.09 0,3.09 0,0 -0.43,-0.07 -0.43,-0.07" class="letter" fill-opacity="0" style="fill:#d7d7d7" >> %generatePath%
	echo 					id="letter%letterId%" /^>		^<!-- H --^> >> %generatePath%
	set /a letterId+=1
	echo 				^<path d="m 111.72,722.62 c -0.21,0.53 -0.44,0.78 -0.68,0.73 -0.2,-0.03 -0.37,-0.23 -0.5,-0.59 -0.13,-0.35 -0.19,-0.79 -0.19,-1.31 0,-0.66 0.1,-1.18 0.3,-1.56 0.2,-0.38 0.47,-0.55 0.8,-0.52 0,0 0.19,0.02 0.19,0.02 0,0 0,-0.41 0,-0.41 0,-0.4 -0.03,-0.69 -0.09,-0.86 -0.06,-0.16 -0.16,-0.25 -0.3,-0.26 -0.21,-0.01 -0.46,0.14 -0.73,0.48 0,0 0,-1.13 0,-1.13 0.29,-0.28 0.56,-0.42 0.81,-0.4 0.28,0.01 0.49,0.19 0.61,0.54 0.12,0.34 0.18,0.92 0.18,1.72 0,0 0,2.61 0,2.61 0,0.35 0.01,0.58 0.03,0.69 0.02,0.10 0.06,0.17 0.12,0.17 0.02,0.003 0.07,-0.007 0.16,-0.03 0,0 0.04,0.88 0.04,0.88 -0.16,0.12 -0.27,0.17 -0.35,0.16 -0.22,-0.03 -0.36,-0.34 -0.42,-0.92 0,0 0,2e-5 0,2e-5 m -0.085,-0.91 c 0,0 0,-1.39 0,-1.39 0,0 -0.07,-0.009 -0.07,-0.009 -0.50,-0.06 -0.75,0.28 -0.75,1.02 0,0.26 0.02,0.48 0.08,0.64 0.05,0.16 0.13,0.25 0.23,0.27 0.15,0.02 0.32,-0.15 0.49,-0.54 0,0 -1e-5,0 -1e-5,0" class="letter" fill-opacity="0" style="fill:#d7d7d7" >> %generatePath%
	echo 					id="letter%letterId%" /^>		^<!-- A --^> >> %generatePath%
	set /a letterId+=1
	echo 				^<path d="m 115.04,723.69 c -0.28,0.21 -0.56,0.3 -0.82,0.25 -0.42,-0.07 -0.74,-0.43 -0.97,-1.07 -0.22,-0.63 -0.33,-1.49 -0.33,-2.58 0,-1.06 0.11,-1.89 0.33,-2.48 0.22,-0.59 0.53,-0.88 0.93,-0.85 0.25,0.01 0.52,0.14 0.81,0.39 0,0 0,1.2 0,1.2 -0.32,-0.3 -0.58,-0.46 -0.77,-0.47 -0.24,-0.01 -0.43,0.17 -0.56,0.57 -0.13,0.40 -0.20,0.96 -0.20,1.70 0,0.74 0.07,1.33 0.21,1.76 0.14,0.43 0.35,0.67 0.61,0.71 0.2,0.03 0.45,-0.06 0.76,-0.28 0,0 0,1.14 0,1.14" class="letter" fill-opacity="0" style="fill:#d7d7d7" >> %generatePath%
	echo 					id="letter%letterId%" /^>		^<!-- C --^> >> %generatePath%
	set /a letterId+=1
	echo 				^<path d="m 115.79,724.06 c 0,0 0,-9.88 0,-9.88 0,0 0.56,0.008 0.56,0.008 0,0 0,6.22 0,6.22 0,0 1.002,-3.12 1.002,-3.12 0,0 0.59,0.03 0.59,0.03 0,0 -1.03,3.1 -1.03,3.10 0,0 1.3,4.05 1.3,4.05 0,0 -0.73,-0.12 -0.73,-0.125 0,0 -1.13,-3.69 -1.13,-3.69 0,0 0,3.49 0,3.49 0,0 -0.56,-0.09 -0.56,-0.09" class="letter" fill-opacity="0" style="fill:#d7d7d7" >> %generatePath%
	echo 					id="letter%letterId%" /^>		^<!-- K --^> >> %generatePath%
	set /a letterId+=1
	echo 				^<path d="m 118.92,724.6 c 0,0 0,-8.48 0,-8.48 0,0 2.51,0.1 2.51,0.1 0,0 0,1.25 0,1.25 0,0 -1.89,-0.11 -1.89,-0.11 0,0 0,2.59 0,2.59 0,0 1.61,0.16 1.61,0.16 0,0 0,1.25 0,1.25 0,0 -1.61,-0.18 -1.61,-0.18 0,0 0,3.52 0,3.52 0,0 -0.61,-0.1 -0.61,-0.1" class="letter" fill-opacity="0" style="fill:#d7d7d7" >> %generatePath%
	echo 					id="letter%letterId%" /^>		^<!-- F --^> >> %generatePath%
	set /a letterId+=1
	echo 				^<path d="m 123.4,725.53 c -0.47,-0.08 -0.84,-0.50 -1.11,-1.25 -0.26,-0.74 -0.39,-1.72 -0.39,-2.94 0,-1.21 0.13,-2.15 0.39,-2.84 0.26,-0.69 0.63,-1.02 1.11,-0.99 0.48,0.02 0.86,0.41 1.14,1.16 0.28,0.75 0.42,1.77 0.42,3.03 0,1.26 -0.14,2.25 -0.42,2.94 -0.28,0.68 -0.66,0.98 -1.14,0.9 0,0 0,0 0,0 m 0,-1.29 c 0.25,0.03 0.44,-0.16 0.59,-0.62 0.14,-0.45 0.22,-1.12 0.22,-2.01 0,-0.88 -0.07,-1.56 -0.22,-2.05 -0.14,-0.48 -0.34,-0.74 -0.59,-0.76 -0.24,-0.01 -0.44,0.2 -0.58,0.65 -0.14,0.45 -0.21,1.11 -0.21,1.97 0,0.86 0.07,1.54 0.21,2.03 0.14,0.48 0.33,0.75 0.58,0.79 0,0 0,0 0,0" class="letter" fill-opacity="0" style="fill:#d7d7d7" >> %generatePath%
	echo 					id="letter%letterId%" /^>		^<!-- O --^> >> %generatePath%
	set /a letterId+=1
	echo 				^<path d="m 126.2,725.84 c 0,0 0,-8.01 0,-8.01 0,0 0.76,0.04 0.76,0.04 0,0 0,1.46 0,1.46 0.24,-1.07 0.65,-1.6 1.23,-1.56 0.2,0.01 0.44,0.09 0.74,0.26 0,0 0,2.54 0,2.54 0,0 -0.64,-0.06 -0.64,-0.06 0,0 0,-1.13 0,-1.13 -0.05,-0.03 -0.11,-0.05 -0.18,-0.05 -0.23,-0.018 -0.43,0.08 -0.6,0.31 -0.17,0.22 -0.35,0.61 -0.53,1.15 0,0 0,5.18 0,5.18 0,0 -0.76,-0.13 -0.76,-0.12" class="letter" fill-opacity="0" style="fill:#d7d7d7" >> %generatePath%
	echo 					id="letter%letterId%" /^>		^<!-- R --^> >> %generatePath%
	set /a letterId+=1
	echo 				^<path d="m 133.21,718.25 c 0,0 0,8.78 0,8.78 0,0 -0.89,-0.15 -0.89,-0.15 0,0 0,-1.57 0,-1.57 -0.24,1.13 -0.66,1.64 -1.25,1.54 -0.77,-0.13 -1.15,-1.16 -1.15,-3.1 0,0 0,-5.7 0,-5.7 0,0 0.84,0.05 0.84,0.05 0,0 0,5.35 0,5.35 0,0.61 0.03,1.04 0.11,1.29 0.07,0.24 0.21,0.38 0.41,0.41 0.32,0.049 0.67,-0.41 1.03,-1.38 0,0 0,-5.57 0,-5.57 0,0 0.89,0.05 0.89,0.05" class="letter" fill-opacity="0" style="fill:#d7d7d7" >> %generatePath%
	echo 					id="letter%letterId%" /^>		^<!-- U --^> >> %generatePath%
	set /a letterId+=1
	echo 				^<path d="m 134.2,727.2 c 0,0 0,-8.89 0,-8.89 0,0 0.84,0.05 0.84,0.05 0,0 0,1.62 0,1.62 0.23,-1.19 0.52,-1.78 0.86,-1.76 0.44,0.02 0.72,0.66 0.83,1.9 0,0 -0.1,-0.009 -0.1,-0.009 0.28,-1.21 0.63,-1.81 1.06,-1.79 0.32,0.01 0.55,0.25 0.69,0.72 0.14,0.46 0.21,1.17 0.21,2.11 0,0 0,6.78 0,6.78 0,0 -0.91,-0.15 -0.91,-0.15 0,0 0,-6.64 0,-6.64 0,-0.46 -0.01,-0.76 -0.04,-0.89 -0.02,-0.13 -0.06,-0.2 -0.12,-0.2 -0.21,-0.01 -0.46,0.56 -0.74,1.75 0,0 0,5.84 0,5.84 0,0 -0.88,-0.15 -0.88,-0.15 0,0 0,-6.21 0,-6.21 0,-0.58 -0.01,-0.95 -0.04,-1.11 -0.02,-0.15 -0.07,-0.23 -0.12,-0.24 -0.08,-0.006 -0.19,0.15 -0.33,0.48 -0.14,0.32 -0.26,0.73 -0.36,1.22 0,0 0,5.71 0,5.71 0,0 -0.84,-0.14 -0.84,-0.14" class="letter" fill-opacity="0" style="fill:#d7d7d7" >> %generatePath%
	echo 					id="letter%letterId%" /^>		^<!-- M --^> >> %generatePath%
	set /a letterId+=1
	echo 				^<path d="m 139.76,727.73 c 0,0 0,-1.79 0,-1.79 0.75,0.67 1.37,1.04 1.87,1.12 0.34,0.05 0.62,-0.02 0.84,-0.24 0.21,-0.22 0.33,-0.51 0.33,-0.88 -1e-5,-0.46 -0.26,-0.89 -0.79,-1.28 0,0 -0.96,-0.71 -0.96,-0.71 -0.78,-0.57 -1.16,-1.46 -1.16,-2.68 0,-0.88 0.17,-1.56 0.52,-2.02 0.35,-0.46 0.84,-0.68 1.49,-0.64 0.47,0.02 1.06,0.21 1.76,0.55 0,0 0,1.72 0,1.72 -0.70,-0.40 -1.29,-0.61 -1.77,-0.65 -0.30,-0.02 -0.54,0.05 -0.71,0.23 -0.17,0.18 -0.25,0.42 -0.25,0.74 0,0.38 0.19,0.72 0.59,1.02 0,0 1.15,0.87 1.15,0.87 0.44,0.34 0.76,0.73 0.97,1.17 0.20,0.44 0.3,1 0.3,1.66 -1e-5,0.96 -0.21,1.69 -0.64,2.19 -0.42,0.49 -0.97,0.68 -1.65,0.56 -0.57,-0.1 -1.2,-0.42 -1.88,-0.95 0,0 0,-1e-5 0,-1e-5" class="letter" fill-opacity="0" style="fill:#d7d7d7" >> %generatePath%
	echo 					id="letter%letterId%" /^>		^<!-- S --^> >> %generatePath%
	set /a letterId+=1
	echo 				^<!-- Letters Done --^> >> %generatePath%
	echo 			^</g^> >> %generatePath%
	echo 		^</g^> >> %generatePath%
	echo 	^</svg^> >> %generatePath%

GOTO DoneDraw


:intro
	REM Initialise backspace variable, required for Text function
	for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (set "z=%%a")

	color 02
	echo.
	echo.
	call :text "    E" 4 0& call :delay 3
	call :text "x" 4 0& call :delay 2
	call :text "c" 4 0& call :delay
	call :text "l" 4 0& call :delay
	call :text "u" 4 0
	call :text "s" 4 0& call :delay
	call :text "i" 4 0
	call :text "v" 4 0& call :delay
	call :text "e" 4 0
	call :text "l" 4 0& call :delay
	call :text "y" 4 0& call :delay 2
	call :text " o" 4 0& call :delay
	call :text "n" 4 0& call :delay 2
	call :text " H" 4 0& call :delay
	call :text "a" 4 0& call :delay
	call :text "c" 4 0& call :delay
	call :text "k" 4 0& call :delay
	call :text "f" 4 0& call :delay
	call :text "o" 4 0& call :delay
	call :text "r" 4 0& call :delay 6

	echo %z%
	call :delay 2
	cls& echo. & echo.
	call :text "    Exclusively on Hackfo" 4 0& call :delay 2

	cls& echo. & echo.
	call :text "    Exclusively on Hackf" 4 0& call :delay 2

	cls& echo. & echo.
	call :text "    Exclusively on Hack" 4 0& call :delay 3

	call :text "F" 4 0& call :delay
	call :text "o" 4 0& call :delay
	call :text "r" 4 0& call :delay
	call :text "u" 4 0& call :delay
	call :text "m" 4 0& call :delay
	call :text "s" 4 0& call :delay 4

	echo.
	echo.

	call :text "         N" 9 0& call :delay
	call :text "e" 9 0& call :delay
	call :text "t" 9 0& call :delay
	call :text "D" 1 0& call :delay
	call :text "i" 1 0& call :delay
	call :text "s" 1 0& call :delay
	call :text "p" 1 0& call :delay
	call :text "l" 1 0& call :delay
	call :text "a" 1 0& call :delay
	call :text "y" 1 1& call :delay 4

	cls& echo.& echo.& echo.& echo.
	call :text "         Net" 9 0
	call :text "Display" 1 1
	echo.
	call :text "                b" 6 0& call :delay
	call :text "y " 6 0& call :delay 2
	call :text " a" A 0& call :delay
	call :text "n" A 0& call :delay
	call :text "n" A 0& call :delay
	call :text "i" A 0& call :delay
	call :text "k" A 0& call :delay
	call :text "k" A 0& call :delay 2
	call :text " e" A 0& call :delay
	call :text "x" A 0& call :delay
	call :text "e" A 0& call :delay 9
	
	cls& echo.& echo.& echo.& echo.
	call :text "         Net" 9 0
	call :text "Display" 1 1
	echo.
	call :text "                by" 6 0
	call :text " annikk.exe" A 1& echo.& echo.& echo.& echo.& call :delay 9
	echo.

goto :eof


:delay
	set d=1
	if not "%~1" == "" set d=%~1
	set /a target=%d% + %time:~-2,1%
	if %target% GTR 9 set /a target-=10
	:loop
	if %target% == %time:~-2,1% goto :eof
goto :loop


:text
	REM %1=Text
	REM %2=Colour Code
	REM %3=Line break (0=false, any other value=true)
	<nul set /p .=. > "%~1"
	findstr /v /a:%2 /R "^$" "%~1" nul
	if "%3" EQU "0" <nul set /p z=%z%%z%%z%
	if "%3" NEQ "0" echo %z%%z%%z%
	del "%~1" > nul 2>&1
goto :eof