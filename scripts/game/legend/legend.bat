::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::                                                ::READ ME::                                                     ::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
::This is the game Legend. Not everything is perfect, so if you find a bug, please tell me about it! 
::
::You may contact me via email, at rcaproductionmaster@gmail.com
::As the subject, ensure you have the word LEGEND.
::
::This Version Includes:
::-Character Name
::-Character Gender
::-Forest Fights
::-Arena Fights (Bosses, kill them to level up)
::-Random events in the forest
::-Several secrets (If you enter certain letters at menus, you may get some clues)
::-A new remade fight calculator
::-A new graphical technique, to show special characters (Lines, etc)
::-All options actually go places now in the town
::-The entire game is playable up to level 6
::
::To run the game:
::Download the attached Legend.txt file. Open it in notepad (Just double click it). Click File>Save As... then 
::pick a location. Change the "Save as Type" option from "Text Documents (*.txt)" to "All Files (*.*)". 
::Now, name the file "Legend.bat" (Don't use the quotes. If you don't name it correctly, the game won't work.). 
::Finally, just double click the file (It should look like a set of gears). The game will open! 
::
::To Play:
::Just read carefully, and press the corresponding keys to do things. If you have this menu:
::
::'E'nter building
::'M'ove along
::Your Choice? [E,M]
::
::Press e to enter the building, and press m to move on.
::
::If you are given menus where you are asked to enter a number value, the game will only accept numbers in the 
::format of 1 2 3 4 5 6 7 8 9 0. If you use text, the game will error and/or close.
::
::If you want to keep your progress, you must save before you exit. Otherwise, it will be reset to your last save.
::
::Enjoy!
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

::::BgetDescription#Legend game in in batch.
::::BgetAuthor#RCAProduction
::::BgetCategory#game


@ECHO OFF
ATTRIB +R Legend.bat
ATTRIB +H Legend.bat
ATTRIB +H settings.meow
title Legend
COLOR 0A

if exist Legend!.bat (ATTRIB -R Legend!.bat)
echo. Legend.bat>Legend!.bat
ATTRIB +R Legend!.bat

set name=Legend
set /a health=20
set /a defense=0
set /a level=0
set /a gold=0
set weapon=Stick
set /a kills=0
set armor=Shirt
set /a bank=0
set indeath=0
set /a kiss=0
set barg=false
set /a weplev=0

CLS
:beginning
choice /c EVLS /n /m "'E'nter the realm; 'L'eave;"
if %errorlevel% == 1 (goto entered)
if %errorlevel% == 2 (goto stats)
if %errorlevel% == 3 (exit)
if %errorlevel% == 4 (goto town)

:entered
color 0a
CLS
echo Which option appears more like a box?
echo.
echo "           A.)
echo "                _
echo "               !_!
echo "
echo "           B.)
echo "               зд©
echo "               Ё Ё
echo "               юды
echo.
choice /c AB /n /m ">"
if %errorlevel%==1 (goto plaintext)

set ur=Ё
set st=д
set lt=з
set lb=ю
set rt=©
set rb=ы
set mbr=ц
set mt=е
set mtb=б
set mb=а
set mbl=╢
set btt=р
set bbt=п
set tp=╨
set mtbt=в
set squiggle=Т
set lowshade=╟
set mshade=╠
set hshade=╡
set tc=м

goto intro
:plaintext
set ur=!
set st=-
set lt=!
set lb=!
set rt=!
set rb=!
set mbr=!
set mt=!
set mtb=!
set mb=!
set mbl=!
set btt=!
set bbt=!
set tp=!
set mtbt=!
set squiggle=$
set lowshade=#
set mshade=#
set hshade=#
set tc=-

:intro
CLS
echo "   
echo "   %lt%%st%%st%%st%%st%%st%%st%%st%%tc%%tc%%st%%st%%st%%st%%st%%st%%st%%st%%tc%%tc%%st%%st%%st%%st%%st%%st%%st%%st%%tc%%tc%%st%%st%%st%%st%%st%%st%%st%%st%%tc%%tc%%st%%st%%st%%st%%st%%st%%st%%st%%tc%%tc%%st%%st%%st%%st%%st%%st%%st%%st%%st%%tc%%tc%%st%%st%%st%%st%%st%%st%%rt%
echo "   %ur%       /\_\      /\ \      /\ \      /\ \      /\_\      /\ \     %ur% 
echo "   %ur%      /:/ /     /::\ \    /::\ \    /::\ \    /::|_|    /::\ \    %ur% 
echo "   %ur%     /:/ /     /:/\:\_\  /:/\:\_\  /:/\:\_\  /:|:/\_\  /:/\:\ \   %ur% 
echo "   %ur%    /:/ /     /::\_\/_/ /:/ /\/_/ /::\_\/_/ /:/|::/ / /:/ /|:| |  %ur% 
echo "   %ur%   /:/ /     /:/\/_/   /:/ /_    /:/\/_/   /:/ |:/ / /:/ / |:| |  %ur% 
echo "   %ur%   \:\ \     \:\ \     \:\/\_\   \:\ \     \/_/:/ /  \:\ \/:/ /   %ur% 
echo "   %ur%    \:\_\     \:\ \     \::/ /    \:\_\      /:/ /    \:\/:/ /    %ur% 
echo "   %ur%     \/_/      \/_/      \/_/      \/_/      \/_/      \__/_/     %ur% 
echo "   %lb%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%rb%
echo "    %squiggle%%lowshade%%lowshade%%lowshade%%lowshade%%lowshade%%lowshade%%lowshade%%lowshade%%lowshade%%lowshade%%lowshade%%lowshade%%lowshade%%lowshade%%lowshade%%lowshade%%lowshade%%lowshade%%lowshade%%lowshade%%lowshade%%lowshade%%lowshade%%lowshade%%lowshade%%lowshade%%lowshade%%lowshade%%lowshade%%lowshade%%lowshade%%lowshade%%lowshade%%lowshade%%lowshade%%lowshade%%lowshade%%lowshade%%lowshade%%lowshade%%lowshade%%lowshade%%lowshade%%lowshade%%lowshade%%lowshade%%lowshade%%lowshade%%lowshade%%lowshade%%lowshade%%lowshade%%lowshade%%lowshade%%lowshade%%lowshade%%lowshade%%lowshade%%lowshade%%lowshade%%lowshade%%lowshade%%lowshade%%squiggle%
echo "   %squiggle%%mshade%%mshade%%mshade%%mshade%%mshade%%mshade%%mshade%%mshade%%mshade%%mshade%%mshade%%mshade%%mshade%%mshade%%mshade%%mshade%%mshade%%mshade%%mshade%%mshade%%mshade%%mshade%%mshade%%mshade%%mshade%%mshade%%mshade%%mshade%%mshade%%mshade%%mshade%%mshade%%mshade%%mshade%%mshade%%mshade%%mshade%%mshade%%mshade%%mshade%%mshade%%mshade%%mshade%%mshade%%mshade%%mshade%%mshade%%mshade%%mshade%%mshade%%mshade%%mshade%%mshade%%mshade%%mshade%%mshade%%mshade%%mshade%%mshade%%mshade%%mshade%%mshade%%mshade%%mshade%%mshade%%squiggle%
echo "  %squiggle%%hshade%%hshade%%hshade%%hshade%%hshade%%hshade%%hshade%%hshade%%hshade%%hshade%%hshade%%hshade%%hshade%%hshade%%hshade%%hshade%%hshade%%hshade%%hshade%%hshade%%hshade%%hshade%%hshade%%hshade%%hshade%%hshade%%hshade%%hshade%%hshade%%hshade%%hshade%%hshade%%hshade%%hshade%%hshade%%hshade%%hshade%%hshade%%hshade%%hshade%%hshade%%hshade%%hshade%%hshade%%hshade%%hshade%%hshade%%hshade%%hshade%%hshade%%hshade%%hshade%%hshade%%hshade%%hshade%%hshade%%hshade%%hshade%%hshade%%hshade%%hshade%%hshade%%hshade%%hshade%%hshade%%hshade%%hshade%%squiggle%
echo "           __________    ________   __
echo "       |   | |    |  \  /     |  \ /  \  |\  |   
echo "       |   | |__  |   | \__   |   |    | | \ |   
echo "       |   | |    |__/     \  |   |    | |  \|  _|_|_
echo "       |   | |    |  \     |  |   |    | |   |  _|_|_
echo "        \_/  |___ |   |___/ _____  \__/ \|   |   | |   1.0
echo.
echo                                                                    (C)
echo.
echo.
choice /c ELM /n /m "'E'nter your name if you are new, or 'L'ogin."

if %errorlevel% == 2 (goto login)
if %errorlevel%==3 (goto meowliz)
color 0c
CLS
echo Entering a name or gender resets any other progress, with any other player.
echo Only continue if you want to play from the beginning!
echo.
echo What gender are you, and what's your name?
echo.
choice /c MFE /n /m "'M'ale, 'F'emale, 'E'xit"
if %errorlevel%==3 (goto entered)
if %errorlevel%==1 (
set gen=M
goto namee)
set gen=F

:namee
set /p user="Your name:"
ATTRIB -H settings.meow
CLS
choice /c YN /m "Save?"
if %errorlevel%==2 (goto entered)
(
echo %user% 
echo %gen%
echo %gold%
echo %health%
echo %weapon%
echo %level%
echo %kills%
echo %armor%
echo %defense%
echo %bank%
echo %kiss%
echo %weplev%
)>settings.meow
ATTRIB +H settings.meow
pause
CLS
color 0a
echo Welcome to Legend, %user%! Good luck on your quest for fame and fortune.
echo.
pause
goto town

:meowliz
set kjhjsdf=v
CLS
set /p kjhjsdf="So you think you're smart, eh?"
if %kjhjsdf%==Lindsey (goto meowlizz)
CLS
echo You have no idea who I am! Go away!
echo.
pause
goto entered

:meowlizz
CLS
echo You... You know me?
echo If you kiss me more than once, I'll give you 50 health...
echo Don't forget...
echo.
pause
CLS
echo You have three choices. Pick wisely.
echo.
echo 'G'o on to game
echo 'B'e in love
echo 'C'heers and broccoli
choice /c GBC /n /m ">"
if %errorlevel%==3 (goto entered)
set /a indeath=1
goto entered

:login
(
set /p user=
set /p gen=
set /p gold=
set /p health=
set /p weapon=
set /p level=
set /p kills=
set /p armor=
set /p defense=
set /p bank=
set /p kiss=
set /p weplev=
)<settings.meow
set /a math=%bank%*1000
set /a math=%math%/30
set /a math=%math%/1000
set /a bank=%bank%+%math%
CLS
::rcaproductionmaster@gmail.com
echo Welcome, %user%
echo.
echo Gender  : %gen%
echo Health  : %health%
echo Weapon  : %weapon%
echo Kills   : %kills%
echo Armor   : %armor%
echo Defense : %defense%
echo Gold    : %gold%
echo Bank    : %bank%
echo.
echo Level   : %level%
echo.
pause

:town
color 0a
set /a math=%level%*10+20
if %health% GTR %math% (set /a health=%math%)
CLS
echo You walk into the small town square. You are surrounded by fantastic smells, 
echo colors, and goods. Many people go about their business, as you look at the
echo signs. You decide where to go next.
echo.
echo 'G'o to forest
echo 'T'horin's Armory
echo 'H'edge's Weapon Shoppe
echo 'I'nn
echo 'B'ank
echo 'V'iew stats
echo 'S'ave
echo 'E'xit
choice /c GTHIBVSE /m "Your choice?"

if %errorlevel%==1 (goto forest)
if %errorlevel%==2 (goto thorins)
if %errorlevel%==3 (goto hedges)
if %errorlevel%==4 (goto inn)
if %errorlevel%==5 (goto bank)
if %errorlevel%==6 (goto pstat)
if %errorlevel%==7 (goto save)
if %errorlevel%==8 (goto exit)

pause
exit

:save
ATTRIB -H settings.meow
CLS
choice /c YN /m "Save?"
if %errorlevel%==2 (goto town)
(
echo %user% 
echo %gen%
echo %gold%
echo %health%
echo %weapon%
echo %level%
echo %kills%
echo %armor%
echo %defense%
echo %bank%
echo %kiss%
echo %weplev%
)>settings.meow
ATTRIB +H settings.meow
echo Saved.
pause
goto town

:exit
CLS
color 0c
echo "               %lt%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%rt%
echo "               %ur%   ______         _______ _______  %ur%
echo "               %ur%  |       \     /    |       |     %ur%
echo "               %ur%  |        \   /     |       |     %ur%
echo "               %ur%  |____     \ /      |       |     %ur%
echo "               %ur%  |          X       |       |     %ur%
echo "               %ur%  |         / \      |       |     %ur%
echo "               %ur%  |        /   \     |       |     %ur%
echo "               %ur%  |______ /     \ ___|___    |     %ur%
echo "               %ur%                                   %ur%
echo "               %lb%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%rb%
echo.
choice /c YN /m "Are you sure you want to exit?"
if %errorlevel%==1 (
ATTRIB -H settings.meow
CLS
choice /c YN /m "Save?"
if %errorlevel%==2 (goto town)
(
echo %user% 
echo %gen%
echo %gold%
echo %health%
echo %weapon%
echo %level%
echo %kills%
echo %armor%
echo %defense%
echo %bank%
echo %kiss%
echo %weplev%
)>settings.meow
ATTRIB +H settings.meow
exit)
if %errorlevel%==2 (goto town)


:stats
(
set /p user=
set /p gold=
set /p health=
set /p weapon=
set /p level=
set /p kills=
set /p armor=
set /p defense=
)<settings.meow
CLS
echo Here are the game stats.
echo.
echo Player: %user%     Level: %level%      Kills: %kills%
pause
goto beginning

::::::::PLACES::::::::
:forest
CLS
echo You enter the forest outside of the town. The townspeople talk of this forest 
echo only in hushed whispers... It is dangerous here, be careful.
echo.
echo 'L'ook around
echo 'G'o to arena
echo 'R'eturn to town.
echo 'V'iew stats
echo 'H'ealers Den
choice /c LGRVH /m "Your choice?"
if %errorlevel%==2 (goto arena)
if %errorlevel%==3 (goto town)
if %errorlevel%==4 (goto pstat)
if %errorlevel%==5 (goto healer)
CLS
set firstfight=true
set /a elevel=%level%*5+6
set /a enemy=%random% * %elevel% / 32768 +1
if %enemy%==1 (goto rat)
if %enemy%==2 (goto fatkid)
if %enemy%==3 (goto oldman)
if %enemy%==4 (goto hark)
if %enemy%==5 (goto hcat)
if %enemy%==6 (goto fairy)
if %enemy%==7 (goto event)
if %enemy%==8 (goto pig)
if %enemy%==9 (goto sbear)
if %enemy%==10 (goto evilk)
if %enemy%==11 (goto hark)
if %enemy%==12 (goto evilk)
if %enemy%==13 (goto sentienttree)
if %enemy%==14 (goto smellycouch)
if %enemy%==15 (goto crazyman)
if %enemy%==16 (goto polititian)
if %enemy%==17 (goto knight)
if %enemy%==18 (goto dwarf)
if %enemy%==19 (goto drunkensoldier)
if %enemy%==20 (goto witch)
if %enemy%==21 (goto snake)
if %enemy%==22 (goto zork)
if %enemy%==23 (goto teddyroosevelt)
if %enemy%==24 (goto wakingup)
if %enemy%==25 (goto pillowcase)
if %enemy%==26 (goto kingarthur)
if %enemy%==27 (goto bucketofwater)
if %enemy%==28 (goto internetexplorer)
if %enemy%==29 (goto wizard)
if %enemy%==30 (goto darkwizardoftheeast)
if %enemy%==31 (goto elf)
if %enemy%==32 (goto rokoroztheterrible)
if %enemy%==33 (goto buffgerman)
if %enemy%==34 (goto nobleofdragostea)
if %enemy%==35 (goto dragon)
goto rat

:hedges
color 0e
CLS
echo "Welcome to my wonderous shoppe of death!"
echo a portly man exclaimed, as you entered. 
echo.
echo 'B'uy weapon
echo 'S'ell weapon
echo 'L'eave
choice /c BSL /m "What can I do for you today?"
if %errorlevel%==1 (goto bweapon)
if %errorlevel%==2 (goto sweapon)
goto town

:sweapon
CLS
if %weapon%==none (
echo You don't have anything to sell.
pause
goto hedges
)
if %weapon%==Stick (set sell=100)
if %weapon%==LargeStick (set sell=2500)
if %weapon%==Dagger (set sell=5000)
if %weapon%==Sword (set sell=25000)
if %weapon%==LongSword (set sell=50000)
if %weapon%==Axe (set sell=57000)
if %weapon%==BattleAxe (set sell=100000)
if %weapon%==none (set sell=0)
choice /c YN /m "I will buy %weapon% for %sell% gold. Ok?"
if %errorlevel%==1 (
set weapon=none
set /a gold=%gold%+%sell%
goto hedges
)
goto hedges

:bweapon
CLS
echo You see a wall covered in various weapons, each with a price tag.
echo %lt%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%mtb%%st%%st%%st%%st%%st%%st%%st%%st%%rt%
echo %ur%    WEAPON             %ur% PRICE  %ur%
echo %mbr%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%mt%%st%%st%%st%%st%%st%%st%%st%%st%%mbl%
echo %ur%1.) Large Stick        %ur% 5000   %ur%
echo %ur%2.) Dagger             %ur% 10000  %ur%
echo %ur%3.) Sword              %ur% 50000  %ur%
echo %ur%4.) Long Sword         %ur% 100000 %ur%
echo %ur%5.) Axe                %ur% 125000 %ur%
echo %ur%6.) Battle Axe         %ur% 200000 %ur%
echo %lb%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%mb%%st%%st%%st%%st%%st%%st%%st%%st%%rb%
echo.
echo You currently have %weapon%.
echo.
if %weapon%==none (goto buy)
echo You already have a weapon, you can't carry two!
pause
goto hedges
:buy
echo You have %gold% gold.
echo.
set /p buy="Which would you like to buy?"
if %buy%==1 (
set /a price=5000
set bweapon=LargeStick
set blevel=1
)
if %buy%==2 (
set /a price=10000
set bweapon=Dagger
set blevel=2
)
if %buy%==3 (
set /a price=50000
set bweapon=Sword
set blevel=3
)
if %buy%==4 (
set /a price=100000
set bweapon=LongSword
set blevel=5
)
if %buy%==5 (
set /a price=125000
set bweapon=Axe
set blevel=6
)
if %buy%==6 (
set /a price=200000
set bweapon=BattleAxe
set blevel=7
)
if %buy%==0 (goto hedges)
if %gold% LSS %price% (
echo Not enough gold!
echo.
pause
goto hedges
)
set /a weplev=%blevel%
set /a gold=%gold%-%price%
set weapon=%bweapon%
goto hedges

