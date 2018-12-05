@echo off

::::BgetDescription#Text-based batch adventure rpg.
::::BgetAuthor#Brian
::::BgetCategory#game

mode con cols=160 lines=62
setlocal enabledelayedexpansion
color 0f
title FinalRealm by Brian


:entergame
cls
echo What would you like to do?
echo.
echo 1) Login
echo 2) Create Account
echo.
echo.
echo Current Version: v1.7_08
echo.
set /p login=
if %login% GEQ 3 goto entergame
if %login% EQU 1 goto login
if %login% EQU 2 goto createuser

:createuser
echo.
echo What would you like your Username to be?
set /p username1= 
set v1f=0


:checkforspaces
set x=!v1f!
set Letter%v1f%=!username1:~%x%,1!
if "!Letter%v1f%!" EQU " " (
echo.
echo.
echo Sorry you cant use spaces in your Username.
pause>nul
goto entergame
)
if NOT "!Letter%v1f%!" EQU "" (
set /a v1f=%v1f%+1
goto checkforspaces
)
echo.
echo What would you like your Password to be?
set /p password1= 
goto DATA_VALUES


:login
cls
set /p name1=Username: 
if not exist "%name1%.bat" (
echo That is not a valid Username.
pause>nul
goto entergame
)
set /p pass1=Password: 
call %name1%.bat
if not %password1% EQU %pass1% (
echo That is not a valid Password.
pause>nul
goto entergame
)
goto MENU


:DATA_VALUES
set acc1g=0
set acc1m=Open
set acc2g=0
set acc2m=Open
set acc3g=0
set acc3m=Open
set acc4g=0
set acc4m=Open
set acc5g=0
set acc5m=Open
set cost=--
set cost1=--
set gcho=--
set echo=--
set e2cho=--
set e1=--
set dmgnpc=0
set ls1=0
set killcount=0
set ls2=0
set la1=0
set la2=0
set hp=100
set orighp=100
set armtype=No
set swordtype=Your
set skind=hand
set buyword1=hi
set buyword2=hi
set curlvl=1
set aan=a
set bankgold=0
set destination=SAVE_GAME_FILES
set destination2=SAVE_GAME_FILES
set swordchoice=hi
set swordchoice2=hi
set swordchoice3=hi
set swordexist=hi
set sprice=0
set armchoice=hi
set armchoice2=Armor
set aprice=0
set playerxp=0
set xpuntil=500
set origxp=500
set money=100
set key=0
set damage=0
set dr=0
set gmail=0
set hbone=0
set dhide=0
set rtab=0
set food=0
set rfood=0
set bait=0
set ea=None
set potion=0
set ingot=0
set seed=0
set bow=0
set fur=0
set gem=0
set log=0
set ore=0
set morb=0
set arm1=0
set arm2=0
set arm3=0
set arm4=0
set arm5=0
set arm6=0
set arm7=0
set arm8=0
set arm9=0
set arm10=0
set arm11=0
set arm12=0
set ma1=0
set ma2=0
set ma3=0
set ma4=0
set ma5=0
set ma6=0
set ma7=0
set ma8=0
set ma9=0
set ma10=0
set ms1=0
set ms2=0
set ms3=0
set ms4=0
set ms5=0
set ms6=0
set ms7=0
set ms8=0
set ms9=0
set ms10=0
set sword1=0
set sword2=0
set sword3=0
set sword4=0
set sword5=0
set sword6=0
set sword7=0
set sword8=0
set sword9=0
set sword10=0
set sword11=0
set sword12=0
set axxx=0
set pgmail=300
set phbone=550
set pdhide=750
set prtab=250
set ppotion=200
set pfood=100
set pingot=473
set pseed=150
set prfood=100
set pbait=2
set pfur=200
set pore=500
set plog=275
set pgem=1000
set pbow=713
set pmorb=15000
set Woodcuttinglvl=1
set Woodcuttingxpremain=100
set Woodcuttingxpgain=38
set Woodcuttingcurxp=0
set Woodcuttingxpleft=100
set Cooklvl=1
set Cookxpremain=100
set Cookxpgain=41
set Cookcurxp=0
set Cookxpleft=100
set Fishinglvl=1
set Fishingxpremain=100
set Fishingxpgain=30
set Fishingcurxp=0
set Fishingxpleft=100
set Mininglvl=1
set Miningxpremain=100
set Miningxpgain=35
set Miningcurxp=0
set Miningxpleft=100
set Smithinglvl=1
set Smithingxpremain=100
set Smithingxpgain=33
set Smithingcurxp=0
set Smithingxpleft=100
set Thievinglvl=1
set Thievingxpremain=100
set Thievingxpgain=36
set Thievingcurxp=0
set Thievingxpleft=100
set ttllvl=13
goto SAVE_GAME_FILES





:MENU
color 0f
set /a ttllvl=%Woodcuttinglvl%+%Cooklvl%+%Fishinglvl%+%Thievinglvl%+%Mininglvl%+%Smithinglvl%
cls
title FinalRealm - Varrock
mode con cols=160 lines=62
cls
echo.
echo.
echo ษอออออออออออออออออออออออออออออป
echo บ What would you like to do?  บ
echo.ฬอออออออออออออออออออออออออออออน		
echo บ 1) Wander Gielinor          บ
echo.บ                             บ
echo บ 2) Weapon Shop              บ
echo.บ                             บ
echo บ 3) Armor Shop               บ
echo.บ                             บ
echo บ 4) Legend's Store           บ
echo.บ                             บ
echo บ 5) Trading Post             บ
echo.บ                             บ
echo บ 6) Max's Shop               บ
echo.บ                             บ
echo บ 7) Smuggler                 บ
echo.บ                             บ
echo บ 8) The Stronghold           บ
echo.บ                             บ
echo บ 9) Skill Plot               บ
echo.บ                             บ
echo บ 10) RealmBank               บ
echo.บ                             บ
echo บ 11) Quest Hall              บ
echo.บ                             บ
echo บ 97) Your Inventory          บ
echo ศอออออออออออออออออออออออออออออผ
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo ษอออออออออออออออออออออออออออออออออออออออป
echo   Currently logged in as %username1%.
echo.ฬอออออออออออออออออออออออออออออออออออออออน
echo บ 98) Settings                     	บ
echo บ 99) Log out                      	บ
echo ศอออออออออออออออออออออออออออออออออออออออผ
echo.
set /p x1=
if %x1% EQU 1 goto picknpc
if %x1% EQU 2 goto weaponstore
if %x1% EQU 3 goto Armorstore
if %x1% EQU 4 goto legendsstore
if %x1% EQU 5 goto gstore
if %x1% EQU 6 goto maxshopclosed
if %x1% EQU 7 goto smuggler
if %x1% EQU 8 goto STR_WARN
if %x1% EQU 9 goto skillplot
if %x1% EQU 10 goto BANK
if %x1% EQU 11 goto QUEST_MASTER
if %x1% EQU 97 goto checkitems
if %x1% EQU 98 goto settings
if %x1% EQU 99 goto entergame
goto MENU




:QUEST_MASTER
cls
echo.
echo Welcome to the Quest Hall^^!
echo.
echo Active Quests:
echo - Reach level 5
echo - Reach level 10
echo - Reach level 15
echo - Reach level 20
echo - Reach level 25
echo - Reach level 30
echo - Reach level 37
echo - Kill 10 Monsters
echo - Kill 50 Monsters
echo - Kill 100 Monsters
echo - Kill 250 Monsters
echo - Kill 500 Monsters
echo - Kill 1000 Monsters
echo.
echo Inactive Quests:
echo Complete Quests:
pause>nul
goto MENU




:BANK
title RealmBank
set destination1=BANK
cls
echo.
echo Welcome to RealmBank^^! Here are your accounts which you can store up to 1,000,000,000 (1B) gold into each.
echo.
echo อออออออออออออออออออออออออออออออ
echo  You have %money% gold.			
echo.อออออออออออออออออออออออออออออออ
echo       Account 1: %acc1m%			
echo          - Gold: %acc1g%				
echo.					
echo       Account 2: %acc2m%			
echo          - Gold: %acc2g%				
echo.					
echo       Account 3: %acc3m%			
echo          - Gold: %acc3g%				
echo.					
echo       Account 4: %acc4m%			
echo          - Gold: %acc4g%				
echo.					
echo       Account 5: %acc5m%			
echo          - Gold: %acc5g%				
echo อออออออออออออออออออออออออออออออ
echo.
echo Type "exit" to exit.
echo.
set /p a5=Acess account number: 
if %a5% EQU 1 (
set bankgold=acc1g
set bankfull=acc1m )
if %a5% EQU 2 (
set bankgold=acc2g
set bankfull=acc2m )
if %a5% EQU 3 (
set bankgold=acc3g
set bankfull=acc3m )
if %a5% EQU 4 (
set bankgold=acc4g
set bankfull=acc4m )
if %a5% EQU 5 (
set bankgold=acc5g
set bankfull=acc5m )
if %a5% EQU exit goto SAVE_GAME_FILES
goto depositwithdraw

:depositwithdraw
echo.
set /p a8=Deposit or withdraw [d/w]: 
if %a8% EQU d goto depositgoldintobank
if %a8% EQU w goto withdrawgoldfrombank

:depositgoldintobank
echo.
set /p a6=Amount of gold you would like to deposit ( "all" / [amount] ): 
if %a6% LEQ 0 goto BANK
if %a6% EQU all (
set /a %bankgold%=!%bankgold%!+%money%
if !%bankgold%! GEQ 1000000000 (
set /a money=!%bankgold%!-1000000000+%money%
set /a %bankgold%=1000000000
set %bankfull%=Closed )
set /a money=0
goto BANK )
if %a6% GTR %money% goto notenoughmoney
set /a %bankgold%=!%bankgold%!+%a6%
if !%bankgold%! GEQ 1000000000 (
set /a money=!%bankgold%!-1000000000+%money%
set /a %bankgold%=1000000000
set %bankfull%=Closed
goto BANK )
set /a money=%money%-%a6%
goto BANK

:withdrawgoldfrombank
echo.
set /p a7=Amount of gold you would like to withdraw ( "all" / [amount] ): 
if %a7% LEQ 0 goto BANK
if %a7% EQU all (
set /a money=%money%+!%bankgold%!
set /a %bankgold%=0
set %bankfull%=Open
goto BANK )
if %a7% GTR !%bankgold%! goto notenoughmoney
set /a %bankgold%=!%bankgold%!-%a7%
set /a money=%money%+%a7%
if !%bankgold%! LSS 1000000000 set %bankfull% EQU Open
goto BANK




:STR_WARN
color 0c
cls
echo.
echo WARNING:
echo.
echo THE STRONGHOLD IS VERY DANGEROUS. YOU WILL LOSE ALL YOUR ITEMS IF YOU ARE NOT PROPERLY PREPARED.
echo YOU WILL NOT BE ABLE TO FLEE OR ACESS YOUR INVENTORY DURING BATTLE, SO BE PREPARED WITH GOOD DEFENSES.
echo.
echo ARE YOU SURE YOU WISH TO CONTINUE?
echo.
echo.
echo 1) Yeah, after all, I am an adventurer.
echo 2) Maybe I should come back later...
echo.
set /p str1=
if %str1% EQU 1 goto STR_KC
if %str1% EQU 2 goto SAVE_GAME_FILES

:STR_KC
color 0f
set /a npc=%random% %% 3+1
if %npc% EQU 1 goto goblinstr
if %npc% EQU 2 goto giantstr
if %npc% EQU 3 goto ratstr

:goblinstr
set npctype=Mage
set /a level=110
set /a health=750
set /a xp=1000
goto FS1_STR

:ratstr
set npctype=Ranger
set /a level=111
set /a health=750
set /a xp=1000
goto FS1_STR

:giantstr
set npctype=Warrior
set /a level=108
set /a health=750
set /a xp=1000
goto FS1_STR


:FS1_STR
if %killcount% EQU 10 goto BOSS_FIGHT
mode con cols=160 lines=62
title FinalRealm - Stronghold
cls
echo.
echo You continue into the stronghold...
echo.
ping localhost -n 2 >nul
echo You encounter a level %level% %npctype%.
echo.
ping localhost -n 2 >nul
goto ATK_STR


:ATK_STR
if %swordtype% EQU Your set /a damage=%random%*50/32767+1
if %swordtype% EQU Wooden set /a damage=%random%*100/32767+1
if %swordtype% EQU Stone set /a damage=%random%*125/32767+1
if %swordtype% EQU Bronze set /a damage=%random%*150/32767+1
if %swordtype% EQU Iron set /a damage=%random%*175/32767+1
if %swordtype% EQU Steel set /a damage=%random%*200/32767+1
if %swordtype% EQU Gold set /a damage=%random%*225/32767+1
if %swordtype% EQU Crystal set /a damage=%random%*250/32767+1
if %swordtype% EQU Sacred set /a damage=%random%*275/32767+1
if %swordtype% EQU Runic set /a damage=%random%*300/32767+1
if %swordtype% EQU Infernal set /a damage=%random%*300/32767+1
if %swordtype% EQU Omega set /a damage=%random%*300/32767+1
if %swordtype% EQU Chaotic set /a damage=%random%*300/32767+1
if %swordtype% EQU Mythical set /a damage=%random%*450/32767+1
if %swordtype% EQU Alydril set /a damage=%random%*600/32767+1
if %damage% GTR %health% set /a damage=%health%
cls
echo.
echo **** Your Health: %hp% ***** %npctype%'s Health: %health% ***** Kill Count: %killcount% ****
echo.
echo.
echo You attack.
echo.
ping localhost -n 2 >nul
set /a atkxp=((%damage%/4)*3)
set /a playerxp=%playerxp%+%atkxp%
set /a xpuntil=%xpuntil%-%atkxp%
set /a health=%health% - %damage%
echo You deal %damage% damage to the %npctype%.
echo.
echo It now has %health% health left.
echo.
echo You gain %atkxp% EXP.
ping localhost -n 2 >nul
if %health% LEQ 0 goto CHECKFORLVL_STR
if %xpuntil% LEQ 0 set destination=FS3_STR
if %xpuntil% LEQ 0 goto levelup
goto FS3_STR


