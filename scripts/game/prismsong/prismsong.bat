@ECHO OFF
::::BgetDescription#Awe-inspiring batch platformer. Play as one of three characters and use your chakra to defeat enemies.
::::BgetAuthor#LowSun
::::BgetCategory#game
SETLOCAL ENABLEDELAYEDEXPANSION
IF not "%1" == "" (
    GOTO :%1
)
(CHCP 65001)>NUL
MODE 90, 25
SET "d[tex]=Path ComSpec TEMP d[tex]"
FOR /F "tokens=1 delims==" %%A in ('SET') DO (
    IF "%d[tex]%" == "!d[tex]:%%A=!" (
        SET "%%A="
    )
)
SET "d[tex]="
CALL :MACROS

::puzzle platformer
:: BETTER DRAGON and YUZO BEHAV
SET anim[rain]=SET "par[disp]=^!par[disp]^!%col:c=111;207;242%"%\n%
FOR /L %%T in (1, 1, @) DO (%\n%
    SET /A "par[x]=^!RANDOM^!*90/32768+1","par[y]=^!RANDOM^!*19/32768+1"%\n%
    FOR %%S in ("^!par[y]^!;^!par[x]^!") DO (%\n%
        IF "^!lev[bou]^!" == "^!lev[bou]:.%%~S.=^!" (%\n%
            SET "par[disp]=^!par[disp]^!%ESC%[^!par[y]^!;^!par[x]^!H│"%\n%
        ) else (%\n%
            SET "par[disp]=^!par[disp]^!%ESC%[^!par[y]^!;^!par[x]^!H%bk:n=1%\│/"%\n%
        )%\n%
    )%\n%
)

SET anim[purgatory]=2^>NUL SET /A "^!every:#=30^!" ^&^& (%\n%
    SET /A "par[num]+=1","par[x]=^!RANDOM^!*(87-3+1)/32768+3","par[y]=^!RANDOM^!*(17-3+1)/32768+3"%\n%
    SET "par[^!par[num]^!]=^!par[x]^! ^!par[y]^! 2"%\n%
    SET "par[list]=^!par[list]^! [^!par[num]^!]"%\n%
)%\n%
2^>NUL SET /A "^!every:#=20^!" ^&^& (%\n%
    FOR %%W in (^^^!par[list]^^^!) DO (%\n%
        FOR /F "tokens=1-3" %%A in ("^!par%%W^!") DO (%\n%
            SET /A "d[num]=%%C-1"%\n%
            IF ^^^!d[num]^^^! EQU -1 (%\n%
                SET "par[list]=^!par[list]:%%W=^!"%\n%
                SET "par%%W="%\n%
            ) else (%\n%
                IF ^^^!d[num]^^^! EQU 1 (%\n%
                    SET "par[disp]=^!par[disp]^!%ESC%[%%B;%%AH%bk:n=1%─%up:n=1%│%dn:n=2%%bk:n=1%│%up:n=1%%bk:n=1%*─"%\n%
                ) else (%\n%
                    SET "par[disp]=^!par[disp]^!%ESC%[%%B;%%AH*"%\n%
                )%\n%
                SET "par%%W=%%A %%B ^!d[num]^!"%\n%
            )%\n%
        )%\n%
    )%\n%
    SET "par[keep]=^!par[disp]^!"%\n%
) ^|^| (%\n%
    SET "par[disp]=^!par[keep]^!"%\n%
)

SET anim[music]=2^>NUL SET /A "^!every:#=40^!" ^&^& (%\n%
    SET /A "par[num]+=1","d[num]=(^!RANDOM^!*3/32768+1)+5","d[rand]=^!RANDOM^!*2/32768+1","par[x]=^!RANDOM^!*3/32768-1","par[y]=^!RANDOM^!*3/32768-1"%\n%
    IF "^!par[x]^!;^!par[y]^!" == "0;0" (%\n%
        SET /A "par[x]=1", "par[y]=0"%\n%
    )%\n%
    IF ^^^!d[rand]^^^! EQU 1 (%\n%
        SET "par[^!par[num]^!]=@ ^!d[num]^! ♪ ^!par[x]^! ^!par[y]^!"%\n%
    ) else (%\n%
        SET "par[^!par[num]^!]=@ ^!d[num]^! ♫ ^!par[x]^! ^!par[y]^!"%\n%
    )%\n%
    SET "par[list]=^!par[list]^! [^!par[num]^!]"%\n%
)%\n%
2^>NUL SET /A "^!every:#=9^!" ^&^& (%\n%
    FOR %%W in (^^^!par[list]^^^!) DO (%\n%
        FOR /F "tokens=1-6" %%A in ("^!par%%W^!") DO (%\n%
            SET /A "par[x]=%%A+%%E","par[y]=%%B+%%F","d[num]=%%C-1","d[col]=(%%C*12)+75"%\n%
            IF ^^^!d[num]^^^! EQU 0 (%\n%
                SET "par[disp]=^!par[disp]^!%ESC%[^!par[y]^!;^!par[x]^!H%ESC%[38;2;176;^!d[col]^!;255m*"%\n%
                SET "par[list]=^!par[list]:%%W=^!"%\n%
                SET "par%%W="%\n%
            ) else (%\n%
                SET "par%%W=^!par[x]^! ^!par[y]^! ^!d[num]^! %%D %%E %%F"%\n%
                SET "par[disp]=^!par[disp]^!%ESC%[^!par[y]^!;^!par[x]^!H%ESC%[38;2;176;^!d[col]^!;255m%%D"%\n%
            )%\n%
        )%\n%
    )%\n%
    SET "par[keep]=^!par[disp]^!"%\n%
) ^|^| (%\n%
    SET "par[disp]=^!par[keep]^!"%\n%
)