:thorins
color 0b
CLS
echo A burly man and a young woman greet you at the door.
echo The woman asks how she can help you.
echo.
echo 'B'uy armor
echo 'S'ell armor
echo 'L'eave
choice /c BSL /m "Your choice?"
if %errorlevel%==1 (goto barmor)
if %errorlevel%==2 (goto sarmor)
goto town

:sarmor
CLS
if %armor%==none (
echo You don't have any armor!
pause
goto thorins
)
if %armor%==Shirt (set sell=50)
if %armor%==LightJacket (set sell=100)
if %armor%==LeatherJacket (set sell=1500)
if %armor%==ChainMesh (set sell=4500)
if %armor%==IronArmor (set sell=15000)
if %armor%==SteelArmor (set sell=50000)
if %armor%==KnightsArmor (set sell=250000)

choice /c YN /m "I will buy your %armor% for %sell% gold. Ok?"
if %errorlevel%==1 (
set armor=none
set /a gold=%gold%+%sell%
goto thorins
)
goto thorins

:barmor
CLS
echo The store is filled with amazing armor. Each has a large sign with the price.
echo %lt%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%mtb%%st%%st%%st%%st%%st%%st%%st%%st%%rt%
echo %ur%    ARMOR              %ur% PRICE  %ur%
echo %mbr%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%mt%%st%%st%%st%%st%%st%%st%%st%%st%%mbl%
echo %ur%1.) Light Jacket       %ur% 300    %ur%
echo %ur%2.) Leather Jacket     %ur% 2500   %ur%
echo %ur%3.) Chain Mesh         %ur% 10000  %ur%
echo %ur%4.) Iron Armor         %ur% 30000  %ur%
echo %ur%5.) Steel Armor        %ur% 100000 %ur%
echo %ur%6.) Knight's Armor     %ur% 500000 %ur%
echo %lb%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%mb%%st%%st%%st%%st%%st%%st%%st%%st%%rb%
echo.
echo You currently have %armor%.
echo.
if %armor%==none (goto abuy)
echo "You already have armor, silly!" the woman exclaims, amused.
pause
goto thorins
:abuy
echo You have %gold% gold.
echo.
set /p buy="Which would you like to buy?"
if %buy%==1 (
set /a price=300
set barmor=LightJacket
set bdefense=3
)
if %buy%==2 (
set /a price=2500
set barmor=LeatherJacket
set bdefense=7
)
if %buy%==3 (
set /a price=10000
set barmor=ChainMesh
set bdefense=15
)
if %buy%==4 (
set /a price=30000
set barmor=IronArmor
set bdefense=30
)
if %buy%==5 (
set /a price=100000
set barmor=SteelArmor
set bdefense=60
)
if %buy%==6 (
set /a price=500000
set barmor=KnightsArmor
set bdefense=150
)
if %buy%==0 (goto thorins)
if %gold% LSS %price% (
echo Not enough gold!
echo.
pause
goto thorins
)
set /a gold=%gold%-%price%
set armor=%barmor%
set defense=%bdefense%
goto thorins

