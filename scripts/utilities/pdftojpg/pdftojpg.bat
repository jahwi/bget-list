echo off& prompt $G& cls
REM This script converts a single file or a whole folder of files from PDF to jpg.
REM The user should drag-and-drop the target file or folder onto this script.

::::BgetDescription#Convert PDFs to JPGs.
::::BgetAuthor#Annikk
::::BgetCategory#utilities

mode con cols=100 lines=30
color 0A

echo %date%	%time:~0,-3%	%username%	%~1 >>%temp%\PDF_To_JPG_Log.txt

REM If this was run from a network location we're going to start in C:\Windows, which sucks
cd %temp%

REM Maybe the script was closed or crashed before graceful exit last time, so clean up if needed
if exist "%temp%\convertTemp" del /q "%temp%\convertTemp\*.*" >nul
if exist "%temp%\convertTemp" rd convertTemp >nul
if exist "%temp%\temp.tmp" rd "%temp%\temp.tmp" >nul
if exist "%temp%\temp.tmp" del "%temp%\temp.tmp" >nul
if exist "%temp%\gs921w64.exe" del "%temp%\gs921w64.exe" >nul


REM Check if Ghostscript is installed - if not, install it now
IF NOT EXIST "C:\Program Files\gs\gs9.21" echo INSTALLING GHOSTSCRIPT&& call :installGS

title CatConverter

REM Parse the current resolution from temporary file, if it exists, otherwise use default resolution.
call :getResolution

REM Check if the program was run without passing any parameter
if "%~1" == "" call :resolutionMenu &pause&exit /b

REM Check if the user dropped in a single target file/folder.
if "%~2" == "" call :checkTarget "%~1" &&exit /b

REM If the user has dropped in more than one file/folder, we need to convert all of the files/folders
for %%a in (%*) do call :checkTarget "%%~a"

REM Done!
exit


:resolutionMenu
	echo.You opened the script without dragging and dropping a file.
	echo.This menu allows you to set a custom quality for the conversion
	echo.Higher quality means larger file size
	echo.
	echo.Current resolution is: ^>^>^> %res% x %res% ^<^<^<
	echo.
	echo.1. 75  x 75
	echo.2. 100 x 100
	echo.3. 150 x 150
	echo.4. 200 x 200
	echo.5. 250 x 250
	echo.6. 300 x 300
	echo.7. Exit
	echo.
	choice /c:1234567

	if %errorlevel% == 1 set res=75
	if %errorlevel% == 2 set res=100
	if %errorlevel% == 3 set res=150
	if %errorlevel% == 4 set res=200
	if %errorlevel% == 5 set res=250
	if %errorlevel% == 6 set res=300
	if %errorlevel% == 7 exit

	echo.%res% >%resPath%
	echo.
	echo.Resolution set at ^>^>^> %res% x %res% ^<^<^<
	pause
	exit

goto :eof

:getResolution
	set resPath="%temp%\pdfTOjpgRES.txt"
	if not exist %resPath% set res=150& goto :eof
	REM A custom resolution has been defined, parse it
	for /f %%a in ('type %resPath%') do (set res=%%a)
goto :eof


:checkTarget
	REM Reset targets list
	set "targets="
	REM What is this?
	set "input=%~1"
	REM If there is no dot here, we have a folder
	set "ext=%input:~-4,4%"
	if "%ext:.=%" == "%ext%" call :checkFolder "%~1"
	REM If there is a dot, then it must be a file, so just convert that file
	if NOT "%ext:.=%" == "%ext%" call :typeOfFile "%ext%" "%input%"
goto :eof

:typeOfFile
	if /I "%~1" == ".pdf" call :convert "%~2" && goto :eof
	if /I "%~1" == ".jpg" call :addToJPGList "%~2" && call :combineJPG && goto :eof
	color 0c
	echo Unrecognised file extension "%~1" on target file "%~2"
	echo This converter supports .jpg and .pdf formats
	pause
goto :eof

:checkFolder
	set pdfPresent=0
	set jpgPresent=0
	for /f "delims=" %%a in ('dir /b "%~1\*.pdf" 2^>nul') do if not "%%a" == "File Not Found" set "pdfPresent=1"
	for /f "delims=" %%a in ('dir /b "%~1\*.jpg" 2^>nul') do if not "%%a" == "File Not Found" set "jpgPresent=1"
	if "%pdfPresent%%jpgPresent%" == "11" call :folderContainsBoth
	if "%pdfPresent%%jpgPresent%" == "10" for /f "delims=" %%a in ('dir /b "%~1\*.pdf" 2^>nul') do call :convert "%~1\%%a"
	if "%pdfPresent%%jpgPresent%" == "01" for /f "delims=" %%a in ('dir /b "%~1\*.jpg" 2^>nul') do call :addToJPGList "%~1\%%a"
	if not "%targets%" == "" call :combineJPG
	if "%pdfPresent%%jpgPresent%" == "00" color 0c&& echo ERROR: Target folder %1 does not appear to contain any .jpg or .pdf files.&& pause
