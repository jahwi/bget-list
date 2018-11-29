::-------------------------------------------------------------------------------
:bin2enc [/Cn /Kn /Fn] source\folder[\file] [destination\folder]            v0.3
:: 
::  Generates .CAB or self-extracting batch script from a source file or folder
::  using MakeCab + Expand/Extract (compression) + CertUtil (Base64 encoding).
:: 
::  /Cn compression 0=default=make both and keep smallest, 1=MSZIP, 2=LZX
::  /Kn keepSrcDir  0=default=ignore folder, 1=retain source folder in archive
::  /Fn fileType    0=default=make archive.cab, 1=make self-extracting.cmd
::-------------------------------------------------------------------------------
::
:: v0.3
:: Corrected extraction to use Extract/Extrac32 if installed version of
:: Expand is lower than 6.x, as previous versions ignore paths in CABs.
:: Cleaned up 'best compression' code just a bit by removing redundancies.
::
:: v0.2
:: Added commandline options, auto-choose MSZIP/LZX best compression,
:: and improved the MakeCab.ddf settings.
::

::::BgetDescription#Generates .CAB or self-extracting batch script from a source file or folder.
::::BgetAuthor#CirothUngol
::::BgetCategory#utilities

@ECHO OFF
SETLOCAL EnableExtensions EnableDelayedExpansion
SET "compression=0"   ' 0=make both and keep smallest, 1=MSZIP, 2=LZX
SET "keepSrcDir=0"    ' 0=ignore folder, 1=retain source folder in archive
SET "fileType=0"      ' 0=make archive.cab, 1=make self-extracting.cmd
SET "targetDir=%~dp0" ' default destination folder for creating files
SET "SELF=%~f0"

:bin2enc_parse
:: /Cn /Kn /Fn else shift and ignore
SET "par=%~1"
IF /I "!par:~0,1!"=="/" ( SHIFT
	IF /I "!par:~1,1!"=="C" SET /A "compression=!par:~2!" 2>NUL
	IF /I "!par:~1,1!"=="K" SET /A "keepSrcDir=!par:~2!" 2>NUL
	IF /I "!par:~1,1!"=="F" SET /A "fileType=!par:~2!" 2>NUL
	GOTO :bin2enc_parse
)

:: exit if no input, input doesn't exist, or file count=0
SET count=0
IF NOT EXIST "%~1" GOTO :bin2enc_help
FOR /F %%A IN ('DIR /B "%~f1" 2^>NUL') DO SET /A "count+=1"
IF %count% EQU 0 GOTO :bin2enc_help

:: get full path to source/target
FOR %%A IN ("%~1") DO SET "source=%%~fA" & SET "sPath=%%~pnxA" & SET "cabName=%%~nxA"
FOR %%A IN ("%~2") DO SET "target=%%~fA"
IF NOT DEFINED target SET "target=!targetDir!"
MD "!target!" 2>NUL
IF %keepSrcDir% EQU 0 (SET "destDir=") ELSE SET "destDir=!cabName!"