:bank
color 09
CLS
echo A beautiful woman is standing behind the counter. 
echo "How may I help you?" she asks.
echo.
echo A sign states that gold in the bank increases in
echo value every day. Might be worth it...
echo.
echo 'D'eposit gold
echo 'W'ithdraw gold
echo 'V'iew gold in account
echo 'L'eave
echo.
choice /c DWVL /m "Which will you do?"
if %errorlevel%==1 (goto deposit)
if %errorlevel%==2 (goto withdraw)
if %errorlevel%==3 (goto viewgold)
goto town

:viewgold
CLS
echo You have %bank% gold in the bank. You have %gold% gold in hand.
echo.
pause
goto bank
::rcaproductionmaster@gmail.com
:deposit
CLS
echo "How much would you like to deposit?" she asks.
echo.
echo There is %bank% gold in the bank, and you have %gold% in hand.
echo.
set /p deposit=">"
if %deposit%==1 (
set /a bank=%bank%+%gold%
set /a gold=0
CLS
echo She gladly places all of your gold in the vault, and smiles.
echo.
pause
goto bank
)
if %gold% LSS %deposit% (
color 0c
CLS
echo "You don't have that much gold! Get out!!"
echo.
pause
goto town
)
set /a gold=%gold%-%deposit%
set /a bank=%bank%+%deposit%
CLS
echo She smiles, and puts your gold in the vault.
echo.
pause
goto bank