:FS3_STR
if %npctype% EQU Mage set /a dmgnpc=%random%*200/32767+1
if %npctype% EQU Ranger set /a dmgnpc=%random%*200/32767+1
if %npctype% EQU Warrior set /a dmgnpc=%random%*200/32767+1
if %armtype% EQU Cloth set /a dr=%random%*10/32767+1
if %armtype% EQU Chain set /a dr=%random%*20/32767+1
if %armtype% EQU Bronze set /a dr=%random%*40/32767+1
if %armtype% EQU Iron set /a dr=%random%*65/32767+1
if %armtype% EQU Steel set /a dr=%random%*100/32767+1
if %armtype% EQU Gold set /a dr=%random%*120/32767+1
if %armtype% EQU Crystal set /a dr=%random%*145/32767+1
if %armtype% EQU Sacred set /a dr=%random%*175/32767+1
if %armtype% EQU Runic set /a dr=%random%*200/32767+1
if %armtype% EQU Infernal set /a dr=%random%*215/32767+1
if %armtype% EQU Omega set /a dr=%random%*230/32767+1
if %armtype% EQU Chaotic set /a dr=%random%*250/32767+1
if %armtype% EQU Mythical set /a dr=%random%*275/32767+1
if %armtype% EQU Alydril set /a dr=%random%*300/32767+1
if %armtype% EQU Cloth set /a dmgnpc=%dmgnpc%-%dr%
if %armtype% EQU Chain set /a dmgnpc=%dmgnpc%-%dr%
if %armtype% EQU Bronze set /a dmgnpc=%dmgnpc%-%dr%
if %armtype% EQU Iron set /a dmgnpc=%dmgnpc%-%dr%
if %armtype% EQU Steel set /a dmgnpc=%dmgnpc%-%dr%
if %armtype% EQU Gold set /a dmgnpc=%dmgnpc%-%dr%
if %armtype% EQU Crystal set /a dmgnpc=%dmgnpc%-%dr%
if %armtype% EQU Sacred set /a dmgnpc=%dmgnpc%-%dr%
if %armtype% EQU Runic set /a dmgnpc=%dmgnpc%-%dr%
if %armtype% EQU Infernal set /a dmgnpc=%dmgnpc%-%dr%
if %armtype% EQU Omega set /a dmgnpc=%dmgnpc%-%dr%
if %armtype% EQU Chaotic set /a dmgnpc=%dmgnpc%-%dr%
if %armtype% EQU Mythical set /a dmgnpc=%dmgnpc%-%dr%
if %armtype% EQU Alydril set /a dmgnpc=%dmgnpc%-%dr%
if %dmgnpc% LEQ 0 set /a dmgnpc=0
mode con cols=160 lines=62
title FinalRealm - Stronghold
cls
echo.
echo **** Your Health: %hp% ***** %npctype%'s Health: %health% ***** Kill Count: %killcount% ****
echo.
echo.
echo The %npctype% attacks.
echo.
ping localhost -n 2 >nul
echo The %npctype% deals %dmgnpc% damage to you.
set /a hp=%hp% - %dmgnpc%
if %hp% LEQ 0 goto die
echo.
echo You now have %hp% health left.
ping localhost -n 2 >nul
goto ATK_STR


:CHECKFORLVL_STR
if %xpuntil% LEQ 0 set destination=FS3_STR
if %xpuntil% LEQ 0 goto levelup

:WIN_STR
set /a goldgain=%random%*1000/32767+1
set /a goldgain=%goldgain%+1000
set /a money=%money%+%goldgain%
cls
echo.
echo You won the battle against the %npctype%.
echo.
echo You gain %goldgain% gold.
echo.
pause>nul
set /a killcount=%killcount%+1
if %killcount% EQU 2 set /a hp=%orighp%
if %killcount% EQU 4 set /a hp=%orighp%
if %killcount% EQU 6 set /a hp=%orighp%
if %killcount% EQU 8 set /a hp=%orighp%
if %killcount% EQU 10 set /a hp=%orighp%
goto STR_KC



:BOSS_FIGHT
set /a hp=%orighp%
set npctype=Lacoyx
set /a level=741
set /a health=2780
set /a xp=5000
goto FS1_STR_B

:FS1_STR_B
mode con cols=160 lines=62
title FinalRealm - Stronghold
cls
echo.
echo You enter Lacoyx's throne room...
echo.
ping localhost -n 2 >nul
cls
echo.
echo ออออออออออออออออออออออออออออออออออออออออออออออออออออออออ
echo **** Your Health: %hp% ***** %npctype%'s Health: %health% ****
echo ออออออออออออออออออออออออออออออออออออออออออออออออออออออออ
echo.
echo.
echo You encounter %npctype%, a level %level% War Commander.
echo.
ping localhost -n 2 >nul
goto ATK_STR_3


:ATK_STR_3
if %swordtype% EQU Your set /a damage=%random%*50/32767+1
if %swordtype% EQU Wooden set /a damage=%random%*100/32767+1
if %swordtype% EQU Stone set /a damage=%random%*125/32767+1
if %swordtype% EQU Bronze set /a damage=%random%*150/32767+1
if %swordtype% EQU Iron set /a damage=%random%*175/32767+1
if %swordtype% EQU Steel set /a damage=%random%*200/32767+1
if %swordtype% EQU Gold set /a damage=%random%*225/32767+1
if %swordtype% EQU Crystal set /a damage=%random%*250/32767+1
if %swordtype% EQU Sacred set /a damage=%random%*275/32767+1
if %swordtype% EQU Runic set /a damage=%random%*300/32767+1
if %swordtype% EQU Infernal set /a damage=%random%*300/32767+1
if %swordtype% EQU Omega set /a damage=%random%*300/32767+1
if %swordtype% EQU Chaotic set /a damage=%random%*300/32767+1
if %swordtype% EQU Mythical set /a damage=%random%*450/32767+1
if %swordtype% EQU Alydril set /a damage=%random%*600/32767+1
if %damage% GTR %health% set /a damage=%health%
cls
echo.
echo ออออออออออออออออออออออออออออออออออออออออออออออออออออออออ
echo **** Your Health: %hp% ***** %npctype%'s Health: %health% ****
echo ออออออออออออออออออออออออออออออออออออออออออออออออออออออออ
echo.
echo.
echo You attack.
echo.
ping localhost -n 2 >nul
set /a atkxp=((%damage%/4)*3)
set /a playerxp=%playerxp%+%atkxp%
set /a xpuntil=%xpuntil%-%atkxp%
set /a health=%health% - %damage%
echo You deal %damage% damage to the %npctype%.
echo.
echo It now has %health% health left.
echo.
echo You gain %atkxp% EXP.
ping localhost -n 2 >nul
if %curlvl% GEQ 37 set /a xpuntil=1
if %playerxp% GEQ 1000000 set /a playerxp=1000000
if %health% LEQ 0 goto CHECKFORLVL_STR_B
if %xpuntil% LEQ 0 set destination=FS_STR_3
if %xpuntil% LEQ 0 goto levelup
goto FS_STR_3


:FS_STR_3
if %npctype% EQU Lacoyx set /a dmgnpc=%random%*600/32767+1
if %armtype% EQU Cloth set /a dr=%random%*10/32767+1
if %armtype% EQU Chain set /a dr=%random%*20/32767+1
if %armtype% EQU Bronze set /a dr=%random%*40/32767+1
if %armtype% EQU Iron set /a dr=%random%*65/32767+1
if %armtype% EQU Steel set /a dr=%random%*100/32767+1
if %armtype% EQU Gold set /a dr=%random%*120/32767+1
if %armtype% EQU Crystal set /a dr=%random%*145/32767+1
if %armtype% EQU Sacred set /a dr=%random%*175/32767+1
if %armtype% EQU Runic set /a dr=%random%*200/32767+1
if %armtype% EQU Infernal set /a dr=%random%*215/32767+1
if %armtype% EQU Omega set /a dr=%random%*230/32767+1
if %armtype% EQU Chaotic set /a dr=%random%*250/32767+1
if %armtype% EQU Mythical set /a dr=%random%*275/32767+1
if %armtype% EQU Alydril set /a dr=%random%*300/32767+1
if %armtype% EQU Cloth set /a dmgnpc=%dmgnpc%-%dr%
if %armtype% EQU Chain set /a dmgnpc=%dmgnpc%-%dr%
if %armtype% EQU Bronze set /a dmgnpc=%dmgnpc%-%dr%
if %armtype% EQU Iron set /a dmgnpc=%dmgnpc%-%dr%
if %armtype% EQU Steel set /a dmgnpc=%dmgnpc%-%dr%
if %armtype% EQU Gold set /a dmgnpc=%dmgnpc%-%dr%
if %armtype% EQU Crystal set /a dmgnpc=%dmgnpc%-%dr%
if %armtype% EQU Sacred set /a dmgnpc=%dmgnpc%-%dr%
if %armtype% EQU Runic set /a dmgnpc=%dmgnpc%-%dr%
if %armtype% EQU Infernal set /a dmgnpc=%dmgnpc%-%dr%
if %armtype% EQU Omega set /a dmgnpc=%dmgnpc%-%dr%
if %armtype% EQU Chaotic set /a dmgnpc=%dmgnpc%-%dr%
if %armtype% EQU Mythical set /a dmgnpc=%dmgnpc%-%dr%
if %armtype% EQU Alydril set /a dmgnpc=%dmgnpc%-%dr%
if %dmgnpc% LEQ 0 set /a dmgnpc=0
mode con cols=160 lines=62
title FinalRealm - Stronghold
cls
echo.
echo ออออออออออออออออออออออออออออออออออออออออออออออออออออออออ
echo **** Your Health: %hp% ***** %npctype%'s Health: %health% ****
echo ออออออออออออออออออออออออออออออออออออออออออออออออออออออออ
echo.
echo.
echo %npctype% attacks.
echo.
ping localhost -n 2 >nul
echo %npctype% deals %dmgnpc% damage to you.
set /a hp=%hp% - %dmgnpc%
if %hp% LEQ 0 goto die
echo.
echo You now have %hp% health left.
ping localhost -n 2 >nul
goto ATK_STR_3


:CHECKFORLVL_STR_B
if %xpuntil% LEQ 0 set destination=FS_STR_3
if %xpuntil% LEQ 0 goto levelup


:WIN_STR_B
cls
echo.
echo You won the battle against %npctype%.
echo.
echo You recieved an Omega Maul.
echo You recieved Runic Armor.
echo You have gained %xp% Experience.
set /a sword11=%sword11%+1
set /a arm9=%arm9%+1
set /a killcount=0
set /a playerxp=%playerxp%+%xp%
set /a xpuntil=%xpuntil%-%xp%
echo.
pause>nul
set /a hp=%orighp%
if %xpuntil% LEQ 0 set destination=SAVE_GAME_FILES
if %xpuntil% LEQ 0 goto levelup
goto SAVE_GAME_FILES



:smuggler
title FinalRealm - Smuggler
cls
echo.
echo Smuggler:
echo.
echo Hello %username1%, what can I do for you?
echo.
ping localhost -n 2 >nul
echo 1) Who are you?
echo 2) What do you have for trade?
echo 3) Walk away
echo.
set /p s1=
if %s1% EQU 1 goto whoissmuggler
if %s1% EQU 2 goto tradesmuggler
if %s1% EQU 3 goto SAVE_GAME_FILES

:whoissmuggler
cls
echo.
echo %username1%:
echo.
echo Who are you?
echo.
ping localhost -n 2 >nul
echo.
echo Smuggler:
echo.
echo I am the Smuggler. I will buy your swords and armor off of you for a small amount.
echo.
pause>nul
goto smuggler

