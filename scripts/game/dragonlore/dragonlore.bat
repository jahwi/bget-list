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
echo 浜様様様様様様様様様様様様様様様様様様様様様�
echo 裁栩栩栩栩栩栩栩栩栩栩栩栩栩栩栩栩栩栩栩栩栩�
echo 裁紺旭異朧旭旭栩栩旭栩栩旭旭栩朧旭異朧栩栩異�
echo 裁異栩朧朧栩栩異朧栩異朧栩栩栩異栩朧朧異栩異�
echo 裁異栩朧朧旭旭栩異栩朧朧栩栩栩異栩朧朧朧栩異�
echo 裁異栩朧朧栩栩異旭旭旭朧栩朧異異栩朧朧栩異異�
echo 裁異栩朧朧栩栩異異栩朧朧栩栩異異栩朧朧栩朧異�
echo 裁旭旭異朧栩栩異異栩朧栩旭旭栩朧旭異朧栩栩異�
echo 裁栩栩栩栩栩栩栩栩栩栩栩栩栩栩栩栩栩栩栩栩栩藩�
echo 藩様様様様様様様様斯栩栩栩栩栩栩栩栩栩栩栩栩栩�
echo                   裁裁栩栩杠査裁杠査査栩査査裁�
echo                   裁裁栩栩裁栩杠杠栩栩裁裁栩栩�
echo                   裁裁栩栩裁栩杠杠査査栩査裁栩�
echo                   裁裁栩栩裁栩杠杠栩栩裁裁栩栩�
echo                   裁査査裁杠査裁杠栩栩裁査査裁�
echo                   裁栩栩栩栩栩栩栩栩栩栩栩栩栩�
echo                   藩様様様様様様様様様様様様様�
echo.
echo 浜様様様様様様様�
echo � 1.) Play Game �
echo � 2.) Help      �
echo � 3.) Quit Game �
echo 藩様様様様様様様�

for /f "tokens=*" %%a in ('choice /c:12345 /n') do (set Window_0=%%a)

if %Window_0%==1 goto windowPlay
if %Window_0%==2 goto windowHelp
if %Window_0%==3 goto windowQuit

:windowPlay
cls
echo.
echo 浜様様様様様様様様様様様融
echo � Create your character! �
echo 藩様様様様様様様様様様様郵
echo �                        �
echo � 1.) Human              �
echo � 2.) Elf                �
echo � 3.) Dragonborn         �
echo �                        �
echo 藩様様様様様様様様様様様夕

for /f "tokens=*" %%a in ('choice /c:12345 /n') do (set wpc=%%a)

if %wpc%==1 goto wpcSpecialty
if %wpc%==2 goto wpcSpecialty
if %wpc%==3 goto wpcSpecialty

    :wpcSpecialty
    cls
    echo 浜様様様様様様様様様様様融
    echo � Create your character! �
    echo 藩様様様様様様様様様様様郵
    echo �                        �
    echo � 1.) Warrior            �
    echo � 2.) Priest             �
    echo � 3.) Hunter             �
    echo �                        �
    echo 藩様様様様様様様様様様様夕

for /f "tokens=*" %%a in ('choice /c:12345 /n') do (set wpcs=%%a)

if %wpcs%==1 goto wpcsName
if %wpcs%==2 goto wpcsName
if %wpcs%==3 goto wpcsName

        :wpcsName
        cls
        echo 浜様様様様様様様様様様様融
        echo � Create your character! �
        echo 藩様様様様様様様様様様様郵
        echo �                        藩様�
        echo � Please enter a name below! �
        echo �                            �
        echo 藩様様様様様様様様様様様様様夕

set /p wpcsn= Name : 

if %wpcsn%==else goto windowGame

:windowGame
cls
echo 浜様様様様様様様様様様様様融
echo �
echo � You chose %wpc% as your race
echo � You chose %wpcs% as your specialty
echo � Your name is %wpcsn%
echo �
echo 藩様様様様様様様様様様様様郵
echo �                          �
echo � Is this correct? [Y/N]   �
echo �                          �
echo 藩様様様様様様様様様様様様夕

for /f "tokens=*" %%a in ('choice /c:12345yn /n') do (set windowGame=%%a)

if %windowGame%== y goto windowStart
if %windowGame%== n goto windowPlay

:windowStart
cls
echo �     Your name is %wpcsn%. You're an adventurer. You were born into
echo � a poor farming family. Ever since you can remember, you've always
echo � had an inkling to wonder passed the kingdom's borders. The thirst
echo � for adventure was always on your mind, and it often caused you to
echo � be troublesome. Once you became of age, you made the decision to
echo � embark on an adventure and bring back wealth for your family. You
echo � were going to slay a dragon, and bring back it's riches. Little did
echo � you know...it wouldn't be that easy...
echo � 
echo 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
echo �                                                                     �
echo � Press any key to continue...                                        �
echo �                                                                     �
echo 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
pause >nul
goto :ws1

:ws1
cls
echo � You're walking along a trail through the forest. The forest seems
echo � calm and quiet. To your left is a small pong and to your right is a
echo � cliff with a small cave at the bottom.
echo �
echo � The lake appears to be rich with wildlife, and the water seems clear
echo � enough to drink. The cave looks cool and shaded from the hot sun,
echo � and is what seems to be the caved-in entrance to an old mineshaft.
echo �
echo � Do you go to the lake or the cave?
echo �
echo 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
echo �                                                                     �
echo � 1.) Go to the lake                                                  �
echo � 2.) Go to the cave                                                  �
echo �                                                                     �
echo 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�

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