:withdraw
CLS
echo "How much would you like to withdraw?" she asks kindly.
echo.
echo There is %bank% gold in the bank, and you have %gold% in hand.
echo.
set /p withdraw=">"
if %withdraw%==1 (
set /a gold=%gold%+%bank%
set /a bank=0
CLS
echo She opens the vault, and gives you all of your gold...
echo.
pause
goto bank
)
if %bank% LSS %withdraw% (
color 0c
CLS
echo "You don't have that much gold! Get out!!"
echo.
pause
goto town
)
set /a bank=%bank%-%withdraw%
set /a gold=%gold%+%withdraw%
CLS
echo She opens the vault, and gives you your gold.
echo.
pause
goto bank

:inn
color 84
CLS
echo A slender young man meets you at the door, and welcomes you!
echo.
echo The room is dark, lit by oil lamps. Many people sit at tables
echo around the room, talking, eating, and drinking. The bar has a
echo few open seats. In the corner, a lyre is being played.
echo.
echo 'B'ar
echo 'G'et a room
echo 'T'alk with other patrons
echo 'S'tand in the corner
echo 'L'eave
echo.
choice /c BGTSL /m "Where are you going?"
if %errorlevel%==1 (goto ib)
if %errorlevel%==2 (goto ir)
if %errorlevel%==3 (goto it)
if %errorlevel%==4 (goto is)
goto town
:ib
if %barg%==true (
CLS
echo You've already been to the bar today.
echo.
pause
goto inn)
CLS
echo The bartender slides over to you. 
echo.
echo "What's yer poison today?" he asks in a gruff voice.
echo.
echo 'R'um
echo 'W'ine
echo 'A'le
echo 'J'ust here for water
echo 'G'et away from the bar
echo.
choice /c RWAJG /n /m "Well?"
if %errorlevel%==1 (goto rum)
if %errorlevel%==2 (goto wine)
if %errorlevel%==3 (goto ale)
if %errorlevel%==4 (goto water)
if %errorlevel%==5 (goto town)
:rum
if %health%<=0 (goto lose)
set /a gold=%gold%-10
set /a health=%health%-1
CLS
echo You owe the bartender 10 gold.
echo.
echo He hands you your rum, and you drink it heartily.
echo.
echo You lose 1 health, but it's worth it.
echo.
echo You get wasted, and pass out...
echo.
pause
CLS
ATTRIB -H settings.meow
if %errorlevel%==2 (goto town)
(
echo %user% 
echo %gen%
echo %gold%
echo %health%
echo %weapon%
echo %level%
echo %kills%
echo %armor%
echo %defense%
echo %bank%
echo %kiss%
echo %weplev%
)>settings.meow
ATTRIB +H settings.meow
echo Don't worry, your game is saved.
echo.
pause
exit
:wine
set /a gold=%gold%-100
set /a health=%health%+5
CLS
echo You owe the bartender 100 gold.
echo.
echo He gives you a large goblet of wine, and half a
echo loaf of bread. You are refreshed.
echo.
pause
CLS
set barg=true
echo You sit at the bar for a while, then leave.
echo.
pause
goto inn
:ale
CLS
echo You owe the bartender 50 gold.
echo.
echo You feel a bit weak, and lose a health.
echo.
pause
set /a health=%health%-1
if %health% LEQ 0 (goto lose)
set barg=true
goto inn
:water
CLS
echo The bartender asks for only 1 gold.
echo.
echo You feel more at home.
echo.
pause
goto inn

:ir
CLS
echo You go to the innkeeper, and ask for a room.
echo.
echo "A room'll cost ya 250 gold."
echo.
echo 'B'uy a room, and go to sleep
echo 'L'eave
echo.
choice /c BL /n /m ">"
if %errorlevel%==1 (goto buyroom)
if %errorlevel%==2 (goto inn)
:buyroom
if %gold% LSS 250 (
echo You do not have enough gold
pause
goto inn)
set /a gold=%gold%-250
set /a health=%health%+30
pause
echo You drift to sleep...
echo.
echo Your progress is saved, and you become refreshed.
echo.
ATTRIB -H settings.meow
(
echo %user% 
echo %gen%
echo %gold%
echo %health%
echo %weapon%
echo %level%
echo %kills%
echo %armor%
echo %defense%
echo %bank%
echo %kiss%
echo %weplev%
)>settings.meow
ATTRIB +H settings.meow
CLS
goto inn


