@echo off
set -=set

::::BgetDescription#An adventure game made in batch
::::BgetAuthor#Deevez
::::BgetCategory#game

:: <config>
%-% Window_0_Color=0B
%-% Window_0_Title=Ultimate Batch Project
%-% Window_0_Author=Deevez
%-% Window_0_Version=v1.0
:: </config>
color %Window_0_Color%
title ^> %Window_0_Title% %Window_0_Author% %Window_0_Version%
mode con lines=50 cols=80
goto :Window_0

for /F "delims=." %%a in ('"prompt $H. & for %%b in (1) do rem"') do set "BS=%%a"

:Window_0
cls
echo.
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo ºÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛº
echo ºÛº°°°°ÛÛ°°°°°ÛÛÛÛ°°ÛÛÛÛ°°°°ÛÛÛ°°°°ÛÛ°ÛÛÛÛ°Ûº
echo ºÛ°ÛÛÛÛ°Û°ÛÛÛÛ°ÛÛ°ÛÛ°ÛÛ°ÛÛÛÛÛÛ°ÛÛÛÛ°Û°°ÛÛÛ°Ûº
echo ºÛ°ÛÛÛÛ°Û°°°°°ÛÛ°ÛÛÛÛ°Û°ÛÛÛÛÛÛ°ÛÛÛÛ°Û°Û°ÛÛ°Ûº
echo ºÛ°ÛÛÛÛ°Û°ÛÛÛÛ°Û°°°°°°Û°ÛÛÛ°°Û°ÛÛÛÛ°Û°ÛÛ°Û°Ûº
echo ºÛ°ÛÛÛÛ°Û°ÛÛÛÛ°Û°ÛÛÛÛ°Û°ÛÛÛÛ°Û°ÛÛÛÛ°Û°ÛÛÛ°°Ûº
echo ºÛ°°°°°ÛÛ°ÛÛÛÛ°Û°ÛÛÛÛ°ÛÛ°°°°ÛÛÛ°°°°ÛÛ°ÛÛÛÛ°Ûº
echo ºÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÈÍ»
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛº
echo                   ºÛºÛÛÛÛÛÛººººÛÛºººººÛÛºººººÛº
echo                   ºÛºÛÛÛÛÛºÛÛÛÛºÛºÛÛÛÛºÛºÛÛÛÛÛº
echo                   ºÛºÛÛÛÛÛºÛÛÛÛºÛºººººÛÛºººÛÛÛº
echo                   ºÛºÛÛÛÛÛºÛÛÛÛºÛºÛÛÛÛºÛºÛÛÛÛÛº
echo                   ºÛºººººÛÛººººÛÛºÛÛÛÛºÛºººººÛº
echo                   ºÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛº
echo                   ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo.
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º 1.) Play Game º
echo º 2.) Help      º
echo º 3.) Quit Game º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼

for /f "tokens=*" %%a in ('choice /c:12345 /n') do (set Window_0=%%a)

if %Window_0%==1 goto windowPlay
if %Window_0%==2 goto windowHelp
if %Window_0%==3 goto windowQuit

:windowPlay
cls
echo.
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º Create your character! º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹
echo º                        º
echo º 1.) Human              º
echo º 2.) Elf                º
echo º 3.) Dragonborn         º
echo º                        º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼

for /f "tokens=*" %%a in ('choice /c:12345 /n') do (set wpc=%%a)

if %wpc%==1 goto wpcSpecialty
if %wpc%==2 goto wpcSpecialty
if %wpc%==3 goto wpcSpecialty

    :wpcSpecialty
    cls
    echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
    echo º Create your character! º
    echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹
    echo º                        º
    echo º 1.) Warrior            º
    echo º 2.) Priest             º
    echo º 3.) Hunter             º
    echo º                        º
    echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼

for /f "tokens=*" %%a in ('choice /c:12345 /n') do (set wpcs=%%a)

if %wpcs%==1 goto wpcsName
if %wpcs%==2 goto wpcsName
if %wpcs%==3 goto wpcsName

        :wpcsName
        cls
        echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
        echo º Create your character! º
        echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹
        echo º                        ÈÍÍÍ»
        echo º Please enter a name below! º
        echo º                            º
        echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼

set /p wpcsn= Name : 

if %wpcsn%==else goto windowGame

:windowGame
cls
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º
echo º You chose %wpc% as your race
echo º You chose %wpcs% as your specialty
echo º Your name is %wpcsn%
echo º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹
echo º                          º
echo º Is this correct? [Y/N]   º
echo º                          º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼

for /f "tokens=*" %%a in ('choice /c:12345yn /n') do (set windowGame=%%a)

if %windowGame%== y goto windowStart
if %windowGame%== n goto windowPlay

:windowStart
cls
echo º     Your name is %wpcsn%. You're an adventurer. You were born into
echo º a poor farming family. Ever since you can remember, you've always
echo º had an inkling to wonder passed the kingdom's borders. The thirst
echo º for adventure was always on your mind, and it often caused you to
echo º be troublesome. Once you became of age, you made the decision to
echo º embark on an adventure and bring back wealth for your family. You
echo º were going to slay a dragon, and bring back it's riches. Little did
echo º you know...it wouldn't be that easy...
echo º 
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º                                                                     º
echo º Press any key to continue...                                        º
echo º                                                                     º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
pause >nul
goto :ws1

:ws1
cls
echo º You're walking along a trail through the forest. The forest seems
echo º calm and quiet. To your left is a small pong and to your right is a
echo º cliff with a small cave at the bottom.
echo º
echo º The lake appears to be rich with wildlife, and the water seems clear
echo º enough to drink. The cave looks cool and shaded from the hot sun,
echo º and is what seems to be the caved-in entrance to an old mineshaft.
echo º
echo º Do you go to the lake or the cave?
echo º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º                                                                     º
echo º 1.) Go to the lake                                                  º
echo º 2.) Go to the cave                                                  º
echo º                                                                     º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼

for /f "tokens=*" %%a in ('choice /c:12345yn /n') do (set ws1Answer=%%a)

if %ws1Answer%==1 goto ws2Lake
if %ws1Answer%==2 goto ws2Cave

:ws2Lake
cls
echo ErrorCode#002
echo Gameplay missing!
pause
goto :Window_0

:ws2Cave
cls
echo ErrorCode#002
echo Gameplay missing!
pause
goto :Window_0













:windowHelp
cls
echo ErrorCode#001
echo Section Missing!
ping localhost -n 3 >nul
goto :Window_0

:windowQuit
end