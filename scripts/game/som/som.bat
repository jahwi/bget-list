@echo off
title Swords of Morovaith v1.8
color 0f
::::BgetDescription#Medieval-themed game.
::::BgetAuthor#Ranger77
::::BgetCategory#game
::::Bgettags#rpg
if not exist "%appdata%\Swords of Morovaith.dll" goto NewGame
< "%appdata%\Swords of Morovaith.dll" (
set /p flamecape=
set /p firemakingxp=
set /p ironbars=
set /p goldbars=
set /p greenbars=
set /p redbars=
set /p darkbars=
set /p log=
set /p oaklog=
set /p whitelog=
set /p greenlog=
set /p darklog=
set /p miningxp=
set /p woodcuttingxp=
set /p fletchingxp=
set /p craftingxp=
set /p attackxp=
set /p ironarmor=
set /p goldarmor=
set /p greenarmor=
set /p redarmor=
set /p darkarmor=
set /p redhood=
set /p whitehood=
set /p redcape=
set /p whitecape=
set /p ironsword=
set /p goldsword=
set /p greensword=
set /p redsword=
set /p dark2h=
set /p longbow=
set /p oakbow=
set /p whitebow=
set /p greenbow=
set /p darkbow=
set /p ironore=
set /p goldore=
set /p greenore=
set /p redore=
set /p darkore=
set /p ironclaws=
set /p goldclaws=
set /p greenclaws=
set /p redclaws=
set /p darkclaws=
set /p legendarmor=
set /p smithingxp=
set /p wool=
set /p cloth=
set /p wcsc=
set /p msc=
set /p fsc=
set /p csc=
set /p asc=
set /p wsc=
set /p ssc
set /p fishingxp=
set /p cookingxp=
set /p rf=
set /p cf=
set /p is=
set /p gs=
set /p ggs=
set /p bs=
set /p ps=
set /p rs=
set /p ds=
set /p attackxp=
set /p health=
set /p mhealth=
set /p damage=
set /p mdamage=
set /p legendclaws=
set /p totalxp=
set /p smalltrap=
set /p mediumtrap=
set /p largetrap=
set /p potion=
set /p huntingxp=
set /p alchemyxp=
set /p brownhood=
set /p gfc=
set /p dragonhood=
set /p constructionxp=
set /p legendsword=
set /a woodbow=
set /a oakbow=
set /a greenbow=
set /a redbow=
set /a darkbow=
)
:loadscreen
cls
echo Loading...
echo.
echo [__________]
echo.
echo We have hit over 100 Downloads!
timeout /nobreak /t 1 >nul
cls
echo Loading...
echo.
echo [/_________]
echo.
echo We have hit over 100 Downloads!
timeout /nobreak /t 1 >nul
cls
echo Loading...
echo.
echo [//________]
echo.
echo We have hit over 100 Downloads!
timeout /nobreak /t 1 >nul
cls
echo Loading...
echo.
echo [///_______]
echo.
echo See any bugs? Comment in the forum!
timeout /nobreak /t 1 >nul
cls
echo Loading...
echo.
echo [////______]
echo.
echo See any bugs? Comment in the forum!
timeout /nobreak /t 1 >nul
cls
echo Loading...
echo.
echo [/////_____]
echo.
echo See any bugs? Comment in the forum!
timeout /nobreak /t 1 >nul
cls
echo Loading...
echo.
echo [//////____]
echo.
echo Official Site: www.diversiongames.webs.com
timeout /nobreak /t 1 >nul
cls
echo Loading...
echo.
echo [///////___]
echo.
echo Official Site: www.diversiongames.webs.com
timeout /nobreak /t 1 >nul
cls
echo Loading...
echo.
echo [////////__]
echo.
echo Official Site: www.diversiongames.webs.com
timeout /nobreak /t 1 >nul
cls
echo Loading...
echo.
echo [/////////_]
echo.
echo Made by a 14 year old
timeout /nobreak /t 1 >nul
cls
echo Loading...
echo.
echo [//////////]
echo.
echo Made by a 14 year old
timeout /nobreak /t 1 >nul
cls
echo Load Complete!
pause>nul
cls
:menu
(
echo %firemakingxp%
echo %flamecape%
echo %ironbars%
echo %goldbars%
echo %greenbars%
echo %redbars%
echo %darkbars%
echo %log%
echo %oaklog%
echo %whitelog%
echo %greenlog%
echo %darklog%
echo %miningxp%
echo %woodcuttingxp%
echo %fletchingxp%
echo %craftingxp%
echo %attackxp%
echo %ironarmor%
echo %goldarmor%
echo %greenarmor%
echo %redarmor%
echo %darkarmor%
echo %redhood%
echo %whitehood%
echo %redcape%
echo %whitecape%
echo %ironsword%
echo %goldsword%
echo %greensword%
echo %redsword%
echo %dark2h%
echo %longbow%
echo %oakbow%
echo %whitebow%
echo %greenbow%
echo %darkbow%
echo %ironore%
echo %goldore%
echo %greenore%
echo %redore%
echo %darkore%
echo %ironclaws%
echo %goldclaws%
echo %greenclaws%
echo %redclaws%
echo %darkclaws%
echo %legendarmor%
echo %smithingxp%
echo %wool%
echo %cloth%
echo %lh%
echo %lb%
echo %ll%
echo %mc%
echo %lb%
echo %mc%
echo %fishingxp%
echo %cookingxp%
echo %rf%
echo %cf%
echo %damage%
echo %health%
echo %mdamage%
echo %mhealth%
echo %attackxp%
echo %totalxp%
echo %legendclaws%
echo %legendtoken%
echo %flamecape%
echo %firemakingxp%
echo %lh%
echo %lb%
echo %lbb%
echo %ll%
echo %smalltrap%
echo %mediumtrap%
echo %largetrap%
echo %potion%
echo %huntingxp%
echo %alchemyxp%
echo %brownhood%
echo %gfc%
echo %dragonhood%
echo %constructionxp%
echo %legendsword%
echo %legendbow%
echo %woodbow%
echo %oakbow%
echo %greenbow%
echo %redbow%
echo %darkbow%
) > "%appdata%\Swords of Morovaith.dll"
cls
echo Version 1.8
echo.
echo.
echo (1) Woodcutting
echo (2) Mining
echo (3) Fishing
echo (4) Stats
echo (5) Inventory
echo (6) Smithing
echo (7) Sheep
echo (8) Spinning Wheel
echo (9) Cooking
echo (10) Duel
echo (15) FireMaking
echo (16) Hunting
echo (17) Alchemy
echo (18) Construction
echo (19) 100th Download Item
echo (20) Fletching
echo.
echo (77) ***BOSS FIGHT***
echo.
echo (11) Credits
echo (12) Update Game
echo (13) MASTER CAPE
echo (14) Log Out
set /p var0=
if %var0% == 1 goto woodcutting
if %var0% == 2 goto mining
if %var0% == 3 goto fishing
if %var0% == 4 goto stats
if %var0% == 5 goto inventory00
if %var0% == 6 goto smithing
if %var0% == 7 goto sheep
if %var0% == 8 goto spinningwheel
if %var0% == 9 goto cooking
if %var0% == 10 goto duel
if %var0% == 11 goto credits
if %var0% == 12 goto newgame
if %var0% == 13 goto claimmastercape
if %var0% == 14 goto exit
if %var0% == 99 goto ug
if %var0% == 77 goto bossfight
if %var0% == 15 goto firemaking
if %var0% == 16 goto hunting
if %var0% == 17 goto alchemy
if %var0% == 18 goto construction
if %var0% == 19 goto claimdragonhood
if %var0% == 20 goto fletching
cls
goto menu
:inventory00
cls
(
echo %flamecape%
echo %firemakingxp%
echo %ironbars%
echo %goldbars%
echo %greenbars%
echo %redbars%
echo %darkbars%
echo %log%
echo %oaklog%
echo %whitelog%
echo %greenlog%
echo %darklog%
echo %miningxp%
echo %woodcuttingxp%
echo %fletchingxp%
echo %craftingxp%
echo %attackxp%
echo %ironarmor%
echo %goldarmor%
echo %greenarmor%
echo %redarmor%
echo %darkarmor%
echo %redhood%
echo %whitehood%
echo %redcape%
echo %whitecape%
echo %ironsword%
echo %goldsword%
echo %greensword%
echo %redsword%
echo %dark2h%
echo %longbow%
echo %oakbow%
echo %whitebow%
echo %greenbow%
echo %darkbow%
echo %ironore%
echo %goldore%
echo %greenore%
echo %redore%
echo %darkore%
echo %ironclaws%
echo %goldclaws%
echo %greenclaws%
echo %redclaws%
echo %darkclaws%
echo %legendarmor%
echo %smithingxp%
echo %wool%
echo %cloth%
echo %lh%
echo %lb%
echo %ll%
echo %mc%
echo %lb%
echo %mc%
echo %fishingxp%
echo %cookingxp%
echo %rf%
echo %cf%
echo %damage%
echo %health%
echo %mdamage%
echo %mhealth%
echo %attackxp%
echo %totalxp%
echo %legendclaws%
echo %legendtoken%
echo %flamecape%
echo %firemakingxp%
echo %mastercape%
echo %dragonhood%
echo %gfc%
echo %brownhood%
echo %potions%
echo %smalltraps%
echo %mediumtraps%
echo %largetraps%
echo %legendbow%
echo %woodbow%
echo %oakbow%
echo %greenbow%
echo %redbow%
echo %darkbow%
) > "%appdata%\Swords of Morovaith.dll"
echo You may need to scroll up!
pause>nul
cls
echo ***Legend Armor***
echo.
echo Legend Hood: %lh%
echo Legend Plate Body: %lb%
echo Legend Plate Legs: %ll%
echo Legend Boots: %lbb%
echo Legend Claws: %legendclaws%
echo Master Cape: %mastercape%
echo Flame Cape: %flamecape%
echo Brown Hood: %brownhood%
echo Green Fire Cape: %gfc%
echo Dragon Hood: %dragonhood%
echo Legend Sword: %legendsword%
echo.
echo ***Items***
echo Logs: %log%
echo Oak Logs: %oaklog%
echo White Logs: %whitelog%
echo Green Logs: %greenlog%
echo Dark Logs: %darklog%
echo Iron Ore: %ironore%
echo Gold Ore: %goldore%
echo Green Ore: %greenore%
echo Red Ore: %redore%
echo Dark Ore: %darkore%
echo Potions: %potion%
echo Small Traps: %smalltrap%
echo Medium Traps: %mediumtrap%
echo Large Traps: %largetrap%
echo.
echo ***Food***
echo Raw Fish: %rf%
echo Cooked Fish: %cf%
echo.
echo ***Weapons***
echo Iron Claws: %ironclaws%
echo Gold Claws: %goldclaws%
echo Green Claws: %greenclaws%
echo Red Claws: %redclaws%
echo Dark Claws: %darkclaws%
echo Wood Bow: %woodbow%
echo Oak Bow: %oakbow%
echo Green Bow: %greenbow%
echo Red Bow: %redbow%
echo Dark Bow: %darkbow%
echo.
echo ***Armor***
echo Iron Armor: %ironarmor%
echo Gold Armor: %goldarmor%
echo Green Armor: %greenarmor%
echo Red Armor: %redarmor%
echo Dark Armor: %darkarmor%
pause>nul
goto menu
:stats
cls
(
echo %firemakinglvl%
echo %flamecape%
echo %firemakingxp%
echo %ironbars%
echo %goldbars%
echo %greenbars%
echo %redbars%
echo %darkbars%
echo %log%
echo %oaklog%
echo %whitelog%
echo %greenlog%
echo %darklog%
echo %miningxp%
echo %woodcuttingxp%
echo %fletchingxp%
echo %craftingxp%
echo %attackxp%
echo %ironarmor%
echo %goldarmor%
echo %greenarmor%
echo %redarmor%
echo %darkarmor%
echo %redhood%
echo %whitehood%
echo %redcape%
echo %whitecape%
echo %ironsword%
echo %goldsword%
echo %greensword%
echo %redsword%
echo %dark2h%
echo %longbow%
echo %oakbow%
echo %whitebow%
echo %greenbow%
echo %darkbow%
echo %ironore%
echo %goldore%
echo %greenore%
echo %redore%
echo %darkore%
echo %ironclaws%
echo %goldclaws%
echo %greenclaws%
echo %redclaws%
echo %darkclaws%
echo %legendarmor%
echo %smithingxp%
echo %wool%
echo %cloth%
echo %lh%
echo %lb%
echo %ll%
echo %mc%
echo %lb%
echo %mc%
echo %fishingxp%
echo %cookingxp%
echo %rf%
echo %cf%
echo %damage%
echo %health%
echo %mdamage%
echo %mhealth%
echo %attackxp%
echo %totalxp%
echo %legendclaws%
echo %legendtoken%
echo %flamecape%
echo %firemakingxp%
echo %firemakinglvl%
echo %legendbow%
echo %woodbow%
echo %oakbow%
echo %greenbow%
echo %redbow%
echo %darkbow%
) > "%appdata%\Swords of Morovaith.dll"
set /a woodcuttinglvl=%woodcuttingxp%/100
set /a mininglvl=%miningxp%/100
set /a fishinglvl=%fishingxp%/100
set /a cookinglvl=%cookingxp%/100
set /a attacklvl=%attackxp%/100
set /a firemakinglvl=%firemakingxp%/100
set /a huntinglvl=%huntingxp%/100
set /a alchemylvl=%alchemyxp%/100
set /a constructionlvl=%constructionxp%/100
set /a fletchinglvl=%fletchingxp%/100
set /a level=%woodcuttinglvl%+%mininglvl%+%fishinglvl%+%cookinglvl%+%attacklvl%+%firemakinglvl%+%huntinglvl%+%alchemylvl%+%constructionlvl%+%fletchinglvl%
set /a totalxp=%woodcuttingxp%+%miningxp%+%fishingxp%+%cookingxp%+%attackxp%+%firemakingxp%+%huntingxp%+%alchemyxp%+%constructionxp%+%fletchingxp%
cls
echo Level: %level%
echo Total XP: %totalxp%
echo.
echo Woodcutting: %woodcuttinglvl%
echo Mining: %mininglvl%
echo Fishing: %fishinglvl%
echo Cooking: %cookinglvl%
echo Attack: %attacklvl%
echo Firemaking: %firemakinglvl%
echo Hunting: %huntinglvl%
echo Alchemy: %alchemylvl%
echo Construction: %constructionlvl%
echo Fletching: %fletchinglvl%
pause>nul
cls
goto menu
:woodcutting
(
echo %ironbars%
echo %goldbars%
echo %greenbars%
echo %redbars%
echo %darkbars%
echo %log%
echo %oaklog%
echo %whitelog%
echo %greenlog%
echo %darklog%
echo %miningxp%
echo %woodcuttingxp%
echo %fletchingxp%
echo %craftingxp%
echo %attackxp%
echo %ironarmor%
echo %goldarmor%
echo %greenarmor%
echo %redarmor%
echo %darkarmor%
echo %redhood%
echo %whitehood%
echo %redcape%
echo %whitecape%
echo %ironsword%
echo %goldsword%
echo %greensword%
echo %redsword%
echo %dark2h%
echo %longbow%
echo %oakbow%
echo %whitebow%
echo %greenbow%
echo %darkbow%
echo %ironore%
echo %goldore%
echo %greenore%
echo %redore%
echo %darkore%
echo %ironclaws%
echo %goldclaws%
echo %greenclaws%
echo %redclaws%
echo %darkclaws%
echo %legendarmor%
echo %smithingxp%
echo %wool%
echo %cloth%
echo %lh%
echo %lb%
echo %ll%
echo %mc%
echo %lb%
echo %mc%
echo %fishingxp%
echo %cookingxp%
echo %rf%
echo %cf%
echo %damage%
echo %health%
echo %mdamage%
echo %mhealth%
echo %attackxp%
echo %totalxp%
echo %legendclaws%
echo %legendtoken%
echo %flamecape%
echo %firemakingxp%
echo %legendbow%
echo %woodbow%
echo %oakbow%
echo %greenbow%
echo %redbow%
echo %darkbow%
) > "%appdata%\Swords of Morovaith.dll"
cls
set /a woodcuttinglvl=%woodcuttingxp%/100
echo You have level %woodcuttinglvl% Woodcutting (%woodcuttingxp% XP)
echo.
echo (1) Normal Tree (No Requirements)
echo (2) Oak Tree (Level 10 Woodcutting)
echo (3) White Tree (Level 30 Woodcutting)
echo (4) Green Tree (Level 60 Woodcutting)
echo (5) Dark Tree (Level 80 Woodcutting)
echo (6) Back To Menu
echo (7) Claim Woodcutting Reward!
set /p var3=
if %var3% == 1 goto normaltree
if %var3% == 2 goto oaktree
if %var3% == 3 goto whitetree
if %var3% == 4 goto greentree
if %var3% == 5 goto darktree
if %var3% == 6 goto menu
if %var3% == 7 goto wcskillcape
:normaltree
cls
echo Chopping Tree.
timeout /NOBREAK /t 1 >nul
cls
echo Chopping Tree..
timeout /nobreak /t 1 >nul
cls
echo Chopping Tree...
timeout /nobreak /t 1 >nul
cls
echo 1 Log Added
set /a log = %log% + 1
set /a woodcuttingxp = %woodcuttingxp% + 10
pause>nul
cls
goto woodcutting
:oaktree
cls
if %woodcuttingxp% LSS 1000 goto noxp
echo Chopping Tree.
timeout /NOBREAK /t 1 >nul
cls
echo Chopping Tree..
timeout /nobreak /t 1 >nul
cls
echo Chopping Tree...
timeout /nobreak /t 1 >nul
cls
echo 1 Oak Log Added...
set /a oaklog = %oaklog% + 1
set /a woodcuttingxp = %woodcuttingxp% + 15
pause>nul
cls
goto woodcutting
:noxp
cls
echo You don't have enough XP
pause>nul
goto woodcutting
:whitetree
cls
if %woodcuttingxp% LSS 3000 goto noxp
echo Chopping Tree.
timeout /NOBREAK /t 1 >nul
cls
echo Chopping Tree..
timeout /nobreak /t 1 >nul
cls
echo Chopping Tree...
timeout /nobreak /t 1 >nul
cls
echo 1 White Log Added!
set /a woodcuttingxp = %woodcuttingxp% + 20
set /a whitelog = %whitelog% + 1
pause>nul
cls
goto woodcutting
:greentree
cls
if %woodcuttingxp% LSS 6000 goto noxp
echo Chopping Tree.
timeout /NOBREAK /t 1 >nul
cls
echo Chopping Tree..
timeout /nobreak /t 1 >nul
cls
echo Chopping Tree...
timeout /nobreak /t 1 >nul
cls
echo 1 Green Log Added!
set /a woodcuttingxp = %woodcuttingxp% + 25
set /a greenlog = %greenlog% + 1
pause>nul
cls
goto woodcutting
:darktree
cls
if %woodcuttingxp% Lss 8000 goto noxp
echo Chopping Tree.
timeout /NOBREAK /t 1 >nul
cls
echo Chopping Tree..
timeout /nobreak /t 1 >nul
cls
echo Chopping Tree...
timeout /nobreak /t 1 >nul
cls
echo 1 Dark Log Added!
set /a darklog = %darklog% + 1
pause>nul
cls
goto woodcutting
:mining
(
echo %ironbars%
echo %goldbars%
echo %greenbars%
echo %redbars%
echo %darkbars%
echo %log%
echo %oaklog%
echo %whitelog%
echo %greenlog%
echo %darklog%
echo %miningxp%
echo %woodcuttingxp%
echo %fletchingxp%
echo %craftingxp%
echo %attackxp%
echo %ironarmor%
echo %goldarmor%
echo %greenarmor%
echo %redarmor%
echo %darkarmor%
echo %redhood%
echo %whitehood%
echo %redcape%
echo %whitecape%
echo %ironsword%
echo %goldsword%
echo %greensword%
echo %redsword%
echo %dark2h%
echo %longbow%
echo %oakbow%
echo %whitebow%
echo %greenbow%
echo %darkbow%
echo %ironore%
echo %goldore%
echo %greenore%
echo %redore%
echo %darkore%
echo %ironclaws%
echo %goldclaws%
echo %greenclaws%
echo %redclaws%
echo %darkclaws%
echo %legendarmor%
echo %smithingxp%
echo %wool%
echo %cloth%
echo %lh%
echo %lb%
echo %ll%
echo %mc%
echo %lb%
echo %mc%
echo %fishingxp%
echo %cookingxp%
echo %rf%
echo %cf%
echo %damage%
echo %health%
echo %mdamage%
echo %mhealth%
echo %attackxp%
echo %totalxp%
echo %legendclaws%
echo %legendtoken%
echo %flamecape%
echo %firemakingxp%
echo %legendbow%
echo %woodbow%
echo %oakbow%
echo %greenbow%
echo %redbow%
echo %darkbow%
) > "%appdata%\Swords of Morovaith.dll"
cls
set /a mininglvl=%miningxp%/100
echo You have level %mininglvl% Mining (%miningxp% XP)
echo.
echo (1) Mine Iron Ore (No Requirements)
echo (2) Mine Gold Ore (Need level 10 Mining)
echo (3) Mine Green Ore (Need level 30 Mining)
echo (4) Mine Red Ore (Need level 60 Mining)
echo (5) Mine Dark Ore (Need level 80 Mining)
echo (6) Back to Menu
echo (7) Claim Mining Reward!
set /p var4=
if %var4% == 1 goto mineiron
if %var4% == 2 goto minegold
if %var4% == 3 goto minegreen
if %var4% == 4 goto minered
if %var4% == 5 goto minedark
if %var4% == 6 goto menu
if %var4% == 7 goto cmsc
:mineiron
cls
echo Mining.
timeout /NOBREAK /t 1 >nul
cls
echo Mining..
timeout /nobreak /t 1 >nul
cls
echo Mining...
timeout /nobreak /t 1 >nul
cls
echo 1 Iron Ore added
set /a miningxp = %miningxp% + 10
set /a ironore = %ironore% + 1
pause>nul
goto mining
:minegold
cls
if %miningxp% LSS 1000 goto noxpm
echo Mining.
timeout /NOBREAK /t 1 >nul
cls
echo Mining..
timeout /nobreak /t 1 >nul
cls
echo Mining...
timeout /nobreak /t 1 >nul
cls
echo Mining...
echo 1 Gold Ore Added!
set /a miningxp = %miningxp% + 15
set /a goldore = %goldore% + 1
pause>nul
goto mining
:minegreen
cls
if %miningxp% LSS 3000 goto noxpm
echo Mining.
timeout /NOBREAK /t 1 >nul
cls
echo Mining..
timeout /nobreak /t 1 >nul
cls
echo Mining...
timeout /nobreak /t 1 >nul
cls
echo Mining...
echo 1 Green Ore Added!
set /a miningxp = %miningxp% + 18
set /a greenore = %greenore% + 1
pause>nul
goto mining
:minered
cls
if %miningxp% LSS 6000 goto noxpm
echo Mining.
timeout /NOBREAK /t 1 >nul
cls
echo Mining..
timeout /nobreak /t 1 >nul
cls
echo Mining...
timeout /nobreak /t 1 >nul
cls
echo Mining...
echo 1 Red Ore Added!
set /a miningxp = %miningxp% + 20
set /a redore = %redore% + 1
pause>nul
goto mining
:minedark
cls
if %miningxp% LSS 8000 goto noxpm
echo Mining.
timeout /NOBREAK /t 1 >nul
cls
echo Mining..
timeout /nobreak /t 1 >nul
cls
echo Mining...
timeout /nobreak /t 1 >nul
cls
echo Mining...
echo 1 Dark Ore added!
set /a darkore = %darkore% + 1
pause>nul
goto mining
:noxpm
cls
echo Not Enough XP!
pause>nul
goto mining
:smithing
(
echo %ironbars%
echo %goldbars%
echo %greenbars%
echo %redbars%
echo %darkbars%
echo %log%
echo %oaklog%
echo %whitelog%
echo %greenlog%
echo %darklog%
echo %miningxp%
echo %woodcuttingxp%
echo %fletchingxp%
echo %craftingxp%
echo %attackxp%
echo %ironarmor%
echo %goldarmor%
echo %greenarmor%
echo %redarmor%
echo %darkarmor%
echo %redhood%
echo %whitehood%
echo %redcape%
echo %whitecape%
echo %ironsword%
echo %goldsword%
echo %greensword%
echo %redsword%
echo %dark2h%
echo %longbow%
echo %oakbow%
echo %whitebow%
echo %greenbow%
echo %darkbow%
echo %ironore%
echo %goldore%
echo %greenore%
echo %redore%
echo %darkore%
echo %ironclaws%
echo %goldclaws%
echo %greenclaws%
echo %redclaws%
echo %darkclaws%
echo %legendarmor%
echo %smithingxp%
echo %wool%
echo %cloth%
echo %wcsc%
echo %msc%
echo %fsc%
echo %csc%
echo %asc%
echo %wsc%
echo %fishingxp%
echo %cookingxp%
echo %rf%
echo %cf%
echo %damage%
echo %health%
echo %mdamage%
echo %mhealth%
echo %attackxp%
echo %legendclaws%
echo %legendbow%
echo %woodbow%
echo %oakbow%
echo %greenbow%
echo %redbow%
echo %darkbow%
) > "%appdata%\Swords of Morovaith.dll"
cls
echo You have %ironore% Iron Ore
echo You have %goldore% Gold Ore
echo You have %greenore% Green Ore
echo You have %redore% Red Ore
echo You have %darkore% Dark Ore
echo.
echo (1) Iron Claws - 4 Iron ore
echo (2) Iron Armor - 20 Iron ore
echo (3) Gold Claws - 4 Gold ore
echo (4) Gold Armor - 20 Gold ore
echo (5) Green Claws - 4 Green ore
echo (6) Green Armor - 20 Green ore
echo (7) Red Claws - 4 Red ore
echo (8) Red Armor - 20 Red ore
echo (9) Dark Claws - 4 Dark ore
echo (10) Dark Armor - 20 Dark ore
echo (11) Goto Menu
set /p var6=
if %var6% == 1 goto ic
if %var6% == 2 goto ia
if %var6% == 3 goto gc
if %var6% == 4 goto ga
if %var6% == 5 goto ggc
if %var6% == 6 goto gga
if %var6% == 7 goto rc
if %var6% == 8 goto ra
if %var6% == 9 goto dc
if %var6% == 10 goto da
if %var6% == 11 goto menu
:is
if %ironbars% LSS 2 goto nebars
echo Smithing.
timeout /NOBREAK /t 1 >nul
cls
echo Smithing..
timeout /nobreak /t 1 >nul
cls
echo Smithing...
timeout /nobreak /t 1 >nul
cls
echo You have crafted an Iron Sword!
set /a ironsword = %ironsword% + 1
set /a ironbars = %ironbars% - 2
pause>nul
goto smithing
:ic
if %ironore% LSS 4 goto nebars
echo Smithing.
timeout /NOBREAK /t 1 >nul
cls
echo Smithing..
timeout /nobreak /t 1 >nul
cls
echo Smithing...
timeout /nobreak /t 1 >nul
cls
echo You have crafted Iron Claws!
set /a ironclaws = %ironclaws% + 1
set /a ironore = %ironore% - 4
set /a damage = %damage% + 15
pause>nul
goto smithing
:ia
if %ironore% LSS 20 goto nebars
echo Smithing.
timeout /NOBREAK /t 1 >nul
cls
echo Smithing..
timeout /nobreak /t 1 >nul
cls
echo Smithing...
timeout /nobreak /t 1 >nul
cls
echo You have crafted Iron Armor!
set /a ironarmor = %ironarmor% + 1
set /a ironore = %ironore% - 20
set /a health = %health% + 100
pause>nul
goto smithing
:gs
cls
if %goldbars% LSS 2 goto nebars
echo Smithing.
timeout /NOBREAK /t 1 >nul
cls
echo Smithing..
timeout /nobreak /t 1 >nul
cls
echo Smithing...
timeout /nobreak /t 1 >nul
cls
echo You have crafted a Gold Sword!
set /a goldsword = %goldsword% + 1
set /a goldbars = %goldbars% - 2
pause>nul
goto smithing
:gc
cls
if %goldore% LSS 4 goto nebars
echo Smithing.
timeout /NOBREAK /t 1 >nul
cls
echo Smithing..
timeout /nobreak /t 1 >nul
cls
echo Smithing...
timeout /nobreak /t 1 >nul
cls
echo You have crafted Gold Claws!
set /a goldclaws = %goldclaws% + 1
set /a goldore = %goldore% - 4
set /a damage = %damage% + 25
pause>nul
goto smithing
:ga
cls
if %goldore% LSS 20 goto nebars
echo Smithing.
timeout /NOBREAK /t 1 >nul
cls
echo Smithing..
timeout /nobreak /t 1 >nul
cls
echo Smithing...
timeout /nobreak /t 1 >nul
cls
echo You have crafted Gold Armor!
set /a goldarmor = %goldarmor% + 1
set /a goldore = %goldore% - 20
set /a health = %health% +110
pause>nul
goto smithing
:ggs
cls
if %greenbars% LSS 2 goto nebars
echo Smithing.
timeout /nobreak /t 1 >nul
cls
echo Smithing..
timeout /nobreak /t 1 >nul
cls
echo Smithing...
timeout /nobreak /t 1 >nul
cls
echo You have crafted a Green Sword!
set /a greensword = %greensword% + 1
set /a greenbars = %greenbars% - 2
pause>nul
goto smithing
:ggc
cls
if %greenore% LSS 4 goto nebars
echo Smithing.
timeout /nobreak /t 1 >nul
cls
echo Smithing..
timeout /nobreak /t 1 >nul
cls
echo Smithing...
timeout /nobreak /t 1 >nul
cls
echo You have crafted Green Claws!
set /a greenclaws = %greenclaws% + 1
set /a greenore = %greenore% - 4
set /a damage = %damage% + 34
Pause>nul
goto smithing
:gga
cls
if %greenore% LSS 20 goto nebars
echo Smithing.
timeout /nobreak /t 1 >nul
cls
echo Smithing..
timeout /nobreak /t 1 >nul
cls
echo Smithing...
timeout /nobreak /t 1 >nul
cls
echo You have crafted Green Armor!
set /a greenarmor = %greenarmor% + 1
set /a greenore = %greenore% - 20
set /a health = %health% +120
pause>nul
goto smithing
:rs
cls
if %redbars% LSS 2 goto nebars
echo Smithing.
timeout /nobreak /t 1 >nul
cls
echo Smithing..
timeout /nobreak /t 1 >nul
cls
echo Smithing...
timeout /nobreak /t 1 >nul
cls
echo You have crafted a Red Sword!
set /a redsword = %redsword% + 1
set /a redbars = %redbars% - 2
pause>nul
goto smithing
:rc
cls
if %redore% LSS 4 goto nebars
echo Smithing.
timeout /nobreak /t 1 >nul
cls
echo Smithing..
timeout /nobreak /t 1 >nul
cls
echo Smithing...
timeout /nobreak /t 1 >nul
cls
echo You have crafted Red Claws!
set /a redclaws = %redclaws% + 1
set /a redore = %redore% - 4
set /a damage = %damage% + 43
pause>nul
goto smithing
:ra
cls
if %redore% LSS 20 goto nebars
echo Smithing.
timeout /nobreak /t 1 >nul
cls
echo Smithing..
timeout /nobreak /t 1 >nul
cls
echo Smithing...
timeout /nobreak /t 1 >nul
cls
echo You have crafted Red Armor!
set /a redarmor = %redarmor% + 1
set /a redore = %redore% - 20
set /a health = %health% +130
pause>nul
goto smithing
:ds
cls
if %darkbars% LSS 2 goto nebars
echo Smithing.
timeout /nobreak /t 1 >nul
cls
echo Smithing..
timeout /nobreak /t 1 >nul
cls
echo Smithing...
timeout /nobreak /t 1 >nul
cls
echo You have crafted a Dark Sword!
set /a darksword = %darksword% + 1
set /a darkbars = %darkbars% - 2
pause>nul
goto smithing
:dc
cls
if %darkore% LSS 4 goto nebars
echo Smithing.
timeout /nobreak /t 1 >nul
cls
echo Smithing..
timeout /nobreak /t 1 >nul
cls
echo Smithing...
timeout /nobreak /t 1 >nul
cls
echo You have crafted Dark Claws!
set /a darkclaws = %darkclaws% + 1
set /a darkore = %darkore% - 4
set /a damage = %damage% +60
pause>nul
goto smithing
:da
cls
if %darkore% LSS 20 goto nebars
echo Smithing.
timeout /nobreak /t 1 >nul
cls
echo Smithing..
timeout /nobreak /t 1 >nul
cls
echo Smithing...
timeout /nobreak /t 1 >nul
cls
echo You have crafted Dark Armor!
set /a darkarmor = %darkarmor% + 1
set /a darkore = %darkore% - 20
set /a health = %health% +200
pause>nul
goto smithing
:nebars
cls
echo You don't have enough ore for that!
pause>nul
goto smithing
:NewGame
cls
echo (1) Restart Game
echo (2) Update Game
set /P NewGame=
if %NewGame% == 1 goto RESTART
if %NewGame% == 2 goto ug
if /I %NewGame% == Y goto RESTART
if /I %NewGame% == Yes goto RESTART
if /I %NewGame% == N goto NORESTART
if /I %NewGame% == No goto NORESTART
echo Please type Yes or No.
goto NewGame
:NORESTART
cls
echo You chose not to restart the game.
pause>nul
cls
goto menu
:RESTART
cls
set /a ironbars = 0
set /a goldbars = 0
set /a greenbars = 0
set /a redbars = 0
set /a darkbars = 0
set /a log = 0
set /a oaklog = 0
set /a whitelog = 0
set /a greenlog = 0
set /a darklog = 0
set /a miningxp = 0
set /a woodcuttingxp = 0
set /a fletchingxp = 0
set /a craftingxp = 0
set /a attackxp = 0
set /a ironarmor = 0
set /a goldarmor = 0
set /a greenarmor = 0
set /a redarmor = 0
set /a darkarmor = 0
set /a redhood = 0
set /a whitehood = 0
set /a redcape = 0
set /a whitecape = 0
set /a ironsword = 0
set /a goldsword = 0
set /a greensword = 0
set /a redsword = 0
set /a dark2h = 0
set /a longbow = 0
set /a oakbow = 0
set /a whitebow = 0
set /a greenbow = 0
set /a darkbow = 0
set /a ironore = 0
set /a goldore = 0
set /a greenore = 0
set /a redore = 0
set /a darkore = 0
set /a ironclaws = 0
set /a goldclaws = 0
set /a greenclaws = 0
set /a redclaws = 0
set /a darkclaws = 0
set /a legendarmor = 0
set /a smithingxp = 0
set /a wool = 0
set /a cloth = 0
set /a wcsc = 0
set /a lh = 0
set /a lb = 0
set /a ll = 0
set /a lb = 0
set /a mc = 0
set /a ssc = 0
set /a fishingxp = 0
set /a cookingxp = 0
set /a rf = 0
set /a cf = 0
set /a is =
set /a gs = 0
set /a ggs = 0
set /a bs = 0
set /a ps = 0
set /a rs = 0
set /a ds = 0
set /a damage = 0
set /a mdamage = 0
set /a mhealth = 100
set /a attackxp = 0
set /a legendclaws = 0
set /a legendtoken = 0
set /a flamecape = 0
set /a firemakingxp = 0
set /a smalltrap = 0
set /a mediumtrap = 0
set /a largetrap = 0
set /a potions = 0
set /a huntingxp = 0
set /a alchemyxp = 0
set /a brownhood = 0
set /a gfc = 0
set /a legendbow = 0
set /a woodbow = 0
set /a oakbow = 0
set /a greenbow = 0
set /a redbow = 0
set /a darkbow = 0
set /a constructionxp = 0
set /a legendsword = 0
set /a legendbow = 0
set /a woodbow = 0
set /a oakbow = 0
set /a greenbow = 0
set /a redbow = 0
set /a darkbow = 0
echo Your save has been reset.
pause>nul
cls
goto menu
:credits
cls
echo Thank you all who helped with this game!
echo.
echo Mod Slay (Ranger 77) - Creater, Coder, Tester, Updates
echo.
echo BradleyDS2 - Creater, Coder, Tester
echo.
echo Kevin - Ideas
echo.
echo Preston - Ideas
echo.
echo Eddie - Ideas
echo.
echo Jumba - Tester and Stats
pause>nul
goto menu
:sheep
(
echo %ironbars%
echo %goldbars%
echo %greenbars%
echo %redbars%
echo %darkbars%
echo %log%
echo %oaklog%
echo %whitelog%
echo %greenlog%
echo %darklog%
echo %miningxp%
echo %woodcuttingxp%
echo %fletchingxp%
echo %craftingxp%
echo %attackxp%
echo %ironarmor%
echo %goldarmor%
echo %greenarmor%
echo %redarmor%
echo %darkarmor%
echo %redhood%
echo %whitehood%
echo %redcape%
echo %whitecape%
echo %ironsword%
echo %goldsword%
echo %greensword%
echo %redsword%
echo %dark2h%
echo %longbow%
echo %oakbow%
echo %whitebow%
echo %greenbow%
echo %darkbow%
echo %ironore%
echo %goldore%
echo %greenore%
echo %redore%
echo %darkore%
echo %ironclaws%
echo %goldclaws%
echo %greenclaws%
echo %redclaws%
echo %darkclaws%
echo %legendarmor%
echo %smithingxp%
echo %wool%
echo %cloth%
echo %wcsc%
echo %msc%
echo %fsc%
echo %csc%
echo %asc%
echo %wsc%
echo %fishingxp%
echo %cookingxp%
echo %rf%
echo %cf%
echo %damage%
echo %health%
echo %mdamage%
echo %mhealth%
echo %attackxp%
echo %legendclaws%
echo %legendbow%
echo %woodbow%
echo %oakbow%
echo %greenbow%
echo %redbow%
echo %darkbow%
) > "%appdata%\Swords of Morovaith.dll"
cls
echo (1) Shear Sheep
echo (2) Leave it alone
set /p var7=
if %var7% == 1 goto shear
if %var7% == 2 goto menu
:shear
cls
echo Shearing.
timeout /nobreak /t 1 >nul
cls
echo Shearing..
timeout /nobreak /t 1 >nul
cls
echo Shearing...
timeout /nobreak /t 1 >nul
cls
echo You shear the sheep for 1 wool!
set /a wool = %wool% + 1
pause>nul
goto sheep
:spinningwheel
(
echo %ironbars%
echo %goldbars%
echo %greenbars%
echo %redbars%
echo %darkbars%
echo %log%
echo %oaklog%
echo %whitelog%
echo %greenlog%
echo %darklog%
echo %miningxp%
echo %woodcuttingxp%
echo %fletchingxp%
echo %craftingxp%
echo %attackxp%
echo %ironarmor%
echo %goldarmor%
echo %greenarmor%
echo %redarmor%
echo %darkarmor%
echo %redhood%
echo %whitehood%
echo %redcape%
echo %whitecape%
echo %ironsword%
echo %goldsword%
echo %greensword%
echo %redsword%
echo %dark2h%
echo %longbow%
echo %oakbow%
echo %whitebow%
echo %greenbow%
echo %darkbow%
echo %ironore%
echo %goldore%
echo %greenore%
echo %redore%
echo %darkore%
echo %ironclaws%
echo %goldclaws%
echo %greenclaws%
echo %redclaws%
echo %darkclaws%
echo %legendarmor%
echo %smithingxp%
echo %wool%
echo %cloth%
echo %wcsc%
echo %msc%
echo %fsc%
echo %csc%
echo %asc%
echo %wsc%
echo %fishingxp%
echo %cookingxp%
echo %rf%
echo %cf%
echo %damage%
echo %health%
echo %mdamage%
echo %mhealth%
echo %attackxp%
echo %legendclaws%
echo %lh%
echo %lb%
echo %lbb%
echo %ll%
echo %legendbow%
echo %woodbow%
echo %oakbow%
echo %greenbow%
echo %redbow%
echo %darkbow%
) > "%appdata%\Swords of Morovaith.dll"
cls
echo Cloth: %cloth%
echo Wool: %wool%
echo.
echo (1) Spin Wool
echo (2) Leave
echo (3) Craft Hood
echo (4) Craft Cape
set /p var8=
if %var8% == 1 goto sw
if %var8% == 2 goto menu
if %var8% == 3 goto ch
if %var8% == 4 goto cc
:nowool
cls
echo You have no wool!
pause>nul
goto menu
:ch
cls
echo You have %cloth% Cloth
echo.
echo (1) Craft Hood: 4 Cloth
echo (2) Leave
set /p var9=
if %var9% == 1 goto ch2
if %var9% == 2 goto spinningwheel
:ch2
cls
if %cloth% LSS 4 goto nocloth
echo You craft a hood!
set /a whitehood = %whitehood% + 1
set /a cloth = %cloth% - 4
pause>nul
goto spinningwheel
:nocloth
cls
echo You don't have enough cloth!
pause>nul
goto spinningwheel
:cc
cls
echo You have %cloth% Cloth!
echo.
echo (1) Craft Cape: 8 Cloth
echo (2) Leave
set /p var10=
if %var10% == 1 goto cc2
if %var10% == 2 goto spinningwheel
:cc2
cls
if %cloth% LSS 8 goto nocloth
echo You craft a cape!
set /a whitecape = %whitecape% + 1
set /a cloth = %cloth% - 8
pause>nul
goto spinningwheel
:sw
cls
if %wool% LEQ 0 goto nowool
echo Spinning.
timeout /nobreak /t 1 >nul
cls
echo Spinning..
timeout /nobreak /t 1 >nul
cls
echo Spinning...
timeout /nobreak /t 1 >nul
cls
echo You spin 1 wool into 1 Cloth!
set /a cloth = %cloth% + 1
set /a wool = %wool% - 1
pause>nul
goto spinningwheel
:wcskillcape
cls
if %woodcuttingxp% LSS 8000 goto noxpsc
if %wcsc% == 1 goto GCA
echo Congrats on Level 80 Woodcutting!
pause>nul
cls
echo You have received: Legend Hood
set /a wcsc = %lh% + 1
pause>nul
goto woodcutting
:noxpsc
cls
echo You aren't a high enough level yet D:
pause>nul
goto menu
:cmsc
cls
if %miningxp% LSS 8000 goto noxpsc
if %msc% == 1 goto GCA
echo Congrats on Level 80 Mining!
pause>nul
cls
echo You have received: Legend Body
set /a msc = %msc% + 1
pause>nul
goto mining
:cfsc
cls
if %fishingxp% LSS 8000 goto noxpsc
if %fsc% == 1 goto GCA
echo Congrats on Level 80 Fishing!
pause>nul
cls
echo You have received: Legend Boots
set /a fsc = %lb% + 1
pause>nul
cls
goto fishing
:ccsc
cls
if %cookingxp% LSS 8000 goto noxpsc
if %csc% == 1 goto GCA
echo Congrats on Level 80 Cooking!
pause>nul
cls
echo You have received: Legend Legs
set /a csc = %ll% + 1
pause>nul
goto cooking
:cwwsc
cls
if %woodcuttingxp% LSS 8000 goto nexpp
if %miningxp% LSS 8000 goto nexpp
if %fishingxp% LSS 8000 goto nexpp
if %cookingxp% LSS 8000 goto nexpp
if %firemakingxp% LSS 8000 goto nexpp
if %attackxp% LSS 8000 goto nexpp
if %wsc% == 1 goto GCA
echo You have reached Max Level!
pause>nul
echo You recieve a Master Cape!
set /a wsc = %mc% + 1
pause>nul
cls
echo You have completed the game!
pause>nul
cls
goto menu
:nhel
cls
echo You are not a high enough Level!
pause>nul
goto menu
:fishing
cls
set /a fishinglvl=%fishingxp%/100
echo You have Level %fishinglvl% Fishing
echo.
echo (1) Toss out Rod
echo (2) Exit to menu
echo (3) Claim Fishing Reward!
set /p var11=
if %var11% == 1 goto fs
if %var11% == 2 goto menu
if %var11% == 3 goto cfsc
:cfsc
cls
if %fishingxp% LSS 8000 goto noxpsc
echo Congrats on Level 80 fishing!
pause>nul
cls
echo You have recieved: Legend Boots
set /a fsc = %lbb% + 1
pause>nul
goto fishing
:fs
cls
echo Fishing.
timeout /nobreak /t 1 >nul
cls
echo Fishing..
timeout /nobreak /t 1 >nul
cls
echo Fishing...
timeout /nobreak /t 1 >nul
cls
echo 1 Raw Fish Added!
set /a rf = %rf% + 1
set /a fishingxp = %fishingxp% + 15
pause>nul
goto fishing
:cooking
cls
set /a cookinglvl=%cookingxp%/100
echo You have Level %cookinglvl% Cooking (%cookingxp% XP)
echo.
echo You have %rf% Raw Fish
echo You have %cf% Cooked Fish
echo.
echo (1) Cook 1 Fish at a time
echo (2) Cook 3 Fish at a time
echo (3) Cook 5 Fish at a time
echo (4) Cook 7 Fish at a time
echo (5) Cook 12 Fish at a time
echo (6) Exit to menu
echo (7) Claim Cooking Reward!
set /p var12=
if %var12% == 1 goto c1
if %var12% == 2 goto c3
if %var12% == 3 goto c5
if %var12% == 4 goto c7
if %var12% == 5 goto c12
if %var12% == 6 goto menu
if %var12% == 7 goto ccsc
:c1
cls
if %rf% LSS 1 goto nrf
if %log% LSS 3 goto nlogs
echo You set a fire...
pause>nul
cls
echo Cooking.
timeout /nobreak /t 1 >nul
cls
echo Cooking..
timeout /nobreak /t 1 >nul
cls
echo Cooking...
timeout /nobreak /t 1 >nul
cls
echo You cook 1 Fish!
set /a cf = %cf% + 1
set /a log = %log% - 3
set /a cookingxp = %cookingxp% + 10
set /a rf = %rf% - 1
pause>nul
goto cooking
:c3
cls
if %rf% LSS 3 goto nrf
if %oaklog% LSS 3 goto noalogs
echo You set a fire...
pause>nul
cls
echo Cooking.
timeout /nobreak /t 1 >nul
cls
echo Cooking..
timeout /nobreak /t 1 >nul
cls
echo Cooking...
timeout /nobreak /t 1 >nul
cls
echo You cook 3 Fish!
set /a cf = %cf% + 3
set /a oaklog = %oaklog% - 3
set /a cookingxp = %cookingxp% + 15
set /a rf = %rf% - 3
pause>nul
goto cooking
:nlogs
cls
echo You don't have enough Logs!
pause>nul
goto cooking
:noalogs
cls
echo You don't have enough Oak Logs!
pause>nul
goto cooking
:c5
cls
if %rf% LSS 5 goto nrf
if %whitelog% LSS 3 goto nwlogs
echo You set a fire...
pause>nul
cls
echo Cooking.
timeout /nobreak /t 1 >nul
cls
echo Cooking..
timeout /nobreak /t 1 >nul
cls
echo Cooking...
timeout /nobreak /t 1 >nul
cls
echo You cook 5 Fish!
set /a cf = %cf% + 5
set /a whitelog = %whitelog% - 3
set /a cookingxp = %cookingxp% + 20
set /a rf = %rf% - 5
pause>nul
goto cooking
:nglogs
cls
echo You don't have enough Green Logs!
pause>nul
goto cooking
:c7
cls
if %rf% LSS 7 goto nrf
if %greenlog% LSS 3 goto nglogs
echo You set a fire...
pause>nul
cls
echo Cooking.
timeout /nobreak /t 1 >nul
cls
echo Cooking..
timeout /nobreak /t 1 >nul
cls
echo Cooking...
timeout /nobreak /t 1 >nul
cls
echo You cook 7 Fish!
set /a cf = %cf% + 7
set /a greenlog = %greenlog% - 3
set /a cookingxp = %cookingxp% + 25
set /a rf = %rf% - 7
pause>nul
goto cooking
:nwlogs
cls
echo You don't have enough White Logs!
cls
pause>nul
goto cooking
:c12
cls
if %rf% LSS 12 goto nrf
if %darklog% LSS 3 goto ndlogs
echo You set a fire...
pause>nul
cls
echo Cooking.
timeout /nobreak /t 1 >nul
cls
echo Cooking..
timeout /nobreak /t 1 >nul
cls
echo Cooking...
timeout /nobreak /t 1 >nul
cls
echo You cook 12 Fish!
set /a cf = %cf% + 12
set /a darklog = %log% - 3
set /a rf = %rf% - 12
pause>nul
goto cooking
:ndlogs
cls
echo You don't have enough dark logs!
pause>nul
goto cooking
:nrf
cls
echo You don't have enough raw fish!
pause>nul
goto cooking
:nwxp
cls
echo You are not a high enough level!
pause>nul
goto menu
:nmxp
cls
echo You are not a high enough level!
pause>nul
goto menu
:nfxp
cls
echo You are not a high enough level!
pause>nul
goto menu
:ncxp
cls
echo You are not a high enough level!
pause>nul
goto menu
:GCA
cls
echo You already have that cape!
pause>nul
goto menu
:exit
cls
echo Goodbye, play again soon!
pause>nul
exit
:duel
cls
echo DUEL ARENA
echo.
set /a attacklvl=%attackxp%/100
echo You have level %attacklvl% Attack (%attackxp% XP)
echo (1) Friendly (Lose Nothing)
echo (2) Dangerous (Lose Weapons and Armor)
echo (3) Claim Attack Reward!
set /p var29=
if %var29% == 1 goto friendly
if %var29% == 2 goto dangerous
if %var29% == 3 goto attackreward
:friendly
cls
set /a level=%woodcuttingxp%+%miningxp%+%fishingxp%+%cookingxp%+%attackxp%
set /a bot=%random%/150
set /a health = 100
set /a healthh=%level%*2
set /a damage=%level%*10/15
set /a md=%bot%*50
set /a mh=%bot%*250
goto fight
:fight
echo You walk into a level %bot% Warrior!
pause>nul
cls
:fight2
cls
echo You: %healthh%
echo Enemy: %mh%
pause>nul
echo You attack dealing %damage% Damage!
set /a mh=%mh%-%damage%
if %health% LSS 0 goto lose
if %mh% LSS 0 goto win
pause>nul
cls
echo You: %healthh%
echo Enemy: %mh%
pause>nul
echo The enemy attacks dealing %md% Damage!
set /a healthh=%healthh%-%md%
Pause>nul
if %healthh% LSS 0 goto lose
echo (1) Eat Food
echo (2) Attack
echo (3) Drink Potion
set /p var34=
if %var34% == 1 goto eatfood
if %var34% == 2 goto fight2
if %var34% == 3 goto drinkpotion
pause>nul
goto fight2
:lose
cls
echo You have died D:
pause>nul
cls
echo Don't worry, you didn't lose anything!
pause>nul
cls
goto menu
:win
cls
echo You won the duel!
pause>nul
cls
echo +25 Attack xp!
set /a attackxp = %attackxp% + 25
pause>nul
cls
goto menu
:dangerous
cls
set /a level=%woodcuttingxp%+%miningxp%+%fishingxp%+%cookingxp%+%attackxp%
set /a bot=%random%/150
set /a health = 100
set /a healthh=%level%*2
set /a damage=%level%*10/15
set /a md=%bot%*50
set /a mh=%bot%*250
goto dfight
:dfight
echo You walk into a level %bot% Warrior!
pause>nul
cls
:dangerous2
cls
echo You: %healthh%
echo Enemy: %mh%
pause>nul
echo You attack dealing %damage% Damage!
set /a mh=%mh%-%damage%
if %health% LSS 0 goto dlose
if %mh% LSS 0 goto dwin
pause>nul
cls
echo You: %healthh%
echo Enemy: %mh%
pause>nul
echo The enemy attacks dealing %md% Damage!
set /a healthh=%healthh%-%md%
Pause>nul
cls
echo You: %healthh%
echo Enemy: %mh%
if %healthh% LSS 0 goto dlose
echo (1) Eat Food
echo (2) Attack
set /p var31=
if %var31% == 1 goto deatfood
if %var31% == 2 goto dangerous2
:continue
cls
goto dangerous2
:dlose
cls
echo You have died D:
pause>nul
cls
echo You have lost all of your armor and weapons. (Except Legend Armor/Hoods and Capes)
set /a ironarmor = 0
set /a goldarmor = 0
set /a greenarmor = 0
set /a redarmor = 0
set /a darkarmor = 0
set /a ironclaws = 0
set /a goldclaws = 0
set /a greenclaws = 0
set /a redclaws = 0
set /a darkclaws = 0
pause>nul
cls
goto menu
:dwin
cls
echo You won the duel!
pause>nul
cls
echo +43 Attack xp!
set /a attackxp = %attackxp% + 43
pause>nul
cls
goto menu
:attackreward
cls
if %attackxp% LSS 8000 goto nexp
echo Congrats on Level 80 Attack!
pause>nul
cls
echo You have recieved Legend Claws!
set /a legendclaws = 1
pause>nul
cls
goto menu
:ug
cls
set /a constructionxp = 0
set /a legendsword = 0
set /a mastercape = 0
set /a potions = 0
set /a smalltraps = 0
set /a mediumtraps = 0
set /a largetraps = 0
set /a dragonhood = 0
set /a legendbow = 0
set /a woodbow = 0
set /a oakbow = 0
set /a greenbow = 0
set /a redbow = 0
set /a darkbow = 0
echo Game Updated to Version 1.8 (Current Version)
pause>nul
goto menu
:eatfood
cls
if %cf% LSS 1 goto nofood
echo You eat 1 Cooked fish and health 6500 HP!
set /a cf = %cf% - 1
set /a healthh = %healthh% + 6500
pause>nul
goto fight2
:nofood
cls
echo You have no cooked food!
pause>nul
cls
goto fight2
:deatfood
cls
if %cf% LSS 1 goto nofood
echo You eat 1 Cooked fish and health 6500 HP!
set /a cf = %cf% - 1
set /a healthh = %healthh% + 6500
pause>nul
goto dangerous2
:nexp
cls
echo You don't have enough XP!
pause>Nul
goto duel
:bossfight
cls
echo Are you sure you want to fight a boss?
echo (1) Duh, that's why I came here
echo (2) Uhh...Let me train some more...
set /p boss=
if %boss% == 1 goto fightboss
if %boss% == 2 goto menu
:fightboss
cls
set /a level=%woodcuttingxp%+%miningxp%+%fishingxp%+%cookingxp%+%attackxp%
set /a bot=%random%/39
set /a health = 100
set /a healthh=%level%*2
set /a damage=%level%*10/15
set /a md=%bot%*350
set /a mh=%bot%*450
goto bfight
:bfight
echo You walk into a level %bot% Boss
pause>nul
cls
:bfight2
cls
echo You: %healthh%
echo Enemy: %mh%
pause>nul
echo You attack dealing %damage% Damage!
set /a mh=%mh%-%damage%
if %health% LSS 0 goto lose
if %mh% LSS 0 goto bwin
pause>nul
cls
echo You: %healthh%
echo Enemy: %mh%
pause>nul
echo The enemy attacks dealing %md% Damage!
set /a healthh=%healthh%-%md%
Pause>nul
if %healthh% LSS 0 goto lose
echo (1) Eat Food
echo (2) Attack
set /p var34=
if %var34% == 1 goto eatfood
if %var34% == 2 goto bfight2
pause>nul
goto bfight2
:lose
cls
echo You have died D:
pause>nul
cls
echo Don't worry, you didn't lose anything!
pause>nul
cls
goto menu
:bwin
cls
echo You won the duel!
pause>nul
cls
echo +735 Attack xp!
set /a attackxp = %attackxp% + 735
pause>nul
cls
goto menu
:firemaking
(
echo %firemakingxp%
echo %flamecape%
) > "%appdata%\Swords of Morovaith.dll"
cls
set /a firemakinglvl=%firemakingxp%/100
echo You have level %firemakinglvl% Firemaking (%firemakingxp% XP)
echo.
echo (1) Light logs
echo (2) Back to menu
echo (3) Claim Firemaking Reward
set /p light=
if %light% == 1 goto lightlogs
if %light% == 2 goto menu
if %light% == 3 goto firemakingreward
:lightlogs
cls
echo (1) Normal Logs
echo (2) Oak Logs
echo (3) Green Logs
echo (4) Red Logs
echo (5) Dark Logs
set /p logslight=
if %logslight% == 1 goto lno
if %logslight% == 2 goto loa
if %logslight% == 3 goto lgr
if %logslight% == 4 goto lre
if %logslight% == 5 goto ldr
:lno
cls
if %log% LSS 1 goto nologsyet
echo You light the logs on fire...
set /a firemakingxp = %firemakingxp% + 10
set /a log = %log% - 1
pause>nul
goto firemaking
:nologsyet
cls
echo You have no logs!
pause>Nul
goto firemaking
:firemakingreward
cls
if %firemakingxp% LSS 8000 goto nofxp
echo Congrats on Level 80 firemaking!
pause>nul
cls
echo You have recieved a Flame Cape!
set /a flamecape = %flamecape% + 1
pause>nul
cls
goto firemaking
:loa
cls
if %oaklog% LSS 1 goto nologsyet
echo You light the logs on fire...
set /a firemakingxp = %firemakingxp% + 18
set /a oaklog = %oaklog% - 1
pause>nul
goto firemaking
:lgr
cls
if %greenlog% LSS 1 goto nologsyet
echo You light the logs on fire...
set /a firemakingxp = %firemakingxp% + 23
set /a greenlog = %greenlog% - 1
pause>nul
goto firemaking
:lre
cls
if %redlog% LSS 1 goto nologsyet
echo You light the logs on fire...
set /a firemakingxp = %firemakingxp% + 31
set /a redlog = %redlog% - 1
pause>nul
goto firemaking
:ldr
cls
if %darklog% LSS 1 goto nologsyet
echo You light the logs on fire...
pause>nul
goto firemaking
:hunting
cls
set /a huntinglvl=%huntingxp%/100
echo Your Hunting level is %huntinglvl%
echo.
echo (1) Use Small Trap
echo (2) Use Medium Trap (Level 10)
echo (3) Use Large Trap (Level 25)
echo (4) Use 2 Medium Traps (Level 32)
echo (5) Use 2 Large Traps (Level 50)
echo (6) Use 3 Medium Traps (Level 63)
echo (7) Use 3 Large Traps (Level 80)
echo (8) Claim Hunting Reward!
echo (9) Back to Menu
set /p huntingchoice=
if %huntingchoice% == 1 goto smalltrap
if %huntingchoice% == 2 goto mediumtrap
if %huntingchoice% == 3 goto largetrap
if %huntingchoice% == 4 goto 2medium
if %huntingchoice% == 5 goto 2large
if %huntingchoice% == 6 goto 3medium
if %huntingchoice% == 7 goto 3large
if %huntingchoice% == 8 goto huntingreward
if %huntingchoice% == 9 goto menu
:smalltrap
cls
echo You set the Small Trap in the ground.
timeout /nobreak /t 1 >nul
cls
echo You set the Small Trap in the ground..
timeout /nobreak /t 1 >nul
cls
echo You set the Small Trap in the ground...
timeout /nobreak /t 1 >nul
cls
echo You catch a small instance!
pause>nul
cls
echo +7xp
set /a huntingxp = %huntingxp% + 7
pause>nul
cls
goto hunting
:mediumtrap
cls
if %huntingxp% LSS 1000 goto nexph
echo You set the Medium Trap in the ground.
timeout /nobreak /t 1 >nul
cls
echo You set the Medium Trap in the ground..
timeout /nobreak /t 1 >nul
cls
echo You set the Medium Trap in the ground...
timeout /nobreak /t 1 >nul
cls
echo You catch a Medium instance!
pause>nul
cls
echo +14xp
set /a huntingxp = %huntingxp% + 14
pause>nul
cls
goto hunting
:largetrap
if %huntingxp% LSS 2500 goto nexph
cls
echo You set the Large Trap in the ground.
timeout /nobreak /t 1 >nul
cls
echo You set the Large Trap in the ground..
timeout /nobreak /t 1 >nul
cls
echo You set the Large Trap in the ground...
timeout /nobreak /t 1 >nul
cls
echo You catch a Large instance!
pause>nul
cls
echo +21xp
set /a huntingxp = %huntingxp% + 21
pause>nul
cls
goto hunting
:2medium
if %huntingxp% LSS 3200 goto nexph
cls
echo You set the Medium Trap in the ground.
timeout /nobreak /t 2 >nul
cls
echo You set the Medium Trap in the ground..
timeout /nobreak /t 2 >nul
cls
echo You set the Medium Trap in the ground...
timeout /nobreak /t 2 >nul
cls
echo You catch two Medium instances!
pause>nul
cls
echo +28xp
set /a huntingxp = %huntingxp% + 28
pause>nul
cls
goto hunting
:2large
if %huntingxp% LSS 5000 goto nexph
cls
echo You set the Large Trap in the ground.
timeout /nobreak /t 2 >nul
cls
echo You set the Large Trap in the ground..
timeout /nobreak /t 2 >nul
cls
echo You set the Large Trap in the ground...
timeout /nobreak /t 2 >nul
cls
echo You catch two Large instances!
pause>nul
cls
echo +48xp
set /a huntingxp = %huntingxp% + 48
pause>nul
cls
goto hunting
:3medium
if %huntingxp% LSS 6300 goto nexph
cls
echo You set the Medium Trap in the ground.
timeout /nobreak /t 3 >nul
cls
echo You set the Medium Trap in the ground..
timeout /nobreak /t 3 >nul
cls
echo You set the Medium Trap in the ground...
timeout /nobreak /t 3 >nul
cls
echo You catch three Medium instances!
pause>nul
cls
echo +42xp
set /a huntingxp = %huntingxp% + 42
pause>nul
cls
goto hunting
:3large
if %huntingxp% LSS 8000 goto nexph
cls
echo You set the Large Trap in the ground.
timeout /nobreak /t 2 >nul
cls
echo You set the Large Trap in the ground..
timeout /nobreak /t 2 >nul
cls
echo You set the Large Trap in the ground...
timeout /nobreak /t 2 >nul
cls
echo You catch two Large instances!
pause>nul
cls
echo +72xp
set /a huntingxp = %huntingxp% + 72
pause>nul
cls
goto hunting
:nexph
cls
echo You don't have enough XP!
pause>nul
goto hunting
:alchemy
cls
set /a alchemylvl=%alchemyxp%/100
echo You have Level %alchemylvl% Alchemy!
echo.
echo (1) Craft Health Potion
echo (2) Back to Menu
echo (3) Claim Alchemy Reward!
set /p achoice=
if %achoice% == 1 goto chp
if %achoice% == 2 goto menu
if %achoice% == 3 goto alchreward
:chp
cls
echo Ingredients you need: (Don't ask me why these are the ingredients)
echo 2 Greenbars
echo 1 Cloth
echo.
echo Ingredients you have:
echo Greenbars: %greenbars%
echo Cloth: %cloth%
echo.
echo.
echo (1) Oops let me grab them!
echo (2) Alchemise Health Potion
set /p achoice2=
if %achoice2% == 1 goto menu
if %achoice2% == 2 goto alchemisehealthpotion
:alchemisehealthpotion
if %greenbars% LSS 2 goto negbars
if %cloth% LSS 1 goto neclothbro
cls
echo You take both ingredients and mix them...
pause>nul
cls
echo Mixing.
timeout /nobreak /t 1 >nul
cls
echo Mixing..
timeout /nobreak /t 1 >nul
cls
echo Mixing...
timeout /nobreak /t 1 >nul
cls
echo 1 Health potion added!
set /a potion = %potion% + 1
pause>nul
cls
echo +22xp
set /a alchemyxp = %alchemyxp% + 22
pause>nul
cls
goto alchemy
:negbars
cls
echo You don't have enough Green Bars! (Get them from Mining)
pause>nul
goto chp
:neclothbro
cls
cls
echo you don't have enough Cloth! (Shear a Sheep and take wool to spinning wheel)
pause>nul
goto chp
:drinkpotion
if %potion% LSS 1 goto nepotion
echo You drink the potion...
pause>nul
cls
echo Restores your health by 10,000!
set /a healthh = %healthh% + 10000
pause>nul
goto fight2
:nepotion
cls
echo You don't have any potions!
pause>nul
goto fight2
:huntingreward
if %huntingxp% LSS 8000 goto nexphuntreward
echo Congrats!
pause>nul
echo.
echo You have reached Level 80 in Hunting!
pause>nul
cls
echo You have recieved a Brown Hood! (Colored Hoods are RARE)
set /a brownhood = %brownhood% + 1
pause>nul
goto hunting
:nexphuntreward
cls
echo You're not a high enough level for that!
pause>nul
goto hunting
:alchreward
if %alchemyxp% LSS 8000 goto nexpalching
cls
echo Congrats!
pause>nul
echo.
echo You have reached Level 80 Alchemy!
pause>nul
cls
echo You recieve a Green Fire Cape!
set /a gfc = %gfc% + 1
pause>nul
cls
goto alchemy
:nexpalching
cls
echo You are not a high enough level!
pause>nul
cls
goto alchemy
:claimdragonhood
cls
echo You have claimed your Dragon Hood!
set /a dragonhood = %dragonhood% + 1
pause>nul
cls
goto menu
:construction
cls
set /a constructionlvl=%constructionxp%/100
echo Your Construction Level is %constructionlvl%
echo Your Logs: %log%
echo Your Iron: %ironore%
echo.
echo (1) Construct Shack
echo (2) Construct Barn (Level 10)
echo (3) Construct House (Level 26)
echo (4) Construct Large House (Level 40)
echo (5) Construct Mansion (Level 60)
echo (6) Construct Castle (Level 80)
echo (7) Claim Construction Reward!
echo (8) Back to Menu
set /p cchoice=
if %cchoice% == 1 goto shack
if %cchoice% == 2 goto barn
if %cchoice% == 3 goto house
if %cchoice% == 4 goto largehouse
if %cchoice% == 5 goto mansion
if %cchoice% == 6 goto castle
if %cchoice% == 7 goto constructionreward
if %cchoice% == 8 goto menu
:shack
cls
if %log% LSS 20 goto neclogs
echo You construct a Shack.
timeout /nobreak /t 1 >nul
cls
echo You construct a Shack..
timeout /nobreak /t 1 >nul
cls
echo You construct a Shack...
timeout /nobreak /t 1 >nul
cls
echo You have built a Shack!
pause>nul
cls
echo +18xp
set /a constructionxp = %constructionxp% + 18
pause>nul
goto construction
:barn
cls
if %log% LSS 40 goto neclogs
echo You construct a Barn.
timeout /nobreak /t 1 >nul
cls
echo You construct a Barn..
timeout /nobreak /t 1 >nul
cls
echo You construct a Barn...
timeout /nobreak /t 1 >nul
cls
echo You have built a Barn!
pause>nul
cls
echo +23xp
set /a constructionxp = %constructionxp% + 23
pause>nul
goto construction
:neclogs
cls
echo You doin't have enough logs!
pause>nul
goto construction
:house
cls
if %log% LSS 80 goto neclogs
echo You construct a House.
timeout /nobreak /t 2 >nul
cls
echo You construct a House..
timeout /nobreak /t 2 >nul
cls
echo You construct a House...
timeout /nobreak /t 2 >nul
cls
echo You have built a House!
pause>nul
cls
echo +18xp
set /a constructionxp = %constructionxp% + 18
pause>nul
goto construction
:largehouse
cls
if %log% LSS 100 goto neclogs
if %ironore% LSS 10 neciron
echo You construct a Large House.
timeout /nobreak /t 2 >nul
cls
echo You construct a Large House..
timeout /nobreak /t 2 >nul
cls
echo You construct a Large House...
timeout /nobreak /t 2 >nul
cls
echo You have built a Large House!
pause>nul
cls
echo +31xp
set /a constructionxp = %constructionxp% + 31
pause>nul
goto construction
:neciron
cls
echo You don't have enough Iron!
pause>nul
goto construction
:mansion
cls
if %log% LSS 120 goto neclogs
if %ironore% LSS 20 goto neciron
echo You construct a Mansion.
timeout /nobreak /t 3 >nul
cls
echo You construct a Mansion..
timeout /nobreak /t 3 >nul
cls
echo You construct a Mansion...
timeout /nobreak /t 3 >nul
cls
echo You have built a Mansion!
pause>nul
cls
echo +39xp
set /a constructionxp = %constructionxp% + 39
pause>nul
goto construction
:castle
cls
if %log% LSS 200 goto neclogs
if %ironore% LSS 50 goto neciron
echo You construct a Castle.
timeout /nobreak /t 1 >nul
cls
echo You construct a Castle..
timeout /nobreak /t 1 >nul
cls
echo You construct a Castle...
timeout /nobreak /t 1 >nul
cls
echo You have built a Castle!
pause>nul
cls
echo +50xp
set /a constructionxp = %constructionxp% + 50
pause>nul
goto construction
:constructionreward
cls
if %constructionxp% LSS 8000 goto nexpconstruction
echo Congrats!
pause>nul
echo.
echo You have reached Level 80 Construction!
pause>nul
cls
echo You have recieved a Legend Sword!
set /a legendsword = %legendsword% + 1
pause>nul
goto construction
:claimmastercape
cls
set /a totalxp=%miningxp%+%woodcuttingxp%+%constructionxp%+%fletchingxp%+%fishingxp%+%coodkingxp%+%alchemyxp%+%attackxp%+%huntingxp%
if %totalxp% LSS 72000 goto nemcxp
echo Congrats!
pause>nul
echo You have mastered skills all the way up to 72,000 XP! (That's ALOT)
pause>nul
cls
echo You have recieved the Master Cape!
set /a mastercape = %mastercape% + 1
pause>nul
goto menu
:nemcxp
cls
set /a totalxp=%miningxp%+%woodcuttingxp%+%constructionxp%+%fletchingxp%+%fishingxp%+%cookingxp%+%alchemyxp%+%attackxp%+%huntingxp%
echo You need 72,000 XP To get this cape
echo.
echo You have %totalxp% XP
pause>nul
goto menu
:fletching
cls
set /a fletchinglvl=%fletchingxp%/100
echo Your Fletching Level is: %fletchinglvl%
echo.
echo (1) Fletch Wood Bow - 3 Logs
echo (2) Fletch Oak Bow (Level 20) - 3 Oak Logs
echo (3) Fletch Green Bow (Level 40) - 3 Green Logs
echo (4) Fletch Red Bow (Level 60) - 3 Red Logs
echo (5) Fletch Dark Bow (Level 80) - 3 Dark Logs
echo (6) Back to menu
echo (7) Claim Fletching Reward!
set /p fletch=
if %fletch% == 1 goto fwoodbow
if %fletch% == 2 goto foakbow
if %fletch% == 3 goto fgreenbow
if %fletch% == 4 goto fredbow
if %fletch% == 5 goto fdarkbow
if %fletch% == 6 goto menu
if %fletch% == 7 goto fletchreward
:fwoodbow
cls
if %log% LSS 3 goto fnologs
echo Fletching.
timeout /t 1 >nul
cls
echo Fletching..
timeout /t 1 >nul
cls
echo Fletching...
timeout /t 1 >nul
cls
echo You fletch 1 Wood Bow!
echo.
echo +8 Fletching XP
set /a woodbow = %woodbow% + 1
set /a fletchingxp = %fletchingxp% + 8
set /a log = %log% - 3
pause>nul
cls
goto fletching
:foakbow
if %oaklog% LSS 3 goto fnologs
if %fletching% LSS 2000 goto fnoxp
echo Fletching.
timeout /t 1 >nul
cls
echo Fletching..
timeout /t 1 >nul
cls
echo Fletching...
timeout /t 1 >nul
cls
echo You fletch 1 Oak Bow!
echo.
echo +12 Fletching XP
set /a oakbow = %oakbow% + 1
set /a oaklog = %oaklog% - 3
set /a fletchingxp = %fletchingxp% + 12
pause>nul
cls
goto fletching
:fgreenbow
if %greenlog% LSS 3 goto fnologs
if %fletchingxp% LSS 4000 goto fnoxp
echo Fletching.
timeout /t 1 >nul
cls
echo Fletching..
timeout /t 1 >nul
cls
echo Fletching...
timeout /t 1 >nul
cls
echo You fletch 1 Green Bow!
echo.
echo +19 Fletching XP
set /a greenbow = %greenbow% + 1
set /a greenlog = %greenlog% - 3
set /a fletchingxp = %fletchingxp% + 19
pause>nul
cls
goto fletching
:fredbow
if %redlog% LSS 3 goto fnologs
if %fletchingxp% LSS 6000 goto fnoxp
echo Fletching.
timeout /t 1 >nul
cls
echo Fletching..
timeout /t 1 >nul
cls
echo Fletching...
timeout /t 1 >nul
cls
echo You fletch 1 Red Bow!
echo.
echo +22 Fletching XP
set /a redbow = %redbow% + 1
set /a redlog = %redlog% - 3
set /a fletchingxp = %fletchingxp% + 22
pause>nul
cls
goto fletching
:fdarkbow
if %darklog% LSS 3 goto fnologs
if %fletchingxp% LSS 8000 goto fnoxp
echo Fletching.
timeout /t 1 >nul
cls
echo Fletching..
timeout /t 1 >nul
cls
echo Fletching...
timeout /t 1 >nul
cls
echo You fletch 1 Dark Bow!
set /a darkbow = %darkbow% + 1
set /a darklog = %darklog% - 3
pause>nul
cls
goto fletching
:fnologs
cls
echo You don't have enough logs
pause>nul
cls
goto fletching
:fnoxp
cls
echo You are not a high enough level for that!
pause>Nul
cls
goto fletching
:fletchreward
cls
if %fletchingxp% LSS 8000 goto nefletchingxpforreward
echo Congrats on Level 80 Fletching!
pause>nul
echo.
echo You are rewarded with a Legend Bow!
set /a legendbow = %legendbow% + 1
pause>nul
cls
goto fletching
:nefletchingxpforreward
cls
echo You are not a high enough level!
pause>nul
cls
goto fletching