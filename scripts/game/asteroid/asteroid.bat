::Multithreading technique taken from IcarusLives
::Rem millisecond code taken from IcarusLives
::::BgetDescription#[WIN 10 ONLY] Avoid asteroids falling down to earth.
::::BgetAuthor#LowSun
::::BgetCategory#game
::::Bgettags#rock;dodge
<!-- : Begin batch script
@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION
MODE 70,20

IF "%controller%" == "enabled" (
    IF not "%~1" == "" (
        GOTO :%~1
    )
)


FOR /F %%A in ('ECHO prompt $E^| cmd') DO SET "ESC=%%A"

CALL :MACROS

SET controller=enabled
SET controls=AD
SET music=START /B CSCRIPT //NOLOGO "%~f0?.wsf" //JOB:t s.mp3
SET framerate=FOR /L %%J in (1,50,1000000) DO REM
SET unitcol=100;244;182
SET ictos=%ESC%[6;5H_         .%ESC%[7;5H^|   ___  _/_     __.    ____%ESC%[8;5H^| .'   `  ^|    .'   \  (%ESC%[9;5H^| ^|       ^|    ^|    ^|  `--.%ESC%[10;5H/  `._.'  \__/  `._.' \___.'

SET horz=35
SET ground=лллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
SET asteroids=3
SET fallrate=35
SET wave=1
SET movA=-1
SET movD=1
SET highscore=0
(MORE <Ictos.bat:IctosHighScore) && (
    FOR /F %%G in ('MORE ^<Ictos.bat:IctosHighScore') DO (
        SET highscore=%%G
    )
)
ECHO %ESC%[2J%ESC%[?25l

:MENU
<NUL SET /P "=%ESC%[2;5HLowsun 2018%ictos%%ESC%[12;5HHighscore : %highscore%%ESC%[6;45HCONTROLS%ESC%[8;45HA to move Left%ESC%[10;45HD to move Right%ESC%[38;2;!unitcol!m%ESC%[19;5Hл"
PAUSE > NUL
FOR /L %%E in (5, 1, 35) DO (
    <NUL SET /P "=%ESC%[2K%ESC%[19;%%EHл"
    %framerate%
)

IF "%controller%" == "enabled" (
    IF exist "%temp%\%~n0_signal.txt" (
        DEL "%temp%\%~n0_signal.txt"
    )
    "%~F0" CONTROL %controls% >"%temp%\%~n0_signal.txt" | "%~F0" GAME <"%temp%\%~n0_signal.txt"
)

:GAME
FOR /L %%G in () DO (
    IF "%controller%" == "enabled" (
        SET "com="
        SET /P "com="
    )
    SET /A count+=1
    (%every% !fallrate! !count!) && (
        FOR /L %%A in (1, 1, !asteroids!) DO (
            SET /A "asterplac=!RANDOM! * (70 - 1 + 1^) / 32768 + 1", "asternum+=1"
            SET "asterstring=!asterstring! [!asternum!]"
            SET aster[!asternum!]=1;!asterplac!
        )
    )
    (%every% 75 !count!) && (
        SET /A wave+=1
        (SET /A "1/(((!asteroids!-51)>>31)&1)") && (
            SET /A asteroids+=1
        )
        (SET /A "1/(((1-!fallrate!)>>31)&1)") && (
            SET /A fallrate+=1
        )
    )
    FOR %%Y in (!asterstring!) DO (
        FOR /F "tokens=1-2 delims=;" %%E in ("!aster%%Y!") DO (
            SET /A newast=%%E + 1
            (SET /A "1/(((~(!newast!-20)>>31)&1)&(((~(%%F-!horz!)>>31)&1)&((~(!horz!-%%F)>>31)&1)))" 2>NUL) && (
                (SET /A "1/(((%highscore%-!wave!)>>31)&1)" 2>NUL) && (
                    <NUL SET /P "=%ESC%[3;2HNew Highscore^!"
                    ECHO !wave!>Ictos.bat:IctosHighscore
                )
                EXIT
            )
            (SET /A "1/((~(!newast!-20)>>31)&1)" 2>NUL) && (
                SET "aster%%Y="
                SET asterstring=!asterstring:%%Y=!
            ) || (
                SET aster%%Y=!newast!;%%F
                SET asterdisp=!asterdisp!%ESC%[!newast!;%%FHл
            )
        )
    )
    <NUL SET /P "=%ESC%[2J%ESC%[2;2HWave : !wave!%ESC%[38;2;178;33;10m!asterdisp!%ESC%[20;1H%ground%%ESC%[38;2;!unitcol!m%ESC%[19;!horz!Hл"
    SET /A horz+=!com! 2>NUL
    (SET /A "1/((((!horz!-0)>>31)&1)|(((70-!horz!)>>31)&1))" 2>NUL) && (
        SET /A horz-=!com!
    )
    SET "asterdisp="
    %framerate%
)

:CONTROL
IF "%controller%" == "enabled" (
    FOR /L %%C in () do (
        FOR /F "tokens=*" %%A in ('CHOICE /C:%~2 /N') DO (
            <NUL SET /P ".=!mov%%A!"
        )
    )
)
GOTO :EOF

:MACROS
SET ^"LF=^

^" Above empty line is required - do not remove
SET ^"\n=^^^%LF%%LF%^%LF%%LF%^^"

SET every=for %%# in (1 2) do if %%#==2 ( for /f "tokens=1-2" %%A in ("^!args^!") DO (%\n%
    SET /A "rate=%%B %% %%A"%\n%
    IF "^!rate^!" NEQ "0" (%\n%
        SET /A "=2+2"2^>nul%\n%
    )%\n%
)) else SET args=
GOTO :EOF