:tradesmuggler
cls
set /a numArmor=%arm1%+%arm2%+%arm3%+%arm4%+%arm5%+%arm6%+%arm7%+%arm8%+%arm9%+%arm10%+%arm11%+%arm12%
set /a numswords=%sword1%+%sword2%+%sword3%+%sword4%+%sword5%+%sword6%+%sword7%+%sword8%+%sword9%+%sword10%+%sword11%+%sword12%
echo.
echo You currently have %numswords% swords.
echo You currently have a %swordtype% %skind% equipped.
echo You currently have %numArmor% pieces of Armor.
echo You currently have %armtype% Armor equipped.
echo.
echo Select an item to sell, or type "back" to go back.
echo.
echo Weapons:
echo s1) Wooden Sword: %sword1%
echo s2) Stone Sword: %sword2%
echo s3) Bronze Sword: %sword3%
echo s4) Iron Sword: %sword4%
echo s5) Steel Sword: %sword5%
echo s6) Gold Sword: %sword6%
echo s7) Crystal Sword: %sword7%
echo s8) Sacred Blade: %sword8%
echo s9) Runic Sword: %sword9%
echo s10) Infernal Rapier: %sword10%
echo s11) Omega Maul: %sword11%
echo s12) Chaotic Spear: %sword12%
echo s13) Mythical Godsword: %ls1%
echo s14) Alydril Godsword: %ls2%
echo.
echo.
echo Armor:
echo a1) Cloth Armor: %arm1%
echo a2) Chain Armor: %arm2%
echo a3) Bronze Armor: %arm3%
echo a4) Iron Armor: %arm4%
echo a5) Steel Armor: %arm5%
echo a6) Gold Armor: %arm6%
echo a7) Crystal Armor: %arm7%
echo a8) Sacred Armor: %arm8%
echo a9) Runic Armor: %arm9%
echo a10) Infernal Armor: %arm10%
echo a11) Omega Armor: %arm11%
echo a12) Chaotic Armor: %arm12%
echo a13) Mythical Amour: %la1%
echo a14) Alydril Armor: %la2%
echo.
set /p s2=
if %s2% EQU s1 set swordchoice=Wooden
if %s2% EQU s1 set swordchoice2=Sword
if %s2% EQU s2 set swordchoice=Stone
if %s2% EQU s2 set swordchoice2=Sword
if %s2% EQU s3 set swordchoice=Bronze
if %s2% EQU s3 set swordchoice2=Sword
if %s2% EQU s4 set swordchoice=Iron
if %s2% EQU s4 set swordchoice2=Sword
if %s2% EQU s5 set swordchoice=Steel
if %s2% EQU s5 set swordchoice2=Sword
if %s2% EQU s6 set swordchoice=Gold
if %s2% EQU s6 set swordchoice2=Sword
if %s2% EQU s7 set swordchoice=Crystal
if %s2% EQU s7 set swordchoice2=Sword
if %s2% EQU s8 set swordchoice=Sacred
if %s2% EQU s8 set swordchoice2=Blade
if %s2% EQU s9 set swordchoice=Runic
if %s2% EQU s9 set swordchoice2=Sword
if %s2% EQU s10 set swordchoice=Infernal
if %s2% EQU s10 set swordchoice2=Rapier
if %s2% EQU s11 set swordchoice=Omega
if %s2% EQU s11 set swordchoice2=Maul
if %s2% EQU s12 set swordchoice=Chaotic
if %s2% EQU s12 set swordchoice2=Spear
if %s2% EQU s13 set swordchoice=Mythical
if %s2% EQU s13 set swordchoice2=Godsword
if %s2% EQU s14 set swordchoice=Alydril
if %s2% EQU s14 set swordchoice2=Godsword
if %s2% EQU s1 set swordexist=%sword1%
if %s2% EQU s2 set swordexist=%sword2%
if %s2% EQU s3 set swordexist=%sword3%
if %s2% EQU s4 set swordexist=%sword4%
if %s2% EQU s5 set swordexist=%sword5%
if %s2% EQU s6 set swordexist=%sword6%
if %s2% EQU s7 set swordexist=%sword7%
if %s2% EQU s8 set swordexist=%sword8%
if %s2% EQU s9 set swordexist=%sword9%
if %s2% EQU s10 set swordexist=%sword10%
if %s2% EQU s11 set swordexist=%sword11%
if %s2% EQU s12 set swordexist=%sword12%
if %s2% EQU s13 set swordexist=%ls1%
if %s2% EQU s14 set swordexist=%ls2%
if %s2% EQU s1 set swordexist2=sword1
if %s2% EQU s2 set swordexist2=sword2
if %s2% EQU s3 set swordexist2=sword3
if %s2% EQU s4 set swordexist2=sword4
if %s2% EQU s5 set swordexist2=sword5
if %s2% EQU s6 set swordexist2=sword6
if %s2% EQU s7 set swordexist2=sword7
if %s2% EQU s8 set swordexist2=sword8
if %s2% EQU s9 set swordexist2=sword9
if %s2% EQU s10 set swordexist2=sword10
if %s2% EQU s11 set swordexist2=sword11
if %s2% EQU s12 set swordexist2=sword12
if %s2% EQU s13 set swordexist2=ls1
if %s2% EQU s14 set swordexist2=ls2
if %s2% EQU back goto declinesmug
if %swordchoice% EQU Wooden set /a sprice=50
if %swordchoice% EQU Stone set /a sprice=125
if %swordchoice% EQU Bronze set /a sprice=250
if %swordchoice% EQU Iron set /a sprice=500
if %swordchoice% EQU Steel set /a sprice=1250
if %swordchoice% EQU Gold set /a sprice=2500
if %swordchoice% EQU Crystal set /a sprice=5000
if %swordchoice% EQU Sacred set /a sprice=12500
if %swordchoice% EQU Runic set /a sprice=25000
if %swordchoice% EQU Infernal set /a sprice=25000
if %swordchoice% EQU Omega set /a sprice=25000
if %swordchoice% EQU Chaotic set /a sprice=25000
if %swordchoice% EQU Mythical set /a sprice=750000
if %swordchoice% EQU Alydril set /a sprice=1500000
if %s2% EQU a1 set swordchoice=Cloth
if %s2% EQU a1 set swordchoice2=Armor
if %s2% EQU a2 set swordchoice=Chain
if %s2% EQU a2 set swordchoice2=Armor
if %s2% EQU a3 set swordchoice=Bronze
if %s2% EQU a3 set swordchoice2=Armor
if %s2% EQU a4 set swordchoice=Iron
if %s2% EQU a4 set swordchoice2=Armor
if %s2% EQU a5 set swordchoice=Steel
if %s2% EQU a5 set swordchoice2=Armor
if %s2% EQU a6 set swordchoice=Gold
if %s2% EQU a6 set swordchoice2=Armor
if %s2% EQU a7 set swordchoice=Crystal
if %s2% EQU a7 set swordchoice2=Armor
if %s2% EQU a8 set swordchoice=Sacred
if %s2% EQU a8 set swordchoice2=Armor
if %s2% EQU a9 set swordchoice=Runic
if %s2% EQU a9 set swordchoice2=Armor
if %s2% EQU a10 set swordchoice=Infernal
if %s2% EQU a10 set swordchoice2=Armor
if %s2% EQU a11 set swordchoice=Omega
if %s2% EQU a11 set swordchoice2=Armor
if %s2% EQU a12 set swordchoice=Chaotic
if %s2% EQU a12 set swordchoice2=Armor
if %s2% EQU a13 set swordchoice=Mythical
if %s2% EQU a13 set swordchoice2=Armor
if %s2% EQU a14 set swordchoice=Alydril
if %s2% EQU a14 set swordchoice2=Armor
if %s2% EQU a1 set swordexist=%arm1%
if %s2% EQU a2 set swordexist=%arm2%
if %s2% EQU a3 set swordexist=%arm3%
if %s2% EQU a4 set swordexist=%arm4%
if %s2% EQU a5 set swordexist=%arm5%
if %s2% EQU a6 set swordexist=%arm6%
if %s2% EQU a7 set swordexist=%arm7%
if %s2% EQU a8 set swordexist=%arm8%
if %s2% EQU a9 set swordexist=%arm9%
if %s2% EQU a10 set swordexist=%arm10%
if %s2% EQU a11 set swordexist=%arm11%
if %s2% EQU a12 set swordexist=%arm12%
if %s2% EQU a13 set swordexist=%la1%
if %s2% EQU a14 set swordexist=%la2%
if %s2% EQU a1 set swordexist2=arm1
if %s2% EQU a2 set swordexist2=arm2
if %s2% EQU a3 set swordexist2=arm3
if %s2% EQU a4 set swordexist2=arm4
if %s2% EQU a5 set swordexist2=arm5
if %s2% EQU a6 set swordexist2=arm6
if %s2% EQU a7 set swordexist2=arm7
if %s2% EQU a8 set swordexist2=arm8
if %s2% EQU a9 set swordexist2=arm9
if %s2% EQU a10 set swordexist2=arm10
if %s2% EQU a11 set swordexist2=arm11
if %s2% EQU a12 set swordexist2=arm12
if %s2% EQU a13 set swordexist2=la1
if %s2% EQU a14 set swordexist2=la2
if %swordchoice2% EQU Armor goto sellarmtosmug
goto selltosmug

:sellarmtosmug
if %swordchoice% EQU Cloth set /a sprice=75
if %swordchoice% EQU Chain set /a sprice=150
if %swordchoice% EQU Bronze set /a sprice=400
if %swordchoice% EQU Iron set /a sprice=750
if %swordchoice% EQU Steel set /a sprice=1500
if %swordchoice% EQU Gold set /a sprice=2500
if %swordchoice% EQU Crystal set /a sprice=5000
if %swordchoice% EQU Sacred set /a sprice=7500
if %swordchoice% EQU Runic set /a sprice=12500
if %swordchoice% EQU Infernal set /a sprice=20000
if %swordchoice% EQU Omega set /a sprice=40000
if %swordchoice% EQU Chaotic set /a sprice=50000
if %swordchoice% EQU Mythical set /a sprice=1000000
if %swordchoice% EQU Alydril set /a sprice=1750000
goto selltosmug

:selltosmug
if %swordexist% EQU 0 goto donthaveitem
cls
echo.
echo Smuggler:
echo.
echo Ah, the %swordchoice% %swordchoice2%. Thats a nice piece of metal. Tell ya what.
echo I'll buy it off of you for %sprice% gold. Deal?
echo.
ping localhost -n 2 >nul
echo 1) Deal.
echo 2) No thanks.
set /p s3=
if %s3% EQU 1 goto accepttradesmug
if %s3% EQU 2 goto declinesmug

:accepttradesmug
set /a %swordexist2%=%swordexist%-1
set /a money=%money%+%sprice%
cls
echo.
echo.
echo You sell the %swordchoice% %swordchoice2% for %sprice% gold.
echo.
pause>nul
cls
echo.
echo Smuggler:
echo.
echo It's a please doin' business with ya.
echo.
pause>nul
goto smuggler

:declinesmug
cls
echo.
echo Smuggler:
echo.
echo Maybe next time, eh?
echo.
pause>nul
goto smuggler

:donthaveitem
echo.
echo.
echo You don't have that item.
echo.
pause>nul
goto tradesmuggler


:picknpc
set /a npc=%random% %% 13+1
if %npc% EQU 1 set npctype=Goblin
if %npc% EQU 2 set npctype=Giant
if %npc% EQU 3 set npctype=Dragon
if %npc% EQU 4 set npctype=Mage
if %npc% EQU 5 set npctype=Sorcerer
if %npc% EQU 6 set npctype=Human
if %npc% EQU 7 set npctype=Farmer
if %npc% EQU 8 set npctype=Bear
if %npc% EQU 9 set npctype=Rockbeast
if %npc% EQU 10 set npctype=Ent
if %npc% EQU 11 set npctype=Theif
if %npc% EQU 12 set npctype=Elemental
if %npc% EQU 13 set npctype=Rat

:BATTLE_VARIABLES
set health=0
if %curlvl% LEQ 5 (
set /a health=%random% %% 100 + 75
set /a level=%random% %% 4 + 1
goto F_START )
if %curlvl% LEQ 10 (
set /a health=%random% %% 100 + 200
set /a level=%random% %% 5 + 5
goto F_START )
if %curlvl% LEQ 15 (
set /a health=%random% %% 100 + 350
set /a level=%random% %% 5 + 10
goto F_START )
if %curlvl% LEQ 20 (
set /a health=%random% %% 100 + 500
set /a level=%random% %% 5 + 15
goto F_START )
if %curlvl% LEQ 25 (
set /a health=%random% %% 100 + 625
set /a level=%random% %% 7 + 20
goto F_START )
if %curlvl% LEQ 30 (
set /a health=%random% %% 100 + 750
set /a level=%random% %% 10 + 25
goto F_START )
if %curlvl% LEQ 37 (
set /a health=%random% %% 100 + 900
set /a level=%random% %% 15 + 30
goto F_START )


:F_START
mode con cols=160 lines=62
title FinalRealm - Fighting
cls
echo.
echo You are wandering Gielinor...
echo.
ping localhost -n 2 >nul
echo You encounter a level %level% %npctype%.
ping localhost -n 2 >nul
goto fs1


:fs1
cls
echo.
echo ออออออออออออออออออออออออออออออออออออออออออออออออออออออออ
echo **** Your Health: %hp% ***** %npctype%'s Health: %health% ****
echo ออออออออออออออออออออออออออออออออออออออออออออออออออออออออ
echo.
echo.
echo What would you like to do?
echo.
echo 1) Attack^^!
echo 2) Inventory
echo 3) Flee^^!
echo.
set /p atkcho=
if %atkcho% EQU 1 goto atk
if %atkcho% EQU 2 goto fightinginventory
if %atkcho% EQU 3 goto flee


:atk
if %swordtype% EQU Your set /a damage=%random%*50/32767+1
if %swordtype% EQU Wooden set /a damage=%random%*100/32767+1
if %swordtype% EQU Stone set /a damage=%random%*125/32767+1
if %swordtype% EQU Bronze set /a damage=%random%*150/32767+1
if %swordtype% EQU Iron set /a damage=%random%*175/32767+1
if %swordtype% EQU Steel set /a damage=%random%*200/32767+1
if %swordtype% EQU Gold set /a damage=%random%*225/32767+1
if %swordtype% EQU Crystal set /a damage=%random%*250/32767+1
if %swordtype% EQU Sacred set /a damage=%random%*275/32767+1
if %swordtype% EQU Runic set /a damage=%random%*300/32767+1
if %swordtype% EQU Infernal set /a damage=%random%*300/32767+1
if %swordtype% EQU Omega set /a damage=%random%*300/32767+1
if %swordtype% EQU Chaotic set /a damage=%random%*300/32767+1
if %swordtype% EQU Mythical set /a damage=%random%*450/32767+1
if %swordtype% EQU Alydril set /a damage=%random%*600/32767+1
if %damage% GTR %health% set /a damage=%health%
cls
echo.
echo ออออออออออออออออออออออออออออออออออออออออออออออออออออออออ
echo **** Your Health: %hp% ***** %npctype%'s Health: %health% ****
echo ออออออออออออออออออออออออออออออออออออออออออออออออออออออออ
echo.
echo.
echo You attack^^!
echo.
ping localhost -n 2 >nul
set /a atkxp=((%damage%/4)*3)
set /a playerxp=%playerxp%+%atkxp%
set /a xpuntil=%xpuntil%-%atkxp%
set /a health=%health% - %damage%
echo You deal %damage% damage to the %npctype%^^!
echo.
echo It now has %health% health left.
echo.
echo You gain %atkxp% EXP.
pause>nul
if %curlvl% GEQ 37 set /a xpuntil=1
if %playerxp% GEQ 1000000 set /a playerxp=1000000
if %health% LEQ 0 goto checkiflvlup
if %xpuntil% LEQ 0 set destination=fs3
if %xpuntil% LEQ 0 goto levelup
goto fs3


