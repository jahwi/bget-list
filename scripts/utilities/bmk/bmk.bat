@echo off
setlocal enabledelayedexpansion
REM BMK - File bokmarking tool.
REM by Jahwi in 2020

::::BgetDescription#NTFS File bookmarking tool. Find the location of moved bookmarked files.
::::BgetAuthor#Jahwi
::::BgetCategory#utilities
REM create dir
if not exist %appdata%\bmk mkdir "%appdata%\bmk" >nul
set bmkfile=%appdata%\bmk\bmk.txt 

REM intro
echo BookMarK - NTFS File Bokmarking tool.
echo.


REM error check

REM check for no args
if "%~1" == "" (
    call :help
    echo Error: No arguments supplied.
    exit /b
)

REM help arg
if /i "%~1" == "/h" (
    call :help
    exit /b
)

REM check if file exists
if /i not "%~1" == "/w" (
    if not exist "%~1" (
        echo Error: File "%~1" does not exist.
        exit /b
    )
)

:main

REM adding a file to the bookmark list
if /i not "%~1" == "/w" (
    for /f "delims=" %%a in ('fsutil file queryFileId "%~1"') do (
        set line=%%~a
        REM check for error
        if /i "%%~a" == "Error:  The system cannot find the file specified." (
            echo Error: File "%~1" does not exist.
            exit /b
        )

        if not "!line:~0,11!" == "File ID is " (
            echo Error: Could not get File ID.
            exit /b
        )

        REM get file id
        set fileid=!line:~11!
        REM echo FileId: !fileid!

        REM check for duplicate fileIDs in bmkfile using findstr
        findstr /c:"!fileid!" "!bmkfile!" >nul
        if "!errorlevel!" == "0" (
            echo File "%~1" has already been bookmarked.
            exit /b
        )
        REM export to bookmark file
        echo -/%~d1/%~nx1/%~f1/!fileid!/%date:/=-%>>"!bmkfile!"
        if errorlevel 0 echo %~1 - Bookmarked.
        if not errorlevel 0 echo %~1 - Failed.
    )
    exit /b
)

REM find previously-bookmarked files
if /i "%~1" == "/w" (

    if /i "%~2" == "" (
        echo Error: No file supplied.
        exit /b
    )

    REM error check

    rem check if bookmarks file exists
    if not exist "!bmkfile!" (
        echo Error: Bookmarks file does not exist.
        exit /b
    )

    rem check if record exists in bookmarks file
    echo Bookmarked files matching "%~2":
    set found_count=0
    set lines=0
    for /f "tokens=1-6 delims=/" %%a in (!bmkfile!) do (
        if "%%~a" == "-" (
            set /a lines+=1
            if /i "%~nx2" == "%%~c" (
                for /f "delims=" %%? in ('fsutil file queryfilenamebyid %%~b %%~e') do (
                    set return=%%?
                    if /i "!return:~0,8!" == "A random" (
                        set /a found_count+=1
                        set rndlink=!return:~35!
                        echo %%~c FROM %%~d - !rndlink! - %%~f
                    )
                    
                ) 
                
            )
        )
    )
    if !found_count! LSS 1 echo No matches found.
    if !lines! LSS 1 echo Bookmarks file appears to contain no records.
    exit /b
)

exit /b


:help
REM print help info and exit
echo Usage: %~0 [/w] [/h] file
echo /w - Returns the location of a previously bokmarked file.
echo /h - Prints the help screen.
echo.
echo To bookmark a file, simply run %~0 file.
exit /b