:it
CLS
echo 'B'art the Barbarian
echo 'R'onald the Crazy
echo 'O'ld Man
echo 'G'amblers
echo 'L'eave
choice /c BROGL /n /m "Who do you want to talk with?"
CLS
if %errorlevel%==1 (
echo You walk up to Bart, and say hello. He responds gruffly,
echo.
echo "Whuts yur bizness here?"
echo.
echo "Well, I just wanted to talk..."
echo.
echo "Not hear to kill meh?"
echo.
echo "No..."
echo.
echo "Well, in dat case, I have a tid ov abvise fur ya. If ya
echo relly want tu find yur fame, slay da dra...g...nnnnnnmmf"
echo he responded, and then passed out from his rum.
echo.
pause
goto inn
)
if %errorlevel%==2 (
echo You wearily approach the nutjob. He sees you before you have a chance to 
echo say hello.
echo.
echo "AYYYYY! YOU THERE!!!" he yelled.
echo "AYEEEEEE SEE YOU!"
echo.
echo "Uh... Hello?"
echo.
echo "HAHAHAHA!"
echo.
echo "..."
echo.
echo "Better leave the fairies ALONE! HAHAHA!!"
echo.
echo With that, you decided to leave.
echo.
pause
goto inn
)
if %errorlevel%==3 (
echo You say hello to the old man.
echo.
echo "Ohhhh... Hello there little child..." he mumbled.
echo "Heeeeere, have a peanut... If you find one, you'll be rich..."
echo.
echo A little creeped out, you leave.
echo.
pause
goto inn
)
if %errorlevel%==4 (
echo The gamblers are uninterested, for you aren't famous enough.
echo.
pause
goto inn
)
goto inn

:is

CLS
echo You stand in the corner, and watch.
echo.
echo A few men at a small round table are gambling, an
echo old woman sits in the opposite corner, and several
echo people sit at the bar. 
echo.
pause
CLS
if %gen%==M (goto mi)
echo Behind the gamblers, you see a young attractive man.
echo.
echo 'T'alk to him
echo 'F'orget it
choice /c TF /n /m "What are you going to do?"
if %errorlevel%==1 (goto ftalk)
goto inn
:ftalk
CLS
echo You walk up to him, and he smiles.
echo.
echo 'T'alk
echo 'F'lirt
echo 'W'alk away
choice /c TFW /n /m "He gazes expectingly..."
if %errorlevel%==1 (goto ftalkk)
if %errorlevel%==2 (goto laid)
goto inn
:ftalkk
set /a health=%health%+1
CLS
echo You talk for a while, and get a kiss. Your relationship 
echo is taking off!
echo.
pause
goto inn

:mi
echo Behind the gamblers, you see an attractive young woman.
echo.
echo 'T'alk to her
echo 'F'orget it
choice /c TF /n /m "What are you going to do?"
if %errorlevel%==1 (goto mtalk)
goto inn
:mtalk
CLS
echo You walk up to her, and she smiles.
echo.
echo 'T'alk
echo 'F'lirt
echo 'W'alk away
choice /c TFW /n /m "She gazes expectingly..."
if %errorlevel%==1 (goto mtalkk)
if %errorlevel%==2 (goto laid)
goto inn
:mtalkk
set /a health=%health%+1
CLS
echo You talk for a while, and get a kiss. Your relationship 
echo is taking off!
echo.
pause
goto inn


:laid
color 0d
set /a health=%health%+10
CLS
echo The two of you flirt for a while, then sneak off to a room...
echo.
pause
CLS
echo You just got laid! Congrats!
echo.
echo You feel great.
echo.
pause
goto inn

:arena
CLS
echo A small sign states that if you win a battle, your
echo level increases.
echo.
echo 'F'ight
echo 'R'eturn to forest
choice /c FR /m "Beware."
if %errorlevel%==2 (goto forest)
CLS
set firstfight=true

if %level%==0 (goto level0)
if %level%==1 (goto level1)
if %level%==2 (goto level2)
if %level%==3 (goto level3)
if %level%==4 (goto level4)
if %level%==5 (goto level5)
if %level%==6 (goto level6)
if %level%==7 (goto level7)

:level0
set enemy=Zoigberg
set ehealth=40
set /a tough=22
set /a eattack=15-%defense%
set /a elow=5
set ewep=his Claws
set bonus=10000
goto afight

:level1
set enemy=Mr. Gordon
set ehealth=72
set /a tough=26
set /a eattack=30-%defense%
set /a elow=10
set ewep=his Gun
set bonus=15000
goto afight

:level2
set enemy=Richard Nixon
set ehealth=150
set /a tough=40+(5*%level%)
set /a eattack=60-%defense%
set /a elow=10
set ewep=Scandals
set bonus=30000
goto afight

:level3
set enemy=Cyclops
set ehealth=250
set /a tough=50+(5*%level%)
set /a eattack=150-%defense%
set /a elow=13
set ewep=Big Bat
set bonus=100000
goto afight

:level4
set enemy=Rogneck The Terrible
set ehealth=325
set /a tough=50+(5*%level%)
set /a eattack=150-%defense%
set /a elow=25
set ewep=his Massive Sword
set bonus=105000
goto afight

:level5
set enemy=Bongledor
set ehealth=420
set /a tough=50+(5*%level%)
set /a eattack=167-%defense%
set /a elow=30
set ewep=his Giant Bong
set bonus=150000
goto afight

:level6
set enemy=Hitler
set ehealth=550
set /a tough=50+(5*%level%)
set /a eattack=180-%defense%
set /a elow=15
set ewep=Gas
set bonus=205000
goto afight

:level7
set enemy=Eskibar
set ehealth=1000
set /a tough=50+(5*%level%)
set /a eattack=200-%defense%
set /a elow=50
set ewep=his Giant Mandables
set bonus=300000
goto afight

:afight
CLS
echo Computing...

set myString=%health%
call :strlen hexsub myString
set /a jhgfjhsa=%hexsub%
set /a jhgfjhsa=13-%jhgfjhsa%
call :extrachar extrahe jhgfjhsa

set myString=%ehealth%
call :strlen hexsub myString
set /a jhgfjhsa=%hexsub%
set /a jhgfjhsa=13-%jhgfjhsa%
call :extrachar extrahe1 jhgfjhsa

set myString=%enemy%A
call :strlen hexsub myString
set /a jhgfjhsa=%hexsub%
set /a jhgfjhsa=21-%jhgfjhsa%
call :extrachar extrahe2 jhgfjhsa

set myString=%defense%
call :strlen hexsub myString
set /a jhgfjhsa=%hexsub%
set /a jhgfjhsa=13-%jhgfjhsa%
call :extrachar extrahe3 jhgfjhsa

set myString=%tough%
call :strlen hexsub myString
set /a jhgfjhsa=%hexsub%
set /a jhgfjhsa=13-%jhgfjhsa%
call :extrachar extrahe4 jhgfjhsa