SET anim[torch]=IF not ^^^!torch[fact]^^^! EQU 0 (%\n%
    FOR %%L in (13 27 41) DO (%\n%
        SET /A "d[num]=^!RANDOM^!*255/32768+1","par[y]=^!RANDOM^!*2/32768+1"%\n%
        SET "par[disp]=^!par[disp]^!%ESC%[5;%%LH%ESC%[38;2;255;^!d[num]^!;0m%ESC%[^!par[y]^!A█"%\n%
    )%\n%
)
::Level : orgin x, orgin y, length, width, texture
::Character : sprite, health, maxcol, jump height, description, name
::Enemy : sprite, health, maxcol, hitpoints
SET /A "enem[state]=0","char[pow]=0"
SET "col[bcl]=0;0;0"
SET "col[1]=166;77;191"
SET "col[2]=84;138;204"
SET "col[3]=87;212;147"
SET "col[4]=229;237;69"
SET "col[5]=224;0;0"
SET "char[Hilda]=█%col:c=189;81;4%─┤%bk:n=3%%up:n=1%%col:c=227;57;57%┴ %col:c=199;34;34%┬$15$3$6$"Pyromancer from the East" "Disillusioned after a great tragedy" "In search for meaning to the ends of Heaven"$%ESC%[4m%col:c=219;24;24%H %col:c=196;50;6%I %col:c=219;24;24%L %col:c=196;50;6%D %col:c=219;24;24%A%ESC%[24m%col:c=204;179;110%$3$DivineFireOfRa"
SET "char[Sugotho]=█%bk:n=2%%col:c=98;145;86%~%up:n=1%%col:c=106;31;156%v%dn:n=1%%col:c=98;145;86%~$20$3$5$"Traitor to King Dalcone" "Exiled for 20 years in living Hell" "Devoured the fruits of Immortality" "As punishment, bound to Earth in constant agony"$%col:c=106;31;156%<-%col:c=98;145;86%S-u-g-o-t-h-a%col:c=106;31;156%->%col:c=115;92;29%$12$InnerPower"
SET "char[il-sanqe]=█%bk:n=4%%col:c=232;192;81%│/%col:c=210;220;193%'%nx:n=1%'%col:c=212;192;81%\│%up:n=1%%bk:n=6%/\-/\$10$4$5$"Borne of Angel and Demon" "Versed in the secrets of the 4th Flame" "Banished after interfering with mortal affairs"$%col:c=232;192;81%il %col:c=255;255;255%- %col:c=162;83;184%sanqe%col:c=97;52;168%$4$LunarSoulSpear"
SET tex[mossystone]="%bcl:c=121;128;138%%col:c=31;102;34%├" "%bcl:c=69;99;130%%col:c=31;102;34%┐" "%bcl:c=89;92;97%%col:c=31;102;34%┘" "%col:c=102;117;103%█"
SET tex[bloodstone]="%col:c=121;128;138%█" "%col:c=143;4;23%▓" "%col:c=89;92;97%█"
SET tex[colourglass]="%col:c=240;112;112%█" "%col:c=34;122;98%█" "%col:c=179;128;62%█"
SET tex[stone]="%col:c=121;128;138%█" "%col:c=69;99;130%▓" "%col:c=89;92;97%█"
SET tex[prism]="%col:c=230;168;0%╜" "%col:c=227;149;66%╨" "%col:c=232;206;100%╓" "%col:c=230;168;0%─" "%col:c=227;149;66%╥"
SET tex[forest]="%col:c=40;117;44%█" "%col:c=10;130;28%▓" "%col:c=3;87;16%▒" "%col:c=87;40;3%█"
SET tex[flowers]="%bcl:c=84;138;80%%col:c=201;40;22%+" "%bcl:c=99;168;94%%col:c=241;255;41%+" "%bcl:c=54;199;44%%col:c=159;57;196%+" "%col:c=65;168;57%█" "%col:c=65;168;57%█" "%col:c=65;168;57%█"
IF exist "%~dpn0.quit" (
    DEL /F /Q "%~dpn0.quit"
)
ECHO %ESC%[?25l

:BEGIN
TITLE Prism Song
"%~F0" CONTROL >"%temp%\%~n0_signal.txt" | "%~F0" MENU <"%temp%\%~n0_signal.txt"
(FOR /F "tokens=*" %%G in ('MORE ^<"%~n0.bat:level"') DO (
    IF not "%%G" == "" (
        IF not "%%G" == "/" (
            FOR /F "tokens=1-3 delims=;" %%A in ("%%G") DO (
                CALL :MAKECHAR %%A
                SET "char[done]=%%B"&SET "char[boost]=%%C"
            )
            GOTO :LEVELMAKE
        )
    )
)) 2>NUL
ECHO %ESC%[2J%col:c=199;42;175%%ESC%[3;38H%ESC%[4mHOW TO PLAY%ESC%[24m%ESC%[5;5H%col:c=160;198;219%Jump in direction. You MAY MOVE %ESC%[4mwhile%ESC%[24m jumping to go farther or dodge attacks%dn:n=1%%ESC%[9G│      Change Colour%dn:n=1%%ESC%[9G│            │%dn:n=1%%ESC%[8G┌─┐          ┌─┐ ┌─┐ ┌─┐%dn:n=1%%ESC%[8G│W│          │I│ │O│ │P│─ Interact with environment once you are close enough%dn:n=1%%ESC%[8G└─┘          └─┘ └─┘ └─┘  (statues, totems, NPC's, ect)%dn:n=1%%ESC%[5G┌─┐┌─┐┌─┐            │%dn:n=1%%ESC%[5G│A││S││D│  Unleash your Special once your Power bar has charged up (Attunement)%dn:n=1%%ESC%[5G└─┘└─┘└─┘%dn:n=1%%ESC%[6G└──┼──┘%dn:n=1%%ESC%[9G│%dn:n=1%%ESC%[5GMove right or left. This changes the direction of your jump to left or right.%dn:n=1%%ESC%[5GS sets the direction back to center (jump straight up)%dn:n=2%%ESC%[5GLower your enemy's Chakra by matching their Spirit (colour). If you get hit while%dn:n=1%%ESC%[5Gthe enemy has a different colour, you lose Chakra. If you get hit with matching %dn:n=1%%ESC%[5GSpirit, the enemy loses Chakra. However, losing Chakra also charges up your Power%dn:n=1%%ESC%[5Gbar. Once fully charged, you can unleash your Special. The amount of Power needed is%dn:n=1%%ESC%[5GAttunement. Drain the enemy of Chakra to win. %col:c=190;117;224%(A)
CHOICE /C A /N
ECHO %ESC%[2J%col:c=70;175;227%%ESC%[3;64H(1 - 3) Select Avatar%ESC%[4;64H(4) - Confirm%ESC%[5;64HSelected : %col:c=160;198;219%None%ESC%[1;1H
FOR %%L in (Hilda Sugotho il-sanqe) DO (
    SET /A "d[num]+=1"
    SET "char[!d[num]!]=%%L"
    FOR /F "tokens=1,5-6 delims=$" %%A in ("!char[%%L]!") DO (
        ECHO %dn:n=1%%ESC%[6G%%C (!d[num]!^)%dn:n=2%%ESC%[11G%up:n=1%%ESC%[s%dn:n=2%%ESC%[6G%%A%ESC%[0m
        FOR %%Q in (%%B) DO (
            ECHO %ESC%[u%dn:n=1%%ESC%[s- %%~Q
        )
    )
)
GOTO :SELECTCHAR

:MENU
SET "d[num]=40"
SET "lev[bou]=.8;32.8;49.8;50.8;58"
FOR /L %%# in () DO (
    SET /P "input="
    IF defined input (
        CALL :END "%ESC%[15;35HPress (A) to Confirm"
    )
    %anim[rain]:@=5%
    IF !d[num]! EQU 200 (
        SET "d[tex]=-"
    ) else IF !d[num]! EQU 40 (
        SET "d[tex]=+"
    )
    SET /A "d[num]!d[tex]!=2"
    ECHO %ESC%[2J%ESC%[38;2;196;!d[num]!;188m%ESC%[8;31H_%nx:n=17%__%nx:n=7%_%dn:n=1%%bk:n=29%│_^)%nx:n=1%__%nx:n=1%o%nx:n=2%_%nx:n=1%__%nx:n=4%(_%nx:n=2%_%nx:n=1%__%nx:n=1%(_│%dn:n=1%%bk:n=30%│%nx:n=3%│%nx:n=2%│%nx:n=1%_^>%nx:n=1%│││%nx:n=3%__^)(_^)│%nx:n=1%│__│!par[disp]!%ESC%[2;4HLowsun 2020%ESC%[13;40HPress (A^)
    SET "par[disp]="
    %framerate:#=200%
)

:SELECTCHAR
(CHOICE /C:1234 /N)>NUL
IF %errorlevel% EQU 4 (
    IF defined d[error] (
        FOR %%L in (!char[%d[error]%]!) DO (
            CALL :MAKECHAR %%L
        )
        GOTO :LEVELMAKE
    )
) else (
    FOR /F "tokens=1-2 delims=;" %%Q in ("%errorlevel%;!char[%errorlevel%]!") DO (
        FOR /F "tokens=2-4,7-8 delims=$" %%A in ("!char[%%R]!") DO (
            SET /A "d[texnum]=d[num]","d[num]=((%%Q-1)*7)+4","d[error]=%%Q"
            ECHO %ESC%[!d[texnum]!;61H %dn:n=1%%bk:n=1%  %dn:n=1%%bk:n=2%  %dn:n=1%%bk:n=2% %col:c=70;175;227%%ESC%[!d[num]!;61H┐%dn:n=1%%bk:n=1%╫╕%dn:n=1%%bk:n=2%╫╛%dn:n=1%%bk:n=2%┘%ESC%[5;75H%col:c=160;198;219%%%R    %col:c=199;42;175%%ESC%[7;64HChakra : %col:c=160;198;219%%%A %col:c=199;42;175%%ESC%[8;64HSpirit : %col:c=160;198;219%%%B %col:c=199;42;175%%ESC%[9;64HJump : %col:c=160;198;219%%%C %col:c=199;42;175%%ESC%[10;64HAttunement : %col:c=160;198;219%%%D %col:c=199;42;175%%ESC%[11;64HSpecial : %col:c=160;198;219%%%E     
        )
    )
)
GOTO :SELECTCHAR

:LEVELMAKE
SETLOCAL
IF defined char[level] (
    SET "char[levelset]=%char[level]%"
    SET "lev[chap]=DOOR %char[level]%"
    CALL :LEVEL%char[level]%
) else (
    IF defined char[done] (
        SET "lev[chap]=SANCTUARY"
        CALL :SANCTUARY
    ) else (
        SET "lev[chap]=PROLOGUE"
        CALL :LEVEL0
    )
)
CALL :MAKELEVEL
SET "char[journey]=0"
SET /A "char[journey]=%char[done]: =+%" 2>NUL
IF %char[journey]% GTR 0 (
    IF !char[journey]! EQU 6 (
        SET "lev[chaptertext]=Your journey is complete. It is now time to decide.#%col:c=20;150;255%Slay the Prism %col:c=190;117;224%(I)#%col:c=20;150;255%Continue to serve the Prism %col:c=190;117;224%(P)"
    ) else (
        SET "lev[chaptertext]=Obey the Prism and fulfill your destiny."
    )
)
CALL :GRADIENT "0;0;0" "78;61;92" 9
ECHO !bcl:c=%col[bcl]%!%col:c=160;198;219%%ESC%[18;5H%ESC%[4m%lev[chap]%%ESC%[24m%ESC%[20;5H!lev[chaptertext]:#=%dn:n=1%%ESC%[5G! %col:c=190;117;224%(A)%ESC%[s
IF %char[journey]% EQU 6 (
    ECHO %ESC%[u%bk:n=3%   
    CHOICE /C IP /N>NUL
    IF !errorlevel! EQU 1 (
        SET "lev[inter]="&SET "enem[bou]=x]+=0;y]+=1;x]-=3;x]+=1;x]+=1;x]+=2;x]+=1;x]+=1;y]+=1,d[x]-=4;x]+=1;x]+=1;y]+=1,d[x]-=2;x]+=2"
        FOR /L %%A in (1, 1, 3) DO (
            SET "char[boost]=!char[boost]:%%A=%%Ax!"
        )
        FOR %%Q in ("3x=maxpow]-=1" "1x=hp]+=3,char[basehp]+=3" "2x=maxheight]+=1") DO (
            SET "char[boost]=!char[boost]:%%~Q!"
        )
        SET "char[boost]=!char[boost]: =,char[!"
        SET /A !char[boost]:~1!,"enem[active]=1", "enem[state]=1"
        ECHO %ESC%[5G%col:c=160;198;219%%ESC%[4mYour gifts aid you in your battle.%ESC%[24m %col:c=190;117;224%(A^)
    ) else (
        SET lev[ifThePrism]="CALL :DIALOGUE -Prism;My sεrvαnt, yσµ hαvε δonε wεll...- -Prism;Yσµr hεrστc δεεδs dεsεrvε cεlεstταl rεwαrδs.- -Prism;Yσµr σld life τs vστδ. Nσ lσngεr αrε yσµ %char[name]%, bµt my Hεrαlδ.- -Prism;Yεt...thτs nεw world nσ lσngεr rεqµτrεs yσµr prεsεncε.- -Prism;Thε sσng sτngs. Bµt yσµ αrε nσt τn τt.-" "SET /A enem[active]=1, enem[state]=1" "SET lev[inter]="
        ECHO %ESC%[5G%col:c=160;198;219%%ESC%[4mSpeak to the Prism%ESC%[24m %col:c=190;117;224%(A^)
    )
)
CHOICE /C A /N>NUL
CALL :GRADIENT "%col[bcl]%" "0;0;0" 9
"%~F0" CONTROL >"%temp%\%~n0_signal.txt" | "%~F0" GAME <"%temp%\%~n0_signal.txt" & SET "char[level]=!errorlevel!"
IF %char[level]% EQU -1 (
    IF defined char[done] (
        IF %char[journey]% EQU 6 (
            CALL :GRADIENT "78;61;92" "0;0;0" 20 1
            ECHO %ESC%[2J%col:c=255;255;255%%ESC%[10;38HThe Song ends.%ESC%[12;35HThere is a new world,%ESC%[13;36HBut also a new god.%col:c=190;117;224%%ESC%[15;43H(A^)
            PAUSE>NUL
            (ECHO /)>"%~n0.bat:level"
            ENDLOCAL&SET "char[done]="&SET "char[boost]="
            GOTO :BEGIN
        ) else (
            SET "enem[disp]=%enem[disp0.1]%"&SET "lev[background]="&SET "lev[boudisp]="
            SET "lev[disp]=%ESC%[13;27H%col:c=106;176;138%░▒▓▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▓▒░"
            SET /A "char[x]=32", "char[y]=12", "enem[x]=59", "enem[y]=12"
            CALL :DIALOGUE %enem[death]%
            CALL :GRADIENT "%col[bcl]%" "96;125;112" 10 1
            "%~F0" CONTROL >"%temp%\%~n0_signal.txt" | "%~F0" PURGATORY <"%temp%\%~n0_signal.txt"&SET "char[ifboost]=!errorlevel!"
            IF !char[ifboost]! EQU 1 (
                SET "char[boost]=%char[boost]% %char[levelset]%"
            )
            SET "char[done]=%char[done]% %char[levelset]%"
        )
    ) else (
        SET "char[done]=0"
    )
    (ECHO %char[name]%;!char[done]!;!char[boost]!)>"%~n0.bat:level"
)
IF %char[level]% LSS 0 (
    SET "char[level]="
)
ENDLOCAL&SET "char[level]=%char[level]%"&SET "char[done]=%char[done]%"
GOTO :LEVELMAKE

:GAME
FOR /L %%# in () DO (
    SET /P "input="
    SET /A "frames+=1"
    IF defined dia[input] (
        %speak%
        IF "!input!" == "A" (
            SET "input="&SET "dia[pause]="
        )
    ) else ( IF defined input (
        IF "!input!" == "W" (
            IF not defined char[height] (
                SET /A "char[height]=char[jump]=1"
            )
        ) else IF "!input!" == "I" (
            %colourchange:#=char%
        ) else IF "!input!" == "P" (
            FOR %%T in ("!char[y]!;!char[x]!") DO (
                FOR %%S in (!lev[inter]!) DO (
                    IF not "!lev[bou%%S]!" == "!lev[bou%%S]:.%%~T.=!" (
                        SET "lev[inter]=!lev[inter]:%%S=!"
                        FOR %%Q in (!lev[if%%S]!) DO (
                            SET "d[com]=%%~Q"&SET "d[com]=!d[com]:-="!"
                            !d[com]!
                        )
                    )
                )
            )
        ) else IF "!input!" == "O" (
            IF !char[pow]! EQU !char[maxpow]! (
                SET "char[dispow]="&SET "char[pow]="
                CALL :%char[spec]%
            )
        ) else (
            SET "char[dir]=!input!"
            SET /A "char[x]+=mov[!input!]"
        )
        SET "input="
    )
    2>NUL SET /A "!every:#=4!" && (
        SET /A "d[x]=enem[x]","d[y]=enem[y],"d[%enem[bou]:;= & SET "d[hit]=!d[hit]!.!d[y]!;!d[x]!" & SET /A d[%"
        SET "d[hit]=!d[hit]!.!d[y]!;!d[x]!."
        FOR /F "tokens=1-4 delims=$" %%Q in ("!char[y]!;!char[x]!$!enem[curnum]!$!enem[state]!$!enem[mask]!") DO (
            IF not "!d[hit]!" == "!d[hit]:.%%~Q.=!" (
                IF !char[col]! EQU !enem[col]! (
                    SET "par[disp]=%ESC%[%%QH%up:n=3%%bcl:c=145;185;207%%col:c=255;255;255%Hit^!%ESC%[0m"
                    SET /A "enem[hp]-=1"
                    IF !enem[hp]! LEQ 0 (
                        CALL :END "%ESC%[19;5HVictory^^^! Press (A) to Return..." -1 "78;61;92"
                    )
                ) else (
                    SET "par[disp]=%ESC%[%%QH%up:n=3%%bcl:c=207;25;40%%col:c=255;255;255%Ouch^!%ESC%[0m"
                    SET /A "char[hp]-=1"
                    IF !char[pow]! EQU !char[maxpow]! (
                        IF "!char[dispow]!" == "!char[dispow]:Ready=!" (
                            SET "char[dispow]=!char[dispow]! %col:c=52;213;235%READY^!^!^!"
                        )
                    ) else (
                        SET /A "char[pow]+=1"
                        SET "char[dispow]=!char[dispow]!█"
                    )
                    IF !char[hp]! LEQ 0 (
                        CALL :END "%ESC%[19;5HDefeat...Press (A) to Return..." -2 "143;23;67"
                    )
                )
            )
            IF !enem[curnum]! EQU !enem[spnum%%S]! (
                SET "enem[curnum]=1"
            ) else (
                SET /A "enem[curnum]+=1"
            )
            IF "%%T" == "" (
                SET "enem[disp]=!enem[disp%%S.%%R]!"
            ) else (
                SET "enem[disp]=!enem[disp%%T.%%R]!"
            )
            IF defined char[jump] (
                IF !char[jump]! EQU !char[maxheight]! (
                    SET "char[jump]="
                ) else (
                    SET /A "char[y]-=1","char[jump]+=1","char[x]+=mov[!char[dir]!]"
                )
            ) else (
                IF "!lev[bou]!" == "!lev[bou]:.%%~Q.=!" (
                    SET /A "char[y]+=1","char[height]=1"
                    IF !char[y]! GEQ 20 (
                        CALL :END "%ESC%[19;5HOuch^^^! Press (A) to Return..." -2 "143;23;67"
                    ) 
                ) else (
                    SET "char[height]="
                )
            )
        )
        SET "d[hit]="
    )
    IF defined enem[active] (
        %behav[cur]%
    ))
    %anim[cur]%
    FOR /F "tokens=1-2 delims=$" %%A in ("!char[col]!$!enem[col]!") DO (
        ECHO %ESC%[48;2;!col[bcl]!m%ESC%[2J%lev[background]%!par[disp]!%lev[disp]%%ESC%[!char[y]!;!char[x]!H%ESC%[38;2;!col[%%A]!m!char[disp]!%lev[boudisp]%%ESC%[!enem[y]!;!enem[x]!H%ESC%[38;2;!col[%%B]!m!enem[disp]!%ESC%[19;5H!d[dia]!%col:c=160;198;219%%ESC%[24;5HPower : %ESC%[38;2;!col[%%A]!m!char[dispow]!%col:c=160;198;219%%ESC%[20;5HDirection : N%bk:n=1%!char[dir]!%ESC%[21;5HYour Chakra : %hpdisp:#=char%%col:c=160;198;219%╤%hpdisp:#=enem%%col:c=160;198;219% : Enemy Chakra%dn:n=1%%nx:n=1%!enem[colrange]!%bk:n=2%%dn:n=1%%ESC%[!enem[col]!C▲%ESC%[22;5H!char[colrange]!%ESC%[23;4H%ESC%[!char[col]!C▲
    )
    SET "par[disp]="
)

:PURGATORY
FOR /L %%# in () DO (
    SET /P "input="
    SET /A "frames+=1"
    IF defined dia[input] (
        %speak%
        IF "!input!" == "A" (
            SET "input="&SET "dia[pause]="
        )
    ) else (
        SET "d[dia]=Kill (I) or Show Mercy (P)"
        IF "!input!" == "I" (
            CALL :TODEST enem[x] enem[y] char[x] char[y] 40 0 "%col:c=255;255;255%▬" "▓%nx:n=1%▓%up:n=1%%bk:n=3%▓▓▓%dn:n=2%%bk:n=3%▓▓▓"
            %framerate:#=2%
            ECHO %ESC%[48;2;%col[bcl]%m%ESC%[2J%col:c=255;255;255%!par[disp]!%lev[disp]%%ESC%[!char[y]!;!char[x]!H%col:c=255;255;255%%char[disp]%
            %framerate:#=1%
            CALL :END "%col:c=99;235;194%%ESC%[18;33HThe Prism is well pleased.%ESC%[19;37HPress %col:c=190;117;224%(A)%col:c=99;235;194% to Return" 0
        ) else IF "!input!" == "P" (
            CALL :TODEST char[x] char[y] enem[x] enem[y] 40 2 "%col:c=255;255;255%%enem[disp]%" "%col:c=255;255;255%%enem[disp]%"
            %framerate:#=2%
            ECHO %ESC%[48;2;%col[bcl]%m%ESC%[2J%col:c=255;255;255%!par[disp]!%lev[disp]%%ESC%[!char[y]!;!char[x]!H%col:c=255;255;255%%char[disp]%
            %framerate:#=1%
            FOR /F "tokens=1-2 delims=;" %%A in ("%enem[gift]%") DO (
                CALL :END "%col:c=99;235;194%%ESC%[17;28HYou have been gifted the %%A%ESC%[18d%%B%ESC%[19;37HPress %col:c=190;117;224%(A)%col:c=99;235;194% to Return" 1
            )
        )
    )
    %anim[purgatory]%
    ECHO %ESC%[48;2;%col[bcl]%m%ESC%[2J%col:c=255;255;255%!par[disp]!%lev[disp]%%ESC%[!char[y]!;!char[x]!H%col:c=255;255;255%%char[disp]%%ESC%[!enem[y]!;!enem[x]!H%col:c=255;255;255%%enem[disp]%%ESC%[19;5H%col:c=255;255;255%!d[dia]!%col:c=160;198;219%%ESC%[24;5HPower : %col:c=255;255;255%%char[dispow]%%col:c=160;198;219%%ESC%[20;5HDirection : N%bk:n=1%%char[dir]%%ESC%[21;5HYour Chakra : %hpdisp:#=char%%col:c=160;198;219%╤%hpdisp:#=enem%%col:c=160;198;219% : Enemy Chakra%dn:n=1%%nx:n=1%%enem[colrange]%%bk:n=2%%dn:n=1%%ESC%[%enem[col]%C▲%ESC%[22;5H%char[colrange]%%ESC%[23;4H%ESC%[%char[col]%C▲
    SET "par[disp]="
)

:MAKECHAR
SET "char[name]=%1"
FOR /F "tokens=1-4,7-8 delims=$" %%A in ("!char[%1]!") DO (
    SET "char[disp]=%%A"&SET "char[spec]=%%F"
    SET /A "char[x]=6","char[y]=3","mov[A]=-1","mov[D]=1","char[col]=1","char[hp]=char[basehp]=%%B","char[maxcol]=%%C","char[maxheight]=%%D","char[maxpow]=%%E"
    CALL :SETCOLRANGE %%C char
)
GOTO :EOF

:MAKELEVEL
FOR /F "tokens=1-7 delims=$" %%1 in ("!level!") DO (
    FOR %%# in (%%1) DO (
        %forperiod:#=7% %%A in ("%%~#") DO (
            SET "d[texnum]="&SET "d[tex]="
            FOR %%A in (!tex[%%E]!) DO (
                SET /A "d[texnum]+=1"
                SET "d[tex!d[texnum]!]=%%~A"
            )
            SET "d[tex]=%ESC%[%%B;%%AH"
            FOR /L %%Y in (1, 1, %%D) DO (
                SET /A "d[bouy]=%%B+(%%Y-2)"
                FOR /L %%X in (1, 1, %%C) DO (
                    SET /A "d[num]=!RANDOM!*d[texnum]/32768+1", "d[boux]=%%A+(%%X-1)"
                    FOR %%G in (!d[num]!) DO (
                        SET "d[tex]=!d[tex]!!d[tex%%G]!"
                    )
                    IF %%Y EQU 1 (
                        SET "lev[bou]=!lev[bou]!.!d[bouy]!;!d[boux]!"
                    )
                )
                SET "d[tex]=!d[tex]!%dn:n=1%%ESC%[%%AG"
            )
        )
        SET "lev[disp]=!lev[disp]!!d[tex]!%ESC%[0m%ESC%[48;2;^!col[bcl]^!m"
    )
    SET "lev[bou]=!lev[bou]!."
    FOR %%@ in (%%2) DO (
        %forperiod:#=3% %%1 in ("%%~@") DO (
            SET "lev[inter]=!lev[inter]! %%3"
            FOR /F "tokens=1-3 delims=$" %%A in ("!inter[%%3]!") DO (
                SET "lev[if%%3]=%%B"
                SET "lev[boudisp]=!lev[boudisp]!%ESC%[%%2;%%1H%%A"
                FOR /L %%Q in (-1, 1, %%C) DO (
                    SET /A "d[num]=%%1+%%Q"
                    SET "lev[bou%%3]=!lev[bou%%3]!.%%2;!d[num]!"
                )
            )
            SET "lev[bou%%3]=!lev[bou%%3]!."
        )
    )
    %forperiod:#=2% %%X in ("%%~3") DO (
        SET "anim[cur]=!anim[%%Y]:@=%%X!"
    )
    %forperiod:#=3% %%A in ("%%~4") DO (
        TITLE %%C
        FOR /F "tokens=1-6 delims=$" %%Q in ("!enem[%%C]!") DO (
            CALL :SETCOLRANGE %%S enem
            SET "d[tex]=%%Q"
            SET "enem[bou]=%%T"&SET "enem[death]=%%U"&SET "enem[gift]=%%V"
            SET /A "enem[x]=%%A","enem[y]=%%B","enem[hp]=enem[basehp]=%%R","enem[maxcol]=%%S","enem[col]=1"
        )
    )
    FOR %%L in (%%5) DO (
        SET "%%~L"
    )
    SET "lev[chaptertext]=%%6"&SET "lev[background]=%%7"
)
SET "d[num]=0"
SET d[tex%d[num]%]=%d[tex]:.= & SET /A "d[num]+=1" & SET d[tex!d[num]!]=%
FOR /L %%W in (0, 1, %d[num]%) DO (
    FOR %%P in (!d[tex%%W]!) DO (
        SET /A "enem[spnum%%W]+=1"
        SET "enem[disp%%W.!enem[spnum%%W]!]=%%~P"
    )
)
FOR /F "tokens=1 delims==" %%Q in ('SET d[') DO (
    SET "%%Q="
)
GOTO :EOF

:DIALOGUE <dialogue>
SET /A "dia[input]=1","dia[num]=dia[speak]=0"
FOR %%@ in (%*) DO (
    SET /A "dia[num]+=1"
    FOR /F "tokens=1-2 delims=;" %%A in ("%%~@") DO (
        SET "d[tex]=%%B"
        FOR %%A in (" " "," ' . a b c d e f g h i j k l m n o p q r s t u v w x y z ε α σ δ τ) DO (
            SET "d[tex]=!d[tex]:%%~A= "%%~A" !"
        )
        SET "dia[!dia[num]!]=%%A;!d[tex]!"
    )
)
GOTO :EOF

:END <endtext> <errorlevel> <gradient colour>
IF not "%~3" == "" (
    CALL :GRADIENT "%col[bcl]%" %3 9 1
)
ECHO %col:c=111;207;242%%~1
(COPY NUL "%~dpn0.quit")>NUL
EXIT %2
GOTO :EOF

:TODEST <destx> <desty> <startx> <starty> <duration> <ifclear> <movesprite> <spritehit>
SETLOCAL
IF %6 EQU 1 (
    SET "d[tex]=%ESC%[48;2;%col[bcl]%m%ESC%[2J%lev[background]%%lev[disp]%%ESC%[%char[y]%;%char[x]%H%ESC%[38;2;!col[%char[col]%]!m%char[disp]%%lev[boudisp]%%ESC%[%enem[y]%;%enem[x]%H%ESC%[38;2;!col[%enem[col]%]!m%enem[disp]%"
) else IF %6 EQU 2 (
    SET "d[tex]=%ESC%[48;2;%col[bcl]%m%ESC%[2J%lev[disp]%%ESC%[%char[y]%;%char[x]%H%col:c=255;255;255%%char[disp]%"
) else (
    SET "d[tex]="
)
SET /A "x[a]=%1","y[a]=%2","d[x]=x[a]-%3","d[y]=y[a]-%4","d[num]=(d[x]*(1|(d[x]>>31)))-(((d[x]*(1|(d[x]>>31)))-(d[y]*(1|(d[y]>>31))))&(((d[x]*(1|(d[x]>>31)))-(d[y]*(1|(d[y]>>31))))>>31))","y[sig]=1|(d[y]>>31)","x[sig]=1|(d[x]>>31)","d[x]=%3","d[y]=%4"
FOR /L %%Q in (1, 1, %d[num]%) DO (
    FOR %%W in (x y) DO (
        IF not !d[%%W]! EQU !%%W[a]! (
            SET /A "d[%%W]=d[%%W]+!%%W[sig]!"
        )
    )
    ECHO %d[tex]%%ESC%[!d[y]!;!d[x]!H%~7
    FOR /L %%J in (1,%5,1000000) DO REM
)
ECHO %d[tex]%%ESC%[%d[y]%;%d[x]%H%~8
FOR /L %%J in (1,%5,1000000) DO REM
ENDLOCAL
GOTO :EOF

:DIVINEFIREOFRA
SET "d[col]=%col[bcl]%"
SET /A "d[tx]=char[x]-6","d[ty]=char[y]-3"
CALL :DIALOGUE "Ra;May the Fires of Heaven protect you, young one"
CALL :GRADIENT "%d[col]%" "122;36;28" 8 1
CALL :ANIMATION "%ESC%[%d[ty]%;%d[tx]%H%col:c=191;13;0%─%col:c=235;216;52%═%col:c=191;13;0%─%col:c=235;216;52%═══════%col:c=191;13;0%─%col:c=235;216;52%═%col:c=191;13;0%─.2" "%ESC%[%d[ty]%;%d[tx]%H%up:n=1%%nx:n=2%%col:c=235;216;52%_═══════_%dn:n=1%%bk:n=11%%col:c=191;13;0%─%col:c=235;216;52%╢_%col:c=191;13;0%┼─────┼%col:c=235;216;52%_╟%col:c=191;13;0%─%col:c=235;216;52%%dn:n=1%%bk:n=10%═══════.2" "%ESC%[%d[ty]%;%d[tx]%H%up:n=1%%nx:n=2%%col:c=235;216;52%_┌┬───┬┐_%dn:n=1%%bk:n=11%%col:c=191;13;0%─%col:c=235;216;52%╢_%col:c=191;13;0%┼┤ %col:c=209;28;252%█%col:c=191;13;0% ├┼%col:c=235;216;52%_╟%col:c=191;13;0%─%col:c=235;216;52%%dn:n=1%%bk:n=10%└┴───┴┘.2" "%ESC%[%d[ty]%;%d[tx]%H%up:n=1%%nx:n=2%%col:c=235;216;52%╖╤─┬─┬─╤╓%dn:n=1%%bk:n=11%%col:c=191;13;0%─%col:c=235;216;52%╢─%col:c=191;13;0%┼─┤%col:c=227;213;11%█%col:c=191;13;0%├─%col:c=235;216;52%┼─╟%col:c=191;13;0%─%col:c=235;216;52%%dn:n=1%%bk:n=11%╜╧─┴─┴─╧╙.1"
IF %char[x]% GTR %enem[x]% (
    CALL :TODEST 1 d[ty] char[x]-1 %d[ty]% 75 0 "%col:c=255;165;31%▓" "%col:c=255;165;31%▓"
) else (
    CALL :TODEST 90 d[ty] char[x]+1 %d[ty]% 75 0 "%col:c=255;165;31%▓" "%col:c=255;165;31%▓"
)
SET /A "d[x]=enem[x]","d[y]=enem[y],"d[%enem[bou]:;= & SET "d[hit]=!d[hit]!.!d[y]!;!d[x]!" & SET /A d[%"
SET "d[hit]=!d[hit]!.!d[y]!;!d[x]!."
IF not "!d[hit]:.%d[ty]%;=!" == "%d[hit]%" (
    SET /A "enem[hp]-=3"
    IF !enem[hp]! LEQ 0 (
       CALL :END "%ESC%[19;5HVictory^^^! Press (A) to Return..." -1 "78;61;92"
    )
)
%framerate:#=2%
CALL :GRADIENT "122;36;28" "%d[col]%" 10 1
GOTO :EOF

:LUNARSOULSPEAR
CALL :ANIMATION "%ESC%[%char[y]%;%char[x]%H%col:c=242;59;245%%bk:n=1%│%nx:n=1%│%up:n=1%%bk:n=3%┌─┐%dn:n=2%%bk:n=3%└─┘.3" "%ESC%[%char[y]%;%char[x]%H%col:c=66;218;245%%bk:n=1%║%nx:n=1%║%up:n=1%%bk:n=3%╔═╗%dn:n=2%%bk:n=3%È═╝.3" "%ESC%[%char[y]%;%char[x]%H%bk:n=1%%col:c=66;218;245%═%nx:n=1%═%up:n=1%%bk:n=3%%col:c=66;218;245%╔%col:c=242;59;245%║%col:c=66;218;245%╗%dn:n=2%%bk:n=3%È%col:c=242;59;245%║%col:c=66;218;245%╝.3"
CALL :TODEST enem[x] enem[y] char[x] char[y] 50 1 "%col:c=66;218;245%░▒▓█%col:c=242;59;245%╠" "%bk:n=1%%col:c=243;252;66%═%nx:n=1%═%up:n=1%%bk:n=3%%col:c=161;253;255%╔%col:c=243;252;66%║%col:c=161;253;255%╗%dn:n=2%%bk:n=3%╚%col:c=243;252;66%║%col:c=161;253;255%╝"
IF not %enem[maxcol]% EQU 1 (
    SET /A "enem[maxcol]-=1"
    CALL :SETCOLRANGE !enem[maxcol]! enem
)
CALL :DIALOGUE "You;I hereby confine your Flames to the Abyss."
%framerate:#=3%
CALL :ANIMATION "%ESC%[%enem[y]%;%enem[x]%H%col:c=161;253;255%%bk:n=1%║%nx:n=1%║%up:n=1%%bk:n=3%╔═╗%dn:n=2%%bk:n=3%╚═╝.3" "%ESC%[%enem[y]%;%enem[x]%H%col:c=243;252;66%%bk:n=1%│%nx:n=1%│%up:n=1%%bk:n=3%┌─┐%dn:n=2%%bk:n=3%└─┘.3"
%framerate:#=3%
GOTO :EOF

:INNERPOWER
SET "d[col]=%col[bcl]%"
SET /A "char[maxheight]+=1","char[hp]+=3","char[maxcol]+=1"
CALL :SETCOLRANGE %char[maxcol]% char
CALL :GRADIENT "%d[col]%" "18;8;90" 8 1
CALL :ANIMATION "%ESC%[%char[y]%;%char[x]%H%nx:n=4%%col:c=98;145;86%%bk:n=1%~%col:c=9;30;189%█%up:n=1%%bk:n=1%%col:c=106;31;156%v%dn:n=1%%col:c=98;145;86%~.3" "%ESC%[%char[y]%;%char[x]%H%bk:n=4%%col:c=98;145;86%%bk:n=1%~%col:c=9;30;189%█%up:n=1%%bk:n=1%%col:c=106;31;156%v%dn:n=1%%col:c=98;145;86%~.3" "%ESC%[%char[y]%;%char[x]%H%up:n=3%%col:c=98;145;86%%bk:n=1%~%col:c=9;30;189%█%bk:n=1%%up:n=1%%col:c=106;31;156%v%dn:n=1%%col:c=98;145;86%~.3" "%ESC%[%char[y]%;%char[x]%H%dn:n=3%%col:c=98;145;86%%bk:n=1%~%col:c=9;30;189%█%up:n=1%%bk:n=1%%col:c=106;31;156%v%dn:n=1%%col:c=98;145;86%~.3"
SET "char[disp]=█%bk:n=2%%col:c=0;173;107%╡%nx:n=1%╞%up:n=1%%bk:n=3%%col:c=27;40;161%╓╤╖"
CALL :DIALOGUE "You;Power...true power..."
CALL :GRADIENT "18;8;90" "%d[col]%" 8 1
GOTO :EOF

:GRADIENT <colour1> <colour2> <increment> <dispstats>
SETLOCAL
IF "%~4" == "" (
    SET "d[tex]="
) else (
    SET "d[tex]=%col:c=160;198;219%%ESC%[24;5HPower : %ESC%[38;2;!col[%char[col]%]!m%char[dispow]%%col:c=160;198;219%%ESC%[20;5HDirection : N%bk:n=1%%char[dir]%%ESC%[21;5HYour Chakra : %hpdisp:#=char%%col:c=160;198;219%╤%hpdisp:#=enem%%col:c=160;198;219% : Enemy Chakra%dn:n=1%%nx:n=1%%enem[colrange]%%bk:n=2%%dn:n=1%%ESC%[%enem[col]%C▲%ESC%[22;5H%char[colrange]%%ESC%[23;4H%ESC%[%char[col]%C▲"
)
FOR /F "tokens=1-6 delims=;" %%A in ("%~1;%~2") DO (
    SET /A "col[rst]=(%%D-%%A)/%3","col[gst]=(%%E-%%B)/%3","col[bst]=(%%F-%%C)/%3","col[r]=%%A","col[g]=%%B","col[b]=%%C"
)
FOR /L %%N in (1, 1, %3) DO (
    SET /A "col[r]+=col[rst]","col[g]+=col[gst]","col[b]+=col[bst]"
    SET "col[bcl]=!col[r]!;!col[g]!;!col[b]!"
    ECHO %ESC%[48;2;!col[r]!;!col[g]!;!col[b]!m%ESC%[2J%lev[disp]%%lev[background]%%ESC%[%char[y]%;%char[x]%H%ESC%[38;2;!col[%char[col]%]!m%char[disp]%%lev[boudisp]%%ESC%[%enem[y]%;%enem[x]%H%ESC%[38;2;!col[%enem[col]%]!m%enem[disp]%%d[tex]%
    %framerate:#=50%
)
ENDLOCAL&SET "col[bcl]=%col[r]%;%col[g]%;%col[b]%"
GOTO :EOF

:ANIMATION <sprite.time>
SET "d[tex]="
FOR %%# in (%*) DO (
    %forperiod:#=2% %%A in ("%%~#") DO (
        ECHO %%A
        SET "d[tex]=!d[tex]!%%A"
        FOR /L %%J in (1,%%B,1000000) DO REM
    )
)
GOTO :EOF

:SETCOLRANGE <range> <who>
SET "%2[colrange]="
IF "%2" == "enem" (
    SET "d[tex]=%bk:n=2%%ESC%[38;2;^!col[%%W]^!m█^!%2[colrange]^!"
) else (
    SET "d[tex]=^!%2[colrange]^!%ESC%[38;2;^!col[%%W]^!m█"
)
FOR /L %%W in (1, 1, %1) DO (
    SET "%2[colrange]=%d[tex]%"
)
GOTO :EOF

:CONTROL
FOR /L %%C in () do (
    FOR /F "tokens=*" %%A in ('CHOICE /C:WASDIOP /N') DO (
        IF exist "%~dpn0.quit" (
            DEL /F /Q "%~dpn0.quit"
            EXIT
        )
        <NUL SET /P ".=%%A"
    )
)
GOTO :EOF

:LEVEL0
SET level="3.9.6.1.stone" "12.9.6.1.stone" "21.9.6.1.stone" "30.9.6.1.stone" "39.11.11.1.stone" "54.12.11.1.bloodstone"$"62.11.Kaya"$"3.rain"$"62.11.Kaya"$"d[num]="$Rain pours like shattered glass. This was the Temple of the great city Chemosh, built#where the Gods struck down the insolent deities of old. After centuries of war, only#rubble remains of the great Temple. The Song grows dimmer evermore. The world is #crumbling. And yet, she's here. She's always here. Kaya.$%ESC%[6;44H%bk:n=4%%col:c=128;51;15%▒%nx:n=3%%col:c=15;32;128%█%nx:n=2%%col:c=55;75;189%│%col:c=115;55;189%\%bk:n=9%%dn:n=1%%col:c=55;75;189%^^^<%col:c=115;55;189%▓─╥═╥─╛%nx:n=1%\%bk:n=10%%dn:n=1%%col:c=128;51;15%▒%col:c=115;55;189%%nx:n=2%╚╤╝%bk:n=5%%dn:n=1%▒%nx:n=1%╔▓╗%bk:n=4%%dn:n=1%%col:c=128;51;15%─%col:c=115;55;189%╝%nx:n=1%╚%col:c=128;51;15%─%bk:n=6%%up:n=5%▒%nx:n=5%%col:c=192;64;227%\%ESC%[8;48H%col:c=15;32;128%█%dn:n=1%%bk:n=3%%col:c=115;55;189%─╥═╥%dn:n=1%%bk:n=3%╚╤╝%ESC%[6;33H%col:c=15;32;128%█%dn:n=1%%bk:n=2%%col:c=115;55;189%╥═╥─%dn:n=1%%bk:n=4%╚╤╝%ESC%[8;31H%col:c=15;32;128%█
SET "inter[Kaya]=%bk:n=1%$"CALL :DIALOGUE -Kaya;You've come to end my misery, haven't you#...- -You;Just come back Kaya. You're needed for the War, everyone wants you back...- -Kaya;The Prism isn't a God. What God wants a War#- -Kaya;Listen to me. You have to stop this madness.- -You;Kaya, we can talk once we get back, please...- -Kaya;We've talked. And talked. And talked.- -Kaya;All you care about is being right. You never listen.- -You;Wait...- -Kaya;Let me tell you something. You're wrong. We're all wrong.- -You;Kaya...- -Kaya;And you're too scared to admit it. I would be, too.- -Kaya;But I'm not a coward. Judgement awaits me.-" "SET enem[state]=1" "SET enem[curnum]=1" "SET enem[active]=1"$1"
SET enem[Kaya]="%bk:n=1%%col:c=232;201;49%+%col:c=179;103;62%█" "%bk:n=1%%col:c=232;201;49%x%col:c=179;103;62%█"."%bk:n=1%%col:c=232;201;49%x%col:c=179;103;62%█"."%bk:n=1%%col:c=232;201;49%x%col:c=179;103;62%█" "%bk:n=1%%col:c=232;201;49%+%col:c=28;145;124%█"." "$1$5$x]+=20
SET behav[cur]=2^>NUL SET /A "^!every:#=9^!" ^&^& (%\n%
    IF ^^!enem[state]^^! EQU 1 (%\n%
        IF ^^!enem[x]^^! EQU 66 (%\n%
            %enemstateset:#=2% %\n%
        ) else (%\n%
            SET /A "enem[x]+=1"%\n%
        )%\n%
    ) else IF ^^!enem[state]^^! EQU 2 (%\n%
        IF ^^!enem[y]^^! EQU 20 (%\n%
            %enemstateset:#=3% %\n%
        ) else (%\n%
            SET /A "enem[y]+=1"%\n%
        )%\n%
    ) else IF ^^!enem[state]^^! EQU 3 (%\n%
        IF ^^^!enem[wait]^^^! EQU 20 (%\n%
            CALL :END "%ESC%[19;5HPress (A) to Return..." -1 "16;42;89"%\n%
        ) else (%\n%
            SET /A "enem[wait]+=1"%\n%
        )%\n%
    )%\n%
)
GOTO :EOF

:LEVEL1
SET level="3.9.6.1.stone" "12.12.8.4.flowers" "24.10.4.3.mossystone" "33.8.4.4.flowers" "40.6.4.1.stone" "46.7.3.1.stone" "50.9.5.1.stone" "58.10.10.3.mossystone" "73.16.11.1.flowers" "82.12.5.1.mossystone" "79.8.4.1.mossystone" "75.5.5.1.mossystone"$"63.9.SunlightStatue" "77.4.WaterTotem"$"2.rain"$"73.13.FallenDragon"$"enem[state]=-1" "enem[col]=5" "enem[spnum-1]=1" "enem[disp-1.1]=%col:c=121;128;138%╡█%col:c=69;99;130%▓%col:c=121;128;138%%bk:n=1%%dn:n=1%█ █%col:c=121;128;138%██%bk:n=5%%dn:n=1%█%col:c=69;99;130%▓▓ ▓%col:c=89;92;97%██╞"$The Ancient Dragon stands watch amongst the blooming flowers - the last of a kind#once bountiful as the stars. In the old ages, Priests worshipped them for wisdom;#Warriors sought them for power; Magicians studied them for sorcery. But their#treachery was soon revealed. They are tricksters, liars, beasts of many tongues.#Their betrayal will not be forgotten. 
SET "inter[WaterTotem]=%col:c=204;16;2%█%bk:n=1%%up:n=1%▓%bk:n=2%%up:n=1%%col:c=62;31;204%╟%col:c=204;16;2%▒%col:c=62;31;204%╢$"SET enem[maxcol]=3" "CALL :SETCOLRANGE 3 enem" "SET enem[mask]=" "SET enem[col]=1" "CALL :DIALOGUE -Dragon;My bones....-"$1"
SET "inter[SunlightStatue]=%col:c=130;122;72%█▓█%bk:n=3%%up:n=1%-█-%bk:n=3%%up:n=1%%col:c=250;238;157%\│/$"CALL :GRADIENT -0;0;0- -3;24;56- 5 1" "SET enem[active]=1" "SET enem[state]=4" "SET enem[mask]=4" "REM CALL :DIALOGUE -Dragon;Who has awakened me#...- -You;Your time has come, Old One. Your defilement of the song is at an end.- -Dragon;Oh# I have only slept for the past thousand years...- -You;The Prism requests your execution.- -Dragon;Ha. Do not forget, your kind once worshipped us as gods.- -Dragon;We gifted you, protected you, blessed you...and yet we moulded monsters.- -You;You're a relic from a bygone age. You should've died out years ago.- -Dragon;Ha. Ha ha. Very well. Let me teach your arrogance a lesson.-"$3"
SET enem[FallenDragon]="┤█%col:c=162;83;184%█%bk:n=1%%dn:n=1%█%nx:n=1%█%col:c=162;83;184%██%bk:n=5%%dn:n=1%█%col:c=91;73;143%██%nx:n=1%█%col:c=73;89;143%██╞" "─█%col:c=91;73;143%█%bk:n=1%%dn:n=1%█%col:c=91;73;143%█%nx:n=1%██%col:c=73;89;143%█%bk:n=5%%dn:n=1%██%col:c=162;83;184%█%nx:n=1%%col:c=91;73;143%██╞" "┤█%col:c=73;89;143%█%bk:n=1%%dn:n=1%█%col:c=91;73;143%██%nx:n=1%█%col:c=73;89;143%██%bk:n=5%%dn:n=1%█%col:c=162;83;184%██%nx:n=1%%col:c=73;89;143%█╞"."^<%up:n=1%/%dn:n=1%%bk:n=1%█%col:c=235;0;168%█%bk:n=1%%dn:n=1%█%nx:n=1%%col:c=73;89;143%█%col:c=91;73;143%██%bk:n=5%%dn:n=1%█%col:c=235;0;168%█%nx:n=2%██╞" "-%up:n=1%/%dn:n=1%%bk:n=1%█%col:c=235;75;168%█%bk:n=1%%dn:n=1%█%nx:n=1%%col:c=73;89;143%█%col:c=91;73;143%███%bk:n=5%%dn:n=1%█%col:c=235;75;168%█%nx:n=2%██╞"."┤█%col:c=162;83;184%█%bk:n=1%%dn:n=1%█%nx:n=1%█%col:c=162;83;184%██%bk:n=5%%dn:n=1%█%col:c=91;73;143%██%nx:n=1%█%col:c=73;89;143%██╞" "─█%col:c=91;73;143%█%bk:n=1%%dn:n=1%█%col:c=91;73;143%█%nx:n=1%██%col:c=73;89;143%█%bk:n=5%%dn:n=1%██%col:c=162;83;184%█%nx:n=1%%col:c=91;73;143%██╞" "┤█%col:c=73;89;143%█%bk:n=1%%dn:n=1%█%col:c=91;73;143%██%nx:n=1%█%col:c=73;89;143%██%bk:n=5%%dn:n=1%█%col:c=162;83;184%██%nx:n=1%%col:c=73;89;143%█╞"."┤%up:n=1%v%bk:n=1%%dn:n=1%█%col:c=37;210;230%█%bk:n=1%%dn:n=1%█%nx:n=1%┤██%col:c=91;73;143%█%nx:n=1%≈%bk:n=7%%dn:n=1%█%col:c=37;210;230%█%nx:n=2%≈██╞" "-%up:n=1%v%bk:n=1%%dn:n=1%█%col:c=104;180;189%█%bk:n=1%%dn:n=1%█≈%nx:n=1%█%col:c=91;73;143%██≈%bk:n=7%%dn:n=1%██%col:c=104;180;189%█%nx:n=1%≈███╞" "┤%up:n=1%v%bk:n=1%%dn:n=1%█%col:c=154;208;214%█%dn:n=1%█%nx:n=1%≈██%col:c=91;73;143%█%nx:n=2%≈%bk:n=9%%dn:n=1%██%col:c=104;180;189%█%nx:n=2%≈██╞"."┤█%col:c=209;0;31%%up:n=1%~%dn:n=1%%bk:n=1%█%nx:n=3%~%dn:n=1%%bk:n=5%▓~█%col:c=235;182;26%▓██%nx:n=1%~%dn:n=1%%bk:n=9%~█▓█%nx:n=1%~█▓%col:c=250;195;45%╞" "-█%col:c=209;0;31%█%up:n=1%~%dn:n=1%%nx:n=2%~%dn:n=1%%bk:n=5%▓%nx:n=1%~█%col:c=235;182;26%▓█~%dn:n=1%%bk:n=9%~%nx:n=1%█▓██%nx:n=1%%col:c=209;0;31%█▓%col:c=250;195;45%╞" "┤█%col:c=209;0;31%%up:n=1%~%dn:n=1%%bk:n=1%█%nx:n=2%~%dn:n=1%%bk:n=4%▓%col:c=235;182;26%█~%nx:n=1%██%col:c=209;0;31%▓%nx:n=1%~%dn:n=1%%bk:n=10%~%nx:n=1%▓███%nx:n=1%█%col:c=250;195;45%╞"$15$5$x]+=0;x]+=1;x]+=1;y]+=1;x]+=1;x]+=1;x]+=1;x]+=1;x]+=1;x]+=1;y]+=1;x]-=1;x]-=1;x]-=1;x]-=1;x]-=1$"Dragon;I fought with your forefathers against the legions of the Abyss." "Dragon;And now, I am at the mercy of their sons." "Dragon;Let me tell you something :" "Dragon;Your forefathers created the prism. You only worship yourselves." "Dragon;Heed my words."$StoneTalisman;%ESC%[16GThis ancient artifact, though near crumbling, boosts health
SET behav[cur]=2^>NUL SET /A "^!every:#=5^!" ^&^& (%\n%
    IF ^^^!enem[state]^^^! EQU 1 (%\n%
        IF ^^^!enem[x]^^^! LEQ 2 (%\n%
            SET /A "d[num]=^!RANDOM^!*2/32768+1"%\n%
            IF ^^^!d[num]^^^! EQU 1 (%\n%
                %enemstateset:#=2%,"enem[trx]=char[x]"%\n%
            ) else (%\n%
                %enemstateset:#=3%,"enem[trx]=char[x]","enem[try]=char[y]"%\n%
            )%\n%
        ) else (%\n%
            SET /A "enem[x]-=3"%\n%
        )%\n%
    ) else IF ^^^!enem[state]^^^! EQU 2 (%\n%
        IF ^^^!enem[x]^^^! EQU ^^^!enem[trx]^^^! (%\n%
            (SET /A "1/(((12-(((enem[x]-char[x])*(1|(enem[x]-char[x])>>31))+((enem[y]-char[y])*(1|(enem[y]-char[y])>>31))))>>31)&1)" 2^>NUL) ^&^& (%\n%
                %enemstateset:#=3%,"enem[trx]=char[x]","enem[try]=char[y]"%\n%
            ) ^|^| (%\n%
                SET "enem[state]=0"%\n%
            )%\n%
        ) else (%\n%
            ^!enemytrack:#=x^! %\n%
        )%\n%
    ) else IF ^^^!enem[state]^^^! EQU 3 (%\n%
        ^!enemytrack:#=x^! %\n%
        ^!enemytrack:#=y^! %\n%
        IF "^!enem[x]^!;^!enem[y]^!" == "^!enem[trx]^!;^!enem[try]^!" (%\n%
            %enemstateset:#=0% %\n%
        )%\n%
    ) else (%\n%
        ^!enemyfollow:#=y^! else (%\n%
            %enemstateset:#=1% %\n%
        )%\n%
    )%\n%
)%\n%
IF not defined enem[mask] (%\n%
    2^>NUL SET /A "^!every:#=250^!" ^&^& (%\n%
        ^!colourchange:#=enem^! %\n%
    )%\n%
)
GOTO :EOF

:LEVEL2
::Credits to IcarusLives for SIN function
SET level="4.13.3.3.flowers" "10.12.3.2.forest" "17.11.5.1.flowers" "26.9.4.3.forest" "19.6.5.1.forest" "86.13.3.3.flowers" "79.12.3.2.forest" "70.11.5.1.flowers" "61.9.4.3.forest" "67.6.5.1.forest"$"20.5.ObeliskA" "69.5.ObeliskB"$"1.rain"$"46.7.Insidiae, TaintedQueen"$"enem[active]=1"$Babylon the Great; queen of the defiled, queen of abominations. Here lies Insidae, #heir to Her throne. Once a great and powerful kingdom; now, only ruins speak of their #glorious past. Her queen remains, drunk with immortality, drunk with the pleasures of #flesh and blood. She must face judgement. Only then can the Song be restored.$%ESC%[6;42H%col:c=40;117;44%▓%nx:n=7%▓%dn:n=1%█%bk:n=11%█%dn:n=1%▓%nx:n=7%▓%dn:n=1%%bk:n=8%█▓███▓█%dn:n=1%%bk:n=5%█▓█%dn:n=1%%bk:n=2%█
SET "inter[ObeliskA]=%col:c=43;173;78%█%col:c=44;87;56%█%col:c=43;173;78%█%bk:n=2%%up:n=1%█%bk:n=1%%up:n=1%%col:c=81;45;105%▓$"SET /A char[x]=68,char[y]=3" "SET lev[inter]=ObeliskB"$3"
SET "inter[ObeliskB]=%col:c=43;173;78%█%col:c=44;87;56%█%col:c=43;173;78%█%bk:n=2%%up:n=1%█%bk:n=1%%up:n=1%%col:c=81;45;105%▓$"SET /A char[x]=23,char[y]=3" "SET lev[inter]=ObeliskA"$3"
SET enem[Insidiae, TaintedQueen]="█%col:c=70;29;171%%bk:n=2%/%nx:n=1%\%bk:n=5%%dn:n=1%%col:c=58;158;148%╡%col:c=70;29;171%/%nx:n=1%%col:c=29;70;128%▀%nx:n=1%%col:c=70;29;171%\%col:c=58;158;148%╞" "█%col:c=70;29;171%%bk:n=2%/%nx:n=1%\%bk:n=5%%dn:n=1%%col:c=58;158;148%╡%col:c=70;29;171%\%nx:n=1%%col:c=29;70;128%▀%nx:n=1%%col:c=70;29;171%/%col:c=58;158;148%╞" "█%col:c=70;29;171%%bk:n=2%/%nx:n=1%\%bk:n=5%%dn:n=1%%col:c=58;158;148%╡%col:c=70;29;171%-%nx:n=1%%col:c=29;70;128%▀%nx:n=1%%col:c=70;29;171%-%col:c=58;158;148%╞"."█%col:c=29;39;97%%bk:n=2%/%nx:n=1%\%bk:n=5%%dn:n=1%%col:c=58;158;148%╡%col:c=29;39;97%\%nx:n=1%%col:c=29;70;128%~%nx:n=1%%col:c=29;39;97%/%col:c=58;158;148%╞" "█%col:c=29;39;97%%bk:n=2%/%nx:n=1%\%bk:n=5%%dn:n=1%%col:c=58;158;148%╡%col:c=29;39;97%/%nx:n=1%%col:c=29;70;128%~%nx:n=1%%col:c=29;39;97%\%col:c=58;158;148%╞"."█%col:c=70;29;171%%bk:n=2%/%nx:n=1%\%bk:n=5%%dn:n=1%%col:c=58;158;148%╡%col:c=70;29;171%/%nx:n=1%%col:c=29;70;128%▀%nx:n=1%%col:c=70;29;171%\%col:c=204;10;46%╞" "█%col:c=70;29;171%%bk:n=2%/%nx:n=1%───%up:n=1%%bk:n=1%%col:c=204;10;46%╧%dn:n=2%%bk:n=7%%col:c=58;158;148%╡%col:c=70;29;171%/%nx:n=1%%col:c=29;70;128%ß" "█%col:c=70;29;171%%bk:n=2%/%nx:n=1%/%up:n=1%%bk:n=1%%col:c=204;10;46%╡%col:c=70;29;171%/%dn:n=2%%bk:n=6%%col:c=58;158;148%╡%col:c=70;29;171%/%nx:n=1%%col:c=29;70;128%▀". "%col:c=70;172;235%%bk:n=1%─%up:n=1%│%dn:n=1%%bk:n=1%%col:c=29;39;97%█%col:c=70;172;235%─%bk:n=5%%dn:n=1%%col:c=58;158;148%╡%col:c=29;39;97%/%nx:n=1%%col:c=70;172;235%│%nx:n=1%%col:c=29;39;97%\%col:c=58;158;148%╞" "%col:c=29;39;97%%bk:n=1%/█\%bk:n=5%%dn:n=1%%col:c=58;158;148%╡%col:c=29;39;97%\%nx:n=1%%col:c=29;70;128%▀%nx:n=1%%col:c=29;39;97%/%col:c=58;158;148%╞"$20$3$x]-=1;x]+=1;x]+=1;y]+=1;x]+=1;x]+=1;x]-=3;x]-=1;x]-=1$"Insidae;Curse you..." "Insidae;Curse you and your filthy breed of locusts..." "Insidae;Our kingdoms were peaceful and prosperous." "Insidae;And yet, you burned our cities and enslaved our people." "Insidae;A kingdom in exchange for the lies of a false god#" "Insidae;Shameful..."$TearDropNecklace;%ESC%[12GSaid to be the tears of a Queen watching her kingdom burn. Boosts jump.
SET behav[cur]=2^>NUL SET /A "^!every:#=7^!" ^&^& (%\n%
    IF ^^^!enem[state]^^^! EQU 0 (%\n%
        ^!enemyfollow:#=x^!%\n%
        IF ^^^!char[x]^^^! EQU ^^^!enem[x]^^^! (%\n%
            (SET /A "1/(((2-((enem[y]-char[y])*(1|(enem[y]-char[y])>>31)))>>31)&1)" 2^>NUL) ^&^& (%\n%
                %enemstateset:#=1%,"enem[try]=char[y]" %\n%
            ) ^|^| (%\n%
                %enemstateset:#=2%,"enem[trx]=char[x]","enem[try]=char[y]" %\n%
            )%\n%
        ) else (%\n%
            SET /A "x=enem[x]*37","d[num]=((a=(x * 31416 / 180)%%62832, c=(a>>31|1)*a, a-=(((c-47125)>>31)+1)*((a>>31|1)*62832)  +  (-((c-47125)>>31))*( (((c-15709)>>31)+1)*(-(a>>31|1)*31416+2*a)  ), a-a*a/1920*a/312500+a*a/1920*a/15625*a/15625*a/2560000-a*a/1875*a/15360*a/15625*a/15625*a/16000*a/44800000)*2)/10000","enem[y]+=d[num]"%\n%
        )%\n%
    ) else IF ^^^!enem[state]^^^! EQU 1 (%\n%
        ^!enemytrack:#=y^! %\n%
        IF ^^^!enem[try]^^^! EQU ^^^!enem[y]^^^! (%\n%
            %enemstateset:#=0% %\n%
        )%\n%
    ) else IF ^^^!enem[state]^^^! EQU 2 (%\n%
        SET /A "enem[wait]+=1"%\n%
        IF ^^^!enem[wait]^^^! EQU 10 (%\n%
            %enemstateset:#=3%, "enem[wait]=0","enem[x]=^!RANDOM^!*(85-5+1)/32768+5","enem[y]=^!RANDOM^!*(15-5+1)/32768+5"%\n%
        )%\n%
    ) else IF ^^^!enem[state]^^^! EQU 3 (%\n%
        SET /A "enem[wait]+=1"%\n%
        IF ^^^!enem[wait]^^^! EQU 10 (%\n%
            %enemstateset:#=0%, "enem[wait]=0",%\n%
        )%\n%
    )%\n%
)%\n%
2^>NUL SET /A "^!every:#=190^!" ^&^& (%\n%
    ^!colourchange:#=enem^! %\n%
)
GOTO :EOF

:LEVEL3
SET "inter[ConsortCamila]=%col:c=194;106;29%█%bk:n=2%%up:n=1%%col:c=189;34;34%─%up:n=1%│%dn:n=1%%bk:n=1%*─$"SET enem[state]=0" "SET enem[active]=1" "SET lev[ifConsortCamila]=" "CALL :DIALOGUE -ConsortCamila;My king...he is sleeping...- -ConsortCamila;Do not disturb him....- -You;Leave. Your king is a puppet of shadow and death.- -ConsortCamila;Puppet# You obey the Prism without mind nor thought...- -ConsortCamila;Have not your kind done enough#...- -ConsortCamila;Rest assured, Lord Yuzo will take care of you...- -You;Awake, Lord Yuzo...it is time to face your judgement.- -Yuzo;Hee hee hee...judgement by a mortal...surely you jest#-"$1"
SET "inter[TorchSwitch]=%col:c=99;59;31%▓%col:c=181;175;159%╩%up:n=1%%bk:n=1%│%dn:n=1%%col:c=99;59;31%▓$"SET torch[fact]=0" "SET lev[inter]=ConsortCamila TorchSwitch" "CALL :DIALOGUE -Yuzo;The light...no light....-"$3"
SET level="3.9.7.1.prism" "16.9.7.1.stone" "29.9.9.1.prism" "44.9.7.1.stone" "10.13.7.1.stone" "23.13.7.1.prism" "34.15.8.1.stone" "46.17.5.1.prism" "55.15.7.1.stone"$"57.14.TorchSwitch" "34.8.ConsortCamila"$"1.torch"$"76.9.YuzoOfTheDeadSun"$"enem[mx]=1" "enem[my]=1" "torch[fact]=1" "enem[state]=-1" "enem[spnum-1]=2" "enem[disp-1.1]=█%col:c=219;9;47%%bk:n=2%│%up:n=1%─%dn:n=1%│%dn:n=1%%bk:n=2%─" "enem[disp-1.2]=█"$Yuzo - the Sun Warrior, the Demigod, the Favoured. He who once sang the Song itself -#now it's greatest defiler. Yuzo of the Dead Sun - he who commanded a thousand legions,#he who wielded the God Slayer, he who brought light to those wanting - a shadow.#Death is his rightful fate.$%col:c=130;61;16%%ESC%[6;12H╣█╠%ESC%[6;26H╣█╠%ESC%[6;40H╣█╠%ESC%[5;13H╨%ESC%[5;27H╨%ESC%[5;41H╨%ESC%[10;75H╔═╣%up:n=1%%bk:n=1%║%up:n=1%%bk:n=1%║%ESC%[11;73H%col:c=232;206;100%╓█%col:c=230;168;0%█%col:c=232;206;100%─%col:c=227;149;66%█╥%col:c=232;206;100%█
SET enem[YuzoOfTheDeadSun]="█%bk:n=3%%col:c=245;124;24%╠╬%nx:n=1%╬╣%up:n=1%%bk:n=4%╔╬╗%up:n=1%%bk:n=2%╦%dn:n=3%%bk:n=2%╚╬╝%dn:n=1%%bk:n=2%╩" "█%bk:n=3%%col:c=245;124;24%╠╬%nx:n=1%╬╣%up:n=1%%bk:n=4%╝╬╚%up:n=1%%bk:n=2%╦%dn:n=3%%bk:n=2%╗╬╔%dn:n=1%%bk:n=2%╩" "█%bk:n=3%%col:c=245;124;24%╣╬%nx:n=1%╬╠%up:n=1%%bk:n=4%╔╬╗%up:n=1%%bk:n=2%╩%dn:n=3%%bk:n=2%╚╬╝%dn:n=1%%bk:n=2%╦"."█%bk:n=3%%col:c=245;255;64%╠╬%nx:n=1%╬╣%up:n=1%%bk:n=5%%col:c=219;43;15%~%col:c=245;255;64%╔╬╗%up:n=1%%bk:n=2%╦%nx:n=1%%col:c=219;43;15%~%dn:n=3%%bk:n=4%~%col:c=245;255;64%╬╝%dn:n=1%%bk:n=2%╩" "█%bk:n=3%%col:c=245;255;64%╠╬%nx:n=1%╬╣%up:n=1%%bk:n=4%╔╬╗%col:c=219;43;15%~%up:n=1%%bk:n=3%%col:c=245;255;64%╦%col:c=219;43;15%~%col:c=245;255;64%%dn:n=3%%bk:n=3%╚╬╝%dn:n=1%%bk:n=4%%col:c=219;43;15%~%nx:n=1%%col:c=245;255;64%╩" "█%bk:n=3%%col:c=245;255;64%╠╬%nx:n=1%╬%col:c=219;43;15%~%up:n=1%%bk:n=5%~%col:c=245;255;64%╔╬╗%up:n=1%%bk:n=2%╦%dn:n=3%%bk:n=2%╚╬╝%dn:n=1%%bk:n=2%╩%col:c=219;43;15%~"."█%bk:n=3%%col:c=247;234;42%╠╬%nx:n=1%╬╣%up:n=1%%bk:n=4%\╬/%up:n=1%%bk:n=2%╦%dn:n=3%%bk:n=2%/╬\%dn:n=1%%bk:n=2%╩" "█%bk:n=3%%col:c=247;234;42%╠Ä%nx:n=1%Ä╣%up:n=1%%bk:n=4%╔³╗%up:n=1%%bk:n=2%╦%dn:n=3%%bk:n=2%╚³╝%dn:n=1%%bk:n=2%╩"."█%col:c=237;179;19%%bk:n=2%╡%up:n=1%╫%dn:n=1%╞%dn:n=1%%bk:n=2%╫" "█%col:c=219;92;37%%bk:n=2%╪%up:n=1%║%dn:n=1%╪%dn:n=1%%bk:n=2%║"$17$4$x]+=0;x]-=1;y]-=1;x]+=1;x]+=1;y]-=1;y]-=1;x]-=1;x]-=1$"Yuzo;Hee hee...you pitiful fool..." "Yuzo;You truly believe the Prism so worthy#" "Yuzo;I was the true son of the stars, the God-King." "Yuzo;But you people turned against me." "Yuzo;You wanted anarchy. Chaos. One mind and one spirit." "Yuzo;Ha ha hee...and look at what you got."$VoidShards;%ESC%[17GThe pale light of a long dead star. Lowers Attunement.
SET behav[cur]=2^>NUL SET /A "^!every:#=5^!" ^&^& (%\n%
    IF ^^^!enem[state]^^^! EQU 1 (%\n%
        ^!enemytrack:#=x^!%\n%
        IF ^^^!enem[trx]^^^! EQU ^^^!enem[x]^^^! (%\n%
            %enemstateset:#=2% %\n%
        )%\n%
    ) else IF ^^^!enem[state]^^^! EQU 2 (%\n%
        IF ^^^!enem[y]^^^! GEQ 16 (%\n%
            %enemstateset:#=0% %\n%
        ) else (%\n%
            SET /A "enem[y]+=^!torch[fact]^!"%\n%
        )%\n%
    ) else IF ^^^!enem[state]^^^! EQU 3 (%\n%
        SET /A "enem[wait]+=1"%\n%
        IF ^^^!enem[wait]^^^! EQU 18 (%\n%
            %enemstateset:#=0%,"enem[wait]=0"%\n%
        ) else (%\n%
            ^!enemyfollow:#=x^!%\n%
            ^!enemyfollow:#=x^!%\n%
            ^!enemytrack:#=y^!%\n%
        )%\n%
    ) else (%\n%
        SET /A "enem[x]+=enem[mx]", "enem[y]+=enem[my]", "enem[wait]+=1","d[num]=^!RANDOM^!*2/32768+1"%\n%
        IF ^^^!enem[wait]^^^! EQU 40 (%\n%
            IF ^^^!d[num]^^^! EQU 1 (%\n%
                %enemstateset:#=1%,"enem[trx]=char[x]","enem[wait]=0"%\n%
            ) else (%\n%
                %enemstateset:#=3%,"enem[try]=char[y]","enem[wait]=0"%\n%
            )%\n%
        ) else (%\n%
            IF ^^^!enem[y]^^^! GEQ 16 (%\n%
                SET "enem[my]=-^!torch[fact]^!"%\n%
            ) else IF ^^^!enem[y]^^^! LEQ 3 (%\n%
                SET "enem[my]=^!torch[fact]^!"%\n%
            )%\n%
            IF ^^^!enem[x]^^^! GEQ 87 (%\n%
                SET "enem[mx]=-^!torch[fact]^!"%\n%
            ) else IF ^^^!enem[x]^^^! LEQ 3 (%\n%
                SET "enem[mx]=^!torch[fact]^!"%\n%
            )%\n%
        )%\n%
    )%\n%
    2^>NUL SET /A "^!every:#=500^!" ^&^& (%\n%
        IF ^^^!torch[fact]^^^! EQU 0 (%\n%
            SET "torch[fact]=1"%\n%
        ) else (%\n%
            IF not ^^^!torch[fact]^^^! EQU 3 (%\n%
                SET /A "torch[fact]+=1"%\n%
            )%\n%
        )%\n%
    )%\n%
)%\n%
2^>NUL SET /A "^!every:#=300^!" ^&^& (%\n%
    ^!colourchange:#=enem^! %\n%
)
GOTO :EOF

:SANCTUARY
SET level="3.9.11.1.colourglass" "17.13.9.1.colourglass" "29.17.8.1.stone" "41.17.8.1.flowers" "52.17.8.1.prism" "19.8.5.1.colourglass" "28.8.5.1.colourglass" "39.9.11.1.colourglass" "62.13.9.1.colourglass" "76.9.11.1.colourglass"$"42.8.ThePrism" "32.16.DragonDoor" "44.16.QueenDoor" "54.16.KingDoor"$"45 5.music"$"42.8.ThePrism"$"d[num]="$The Sanctuary - sacred temple of the Prism. The War is nearly over, and the Prism has#given you a special honour. Speak to it and fulfill your destiny.$%ESC%[2;12H%col:c=229;176;245%▄%dn:n=1%%bk:n=2%▐%col:c=217;136;242%█%col:c=229;176;245%▌%dn:n=1%%bk:n=3%%col:c=217;136;242%█%col:c=203;84;240%█%col:c=217;136;242%█%dn:n=1%%bk:n=3%%col:c=229;176;245%▐%col:c=217;136;242%█%col:c=229;176;245%▌%dn:n=1%%bk:n=2%▀%ESC%[2;28H▄%dn:n=1%%bk:n=2%▐%col:c=217;136;242%█%col:c=229;176;245%▌%dn:n=1%%bk:n=3%%col:c=217;136;242%█%col:c=203;84;240%█%col:c=217;136;242%█%dn:n=1%%bk:n=3%%col:c=229;176;245%▐%col:c=217;136;242%█%col:c=229;176;245%▌%dn:n=1%%bk:n=2%▀%ESC%[2;60H▄%dn:n=1%%bk:n=2%▐%col:c=217;136;242%█%col:c=229;176;245%▌%dn:n=1%%bk:n=3%%col:c=217;136;242%█%col:c=203;84;240%█%col:c=217;136;242%█%dn:n=1%%bk:n=3%%col:c=229;176;245%▐%col:c=217;136;242%█%col:c=229;176;245%▌%dn:n=1%%bk:n=2%▀%ESC%[2;76H%col:c=229;176;245%▄%dn:n=1%%bk:n=2%▐%col:c=217;136;242%█%col:c=229;176;245%▌%dn:n=1%%bk:n=3%%col:c=217;136;242%█%col:c=203;84;240%█%col:c=217;136;242%█%dn:n=1%%bk:n=3%%col:c=229;176;245%▐%col:c=217;136;242%█%col:c=229;176;245%▌%dn:n=1%%bk:n=2%▀%ESC%[8;44H%col:c=217;136;242%█%up:n=1%%bk:n=1%∩
IF "%char[done]:1=%" == "%char[done]%" (
    SET "inter[DragonDoor]=%col:c=91;219;81%▐%col:c=201;40;22%+%col:c=91;219;81%▌%up:n=1%%bk:n=3%%col:c=91;219;81%▐%col:c=79;156;73%█%col:c=91;219;81%▌$"CALL :END -%ESC%[19;5HPress (A^) to open the Dragon Door- 1"$3"
) else (
    SET "inter[DragonDoor]=%col:c=82;85;89%▐%col:c=145;139;138%█%col:c=82;85;89%▌%bk:n=2%%up:n=1%▄$"CALL :DIALOGUE -You;The Dragon is dead.-"$3"
)
IF "%char[done]:2=%" == "%char[done]%" (
    SET "inter[QueenDoor]=%col:c=40;117;44%█%col:c=121;65;148%Φ%col:c=40;117;44%█%col:c=90;130;28%%up:n=1%%bk:n=3%▐Ω▌$"CALL :END -%ESC%[19;5HPress (A^) to open the Queen Door- 2"$3"
) else (
    SET "inter[QueenDoor]=%col:c=82;85;89%▐%col:c=145;139;138%█%col:c=82;85;89%▌%bk:n=2%%up:n=1%φ$"CALL :DIALOGUE -You;The Queen is dead.-"$3"
)
IF "%char[done]:3=%" == "%char[done]%" (
    SET "inter[KingDoor]=%col:c=227;149;66%▐%col:c=230;168;0%╬%col:c=227;149;66%▌%col:c=230;168;0%%up:n=1%%bk:n=3%┌╫┐%col:c=250;239;85%%bk:n=2%%up:n=1%╥$"CALL :END -%ESC%[19;5HPress (A^) to open the King Door- 3"$3"
) else (
    SET "inter[KingDoor]=%col:c=82;85;89%▐%col:c=145;139;138%█%col:c=82;85;89%▌%bk:n=2%%up:n=1%╬$"CALL :DIALOGUE -You;The King is dead.-"$3"
)
SET "inter[ThePrism]= $"CALL :DIALOGUE -Prism;Thε Sσng wεαkεns frσm dεfτlεmεnt...- -Prism;Bεlσw stαnd thrεε δσσrs tσ fαllεn kτngdσms of σlδ...- -Prism;...ruτns σf blαsphεmy αnδ pεrvεrsτσn...- -Prism;Gσ...slαy thετr prτnces, thετr kτngs, thετr dεfτlεrs...- -Prism;Anδ thµs, thε Sσng mαy sτng σnce αgατn.-" "SET lev[inter]=ThePrism DragonDoor QueenDoor KingDoor"$5"
SET enem[ThePrism]="%col:c=191;107;250%█████%bk:n=4%%up:n=1%%col:c=107;107;250%███%bk:n=2%%up:n=1%%col:c=107;221;250%█" "%col:c=107;221;250%█████%bk:n=4%%up:n=1%%col:c=191;107;250%███%bk:n=2%%up:n=1%%col:c=107;107;250%█" "%col:c=107;107;250%█████%bk:n=4%%up:n=1%%col:c=107;221;250%███%bk:n=2%%up:n=1%%col:c=191;107;250%█"."█%up:n=1%%bk:n=3%%col:c=252;237;124%♦%nx:n=3%♦%dn:n=2%%bk:n=6%%col:c=191;107;250%█▐█╗█▌█%dn:n=1%%bk:n=5%%col:c=107;107;250%▐█▌%dn:n=1%%bk:n=3%%col:c=107;221;250%█%nx:n=1%█" "█%bk:n=4%%col:c=252;237;124%♦%nx:n=5%♦%dn:n=1%%bk:n=7%%col:c=107;107;250%█▐█╚█▌█%dn:n=1%%bk:n=5%%col:c=107;221;250%▐█▌%dn:n=1%%bk:n=4%%col:c=191;107;250%█%nx:n=3%█" "█%dn:n=1%%bk:n=5%%col:c=252;237;124%♦%col:c=107;221;250%█▐█╔█▌█%col:c=252;237;124%♦%dn:n=1%%bk:n=6%%col:c=191;107;250%▐█▌%dn:n=1%%bk:n=3%%col:c=107;107;250%█%nx:n=1%█" "█%dn:n=1%%bk:n=4%%col:c=191;107;250%█▐█═█▌█%dn:n=1%%bk:n=7%%col:c=252;237;124%♦%nx:n=1%%col:c=107;107;250%▐█▌%nx:n=1%%col:c=252;237;124%♦%dn:n=1%%bk:n=6%%col:c=107;221;250%█%nx:n=3%█"."█%dn:n=1%%bk:n=3%%col:c=107;107;250%▐█╠█▌%dn:n=1%%bk:n=4%%col:c=252;237;124%♦%col:c=107;221;250%█%col:c=252;237;124%♦%dn:n=1%%bk:n=3%%col:c=252;237;124%♦%col:c=191;107;250%█%col:c=252;237;124%♦" "█%bk:n=2%%col:c=252;237;124%♦%nx:n=1%♦%dn:n=1%%bk:n=5%%col:c=252;237;124%♦%col:c=107;221;250%▐█╣█▌%col:c=252;237;124%♦%dn:n=1%%bk:n=4%%col:c=107;107;250%█%dn:n=1%%bk:n=1%%col:c=107;221;250%█"."█%bk:n=3%%col:c=252;237;124%♦%nx:n=3%♦%dn:n=1%%bk:n=6%%col:c=252;237;124%♦%col:c=191;107;250%▐█═█▌%col:c=252;237;124%♦%dn:n=1%%bk:n=6%♦%col:c=107;107;250%▐█▌%col:c=252;237;124%♦%dn:n=1%%bk:n=4%%col:c=107;221;250%█%nx:n=1%█" "█%bk:n=3%%col:c=252;237;124%♦%nx:n=3%♦%dn:n=1%%bk:n=6%%col:c=252;237;124%♦%col:c=107;107;250%▐█║█▌%col:c=252;237;124%♦%dn:n=1%%bk:n=6%♦%col:c=107;221;250%▐█▌%col:c=252;237;124%♦%dn:n=1%%bk:n=4%%col:c=191;107;250%█%nx:n=1%█".%bk:n=1%."█%bk:n=3%%col:c=242;58;89%♥%nx:n=1%%col:c=191;107;250%█%nx:n=1%%col:c=242;58;89%♥%dn:n=1%%bk:n=5%%col:c=252;237;124%♦%col:c=107;107;250%█└█%col:c=252;237;124%♦%dn:n=1%%bk:n=5%%col:c=252;237;124%♦%col:c=107;221;250%▐▀▌%col:c=252;237;124%♦%dn:n=1%%bk:n=3%%col:c=191;107;250%█" "█%bk:n=3%%col:c=252;237;124%♦%nx:n=1%%col:c=107;107;250%█%nx:n=1%%col:c=252;237;124%♦%dn:n=1%%bk:n=5%%col:c=242;58;89%♥%col:c=107;221;250%█┬█%col:c=242;58;89%♥%dn:n=1%%bk:n=5%%col:c=252;237;124%♦%col:c=191;107;250%▐▀▌%col:c=252;237;124%♦%dn:n=1%%bk:n=3%%col:c=107;107;250%█" "█%bk:n=3%%col:c=252;237;124%♦%nx:n=1%%col:c=107;221;250%█%nx:n=1%%col:c=252;237;124%♦%dn:n=1%%bk:n=5%♦%col:c=191;107;250%█┘█%col:c=252;237;124%♦%dn:n=1%%bk:n=5%%col:c=242;58;89%♥%col:c=107;107;250%▐▀▌%col:c=242;58;89%♥%dn:n=1%%bk:n=3%%col:c=107;221;250%█"$30$5$y]+=60
SET behav[cur]=2^>NUL SET /A "^!every:#=6^!" ^&^& (%\n%
    IF ^^^!enem[state]^^^! EQU 2 (%\n%
        ^!enemytrack:#=x^! %\n%
        ^!enemytrack:#=y^! %\n%
        IF "^!enem[x]^!;^!enem[y]^!" == "^!enem[trx]^!;^!enem[try]^!" (%\n%
            SET /A "d[num]=^!RANDOM^!*2/32768+1"%\n%
            IF ^^^!d[num]^^^! EQU 1 (%\n%
                %enemstateset:#=4% %\n%
            ) else (%\n%
                IF ^^^!enem[hp]^^^! LEQ 10 (%\n%
                    %enemstateset:#=3% %\n%
                ) else (%\n%
                    %enemstateset:#=5% %\n%
                )%\n%
            )%\n%
        )%\n%
    ) else IF ^^^!enem[state]^^^! EQU 3 (%\n%
        SET /A "enem[wait]+=1"%\n%
        IF not ^^^!enem[y]^^^! GEQ 10 (%\n%
            SET /A "enem[y]+=1"%\n%
        )%\n%
        IF ^^^!enem[wait]^^^! EQU 10 (%\n%
            CALL :DIALOGUE "Prism;lτfε τtsεlf..." %\n%
            %enemstateset:#=1%, "enem[wait]=0", "enem[hp]+=3"%\n%
        )%\n%
    ) else IF ^^^!enem[state]^^^! EQU 4 (%\n%
        %enemstateset:#=1%, "enem[x]=^!RANDOM^!*(85-5+1)/32768+5","enem[y]=^!RANDOM^!*(15-5+1)/32768+5"%\n%
    ) else IF ^^^!enem[state]^^^! EQU 5 (%\n%
        SET /A "enem[wait]+=1"%\n%
        IF not ^^^!enem[y]^^^! LEQ 5 (%\n%
            SET /A "enem[y]-=1"%\n%
        )%\n%
        IF ^^^!enem[wait]^^^! EQU 35 (%\n%
            IF not ^^^!char[maxcol]^^^! EQU 1 (%\n%
                SET /A "char[col]=1", "char[maxcol]-=1"%\n%
                CALL :DIALOGUE "Prism;δεlτcτσus..." %\n%
                CALL :SETCOLRANGE ^^^!char[maxcol]^^^! char%\n%
            )%\n%
            %enemstateset:#=1%, "enem[wait]=0"%\n%
        )%\n%
    ) else (%\n%
        SET /A "enem[wait]+=1"%\n%
        IF ^^^!enem[wait]^^^! EQU 20 (%\n%
            %enemstateset:#=2%, "enem[wait]=0", "enem[trx]=char[x]","enem[try]=char[y]"%\n%
        )%\n%
    )%\n%
)%\n%
2^>NUL SET /A "^!every:#=180^!" ^&^& (%\n%
    ^!colourchange:#=enem^! %\n%
)
GOTO :EOF

:MACROS
FOR /F %%A in ('ECHO PROMPT $E^| CMD') DO SET "ESC=%%A"
SET ^"LF=^

^" Above empty line is required - do not remove
SET ^"\n=^^^%LF%%LF%^%LF%%LF%^^"
SET "every=1/(((~(0-(frames %% #))>>31)&1)&((~((frames %% #)-0)>>31)&1))"
SET framerate=FOR /L %%J in (1,#,1000000) DO REM
SET forperiod=FOR /F "tokens=1-# delims=."
SET col=%ESC%[38;2;cm
SET bcl=%ESC%[48;2;cm
SET up=%ESC%[nA
SET dn=%ESC%[nB
SET bk=%ESC%[nD
SET nx=%ESC%[nC
SET "enemstateset=SET /A "enem[state]=#","enem[curnum]=1""
SET "hpdisp=%col:c=207;25;40%╞%ESC%[s%ESC%[^!#[hp]^!C%col:c=145;185;207%@%ESC%[u%ESC%[^!#[basehp]^!C%nx:n=1%%col:c=3;252;127%╡"
SET colourchange=IF ^^!#[col]^^! EQU ^^!#[maxcol]^^! (%\n%
    SET "#[col]=1"%\n%
) else (%\n%
    SET /A "#[col]+=1"%\n%
)

SET enemytrack=IF ^^!enem[#]^^! GTR ^^!enem[tr#]^^! (%\n%
    SET /A "enem[#]-=1"%\n%
) else IF ^^!enem[#]^^! LSS ^^!enem[tr#]^^! (%\n%
    SET /A "enem[#]+=1"%\n%
)

SET enemyfollow=IF ^^!enem[#]^^! GTR ^^!char[#]^^! (%\n%
    SET /A "enem[#]-=1"%\n%
) else IF ^^!enem[#]^^! LSS ^^!char[#]^^! (%\n%
    SET /A "enem[#]+=1"%\n%
)

SET speak=IF not defined dia[pause] (%\n%
    IF ^^^!dia[speak]^^^! NEQ ^^^!dia[num]^^^! (%\n%
        SET /A "dia[speak]+=1"%\n%
        FOR %%Q in (^^^!dia[speak]^^^!) DO (%\n%
            FOR /F "tokens=1-2 delims=;" %%A in ("^!dia[%%Q]^!") DO (%\n%
                SET "d[dia]=%col:c=160;198;219%%ESC%[4m%%A%ESC%[24m : "%\n%
                ECHO %ESC%[19;5H%ESC%[2K%col:c=160;198;219%%ESC%[4m%%A%ESC%[24m : %ESC%[s%\n%
                FOR %%L in (%%B "%col:c=190;117;224%(A)") DO (%\n%
                    SET "d[tex]=%%~L"^&SET "d[dia]=^!d[dia]^!^!d[tex]:#=?^!"%\n%
                    ECHO %ESC%[u^^^!d[tex]:#=?^^^!%ESC%[s%\n%
                    %framerate:#=50% %\n%
                )%\n%
            )%\n%
            SET "dia[%%Q]="%\n%
        )%\n%
        SET "dia[pause]=1"%\n%
    ) else (%\n%
        SET "d[dia]="^&SET "dia[input]="^&SET "dia[pause]="%\n%
    )%\n%
)