:: Add the header to the cabinet config file
IF %compression% LEQ 1 (SET "ct=MSZIP") ELSE SET "ct=LZX"
SET "targetFile=!target!\!cabName!"
>"!targetFile!.ddf" (
	ECHO(; Generated on %DATE% at %TIME: =0%
	ECHO(.New Cabinet
	ECHO(.Set CabinetNameTemplate="!cabName!.cab"
	ECHO(.Set DiskDirectoryTemplate="!target!"
	ECHO(.Set GenerateInf=OFF
	ECHO(.Set Cabinet=ON
	ECHO(.Set Compress=ON
	ECHO(.Set UniqueFiles=ON
	ECHO(.Set MaxDiskSize=1215751680
	ECHO(.Set RptFileName=NUL
	ECHO(.Set InfFileName=NUL
	ECHO(.Set MaxErrors=1
	ECHO(.Set CompressionMemory=21
)

:: if source is folder add files iteratively
IF EXIST "!source!\" (
	FOR /D /R "%source%" %%A IN (*) DO (
		SET "tDir=%%~pnxA"
		SET "dDir=!destDir!!tDir:%sPath%=!"
		ECHO(Adding !cabName!!tDir:%sPath%=!
		ECHO(.Set DestinationDir=!dDir!>>"!targetFile!.ddf"
		FOR %%B IN ("%%A\*") DO ECHO("%%~fB"  /inf=no>>"!targetFile!.ddf"
	)
	ECHO(Adding !cabName!
	ECHO(.Set DestinationDir=!destDir!>>"!targetFile!.ddf"
	FOR %%A IN ("!source!\*") DO ECHO("%%~fA"  /inf=no>>"!targetFile!.ddf"
	ECHO(
) ELSE ECHO("!source!"  /inf=no>>"!targetFile!.ddf"
ECHO(CompressionType=!ct!
MakeCab /D CompressionType=!ct! /F "!targetFile!.ddf"

:: second compression
IF %compression% LEQ 0 ( ECHO(
	ECHO(CompressionType=LZX
	REN "!targetFile!.cab" "!cabName!.zip.cab"
	MakeCab /D CompressionType=LZX /F "!targetFile!.ddf"
	FOR %%A IN ("!targetFile!.cab") DO FOR %%B IN ("!targetFile!.zip.cab") DO (
		IF %%~zA GEQ %%~zB ( DEL /F /A "!targetFile!.cab"
			REN "!targetFile!.zip.cab" "!cabName!.cab" 
		) ELSE SET "ct=LZX" & DEL /F /A "!targetFile!.zip.cab"
	)
	ECHO(
	ECHO(Keeping !ct!
)
DEL /F /A "!targetFile!.ddf"
IF %fileType% EQU 0 ENDLOCAL & EXIT /B 0

:: Generate self-extracting script
ECHO(
CertUtil /encode "!targetFile!.cab" "!targetFile!.b64"
>"!targetFile!.b64.cmd" (
	ECHO(:: !cabName!.b64.cmd [target\folder] [noExpand]
	ECHO(:: ErrorLevel: 0=success, 1=no CertUtil install Administration Tools
	ECHO(@ECHO OFF
	ECHO(FOR /F "tokens=3-12" %%%%A IN ^('Expand'^) DO ^(
	ECHO(	SETLOCAL EnableExtensions EnableDelayedExpansion
	ECHO(	SET "fn=!cabName!.cab"
	ECHO(	IF "%%~1"=="" ^(SET "tf=%%~dp0"^) ELSE SET "tf=%%~1" ^& MD "%%~1"
	ECHO(	IF "^!tf:~-1^!"=="\" SET "tf=^!tf:~0,-1^!"
	ECHO(	CertUtil -decode -f "%%~f0" "^!TEMP^!\^!fn^!"
	ECHO(	IF ^^!ERRORLEVEL^^!==9009 ENDLOCAL ^& EXIT /B 1
	ECHO(	IF "%%~2"=="" ^(SET /A "ev=%%%%J%%%%I%%%%H%%%%G%%%%F%%%%E%%%%D%%%%C%%%%B%%%%A"
	ECHO(		IF ^^!ev^^! GEQ 6 ^(Expand -R "^!TEMP^!\^!fn^!" -F:* "^!tf^!"
	ECHO(		^) ELSE Extract /Y /E /L "^!tf^!" "^!TEMP^!\^!fn^!"
	ECHO(		IF ^^!ERRORLEVEL^^!==9009 START "" /MIN /WAIT Extrac32 /Y /E /L "^!tf^!" "^!TEMP^!\^!fn^!"
	ECHO(		IF ^^!ERRORLEVEL^^!==0 DEL /F /A "^!TEMP^!\^!fn^!"^)
	ECHO(	MOVE /Y "^!TEMP^!\^!fn^!" "^!tf^!" ^& RD "%%~1"
	ECHO(	ENDLOCAL ^& EXIT /B 0^) ^>NUL 2^>^&1
	TYPE "!targetFile!.b64"
)
DEL /F /A "!targetFile!.cab" "!targetFile!.b64"
ENDLOCAL & EXIT /B 0

:bin2enc_help
FOR /F "usebackq tokens=* delims=:" %%A IN ("%SELF%") DO IF "%%A" NEQ "" (ECHO(%%A) ELSE ENDLOCAL & EXIT /B 0