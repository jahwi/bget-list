@ECHO OFF & SETLOCAL EnableDelayedExpansion
MODE 100,20
COLOR F1
TITLE GoogleDorkQuery
::::BgetDescription#Build custom google dorks.
::::BgetAuthor#JohnnyCache
::::BgetCategory#tools
CALL :SetVars
REM Create and enable your own dork by setting the Custom Variable below
REM for example "Custom=§|fileextension1|abc|etc|§"
SET "Custom="

:Main
CLS
ECHO.Nr Type        Status
SET "a=1"
FOR %%A IN (Video Text Audio Picture Software Compressed Custom) DO (
	IF "!%%AS!"=="0" (
		SET "%%AStatus=Disabled"
	) ELSE IF NOT DEFINED %%AS (
		SET "%%AStatus=Disabled"
	) ELSE (
		SET "%%AStatus=Enabled"
		CALL :CompileDork
	)
	IF "%%A"=="Custom" (
		SET "a=9"
	)
	IF DEFINED %%A (
		ECHO.!a!. %%A!%%ASpace![!%%AStatus!]
		SET /A "a+=1"
	)
)
ECHO.
ECHO.
IF DEFINED ErrorMsg (
	ECHO.ERROR:!ErrorMsg!
) ELSE (
	ECHO.
)
SET "ErrorMsg="
ECHO.
ECHO.Search string: !SearchString!
ECHO.
ECHO.Your dork: !CompiledDork!
ECHO.
ECHO.Keys:
IF DEFINED Custom (
	ECHO. [1]  [2]  [3]  [4]  [5]  [6]      [7]  [8]  [9]
	ECHO. VID  TXT  AUD  PCT  SFT  CMP      SRC  SND  CUS
	CHOICE /C 123456789 >NUL
) ELSE (
	ECHO. [1]  [2]  [3]  [4]  [5]  [6]      [7]  [8]
	ECHO. VID  TXT  AUD  PCT  SFT  CMP      SRC  SND
	CHOICE /C 12345678 >NUL
)
IF "%ERRORLEVEL%"=="1" (
	IF "!VideoS!"=="1" (
		SET "VideoS=0"
		CALL :CompileDork
	) ELSE (
		SET "VideoS=1"
		CALL :CompileDork
	)
)
IF "%ERRORLEVEL%"=="2" (
	IF "!TextS!"=="1" (
		SET "TextS=0"
		CALL :CompileDork
	) ELSE (
		SET "TextS=1"
		CALL :CompileDork
	)
)
IF "%ERRORLEVEL%"=="3" (
	IF "!AudioS!"=="1" (
		SET "AudioS=0"
		CALL :CompileDork
	) ELSE (
		SET "AudioS=1"
		CALL :CompileDork
	)
)
IF "%ERRORLEVEL%"=="4" (
	IF "!PictureS!"=="1" (
		SET "PictureS=0"
		CALL :CompileDork
	) ELSE (
		SET "PictureS=1"
		CALL :CompileDork
	)
)
IF "%ERRORLEVEL%"=="5" (
	IF "!SoftwareS!"=="1" (
		SET "SoftwareS=0"
		CALL :CompileDork
	) ELSE (
		SET "SoftwareS=1"
		CALL :CompileDork
	)
)
IF "%ERRORLEVEL%"=="6" (
	IF "!CompressedS!"=="1" (
		SET "CompressedS=0"
		CALL :CompileDork
	) ELSE (
		SET "CompressedS=1"
		CALL :CompileDork
	)
)
IF "%ERRORLEVEL%"=="7" (
	IF NOT DEFINED SearchString (
		SET /P "SearchString=Please enter the search string: "
	) ELSE (
		ECHO.Do you want to overwrite the existing SearchString? [y/N]
		CHOICE /C YN >NUL
		IF "%ERRORLEVEL%"=="1" (
			SET /P "SearchString=Please enter the search string: "
		)
		IF "%ERRORLEVEL%"=="2" (
			GOTO :Main
		)
	)
)
IF "%ERRORLEVEL%"=="8" (
	IF "!CompiledDork!"=="Empty" (
		SET "ErrorMsg=No dorks enabled"
		GOTO :Main
	)
	IF NOT DEFINED SearchString (
		SET "ErrorMsg=No SearchString defined"
		GOTO :Main
	)
	GOTO :EncodeAndStart
)
IF DEFINED Custom (
	IF "%ERRORLEVEL%"=="9" (
		IF "!CustomS!"=="1" (
			SET "CustomS=0"
			CALL :CompileDork
		) ELSE (
			SET "CustomS=1"
			CALL :CompileDork
		)
	)
)
GOTO :Main
TIMEOUT /T 3 >NUL
EXIT /B