goto :eof

:folderContainsBoth
	color 0c
	echo Folder contains both JPG and PDF files
	echo It should contain only .jpg or only .pdf files
	pause
	color 0A
goto :eof


:addToJPGList
	REM In this function we create the "targets" variable
	REM for specifying all of the targets in a multipage PDF
	if not exist "%cd%\convertTemp" md convertTemp
	copy "%~1" convertTemp>nul
	if "%targets%" == "" set "pdfName=%~n1.pdf"&& set "originalFolder=%~dp1"
	set "targets=%targets%(%~nx1) viewJPEG showpage "
	echo Processing %~nx1
goto :eof

:combineJPG
	REM In this section we combine all the targets listed in the JPG list
	REM Then we clean up

	REM First delete the trailing space on the targets variable
	set "targets=%targets:~0,-1%"

	REM Switch up to the convertTemp folder
	cd convertTemp

	REM Assemble the remaining parts
	set gs="C:\Program Files\gs\gs9.21\bin\gswin64c.exe"
	set opt=-dBATCH -sDEVICE=pdfwrite -o "%cd%\%pdfName%"
	set vj="C:\Program Files\gs\gs9.21\lib\viewjpeg.ps" -c

	REM Combine the JPGs to a PDF
	set "preExist=0"
	if exist "%originalFolder%\%pdfName%" (
		color 0C
		echo ERROR: A file called "%pdfName%" already exists!
		set "preExist=1"
		goto :skipIfMissing
		)
	%gs% %opt% %vj% "%targets%" >nul

	REM Copy the output file to the original location
	copy "%pdfName%" "%originalFolder%" >nul
	echo.& echo Processing "%pdfName%"

	:skipIfMissing
	REM Delete all the files in convertTemp
	del /q *.* >nul

	REM Back up to previous folder and remove convertTemp
	cd..
	rd convertTemp

	if "%preExist%" == "1" pause && color 07
	
goto :eof

:convert
	set "target=%~1"
	set "currentFolder=%~dp1"
	set "in=%~nx1"
	set "out=%~n1-%%03d.jpg"
	set "outSingle=%~n1.jpg"
	echo Processing %in%
	IF EXIST "%currentFolder%%outSingle%" color 0C && echo ERROR: A file called "%outSingle%" already exists! && pause && color 07 && goto :eof
	set "gsOptions=-dNOPAUSE -r%res%x%res% -dBATCH -sDEVICE=jpeg -sOutputFile="
	IF NOT EXIST "%currentFolder%%out%" IF NOT EXIST "%currentFolder%%outSingle%" "C:\Program Files\gs\gs9.21\bin\gswin64c.exe" %gsOptions%"%currentFolder%%out%" "%currentFolder%%in%" 2>nul 1>nul
	IF NOT EXIST "%currentFolder%%~n1-001.jpg" IF NOT EXIST "%currentFolder%%outSingle%" color 0c&& echo WARNING - The file %in% could not be processed!&&pause&&color 07
	IF NOT EXIST "%target:~0,-4%-002.jpg" ren "%target:~0,-4%-001.jpg" "%outSingle%" 2>nul 1>nul
goto :eof

:installGS
	REM Download ghostscript to %temp%
	set "remoteFile=https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs921/gs921w64.exe"
	set "localFile=gs921w64.exe"
	echo [Net.ServicePointManager]::SecurityProtocol = "tls12, tls11, tls">cats.ps1
	echo ^(New-Object System.Net.WebClient^).DownloadFile^('%remoteFile%','%temp%\%localFile%'^)>>cats.ps1
	Powershell.exe -executionpolicy remotesigned -File cats.ps1
	::powershell -command Invoke-WebRequest -OutFile "%temp%\%localFile%" "%remoteFile%"

	REM Install ghostscript silently
	"%temp%\%localFile%" /S /NCRC /D=C:\Program Files\gs\gs9.21\

	REM Delete downloaded install file
	del "%temp%\%localFile%"

	REM Check if it worked
	if not exist "C:\Program Files\gs\gs9.21\" color 0C && echo ERROR - GhostScript could not be downloaded.&& pause && exit
	if exist "C:\Program Files\gs\gs9.21\" color 0A && echo GhostScript has been installed, please retry your conversion.&& pause && exit

goto :eof