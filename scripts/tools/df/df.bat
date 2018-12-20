@echo off
::::BgetDescription#Query free disk space of a drive
::::BgetAuthor#skaybay
::::BgetCategory#tools
setlocal enabledelayedexpansion
set drive=%~1
if not defined drive (
	echo Usage: %~n0 drive:
	echo E.g %~n0 C:
	exit /b
)

fsutil volume diskfree %drive%| findstr "avail" > %temp%/c_space_free.txt
 
FOR /F "tokens=8" %%a IN (%temp%/c_space_free.txt) DO (
	set space_free=%%a
	)

set /a freeGB=%space_free:~0,-5%*100
fsutil volume diskfree %drive%| findstr /v free > %temp%/c_space_total.txt 

FOR /F "tokens=6" %%a IN (%temp%/c_space_total.txt ) DO (
	set space_total=%%a
	)

set /a totalGB=%space_total:~0,-5%
set /a percent=%freeGB%/%totalGB%

echo Free space on %drive%/ : %percent%%%