:SetVars
SET "BaseURL=https://www.google.com/search?q="
SET "BaseDork= -inurl:(jsp|pl|php|html|aspx|htm|cf|shtml) intitle:index.of \"last modified\" -inurl:(index_of)"
SET "VideoSpace=       "
SET "TextSpace=        "
SET "AudioSpace=       "
SET "PictureSpace=     "
SET "SoftwareSpace=    "
SET "CompressedSpace=  "
SET "CustomSpace=      "
SET "VideoS=0"
SET "TextS=0"
SET "AudioS=0"
SET "PictureS=0"
SET "SoftwareS=0"
SET "CompressedS=0"
SET "CustomS=0"
SET "Video=§|avi|mkv|mov|mp4|mpg|wmv|§"
SET "Text=§|CBZ|CBR|CHM|DOC|DOCX|EPUB|MOBI|ODT|PDF|RTF|txt|§"
SET "Audio=§|ac3|flac|m4a|mp3|ogg|wav|wma|§"
SET "Picture=§|bmp|gif|jpg|png|psd|tif|tiff|§"
SET "Software=§|apk|exe|iso|rar|tar|zip|§"
SET "Compressed=§|7z|bz2|gz|iso|rar|zip|§"
SET "CompiledDork=Empty"
EXIT /B

:CompileDork
REM Compile to display
SET "DisabledMods=0"
IF NOT DEFINED SearchString (
	SET "SearchString=YourSearchString"
)
SET "CompiledDork=<base> !SearchString!"
IF DEFINED Custom (
	FOR %%A IN (Video Text Audio Picture Software Compressed Custom) DO (
		SET "CurrMod=%%A"
		IF NOT "!%%AS!"=="0" (
			SET "CompiledDork=!CompiledDork! <!CurrMod!Dork>"
		) ELSE (
			SET /A "DisabledMods+=1"
		)
	)
	IF "!DisabledMods!"=="7" (
		SET "CompiledDork=Empty"
	)
) ELSE (
	FOR %%A IN (Video Text Audio Picture Software Compressed) DO (
		SET "CurrMod=%%A"
		IF NOT "!%%AS!"=="0" (
			SET "CompiledDork=!CompiledDork! <!CurrMod!Dork>"
		) ELSE (
			SET /A "DisabledMods+=1"
		)
	)
	IF "!DisabledMods!"=="6" (
		SET "CompiledDork=Empty"
	)
)
IF "!SearchString!"=="YourSearchString" (
	SET "SearchString="
)
EXIT /B

:GetBrowser
SET "CNT=1"
ECHO.Choose a browser from below.
FOR /F "tokens=2,*" %%A IN ('REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\Clients\StartMenuInternet" /ve 2^>NUL') DO SET "DefaultBrowser=%%B"
FOR /F "skip=3 delims=" %%A IN ('REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\Clients\StartMenuInternet" 2^>NUL') DO (
    IF "%%~nxA"=="!DefaultBrowser!" (
        ECHO.!CNT!. %%~nA [Default]
    ) ELSE (
        ECHO.!CNT!. %%~nA
    )
	SET "CNTARR=!CNTARR!!CNT!"
	SET "CNTARR2=!CNTARR2! !CNT!"
    SET /A "CNT+=1"
)
CHOICE /C !CNTARR!
SET "XERR=!ERRORLEVEL!"
SET "CNT=1"
FOR /F "skip=3 delims=" %%A IN ('REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\Clients\StartMenuInternet" 2^>NUL') DO (
    IF "!XERR!"=="!CNT!" SET "BRChoice=%%~A"
    SET /A "CNT+=1"
)
FOR /F "tokens=2,*" %%A IN ('REG QUERY "%BRChoice%\shell\open\command" /ve 2^>NUL') DO SET "Starter=%%~B"
EXIT /B
:EncodeAndStart
SET "ReadyDork=!BaseURL!!SearchString! ("
FOR %%A IN (Video Text Audio Picture Software Compressed) DO (
	IF NOT "!%%AS!"=="0" (
		SET "ReadyDork=!ReadyDork!!%%A!"
	)
)
SET "ReadyDork=!ReadyDork!) !BaseDork!"
SET "ReadyDork=!ReadyDork: =+!"
SET "ReadyDork=!ReadyDork:|§§|=%%7C!"
SET "ReadyDork=!ReadyDork:§|=!"
SET "ReadyDork=!ReadyDork:|§=!"
SET "ReadyDork=!ReadyDork:|=%%7C!"
SET "ReadyDork=!ReadyDork:\=%%22!"
CALL :GetBrowser
START "" "!Starter!" !ReadyDork!
TIMEOUT /T 5 >NUL
EXIT
