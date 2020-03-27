::CLEAN UP FUNCTIONS
::Better version of counting number of delims?
::BETTER COORDINATE FUNCTION SIMPLIFY TO MACRO???
::Clean up special function
::Maybe one net IMAGE for ata pla
::Set p[box] more effecient

::::BgetDescription#Help Kyoko defend her lab in this cute rogue-like.
::::BgetAuthor#LowSun
::::BgetCategory#game
@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION ENABLEEXTENSIONS
TITLE Love, Kyoko
MODE 70, 35
CALL :MACROS
::° ± ² Û
::sur <x> <y>, unit <ata> <pla> <char> <hp> <attack> <special>, special <area> <effect u> <effect e> <time b/w particle> <time b/w frame> <frames>
::c= colour, p = display, d = dummy variable, s = surround, u = unit, e = enemy, z = special
SET "logo=%col:c=170;47;212%Love, %col:c=169;132;181%%dn:n=1%%nx:n=8%__%nx:n=8%__%dn:n=1%%bk:n=22%^|__/ \ / /  \ ^|__/ /  \%dn:n=1%%bk:n=23%^|  \  ^|  \__/ ^|  \ \__/"
SET "r[sur]=- 1 ;-2$- 3 ;-1$+ 1 ;-1$- 1 ;+2$- 3 ;+1$+ 1 ;+1"
SET "r[cro]=- 3 ;-1$+ 1 ;-1$- 3 ;+1$+ 1 ;+1"
SET "r[xcr]=- 5 ;-2$- 3 ;-1$+ 1 ;-1$+ 3 ;-2$- 5 ;+2$- 3 ;+1$+ 1 ;+1$+ 3 ;+2"
SET "r[lon]=- 5 ;0$+ 3 ;0$- 1 ;+4$- 1 ;-4"
SET "r[wid]=+ 9 ;+5$- 11 ;-5$+ 9 ;-5$- 11 ;+5"
SET "r[squ]=- 5 ;-2$- 1 ;-2$+ 3 ;-2$- 5 ;+2$- 1 ;+2$+ 3 ;+2"
SET "r[min]=- 5 ;0$- 3 ;-1$+ 1 ;-1$- 3 ;+1$+ 1 ;+1$+ 3 ;0"
SET "r[non]=- 1 ;0"
SET "r[ud]=- 1 ;-2$- 1 ;+2"
SET "r[lcr]=- 9 ;0$- 5 ;0$+ 3 ;0$+ 7 ;0$"
SET "c[he1]=189;0;255"
SET "c[he2]=214;0;255"
SET "c[he3]=0;30;255"
SET framerate=FOR /L %%J in (1,#,1000000) DO REM
::Zombie Ghost Snake Demon Witch
::Idenshi Zerstorer BioOrchid-473 Cykox Leistung MekaMeka
SET "u[all]=Idenshi Zerstorer BioOrchid-473 Cykox Leistung MekaMeka Tsenga"
SET "e[all]=Zombie Ghost Snake Demon Witch Mummy"
SET "z[Shiri]=non$"spe]=Tembo" "cha]=%col:c=129;219;173%B" "ata]=lcr" "pla]=xcr"$""$100$1000000$"q203w204w186m%bk:n=1%Ã%up:n=1%Â%dn:n=1%´%bk:n=2%%dn:n=1%Á""
SET "z[Tembo]=non$"spe]=Shiri" "cha]=%col:c=203;204;186%T" "ata]=xcr" "pla]=lcr"$""$100$1000000$"q129w219w173m%bk:n=1%Ã%up:n=1%Â%dn:n=1%´%bk:n=2%%dn:n=1%Á""
SET "z[Reborn]=cro$"#hp]=5" "#pow]=1" "cha]=%col:c=163;144;93%m%bk:n=2%%up:n=1%%col:c=93;245;224%-*-"$""$100$1000000$"q59w72w168m\ / / \""
SET "z[MagicOrbs]=lcr$"nam]=Sorcerer"$"#hp]-=3"$50$1000000$"q12w18w145mOq98w147w227m^> q12w18w145mOq98w147w227m^> %bk:n=1%^<q12w18w145mO %bk:n=1%q98w147w227m^<q12w18w145mO""
SET "z[Consume]=non$"#hp]+=1" "#pow]=4" "cha]=%bk:n=2%%col:c=79;36;38%/\%col:c=181;22;30%D%col:c=79;36;38%/\"$""$1000000$100$"q150w21w28m%bk:n=1%6%up:n=1%6%dn:n=1%6""
SET "z[VenomStrike]=xcr$""$"#pow]=1"$100$1000000$"q62w156w28m\ q56w217w102m\ / q62w156w28m/ q56w217w102m/ / \ q62w156w28m\""
SET "z[MekaBomb]=min$"#hp]-=1"$"#pow]-=3"$100$1000$"q59w235w139mÔ Ô ¾ Ô ¾ ¾" "q146w247w192mÖ Ö · Ö · ·" "q212w255w231m¸ ¸ Õ ¸ Õ Õ" "q134w227w196m%bk:n=1%-%bk:n=1%%up:n=1%\³/%dn:n=1%%bk:n=1%-%dn:n=1%%bk:n=3%/³\ %bk:n=1%-%bk:n=1%%up:n=1%\³/%dn:n=1%%bk:n=1%-%dn:n=1%%bk:n=3%/³\ %bk:n=1%-%bk:n=1%%up:n=1%\³/%dn:n=1%%bk:n=1%-%dn:n=1%%bk:n=3%/³\ %bk:n=1%-%bk:n=1%%up:n=1%\³/%dn:n=1%%bk:n=1%-%dn:n=1%%bk:n=3%/³\ %bk:n=1%-%bk:n=1%%up:n=1%\³/%dn:n=1%%bk:n=1%-%dn:n=1%%bk:n=3%/³\ %bk:n=1%-%bk:n=1%%up:n=1%\³/%dn:n=1%%bk:n=1%-%dn:n=1%%bk:n=3%/³\""
SET "z[Leech]=sur$"#pow]+=1"$"#hp]-=2"$100$1000000$"q153w203w224mg g g g g g" "q75w99w150mg g g g g g" "q65w38w115mg g g g g g""
SET "z[EnergyBurst]=min$""$"#hp]-=1" "de]=1"$50$50$"q222w220w95m- q235w168w52m/ \ \ / q222w220w95m-" "q181w80w43m~ ~ ~ ~ ~ ~""
SET "z[Enhance]=non$"#pow]+=3"$""$1000000$1000000$"q255w186w221m%bk:n=1%^<%up:n=1%^^%dn:n=1%^>%bk:n=2%%dn:n=1%v""
SET "z[Tozin]=squ$""$"#hp]-=2" "#pow]+=1"$100$1000000$"q81w26w115mØ Ø Ø Ø Ø Ø""
SET "z[Synthesis]=cro$"#hp]+=2" "nam]=Orchid-473"$"#hp]-=1" "#pow]-=1"$100$1000000$"q87w66w245m%dn:n=1%Ì %dn:n=1%¹" "q184w255w237mÉ » È ¼""
SET "z[TitanBlade]=sur$"#pow]+=1"$"#hp]-=2"$50$1000000$"q82w196w181m³ q89w227w209m\ q66w255w230m/ q82w196w181m³ q89w227w209m/ q66w255w230m\" "q168w54w50mo q194w186w70mo o q168w54w50mo q194w186w70mo o""
SET "z[IonMissile]=lon$""$"#hp]-=4"$1000000$10$"q66w164w255m^< ^> v ^^" "q83w252w216m%bk:n=1%-%bk:n=1%%up:n=1%\³/%dn:n=1%%bk:n=1%-%dn:n=1%%bk:n=3%/³\ %bk:n=1%-%bk:n=1%%up:n=1%\³/%dn:n=1%%bk:n=1%-%dn:n=1%%bk:n=3%/³\ %bk:n=1%-%bk:n=1%%up:n=1%\³/%dn:n=1%%bk:n=1%-%dn:n=1%%bk:n=3%/³\ %bk:n=1%-%bk:n=1%%up:n=1%\³/%dn:n=1%%bk:n=1%-%dn:n=1%%bk:n=3%/³\"
SET "e[Zombie]=sur$sur$%bk:n=1%%col:c=91;112;163%ÚV¿$4$3$Tozin$hp G$hp#2,LEQ"
SET "e[Witch]=lcr$non$%col:c=39;77;138%W$5$4$MagicOrbs$hp G"
SET "e[Snake]=xcr$ud$%col:c=32;94;24%s$4$2$VenomStrike$pow G"
SET "e[Mummy]=min$wid$%col:c=163;144;93%m%bk:n=1%%up:n=1%%col:c=114;150;145%*$2$6$Reborn$pow L$pow#5,LEQ"
SET "e[Ghost]=cro$min$%col:c=115;117;245%g%col:c=98;150;166%%dn:n=1%%bk:n=1%~$3$2$Leech$hp L"
SET "e[Demon]=lon$squ$%bk:n=1%%col:c=107;56;30%\%col:c=247;49;59%d%col:c=107;56;30%/$4$2$Consume$pow L$hp#3,LEQ"
SET "u[Tsenga]=xcr$lcr$%col:c=203;204;186%T$4$1$Shiri"
SET "u[MekaMeka]=xcr$wid$%bk:n=1%%col:c=88;219;103%Ô%col:c=142;230;179%M%col:c=88;219;103%¾$5$4$MekaBomb"
SET "u[Leistung]=cro$ud$%col:c=194;183;85%L$5$5$EnergyBurst"
SET "u[Cykox]=ud$min$%col:c=138;78;123%C%bk:n=1%%dn:n=1%%col:c=235;52;189%Ê%up:n=1%$6$0$Enhance"
SET "u[Idenshi]=wid$sur$%col:c=66;245;155%@$5$2$TitanBlade"
SET "u[Zerstorer]=sur$cro$%col:c=141;25;230%Z$3$3$IonMissile"
SET "u[BioOrchid-473]=lon$squ$%bk:n=1%%col:c=237;163;255%}%col:c=153;187;204%o%col:c=237;163;255%{$3$4$Synthesis"
SET /A "x[map]=11","y[map]=10","p[bak]=(x[map]*3)+(x[map]-1)","selected=1","u[en]=0", "u[num]=7", "e[num]=6"
FOR /L %%X in (1, 1, %x[map]%) DO (
    SET "d[box]=!d[box]!ÄÄÄÄ"
    SET /A "d[num]=!RANDOM!*3/32768+1"
    FOR %%Q in (!d[num]!) DO (
        SET "x[hex]=!x[hex]!%ESC%[38;2;!c[he%%Q]!m/ \_"
    )
)
SET "p[map]=%x[hex]:/ \_= _  %%bk:n=1%"
SET "x[hex]=%x[hex]:~0,-1%!bk:n=%p[bak]%!%dn:n=1%%x[hex]:/ \_=\_/ %"
FOR /L %%Y in (1, 1, %y[map]%) DO (
    SET "d[sibox]=!d[sibox]!³%dn:n=1%%bk:n=1%³%dn:n=1%%bk:n=1%"
    SET "p[map]=!p[map]!!bk:n=%p[bak]%!%dn:n=1%%x[hex]:~0,-1%"
)
(MORE <%~nx0:HighScore) && (
    FOR /F %%G in ('MORE ^<%~nx0:HighScore') DO (
        SET "u[score]=%%G"
    )
) || (
    SET "u[score]=0"
)
ECHO %ESC%[?25l

:MENU
SET /A "u[day]=0","r[uni]=2"
ECHO %ESC%[2J%col:c=189;0;255%%ESC%[2;4HLowsun 2020%col:c=78;3;252%%ESC%[15;29H Score : %u[score]%%ESC%[10;20H%logo%%ESC%[19;15HDear friend, I am currently sick%ESC%[20;17Hwith the most horrible flu :(%ESC%[22;18H I'll be resting for a while at home,%ESC%[23;14Hso please guard my lab from all those bad monsters^^!%ESC%[25;25HLove,%ESC%[26;24HKyoko :^)%ESC%[30;25H%col:c=170;47;212%Press [A] to Continue
CHOICE /C A /N>NUL
ECHO %ESC%[2J%ESC%[3;10H%ESC%[4m%col:c=189;0;255%                     INSTRUCTIONS                     %ESC%[0m%dn:n=1%%col:c=209;219;221%
FOR %%G in ("Monsters come and attack the lab all day" "Use the Mechs to defend yourself^^^!" "Monitor on left shows monster stats" "Monitor below shows the selected Mech stats" "The bar fills up showing fuel depletion" "Once all depleted, the lab shuts down^^^!" "Use A to attack, B to move, and C to switch Mechs" "Check my notebook with [N] for Monster info" "Most importantly, use D to unleash a SPECIAL ATTACK" "This uses more fuel, so use wisely ;)" "If all the Mechs die, please runnnnnn away" "Sweep the lab floor (i hate monster guts)" "Oh, and feed the cat pls" "Hope you got all that^^^!") DO (
    ECHO %ESC%[10G- %%~G%dn:n=1%
    %framerate:#=10%
)
PAUSE>NUL

:GAME
SET /A "u[day]+=1","r[uni]+=1"
SETLOCAL
CALL :SETUP
FOR /L %%# in () DO (
    IF !u[en]! GTR 20 (
        SET "u[en]=20"
    )
    SET /A "d[num]=u[en]*((p[bak]-2)/20)"
    FOR /F "tokens=1-2" %%X in ("!selected! !d[num]!") DO (
        SET "p[box]=!d[box]:~0,%%Y!%ESC%[0m!d[box]:~%%Y!"
        ECHO %ESC%[2J%ESC%[4;5H%col:c=214;0;255%%ESC%[4mD A Y  %u[day]%%ESC%[24m %col:c=209;219;221%%ESC%[5;1H%p[estat]%%ESC%[u%ESC%[5d%bk:n=1%%d[sibox]%ÀÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÙ%dn:n=1%%bk:n=9%³%dn:n=1%%bk:n=8%[N] : Notebook%ESC%[u%ESC%[5d%nx:n=15%%d[sibox]%%ESC%[u%ESC%[4d%bk:n=1%ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿%ESC%[5;5H%p[map]%%dn:n=1%%dn:n=1%%ESC%[5G%col:c=209;219;221%Ú%col:c=82;3;252%!p[box]:~0,-2!¿%dn:n=1%%bk:n=1%%col:c=209;219;221%ÃÄ[D]%ESC%[5G³ !u[%%Xcha]! !u[%%Xnam]! %col:c=209;219;221%³ !u[%%Xhp]! ^<--^> !u[%%Xpow]! ³ !u[%%Xspe]!%dn:n=1%%ESC%[5GÀ%col:c=82;3;252%!p[box]:~0,-2!%col:c=209;219;221%Ù%dn:n=1%%ESC%[5G%ESC%[s[A] : Move - [B] : Attack - [C] : Switch%p[unit]%
        CHOICE /C ABCDN /N>NUL
        IF !errorlevel! EQU 5 (
            FOR /L %%L in (1, 1, %e[cyb]%) DO (
                SET "d[tex]="
                FOR /F "tokens=1-2 delims=$" %%1 in ("!e[%%Lpla]!$!e[%%Lata]!") DO (
                    SET "d[tex]=!d[tex]!%ESC%[10;5H%col:c=209;219;221%- !e[%%Lnam]!%col:c=255;135;48%!p[%%1]:@=10;22!%col:c=76;237;237%!p[%%2]:@=10;22!%ESC%[10;22H!e[%%Lcha]!%ESC%[17;5HSpecial : !e[%%Lspe]! - Behaviour : !e[%%Lsty]!"
                )
                ECHO %ESC%[2J%ESC%[4;5H%col:c=214;0;255%%ESC%[4mNOTEBOOK (%%L / %e[cyb]%^)%ESC%[24m!d[tex]!
                PAUSE>NUL
            )
        ) else IF !errorlevel! EQU 3 (
            ECHO %col:c=209;219;221%%p[num]%
            CHOICE /C %u[choice]% /N>NUL
            SET "selected=!errorlevel!"
        ) else (
            IF defined u[%%Xcha] (
                IF !u[en]! LSS 20 (
                    FOR /F "tokens=1-3 delims=$" %%R in ("!u[%%Xpla]!$!u[%%Xata]!$!y[u%%X]!;!x[u%%X]!") DO (
                        IF !errorlevel! EQU 1 (
                            ECHO %col:c=255;135;48%!p[%%R]:@=%%T!
                            CHOICE /C !s[%%Rch]! /N>NUL
                            (%coordinate% !errorlevel! %%R u%%X u%%X) || (
                                SET "p[mes]=@Outside Grid"
                            )
                        ) else IF !errorlevel! EQU 2 (
                            ECHO %col:c=76;237;237%!p[%%S]:@=%%T!
                            CHOICE /C !s[%%Sch]! /N>NUL
                            (%coordinate% !errorlevel! %%S a u%%X) && ( 
                                CALL :ATTACK u%%X
                                CALL :CHECKHIT e "!x[d]!;!y[d]!"
                                %detect% e u %%X
                            )
                        ) else (
                            SET /A "u[en]+=2"
                            CALL :GETSPEC u e %%X
                        )
                    )
                    SET /A "u[en]+=1"
                ) else (
                    ENDLOCAL
                    CALL :DEFEAT "Fuel Exhausted"
                )
                FOR %%Q in (!e[list]:-^= !) DO (
                    CALL :ENEMOVE 1
                    SET "d[num]=0"
                    FOR /F "tokens=1-2 delims=$" %%1 in ("!e[%%Qpla]!$!e[%%Qata]!") DO (
                    FOR %%B in (!d[hit]!) DO (
                        FOR /L %%L in (1, 1, !s[%%2ch]:~-1!) DO (
                            (%coordinate% %%L !e[%%Qata]! a e%%Q) && (
                                IF "!x[u%%B]!;!y[u%%B]!" == "!x[a]!;!y[a]!" (
                                    SET "d[num]=%%L"
                                )
                            )
                        )
                        IF "!d[num]!" == "0" (
                            SET "d[equ]=10000"
                            FOR /L %%L in (1, 1, !s[%%1ch]:~-1!) DO (
                                (%coordinate% %%L !e[%%Qpla]! a e%%Q) && (
                                    SET /A "x[d]=x[u%%B]-x[a]","y[d]=y[u%%B]-y[a]","d[cre]=(x[d]*(1|(x[d]>>31)))+(y[d]*(1|(y[d]>>31)))"
                                    IF !d[cre]! LSS !d[equ]! (
                                        SET /A "d[equ]=!d[cre]!","d[num]=%%L"
                                    )
                                )
                            )
                            %coordinate% !d[num]! !e[%%Qpla]! e%%Q e%%Q
                        ) else (
                            SET "d[spe]="
                            IF not defined e[%%Qde] (
                                (SET /A x=e[%%Q!e[%%Qcon]:#=],y=! 2>NUL) && (
                                    SET /A "e[%%Qde]=1","d[spe]=1"
                                    CALL :GETSPEC e u %%Q
                                )
                            )
                            IF not defined d[spe] (
                                %coordinate% !d[num]! !e[%%Qata]! a e%%Q
                                CALL :ATTACK e%%Q
                                %detect% u e %%Q
                            )
                        )
                    )
                    )
                )
            ) else (
                SET "p[mes]=@!u[%%Xnam]! Destroyed, please Switch"
            )
        )
    )
    %checkdead%
    IF defined p[mes] (
        ECHO %col:c=209;219;221%%ESC%[u%dn:n=1%!p[mes]:@=%dn:n=1%%ESC%[5G!
        SET "p[mes]="
        %framerate:#=5%
    )
)

:CHECKHIT <hitspots> <targets>
SET "d[hit]="
FOR %%Q in (!%1[list]:-^= !) DO (
    FOR %%A in (%*) DO (
        IF "!x[%1%%Q]!;!y[%1%%Q]!" == %%A (
            SET "d[hit]=!d[hit]! %%Q"
        )
    )
)
GOTO :EOF

:DEFEAT
ECHO %ESC%[u%dn:n=2%%col:c=240;26;26%%~1...press any Key
IF %u[day]% GTR %u[score]% (
    SET "u[score]=%u[day]%"
    ECHO %col:c=214;0;255%%dn:n=1%%ESC%[5GNew High Score^^!
    (ECHO !u[day]!)>%~nx0:Highscore
)
PAUSE>NUL
GOTO :MENU

:GETSPEC <attacker> <victim> <number>
FOR %%O in (!%1[%3spe]!) DO (
    FOR /F "tokens=1-6 delims=$" %%A in ("!z[%%O]!") DO (
        FOR %%P in (%%F) DO (
            SET "d[num]="
            FOR %%V in (%%~P) DO (
                SET /A "d[num]+=1"
                SET "d[tex]=%%~V"
                FOR %%@ in ("q=%ESC%[38;2;" "w=;") DO (
                    SET "d[tex]=!d[tex]:%%~@!"
                )
                (%coordinate% !d[num]! %%A d %1%3) && (
                    FOR %%D in ("!x[d]!;!y[d]!") DO (
                        IF "!d[hit]:%%~D=!" == "!d[hit]!" (
                            SET "d[hit]=!d[hit]! "!x[d]!;!y[d]!""
                        )
                    )
                    ECHO %ESC%[!y[d]!;!x[d]!H!d[tex]!
                    FOR /L %%J in (1,%%D,1000000) DO REM
                )
            )
            FOR /L %%J in (1,%%E,1000000) DO REM
        )
        CALL :CHECKHIT %2 !d[hit]!
        FOR %%L in (!d[hit]!) DO (
            CALL :SPECIAL %2 %%L %%C
        )
        CALL :SPECIAL %1 %3 %%B
    )
    SET "p[mes]=!p[mes]!@!%1[%3nam]! used !%1[%3spe]!"
)
GOTO :EOF

:SETUP
FOR %%@ in (u e) DO (
    SET /A "d[num]=!RANDOM!*r[uni]/32768+1"
    FOR /L %%Q in (1, 1, !d[num]!) DO (
        SET /A "d[num]=!RANDOM!*%%@[num]/32768+1","d[cre]=0"
        FOR %%# in (!%%@[all]!) DO (
            SET /A "d[cre]+=1"
            SET "d[sty]=%%#"
            IF !d[cre]! EQU !d[num]! (
                SET /A "%%@[cyb]+=1"
                CALL :GETNUM !d[sty]! !%%@[cyb]! %%@
                FOR %%Q in (!%%@[cyb]!) DO (
                    FOR %%A in (ata pla) DO (
                        IF not defined s[!%%@[%%Q%%A]!1] (
                            CALL :FINDRANGE %%A !%%@[cyb]! %%@
                        )
                    )
                )
            )
        )
    )
)
GOTO :EOF

:SPECIAL <target> <number> <effects>
SET "d[num]=%1[%2"
SHIFT /1&SHIFT /1
FOR %%Q in (%1 %2 %3 %4 %5 %6 %7 %8 %9) DO (
    SET "d[num]=%%~Q"
    IF "!d[num]:#=!" == "!d[num]!" (
        SET "%d[num]%!d[num]!"
    ) else (
        SET /A "%d[num]%!d[num]:#=!" 2>NUL
    )
)
GOTO :EOF

:ENEMOVE
FOR /F "tokens=1-2" %%A in ("!e[%1sty]!") DO (
    SET "d[equ]=%%B"
    SET "d[sty]=%%A"
    IF "%%B" == "L" (
        SET "d[num]=10000"
    ) else (
        SET "d[num]=0"
    )
)
FOR %%Q in (%u[list]:-= %) DO (
    IF !u[%%Q%d[sty]%]! %d[equ]%EQ !d[num]! (
        SET /A "d[num]=!u[%%Q%d[sty]%]!","d[hit]=%%Q"
    )
)
GOTO :EOF

:ATTACK <numbertype>
SET /A "x[d]=x[a]-x[%1]","y[d]=y[a]-y[%1]","d[num]=(x[d]*(1|(x[d]>>31)))-(((x[d]*(1|(x[d]>>31)))-(y[d]*(1|(y[d]>>31))))&(((x[d]*(1|(x[d]>>31)))-(y[d]*(1|(y[d]>>31))))>>31))","y[sig]=1|(y[d]>>31)","x[sig]=1|(x[d]>>31)","x[d]=x[%1]","y[d]=y[%1]"
FOR /L %%Q in (1, 1, %d[num]%) DO (
    FOR %%W in (x y) DO (
        IF not !%%W[d]! EQU !%%W[a]! (
            SET /A "%%W[d]=%%W[d]+!%%W[sig]!"
        )
    )
    ECHO %col:c=183;209;159%%ESC%[!y[d]!;!x[d]!Ho
    %framerate:#=50%
)
ECHO %col:c=240;26;26%%ESC%[%y[d]%;%x[d]%H%bk:n=1%-%bk:n=1%%up:n=1%\³/%dn:n=1%%bk:n=1%-%dn:n=1%%bk:n=3%/³\
%framerate:#=25%
GOTO :EOF

:GETNUM <unit> <number> <type>
FOR /F "tokens=1-8 delims=$" %%1 in ("!%3[%1]!") DO (
    SET /A "%3[%2hp]=%%4","%3[%2pow]=%%5","x[%3%2]=((!RANDOM!*(x[map]-1)/32768+1)*4)+6","y[%3%2]=4+((!RANDOM!*y[map]/32768+1)*2)"
    SET "%3[%2ata]=%%1"
    SET "%3[%2pla]=%%2"
    SET "%3[%2cha]=%%3"
    SET "%3[%2spe]=%%6"
    IF "%3" == "u" (
        SET "%3[choice]=!%3[choice]!%2"
        SET "p[num]=!p[num]!%ESC%[^!y[%3%2]^!;^!x[%3%2]^!H%up:n=1%%2"
    ) else (
        SET "%3[%2sty]=%%7" 
        IF "%%8" == "" (
            SET "%3[%2con]=1"
        ) else (
            SET "%3[%2con]=%%8"
            FOR %%@ in ("LEQ=1/((~(y-x)>>31)&1)" "GEQ=1/((~(x-y)>>31)&1)" "NEQ=((((x-y)>>31)&1)|(((y-x)>>31)&1))") DO (
                SET "%3[%2con]=!%3[%2con]:%%~@!"
            )
        )
        SET "p[estat]=!p[estat]!%ESC%[7G!nx:n=%p[bak]%!%ESC%[s^!%3[%2nam]^!%ESC%[u%dn:n=1%^!%3[%2hp]^!,^!%3[%2pow]^!,^!%3[%2spe]^!%dn:n=1%"
    )
)
SET "%3[%2nam]=%1"
SET "%3[list]=!%3[list]!-%2-"
SET "p[unit]=!p[unit]!%ESC%[^!y[%3%2]^!;^!x[%3%2]^!H^!%3[%2cha]^!"
GOTO :EOF

:FINDRANGE <user> <number> <type>
SET "d[c]="
FOR %%L in (!%3[%2%1]!) DO (
    FOR %%Q in ("!r[%%L]:$=" "!") DO (
        SET /A "d[c]+=1"
        SET "s[%%L!d[c]!]=%%~Q"
        SET "s[%%Lch]=!s[%%Lch]!!d[c]!"
        FOR /F "tokens=1-3 delims= " %%A in ("%%~Q") DO (
            SET "d[num]=%%B%%A%%C"
        )
        FOR %%R in ("+;-=C#up" "-;-=D#up" "-;+=D#dn" "+;+=C#dn" "-;=D#nu" "+;=C#nu") DO (
            SET "d[num]=!d[num]:%%~R:n=!"
        )
        CALL SET "p[%%L]=!p[%%L]!%ESC%[@H%ESC%[!d[num]:#=%%!%%/%up:n=1%_%dn:n=1%%bk:n=1%!d[c]!\%bk:n=3%%dn:n=1%\_/"
    )
)
GOTO :EOF

:MACROS
FOR /F %%A in ('ECHO prompt $E^| cmd') DO SET "ESC=%%A"
SET col=%ESC%[38;2;cm
SET bcl=%ESC%[48;2;cm
SET up=%ESC%[nA
SET dn=%ESC%[nB
SET bk=%ESC%[nD
SET nx=%ESC%[nC
SET "nu=n%bk:n=1% %bk:n=1%"
SET ^"LF=^

^" Above empty line is required - do not remove
SET ^"\n=^^^%LF%%LF%^%LF%%LF%^^"
::<target> <attacker> <type>
SET detect=FOR %%# in (1, 1, 2) DO IF %%#==2 ( FOR /F "tokens=1-3" %%A in ("^!args^!") DO (%\n%
    FOR %%S in (^^!d[hit]^^!) DO (%\n%
        SET /A "%%A[%%Shp]-=^!%%B[%%Cpow]^!"%\n%
        SET "p[mes]=^!p[mes]^!@^!%%B[%%Cnam]^! did ^!%%B[%%Cpow]^! damage to ^!%%A[%%Snam]^!"%\n%
    )%\n%
)) else SET args=

::<number> <type> <variable name> <base number>
SET coordinate=FOR %%# in (1, 1, 2) DO IF %%#==2 ( FOR /F "tokens=1-4" %%A in ("^!args^!") DO (%\n%
    IF not defined s[%%B1] (%\n%
        SET "d[c]="%\n%
        FOR %%V in ("^!r[%%B]:$=" "^!") DO (%\n%
            SET /A "d[c]+=1"%\n%
            SET "s[%%B^!d[c]^!]=%%~V"%\n%
        )%\n%
    )%\n%
    FOR /F "tokens=1-2 delims=;" %%1 in ("^!s[%%B%%A]^!") DO (%\n%
        (SET /A "x[v]=(x[%%D]+%%1)+1","y[v]=y[%%D]+%%2","1/((((5-y[v])^>^>31)^&1)^&(((y[v]-((y[map]*2)+5))^>^>31)^&1)^&(((5-x[v])^>^>31)^&1)^&(((x[v]-(p[bak]+5))^>^>31)^&1))" 2^>NUL) ^&^& (%\n%
            SET /A "x[%%C]=x[v]", "y[%%C]=y[v]"%\n%
        ) ^|^| (%\n%
            SET /A "=" 2^>NUL%\n%
        )%\n%
    )%\n%
)) else SET args=

SET checkdead=FOR %%G in (e u) DO (%\n%
    FOR %%Q in (^^!%%G[list]:-^^^^= ^^!) DO (%\n%
        IF ^^!%%G[%%Qhp]^^! LEQ 0 (%\n%
            SET "%%G[list]=^!%%G[list]:-%%Q-=^!"%\n%
            SET "%%G[%%Qcha]="%\n%
            SET "p[mes]=^!p[mes]^!@^!%%G[%%Qnam]^! destroyed"%\n%
            IF not defined %%G[list] (%\n%
                ENDLOCAL%\n%
                IF "%%G" == "u" (%\n%
                    CALL :DEFEAT Defeat%\n%
                ) else (%\n%
                    ECHO %ESC%[u%dn:n=2%%col:c=213;135;255%Victory :^^^^^)%\n%
                    FOR /L %%J in (1,5,1000000) DO REM%\n%
                    CALL :GAME%\n%
                )%\n%
            )%\n%
        )%\n%
    )%\n%
)