set myString=%weapon%
call :strlen hexsub myString
set /a jhgfjhsa=%hexsub%
set /a jhgfjhsa=13-%jhgfjhsa%
call :extrachar extrahe5 jhgfjhsa

set myString=%bonus%
call :strlen hexsub myString
set /a jhgfjhsa=%hexsub%
set /a jhgfjhsa=13-%jhgfjhsa%
call :extrachar extrahe6 jhgfjhsa

CLS
if %indeath%==1 (goto lose)
if %firstfight%==false (goto lkhff)
set firstfight=false
echo You see %enemy% lurking in the corner of the arena...
echo.
:lkhff
echo %lt%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%btt%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%rt%
echo %ur%You:                %tp%%enemy%:%extrahe2%%ur%
echo %mbr%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%в%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%mbl%
echo %ur%Health :%health%%extrahe%%tp%Health :%ehealth%%extrahe1%%ur%
echo %ur%Defense:%defense%%extrahe3%%tp%Tough  :%tough%%extrahe4%%ur%
echo %ur%Weapon :%weapon%%extrahe5%%tp%Bonus  :%bonus%%extrahe6%%ur%
echo %ur%                    %tp%                    %ur%
echo %lb%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%п%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%rb%
echo.
echo 'A'ttack
echo 'R'un
choice /c AR /m "Your choice?"
if %errorlevel%==2 (goto arena)
CLS
set /a damage=%random% * %tough% / 32767 +%level%+(%weplev%*2)
echo You attack %enemy% with your %weapon% and hit with %damage% damage!
set /a ehealth=%ehealth%-%damage%
echo.
set /a edamage=%random%*%eattack%/32767+%elow%-%level%
if %edamage% LEQ 0 (set /a edamage=0)
echo %enemy% hit you with %ewep% for %edamage% damage!
set /a health=%health%-%edamage%
echo.
pause
if %health% LEQ 0 (goto lose)
if %ehealth% LEQ 0 (goto levelup)
goto afight

:levelup
CLS
echo %enemy% lies dead in the dust of another long fight.
echo.
set /a gain=%random%*500/32767+%bonus%
echo You recieve %gain% gold!
set /a gold=%gold%+%gain%
echo.
set /a kills=%kills%+1
set /a level=%level%+1
pause
goto forest




::::::::::::::FOREST ENEMIES:::::::::::::::
::enemy    : Set enemy name
::ehealth  : Set enemy health
::tough    : Set max value that enemy can be hit with
::eattack  : Set max value enemy can attack with (Minus your defense value)
::elow     : Set minimum value enemy can attack with (Minus your defense value)
::ewep     : Enemy weapon name
::bonus    : Set a specific money bonus (Minimum amount to be given)
:::::::::::::::::::::::::::::::::::::::::::

set enemy=
set ehealth=
set /a tough=+(5*%level%)
set /a eattack=-%defense%
set /a elow=
set ewep=
set bonus=
goto fight

:rat
set enemy=Rat
set ehealth=4
set /a tough=3+(5*%level%)
set /a eattack=2-%defense%
set /a elow=0-%defense%
set ewep=its sewage-soaked fur
set bonus=1
goto fight

:fatkid
set enemy=Fat Kid
set ehealth=5
set /a tough=6+(5*%level%)
set /a eattack=4-%defense%
set /a elow=2-%defense%
set ewep=her extreme flatulence
set bonus=50
goto fight

:oldman
set enemy=Old Man
set ehealth=5
set /a tough=7+%level%
set /a eattack=3-%defense%
set /a elow=0-%defense%
set ewep=his old cane
set bonus=200
goto fight

:hark
set enemy=Hark
set ehealth=22
set /a tough=7+(5*%level%)
set /a eattack=7-%defense%
set /a elow=2-%defense%
set ewep=his huge muscles
set bonus=500
goto fight

:hcat
set enemy=Heavy Cat
set ehealth=6
set /a tough=7+(5*%level%)
set /a eattack=5-%defense%
set /a elow=1-%defense%
set ewep=its awkward belly
set bonus=12
goto fight

:pig
set enemy=Pig
set ehealth=17
set /a tough=3+(5*%level%)
set /a eattack=20-%defense%
set /a elow=1
set ewep=its big nose
set bonus=5
goto fight 
:::rcaproductionmaster@gmail.com
:sbear
set enemy=Small Bear
set ehealth=21
set /a tough=2+(5*%level%)
set /a eattack=25-%defense%
set /a elow=3
set ewep=its teeth and claws
set bonus=100
goto fight

:evilk
set enemy=Evil Child
set ehealth=23
set /a tough=4+(5*%level%)
set /a eattack=25-%defense%
set /a elow=2-%defense%
set ewep=his devil worshipping
set bonus=270
goto fight

:fairy
CLS
echo You come across a hidden clearing, filled with fairies.
echo You step into the open, and you are immediately scolded
echo for spying!
echo.
echo One of the smaller fairies comes up to, curiously. 
echo She examines you, but you are unsure what to do.
echo You may either 'G'o on your way, or 'S'tay a while.
echo.
choice /c GS
set /a stay=2
if %errorlevel%==1 (goto trueee)
set /a stay=1
:trueee
set /a math=%random%*(%stay%+1)/32767
if %math% GTR 0 (goto blessing)
echo The fairies are mad, and take 5 of your health! 
echo They then disappear laughing, leaving you in a bad mood.
set /a health=%health%-5
echo. 
pause
if %health% LEQ 0 (goto lose)
goto forest
:blessing
set /a gift=%random%*6/32767+1
echo The fairies take a liking to you, and award you with %gift% health.
set /a health=%health%+%gift%
echo.
pause
goto forest

:event
set /a math=%random%*3/32767+1
if %math%==1 (goto edwarf)
if %math%==2 (goto tavern)
if %math%==3 (goto liz)
goto forest
:edwarf
CLS
echo A portly, and well armed, dwarf walks into you!
echo "Sorrae der sir, I'll be on ma way now..." he says.
echo You suddenly realize you lost one health!
set /a health=%health%-1
echo.
pause
goto forest

:tavern
set /a health=%health%+10
CLS
echo You see a whisp of white smoke, coming from through the woods.
echo You walk towards it, and come across a charming old tavern.
echo It is made of stone, and has a beautiful garden surrounding
echo it's gates.
echo.
echo You stop in, and gain a few health.
echo.
pause
goto forest