:fs3
if %npctype% EQU Rat set /a dmgnpc=%random%*53/32767+1
if %npctype% EQU Goblin set /a dmgnpc=%random%*30/32767+1
if %npctype% EQU Giant set /a dmgnpc=%random%*60/32767+1
if %npctype% EQU Dragon set /a dmgnpc=%random%*90/32767+1
if %npctype% EQU Mage set /a dmgnpc=%random%*120/32767+1
if %npctype% EQU Sorcerer set /a dmgnpc=%random%*150/32767+1
if %npctype% EQU Human set /a dmgnpc=%random%*50/32767+1
if %npctype% EQU Farmer set /a dmgnpc=%random%*85/32767+1
if %npctype% EQU Bear set /a dmgnpc=%random%*183/32767+1
if %npctype% EQU Rocktor set /a dmgnpc=%random%*240/32767+1
if %npctype% EQU Ent set /a dmgnpc=%random%*300/32767+1
if %npctype% EQU Theif set /a dmgnpc=%random%*330/32767+1
if %npctype% EQU Elemental set /a dmgnpc=%random%*360/32767+1
if %armtype% EQU Cloth set /a dr=%random%*10/32767+1
if %armtype% EQU Chain set /a dr=%random%*20/32767+1
if %armtype% EQU Bronze set /a dr=%random%*40/32767+1
if %armtype% EQU Iron set /a dr=%random%*65/32767+1
if %armtype% EQU Steel set /a dr=%random%*100/32767+1
if %armtype% EQU Gold set /a dr=%random%*120/32767+1
if %armtype% EQU Crystal set /a dr=%random%*145/32767+1
if %armtype% EQU Sacred set /a dr=%random%*175/32767+1
if %armtype% EQU Runic set /a dr=%random%*200/32767+1
if %armtype% EQU Infernal set /a dr=%random%*215/32767+1
if %armtype% EQU Omega set /a dr=%random%*230/32767+1
if %armtype% EQU Chaotic set /a dr=%random%*250/32767+1
if %armtype% EQU Mythical set /a dr=%random%*275/32767+1
if %armtype% EQU Alydril set /a dr=%random%*300/32767+1
if %armtype% EQU Cloth set /a dmgnpc=%dmgnpc%-%dr%
if %armtype% EQU Chain set /a dmgnpc=%dmgnpc%-%dr%
if %armtype% EQU Bronze set /a dmgnpc=%dmgnpc%-%dr%
if %armtype% EQU Iron set /a dmgnpc=%dmgnpc%-%dr%
if %armtype% EQU Steel set /a dmgnpc=%dmgnpc%-%dr%
if %armtype% EQU Gold set /a dmgnpc=%dmgnpc%-%dr%
if %armtype% EQU Crystal set /a dmgnpc=%dmgnpc%-%dr%
if %armtype% EQU Sacred set /a dmgnpc=%dmgnpc%-%dr%
if %armtype% EQU Runic set /a dmgnpc=%dmgnpc%-%dr%
if %armtype% EQU Infernal set /a dmgnpc=%dmgnpc%-%dr%
if %armtype% EQU Omega set /a dmgnpc=%dmgnpc%-%dr%
if %armtype% EQU Chaotic set /a dmgnpc=%dmgnpc%-%dr%
if %armtype% EQU Mythical set /a dmgnpc=%dmgnpc%-%dr%
if %armtype% EQU Alydril set /a dmgnpc=%dmgnpc%-%dr%
if %dmgnpc% LEQ 0 set /a dmgnpc=0
mode con cols=160 lines=62
title FinalRealm - Fighting
cls
echo.
echo ออออออออออออออออออออออออออออออออออออออออออออออออออออออออ
echo **** Your Health: %hp% ***** %npctype%'s Health: %health% ****
echo ออออออออออออออออออออออออออออออออออออออออออออออออออออออออ
echo.
echo.
echo The %npctype% attacks.
echo.
ping localhost -n 2 >nul
echo The %npctype% deals %dmgnpc% damage to you.
set /a hp=%hp% - %dmgnpc%
if %hp% LEQ 0 goto die
echo.
echo You now have %hp% health left.
pause>nul
goto fs1


:checkiflvlup
if %xpuntil% LEQ 0 set destination=dropitem
if %xpuntil% LEQ 0 goto levelup



:dropitem
if %npctype% EQU Goblin goto goblindrop
if %npctype% EQU Giant goto giantdrop
if %npctype% EQU Dragon goto dragondrop
if %npctype% EQU Mage goto magedrop
if %npctype% EQU Sorcerer goto sorcererdrop
if %npctype% EQU Human goto humandrop
if %npctype% EQU Farmer goto farmerdrop
if %npctype% EQU Bear goto beardrop
if %npctype% EQU Rockbeast goto rockbeastdrop
if %npctype% EQU Ent goto entdrop
if %npctype% EQU Theif goto theifdrop
if %npctype% EQU Elemental goto elementaldrop
if %npctype% EQU Rat goto beardrop


:goblindrop
set word=a
set /a gmail=%gmail%+1
set drop=Goblin Mail
goto win

:giantdrop
set word=3
set /a hbone=%hbone%+3
set drop=Huge Bones
goto win

:dragondrop
set word=3
set /a dhide=%dhide%+3
set drop=Dragon Hides
goto win

:magedrop
set word=2
set /a rtab=%rtab%+2
set drop=Runic Tablets
goto win

:sorcererdrop
set word=2
set /a potion=%potion%+2
set drop=Potions
goto win

:humandrop
set word=2
set /a food=%food%+2
set drop=Food
goto win

:farmerdrop
set word=4
set /a seed=%seed%+4
set drop=Seeds
goto win

:beardrop
set word=5
set /a fur=%fur%+5
set drop=Fur
goto win

:rockbeastdrop
set word=6
set /a ore=%ore%+6
set drop=Ore
goto win

:entdrop
set word=10
set /a log=%log%+10
set drop=Logs
goto win

:theifdrop
set word=5
set /a gem=%gem%+5
set drop=Gemstones
goto win

:elementaldrop
set word=5
set /a morb=%morb%+5
set drop=Magic Orbs
goto win


:levelup
set /a curlvl=%curlvl%+1
set /a origxp=%origxp%+500
set /a xpuntil=%xpuntil%+%origxp%
set /a orighp=%orighp%+25
set /a hp=%orighp%
echo.
echo.
echo You have leveled up. You are now level %curlvl%.
echo You now have %hp% health.
echo.
pause>nul
goto %destination%


:win
cls
echo.
echo You won the battle against the %npctype%.
echo.
echo You recieved %word% %drop%.
echo.
pause>nul
set /a hp=%orighp%
goto SAVE_GAME_FILES

:die
cls
echo.
echo You died.
echo.
pause>nul
set /a killcount=0
set /a hp=%orighp%
goto SAVE_GAME_FILES

:flee
cls
echo.
echo You flee from the battle.
echo.
pause>nul
goto SAVE_GAME_FILES


:fightinginventory
title FinalRealm - Inventory
mode con cols=160 lines=62
set destination2=fightinginventory
cls
if %hp% GTR 1000 set /a hp=1000
if %curlvl% GTR 37 set /a curlvl=37
if %curlvl% GEQ 37 set xpuntil=None^^!
if %money% GTR 5000000 set /a money=5000000
if %playerxp% GTR 1000000 set /a playerxp=1000000
echo FinalRealm - Inventory
echo.
echo ษออออออออออออออออออออออออออออออออออออออออออออออออป
echo บ Health: %hp%					 บ
echo บ Level: %curlvl%					 บ
echo บ Gold: %money%					 บ
echo บ EXP: %playerxp%					 บ
echo บ EXP until next level: %xpuntil%			 บ
echo บ Total level: %ttllvl%				 บ
echo บ Weapon: %swordtype% %skind%		 	 บ
echo บ Armor: %armtype% Armor			 	 บ
echo ฬออออออออออออออออออออออหอออออออออออออออออออออออออน
echo บ Items:	       บ
echo บ Bait: %bait%	       บ Gemstones: %gem%
echo บ Seeds: %seed%	       บ Magic Orbs: %morb%
echo บ Furs: %fur%	       บ Raw Food: %rfood%
echo บ Ore: %ore%	       บ Huge Bones: %hbone%
echo บ Logs: %log%	       บ Dragon Hides: %dhide%
echo บ Food: %food%	       บ Runic Tablets: %rtab%
echo บ Ingots: %ingot%	       บ Goblin Mails: %gmail%
echo บ Potions: %potion%	       บ Bows: %bow%
echo ฬออออออออออออออออออออออฮอออออออออออออออออออออออออน
echo บ Weapons:             บ Armor:
echo บ Wooden Sword: %sword1%      บ Cloth Armor: %arm1%
echo บ Stone Sword: %sword2%       บ Chain Armor: %arm2%
echo บ Bronze Sword: %sword3%      บ Bronze Armor: %arm3%
echo บ Iron Sword: %sword4%        บ Iron Armor: %arm4%
echo บ Steel Sword: %sword5%       บ Steel Armor: %arm5%
echo บ Gold Sword: %sword6%        บ Gold Armor: %arm6%
echo บ Crystal Sword: %sword7%     บ Crystal Armor: %arm7%
echo บ Sacred Blade: %sword8%      บ Sacred Armor: %arm8%
echo บ Runic Sword: %sword9%       บ Runic Armor: %arm9%
echo บ Infernal Rapier: %sword10%   บ Infernal Armor: %arm10%
echo บ Omega Maul: %sword11%        บ Omega Armor: %arm11%
echo บ Chaotic Spear: %sword12%     บ Chaotic Armor: %arm12%
echo บ Mythical Godsword: %ls1% บ Mythical Armor: %la1%
echo บ Alydril Godsword: %ls2%  บ Alydril Armor: %la2%
echo ศออออออออออออออออออออออสอออออออออออออออออออออออออผ
echo.
echo What would you like to do?
echo.
echo 1) Return to battle
echo 2) Drink Potion
echo 3) Eat Food
echo 4) Change Weapon
echo 5) Change Armor
echo.
set /p invencho=
if %invencho% EQU 4 set destination=weaponselect
if %invencho% EQU 5 set destination=Armorselect
if %invencho% EQU 1 goto fs1
if %invencho% EQU 2 goto drinkpotion
if %invencho% EQU 3 goto eatfood
if %invencho% EQU 4 goto weaponselect
if %invencho% EQU 5 goto Armorselect


:drinkpotion
if %potion% LEQ 0 goto nopotion
set /a potion=%potion% - 1
cls
echo.
echo You drink a potion.
ping localhost -n 2 >nul
set /a hpheal=%random%*100/32767+1
set /a hp=%hp%+%hpheal%
if %hp% GTR %orighp% set /a hp=%orighp%
echo.
echo You have been healed %hpheal% health.
echo You now have %hp% health.
echo.
pause>nul
goto fs3

:nopotion
echo You don't have any potions.
echo.
pause>nul
goto fightinginventory


:eatfood
if %food% LEQ 0 goto nofood
set /a food=%food%-1
cls
echo.
echo You eat some food.
ping localhost -n 2 >nul
set /a hpheal=%random%*50/32767+1
set /a hp=%hp%+%hpheal%
if %hp% GTR %orighp% set /a hp=%orighp%
echo.
echo You have been healed %hpheal% health.
echo You now have %hp% health.
echo.
pause>nul
goto fs3

:nofood
echo You don't have any food.
echo.
pause>nul
goto fightinginventory



:weaponselect
title FinalRealm - Weapon Select
set destination=weaponselect
set /a numswords=%sword1%+%sword2%+%sword3%+%sword4%+%sword5%+%sword6%+%sword7%+%sword8%+%sword9%+%sword10%+%sword11%+%sword12%
cls
echo.
echo You currently have %numswords% swords.
echo You currently have a %swordtype% %skind% equipped.
echo.
echo Select a sword to equip, or return to battle.
echo.
echo 1) Wooden Sword: %sword1%
echo 2) Stone Sword: %sword2%
echo 3) Bronze Sword: %sword3%
echo 4) Iron Sword: %sword4%
echo 5) Steel Sword: %sword5%
echo 6) Gold Sword: %sword6%
echo 7) Crystal Sword: %sword7%
echo 8) Sacred Blade: %sword8%
echo 9) Runic Sword: %sword9%
echo 10) Infernal Rapier: %sword10%
echo 11) Omega Maul: %sword11%
echo 12) Chaotic Spear: %sword12%
echo 13) Mythical Godsword: %ls1%
echo 14) Alydril Godsword: %ls2%
echo.
echo 15) Back
echo.
set /p wepsel=
if %wepsel% EQU 1 goto equips1
if %wepsel% EQU 2 goto equips2
if %wepsel% EQU 3 goto equips3
if %wepsel% EQU 4 goto equips4
if %wepsel% EQU 5 goto equips5
if %wepsel% EQU 6 goto equips6
if %wepsel% EQU 7 goto equips7
if %wepsel% EQU 8 goto equips8
if %wepsel% EQU 9 goto equips9
if %wepsel% EQU 10 goto equips10
if %wepsel% EQU 11 goto equips11
if %wepsel% EQU 12 goto equips12
if %wepsel% EQU 13 goto equips13
if %wepsel% EQU 14 goto equips14
if %wepsel% EQU 15 goto %destination2%


:equips1
if %sword1% EQU 0 goto nosword
if %swordtype% EQU Wooden goto alreadyequip
set swordtype=Wooden
set skind=Sword
set aan=a
goto confirmequip

:equips2
if %sword2% EQU 0 goto nosword
if %swordtype% EQU Stone goto alreadyequip
set swordtype=Stone
set skind=Sword
set aan=a
goto confirmequip

