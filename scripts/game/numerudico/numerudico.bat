@ECHO OFF
::::BgetDescription#Number-themed sums game.
::::BgetAuthor#LowSun
::::BgetCategory#game
::::BgetTags#number;numbers;123
SETLOCAL ENABLEDELAYEDEXPANSION
MODE 60, 30
FOR /F %%A in ('ECHO prompt $E^| cmd') DO SET "ESC=%%A"
SET framerate=FOR /L %%J in (1,50,1000000) DO REM
SET col=%ESC%[38;2;cm
SET bcl=%ESC%[48;2;cm
SET up=%ESC%[nA
SET dn=%ESC%[nB
SET bk=%ESC%[nD
SET nx=%ESC%[nC
ECHO %ESC%[?25l

:MENU
ECHO %ESC%[2J%ESC%[12;24H%col:c=0;0;0%%bcl:c=255;255;255% Numerudico %ESC%[0m%ESC%[18;5H^| A : 2 Player ^|%ESC%[20;22H^| B : 3 Player ^|%ESC%[22;37H^| C : 4 Player ^|
(CHOICE /C ABC /N)>NUL
SET /A "num[p]=%errorlevel%+1","num[g]=%RANDOM%*(20-10+1)/32768+10"
FOR /L %%W in (1, 1, %num[p]%) DO (
    SET "num[q]=!num[q]!%%W"
    SET "display=!display!%ESC%[s-^^^| PLAYER %%W : ^^^!num[%%Wp]^^^! ^^^|-%ESC%[u%dn:n=1%"
    SET /A "current=%%W","num[%%Wp]=0"
    FOR /L %%Q in (1, 1, 5) DO (
        CALL :DRAWCARD
    )
)

:GAME
FOR /L %%# in () DO (
    FOR %%P in (!current!) DO (
        FOR /L %%N in (1, 1, !num[%%Pc]!) DO (
            SET "num[u]=!num[u]!%%N"
            SET "crd[%%Pp]=!crd[%%Pp]!%bcl:c=255;255;255%    %dn:n=1%%bk:n=4% %col:c=0;0;0%!crd[%%P.%%N]! %dn:n=1%%bk:n=4%    %nx:n=2%%up:n=2%"
        )
        ECHO %ESC%[0m%ESC%[2J%ESC%[8;5HNUMBER : %num[g]%%ESC%[10;5H%display%%ESC%[18;5HPLAYER !current! -^^^| (1 - !num[%%Pc]!^) Card ^^^|-^^^| Q to End Turn ^^^|-%ESC%[20;5H!crd[%%Pp]!
        (CHOICE /C !num[u]!Q /N)>NUL
        IF !errorlevel! GTR !num[%%Pc]! (
            IF !num[%%Pc]! LSS 9 (
                CALL :DRAWCARD
            )
            SET /A "current+=1"
            IF !current! GTR %num[p]% (
                SET "current=1"
            )
        ) else (
            FOR %%F in (!errorlevel!) DO (
                ECHO %ESC%[0m%ESC%[24;5H-^^^| (1 - %num[p]%^) Player ^^^|-^^^| Selected : !crd[%%P.%%F]! ^^^|-^^^| D to Decline ^^^|-
                (CHOICE /C %num[q]%D /N)>NUL
                IF !errorlevel! LEQ %num[p]% (
                    FOR %%E in (!errorlevel!) DO (
                    SET /A "num[%%Ep]=!num[%%Ep]!!crd[%%P.%%F]!","num[r]=%%E+9"
                        FOR /L %%@ in (1, 1, 3) DO (
                            ECHO %bcl:c=255;255;255%%col:c=0;0;0%%ESC%[!num[r]!;5H-^^^| PLAYER %%E : !num[%%Ep]! ^^^|-
                            %framerate%
                            ECHO %ESC%[0m%ESC%[!num[r]!;5H-^^^| PLAYER %%E : !num[%%Ep]! ^^^|-
                            %framerate%
                        )
                        IF !num[%%Ep]! EQU %num[g]% (
                            ECHO %ESC%[26;5HPLAYER %%E Victory^^!
                            (PAUSE)>NUL
                            CALL :MENU
                        )
                        CALL :SHIFT %%F
                    )
                )
            )
        )
        SET "num[u]="&SET "crd[%%Pp]="
    )
)

:DRAWCARD
SET /A "num[r]=%RANDOM%*16/32768+1","num[%current%c]+=1"
FOR /F "tokens=%num[r]% delims=$" %%Q in ("+1$+2$+3$+4$+5$-1$-2$-3$-4$-5$*2$*5$*4$/2$/4$/5") DO (
    SET "crd[%current%.!num[%current%c]!]=%%Q"
)
GOTO :EOF

:SHIFT <card>
FOR /L %%# in (!num[%current%c]!, -1, %1) DO (
    FOR /F %%Q in ("!crd[%current%.%%#]!") DO (
        SET "crd[%current%.%%#]=!crd[d]!"
        SET "crd[d]=%%Q"
    )
)
SET /A "num[%current%c]-=1"
GOTO :EOF
