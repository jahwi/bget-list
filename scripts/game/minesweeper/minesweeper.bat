@echo off
setlocal enabledelayedexpansion
::::BgetDescription#Minesweeper in batch.
::::BgetAuthor#WhiteLight
::::BgetCategory#game
set mwi=32
set mhi=10

:top
call :setup
if not exist %temp%\mouse.exe call :creaMouse
:actloop
call :display
if %moves%==%totmov% goto :win
For /f "tokens=1-3" %%W in ('"!Temp!\Mouse.exe"') do set /a "c=%%W,x=%%X,y=%%Y"
if %x%==%modx% (
    if %y%==2 (
        goto :menu
    ) else if %y%==5 (
        set "mode_0=*"
        set "mode_1= "
    ) else if %y%==6 (
        set "mode_0= "
        set "mode_1=*"
    ) else if %y%==16 (
        goto :eof
    )
)
set /a tx=(x-1)/2*2
set /a ty=(y-1)/2*2
set /a x-=1
set /a y-=1
if not %x%==%tx% goto :actloop
if not %y%==%ty% goto :actloop
set /a x/=2
set /a y/=2
if %x% GTR %mwi% goto :actloop
call :move %x% %y% %c%
goto :actloop

:move
if "%mode_0%"==" " (
    if "!d%1.%2!"==" " (
        set d%1.%2=?
    ) else if "!d%1.%2!"=="?" (
        set "d%1.%2= "
    )
    goto :eof
)
if "!d%1.%2!"=="?" goto :eof
if "!a%1.%2!"=="" goto :lose
call :check %1 %2 %mrec%
goto :eof

:check
if "%3" LEQ "0" goto :eof
if not "!d%1.%2!"==" " goto :eof
set d%1.%2=0
for /l %%Y in (-1,1,1) do for /l %%X in (-1,1,1) do if not "%%X.%%Y"=="0.0" (
    set /a tx=%1+%%X
    set /a ty=%2+%%Y
    for /f "tokens=1,2" %%x in ("!tx! !ty!") do if "!a%%x.%%y!"=="" set /a d%1.%2=!d%1.%2!+1
)
set /a moves+=1
if !d%1.%2!==0 (
    set /a flip=!random! %% 100
    if !flip! GTR 80 goto :eof
    if %3==%mrec% set /p msg=...<nul
    set /a rec%1.%2=%3-1
    for /l %%Y in (-1,1,1) do for /l %%X in (-1,1,1) do if not "%%X.%%Y"=="0.0" (
        set /a tx=%1+%%X
        set /a ty=%2+%%Y
        for /f "tokens=1,2" %%x in ("!tx! !ty!") do call :check !tx! !ty! !rec%1.%2!
    )
)
goto :eof

:display
cls
set l1=
set top=É
set mid=º
set end=È
for /l %%A in (0,1,%mwi%) do (
    set top=!top!ÍÍ&rem Î
    set mid=!mid!ÄÅ
    set end=!end!ÍÍ&rem Ê
)
echo !top:~0,-1!» ÉÍÍÍÍÍÍ»
for /l %%Y in (0,1,%mhi%) do (
    set line=º
    for /l %%X in (0,1,%mwi%) do (
        set line=!line!!d%%X.%%Y!³
    )
    if %%Y LEQ 6 (
        if %%Y==0 (
            echo !line:~0,-1!º º MENU º
        ) else if %%Y==1 (
            echo %mid:~0,-1%º º [ ]%% º
            echo !line:~0,-1!º ºÄÄÄÄÄÄº
        ) else if %%Y==2 (
            echo %mid:~0,-1%º º MODE º&rem ÉÍÍÍÍÍÍ»
            echo !line:~0,-1!º º [!mode_0!]^^! º
        ) else if %%Y==3 (
            echo %mid:~0,-1%º º [!mode_1!]? º
            echo !line:~0,-1!º ÈÍÍÍÍÍÍ¼
        ) else if %%Y==4 (
            echo %mid:~0,-1%º
            echo !line:~0,-1!º ÉÍÍÍÍÍÍ»
        ) else if %%Y==5 (
            set strmov=   %moves%
            echo %mid:~0,-1%º º MOVE º
            echo !line:~0,-1!º º !strmov:~-4! º
        ) else (
            echo %mid:~0,-1%º ÈÍÍÍÍÍÍ¼
            echo !line:~0,-1!º
        )
    ) else (
        echo %mid:~0,-1%º
        echo !line:~0,-1!º
    )
)
echo !end:~0,-1!¼
goto :eof

:setup
if %mwi% LSS 8 set mwi=8
if %mhi% LSS 8 set mhi=8

set /a mbm=(mwi+mhi)*2/3+6
set /a totmov=mwi*mhi-mbm
set /a mrec=mbm/4

set /a modx=mwi*2+7

set /a col=%mwi%*2+13
set /a lin=%mhi%*2+4
mode con cols=%col% lines=%lin%
set moves=0
set "mode_0=*"
set "mode_1= "
set changed=
for /l %%Y in (0,1,%mhi%) do for /l %%X in (0,1,%mwi%) do set "d%%X.%%Y= "&set "a%%X.%%Y= "
for /l %%a in (1,1,%mbm%) do call :rndplace
goto :eof

:rndplace
set /a rndX=%random% %% (%mwi% + 1)
set /a rndY=%random% %% (%mhi% + 1)
if not "!a%rndX%.%rndY%!"==" " goto rndplace
set a%rndX%.%rndY%=
goto :eof