:equips3
if %sword3% EQU 0 goto nosword
if %swordtype% EQU Bronze goto alreadyequip
set swordtype=Bronze
set skind=Sword
set aan=a
goto confirmequip

:equips4
if %sword4% EQU 0 goto nosword
if %swordtype% EQU Iron goto alreadyequip
set swordtype=Iron
set skind=Sword
set aan=a
goto confirmequip

:equips5
if %sword5% EQU 0 goto nosword
if %swordtype% EQU Steel goto alreadyequip
set swordtype=Steel
set skind=Sword
set aan=a
goto confirmequip

:equips6
if %sword6% EQU 0 goto nosword
if %swordtype% EQU Gold goto alreadyequip
set swordtype=Gold
set skind=Sword
set aan=a
goto confirmequip

:equips7
if %sword7% EQU 0 goto nosword
if %swordtype% EQU Crystal goto alreadyequip
set swordtype=Crystal
set skind=Sword
set aan=a
goto confirmequip

:equips8
if %sword8% EQU 0 goto nosword
if %swordtype% EQU Sacred goto alreadyequip
set swordtype=Sacred
set skind=Blade
set aan=a
goto confirmequip

:equips9
if %sword9% EQU 0 goto nosword
if %swordtype% EQU Runic goto alreadyequip
set swordtype=Runic
set skind=Sword
set aan=a
goto confirmequip

:equips10
if %sword10% EQU 0 goto nosword
if %swordtype% EQU Infernal goto alreadyequip
set swordtype=Infernal
set skind=Rapier
set aan=an
goto confirmequip

:equips11
if %sword11% EQU 0 goto nosword
if %swordtype% EQU Omega goto alreadyequip
set swordtype=Omega
set skind=Maul
set aan=an
goto confirmequip

:equips12
if %sword12% EQU 0 goto nosword
if %swordtype% EQU Chaotic goto alreadyequip
set swordtype=Chaotic
set skind=Spear
goto confirmequip

:equips13
if %ls1% EQU 0 goto nosword
if %swordtype% EQU Mythical goto alreadyequip
set swordtype=Mythical
set skind=Godsword
set aan=an
goto confirmequip

:equips14
if %ls2% EQU 0 goto nosword
if %swordtype% EQU Alydril goto alreadyequip
set swordtype=Alydril
set skind=Godsword
set aan=an
goto confirmequip

:confirmequip
echo You have equipped %aan% %swordtype% %skind%.
echo.
pause>nul
goto %destination%

:nosword
echo You don't have that weapon.
echo.
pause>nul
goto %destination%


:alreadyequip
echo You already have that weapon equipped.
echo.
pause>nul
goto %destination%


:Armorselect
title FinalRealm - Armor Select
set destination=Armorselect
set /a numArmor=%arm1%+%arm2%+%arm3%+%arm4%+%arm5%+%arm6%+%arm7%+%arm8%+%arm9%+%arm10%+%arm11%+%arm12%
cls
echo.
echo You currently have %numArmor% pieces of Armor.
echo You currently have %armtype% Armor equipped.
echo.
echo Select an Armor set to wear, or return to battle.
echo.
echo 1) Cloth Armor: %arm1%
echo 2) Chain Armor: %arm2%
echo 3) Bronze Armor: %arm3%
echo 4) Iron Armor: %arm4%
echo 5) Steel Armor: %arm5%
echo 6) Gold Armor: %arm6%
echo 7) Crystal Armor: %arm7%
echo 8) Sacred Armor: %arm8%
echo 9) Runic Armor: %arm9%
echo 10) Infernal Armor: %arm10%
echo 11) Omega Armor: %arm11%
echo 12) Chaotic Armor: %arm12%
echo 13) Mythical Amour: %la1%
echo 14) Alydril Armor: %la2%
echo.
echo 15) Back
echo.
set /p armsel=
if %armsel% EQU 1 goto equipa1
if %armsel% EQU 2 goto equipa2
if %armsel% EQU 3 goto equipa3
if %armsel% EQU 4 goto equipa4
if %armsel% EQU 5 goto equipa5
if %armsel% EQU 6 goto equipa6
if %armsel% EQU 7 goto equipa7
if %armsel% EQU 8 goto equipa8
if %armsel% EQU 9 goto equipa9
if %armsel% EQU 10 goto equipa10
if %armsel% EQU 11 goto equipa11
if %armsel% EQU 12 goto equipa12
if %armsel% EQU 13 goto equipa13
if %armsel% EQU 14 goto equipa14
if %armsel% EQU 15 goto %destination2%


:equipa1
if %arm1% EQU 0 goto noarm
if %armtype% EQU Cloth goto alreadyequiparm
set armtype=Cloth
goto confirmequiparm

:equipa2
if %arm2% EQU 0 goto noarm
if %armtype% EQU Chain goto alreadyequiparm
set armtype=Chain
goto confirmequiparm

:equipa3
if %arm3% EQU 0 goto noarm
if %armtype% EQU Bronze goto alreadyequiparm
set armtype=Bronze
goto confirmequiparm

:equipa4
if %arm4% EQU 0 goto noarm
if %armtype% EQU Iron goto alreadyequiparm
set armtype=Iron
goto confirmequiparm

:equipa5
if %arm5% EQU 0 goto noarm
if %armtype% EQU Steel goto alreadyequiparm
set armtype=Steel
goto confirmequiparm

:equipa6
if %arm6% EQU 0 goto noarm
if %armtype% EQU Gold goto alreadyequiparm
set armtype=Gold
goto confirmequiparm

:equipa7
if %arm7% EQU 0 goto noarm
if %armtype% EQU Crystal goto alreadyequiparm
set armtype=Crystal
goto confirmequiparm

:equipa8
if %arm8% EQU 0 goto noarm
if %armtype% EQU Sacred goto alreadyequiparm
set armtype=Sacred
goto confirmequiparm

:equipa9
if %arm9% EQU 0 goto noarm
if %armtype% EQU Runic goto alreadyequiparm
set armtype=Runic
goto confirmequiparm

:equipa10
if %arm10% EQU 0 goto noarm
if %armtype% EQU Infernal goto alreadyequiparm
set armtype=Infernal
goto confirmequiparm

:equipa11
if %arm11% EQU 0 goto noarm
if %armtype% EQU Omega goto alreadyequiparm
set armtype=Omega
goto confirmequiparm

:equipa12
if %arm12% EQU 0 goto noarm
if %armtype% EQU Chaotic goto alreadyequiparm
set armtype=Chaotic
goto confirmequiparm

:equipa13
if %la1% EQU 0 goto noarm
if %armtype% EQU Mythical goto alreadyequiparm
set armtype=Mythical
goto confirmequiparm

:equipa14
if %la2% EQU 0 goto noarm
if %armtype% EQU Alydril goto alreadyequiparm
set armtype=Alydril
goto confirmequiparm

:confirmequiparm
echo You have equipped %armtype% Armor.
echo.
pause>nul
goto %destination%

:noarm
echo You don't have that Armor.
echo.
pause>nul
goto Armorselect


:alreadyequiparm
echo You already have that Armor equipped.
echo.
pause>nul
goto Armorselect




:weaponstore
set destination1=weaponstore
title FinalRealm - Weapon Shop
mode con cols=160 lines=62
cls
echo FinalRealm Weapon Shop
echo.
echo You currently have %money% Gold.
echo.
echo.
echo 1) Wooden Sword:   Costs 100 gold.
echo. 		   Owned: %sword1%   
echo.
echo 2) Stone Sword:    Costs 250 gold.
echo.		   Owned: %sword2%
echo.
echo 3) Bronze Sword:   Costs 500 gold.
echo.		   Owned: %sword3%
echo.
echo 4) Iron Sword:     Costs 1,000 gold.
echo.		   Owned: %sword4%   
echo.
echo 5) Steel Sword:    Costs 2,500 gold.
echo. 		   Owned: %sword5%   
echo.
echo 6) Gold Sword:     Costs 5,000 gold.
echo.		   Owned: %sword6%   
echo.
echo 7) Crystal Sword:  Costs 10,000 gold.
echo. 		   Owned: %sword7%   
echo.
echo 8) Sacred Blade:   Costs 25,000 gold.
echo. 		   Owned: %sword8%  
echo.
echo 9) Next Page
echo.
echo Type "exit" to exit the store.
echo.
echo.
echo		  Page 1
set /p w1=
if %w1% EQU 1 (
set /a sprice=100
set swordchoice=Wooden
set swordchoice2=Sword
set /a att=100
set swordexist=sword1
set swordexist2=%sword1%
set levelneeded=1 )
if %w1% EQU 2 (
set /a sprice=125
set swordchoice=Stone
set swordchoice2=Sword
set /a att=100
set swordexist=sword2
set swordexist2=%sword2%
set levelneeded=1 )
if %w1% EQU 3 (
set /a sprice=500
set swordchoice=Bronze
set swordchoice2=Sword
set /a att=150
set swordexist=sword3
set swordexist2=%sword3%
set levelneeded=5 )
if %w1% EQU 4 (
set /a sprice=1000
set swordchoice=Iron
set swordchoice2=Sword
set /a att=175
set swordexist=sword4
set swordexist2=%sword4%
set levelneeded=5 )
if %w1% EQU 5 (
set /a sprice=2500
set swordchoice=Steel
set swordchoice2=Sword
set /a att=200
set swordexist=sword5
set swordexist2=%sword5%
set levelneeded=10 )
if %w1% EQU 6 (
set /a sprice=5000
set swordchoice=Gold
set swordchoice2=Sword
set /a att=225
set swordexist=sword5
set swordexist2=%sword6%
set levelneeded=10 )
if %w1% EQU 7 (
set /a sprice=10000
set swordchoice=Crystal
set swordchoice2=Sword
set /a att=250
set swordexist=sword7
set swordexist2=%sword7%
set levelneeded=15 )
if %w1% EQU 8 (
set /a sprice=25000
set swordchoice=Sacred
set swordchoice2=Blade
set /a att=275
set swordexist=sword8
set swordexist2=%sword8%
set levelneeded=15 )
if %w1% EQU 9 goto weaponstorep2
if %w1% EQU exit goto SAVE_GAME_FILES
goto buynow


:weaponstorep2
set destination1=weaponstorep2
title FinalRealm - Weapon Shop
mode con cols=160 lines=62
cls
echo FinalRealm Weapon Shop
echo.
echo You currently have %money% Gold.
echo.
echo.
echo 1) Runic Sword:     Costs 50,000 gold.
echo. 		    Owned: %sword9%   
echo.
echo 2) Infernal Rapier: Costs 50,000 gold.
echo.		    Owned: %sword10%
echo.
echo 3) Omega Maul:	    Costs 50,000 gold.
echo.		    Owned: %sword11%
echo.
echo 4) Chaotic Spear:   Costs 50,000 gold.
echo.		    Owned: %sword12%   
echo.
echo 5) Previous Page
echo.
echo Type "exit" to the exit the store.
echo.
echo.
echo		  Page 2
set /p w1=
if %w1% EQU 1 (
set /a sprice=50000
set swordchoice=Runic
set swordchoice2=Sword
set /a att=300
set swordexist=sword9
set swordexist2=%sword9%
set levelneeded=20 )
if %w1% EQU 2 (
set /a sprice=50000
set swordchoice=Infernal
set swordchoice2=Rapier
set /a att=300
set swordexist=sword10
set swordexist2=%sword10%
set levelneeded=20 )
if %w1% EQU 3 (
set /a sprice=50000
set swordchoice=Omega
set swordchoice2=Maul
set /a att=300
set swordexist=sword11
set swordexist2=%sword11%
set levelneeded=20 )
if %w1% EQU 4 (
set /a sprice=50000
set swordchoice=Chaotic
set swordchoice2=Spear
set /a att=300
set swordexist=sword12
set swordexist2=%sword12%
set levelneeded=20 )
if %w1% EQU 5 goto weaponstore
if %w1% EQU exit goto SAVE_GAME_FILES
goto buynow




:Armorstore
set destination1=armorstore
title FinalRealm - Armor Shop
mode con cols=160 lines=62
cls
echo FinalRealm - Armor Shop
echo.
echo You currently have %money% Gold.
echo.
echo.
echo 1) Cloth Armor:    Costs 150 gold.
echo. 		    Owned: %arm1%   
echo.
echo 2) Chain Armor:    Costs 300 gold.
echo.		    Owned: %arm2%
echo.
echo 3) Bronze Armor:   Costs 750 gold.
echo.		    Owned: %arm3%
echo.
echo 4) Iron Armor:     Costs 1,500 gold.
echo.		    Owned: %arm4%   
echo.
echo 5) Steel Armor:    Costs 3,000 gold.
echo. 		    Owned: %arm5%   
echo.
echo 6) Gold Armor:     Costs 5,000 gold.
echo.		    Owned: %arm6%   
echo.
echo 7) Crystal Armor:  Costs 10,000 gold.
echo. 		    Owned: %arm7%   
echo.
echo 8) Sacred Armor:   Costs 15,000 gold.
echo. 		    Owned: %arm8%  
echo.
echo 9) Next Page
echo.
echo Type "exit" to exit the store.
echo.
echo.
echo		  Page 1
set /p w1=
if %w1% EQU 1 (
set /a sprice=150
set swordchoice=Cloth
set swordchoice2=Armor
set /a att=10
set swordexist=arm1
set swordexist2=%arm1% )
if %w1% EQU 2 (
set /a sprice=300
set swordchoice=Chain
set swordchoice2=Armor
set /a att=20
set swordexist=arm2
set swordexist2=%arm2% )
if %w1% EQU 3 (
set /a sprice=750
set swordchoice=Bronze
set swordchoice2=Armor
set /a att=40
set swordexist=arm3
set swordexist2=%arm3% )
if %w1% EQU 4 (
set /a sprice=1500
set swordchoice=Iron
set swordchoice2=Armor
set /a att=65
set swordexist=arm4
set swordexist2=%arm4% )
if %w1% EQU 5 (
set /a sprice=3000
set swordchoice=Steel
set swordchoice2=Armor
set /a att=100
set swordexist=arm5
set swordexist2=%arm5% )
if %w1% EQU 6 (
set /a sprice=5000
set swordchoice=Gold
set swordchoice2=Armor
set /a att=120
set swordexist=arm5
set swordexist2=%arm6% )
if %w1% EQU 7 (
set /a sprice=10000
set swordchoice=Crystal
set swordchoice2=Armor
set /a att=145
set swordexist=arm7
set swordexist2=%arm7% )
if %w1% EQU 8 (
set /a sprice=15000
set swordchoice=Sacred
set swordchoice2=Blade
set /a att=175
set swordexist=arm8
set swordexist2=%arm8% )
if %w1% EQU 9 goto Armorstorep2
if %w1% EQU exit goto SAVE_GAME_FILES
goto buynow