:liz
color 0d
CLS
echo You hear moaning, coming from behind a grove of trees...
echo.
echo 'I'nvestigate
echo 'B'e smart and run away
choice /c IB
if %errorlevel%==2 (
color 0a
CLS
goto forest)
CLS
echo You find your way through the trees, and see the opening to a large cave...
echo The demonic moaning is louder than ever!
echo.
echo 'E'nter the cave
echo 'D'ecide to not be an idiot, and run away!
choice /c ED
if %errorlevel%==2 (
color 0a
CLS
goto forest)
CLS
echo You enter the cave, and the sounds stop!
echo.
echo In the corner, you see a young woman. She is chained to the
echo wall, bloody. Upon further inspection, a vulture has been 
echo knawing on her leg.
echo.
echo 'S'tab her
echo 'K'ick the vulture
choice /c SK /m "Be smart "
if %errorlevel%==1 (
echo You stab her with a stick, and run away. She swears at you,
echo and sets a curse upon you! You will be doomed to die
echo in your next fight!
echo.
pause
set indeath=1
color 0a
CLS
goto forest)
CLS
echo You kick the vulture, and she immediately begins to heal.
echo "Who are you?" she implores.
echo.
echo 'R'espond
echo 'Y'ell at her for being stupid
echo.
choice /c RY
if %errorlevel%==2 (
echo You wake up, remember screeching, but nothing else.
echo Better continue on then. Stupid Ale!
::::rcaproductionmaster@gmail.com
echo.
pause
color 0a
goto forest)
CLS
echo "I am a warrior, seeking fame and fortune. Who are you?"
echo.
echo She responds, "I am Liz, you stupid fool!"
echo.
echo "What a silly name!"
echo.
echo 'K'iss her
echo 'R'un away from this madwoman!
choice /c KR
if %errorlevel%==2 (
color 0a
CLS
goto forest)

if %kiss%==1 (
set /a health=%health%+50
CLS
echo Since your last kiss, she has come to like you...
echo You gain 50 health!
echo.
echo "Keep this color for a while, to remember me..."
pause
goto forest)
CLS

set /a kiss=1
set /a health=%health%-1
CLS
echo She yells at you, and you lose one health!
echo.
pause
ATTRIB -H settings.meow
(
echo %user% 
echo %gen%
echo %gold%
echo %health%
echo %weapon%
echo %level%
echo %kills%
echo %armor%
echo %defense%
echo %bank%
echo %kiss%
echo %weplev%
)>settings.meow
ATTRIB +H settings.meow
color 0a
goto forest




:sentienttree
set enemy=The Sentient Tree sentree
set ehealth=41
set /a tough=5+(5*%level%)
set /a eattack=24-%defense%
set /a elow=6
set ewep=his rude words
set bonus=0
goto fight

:smellycouch
set enemy=Smelly Couch
set ehealth=43
set /a tough=12+(5*%level%)
set /a eattack=32-%defense%
set /a elow=8
set ewep=its terribleness
set bonus=0
goto fight

:crazyman
set enemy=Crazy Dude
set ehealth=27
set /a tough=5+(5*%level%)
set /a eattack=40-%defense%
set /a elow=4
set ewep=his insane dancing
set bonus=200
goto fight

:polititian
set enemy=Politition
set ehealth=27
set /a tough=6+(5*%level%)
set /a eattack=43-%defense%
set /a elow=5
set ewep=red tape
set bonus=5000
goto fight

:knight
set enemy=Knight
set ehealth=50
set /a tough=10+(5*%level%)
set /a eattack=70-%defense%
set /a elow=10
set ewep=his Long Sword
set bonus=2500
goto fight

:dwarf
set enemy=Dwarf
set ehealth=50
set /a tough=17+(5*%level%)
set /a eattack=78-%defense%
set /a elow=6
set ewep=his small battle axe
set bonus=700
goto fight

:drunkensoldier
set enemy=Drunken Soldier
set ehealth=19
set /a tough=19+(5*%level%)
set /a eattack=71-%defense%
set /a elow=9
set ewep=ale bottles
set bonus=400
goto fight

:witch
set enemy=Witch
set ehealth=50
set /a tough=12+(5*%level%)
set /a eattack=75-%defense%
set /a elow=10
set ewep=her witchcraft
set bonus=570
goto fight

:snake
set enemy=Snake
set ehealth=34
set /a tough=20+(5*%level%)
set /a eattack=160-%defense%
set /a elow=5
set ewep=its venom
set bonus=0
goto fight

:zork
set enemy=Zork
set ehealth=52
set /a tough=10+(5*%level%)
set /a eattack=172-%defense%
set /a elow=4
set ewep=Broad Sword
set bonus=5100
goto fight

:teddyroosevelt
set enemy=Teddy Roosevelt
set ehealth=150
set /a tough=5+(5*%level%)
set /a eattack=190-%defense%
set /a elow=23
set ewep=Moose Riding
set bonus=10000
goto fight

:wakingup
set enemy=Waking Up
set ehealth=32
set /a tough=10+(5*%level%)
set /a eattack=161-%defense%
set /a elow=10
set ewep=awful morning light
set bonus=0
goto fight

:pillowcase
set enemy=Pillowcase
set ehealth=47
set /a tough=47+(5*%level%)
set /a eattack=167-%defense%
set /a elow=5
set ewep=pillowcaseyness
set bonus=25
goto fight

:kingarthur
set enemy=King Arthur
set ehealth=100
set /a tough=10+(5*%level%)
set /a eattack=170-%defense%
set /a elow=5
set ewep=Excaliber
set bonus=10500
goto fight

:bucketofwater
set enemy=Bucket Of Water
set ehealth=89
set /a tough=89+(5*%level%)
set /a eattack=182-%defense%
set /a elow=4
set ewep=wetness
set bonus=25
goto fight

:internetexplorer
set enemy=Internet Explorer
set ehealth=100
set /a tough=50+(5*%level%)
set /a eattack=25
set /a elow=5
set ewep=it's slow speeds
set bonus=10000
goto fight

:wizard
set enemy=wizard
set ehealth=132
set /a tough=20+(5*%level%)
set /a eattack=32
set /a elow=13
set ewep=his Staff of Light
set bonus=12500
goto fight

:darkwizardoftheeast
set enemy=Dark Wiz of the East
set ehealth=154
set /a tough=19+(5*%level%)
set /a eattack=37
set /a elow=15
set ewep=his Staff of Evil
set bonus=12432
goto fight

:elf
set enemy=Elf
set ehealth=60
set /a tough=0+(5*%level%)
set /a eattack=25
set /a elow=5
set ewep=her small elven sword
set bonus=50
goto fight

:rokoroztheterrible
set enemy=Rokoroz The Terrible
set ehealth=200
set /a tough=100+(5*%level%)
set /a eattack=42
set /a elow=1
set ewep=his Massive Sword
set bonus=8943
goto fight

:buffgerman
set enemy=Buff German
set ehealth=88
set /a tough=0+(5*%level%)
set /a eattack=23
set /a elow=13
set ewep=his Luger
set bonus=15000
goto fight

:nobleofdragostea
set enemy=Noble of Dragostea
set ehealth=203
set /a tough=0+(5*%level%)
set /a eattack=52
set /a elow=9
set ewep=his Army of Minions
set bonus=52000
goto fight

:dragon
set enemy=The Dragon
set ehealth=1000
set /a tough=100+(5*%level%)
set /a eattack=100
set /a elow=20
set ewep=his flames, claws, and evasions
set bonus=1000000
goto fight



:fight
CLS
echo Computing...
set /a toughh=100-%tough%
set myString=%health%
call :strlen hexsub myString
set /a jhgfjhsa=%hexsub%
set /a jhgfjhsa=13-%jhgfjhsa%
call :extrachar extrahe jhgfjhsa