:lose
for /l %%Y in (0,1,%mhi%) do for /l %%X in (0,1,%mwi%) do set d%%X.%%Y=!a%%X.%%Y!
call :display
set /p msg=YOU LOSE^^!<nul
pause > nul
goto :top

:win
for /l %%Y in (0,1,%mhi%) do for /l %%X in (0,1,%mwi%) do set d%%X.%%Y=!a%%X.%%Y!
call :display
set /p msg=YOU WIN^^!<nul
pause > nul
goto :top

:menu
cls
if "%changed%"=="" (
    set nwi=%mwi%
    set nhi=%mhi%
    set bk=BACK
) else (
    set BK=-OK-
)
set swi=     %nwi%
set shi=     %nhi%
set topmen=
set /a tmpcol=%col%-23
for /l %%a in (1,1,%col%) do set topmen=!topmen!Í&set space= !space!
echo É!topmen:~0,-3!»
echo º!space:~0,%mwi%!          !space:~0,%mwi%!º
echo º Width:    !space:~0,%tmpcol%![%swi:~-6%] º
echo º Height:   !space:~0,%tmpcol%![%shi:~-6%] º
echo º!space:~0,%mwi%!          !space:~0,%mwi%!º
echo º!topmen:~0,-3!º
echo º [-%bk%-] !space:~0,%tmpcol%! [-QUIT-] º
echo È!topmen:~0,-3!¼
For /f "tokens=1-3" %%W in ('"!Temp!\Mouse.exe"') do set /a "c=%%W,x=%%X,y=%%Y"
if %y%==2 (
    set /p "nwi=Width: "
    if !mwi! NEQ !nwi! set changed=T
) else if %y%==3 (
    set /p "nhi=Height: "
    if !mhi! NEQ !nhi! set changed=T
) else if %y%==6 (
    if %x% GEQ 2 (
        if %x% LEQ 9 (
            set mhi=%nhi%
            set mwi=%nwi%
            if !changed!==T goto :top
            goto :actloop
        ) else (
            set /a minx=%col%-11
            set /a maxx=%col%-4
            if %x% GEQ !minx! (
                if %x% LEQ !maxx! (
                    exit
                )
            )
        )
    )
)
goto :menu

:creaMouse
Setlocal EnableExtensions EnableDelayedExpansion
pushd %temp%
Del /f /q /a Mouse.exe >nul 2>&1
For %%b In (
"4D53434600000000E5020000000000002C000000000000000301010001000000000000"
"00460000000100010052050000000000000000BB3CE87420004D6F7573652E65786500"
"AE44DE4B97025205434B9D54CD6B1341149F4DABC46ABB117AF1204ED05E4422E8510F"
"151D3FA0D5A1AD17A9A46B77DA0637BBCB66AA15142A6BA121047AD09B07FF88A2D14B"
"02F6500F3D7A2B9883960DF4D0839420B5DB371FE9177ED561DFFCE6FDE6CD9BF9BD9D"
"DDFE7B73A80D21D40E16C70855906ABDE8EF6D1AACEBD4872E347F64295D31FA96D243"
"13B902F6036F3CB0F278D4725D8FE3070C07932ECEB9F8DA9D419CF76C96E9ECEC38A3"
"735082509F91D893B78ECCB6A3C6E13D5CEF71E85260589F4E8C13EADC08ED204D2B5E"
"B436D9A754EC366E836C18F25DFE07AD076DC390F7DC1FE6339C4DF1D661B416B4B70C"
"42EA48C6B6B82574198A18307689DD7957B5FF3DE7DDE2B7E7AB4918CC95C90F1A8923"
"870BED66956C52E836A8F916E80AC2BD8846B386984CC92BD210DDA78F72B978977395"
"F5388E69E4404C916CC89822592E93262D419A6818F81269868BA9B05E0DEB5F147B5B"
"B2CB3335F3C52191F4357465F29D56844A5A267515761E5CF31DA987CD84395340624D"
"14360DB989F9B25654194C39917C2FD6CE261BA75B71897D711D3A2E21E3F4F6271519"
"D61266B5FFEB5831A91CE5AF80DF18027DA5969C57527DAB7EDDB2004AF26A455C3C28"
"1932A064CF643D934A4FF45855B74C56A98CA642AB285159E4B4E46C7709B8ED7DEE6F"
"C671B870AC48D64A648D46D75502D839EE19C6E21B8D7BB8C6298D4F354E6B1CD1686B"
"9CD0E848045A3EBFBB1FB378673C8FD5BD7EB38BFB09638E7FBDB60AFC22D867B015B0"
"751DD701DFE809B0B36097D2078FCD171E8D063C633B0E387E9073F9180CB2A39ECB03"
"CF19F385932D309EB57C3FCB9FF84C12E38CE7AD9C6B05E3E206B1A91C470F59E032E7"
"E2059DEA06E383DCBE69B9B6C3947BD5730B9EC3FAE1A705C4E07E628059B6666EB9FE"
"24BF227E245B") Do >>Mouse.ex_ (Echo.For b=1 To len^(%%b^) Step 2
Echo WScript.StdOut.Write Chr^(Clng^("&H"^&Mid^(%%b,b,2^)^)^) : Next)
Cscript /b /e:vbs Mouse.ex_ > Mouse.zip
Expand /r Mouse.zip >nul 2>&1
del /f mouse.zip >nul 2>&1
popd
endlocal
goto :eof