:Armorstorep2
set destination1=armorstorep2
title FinalRealm - Armor Shop
mode con cols=160 lines=62
cls
echo FinalRealm Armor Shop
echo.
echo You currently have %money% Gold.
echo.
echo.
echo 1) Runic Armor:    Costs 25,000 gold.
echo. 		    Owned: %arm9%   
echo.
echo 2) Infernal Armor: Costs 40,000 gold.
echo.		    Owned: %arm10%
echo.
echo 3) Omega Armor:    Costs 75,000 gold.
echo.		    Owned: %arm11%
echo.
echo 4) Chaotic Armor:  Costs 100,000 gold.
echo.		    Owned: %arm12%   
echo.
echo 5) Previous Page
echo.
echo Type "exit" to the exit the store.
echo.
echo.
echo		  Page 2
set /p w1=
if %w1% EQU 1 (
set /a sprice=25000
set swordchoice=Runic
set swordchoice2=Armor
set /a att=200
set swordexist=arm9
set swordexist2=%arm9% )
if %w1% EQU 2 (
set /a sprice=40000
set swordchoice=Infernal
set swordchoice2=Armor
set /a att=215
set swordexist=arm10
set swordexist2=%arm10% )
if %w1% EQU 3 (
set /a sprice=75000
set swordchoice=Omega
set swordchoice2=Armor
set /a att=235
set swordexist=arm11
set swordexist2=%arm11% )
if %w1% EQU 4 (
set /a sprice=100000
set swordchoice=Chaotic
set swordchoice2=Armor
set /a att=250
set swordexist=arm12
set swordexist2=%arm12% )
if %w1% EQU 5 goto Armorstore
if %w1% EQU exit goto SAVE_GAME_FILES
goto buynow




:legendsstore
set destination1=legendsstore
title FinalRealm - Legend's Store
mode con cols=160 lines=62
cls
echo FinalRealm Legend's Store
echo.
echo ษอออออออออออออออออออออออออออออออออป
echo บ You currently have %money% gold. บ
echo ศอออออออออออออออออออออออออออออออออผ
echo.
echo.
echo ษออออออออออออออออออออออออออออออออออออออออออออออป
echo บ 1) Mythical Godsword:  Costs 50 Magic Orbs.  บ
echo.บ		    	 Owned: %ls1%              บ
echo.บ                                              บ
echo บ 2) Alydril Godsword:   Costs 100 Magic Orbs. บ
echo.บ		    	 Owned: %ls2%              บ
echo.บ                                              บ
echo บ 3) Mythical Armor:	 Costs 65 Magic Orbs.  บ
echo.บ		         Owned: %la1%              บ
echo.บ                                              บ
echo บ 4) Alydril Armor:   	 Costs 120 Magic Orbs. บ
echo.บ		   	 Owned: %la2%              บ
echo ศออออออออออออออออออออออออออออออออออออออออออออออผ
echo.
echo.
echo Type "exit" to the exit the store.
echo.
set /p w1=
if %w1% EQU 1 (
set /a sprice=50
set swordchoice=Mythical
set swordchoice2=Godsword
set /a att=450
set swordexist=ls1
set swordexist2=%ls1% )
if %w1% EQU 2 (
set /a sprice=100
set swordchoice=Alydril
set swordchoice2=Godsword
set /a att=600
set swordexist=ls2
set swordexist2=%ls2% )
if %w1% EQU 3 (
set /a sprice=65
set swordchoice=Mythical
set swordchoice2=Armor
set /a att=275
set swordexist=la1
set swordexist2=%la1% )
if %w1% EQU 4 (
set /a sprice=120
set swordchoice=Alydril
set swordchoice2=Armor
set /a att=300
set swordexist=la2
set swordexist2=%la2% )
if %w1% EQU exit goto SAVE_GAME_FILES
goto buylegends

:buylegends
if %morb% LSS %sprice% goto nomoney
if %swordexist2% GEQ 1 goto alreadyown
set /a morb=%morb%-%sprice%
set /a %swordexist%=%swordexist2%+1
echo.
echo.
echo %swordchoice% %swordchoice2% purchased. You have a damage bonus of up to %att% with this item.
pause>nul
goto %destination1%




:maxshopclosed
if %ttllvl% GEQ 1300 goto maxshopopen
echo.
echo.
echo Max's shop is closed at the moment.
echo.
pause>nul
goto SAVE_GAME_FILES

:maxshopopen
set /a ms1=0
title FinalRealm - Max's Shop
cls
echo.
echo.
echo What would you like to do?
echo.
echo 1) Buy Weapons
echo 2) Buy Armor
echo 3) Leave
echo.
set /p m1=
if %m1% EQU 1 goto buymaxwep
if %m1% EQU 2 goto buymaxarm
if %m1% EQU 3 goto SAVE_GAME_FILES

:buymaxwep
set destination1=buymaxwep
cls
echo.
echo Gold: %money%
echo sians baxe: %ms1%
echo swordexist: %swordexist%
echo.
echo Weapons:
echo.
echo 1) Elysian Blade       1
echo 2) Arcane Blade          1724521345
echo 3) Spectral Blade     769123123
echo.
echo Type "exit" to exit.
set /p w1=
if %w1% EQU 1 (
set /a sprice=3000000
set swordchoice=Elysian
set swordchoice2=Blade
set /a att=750
set swordexist=%ms1% )
if %w1% EQU 2 (
set /a sprice=400000
set swordchoice=Spectral
set swordchoice2=Blade
set /a att=850
set swordchoice3=%ms2% )
if %w1% EQU 3 (
set /a sprice=5000000
set swordchoice=Arcane
set swordchoice2=Blade
set /a att=1000
set swordchoice3=%ms3% )
goto buynow

:buynow
if %curlvl% LSS %levelneeded% goto NOTHIGHENOUGHLEVELTOBUY
if %money% LSS %sprice% goto nomoney
if %swordexist2% GEQ 1 goto alreadyown
set /a money=%money%-%sprice%
set /a %swordexist%=%swordexist2%+1
echo.
echo.
echo %swordchoice% %swordchoice2% purchased. You have a damage bonus of up to %att% with this item.
pause>nul
goto %destination1%

:nomoney
echo.
echo.
echo You don't have enough money.
echo.
pause>nul
goto %destination1%

:alreadyown
echo.
echo.
echo You already own this item.
echo.
pause>nul
goto %destination1%

:NOTHIGHENOUGHLEVELTOBUY
echo.
echo.
echo You are not a high enough level to buy this item. You need to be at least level %levelneeded%.
echo.
pause>nul
goto %destination1%



:gstore
set destination1=gstore
cls
title FinalRealm - General Store
echo.
echo Gold: %money%
echo.
echo Your Items:			Prices:
echo.
echo 1) Goblin Mails: %gmail%		%pgmail%
echo 2) Huge Bones: %hbone%		%phbone%
echo 3) Dragon Hides: %dhide%		%pdhide%
echo 4) Runic Tablets: %rtab%		%prtab%
echo 5) Potions: %potion%			%ppotion%
echo 6) Food: %food%			%pfood%
echo 7) Seeds: %seed%			%pseed%
echo 8) Fur: %fur%			%pfur%
echo 9) Ore: %ore%			%pore%
echo 10) Logs: %log%			%plog%
echo 11) Gemstones: %gem%		%pgem%
echo 12) Magic Orbs: %morb%		%pmorb%
echo 13) Raw Food: %rfood%  		%prfood%
echo 14) Bait: %bait%           		%pbait%
echo 15) Ingots: %ingot%     		%pingot%
echo 16) Bows: %bow%			%pbow%
echo.
echo.
set /p g1=Enter the number of the item you would like to buy or sell, or type "exit" to exit: 
if %g1% EQU 1 set gcho=gmail
if %g1% EQU 2 set gcho=hbone
if %g1% EQU 3 set gcho=dhide
if %g1% EQU 4 set gcho=rtab
if %g1% EQU 5 set gcho=potion
if %g1% EQU 6 set gcho=food
if %g1% EQU 7 set gcho=seed
if %g1% EQU 8 set gcho=fur
if %g1% EQU 9 set gcho=ore
if %g1% EQU 10 set gcho=log
if %g1% EQU 11 set gcho=gem
if %g1% EQU 12 set gcho=morb
if %g1% EQU 13 set gcho=rfood
if %g1% EQU 14 set gcho=bait
if %g1% EQU 15 set gcho=ingot
if %g1% EQU 16 set gcho=bow
if %g1% EQU exit goto SAVE_GAME_FILES
goto buysell

:buysell
echo.
set /p g2=Would you like to buy or sell that item, or go back? 
if %g2% EQU buy goto buyitem
if %g2% EQU sell goto sellitem
if %g2% EQU back goto gstore

:buyitem
echo.
set /p g3=Enter the amount you would like to purchase: 
if %g3% LSS 0 goto gstore
set /a cost=%g3%*!p%gcho%!
if %cost% GTR %money% goto notenoughmoney
set /a money=%money%-%cost%
set /a %gcho%=!%gcho%!+%g3%
echo.
echo Bought %g3% of that item for %cost%.
echo.
pause>nul
goto gstore

:sellitem
echo.
set /p g4=Enter the amount of that item you would like to sell, or type "all" to sell all: 
if %g4% EQU all goto sellallitem
if %g4% LSS 0 goto gstore
if %g4% GTR !%gcho%! goto sellallitem
set /a price=%g4%*!p%gcho%!
set /a money=%money%+%price%
set /a %gcho%=!%gcho%!-%g4%
echo.
echo Sold %g4% of that item for %price%.
echo.
pause>nul
goto gstore

:sellallitem
set /a price=!%gcho%!*!p%gcho%!
set /a money=%money%+%price%
echo.
echo Sold !%gcho%! of that item for %price%.
set /a %gcho%=0
echo.
pause>nul
goto gstore

:notenoughmoney
echo.
echo You do not have enough money.
echo.
pause>nul
goto %destination1%


:checkitems
if %hp% GTR 1000 set /a hp=1000
if %curlvl% GTR 37 set /a curlvl=37
if %curlvl% GEQ 37 set xpuntil=None^^!
if %money% GTR 5000000 set /a money=5000000
if %playerxp% GTR 1000000 set /a playerxp=1000000
title FinalRealm - Inventory
mode con cols=160 lines=62
set destination2=checkitems
cls
echo FinalRealm - Inventory
echo.
echo ษออออออออออออออออออออออออออออออออออออออออออออออออป
echo บ Health: %hp%					 บ
echo บ Level: %curlvl%					 บ
echo บ Gold: %money%					 บ
echo บ EXP: %playerxp%					 บ
echo บ EXP until next level: %xpuntil%			 บ
echo บ Total level: %ttllvl%				 บ
echo บ Weapon: %swordtype% %skind%		 	 บ
echo บ Armor: %armtype% Armor			 	 บ
echo ฬออออออออออออออออออออออหอออออออออออออออออออออออออน
echo บ Items:	       บ
echo บ Bait: %bait%	       บ Gemstones: %gem%
echo บ Seeds: %seed%	       บ Magic Orbs: %morb%
echo บ Furs: %fur%	       บ Raw Food: %rfood%
echo บ Ore: %ore%	       บ Huge Bones: %hbone%
echo บ Logs: %log%	       บ Dragon Hides: %dhide%
echo บ Food: %food%	       บ Runic Tablets: %rtab%
echo บ Ingots: %ingot%	       บ Goblin Mails: %gmail%
echo บ Potions: %potion%	       บ Bows: %bow%
echo ฬออออออออออออออออออออออฮอออออออออออออออออออออออออน
echo บ Weapons:             บ Armor:
echo บ Wooden Sword: %sword1%      บ Cloth Armor: %arm1%
echo บ Stone Sword: %sword2%       บ Chain Armor: %arm2%
echo บ Bronze Sword: %sword3%      บ Bronze Armor: %arm3%
echo บ Iron Sword: %sword4%        บ Iron Armor: %arm4%
echo บ Steel Sword: %sword5%       บ Steel Armor: %arm5%
echo บ Gold Sword: %sword6%        บ Gold Armor: %arm6%
echo บ Crystal Sword: %sword7%     บ Crystal Armor: %arm7%
echo บ Sacred Blade: %sword8%      บ Sacred Armor: %arm8%
echo บ Runic Sword: %sword9%       บ Runic Armor: %arm9%
echo บ Infernal Rapier: %sword10%   บ Infernal Armor: %arm10%
echo บ Omega Maul: %sword11%        บ Omega Armor: %arm11%
echo บ Chaotic Spear: %sword12%     บ Chaotic Armor: %arm12%
echo บ Mythical Godsword: %ls1% บ Mythical Armor: %la1%
echo บ Alydril Godsword: %ls2%  บ Alydril Armor: %la2%
echo ศออออออออออออออออออออออสอออออออออออออออออออออออออผ
echo.
echo What would you like to do?
echo.
echo 1) Back
echo 2) Heal
echo 3) Change Weapon
echo 4) Change Armor
echo 5) View Levels
echo.
set /p invencho1=
if %invencho1% EQU 1 goto SAVE_GAME_FILES
if %invencho1% EQU 2 goto heal
if %invencho1% EQU 3 goto weaponselect
if %invencho1% EQU 4 goto Armorselect
if %invencho1% EQU 5 goto viewlvls

