@ECHO OFF&SETLOCAL EnableDelayedExpansion
MODE 120,31
COLOR 1B
TITLE Internet Uptime Monitoring - Initialising

::::BgetDescription#Monitors and logs internet uptime.
::::BgetAuthor#Limn0
::::BgetCategory#tools

SET "Minutes=0"
SET "InternetConnectedFlag=true"

:MAIN
SET "LogFile=.\InternetUptime!DATE!.log"
CALL :GetInternetConnection
TIMEOUT /T 60 >NUL
GOTO :MAIN

:GetInternetConnection
IF /i "!InternetConnectedFlag!"=="true" (
	SET "Minutes=0"
)
PING -n 3 -w 1000 8.8.8.8 | find /i "bytes=" >NUL
IF !ERRORLEVEL! EQU 0 (
	IF /i "!InternetConnectedFlag!"=="false" (
		CALL :GetDate
		CALL :GetTime
		CALL :LogProgress
		ECHO.Ereignis wurde in das LogFile "!LogFile!" geschrieben.
		ECHO.Internetverbindung wieder hergestellt.
	)
	SET "InternetConnectedFlag=true"
) ELSE (
	IF  /i "!InternetConnectedFlag!"=="true" (
		CALL :GetDate
		CALL :GetTime
		SET "InternetOutageStartPoint=!DD!.!MO!.!YYYY! !HH!:!MI!:!SS!"
	)
	ECHO.Keine Verbindung zum Internet. Zustand ist seit !Minutes! Minuten so. Start des Internetausfalls: !InternetOutageStartPoint!
	SET /A Minutes+=1
	SET "InternetConnectedFlag=false"
)
TITLE Internet Uptime Monitoring - I:!InternetConnectedFlag! M:!Minutes! IOSP:!InternetOutageStartPoint!
EXIT /B

:GetDate
SET "TmpDate=!DATE!"
SET "DD=!TmpDate:~0,2!"
SET "MO=!TmpDate:~3,2!"
SET "YYYY=!TmpDate:~6,4!"
EXIT /B

:GetTime
SET "TmpTime=!TIME!"
SET "HH=!TmpTime:~0,2!"
SET "MI=!TmpTime:~3,2!"
SET "SS=!TmpTime:~6,2!"
EXIT /B

:LogProgress
IF EXIST "!LogFile!" (
	ECHO.[WARN][!DD!.!MO!.!YYYY! !HH!:!MI!:!SS!] Keine Verbindung zum Internet möglich. Zustand war seit !Minutes! Minuten so. Start des Internetausfalls: !InternetOutageStartPoint! >>"!LogFile!"
) ELSE (
	ECHO.Internet Uptime Monitoring>"!LogFile!"
	ECHO.-------------------------->>"!LogFile!"
	ECHO.[WARN][!DD!.!MO!.!YYYY! !HH!:!MI!:!SS!] Keine Verbindung zum Internet möglich. Zustand war seit !Minutes! Minuten so. Start des Internetausfalls: !InternetOutageStartPoint! >>"!LogFile!"
)
EXIT /B