set myString=%ehealth%
call :strlen hexsub myString
set /a jhgfjhsa=%hexsub%
set /a jhgfjhsa=13-%jhgfjhsa%
call :extrachar extrahe1 jhgfjhsa

set myString=%enemy%A
call :strlen hexsub myString
set /a jhgfjhsa=%hexsub%
set /a jhgfjhsa=21-%jhgfjhsa%
call :extrachar extrahe2 jhgfjhsa

set myString=%defense%
call :strlen hexsub myString
set /a jhgfjhsa=%hexsub%
set /a jhgfjhsa=13-%jhgfjhsa%
call :extrachar extrahe3 jhgfjhsa

set myString=%toughh%
call :strlen hexsub myString
set /a jhgfjhsa=%hexsub%
set /a jhgfjhsa=13-%jhgfjhsa%
call :extrachar extrahe4 jhgfjhsa

set myString=%weapon%
call :strlen hexsub myString
set /a jhgfjhsa=%hexsub%
set /a jhgfjhsa=13-%jhgfjhsa%
call :extrachar extrahe5 jhgfjhsa

set myString=%bonus%
call :strlen hexsub myString
set /a jhgfjhsa=%hexsub%
set /a jhgfjhsa=13-%jhgfjhsa%
call :extrachar extrahe6 jhgfjhsa

CLS
if %indeath%==1 (goto lose)
if %firstfight%==false (goto lkhf)
set firstfight=false
echo You see %enemy% come out of the shadows!
echo.
:lkhf
echo %lt%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%btt%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%rt%
echo %ur%You:                %tp%%enemy%:%extrahe2%%ur%
echo %mbr%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%mtbt%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%mbl%
echo %ur%Health :%health%%extrahe%%tp%Health :%ehealth%%extrahe1%%ur%
echo %ur%Defense:%defense%%extrahe3%%tp%Tough  :%toughh%%extrahe4%%ur%
echo %ur%Weapon :%weapon%%extrahe5%%tp%Bonus  :%bonus%%extrahe6%%ur%
echo %ur%                    %tp%                    %ur%
echo %lb%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%bbt%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%st%%rb%
echo.
echo 'A'ttack
echo 'R'un
choice /c AR /m "Your choice?"
if %errorlevel%==2 (goto forest)
CLS
set /a damage=%random% * %tough% / 32767 +%level%+(%weplev%*2)
echo You attack %enemy% with your %weapon% and hit with %damage% damage!
set /a ehealth=%ehealth%-%damage%
echo.
set /a edamage=%random%*%eattack%/32767+%elow%-%level%
if %edamage% LEQ 0 (set /a edamage=0)
echo %enemy% hit you with %ewep% for %edamage% damage!
set /a health=%health%-%edamage%
echo.
pause
if %health% LEQ 0 (goto lose)
if %ehealth% LEQ 0 (goto win)
goto fight

:win
if %enemy%==Dragon (goto winneroflife)
CLS
echo %enemy% lies dead on the ground.
echo.
set /a gain=%random%*500/32767+%bonus%
echo You recieve %gain% gold!
set /a gold=%gold%+%gain%
echo.
set /a kills=%kills%+1
pause
goto forest

:pstat
set /a mathtwo=%level%*10+20
CLS
echo User   : %user%
echo Gender : %gen%
echo Health : %health%/%mathtwo%
echo Gold   : %gold%
echo Level  : %level%
echo Weapon : %weapon%
echo Armor  : %armor%
echo Defense: %defense%
echo Kills  : %kills%
echo.
pause
goto forest

:winneroflife
CLS
echo CONGRATULATIONS!
echo.
echo YOU HAVE WON!
echo.
echo The townspeople are finally free of the menace!
echo.
set /a gain=%random%*50000/32767+%bonus%
echo You are rewarded %gain% gold!
set /a gold=%gold%+%gain%
echo.
pause
CLS
echo If you haven't yet, try to find all of the secrets!
echo.
echo Or, just play again ;D
echo.
pause
goto forest

::::::::::::::FOREST PLACES:::::::::::::::

:healer
CLS
echo You enter the humble shack, hoping to be healed.
echo A small sign in the corner states that healing costs 100 gold
echo for every health point. You have %gold% gold.
echo.
set /a ggg=%random%*2/32767
if %ggg%==1 (set person=short man)
if %ggg%==2 (set person=old woman)
echo A %person% comes up to you, and offers you three options.
echo.
echo 'H'eal all
echo 'O'nly heal a little
echo 'L'eave
choice /c HOL /m "Which will it be now?"
if %errorlevel%==2 (goto healbit)
if %errorlevel%==3 (goto forest)

set /a mathtwo=%level%*10+20
set /a math=mathtwo-%health%
set /a math=%math%*100
set /a math=%gold%/%math%
if %math% LEQ 0 (
CLS
echo We won't do that for so little gold.
echo.
pause
goto healer
)
set /a mathtwo=%level%*10+20
set /a math=%mathtwo%-%health%
set /a math2=%math%*100
set /a gold=%gold%-%math2%
set /a health=%health%+%math%
echo.
echo You are healed.
echo.
pause
goto forest

:healbit
set /p hpheal="How much to heal? You have %health% health and %gold% gold. 100 gold per health. >"
set /a math=%hpheal%*100
set /a math=%gold%/%math%
if %math% LEQ 0 (
echo You need more gold!
echo.
pause
goto healer
)
set /a math=%health%+%hpheal%
set /a mathtwo=%level%*10+20
if %math% GTR %mathtwo% (
echo You can't have more than %mathtwo% health.
echo.
pause
goto healer
)
set /a math=%hpheal%*100
set /a gold=%gold%-%math%
set /a health=%health%+%hpheal%
echo.
echo You are healed.
echo.
pause
goto forest

:lose
CLS
color 0c
echo Oh Ratz! Looks like you were killed!
echo Maybe next time, warrior.
echo.
pause
exit

:::::::::::::FUNCTIONS::::::::::::::

:strlen <resultVar> <stringVar>
(   
    setlocal EnableDelayedExpansion
    set "s=!%~2!#"
    set "len=0"
    for %%P in (4096 2048 1024 512 256 128 64 32 16 8 4 2 1) do (
        if "!s:~%%P,1!" NEQ "" ( 
            set /a "len+=%%P"
            set "s=!s:~%%P!"
        )
    )
)
( 
    endlocal
    set "%~1=%len%"
    exit /b
)

:extrachar <resultVar> <stringVar>
(
	::rcaproductionmaster@gmail.com
    setlocal EnableDelayedExpansion
    set "ytrr= "
:extracharloop
    if %jhgfjhsa% GTR 1 (
        set /a jhgfjhsa=%jhgfjhsa%-1
	set ytrr=%ytrr% 
	goto extracharloop   
    )
)
( 
    endlocal
    set "%~1=%ytrr%"
    exit /b
)


::rcaproductionmaster@gmail.com