:heal
cls
echo.
set /a hp=%orighp%
echo You have been healed back to full health.
echo.
pause>nul
goto checkitems

:viewlvls
cls
echo.
echo.
echo Levels:
echo.
echo.
echo Total level: %ttllvl%
echo.
echo.
echo Woodcutting level: %Woodcuttinglvl%
echo.
echo Cooking level: %Cooklvl%
echo.
echo Fishing level: %Fishinglvl%
echo.
echo Thieving level: %Thievinglvl%
echo.
echo Mining level: %Mininglvl%
echo.
echo Smithing level: %Smithinglvl%
echo.
echo.
echo Type "back" to go back.
echo.
set /p invencho2=
if %invencho2% EQU back goto checkitems




:skillplot
title FinalRealm - Skill Plot
cls
echo.
echo Skills:
echo.
echo.
echo 1) Woodcutting
echo.
echo 2) Cooking
echo.
echo 3) Fishing
echo.
echo 4) Mining
echo.
echo 5) Smithing
echo.
echo 6) Thieving
echo.
echo.
echo Type "exit" to leave.
set /p f2=
if %f2% EQU 1 goto Woodcuttingmenu
if %f2% EQU 2 goto Cookingmenu
if %f2% EQU 3 goto Fishingmenu
if %f2% EQU 4 goto Miningmenu
if %f2% EQU 5 goto Smithingmenu
if %f2% EQU 6 goto Thievingmenu
if %f2% EQU exit goto SAVE_GAME_FILES


:Cookingmenu
cls
echo.
echo Cooking level: %Cooklvl%
echo Current EXP: %Cookcurxp%
echo Remainder: %Cookxpleft%
echo Raw Food: %rfood%
echo Cooked Food: %food%
echo.
echo.
echo 1) Cook
echo 2) Back
set /p f1=
if %f1% EQU 1 goto Cookbow
if %f1% EQU 2 goto skillplot

:Cookbow
if %Cooklvl% EQU 100 goto instacook
if %rfood% LEQ 0 goto noitem
echo.
echo You Cook some food.
set /a rfood=%rfood%-1
set /a food=%food%+1
set /a Cookxpleft=%Cookxpleft%-%Cookxpgain%
set /a Cookcurxp=%Cookcurxp%+%Cookxpgain%
if %Cookxpleft% LEQ 0 goto Cooklevelup
echo.
pause>nul
goto Cookingmenu

:Cooklevelup
set /a Cooklvl=%Cooklvl%+1
if %Cooklvl% GTR 100 set /a Cooklvl=100
if %Cooklvl% GEQ 100 set /a Cookxpleft=0
if %Cooklvl% GEQ 100 goto maxlvl
set /a Cookxpremain=%Cookxpremain%+100
set /a Cookxpleft=%Cookxpleft%+%Cookxpremain%
echo.
echo Congratulations, You have now reached level %Cooklvl%.
echo.
pause>nul
goto Cookingmenu


:Fishingmenu
cls
echo.
echo Fishinging level: %Fishinglvl%
echo Current EXP: %Fishingcurxp%
echo Remainder: %Fishingxpleft%
echo Raw Fish: %rfood%
echo Bait: %bait%
echo.
echo.
echo 1) Fish
echo 2) Back
set /p f1=
if %f1% EQU 1 goto Fishingbow
if %f1% EQU 2 goto skillplot

:Fishingbow
if %Fishinglvl% EQU 100 goto instafish
if %bait% LEQ 0 goto noitem
echo.
echo You catch a fish.
set /a bait=%bait%-1
set /a rfood=%rfood%+1
set /a Fishingxpleft=%Fishingxpleft%-%Fishingxpgain%
set /a Fishingcurxp=%Fishingcurxp%+%Fishingxpgain%
if %Fishingxpleft% LEQ 0 goto Fishinglevelup
echo.
pause>nul
goto Fishingmenu

:Fishinglevelup
set /a Fishinglvl=%Fishinglvl%+1
if %Fishinglvl% GTR 100 set /a Fishinglvl=100
if %Fishinglvl% GEQ 100 set /a Fishingxpleft=0
if %Fishinglvl% GEQ 100 goto maxlvl
set /a Fishingxpremain=%Fishingxpremain%+100
set /a Fishingxpleft=%Fishingxpleft%+%Fishingxpremain%
echo.
echo Congratulations, You have now reached level %Fishinglvl%.
echo.
pause>nul
goto Fishingmenu


:Miningmenu
cls
echo.
echo Mining level: %Mininglvl%
echo Current EXP: %Miningcurxp%
echo Remainder: %Miningxpleft%
echo Ore: %ore%
echo.
echo.
echo 1) Mine
echo 2) Back
set /p f1=
if %f1% EQU 1 goto Miningbow
if %f1% EQU 2 goto skillplot

:Miningbow
if %Mininglvl% EQU 100 goto instamine
echo.
echo You start mining some ore.
echo.
echo You mine some ore.
set /a ore=%ore%+1
set /a Miningxpleft=%Miningxpleft%-%Miningxpgain%
set /a Miningcurxp=%Miningcurxp%+%Miningxpgain%
if %Miningxpleft% LEQ 0 goto Mininglevelup
echo.
goto Miningmenu

:Mininglevelup
set /a Mininglvl=%Mininglvl%+1
if %Mininglvl% GTR 100 set /a Mininglvl=100
if %Mininglvl% GEQ 100 set /a Miningxpleft=0
if %Mininglvl% GEQ 100 goto maxlvl
set /a Miningxpremain=%Miningxpremain%+100
set /a Miningxpleft=%Miningxpleft%+%Miningxpremain%
echo.
echo Congratulations, You have now reached level %Mininglvl%.
echo.
pause>nul
goto Miningmenu


:Smithingmenu
cls
echo.
echo Smithing level: %Smithinglvl%
echo Current EXP: %Smithingcurxp%
echo Remainder: %Smithingxpleft%
echo Ore: %ore%
echo Ingots: %ingot%
echo.
echo.
echo 1) Smith
echo 2) Back
set /p f1=
if %f1% EQU 1 goto Smithingbow
if %f1% EQU 2 goto skillplot

:Smithingbow
if %Smithinglvl% EQU 100 goto instasmith
if %ore% EQU 0 goto noitem
echo.
echo You smith some ore into an ingot.
set /a ore=%ore%-1
set /a ingot=%ingot%+1
set /a Smithingxpleft=%Smithingxpleft%-%Smithingxpgain%
set /a Smithingcurxp=%Smithingcurxp%+%Smithingxpgain%
if %Smithingxpleft% LEQ 0 goto Smithinglevelup
echo.
pause>nul
goto Smithingmenu

:Smithinglevelup
set /a Smithinglvl=%Smithinglvl%+1
if %Smithinglvl% GTR 100 set /a Smithinglvl=100
if %Smithinglvl% GEQ 100 set /a Smithingxpleft=0
if %Smithinglvl% GEQ 100 goto maxlvl
set /a Smithingxpremain=%Smithingxpremain%+100
set /a Smithingxpleft=%Smithingxpleft%+%Smithingxpremain%
echo.
echo Congratulations, You have now reached level %Smithinglvl%.
echo.
pause>nul
goto Smithingmenu


:Thievingmenu
cls
echo.
echo Thieving level: %Thievinglvl%
echo Current EXP: %Thievingcurxp%
echo Remainder: %Thievingxpleft%
echo Gold: %money%
echo.
echo.
echo 1) Pickpocket
echo 2) Back
set /p f1=
if %f1% EQU 1 goto Thievingbow
if %f1% EQU 2 goto skillplot

:Thievingbow
if %Thievinglvl% EQU 100 goto instathieve
echo.
echo You steal some coins.
set /a money=%money%+10
set /a Thievingxpleft=%Thievingxpleft%-%Thievingxpgain%
set /a Thievingcurxp=%Thievingcurxp%+%Thievingxpgain%
if %Thievingxpleft% LEQ 0 goto Thievinglevelup
echo.
pause>nul
goto Thievingmenu

:Thievinglevelup
set /a Thievinglvl=%Thievinglvl%+1
if %Thievinglvl% GTR 100 set /a Thievinglvl=100
if %Thievinglvl% GEQ 100 set /a Thievingxpleft=0
if %Thievinglvl% GEQ 100 goto maxlvl
set /a Thievingxpremain=%Thievingxpremain%+100
set /a Thievingxpleft=%Thievingxpleft%+%Thievingxpremain%
echo.
echo Congratulations, You have now reached level %Thievinglvl%.
echo.
pause>nul
goto Thievingmenu


:Woodcuttingmenu
cls
echo.
echo Woodcutting level: %Woodcuttinglvl%
echo Current EXP: %Woodcuttingcurxp%
echo Remainder: %Woodcuttingxpleft%
echo Logs: %log%
echo.
echo.
echo 1) Woodcut
echo 2) Back
set /p f1=
if %f1% EQU 1 goto Woodcuttingbow
if %f1% EQU 2 goto skillplot

:Woodcuttingbow
if %Woodcuttinglvl% EQU 100 goto instawc
echo.
echo You cut some logs.
set /a log=%log%+1
set /a Woodcuttingxpleft=%Woodcuttingxpleft%-%Woodcuttingxpgain%
set /a Woodcuttingcurxp=%Woodcuttingcurxp%+%Woodcuttingxpgain%
if %Woodcuttingxpleft% LEQ 0 goto Woodcuttinglevelup
echo.
pause>nul
goto Woodcuttingmenu

:Woodcuttinglevelup
set /a Woodcuttinglvl=%Woodcuttinglvl%+1
if %Woodcuttinglvl% GTR 100 set /a Woodcuttinglvl=100
if %Woodcuttinglvl% GEQ 100 set /a Woodcuttingxpleft=0
if %Woodcuttinglvl% GEQ 100 goto maxlvl
set /a Woodcuttingxpremain=%Woodcuttingxpremain%+100
set /a Woodcuttingxpleft=%Woodcuttingxpleft%+%Woodcuttingxpremain%
echo.
echo Congratulations, You have now reached level %Woodcuttinglvl%.
echo.
pause>nul
goto Woodcuttingmenu


:noitem
echo.
echo.
echo You do not have enough of the required materials to make this item.
echo.
pause>nul
goto skillplot

:maxlvl
echo.
echo.
echo Congratulations, you have reached the maximum level in this skill.
echo.
pause>nul
goto skillplot

:instacook
if %rfood% EQU 0 goto noitem
set /a food=%food%+%rfood%
set /a rfood=0
echo.
echo.
echo Because you are a master at this skill, you instantly cook all of your food.
echo.
pause>nul
goto Cookmenu

:instafish
if %bait% EQU 0 goto noitem
set /a rfood=%rfood%+%bait%
set /a bait=0
echo.
echo.
echo Because you are a master at this skill, you instantly use up all of your bait.
echo.
pause>nul
goto Fishingmenu

:instamine
set /a ore=%ore%+100
echo.
echo.
echo Because you are a master at this skill, you instantly mine 100 ore at a time.
echo.
pause>nul
goto Miningmenu

:instasmith
if %ore% EQU 0 goto noitem
set /a ingot=%ingot%+%ore%
set /a ore=0
echo.
echo.
echo Because you are a master at this skill, you instantly smelt all of your ore.
echo.
pause>nul
goto Smithingmenu

:instathieve
set /a money=%money%+10000
echo.
echo.
echo Because you are a master at this skill, you instantly steal 10,000 coins at a time.
echo.
pause>nul
goto Thievingmenu

:instawc
set /a log=%log%+100
echo.
echo.
echo Because you are a master at this skill, you instantly cut 100 logs at a time.
echo.
pause>nul
goto Woodcuttingmenu




:SAVE_GAME_FILES
(
echo set username1=%username1%
echo set password1=%password1%
:DATA_VALUES
echo set acc1g=%acc1g%
echo set acc1m=%acc1m%
echo set acc2g=%acc2g%
echo set acc2m=%acc2m%
echo set acc3g=%acc3g%
echo set acc3m=%acc3m%
echo set acc4g=%acc4g%
echo set acc4m=%acc4m%
echo set acc5g=%acc5g%
echo set acc5m=%acc5m%
echo set cost1=%cost1%
echo set cost=%cost%
echo set gcho=%gcho%
echo set echo=%echo%
echo set e2cho=%e2cho%
echo set e1=%e1%
echo set dmgnpc=%dmgnpc%
echo set ea=%ea%
echo set ls1=%ls1%
echo set ls2=%ls2%
echo set la1=%la1%
echo set la2=%la2%
echo set armtype=%armtype%
echo set hp=%hp%
echo set orighp=%orighp%
echo set swordtype=%swordtype%
echo set skind=%skind%
echo set curlvl=%curlvl%
echo set origxp=%origxp%
echo set playerxp=%playerxp%
echo set xpuntil=%xpuntil%
echo set destination=%destination%
echo set destination2=%destination2%
echo set swordchoice=%swordchoice%
echo set swordchoice2=%swordchoice2%
echo set swordchoice3=%swordchoice3%
echo set swordexist=%swordexist%
echo set sprice=%sprice%
echo set armchoice=%armchoice%
echo set armchoice2=%armchoice2%
echo set aprice=%aprice%
echo set money=%money%
echo set key=%key%
echo set damage=%damage%
echo set killcount=%killcount%
echo set dr=%dr%
echo set def=%def%
echo set def2=%def2%
echo set def3=%def3%
echo set def4=%def4%
echo set def5=%def5%
echo set def6=%def6%
echo set def7=%def7%
echo set def8=%def8%
echo set def9=%def9%
echo set def10=%def10%
echo set def11=%def11%
echo set def12=%def12%
echo set gmail=%gmail%
echo set hbone=%hbone%
echo set dhide=%dhide%
echo set rtab=%rtab%
echo set food=%food%
echo set rfood=%rfood%
echo set potion=%potion%
echo set bait=%bait%
echo set seed=%seed%
echo set fur=%fur%
echo set gem=%gem%
echo set ingot=%ingot%
echo set log=%log%
echo set bow=%bow%
echo set ore=%ore%
echo set aan=%aan%
echo set bankgold=%bankgold%
echo set morb=%morb%
echo set arm1=%arm1%
echo set arm2=%arm2%
echo set arm3=%arm3%
echo set arm4=%arm4%
echo set arm5=%arm5%
echo set arm6=%arm6%
echo set arm7=%arm7%
echo set arm8=%arm8%
echo set arm9=%arm9%
echo set arm10=%arm10%
echo set arm11=%arm11%
echo set arm12=%arm12%
echo set ma1=%ma1%
echo set ma2=%ma2%
echo set ma3=%ma3%
echo set ma4=%ma4%
echo set ma5=%ma5%
echo set ma6=%ma6%
echo set ma7=%ma7%
echo set ma8=%ma8%
echo set ma9=%ma9%
echo set ma10=%ma10%
echo set ms1=%ms1%
echo set ms2=%ms2%
echo set ms3=%ms3%
echo set ms4=%ms4%
echo set ms5=%ms5%
echo set ms6=%ms6%
echo set ms7=%ms7%
echo set ms8=%ms8%
echo set ms9=%ms9%
echo set ms10=%ms10%
echo set sword1=%sword1%
echo set sword2=%sword2%
echo set sword3=%sword3%
echo set sword4=%sword4%
echo set sword5=%sword5%
echo set sword6=%sword6%
echo set sword7=%sword7%
echo set sword8=%sword8%
echo set sword9=%sword9%
echo set sword10=%sword10%
echo set sword11=%sword11%
echo set sword12=%sword12%
echo set axxx=%axxx%
echo set pgmail=%pgmail%
echo set phbone=%phbone%
echo set pdhide=%pdhide%
echo set prtab=%prtab%
echo set ppotion=%ppotion%
echo set pingot=%pingot%
echo set pfood=%pfood%
echo set prfood=%prfood%
echo set pbait=%pbait%
echo set pseed=%pseed%
echo set pfur=%pfur%
echo set pore=%pore%
echo set pbow=%pbow%
echo set plog=%plog%
echo set pgem=%pgem%
echo set pmorb=%pmorb%
echo set Woodcuttinglvl=%Woodcuttinglvl%
echo set Woodcuttingxpremain=%Woodcuttingxpremain%
echo set Woodcuttingxpgain=%Woodcuttingxpgain%
echo set Woodcuttingcurxp=%Woodcuttingcurxp%
echo set Woodcuttingxpleft=%woodcuttingxpleft%
echo set Cooklvl=%Cooklvl%
echo set Cookxpremain=%Cookxpremain%
echo set Cookxpgain=%Cookxpgain%
echo set Cookcurxp=%Cookcurxp%
echo set Cookxpleft=%Cookxpleft%
echo set Fishinglvl=%Fishinglvl%
echo set Fishingxpremain=%Fishingxpremain%
echo set Fishingxpgain=%Fishingxpgain%
echo set Fishingcurxp=%Fishingcurxp%
echo set Fishingxpleft=%Fishingxpleft%
echo set Mininglvl=%Mininglvl%
echo set Miningxpremain=%Miningxpremain%
echo set Miningxpgain=%Miningxpgain%
echo set Miningcurxp=%Miningcurxp%
echo set Miningxpleft=%Miningxpleft%
echo set Smithinglvl=%Smithinglvl%
echo set Smithingxpremain=%Smithingxpremain%
echo set Smithingxpgain=%Smithingxpgain%
echo set Smithingcurxp=%Smithingcurxp%
echo set Smithingxpleft=%Smithingxpleft%
echo set Thievinglvl=%Thievinglvl%
echo set Thievingxpremain=%Thievingxpremain%
echo set Thievingxpgain=%Thievingxpgain%
echo set Thievingcurxp=%Thievingcurxp%
echo set Thievingxpleft=%Thievingxpleft%
echo set ttllvl=%ttllvl%
)>%username1%.bat
goto MENU



:settings
title FinalRealm - Settings
cls
echo.
echo What setting would you like to change?
echo.
echo 1) Color
echo 2) Username
echo 3) Password
echo 4) Admin Commands
echo 5) Exit
echo.
set /p scho=
if %scho% EQU 1 goto color
if %scho% EQU 2 goto namechange
if %scho% EQU 3 goto passchange
if %scho% EQU 4 goto verifyadmin
if %scho% EQU 5 goto SAVE_GAME_FILES


:verifyadmin
cls
echo.
echo Please verify that you are an Administrator.
echo.
echo.
set /p admin1=Please enter the Login Code: 
if %admin1% NEQ 741 (
echo Invalid Code. The Administrator has been notified of this attempt.
pause>nul
goto settings
)
echo.
set /p admin2=Please enter the Verification PIN: 
if %admin2% NEQ 9763 (
echo Invalid PIN. The Administrator has been notified of this attempt.
pause>nul
goto settings
)
goto admincommands

:admincommands
mode con cols=160 lines=62
cls
echo.
echo Type "vars" to get a list of Variables that can be edited, or type "exit" to exit.
echo.
echo Set [variable]=[ammount/class]
echo.
echo.
set /p am1=Set 
if %am1% EQU exit goto settings
if %am1% EQU vars call :commandlist
echo.
set /p am2=Set %am1%=
echo.
set %am1%=%am2%
echo Setting variable [%am1%] to ammount/class [%am2%].
echo.
pause>nul
goto admincommands

:commandlist
mode con cols=160 lines=199
cls
echo.
echo Current Variables:
echo.
echo username1=%username1%
echo password1=%password1%
echo acc1g=%acc1g%
echo acc1m=%acc1m%
echo acc2g=%acc2g%
echo acc2m=%acc2m%
echo acc3g=%acc3g%
echo acc3m=%acc3m%
echo acc4g=%acc4g%
echo acc4m=%acc4m%
echo acc5g=%acc5g%
echo acc5m=%acc5m%
echo cost1=%cost1%
echo cost=%cost%
echo gcho=%gcho%
echo echo=%echo%
echo e2cho=%e2cho%
echo e1=%e1%
echo dmgnpc=%dmgnpc%
echo ea=%ea%
echo ls1=%ls1%
echo ls2=%ls2%
echo la1=%la1%
echo la2=%la2%
echo armtype=%armtype%
echo killcount=%killcount%
echo hp=%hp%
echo orighp=%orighp%
echo swordtype=%swordtype%
echo skind=%skind%
echo curlvl=%curlvl%
echo origxp=%origxp%
echo playerxp=%playerxp%
echo buyword1=%buyword1%
echo buyword2=%buyword2%
echo xpuntil=%xpuntil%
echo destination=%destination%
echo destination2=%destination2%
echo swordchoice=%swordchoice%
echo swordchoice2=%swordchoice2%
echo swordchoice3=%swordchoice3%
echo swordexist=%swordexist%
echo sprice=%sprice%
echo armchoice=%armchoice%
echo armchoice2=%armchoice2%
echo aprice=%aprice%
echo money=%money%
echo key=%key%
echo damage=%damage%
echo dr=%dr%
echo def=%def%
echo def2=%def2%
echo def3=%def3%
echo def4=%def4%
echo def5=%def5%
echo def6=%def6%
echo def7=%def7%
echo def8=%def8%
echo def9=%def9%
echo def10=%def10%
echo def11=%def11%
echo def12=%def12%
echo gmail=%gmail%
echo hbone=%hbone%
echo dhide=%dhide%
echo rtab=%rtab%
echo food=%food%
echo rfood=%rfood%
echo potion=%potion%
echo bait=%bait%
echo seed=%seed%
echo fur=%fur%
echo gem=%gem%
echo ingot=%ingot%
echo log=%log%
echo bow=%bow%
echo ore=%ore%
echo aan=%aan%
echo bankgold=%bankgold%
echo morb=%morb%
echo arm1=%arm1%
echo arm2=%arm2%
echo arm3=%arm3%
echo arm4=%arm4%
echo arm5=%arm5%
echo arm6=%arm6%
echo arm7=%arm7%
echo arm8=%arm8%
echo arm9=%arm9%
echo arm10=%arm10%
echo arm11=%arm11%
echo arm12=%arm12%
echo ma1=%ma1%
echo ma2=%ma2%
echo ma3=%ma3%
echo ma4=%ma4%
echo ma5=%ma5%
echo ma6=%ma6%
echo ma7=%ma7%
echo ma8=%ma8%
echo ma9=%ma9%
echo ma10=%ma10%
echo ms1=%ms1%
echo ms2=%ms2%
echo ms3=%ms3%
echo ms4=%ms4%
echo ms5=%ms5%
echo ms6=%ms6%
echo ms7=%ms7%
echo ms8=%ms8%
echo ms9=%ms9%
echo ms10=%ms10%
echo sword1=%sword1%
echo sword2=%sword2%
echo sword3=%sword3%
echo sword4=%sword4%
echo sword5=%sword5%
echo sword6=%sword6%
echo sword7=%sword7%
echo sword8=%sword8%
echo sword9=%sword9%
echo sword10=%sword10%
echo sword11=%sword11%
echo sword12=%sword12%
echo axxx=%axxx%
echo pgmail=%pgmail%
echo phbone=%phbone%
echo pdhide=%pdhide%
echo prtab=%prtab%
echo ppotion=%ppotion%
echo pingot=%pingot%
echo pfood=%pfood%
echo prfood=%prfood%
echo pbait=%pbait%
echo pseed=%pseed%
echo pfur=%pfur%
echo pore=%pore%
echo pbow=%pbow%
echo plog=%plog%
echo pgem=%pgem%
echo pmorb=%pmorb%
echo Woodcuttinglvl=%Woodcuttinglvl%
echo Woodcuttingxpremain=%Woodcuttingxpremain%
echo Woodcuttingxpgain=%Woodcuttingxpgain%
echo Woodcuttingcurxp=%Woodcuttingcurxp%
echo Woodcuttingxpleft=%woodcuttingxpleft%
echo Cooklvl=%Cooklvl%
echo Cookxpremain=%Cookxpremain%
echo Cookxpgain=%Cookxpgain%
echo Cookcurxp=%Cookcurxp%
echo Cookxpleft=%Cookxpleft%
echo Fishinglvl=%Fishinglvl%
echo Fishingxpremain=%Fishingxpremain%
echo Fishingxpgain=%Fishingxpgain%
echo Fishingcurxp=%Fishingcurxp%
echo Fishingxpleft=%Fishingxpleft%
echo Mininglvl=%Mininglvl%
echo Miningxpremain=%Miningxpremain%
echo Miningxpgain=%Miningxpgain%
echo Miningcurxp=%Miningcurxp%
echo Miningxpleft=%Miningxpleft%
echo Smithinglvl=%Smithinglvl%
echo Smithingxpremain=%Smithingxpremain%
echo Smithingxpgain=%Smithingxpgain%
echo Smithingcurxp=%Smithingcurxp%
echo Smithingxpleft=%Smithingxpleft%
echo Thievinglvl=%Thievinglvl%
echo Thievingxpremain=%Thievingxpremain%
echo Thievingxpgain=%Thievingxpgain%
echo Thievingcurxp=%Thievingcurxp%
echo Thievingxpleft=%Thievingxpleft%
echo ttllvl=%ttllvl%
echo.
pause>nul
goto admincommands


:color
title FinalRealm - Settings - Color Change
cls
echo.
echo What would you like to change the color to?
echo.
echo 0 = Black		8 = Gray
echo 1 = Blue 		9 = Light Blue
echo 2 = Green 		A = Light Green
echo 3 = Aqua 		B = Light Aqua
echo 4 = Red 		C = Light Red
echo 5 = Purple 		D = Light Purple
echo 6 = Yellow 		E = Light Yellow
echo 7 = White 		F = Bright White
echo.
echo Type the color combination you would like, or type "exit" to exit.
echo (example: 0f)
echo.
set /p colorcho=
if %colorcho% EQU exit goto settings
color %colorcho%
goto color


:namechange
title FinalRealm - Username Change
cls
echo.
set /p name1=Please enter your current Username:
if not exist "%name1%.bat" (
echo Invalid Username.
pause>nul
goto settings
)
set /p pass1=Please enter your current Password:
call %name1%.bat
if not %password1% EQU %pass1% (
echo Invalid Password.
pause>nul
goto settings
)
echo What would you like to change your Username to?
set /p username1=
set v1f=0

:checkforspaces2
set x=!v1f!
set Letter%v1f%=!username1:~%x%,1!
if "!Letter%v1f%!" EQU " " (
echo.
echo.
echo Sorry you cant use spaces in your Username.
pause>nul
goto entergame
)
if NOT "!Letter%v1f%!" EQU "" (
set /a v1f=%v1f%+1
goto checkforspaces2
)
echo Username Changed.
echo.
pause>nul
goto settings


:passchange
title FinalRealm - Username Change
cls
echo.
set /p name1=Please enter your current Username:
if not exist "%name1%.bat" (
echo Invalid Username.
pause>nul
goto settings
)
set /p pass1=Please enter your current Password:
call %name1%.bat
if not %password1% EQU %pass1% (
echo Invalid Password.
pause>nul
goto settings
)
echo What would you like to change your Password to?
set /p password1=
echo.
echo Password changed.
echo.
pause>nul
goto settings




:ColorText [%1 = Color] [%2 = Text]
set /p ".=." > "%~2" <nul 
findstr /v /a:%1 /R "^$" "%~2" nul 2>nul
set /p ".=" <nul
if "%3" == "end" set /p ".=  " <nul
del "%~2" >nul 2>nul
exit /b

