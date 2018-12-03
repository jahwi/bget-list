@echo off
title Monopoly
color 0f
setlocal enabledelayedexpansion

call :SetFields

goto :StartMain

::::BgetDescription#Monopoly in batch.
::::BgetAuthor#GrellesLicht28
::::BgetCategory#game

:: Start of setting fields
 :SetFields
:SetFields
:: Player 1
if not defined Field1_1 set Field1_1= 
if not defined Field2_1 set Field2_1=A
if not defined Field3_1 set Field3_1= 
if not defined Field4_1 set Field4_1= 
if not defined Field5_1 set Field5_1= 
if not defined Field6_1 set Field6_1= 
if not defined Field7_1 set Field7_1=A
if not defined Field8_1 set Field8_1= 
if not defined Field9_1 set Field9_1=A
if not defined Field10_1 set Field10_1=A
if not defined Field11_1 set Field11_1=i
if not defined Field11_J_1 set Field11_J_1= 
if not defined Field12_1 set Field12_1= 
if not defined Field13_1 set Field13_1= 
if not defined Field14_1 set Field14_1= 
if not defined Field15_1 set Field15_1= 
if not defined Field16_1 set Field16_1= 
if not defined Field17_1 set Field17_1= 
if not defined Field18_1 set Field18_1= 
if not defined Field19_1 set Field19_1= 
if not defined Field20_1 set Field20_1= 
if not defined Field21_1 set Field21_1= 
if not defined Field22_1 set Field22_1=A
if not defined Field23_1 set Field23_1= 
if not defined Field24_1 set Field24_1=A
if not defined Field25_1 set Field25_1=A
if not defined Field26_1 set Field26_1= 
if not defined Field27_1 set Field27_1=A
if not defined Field28_1 set Field28_1=A
if not defined Field29_1 set Field29_1= 
if not defined Field30_1 set Field30_1= 
if not defined Field31_1 set Field31_1= 
if not defined Field32_1 set Field32_1= 
if not defined Field33_1 set Field33_1=l
if not defined Field34_1 set Field34_1= 
if not defined Field35_1 set Field35_1= 
if not defined Field36_1 set Field36_1= 
if not defined Field37_1 set Field37_1= 
if not defined Field38_1 set Field38_1= 
if not defined Field39_1 set Field39_1= 
if not defined Field40_1 set Field40_1= 

:: Player 2
if not defined Field1_2 set Field1_2= 
if not defined Field2_2 set Field2_2=e
if not defined Field3_2 set Field3_2= 
if not defined Field4_2 set Field4_2= 
if not defined Field5_2 set Field5_2= 
if not defined Field6_2 set Field6_2= 
if not defined Field7_2 set Field7_2=e
if not defined Field8_2 set Field8_2= 
if not defined Field9_2 set Field9_2=e
if not defined Field10_2 set Field10_2=e
if not defined Field11_2 set Field11_2= 
if not defined Field11_J_2 set Field11_J_2= 
if not defined Field12_2 set Field12_2= 
if not defined Field13_2 set Field13_2= 
if not defined Field14_2 set Field14_2= 
if not defined Field15_2 set Field15_2= 
if not defined Field16_2 set Field16_2= 
if not defined Field17_2 set Field17_2= 
if not defined Field18_2 set Field18_2= 
if not defined Field19_2 set Field19_2= 
if not defined Field20_2 set Field20_2= 
if not defined Field21_2 set Field21_2= 
if not defined Field22_2 set Field22_2=e
if not defined Field23_2 set Field23_2= 
if not defined Field24_2 set Field24_2=e
if not defined Field25_2 set Field25_2=e
if not defined Field26_2 set Field26_2= 
if not defined Field27_2 set Field27_2=e
if not defined Field28_2 set Field28_2=e
if not defined Field29_2 set Field29_2= 
if not defined Field30_2 set Field30_2= 
if not defined Field31_2 set Field31_2= 
if not defined Field32_2 set Field32_2= 
if not defined Field33_2 set Field33_2= 
if not defined Field34_2 set Field34_2= 
if not defined Field35_2 set Field35_2= 
if not defined Field36_2 set Field36_2= 
if not defined Field37_2 set Field37_2=?
if not defined Field38_2 set Field38_2= 
if not defined Field39_2 set Field39_2= 
if not defined Field40_2 set Field40_2= 
exit /b
:: End of setting fields




:: Instructions start here.
 :Instructions
:Instructions
cls
echo Instructions of Monopoly
echo îîîîîîîîîîîîîîîîîîîîîîîî
echo  1. Each player starts with $1500. Their characters are placed on the field
echo     "Go" in the beginning of the game.
echo  2. Every round, the current player has to throw two dice which have 6 sides.
echo     The amount thrown is between 2 and 12.
echo.
echo  3. If a player gets on a street or a railroad, he or she can buy it, if it
echo     is unowned, yet. Else the player has to pay the rent to the owner depending
echo     on the amount of houses or hotels (or railroads).
echo  4. If a player arrives to any other field, he has to follow the instructions
echo     given on the field.
echo.
echo  5. Money, which is paid to the bank, goes into "Free Parking" (except for the
echo     $50 to escape from Jail). This money can be recollected by arriving on this
echo     field.
echo  6. It is not allowed to share money with the other player without arriving on
echo     one of his or her streets, railroads or companies, selling the
echo     Get-Out-Of-Jail-Free-card or having to follow the instructions of a
echo     community chest- or event card.
echo.
echo  7. There are 16 community chest cards and 16 event cards. They are not chosen
echo     by following an order, but they are chosen randomly. This allows the same
echo     card one after the other.
echo  8. The Get-Out-Of-Jail-Free-Card can only be owned once. If got, this card
echo     cannot be chosen by random anymore until it is used or sold.
echo  9. You cannot own two Get-Out-Of-Jail-Free-Cards.
echo.
echo 10. You can only buy houses by arriving right on the field you want to buy
echo     some.
echo 11. You can buy 4 houses on each of the 22 streets. The fifth house will be
echo     returned into a hotel. The other houses disappear in this case.
echo 12. There is no limit of total houses or hotels to use in the entire game
echo     unless all of the streets got a hotel.
echo.
echo 13. If you throw three doublets in a row, you are sent to Jail.
echo 14. In Jail, you can try a doublet at last for three times. Then you have to
echo     pay $50. If you don't want to try to roll a doublet, you can pay $50 to
echo     escape everytime or you can use your Get-Out-Of-Jail-Free-Card if owned.
echo 15. If you are "just visiting" the Jail, nothing will happen.
echo.
echo 16. By passing "Go", you receive $200. By arriving onto the field "Go", you
echo     receive $400.
echo 17. If you get a card which changes your current position, you receive $200 by
echo     passing "Go".
echo 18. You do not receive $200 if you are sent to Jail, no matter if passing "Go"
echo     or not.
echo.
echo 19. The game ends when one player loses all his or her money. The player is not
echo     allowed to sell any property like houses, hotels, streets, railroads,
echo     companies or cards anymore.
echo.
set /p Pause=
exit /b
:: Instructions end here.



 :StartMain
:StartMain
cls
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º Choose your character:           º
echo º   1: Û                           º
echo º   2:  ²                          º
echo º   3: ±                           º
echo º   4:  °                          º
echo º                                  º
echo ºEnter "instructions" to read them.º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
set /p Character1=Player 1: Character no. 
set /p Character2=Player 2: Character no. 
if "%Character1%" == "1" set Char_1=Û
if "%Character1%" == "2" set Char_1=²
if "%Character1%" == "3" set Char_1=±
if "%Character1%" == "4" set Char_1=°
if /i "%Character1%" == "instructions" call :Instructions
if "%Character2%" == "1" set Char_2=Û
if "%Character2%" == "2" set Char_2=²
if "%Character2%" == "3" set Char_2=±
if "%Character2%" == "4" set Char_2=°
if /i "%Character2%" == "instructions" call :Instructions
if not defined Char_1 goto :StartMain
if not defined Char_2 goto :StartMain
if "%Char_1%" == "%Char_2%" (
	echo You cannot use the same character twice.
	pause
	goto :StartMain
)


set DiceAmount=0
set Escape_1=4
set Escape_2=4
set Field1_1=%Char_1%
set Field1_2=%Char_2%
set Money_1=1500
set Money_2=1500
set Money_Parking=0
set Player=1
set Player1Position=1
set Player2Position=1


mode con cols=91 lines=60
 :FIELD
:FIELD
cls
set OutOfJail=0
if not "%1" == "StepDone" set Go=0
if not "%1" == "Chance_Walked" set RentalTwice=0
set Player=!Player!
echo ÚÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo ³ Free       ³Kentu-³Chance³India-³Illi- ³B.^& O.³Atlan-³Veni- ³Water ³Marvin³  GO  TO    ³
echo ³   ÜßßßÜ    ³  cky ³  ??  ³  na  ³ nois ³ RAIL-³ tic  ³ nor  ³Works ³ Gar- ³ °°°°°      ³
echo ³!Field21_1!  ÛÜÜÜÛ   !Field21_2!³!Field22_1!venu!Field22_2!³!Field23_1!?  ?!Field23_2!³!Field24_1!venu!Field24_2!³!Field25_1!venu!Field25_2!³!Field26_1!ROAD!Field26_2!³!Field27_1!venu!Field27_2!³!Field28_1!venu!Field28_2!³!Field29_1!    !Field29_2!³!Field30_1!dens!Field30_2!³!Field31_1! °°°      !Field31_2!³
echo ³  ÜÛÛÜÛÛÜ   ³      ³   ?  ³      ³      ³      ³      ³      ³      ³      ³   °        ³
echo ³   °   °    ³Price ³  ?   ³Price ³Price ³Price ³Price ³Price ³Price ³Price ³            ³
echo ³  Parking   ³ $220 ³  ?   ³ $220 ³ $240 ³ $200 ³ $260 ³ $260 ³ $150 ³ $280 ³   °   JAIL ³
echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄ´
echo ³  New York  ³          ________                                            ³  Pacific   ³
echo ³!Field20_1!  Avenue  !Field20_2!³         /       /                                            ³!Field32_1!  Avenue  !Field32_2!³
echo ³Price: $200 ³        /       /                  ±   ±                      ³Price: $300 ³
echo ÃÄÄÄÄÄÄÄÄÄÄÄÄ´       /       /            ±       ± ±                       ÃÄÄÄÄÄÄÄÄÄÄÄÄ´
echo ³ Tennessee  ³      /       /              ±       ±                        ³North Caro- ³
echo ³!Field19_1!  Avenue  !Field19_2!³     /_______/                ±       ±                       ³!Field33_1!ina Avenue!Field33_2!³
echo ³Price: $180 ³  Community Chest              ±   ±   ±                      ³Price: $300 ³
echo ÃÄÄÄÄÄÄÄÄÄÄÄÄ´                                ± ±     ±                     ÃÄÄÄÄÄÄÄÄÄÄÄÄ´
echo ³ Community  ³                             ±   ±                            ³ Community  ³
echo ³!Field18_1!  Chest   !Field18_2!³                            ± ±                               ³!Field34_1!  Chest   !Field34_2!³
echo ³            ³                           ±   ±                              ³            ³
echo ÃÄÄÄÄÄÄÄÄÄÄÄÄ´                            ± ±                               ÃÄÄÄÄÄÄÄÄÄÄÄÄ´
echo ³ St. James  ³                         ±   ±                                ³Pennsylvania³
echo ³!Field17_1!  Place   !Field17_2!³                        ± ±                                   ³!Field35_1!  Avenue  !Field35_2!³
echo ³Price: $180 ³                       ±   ±                                  ³Price: $320 ³
echo ÃÄÄÄÄÄÄÄÄÄÄÄÄ´                        ± ±                                   ÃÄÄÄÄÄÄÄÄÄÄÄÄ´
echo ³PENNSYLVANIA³                     ±   ±                                    ³ SHORT LINE ³
echo ³!Field16_1! RAILROAD !Field16_2!³                    ± ±   ±                                   ³!Field36_1!          !Field36_2!³
echo ³Price: $200 ³                   ±   ±   ±                                  ³Price: $200 ³
echo ÃÄÄÄÄÄÄÄÄÄÄÄÄ´                    ± ±                                       ÃÄÄÄÄÄÄÄÄÄÄÄÄ´
echo ³  Virginia  ³                 ±   ±                                        ³  ??  Chance³
echo ³!Field15_1!  Avenue  !Field15_2!³                ± ±                                           ³!Field37_1!?  ??  ?  !Field37_2!³
echo ³Price: $160 ³               ±   ±                                          ³  ?   ??    ³
echo ÃÄÄÄÄÄÄÄÄÄÄÄÄ´                ±                                             ÃÄÄÄÄÄÄÄÄÄÄÄÄ´
echo ³   States   ³             ±   ±                                            ³ Park Place ³
echo ³!Field14_1!  Avenue  !Field14_2!³            ± ±                                               ³!Field38_1!          !Field38_2!³
echo ³Price: $140 ³           ±   ±                                              ³Price: $350 ³
echo ÃÄÄÄÄÄÄÄÄÄÄÄÄ´        ±   ± ±                                               ÃÄÄÄÄÄÄÄÄÄÄÄÄ´
echo ³  Electric  ³       ± ±   ±                                 C  ________    ³ LUXURY TAX ³
echo ³!Field13_1!  Company !Field13_2!³      ±   ±                                   h  /       /    ³!Field39_1!          !Field39_2!³
echo ³Price: $150 ³     ± ±   ±                                 a  /       /     ³  Pay $75   ³
echo ÃÄÄÄÄÄÄÄÄÄÄÄÄ´    ±   ±                                   n  /       /      ÃÄÄÄÄÄÄÄÄÄÄÄÄ´
echo ³St. Charles ³     ±   ±                                 c  /       /       ³ Boardwalk  ³
echo ³!Field12_1!  Place   !Field12_2!³      ±                                   e  /_______/        ³!Field40_1!          !Field40_2!³
echo ³Price: $140 ³       ±                                                      ³Price: $400 ³
echo ÃÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄ´
echo ³Just³ IN    ³Connec³Ver-  ³Chance³Orien-³READIN³INCOME³Baltic³      ³Medite³Collect $200³
echo ³v   ³ÉÍËÍËÍ»³ticut ³  mont³  ??  ³tal   ³RAIL- ³ TAX  ³Avenue³Commu-³r...  ³as you pass ³
echo ³!Field11_1!  !Field11_2!³º!Field11_J_1!º º!Field11_J_2!º³!Field10_1!venu!Field10_2!³!Field9_1!venu!Field9_2!³!Field8_1!?  ?!Field8_2!³!Field7_1!venu!Field7_2!³!Field6_1!ROAD!Field6_2!³!Field5_1!    !Field5_2!³!Field4_1!    !Field4_2!³!Field3_1!nity!Field3_2!³!Field2_1!venu!Field2_2!³!Field1_1!          !Field1_2!³
echo ³s   ³º º º º³      ³      ³   ?  ³      ³      ³Pay   ³      ³      ³      ³ Ûßßß ÜÜÜÜ  ³
echo ³i   ³ÈÍÊÍÊÍ¼³Price ³Price ³  ?   ³Price ³Price ³10%% or³Price ³Chest ³Price ³ Û ßÜ Û  Û  ³
echo ³ting³  JAIL ³ $120 ³ $100 ³  ?   ³ $100 ³ $200 ³$200  ³  $60 ³      ³  $60 ³ ßßßß ßßßß  ³
echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÙ


if "%1" == "StepDone" exit /b
if "%1" == "Chance_Walked" goto :StartComparingPositions
if "!Field11_J_%Player%!" == "!Char_%Player%!" call :InJail
if "%OutOfJail%" == "1" goto :FIELD


 :RecallDisplay
:RecallDisplay
echo.
echo Player %Player% (!Char_%Player%!)'s turn:
 

:: Checks every street if owned by the current player.
echo Streets owned:
set Display_%Player%=
set Display_Amount_%Player%=0
FOR %%A IN (MediterraneanAvenue BalticAvenue ReadingRailroad OrientalAvenue VermontAvenue ConnecticutAvenue St.CharlesPlace ElectricCompany StatesAvenue VirginiaAvenue PennsylvaniaRailroad St.JamesPlace TennesseeAvenue NewYorkAvenue KentuckyAvenue IndianaAvenue IllinoisAvenue B.O.Railroad AtlanticAvenue VeninorAvenue WaterWorks MarvinGardens PacificAvenue NorthCarolinaAvenue PennsylvaniaAvenue ShortLine ParkPlace Boardwalk) DO (
	if "!%%A!" == "%Player%" (
		if not "!Display_Amount_%Player%!" == "4" (set Display_%Player%=!Display_%Player%!%%A / ) ELSE (set Display_%Player%=!Display_%Player%!%%A)
		set /a Display_Amount_%Player%=!Display_Amount_%Player%! + 1
		if "!Display_Amount_%Player%!" == "4" (
			echo !Display_%Player%!
			set Display_Amount_%Player%=0
			set Display_%Player%=
		)
	)
	if "%%A" == "Boardwalk" if not "!Display_Amount_%Player%!" == "0" echo !Display_%Player%!
)
echo.
if "!FreeOutOfJail_%Player%!" == "1" (
	set OtherPlayer=
	set Sell_JailCard=
	set Accept_JailCard=
	echo You own a card to get out of jail for free.
	echo Enter "sell for XX" to sell it to the other player for XX dollars.
	set /p Sell_JailCard=
	if /i "!Sell_JailCard:~0,9!" == "sell for " (
		echo To the other player: Do you want to accept the price [!Sell_JailCard:~9,4!],
		echo then enter "Yes, I would like to.".
		set /p Accept_JailCard=
		if /i "!Accept_JailCard!" == "Yes, I would like to." (
			set Puffer=!Money_%Player%!
			set /a Money_%Player%=!Money_%Player%! + !Sell_JailCard:~9,4!
			echo ÄÄÄ^> Money increased from $!Puffer! by $!Sell_JailCard:~9,4! to $!Money_%Player%!.
			if "!Player!" == "1" (
				set Puffer=!Money_2!
				set /a Money_2=!Money_2! - !Sell_JailCard:~9,4!
				echo ÄÄÄ^> Money decreased from $!Puffer! by $!Sell_JailCard:~9,4! to $!Money_2!.
				if "!Money_2:~0,1!" == "-" (
					echo You have not enough money.
					set /a Money_1=!Money_1! - !Sell_JailCard:~9,4!
					set /a Money_2=!Money_2! + !Sell_JailCard:~9,4!
					echo      ÄÄÄ^> Money amounts set back.
				)
				set FreeOutOfJail_1=0
				set FreeOutOfJail_2=1
			) ELSE (
				set Puffer=!Money_1!
				set /a Money_1=!Money_1! - !Sell_JailCard:~9,4!
				echo ÄÄÄ^> Money decreased from $!Puffer! by $!Sell_JailCard:~9,4! to $!Money_1!.
				if "!Money_1:~0,1!" == "-" (
					echo You have not enough money.
					set /a Money_2=!Money_2! - !Sell_JailCard:~9,4!
					set /a Money_1=!Money_1! + !Sell_JailCard:~9,4!
					echo      ÄÄÄ^> Money amounts set back.
				)
				set FreeOutOfJail_2=0
				set FreeOutOfJail_1=1
			)
			if "!FreeOutOfJail_Chance!" == "!FreeOutOfJail_%Player%!" (
				set FreeOutOfJail_Chance=0
			) ELSE (
				set FreeOutOfJail_Community=0
			)
			set FreeOutOfJail_%Player%=0
		) ELSE (
		echo Trade cancelled.
		)
	)
) ELSE (
	echo Press any key to roll a dice...
	if not "%1" == "StepDone" pause >nul
)
if "%1" == "StepDone" exit /b

 :RollADice
:RollADice
:: Randomly roll two dices. The IF's make sure they are between 1 and 6.
set /a DiceOne=%random% %% 6 + 1
set /a DiceTwo=%random% %% 6 + 1


:: Resetting the current player's position.
set Field!Player%Player%Position!_%Player%=

:: Calculating the amount of steps to go. Also informs the user.
set /a Dice=%DiceOne% + %DiceTwo%
echo Dice one (%DiceOne%) + dice two (%DiceTwo%) = %Dice%
set /a Player%Player%Position=!Player%Player%Position! + %Dice%


:: Check if the player went over "GO".
if not "!Player%Player%Position:~1,1!" == "" if "!Player%Player%Position:~0,1!" GEQ "4" if "!Player%Player%Position:~1,1!" GTR "0" (
	set /a Player%Player%Position=!Player%Player%Position! - 40
	set Puffer=!Money_%Player%!
	if not "!Player%Player%Position!" == "1" (
		set /a Money_%Player%=!Money_%Player%! + 200
		set Go=1
	)
)


:: Set the new player's position.
set Field!Player%Player%Position!_%Player%=!Char_%Player%!

:: Reset the fields after having changed the position.
call :SetFields

pause >nul


 :RollDone
:RollDone

:: Showing the user the new position before dwelling on it.
call :FIELD StepDone

call :RecallDisplay StepDone
echo Dice one (%DiceOne%) + dice two (%DiceTwo%) = %Dice%
if "!Go!" == "1" echo ÄÄÄ^> Money increased from $!Puffer! by $200 to $!Money_%Player%!.


 :StartComparingPositions
:StartComparingPositions
pause >nul
:: Dwelling on the player's position.
if "!Field1_%Player%!" == "!Char_%Player%!" call :GO
if "!Field2_%Player%!" == "!Char_%Player%!" call :MediterraneanAvenue
if "!Field3_%Player%!" == "!Char_%Player%!" goto :CommunityChest
if "!Field4_%Player%!" == "!Char_%Player%!" call :BalticAvenue
if "!Field5_%Player%!" == "!Char_%Player%!" call :IncomeTax
if "!Field6_%Player%!" == "!Char_%Player%!" call :ReadingRailroad
if "!Field7_%Player%!" == "!Char_%Player%!" call :OrientalAvenue
if "!Field8_%Player%!" == "!Char_%Player%!" goto :Chance
if "!Field9_%Player%!" == "!Char_%Player%!" call :VermontAvenue
if "!Field10_%Player%!" == "!Char_%Player%!" call :ConnecticutAvenue
if "!Field11_%Player%!" == "!Char_%Player%!" call :AtJail
if "!Field12_%Player%!" == "!Char_%Player%!" call :St.CharlesPlace
if "!Field13_%Player%!" == "!Char_%Player%!" call :ElectricCompany
if "!Field14_%Player%!" == "!Char_%Player%!" call :StatesAvenue
if "!Field15_%Player%!" == "!Char_%Player%!" call :VirginiaAvenue
if "!Field16_%Player%!" == "!Char_%Player%!" call :PennsylvaniaRailroad
if "!Field17_%Player%!" == "!Char_%Player%!" call :St.JamesPlace
if "!Field18_%Player%!" == "!Char_%Player%!" goto :CommunityChest
if "!Field19_%Player%!" == "!Char_%Player%!" call :TennesseeAvenue
if "!Field20_%Player%!" == "!Char_%Player%!" call :NewYorkAvenue
if "!Field21_%Player%!" == "!Char_%Player%!" call :FreeParking
if "!Field22_%Player%!" == "!Char_%Player%!" call :KentuckyAvenue
if "!Field23_%Player%!" == "!Char_%Player%!" goto :Chance
if "!Field24_%Player%!" == "!Char_%Player%!" call :IndianaAvenue
if "!Field25_%Player%!" == "!Char_%Player%!" call :IllinoisAvenue
if "!Field26_%Player%!" == "!Char_%Player%!" call :B.O.Railroad
if "!Field27_%Player%!" == "!Char_%Player%!" call :AtlanticAvenue
if "!Field28_%Player%!" == "!Char_%Player%!" call :VeninorAvenue
if "!Field29_%Player%!" == "!Char_%Player%!" call :WaterWorks
if "!Field30_%Player%!" == "!Char_%Player%!" call :MarvinGardens
if "!Field31_%Player%!" == "!Char_%Player%!" call :SendToJail
if "!Field32_%Player%!" == "!Char_%Player%!" call :PacificAvenue
if "!Field33_%Player%!" == "!Char_%Player%!" call :NorthCarolinaAvenue
if "!Field34_%Player%!" == "!Char_%Player%!" goto :CommunityChest
if "!Field35_%Player%!" == "!Char_%Player%!" call :PennsylvaniaAvenue
if "!Field36_%Player%!" == "!Char_%Player%!" call :ShortLineRailroad
if "!Field37_%Player%!" == "!Char_%Player%!" goto :Chance
if "!Field38_%Player%!" == "!Char_%Player%!" call :ParkPlace
if "!Field39_%Player%!" == "!Char_%Player%!" call :LuxuryTax
if "!Field40_%Player%!" == "!Char_%Player%!" call :Boardwalk

if "%1" == "Chance_Walked" exit /b

 :After_StartComparingPositions
:After_StartComparingPositions


:: Changes the player
if "!Player!" == "1" (set Player=2) ELSE (set Player=1)



:: Counting the doublets
set goto_immediately=0
if defined DiceOne if defined DiceTwo if "%DiceOne%" == "%DiceTwo%" (
	set /a DiceAmount=!DiceAmount! + 1
	echo.
	echo You got a doublet [%DiceOne% - %DiceTwo%], you can do another round.
	if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
	set goto_immediately=1
	pause
)

::Checks if 3 doublets in a row. If so, sends the user to jail.
if "!DiceAmount!" == "3" if "%DiceOne%" == "%DiceTwo%" (
	echo You got 3 doublets in a row, you are now sent to jail.
	set goto_immediately=0
	pause
	call :SendToJail Doublets
)
if not "!goto_immediately!" == "1" set DiceAmount=0

goto :FIELD





:: Start of fields.


 :GO
:GO                   1
cls
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º                                                º
echo º        ²²²²²²²²²²²                             º
echo º       ²²²                                      º
echo º      ²²²                                       º
echo º     ²²²                                        º
echo º     ²²²    ²²²²²²          ²²²²²²²²            º
echo º     ²²²        ²²²        ²²      ²²           º
echo º      ²²²        ²²²       ²²      ²²           º
echo º       ²²²      ²²²        ²²      ²²           º
echo º        ²²²²²²²²²²          ²²²²²²²²            º
echo º                                                º
echo º                                                º
echo º                                                º
echo º                                                º
echo º Collect $200 as you pass or                    º
echo º collect $400 as you meet.                      º
echo º                                                º
echo º                                                º
echo º                                                º
echo º                                                º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo.
echo Current player: %Player% (!Char_%Player%!)
set Puffer=!Money_%Player%!
set /a Money_%Player%=!Money_%Player%! + 400
echo ÄÄÄ^> Money increased from $%Puffer% by $400 to $!Money_%Player%!.
echo.
pause
exit /b




 :MediterraneanAvenue
:MediterraneanAvenue  2
set Purchase=
set Buy_House=
set PayRent=
set Sell_Street=
if not defined MediterraneanAvenue_Houses set MediterraneanAvenue_Houses=0
cls
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º                        º
echo º  Mediterranean Avenue  º
echo º                        º
echo º   PRICE $60  RENT $2   º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º With 1 House       $10 º
echo º                        º
echo º With 2 Houses      $30 º
echo º                        º
echo º With 3 Houses      $90 º
echo º                        º
echo º With 4 Houses     $160 º
echo º                        º
echo º With HOTEL        $250 º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º  One house costs $50   º
echo º                        º
echo º   Mortgage value $30   º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º                        º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo.
echo Current player: %Player% (!Char_%Player%!)
echo Total money: !Money_%Player%!
echo.
if "!MediterraneanAvenue!" == "%Player%" goto :MediterraneanAvenue_Houses
if defined MediterraneanAvenue goto :MediterraneanAvenue_PayRent
echo Press [1] to buy this street for $60 or
echo press [2] to leave it.
set /p Purchase=
if "%Purchase%" == "1" (
	set Puffer=!Money_%Player%!
	set /a Money_%Player%=!Money_%Player%! - 60
	if "!Money_%Player%:~0,1!" == "-" (
		echo You have not enough money.
		set /a Money_%Player%=!Money_%Player%! + 60
	) ELSE (
		echo ÄÄÄ^> Money decreased from $!Puffer! by $60 to $!Money_%Player%!.
		set MediterraneanAvenue=%Player%
	)
	pause
	exit /b
)
if "%Purchase%" == "2" exit /b
goto :MediterraneanAvenue
 :MediterraneanAvenue_Houses
:MediterraneanAvenue_Houses
if "!MediterraneanAvenue_Houses!" == "5" (
	echo This street has got a hotel.
	pause
	exit /b
) ELSE (
	echo This street has got !MediterraneanAvenue_Houses! houses, yet.
	echo.
)
echo Press [1] to buy a new house or
echo press [2] to leave it or
echo press [3] to sell it for $30.
set /p Buy_House=
echo.
if "%Buy_House%" == "1" (
	set Puffer=!Money_%Player%!
	set /a Money_%Player%=!Money_%Player%! - 50
	if "!Money_%Player%:~0,1!" == "-" (
		echo You have not enough money.
		set /a Money_%Player%=!Money_%Player%! + 50
	) ELSE (
		echo ÄÄÄ^> Money decreased from $!Puffer! by $50 to $!Money_%Player%!.
		set /a MediterraneanAvenue_Houses=!MediterraneanAvenue_Houses! + 1
		if not "!MediterraneanAvenue_Houses!" == "5" (echo This street has got !MediterraneanAvenue_Houses! houses now.) ELSE (echo This street has got a hotel now.)
	)
	pause
	exit /b
)
if "%Buy_House%" == "2" exit /b
if "%Buy_House%" == "3" (
	echo Are you sure you want to sell the street? [Y/N]
	set /p Sell_Street=
	if /i "!Sell_Street!" == "n" exit /b
	if /i "!Sell_Street!" == "y" (
		set Puffer=!Money_%Player%!
		set /a Money_%Player%=!Money_%Player%! + 30
		echo ÄÄÄ^> Money increased from $!Puffer! by $30 to $!Money_%Player%!.
		set MediterraneanAvenue=
		set MediterraneanAvenue_Houses=0
	)
)
goto :MediterraneanAvenue_Houses
 :MediterraneanAvenue_PayRent
:MediterraneanAvenue_PayRent
if "!MediterraneanAvenue_Houses!" == "0" set PayRent=2
if "!MediterraneanAvenue_Houses!" == "1" set PayRent=10
if "!MediterraneanAvenue_Houses!" == "2" set PayRent=30
if "!MediterraneanAvenue_Houses!" == "3" set PayRent=90
if "!MediterraneanAvenue_Houses!" == "4" set PayRent=160
if "!MediterraneanAvenue_Houses!" == "5" set PayRent=250
echo This street is owned by the other player. You have to pay
echo $%PayRent% to pass.
set Puffer=!Money_%Player%!
set /a Money_%Player%=!Money_%Player%! - %PayRent%
echo ÄÄÄ^> Money decreased from $%Puffer% by $%PayRent% to $!Money_%Player%!.
if "!Money_%Player%:~0,1!" == "-" (
	echo.
	pause
	cls
	echo Player %Player% [!Char_%Player%!] is bankrupt.
	echo.
	if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
	echo Player !Player! wins the game.
	echo.
	pause
	exit
)
if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
set Player=!Player!
set Puffer=!Money_%Player%!
set /a Money_%Player%=!Money_%Player%! + %PayRent%
echo ÄÄÄ^> The other player's money increased from $%Puffer% by $%PayRent% to $!Money_%Player%!.
if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
set Player=!Player!
echo.
pause
exit /b





 :CommunityChest
:CommunityChest       3/18/34
cls
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º    Community Chest     º
echo º                        º
echo º      ################# º
echo º     #///////////////## º
echo º    #################I# º
echo º    #,,,,,,,,,,,,,,,#I# º
echo º    #,,,,,,,,,,,,,,,##  º
echo º    #,,,,,,,,,,,,,,,#   º
echo º    #################   º
echo º   #,,,,,,,,,,,,,,,##   º
echo º  #,,,,,,,,,,,,,,,#I#   º
echo º #################II#   º
echo º #jjjjjjjjjjjjjjj#II#   º
echo º #jjjjjjjjjjjjjjj#I#    º
echo º #jjjjjjjjjjjjjjj##     º
echo º #################      º
echo º                        º
echo º You found a community  º
echo º  chest, draw a card.   º
echo º                        º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo.
echo Current player: %Player% (!Char_%Player%!)
echo Total money: !Money_%Player%!
echo.
 :ChooseCommunityCard
:ChooseCommunityCard
set /a ChooseCommunityCard=%random:~0,2% %% 16 + 1
if "!FreeOutOfJail_Community!" == "1" if "%ChooseCommunityCard%" == "7" goto :ChooseCommunityCard
if "%ChooseCommunityCard%" == "1" set Var=%%A
if "%ChooseCommunityCard%" == "2" set Var=%%B
if "%ChooseCommunityCard%" == "3" set Var=%%C
if "%ChooseCommunityCard%" == "4" set Var=%%D
if "%ChooseCommunityCard%" == "5" set Var=%%E
if "%ChooseCommunityCard%" == "6" set Var=%%F
if "%ChooseCommunityCard%" == "7" set Var=%%G
if "%ChooseCommunityCard%" == "8" set Var=%%H
if "%ChooseCommunityCard%" == "9" set Var=%%I
if "%ChooseCommunityCard%" == "10" set Var=%%J
if "%ChooseCommunityCard%" == "11" set Var=%%K
if "%ChooseCommunityCard%" == "12" set Var=%%L
if "%ChooseCommunityCard%" == "13" set Var=%%M
if "%ChooseCommunityCard%" == "14" set Var=%%N
if "%ChooseCommunityCard%" == "15" set Var=%%O
if "%ChooseCommunityCard%" == "16" set Var=%%P
echo ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo ³ Community Card ³
echo ³                ³
FOR /F "tokens=1-16 delims=/" %%A IN ("³  Grand Opera   ³/³ Advance to Go. ³/³  You have won  ³/³  Doctor's fee. ³/³ Christmas fund ³/³  You inherit   ³/³Get ouf of Jail ³/³You are assessed³/³  From sale of  ³/³ Pay school tax ³/³   Income tax   ³/³  Receive for   ³/³  Pay hospital  ³/³ Go directly to ³/³ Life insurance ³/³ Bank error in  ³/") DO echo %Var%
FOR /F "tokens=1-16 delims=/" %%A IN ("³Opening: Collect³/³ Collect $400.  ³/³second prize in ³/³    Pay $50.    ³/³    matures.    ³/³     $100.      ³/³      free.     ³/³   for street   ³/³   stock you    ³/³    of $150.    ³/³     refund.    ³/³  serviced $25. ³/³     $100.      ³/³  Jail, do not  ³/³    matures.    ³/³  your favor.   ³/") DO echo %Var%
FOR /F "tokens=1-16 delims=/" %%A IN ("³ $50 from every ³/³                ³/³    a beauty    ³/³                ³/³  Collect $100. ³/³                ³/³ This card may  ³/³    repairs.    ³/³  receive $45.  ³/³                ³/³  Collect $20.  ³/³                ³/³                ³/³pass Go, do not ³/³  Collect $100. ³/³ Collect $200.  ³/") DO echo %Var%
FOR /F "tokens=1-16 delims=/" %%A IN ("³   player for   ³/³                ³/³    contest     ³/³                ³/³                ³/³                ³/³ be kept until  ³/³  Pay $40 per   ³/³                ³/³                ³/³                ³/³                ³/³                ³/³  collect $200. ³/³                ³/³                ³/") DO echo %Var%
FOR /F "tokens=1-16 delims=/" %%A IN ("³ opening night  ³/³                ³/³  Collect $10   ³/³                ³/³                ³/³                ³/³needed, or sold.³/³ house and $115 ³/³                ³/³                ³/³                ³/³                ³/³                ³/³                ³/³                ³/³                ³/") DO echo %Var%
FOR /F "tokens=1-16 delims=/" %%A IN ("³     seats.     ³/³                ³/³                ³/³                ³/³                ³/³                ³/³                ³/³   per hotel.   ³/³                ³/³                ³/³                ³/³                ³/³                ³/³                ³/³                ³/³                ³/") DO echo %Var%
echo ³                ³
echo ³                ³
echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
if "%ChooseCommunityCard%" == "1" (
	set Puffer=!Money_%Player%!
	set /a Money_%Player%=!Money_%Player%! + 50
	echo ÄÄÄ^> Money increased from $!Puffer! by $50 to $!Money_%Player%!.
)
if "%Player%" == "1" (set Player=2) ELSE (set Player=1)
set Player=!Player!
if "%ChooseCommunityCard%" == "1" (
	set Puffer=!Money_%Player%!
	set /a Money_%Player%=!Money_%Player%! - 50
	echo ÄÄÄ^> The other player's money decreased from $!Puffer! by $50 to $!Money_%Player%!.
	if "!Money_%Player%:~0,1!" == "-" (
		echo.
		pause
		cls
		echo Player %Player% [!Char_%Player%!] is bankrupt.
		echo.
		if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
		echo Player !Player! wins the game.
		echo.
		pause
		exit
	)
)
if "%Player%" == "1" (set Player=2) ELSE (set Player=1)
set Player=!Player!
if "%ChooseCommunityCard%" == "2" (
	set Field!Player%Player%Position!_%Player%= 
	set Player%Player%Position=1
	set Field1_%Player%=!Char_%Player%!
	pause
	call :SetFields
	call :FIELD Chance_Walked
)
if "%ChooseCommunityCard%" == "3" (
	set Puffer=!Money_%Player%!
	set /a Money_%Player%=!Money_%Player%! + 10
	echo ÄÄÄ^> Money increased from $!Puffer! by $10 to $!Money_%Player%!.
)
if "%ChooseCommunityCard%" == "4" (
	set Puffer=!Money_%Player%!
	set /a Money_%Player%=!Money_%Player%! - 50
	set /a Money_Parking=!Money_Parking! + 50
	echo ÄÄÄ^> Money decreased from $!Puffer! by $50 to $!Money_%Player%!.
	echo       ^& $50 went into Free Parking.
	if "!Money_%Player%:~0,1!" == "-" (
		echo.
		pause
		cls
		echo Player %Player% [!Char_%Player%!] is bankrupt.
		echo.
		if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
		echo Player !Player! wins the game.
		echo.
		pause
		exit
	)
)
if "%ChooseCommunityCard%" == "5" (
	set Puffer=!Money_%Player%!
	set /a Money_%Player%=!Money_%Player%! + 100
	echo ÄÄÄ^> Money increased from $!Puffer! by $100 to $!Money_%Player%!.
)
if "%ChooseCommunityCard%" == "6" (
	set Puffer=!Money_%Player%!
	set /a Money_%Player%=!Money_%Player%! + 100
	echo ÄÄÄ^> Money increased from $!Puffer! by $100 to $!Money_%Player%!.
)
if "%ChooseCommunityCard%" == "7" (
	set FreeOutOfJail_%Player%=1
	set FreeOutOfJail_Community=1
)
if "%ChooseCommunityCard%" == "8" (
	set Houses_%Player%=0
	set Hotels_%Player%=0
	set PayForHouses=0
	set PayForHotels=0
	set PayForHousesAndHotels=0
	FOR %%A IN (MediterraneanAvenue BalticAvenue ReadingRailroad OrientalAvenue VermontAvenue ConnecticutAvenue St.CharlesPlace ElectricCompany StatesAvenue VirginiaAvenue PennsylvaniaRailroad St.JamesPlace TennesseeAvenue NewYorkAvenue KentuckyAvenue IndianaAvenue IllinoisAvenue B.O.Railroad AtlanticAvenue VeninorAvenue WaterWorks MarvinGardens PacificAvenue NorthCarolinaAvenue PennsylvaniaAvenue ShortLine ParkPlace Boardwalk) DO (
		if "!%%A!" == "%Player%" (
			if not "!%%A_Houses!" == "5" (set /a Houses_%Player%=!Houses_%Player%! + !%%A_Houses!) ELSE (set /a Hotels_%Player%=!Hotels_%Player%! + 1)
		)
	)
	set /a PayForHouses=!Houses_%Player%! * 40
	set /a PayForHotels=!Hotels_%Player%! * 115
	echo You have to pay $!PayForHouses! for !Houses_%Player%! houses and
	echo you have to pay $!PayForHotels! for !Hotels_%Player%! hotels.
	echo.
	set /a PayForHousesAndHotels=!PayForHouses! + !PayForHotels!
	set Puffer=!Money_%Player%!
	set /a Money_%Player%=!Money_%Player%! - !PayForHousesAndHotels!
	set /a Money_Parking=!Money_Parking! + !PayForHousesAndHotels!
	echo ÄÄÄ^> Money decreased from $!Puffer! by $!PayForHousesAndHotels! to $!Money_%Player%!.
	echo       ^& $!PayForHousesAndHotels! went into Free Parking.
	if "!Money_%Player%:~0,1!" == "-" (
		echo.
		pause
		cls
		echo Player %Player% [!Char_%Player%!] is bankrupt.
		echo.
		if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
		echo Player !Player! wins the game.
		echo.
		pause
		exit
	)
)
if "%ChooseCommunityCard%" == "9" (
	set Puffer=!Money_%Player%!
	set /a Money_%Player%=!Money_%Player%! + 45
	echo ÄÄÄ^> Money increased from $!Puffer! by $45 to $!Money_%Player%!.
)
if "%ChooseCommunityCard%" == "10" (
	set Puffer=!Money_%Player%!
	set /a Money_%Player%=!Money_%Player%! - 150
	set /a Money_Parking=!Money_Parking! + 150
	echo ÄÄÄ^> Money decreased from $!Puffer! by $150 to $!Money_%Player%!.
	echo       ^& $150 went into Free Parking.
	if "!Money_%Player%:~0,1!" == "-" (
		echo.
		pause
		cls
		echo Player %Player% [!Char_%Player%!] is bankrupt.
		echo.
		if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
		echo Player !Player! wins the game.
		echo.
		pause
		exit
	)
)
if "%ChooseCommunityCard%" == "11" (
	set Puffer=!Money_%Player%!
	set /a Money_%Player%=!Money_%Player%! + 20
	echo ÄÄÄ^> Money increased from $!Puffer! by $20 to $!Money_%Player%!.
)
if "%ChooseCommunityCard%" == "12" (
	set Puffer=!Money_%Player%!
	set /a Money_%Player%=!Money_%Player%! + 25
	echo ÄÄÄ^> Money increased from $!Puffer! by $25 to $!Money_%Player%!.
)
if "%ChooseCommunityCard%" == "13" (
	set Puffer=!Money_%Player%!
	set /a Money_%Player%=!Money_%Player%! - 100
	set /a Money_Parking=!Money_Parking! + 100
	echo ÄÄÄ^> Money decreased from $!Puffer! by $100 to $!Money_%Player%!.
	echo       ^& $100 went into Free Parking.
	if "!Money_%Player%:~0,1!" == "-" (
		echo.
		pause
		cls
		echo Player %Player% [!Char_%Player%!] is bankrupt.
		echo.
		if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
		echo Player !Player! wins the game.
		echo.
		pause
		exit
	)
)
if "%ChooseCommunityCard%" == "14" (
	pause
	call :SendToJail
)
if "%ChooseCommunityCard%" == "15" (
	set Puffer=!Money_%Player%!
	set /a Money_%Player%=!Money_%Player%! + 100
	echo ÄÄÄ^> Money increased from $!Puffer! by $100 to $!Money_%Player%!.
)
if "%ChooseCommunityCard%" == "16" (
	set Puffer=!Money_%Player%!
	set /a Money_%Player%=!Money_%Player%! + 200
	echo ÄÄÄ^> Money increased from $!Puffer! by $200 to $!Money_%Player%!.
)
pause
goto :After_StartComparingPositions




 :BalticAvenue
:BalticAvenue         4
set Purchase=
set Buy_House=
set PayRent=
set Sell_Street=
if not defined BalticAvenue_Houses set BalticAvenue_Houses=0
cls
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º                        º
echo º     Baltic Avenue      º
echo º                        º
echo º   PRICE $60  RENT $4   º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º With 1 House       $20 º
echo º                        º
echo º With 2 Houses      $60 º
echo º                        º
echo º With 3 Houses     $180 º
echo º                        º
echo º With 4 Houses     $320 º
echo º                        º
echo º With HOTEL        $450 º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º  One house costs $50   º
echo º                        º
echo º   Mortgage value $30   º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º                        º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo.
echo Current player: %Player% (!Char_%Player%!)
echo Total money: !Money_%Player%!
echo.
if "!BalticAvenue!" == "%Player%" goto :BalticAvenue_Houses
if defined BalticAvenue goto :BalticAvenue_PayRent
echo Press [1] to buy this street for $60 or
echo press [2] to leave it.
set /p Purchase=
if "%Purchase%" == "1" (
	set Puffer=!Money_%Player%!
	set /a Money_%Player%=!Money_%Player%! - 60
	if "!Money_%Player%:~0,1!" == "-" (
		echo You have not enough money.
		set /a Money_%Player%=!Money_%Player%! + 60
	) ELSE (
		echo ÄÄÄ^> Money decreased from $!Puffer! by $60 to $!Money_%Player%!.
		set BalticAvenue=%Player%
	)
	pause
	exit /b
)
if "%Purchase%" == "2" exit /b
goto :BalticAvenue
 :BalticAvenue_Houses
:BalticAvenue_Houses
if "!BalticAvenue_Houses!" == "5" (
	echo This street has got a hotel.
	pause
	exit /b
) ELSE (
	echo This street has got !BalticAvenue_Houses! houses, yet.
	echo.
)
echo Press [1] to buy a new house or
echo press [2] to leave it or
echo press [3] to sell it for $30.
set /p Buy_House=
echo.
if "%Buy_House%" == "1" (
	set Puffer=!Money_%Player%!
	set /a Money_%Player%=!Money_%Player%! - 50
	if "!Money_%Player%:~0,1!" == "-" (
		echo You have not enough money.
		set /a Money_%Player%=!Money_%Player%! + 50
	) ELSE (
		echo ÄÄÄ^> Money decreased from $!Puffer! by $50 to $!Money_%Player%!.
		set /a BalticAvenue_Houses=!BalticAvenue_Houses! + 1
		if not "!BalticAvenue_Houses!" == "5" (echo This street has got !BalticAvenue_Houses! houses now.) ELSE (echo This street has got a hotel now.)
	)
	pause
	exit /b
)
if "%Buy_House%" == "2" exit /b
if "%Buy_House%" == "3" (
	echo Are you sure you want to sell the street? [Y/N]
	set /p Sell_Street=
	if /i "!Sell_Street!" == "n" exit /b
	if /i "!Sell_Street!" == "y" (
		set Puffer=!Money_%Player%!
		set /a Money_%Player%=!Money_%Player%! + 30
		echo ÄÄÄ^> Money increased from $!Puffer! by $30 to $!Money_%Player%!.
		set BalticAvenue=
		set BalticAvenue_Houses=0
	)
)
goto :BalticAvenue_Houses
 :BalticAvenue_PayRent
:BalticAvenue_PayRent
if "!BalticAvenue_Houses!" == "0" set PayRent=4
if "!BalticAvenue_Houses!" == "1" set PayRent=20
if "!BalticAvenue_Houses!" == "2" set PayRent=60
if "!BalticAvenue_Houses!" == "3" set PayRent=180
if "!BalticAvenue_Houses!" == "4" set PayRent=320
if "!BalticAvenue_Houses!" == "5" set PayRent=450
echo This street is owned by the other player. You have to pay
echo $%PayRent% to pass.
set Puffer=!Money_%Player%!
set /a Money_%Player%=!Money_%Player%! - %PayRent%
echo ÄÄÄ^> Money decreased from $%Puffer% by $%PayRent% to $!Money_%Player%!.
if "!Money_%Player%:~0,1!" == "-" (
	echo.
	pause
	cls
	echo Player %Player% [!Char_%Player%!] is bankrupt.
	echo.
	if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
	echo Player !Player! wins the game.
	echo.
	pause
	exit
)
if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
set Player=!Player!
set Puffer=!Money_%Player%!
set /a Money_%Player%=!Money_%Player%! + %PayRent%
echo ÄÄÄ^> The other player's money increased from $%Puffer% by $%PayRent% to $!Money_%Player%!.
if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
set Player=!Player!
echo.
pause
exit /b




 :IncomeTax
:IncomeTax            5
set IncomeTax=
cls
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º        INCOME          º
echo º                        º
echo º         TAX            º
echo º                        º
echo º                        º
echo º   You can pay 10%% of   º
echo º                        º
echo º    your total money    º
echo º                        º
echo º  amount or you can pay º
echo º                        º
echo º$200 to pass this field.º
echo º                        º
echo º                        º
echo º                        º
echo º                        º
echo º                        º
echo º                        º
echo º                        º
echo º                        º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo.
echo Current player: %Player% (!Char_%Player%!)
echo Total money: !Money_%Player%!
echo.
echo Press [1] to pay 10%% of your total money or
echo press [2] to pay $200.
set /p IncomeTax=
if "%IncomeTax%" == "1" (
	set /a Decrease=!Money_%Player%! / 10
	set Puffer=!Money_%Player%!
	set /a Money_%Player%=!Money_%Player%! - !Decrease!
	set /a Money_Parking=!Money_Parking! + !Decrease!
	echo ÄÄÄ^> Money decreased from $!Puffer! by $!Decrease! to $!Money_%Player%!.
	echo       ^& $!Decrease! went into Free Parking.
	set IncomeTax=Done
)
if "%IncomeTax%" == "2" (
	set Puffer=!Money_%Player%!
	set /a Money_%Player%=!Money_%Player%! - 200
	if "!Money_%Player%:~0,1!" == "-" (
		echo You have not enough money.
		set /a Money_%Player%=!Money_%Player%! + 200
	) ELSE (
		set /a Money_Parking=!Money_Parking! + 200
		echo ÄÄÄ^> Money decreased from $!Puffer! by $200 to $!Money_%Player%!.
		echo       ^& $200 went into Free Parking.
		set IncomeTax=Done
	)
)
if not "!IncomeTax!" == "Done" goto :IncomeTax
echo.
pause
exit /b




 :ReadingRailroad
:ReadingRailroad      6
set Purchase=
set PayRent=
set Buy_House=
set Sell_Street=
set RailroadAmount=0
cls
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º                        º
echo º    Reading Railroad    º
echo º                        º
echo º       PRICE $200       º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º                        º
echo º                        º
echo º If 1 owned         $25 º
echo º                        º
echo º If 2 owned         $50 º
echo º                        º
echo º If 3 owned        $100 º
echo º                        º
echo º If 4 owned        $200 º
echo º                        º
echo º                        º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º   Mortgage value $100  º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º                        º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo.
echo Current player: %Player% (!Char_%Player%!)
echo Total money: !Money_%Player%!
echo.
if "!ReadingRailroad!" == "%Player%" goto :ReadingRailroad_Houses
if defined ReadingRailroad goto :ReadingRailroad_PayRent
echo Press [1] to buy this railroad for $200 or
echo press [2] to leave it.
set /p Purchase=
if "%Purchase%" == "1" (
	set Puffer=!Money_%Player%!
	set /a Money_%Player%=!Money_%Player%! - 200
	if "!Money_%Player%:~0,1!" == "-" (
		echo You have not enough money.
		set /a Money_%Player%=!Money_%Player%! + 200
	) ELSE (
		echo ÄÄÄ^> Money decreased from $!Puffer! by $200 to $!Money_%Player%!.
		set ReadingRailroad=%Player%
	)
	pause
	exit /b
)
if "%Purchase%" == "2" exit /b
goto :ReadingRailroad
 :ReadingRailroad_Houses
:ReadingRailroad_Houses
echo This railroad is yours.
echo.
echo Press [2] to leave it or
echo press [3] to sell it for $100.
set /p Buy_House=
echo.
if "%Buy_House%" == "2" exit /b
if "%Buy_House%" == "3" (
	echo Are you sure you want to sell this railroad? [Y/N]
	set /p Sell_Street=
	if /i "!Sell_Street!" == "n" exit /b
	if /i "!Sell_Street!" == "y" (
		set Puffer=!Money_%Player%!
		set /a Money_%Player%=!Money_%Player%! + 100
		echo ÄÄÄ^> Money increased from $!Puffer! by $100 to $!Money_%Player%!.
		set ReadingRailroad=
	)
)
goto :ReadingRailroad_Houses
 :ReadingRailroad_PayRent
:ReadingRailroad_PayRent
if "%Player%" == "1" (set Player=2) ELSE (set Player=1)
set Player=!Player!
FOR %%A IN (ReadingRailroad PennsylvaniaRailroad B.O.Railroad ShortLineRailroad) DO if "!%%A!" == "%Player%" set /a RailroadAmount=!RailroadAmount! + 1
if "%Player%" == "1" (set Player=2) ELSE (set Player=1)
set Player=!Player!
echo The other player owns !RailroadAmount! of 4 railroads.
if "!RailroadAmount!" == "1" set PayRent=25
if "!RailroadAmount!" == "2" set PayRent=50
if "!RailroadAmount!" == "3" set PayRent=100
if "!RailroadAmount!" == "4" set PayRent=200
if "!RentalTwice!" == "1" set /a PayRent=%PayRent% * 2
set Puffer=!Money_%Player%!
set /a Money_%Player%=!Money_%Player%! - %PayRent%
echo ÄÄÄ^> Money decreased from $%Puffer% by $%PayRent% to $!Money_%Player%!.
if "!Money_%Player%:~0,1!" == "-" (
	echo.
	pause
	cls
	echo Player %Player% [!Char_%Player%!] is bankrupt.
	echo.
	if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
	echo Player !Player! wins the game.
	echo.
	pause
	exit
)
if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
set Player=!Player!
set Puffer=!Money_%Player%!
set /a Money_%Player%=!Money_%Player%! + %PayRent%
echo ÄÄÄ^> The other player's money increased from $%Puffer% by $%PayRent% to $!Money_%Player%!.
if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
set Player=!Player!
echo.
pause
exit /b




 :OrientalAvenue
:OrientalAvenue       7
set Purchase=
set Buy_House=
set PayRent=
set Sell_Street=
if not defined OrientalAvenue_Houses set OrientalAvenue_Houses=0
cls
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º                        º
echo º    Oriental Avenue     º
echo º                        º
echo º   PRICE $100  RENT $6  º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º With 1 House       $30 º
echo º                        º
echo º With 2 Houses      $90 º
echo º                        º
echo º With 3 Houses     $270 º
echo º                        º
echo º With 4 Houses     $400 º
echo º                        º
echo º With HOTEL        $550 º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º  One house costs $50   º
echo º                        º
echo º   Mortgage value $50   º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º                        º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo.
echo Current player: %Player% (!Char_%Player%!)
echo Total money: !Money_%Player%!
echo.
if "!OrientalAvenue!" == "%Player%" goto :OrientalAvenue_Houses
if defined OrientalAvenue goto :OrientalAvenue_PayRent
echo Press [1] to buy this street for $100 or
echo press [2] to leave it.
set /p Purchase=
if "%Purchase%" == "1" (
	set Puffer=!Money_%Player%!
	set /a Money_%Player%=!Money_%Player%! - 100
	if "!Money_%Player%:~0,1!" == "-" (
		echo You have not enough money.
		set /a Money_%Player%=!Money_%Player%! + 100
	) ELSE (
		echo ÄÄÄ^> Money decreased from $!Puffer! by $100 to $!Money_%Player%!.
		set OrientalAvenue=%Player%
	)
	pause
	exit /b
)
if "%Purchase%" == "2" exit /b
goto :OrientalAvenue
 :OrientalAvenue_Houses
:OrientalAvenue_Houses
if "!OrientalAvenue_Houses!" == "5" (
	echo This street has got a hotel.
	pause
	exit /b
) ELSE (
	echo This street has got !OrientalAvenue_Houses! houses, yet.
	echo.
)
echo Press [1] to buy a new house or
echo press [2] to leave it or
echo press [3] to sell it for $50.
set /p Buy_House=
echo.
if "%Buy_House%" == "1" (
	set Puffer=!Money_%Player%!
	set /a Money_%Player%=!Money_%Player%! - 50
	if "!Money_%Player%:~0,1!" == "-" (
		echo You have not enough money.
		set /a Money_%Player%=!Money_%Player%! + 50
	) ELSE (
		echo ÄÄÄ^> Money decreased from $!Puffer! by $50 to $!Money_%Player%!.
		set /a OrientalAvenue_Houses=!OrientalAvenue_Houses! + 1
		if not "!OrientalAvenue_Houses!" == "5" (echo This street has got !OrientalAvenue_Houses! houses now.) ELSE (echo This street has got a hotel now.)
	)
	pause
	exit /b
)
if "%Buy_House%" == "2" exit /b
if "%Buy_House%" == "3" (
	echo Are you sure you want to sell the street? [Y/N]
	set /p Sell_Street=
	if /i "!Sell_Street!" == "n" exit /b
	if /i "!Sell_Street!" == "y" (
		set Puffer=!Money_%Player%!
		set /a Money_%Player%=!Money_%Player%! + 50
		echo ÄÄÄ^> Money increased from $!Puffer! by $50 to $!Money_%Player%!.
		set OrientalAvenue=
		set OrientalAvenue_Houses=0
	)
)
goto :OrientalAvenue_Houses
 :OrientalAvenue_PayRent
:OrientalAvenue_PayRent
if "!OrientalAvenue_Houses!" == "0" set PayRent=6
if "!OrientalAvenue_Houses!" == "1" set PayRent=30
if "!OrientalAvenue_Houses!" == "2" set PayRent=90
if "!OrientalAvenue_Houses!" == "3" set PayRent=270
if "!OrientalAvenue_Houses!" == "4" set PayRent=400
if "!OrientalAvenue_Houses!" == "5" set PayRent=550
echo This street is owned by the other player. You have to pay
echo $%PayRent% to pass.
set Puffer=!Money_%Player%!
set /a Money_%Player%=!Money_%Player%! - %PayRent%
echo ÄÄÄ^> Money decreased from $%Puffer% by $%PayRent% to $!Money_%Player%!.
if "!Money_%Player%:~0,1!" == "-" (
	echo.
	pause
	cls
	echo Player %Player% [!Char_%Player%!] is bankrupt.
	echo.
	if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
	echo Player !Player! wins the game.
	echo.
	pause
	exit
)
if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
set Player=!Player!
set Puffer=!Money_%Player%!
set /a Money_%Player%=!Money_%Player%! + %PayRent%
echo ÄÄÄ^> The other player's money increased from $%Puffer% by $%PayRent% to $!Money_%Player%!.
if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
set Player=!Player!
echo.
pause
exit /b




 :Chance
:Chance               8/23/37
cls
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º         Chance         º
echo º                        º
echo º        KKKKKKK         º
echo º       KKKj  KKK        º
echo º      KKK     KKK       º
echo º      KKK     KKK       º
echo º       KK     KKK       º
echo º            KKK         º
echo º           KKK          º
echo º          KKK           º
echo º         KKK            º
echo º        KKK             º
echo º        KKK             º
echo º         KKK            º
echo º                        º
echo º         KKK            º
echo º         KKK            º
echo º                        º
echo º Draw a card.           º
echo º                        º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo.
echo Current player: %Player% (!Char_%Player%!)
echo Total money: !Money_%Player%!
echo.
 :ChooseChanceCard
:ChooseChanceCard
set /a ChooseChanceCard=%random:~0,2% %% 15 + 1
if "!FreeOutOfJail_Chance!" == "1" if "%ChooseChanceCard%" == "12" goto :ChooseChanceCard
if "%ChooseChanceCard%" == "1" set Var=%%A
if "%ChooseChanceCard%" == "2" set Var=%%B
if "%ChooseChanceCard%" == "3" set Var=%%C
if "%ChooseChanceCard%" == "4" set Var=%%D
if "%ChooseChanceCard%" == "5" set Var=%%E
if "%ChooseChanceCard%" == "6" set Var=%%F
if "%ChooseChanceCard%" == "7" set Var=%%G
if "%ChooseChanceCard%" == "8" set Var=%%H
if "%ChooseChanceCard%" == "9" set Var=%%I
if "%ChooseChanceCard%" == "10" set Var=%%J
if "%ChooseChanceCard%" == "11" set Var=%%K
if "%ChooseChanceCard%" == "12" set Var=%%L
if "%ChooseChanceCard%" == "13" set Var=%%M
if "%ChooseChanceCard%" == "14" set Var=%%N
if "%ChooseChanceCard%" == "15" set Var=%%O
echo ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo ³  Chance Card   ³
echo ³                ³
FOR /F "tokens=1-15 delims=/" %%A IN ("³ Your building  ³/³ Bank pays you  ³/³    Go back     ³/³  Make general  ³/³ Take a walk on ³/³Advance token to³/³ Advance to the ³/³   Advance to   ³/³  Pay poor tax  ³/³ Advance to Go. ³/³ Advance to St. ³/³Get out of Jail ³/³ Take a ride on ³/³ Go directly to ³/³ You have been  ³/") DO echo %Var%
FOR /F "tokens=1-15 delims=/" %%A IN ("³    and loan    ³/³  dividend of   ³/³   3 spaces.    ³/³ repairs on all ³/³ the Boardwalk. ³/³nearest utility.³/³    nearest     ³/³Illinois Avenue.³/³     of $15.    ³/³                ³/³ Charles Place. ³/³     free.      ³/³  the Reading   ³/³  Jail, do not  ³/³elected Chairman³/") DO echo %Var%
FOR /F "tokens=1-15 delims=/" %%A IN ("³    matures.    ³/³     $50.       ³/³                ³/³ your property. ³/³ Advance token  ³/³If unowned, you ³/³Railroad and pay³/³                ³/³                ³/³                ³/³If you pass Go, ³/³This card may be³/³    Railroad.   ³/³pass Go, do not ³/³  of the board. ³/") DO echo %Var%
FOR /F "tokens=1-15 delims=/" %%A IN ("³  Collect $150. ³/³                ³/³                ³/³Pay $25 for each³/³  to Boardwalk. ³/³may buy it from ³/³the owner twice ³/³If you pass Go, ³/³                ³/³                ³/³ collect $200.  ³/³   kept until   ³/³If you pass Go, ³/³  collect $200. ³/³Pay each player ³/") DO echo %Var%
FOR /F "tokens=1-15 delims=/" %%A IN ("³                ³/³                ³/³                ³/³ house and $100 ³/³                ³/³  the Bank. If  ³/³ the rental. If ³/³ collect $200.  ³/³                ³/³                ³/³                ³/³needed, or sold.³/³ collect $200.  ³/³                ³/³      $50.      ³/") DO echo %Var%
FOR /F "tokens=1-15 delims=/" %%A IN ("³                ³/³                ³/³                ³/³ for each hotel.³/³                ³/³  owned, throw  ³/³unowned, you may³/³                ³/³                ³/³                ³/³                ³/³                ³/³                ³/³                ³/³                ³/") DO echo %Var%
if "%ChooseChanceCard%" == "6" (echo ³dice and pay the³) ELSE (if "%ChooseChanceCard%" == "7" (echo ³buy it from bank³) ELSE (echo ³                ³))
if "%ChooseChanceCard%" == "6" (echo ³ owner a total  ³) ELSE (echo ³                ³)
if "%ChooseChanceCard%" == "6" echo ³ ten times the  ³
if "%ChooseChanceCard%" == "6" echo ³ amount thrown. ³
echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
if "%ChooseChanceCard%" == "1" (
	set Puffer=!Money_%Player%!
	set /a Money_%Player%=!Money_%Player%! + 150
	echo ÄÄÄ^> Money increased from $!Puffer! by $150 to $!Money_%Player%!.
)
if "%ChooseChanceCard%" == "2" (
	set Puffer=!Money_%Player%!
	set /a Money_%Player%=!Money_%Player%! + 50
	echo ÄÄÄ^> Money increased from $!Puffer! by $50 to $!Money_%Player%!.
)
if "%ChooseChanceCard%" == "3" (
	set Field!Player%Player%Position!_%Player%=
	set /a Player%Player%Position=!Player%Player%Position! - 3
	set Field!Player%Player%Position!_%Player%=!Char_%Player%!
	pause
	call :SetFields
	call :FIELD Chance_Walked
)
if "%ChooseChanceCard%" == "4" (
	set Houses_%Player%=0
	set Hotels_%Player%=0
	set PayForHouses=0
	set PayForHotels=0
	set PayForHousesAndHotels=0
	FOR %%A IN (MediterraneanAvenue BalticAvenue ReadingRailroad OrientalAvenue VermontAvenue ConnecticutAvenue St.CharlesPlace ElectricCompany StatesAvenue VirginiaAvenue PennsylvaniaRailroad St.JamesPlace TennesseeAvenue NewYorkAvenue KentuckyAvenue IndianaAvenue IllinoisAvenue B.O.Railroad AtlanticAvenue VeninorAvenue WaterWorks MarvinGardens PacificAvenue NorthCarolinaAvenue PennsylvaniaAvenue ShortLine ParkPlace Boardwalk) DO (
		if "!%%A!" == "%Player%" (
			if not "!%%A_Houses!" == "5" (set /a Houses_%Player%=!Houses_%Player%! + !%%A_Houses!) ELSE (set /a Hotels_%Player%=!Hotels_%Player%! + 1)
		)
	)
	set /a PayForHouses=!Houses_%Player%! * 25
	set /a PayForHotels=!Hotels_%Player%! * 100
	echo You have to pay $!PayForHouses! for !Houses_%Player%! houses and
	echo you have to pay $!PayForHotels! for !Hotels_%Player%! hotels.
	echo.
	set /a PayForHousesAndHotels=!PayForHouses! + !PayForHotels!
	set Puffer=!Money_%Player%!
	set /a Money_%Player%=!Money_%Player%! - !PayForHousesAndHotels!
	set /a Money_Parking=!Money_Parking! + !PayForHousesAndHotels!
	echo ÄÄÄ^> Money decreased from $!Puffer! by $!PayForHousesAndHotels! to $!Money_%Player%!.
	echo       ^& $!PayForHousesAndHotels! went into Free Parking.
	if "!Money_%Player%:~0,1!" == "-" (
		echo.
		pause
		cls
		echo Player %Player% [!Char_%Player%!] is bankrupt.
		echo.
		if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
		echo Player !Player! wins the game.
		echo.
		pause
		exit
	)
)
if "%ChooseChanceCard%" == "5" (
	set Field!Player%Player%Position!_%Player%=
	set Player%Player%Position=40
	set Field40_%Player%=!Char_%Player%!
	pause
	call :SetFields
	call :FIELD Chance_Walked
)
if "%ChooseChanceCard%" == "6" (
	set /a DiceOne=%random% %% 6 + 1
	set /a DiceTwo=%random% %% 6 + 1
	set /a Dice=!DiceOne! + !DiceTwo!
	pause
	if "!Player%Player%Position!" == "8" (
		set Field8_%Player%=
		set Field12_%Player%=!Char_%Player%!
		set Player%Player%Position=12
		call :ElectricCompany CameByChance
	) ELSE (
		set Field!Player%Player%Position!_%Player%=
		set Field29_%Player%=!Char_%Player%!
		set Player%Player%Position=29
		call :SetFields
		call :WaterWorks CameByChance
	)
)
if "%ChooseChanceCard%" == "7" (
	if "!Player%Player%Position:~1,1!" == "" (
		set Field!Player%Player%Position!_%Player%=
		set Field6_%Player%=!Char_%Player%!
		set Player%Player%Position=6
	) ELSE (
		set Field!Player%Player%Position!_%Player%=
		set Field!Player%Player%Position:~0,1!6_%Player%=!Char_%Player%!
		set Player%Player%Position=!Player%Player%Position:~0,1!6
	)
	set RentalTwice=1
	pause
	call :SetFields
	call :FIELD Chance_Walked
)
if "%ChooseChanceCard%" == "8" (
	if "!Player%Player%Position!" == "37" (
		set Puffer=!Money_%Player%!
		set /a Money_%Player%=!Money_%Player%! + 200
		echo ÄÄÄ^> Money increased from $!Puffer! by $200 to $!Money_%Player%! by passing Go.
	)
	set Field!Player%Player%Position!_%Player%=
	set Player%Player%Position=25
	set Field25_%Player%=!Char_%Player%!
	pause
	call :SetFields
	call :FIELD Chance_Walked
)
if "%ChooseChanceCard%" == "9" (
	set Puffer=!Money_%Player%!
	set /a Money_%Player%=!Money_%Player%! - 15
	set /a Money_Parking=!Money_Parking! + 15
	echo ÄÄÄ^> Money decreased from $!Puffer! by $15 to $!Money_%Player%!.
	echo       ^& $15 went into Free Parking.
	if "!Money_%Player%:~0,1!" == "-" (
		echo.
		pause
		cls
		echo Player %Player% [!Char_%Player%!] is bankrupt.
		echo.
		if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
		echo Player !Player! wins the game.
		echo.
		pause
		exit
	)
)
if "%ChooseChanceCard%" == "10" (
	set Field!Player%Player%Position!_%Player%=
	set Player%Player%Position=1
	set Field1_%Player%=!Char_%Player%!
	pause
	call :SetFields
	call :FIELD Chance_Walked
)
if "%ChooseChanceCard%" == "11" (
	if not "!Player%Player%Position!" == "8" (
		set Puffer=!Money_%Player%!
		set /a Money_%Player%=!Money_%Player%! + 200
		echo ÄÄÄ^> Money increased from $!Puffer! by $200 to $!Money_%Player%! by passing Go.
	)
	set Field!Player%Player%Position!_%Player%=
	set Player%Player%Position=12
	set Field12_%Player%=!Char_%Player%!
	pause
	call :SetFields
	call :FIELD Chance_Walked
)
if "%ChooseChanceCard%" == "12" (
	set FreeOutOfJail_%Player%=1
	set FreeOutOfJail_Chance=1
)
if "%ChooseChanceCard%" == "13" (
	set Puffer=!Money_%Player%!
	set /a Money_%Player%=!Money_%Player%! + 200
	echo ÄÄÄ^> Money increased from $!Puffer! by $200 to $!Money_%Player%! by passing Go.
	set Field!Player%Player%Position!_%Player%=
	set Player%Player%Position=6
	set Field6_%Player%=!Char_%Player%!
	pause
	call :SetFields
	call :FIELD Chance_Walked
)
if "%ChooseChanceCard%" == "14" (
	pause
	call :SendToJail
)
if "%ChooseChanceCard%" == "15" (
	set Puffer=!Money_%Player%!
	set /a Money_%Player%=!Money_%Player%! - 50
	echo ÄÄÄ^> Money decreased from $!Puffer! by $50 to $!Money_%Player%!.
	if "!Money_%Player%:~0,1!" == "-" (
		echo.
		pause
		cls
		echo Player %Player% [!Char_%Player%!] is bankrupt.
		echo.
		if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
		echo Player !Player! wins the game.
		echo.
		pause
		exit
	)
)
if "%Player%" == "1" (set Player=2) ELSE (set Player=1)
set Player=!Player!
if "%ChooseChanceCard%" == "15" (
	set Puffer=!Money_%Player%!
	set /a Money_%Player%=!Money_%Player%! + 50
	echo ÄÄÄ^> The other player's money increased from $!Puffer! by $50 to $!Money_%Player%!.
)
if "%Player%" == "1" (set Player=2) ELSE (set Player=1)
set Player=!Player!
pause
goto :After_StartComparingPositions




 :VermontAvenue
:VermontAvenue        9
set Purchase=
set Buy_House=
set PayRent=
set Sell_Street=
if not defined VermontAvenue_Houses set VermontAvenue_Houses=0
cls
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º                        º
echo º     Vermont Avenue     º
echo º                        º
echo º   PRICE $100  RENT $6  º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º With 1 House       $30 º
echo º                        º
echo º With 2 Houses      $90 º
echo º                        º
echo º With 3 Houses     $270 º
echo º                        º
echo º With 4 Houses     $400 º
echo º                        º
echo º With HOTEL        $550 º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º  One house costs $50   º
echo º                        º
echo º   Mortgage value $50   º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º                        º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo.
echo Current player: %Player% (!Char_%Player%!)
echo Total money: !Money_%Player%!
echo.
if "!VermontAvenue!" == "%Player%" goto :VermontAvenue_Houses
if defined VermontAvenue goto :VermontAvenue_PayRent
echo Press [1] to buy this street for $100 or
echo press [2] to leave it.
set /p Purchase=
if "%Purchase%" == "1" (
	set Puffer=!Money_%Player%!
	set /a Money_%Player%=!Money_%Player%! - 100
	if "!Money_%Player%:~0,1!" == "-" (
		echo You have not enough money.
		set /a Money_%Player%=!Money_%Player%! + 100
	) ELSE (
		echo ÄÄÄ^> Money decreased from $!Puffer! by $100 to $!Money_%Player%!.
		set VermontAvenue=%Player%
	)
	pause
	exit /b
)
if "%Purchase%" == "2" exit /b
goto :VermontAvenue
 :VermontAvenue_Houses
:VermontAvenue_Houses
if "!VermontAvenue_Houses!" == "5" (
	echo This street has got a hotel.
	pause
	exit /b
) ELSE (
	echo This street has got !VermontAvenue_Houses! houses, yet.
	echo.
)
echo Press [1] to buy a new house or
echo press [2] to leave it or
echo press [3] to sell it for $50.
set /p Buy_House=
echo.
if "%Buy_House%" == "1" (
	set Puffer=!Money_%Player%!
	set /a Money_%Player%=!Money_%Player%! - 50
	if "!Money_%Player%:~0,1!" == "-" (
		echo You have not enough money.
		set /a Money_%Player%=!Money_%Player%! + 50
	) ELSE (
		echo ÄÄÄ^> Money decreased from $!Puffer! by $50 to $!Money_%Player%!.
		set /a VermontAvenue_Houses=!VermontAvenue_Houses! + 1
		if not "!VermontAvenue_Houses!" == "5" (echo This street has got !VermontAvenue_Houses! houses now.) ELSE (echo This street has got a hotel now.)
	)
	pause
	exit /b
)
if "%Buy_House%" == "2" exit /b
if "%Buy_House%" == "3" (
	echo Are you sure you want to sell the street? [Y/N]
	set /p Sell_Street=
	if /i "!Sell_Street!" == "n" exit /b
	if /i "!Sell_Street!" == "y" (
		set Puffer=!Money_%Player%!
		set /a Money_%Player%=!Money_%Player%! + 50
		echo ÄÄÄ^> Money increased from $!Puffer! by $50 to $!Money_%Player%!.
		set VermontAvenue=
		set VermontAvenue_Houses=0
	)
)
goto :VermontAvenue_Houses
 :VermontAvenue_PayRent
:VermontAvenue_PayRent
if "!VermontAvenue_Houses!" == "0" set PayRent=6
if "!VermontAvenue_Houses!" == "1" set PayRent=30
if "!VermontAvenue_Houses!" == "2" set PayRent=90
if "!VermontAvenue_Houses!" == "3" set PayRent=270
if "!VermontAvenue_Houses!" == "4" set PayRent=400
if "!VermontAvenue_Houses!" == "5" set PayRent=550
echo This street is owned by the other player. You have to pay
echo $%PayRent% to pass.
set Puffer=!Money_%Player%!
set /a Money_%Player%=!Money_%Player%! - %PayRent%
echo ÄÄÄ^> Money decreased from $%Puffer% by $%PayRent% to $!Money_%Player%!.
if "!Money_%Player%:~0,1!" == "-" (
	echo.
	pause
	cls
	echo Player %Player% [!Char_%Player%!] is bankrupt.
	echo.
	if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
	echo Player !Player! wins the game.
	echo.
	pause
	exit
)
if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
set Player=!Player!
set Puffer=!Money_%Player%!
set /a Money_%Player%=!Money_%Player%! + %PayRent%
echo ÄÄÄ^> The other player's money increased from $%Puffer% by $%PayRent% to $!Money_%Player%!.
if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
set Player=!Player!
echo.
pause
exit /b




 :ConnecticutAvenue
:ConnecticutAvenue    10
set Purchase=
set Buy_House=
set PayRent=
set Sell_Street=
if not defined ConnecticutAvenue_Houses set ConnecticutAvenue_Houses=0
cls
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º                        º
echo º   Connecticut Avenue   º
echo º                        º
echo º   PRICE $120  RENT $8  º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º With 1 House       $40 º
echo º                        º
echo º With 2 Houses     $100 º
echo º                        º
echo º With 3 Houses     $300 º
echo º                        º
echo º With 4 Houses     $450 º
echo º                        º
echo º With HOTEL        $600 º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º  One house costs $50   º
echo º                        º
echo º   Mortgage value $60   º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º                        º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo.
echo Current player: %Player% (!Char_%Player%!)
echo Total money: !Money_%Player%!
echo.
if "!ConnecticutAvenue!" == "%Player%" goto :ConnecticutAvenue_Houses
if defined ConnecticutAvenue goto :ConnecticutAvenue_PayRent
echo Press [1] to buy this street for $120 or
echo press [2] to leave it.
set /p Purchase=
if "%Purchase%" == "1" (
	set Puffer=!Money_%Player%!
	set /a Money_%Player%=!Money_%Player%! - 120
	if "!Money_%Player%:~0,1!" == "-" (
		echo You have not enough money.
		set /a Money_%Player%=!Money_%Player%! + 120
	) ELSE (
		echo ÄÄÄ^> Money decreased from $!Puffer! by $120 to $!Money_%Player%!.
		set ConnecticutAvenue=%Player%
	)
	pause
	exit /b
)
if "%Purchase%" == "2" exit /b
goto :ConnecticutAvenue
 :ConnecticutAvenue_Houses
:ConnecticutAvenue_Houses
if "!ConnecticutAvenue_Houses!" == "5" (
	echo This street has got a hotel.
	pause
	exit /b
) ELSE (
	echo This street has got !ConnecticutAvenue_Houses! houses, yet.
	echo.
)
echo Press [1] to buy a new house or
echo press [2] to leave it or
echo press [3] to sell it for $60.
set /p Buy_House=
echo.
if "%Buy_House%" == "1" (
	set Puffer=!Money_%Player%!
	set /a Money_%Player%=!Money_%Player%! - 50
	if "!Money_%Player%:~0,1!" == "-" (
		echo You have not enough money.
		set /a Money_%Player%=!Money_%Player%! + 50
	) ELSE (
		echo ÄÄÄ^> Money decreased from $!Puffer! by $50 to $!Money_%Player%!.
		set /a ConnecticutAvenue_Houses=!ConnecticutAvenue_Houses! + 1
		if not "!ConnecticutAvenue_Houses!" == "5" (echo This street has got !ConnecticutAvenue_Houses! houses now.) ELSE (echo This street has got a hotel now.)
	)
	pause
	exit /b
)
if "%Buy_House%" == "2" exit /b
if "%Buy_House%" == "3" (
	echo Are you sure you want to sell the street? [Y/N]
	set /p Sell_Street=
	if /i "!Sell_Street!" == "n" exit /b
	if /i "!Sell_Street!" == "y" (
		set Puffer=!Money_%Player%!
		set /a Money_%Player%=!Money_%Player%! + 60
		echo ÄÄÄ^> Money increased from $!Puffer! by $60 to $!Money_%Player%!.
		set ConnecticutAvenue=
		set ConnecticutAvenue_Houses=0
	)
)
goto :ConnecticutAvenue_Houses
 :ConnecticutAvenue_PayRent
:ConnecticutAvenue_PayRent
if "!ConnecticutAvenue_Houses!" == "0" set PayRent=8
if "!ConnecticutAvenue_Houses!" == "1" set PayRent=40
if "!ConnecticutAvenue_Houses!" == "2" set PayRent=100
if "!ConnecticutAvenue_Houses!" == "3" set PayRent=300
if "!ConnecticutAvenue_Houses!" == "4" set PayRent=450
if "!ConnecticutAvenue_Houses!" == "5" set PayRent=600
echo This street is owned by the other player. You have to pay
echo $%PayRent% to pass.
set Puffer=!Money_%Player%!
set /a Money_%Player%=!Money_%Player%! - %PayRent%
echo ÄÄÄ^> Money decreased from $%Puffer% by $%PayRent% to $!Money_%Player%!.
if "!Money_%Player%:~0,1!" == "-" (
	echo.
	pause
	cls
	echo Player %Player% [!Char_%Player%!] is bankrupt.
	echo.
	if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
	echo Player !Player! wins the game.
	echo.
	pause
	exit
)
if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
set Player=!Player!
set Puffer=!Money_%Player%!
set /a Money_%Player%=!Money_%Player%! + %PayRent%
echo ÄÄÄ^> The other player's money increased from $%Puffer% by $%PayRent% to $!Money_%Player%!.
if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
set Player=!Player!
echo.
pause
exit /b




 :AtJail
:AtJail               11
cls
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º       ²                                        º
echo º       ²                    ÉÍÍÍËÍÍÍËÍÍÍËÍÍÍ»   º
echo º       ²                    º   º   º   º   º   º
echo º    ²  ²                    º   º   º   º   º   º
echo º    ²²²²                    º   º   º   º   º   º
echo º                            ÈÍÍÍÊÍÍÍÊÍÍÍÊÍÍÍ¼   º
echo º     ²²                                         º
echo º    ²  ²                                        º
echo º    ²²²²                                        º
echo º    ²  ²                                        º
if "%Player%" == "1" if "!Field11_J_2!" == "%Char_2%" (echo º           There is player 2 in jail now.       º) ELSE (echo º                                                º)
if "%Player%" == "2" if "!Field11_J_1!" == "%Char_1%" (echo º           There is player 1 in jail now.       º) ELSE (echo º                                                º)
echo º     ²²                                         º
echo º     ²²                                         º
echo º     ²²                                         º
echo º     ²²                                         º
if not "!Field11_J_1!" == "%Char_1%" (if not "!Field11_J_2!" == "%Char_2%" (echo º           There is noone in jail at the moment.º) ELSE (echo º                                                º)) ELSE (echo º                                                º)
echo º    ²                                           º
echo º    ²                                           º
echo º    ²                                           º
echo º    ²²²²                                        º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo.
echo Current player: %Player% (!Char_%Player%!)
echo Total money: !Money_%Player%!
pause >nul
exit /b





 :InJail
:InJail               11J
cls
set InJail=
set Player%Player%Position=11
if "!Escape_%Player%!" == "no" set Escape_%Player%=4
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º                                                º
echo º  ÉÍÍÍÍÍÍËÍÍÍÍÍÍËÍÍÍÍÍÍËÍÍÍÍÍÍËÍÍÍÍÍÍËÍÍÍÍÍÍ»   º
echo º  º      º      º      º      º      º      º   º
echo º  º      º      º      º      º      º      º   º
echo º  º      º      º      º      º      º      º   º
echo º  º      º      º      º      º      º      º   º
echo º  º      º      º      º      º      º      º   º
echo º  º      º      º      º      º      º      º   º
echo º  º      º      º      º      º      º      º   º
echo º  º      º      º      º      º      º      º   º
echo º  º      º      º      º      º      º      º   º
echo º  º      º      º      º      º      º      º   º
echo º  º      º      º      º      º      º      º   º
echo º  º      º      º      º      º      º      º   º
echo º  º      º      º      º      º      º      º   º
echo º  º      º      º      º      º      º      º   º
echo º  º      º      º      º      º      º      º   º
echo º  ÈÍÍÍÍÍÍÊÍÍÍÍÍÍÊÍÍÍÍÍÍÊÍÍÍÍÍÍÊÍÍÍÍÍÍÊÍÍÍÍÍÍ¼   º
echo º                                                º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo.
echo Current player: %Player% (!Char_%Player%!)
echo Total money: !Money_%Player%!
echo.
set /a Escape_%Player%=!Escape_%Player%! - 1
if "!Escape_%Player%!" == "0" set Escape_%Player%=no
echo You are in jail. You can pay $50 to get out of here immediately or
echo you can escape in rolling a doublet (!Escape_%Player%! tries left).
echo.
if "!Escape_%Player%!" == "no" (
	set Field11_J_%Player%= 
	set Field11_%Player%=!Char_%Player%!
	echo You now have to pay $50.
	pause
	set Puffer=!Money_%Player%!
	set /a Money_%Player%=!Money_%Player%! - 50
	echo.
	echo ÄÄÄ^> Money decreased from $!Puffer! by $50 to $!Money_%Player%!.
	echo.
	if "!Money_%Player%:~0,1!" == "-" (
		echo.
		pause
		cls
		echo Player %Player% [!Char_%Player%!] is bankrupt.
		echo.
		if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
		echo Player !Player! wins the game.
		echo.
		pause
		exit
	)
	if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
	set OutOfJail=1
	pause
	exit /b
)
echo Press [1] to pay $50 or press anything else to try to escape.
if "!FreeOutOfJail_%Player%!" == "1" echo Press [2] to use your card to get out of jail for free.
set /p InJail=-^> 
if "%InJail%" == "1" (
	set Escape_%Player%=4
	set Field11_J_%Player%= 
	set Field11_%Player%=!Char_%Player%!
	set Puffer=!Money_%Player%!
	set /a Money_%Player%=!Money_%Player%! - 50
	echo.
	if "!Money_%Player%:~0,1!" == "-" (
		echo You have not enough money.
		set /a Money_%Player%=!Money_%Player%! + 50
		echo.
		pause
	) ELSE (
	echo ÄÄÄ^> Money decreased from $!Puffer! by $50 to $!Money_%Player%!.
	echo.
	if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
	set OutOfJail=1
	pause
	exit /b
	)
)
if "!FreeOutOfJail_%Player%!" == "1" (
	if "%InJail%" == "2" (
		echo Card used.
		set Escape_%Player%=4
		set Field11_J_%Player%= 
		set Field11_%Player%=!Char_%Player%!
		set FreeOutOfJail_%Player%=0
		if "!FreeOutOfJail_Chance!" == "!FreeOutOfJail_%Player%!" (
			set FreeOutOfJail_Chance=0
		) ELSE (
			set FreeOutOfJail_Community=0
		)
		set FreeOutOfJail_%Player%=0
		pause
		exit /b
	)
)
echo.
echo Trying to roll a doublet...

set /a DiceOne=%random% %% 6 + 1
set /a DiceTwo=%random% %% 6 + 1

set /a Dice=%DiceOne% + %DiceTwo%
echo Dice one (%DiceOne%) + dice two (%DiceTwo%) = %Dice%

if "%DiceOne%" == "%DiceTwo%" (
	set Field11_J_%Player%= 
	set /a Player%Player%Position=!Player%Player%Position! + %Dice%
	set Field!Player%Player%Position!_%Player%=!Char_%Player%!
	set Escape_%Player%=4
	echo You successfully rolled a doublet.
	ping localhost -n 3 >nul
	set DiceAmount=1
) ELSE (
	echo You missed.
	ping localhost -n 3 >nul
)
goto :RollDone





 :St.CharlesPlace
:St.CharlesPlace      12
set Purchase=
set Buy_House=
set PayRent=
set Sell_Street=
if not defined St.CharlesPlace_Houses set St.CharlesPlace_Houses=0
cls
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º                        º
echo º   St. Charles Place    º
echo º                        º
echo º  PRICE $140  RENT $10  º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º With 1 House       $50 º
echo º                        º
echo º With 2 Houses     $150 º
echo º                        º
echo º With 3 Houses     $450 º
echo º                        º
echo º With 4 Houses     $625 º
echo º                        º
echo º With HOTEL        $750 º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º  One house costs $100  º
echo º                        º
echo º   Mortgage value $70   º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º                        º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo.
echo Current player: %Player% (!Char_%Player%!)
echo Total money: !Money_%Player%!
echo.
if "!St.CharlesPlace!" == "%Player%" goto :St.CharlesPlace_Houses
if defined St.CharlesPlace goto :St.CharlesPlace_PayRent
echo Press [1] to buy this street for $140 or
echo press [2] to leave it.
set /p Purchase=
if "%Purchase%" == "1" (
	set Puffer=!Money_%Player%!
	set /a Money_%Player%=!Money_%Player%! - 140
	if "!Money_%Player%:~0,1!" == "-" (
		echo You have not enough money.
		set /a Money_%Player%=!Money_%Player%! + 140
	) ELSE (
		echo ÄÄÄ^> Money decreased from $!Puffer! by $140 to $!Money_%Player%!.
		set St.CharlesPlace=%Player%
	)
	pause
	exit /b
)
if "%Purchase%" == "2" exit /b
goto :St.CharlesPlace
 :St.CharlesPlace_Houses
:St.CharlesPlace_Houses
if "!St.CharlesPlace_Houses!" == "5" (
	echo This street has got a hotel.
	pause
	exit /b
) ELSE (
	echo This street has got !St.CharlesPlace_Houses! houses, yet.
	echo.
)
echo Press [1] to buy a new house or
echo press [2] to leave it or
echo press [3] to sell it for $70.
set /p Buy_House=
echo.
if "%Buy_House%" == "1" (
	set Puffer=!Money_%Player%!
	set /a Money_%Player%=!Money_%Player%! - 100
	if "!Money_%Player%:~0,1!" == "-" (
		echo You have not enough money.
		set /a Money_%Player%=!Money_%Player%! + 100
	) ELSE (
		echo ÄÄÄ^> Money decreased from $!Puffer! by $100 to $!Money_%Player%!.
		set /a St.CharlesPlace_Houses=!St.CharlesPlace_Houses! + 1
		if not "!St.CharlesPlace_Houses!" == "5" (echo This street has got !St.CharlesPlace_Houses! houses now.) ELSE (echo This street has got a hotel now.)
	)
	pause
	exit /b
)
if "%Buy_House%" == "2" exit /b
if "%Buy_House%" == "3" (
	echo Are you sure you want to sell the street? [Y/N]
	set /p Sell_Street=
	if /i "!Sell_Street!" == "n" exit /b
	if /i "!Sell_Street!" == "y" (
		set Puffer=!Money_%Player%!
		set /a Money_%Player%=!Money_%Player%! + 70
		echo ÄÄÄ^> Money increased from $!Puffer! by $70 to $!Money_%Player%!.
		set St.CharlesPlace=
		set St.CharlesPlace_Houses=0
	)
)
goto :St.CharlesPlace_Houses
 :St.CharlesPlace_PayRent
:St.CharlesPlace_PayRent
if "!St.CharlesPlace_Houses!" == "0" set PayRent=10
if "!St.CharlesPlace_Houses!" == "1" set PayRent=50
if "!St.CharlesPlace_Houses!" == "2" set PayRent=150
if "!St.CharlesPlace_Houses!" == "3" set PayRent=450
if "!St.CharlesPlace_Houses!" == "4" set PayRent=625
if "!St.CharlesPlace_Houses!" == "5" set PayRent=750
echo This street is owned by the other player. You have to pay
echo $%PayRent% to pass.
set Puffer=!Money_%Player%!
set /a Money_%Player%=!Money_%Player%! - %PayRent%
echo ÄÄÄ^> Money decreased from $%Puffer% by $%PayRent% to $!Money_%Player%!.
if "!Money_%Player%:~0,1!" == "-" (
	echo.
	pause
	cls
	echo Player %Player% [!Char_%Player%!] is bankrupt.
	echo.
	if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
	echo Player !Player! wins the game.
	echo.
	pause
	exit
)
if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
set Player=!Player!
set Puffer=!Money_%Player%!
set /a Money_%Player%=!Money_%Player%! + %PayRent%
echo ÄÄÄ^> The other player's money increased from $%Puffer% by $%PayRent% to $!Money_%Player%!.
if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
set Player=!Player!
echo.
pause
exit /b




 :ElectricCompany
:ElectricCompany      13
set Purchase=
set Buy_House=
set PayRent=
set CompanyAmount=0
set Sell_Street=
cls
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º                        º
echo º    Electric Company    º
echo º                        º
echo º       PRICE $150       º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º                        º
echo º                        º
echo ºIf 1 owned, rent equals º
echo º                        º
echo º   4 times dice roll    º
echo º                        º
echo º                        º
echo ºIf 2 owned, rent equals º
echo º                        º
echo º  10 times dice roll    º
echo º                        º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º   Mortgage value $75   º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º                        º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo.
echo Current player: %Player% (!Char_%Player%!)
echo Total money: !Money_%Player%!
echo.
if "!ElectricCompany!" == "%Player%" goto :ElectricCompany_Houses
if defined ElectricCompany goto :ElectricCompany_PayRent
echo Press [1] to buy this street for $150 or
echo press [2] to leave it.
set /p Purchase=
if "%Purchase%" == "1" (
	set Puffer=!Money_%Player%!
	set /a Money_%Player%=!Money_%Player%! - 150
	if "!Money_%Player%:~0,1!" == "-" (
		echo You have not enough money.
		set /a Money_%Player%=!Money_%Player%! + 150
	) ELSE (
		echo ÄÄÄ^> Money decreased from $!Puffer! by $150 to $!Money_%Player%!.
		set ElectricCompany=%Player%
	)
	pause
	exit /b
)
if "%Purchase%" == "2" exit /b
goto :ElectricCompany
 :ElectricCompany_Houses
:ElectricCompany_Houses
echo Press [2] to leave it or
echo press [3] to sell it for $75.
set /p Buy_House=
echo.
if "%Buy_House%" == "2" exit /b
if "%Buy_House%" == "3" (
	echo Are you sure you want to sell this street? [Y/N]
	set /p Sell_Street=
	if /i "!Sell_Street!" == "n" exit /b
	if /i "!Sell_Street!" == "y" (
		set Puffer=!Money_%Player%!
		set /a Money_%Player%=!Money_%Player%! + 75
		echo ÄÄÄ^> Money increased from $!Puffer! by $75 to $!Money_%Player%!.
		set ElectricCompany=
	)
)
goto :ElectricCompany_Houses
 :ElectricCompany_PayRent
:ElectricCompany_PayRent
if "%Player%" == "1" (set Player=2) ELSE (set Player=1)
set Player=!Player!
if "!ElectricCompany!" == "%Player%" set /a CompanyAmount=!CompanyAmount! + 1
if "!WaterWorks!" == "%Player%" set /a CompanyAmount=!CompanyAmount! + 1
if "%Player%" == "1" (set Player=2) ELSE (set Player=1)
set Player=!Player!
echo The other player owns !CompanyAmount! of 2 companies.
if "!CompanyAmount!" == "1" set /a PayRent=%Dice% * 4
if "!CompanyAmount!" == "2" set /a PayRent=%Dice% * 10
if "%1" == "CameByChance" set /a PayRent=!Dice! * 10
set Puffer=!Money_%Player%!
set /a Money_%Player%=!Money_%Player%! - %PayRent%
echo ÄÄÄ^> Money decreased from $%Puffer% by $%PayRent% to $!Money_%Player%!.
if "!Money_%Player%:~0,1!" == "-" (
	echo.
	pause
	cls
	echo Player %Player% [!Char_%Player%!] is bankrupt.
	echo.
	if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
	echo Player !Player! wins the game.
	echo.
	pause
	exit
)
if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
set Player=!Player!
set Puffer=!Money_%Player%!
set /a Money_%Player%=!Money_%Player%! + %PayRent%
echo ÄÄÄ^> The other player's money increased from $%Puffer% by $%PayRent% to $!Money_%Player%!.
if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
set Player=!Player!
echo.
pause
exit /b




 :StatesAvenue
:StatesAvenue         14
set Purchase=
set Buy_House=
set PayRent=
set Sell_Street=
if not defined StatesAvenue_Houses set StatesAvenue_Houses=0
cls
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º                        º
echo º     States Avenue      º
echo º                        º
echo º  PRICE $140  RENT $10  º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º With 1 House       $50 º
echo º                        º
echo º With 2 Houses     $150 º
echo º                        º
echo º With 3 Houses     $450 º
echo º                        º
echo º With 4 Houses     $625 º
echo º                        º
echo º With HOTEL        $750 º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º  One house costs $100  º
echo º                        º
echo º   Mortgage value $70   º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º                        º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo.
echo Current player: %Player% (!Char_%Player%!)
echo Total money: !Money_%Player%!
echo.
if "!StatesAvenue!" == "%Player%" goto :StatesAvenue_Houses
if defined StatesAvenue goto :StatesAvenue_PayRent
echo Press [1] to buy this street for $140 or
echo press [2] to leave it.
set /p Purchase=
if "%Purchase%" == "1" (
	set Puffer=!Money_%Player%!
	set /a Money_%Player%=!Money_%Player%! - 140
	if "!Money_%Player%:~0,1!" == "-" (
		echo You have not enough money.
		set /a Money_%Player%=!Money_%Player%! + 140
	) ELSE (
		echo ÄÄÄ^> Money decreased from $!Puffer! by $140 to $!Money_%Player%!.
		set StatesAvenue=%Player%
	)
	pause
	exit /b
)
if "%Purchase%" == "2" exit /b
goto :StatesAvenue
 :StatesAvenue_Houses
:StatesAvenue_Houses
if "!StatesAvenue_Houses!" == "5" (
	echo This street has got a hotel.
	pause
	exit /b
) ELSE (
	echo This street has got !StatesAvenue_Houses! houses, yet.
	echo.
)
echo Press [1] to buy a new house or
echo press [2] to leave it or
echo press [3] to sell it for $70.
set /p Buy_House=
echo.
if "%Buy_House%" == "1" (
	set Puffer=!Money_%Player%!
	set /a Money_%Player%=!Money_%Player%! - 100
	if "!Money_%Player%:~0,1!" == "-" (
		echo You have not enough money.
		set /a Money_%Player%=!Money_%Player%! + 100
	) ELSE (
		echo ÄÄÄ^> Money decreased from $!Puffer! by $100 to $!Money_%Player%!.
		set /a StatesAvenue_Houses=!StatesAvenue_Houses! + 1
		if not "!StatesAvenue_Houses!" == "5" (echo This street has got !StatesAvenue_Houses! houses now.) ELSE (echo This street has got a hotel now.)
	)
	pause
	exit /b
)
if "%Buy_House%" == "2" exit /b
if "%Buy_House%" == "3" (
	echo Are you sure you want to sell the street? [Y/N]
	set /p Sell_Street=
	if /i "!Sell_Street!" == "n" exit /b
	if /i "!Sell_Street!" == "y" (
		set Puffer=!Money_%Player%!
		set /a Money_%Player%=!Money_%Player%! + 70
		echo ÄÄÄ^> Money increased from $!Puffer! by $70 to $!Money_%Player%!.
		set StatesAvenue=
		set StatesAvenue_Houses=0
	)
)
goto :StatesAvenue_Houses
 :StatesAvenue_PayRent
:StatesAvenue_PayRent
if "!StatesAvenue_Houses!" == "0" set PayRent=10
if "!StatesAvenue_Houses!" == "1" set PayRent=50
if "!StatesAvenue_Houses!" == "2" set PayRent=150
if "!StatesAvenue_Houses!" == "3" set PayRent=450
if "!StatesAvenue_Houses!" == "4" set PayRent=625
if "!StatesAvenue_Houses!" == "5" set PayRent=750
echo This street is owned by the other player. You have to pay
echo $%PayRent% to pass.
set Puffer=!Money_%Player%!
set /a Money_%Player%=!Money_%Player%! - %PayRent%
echo ÄÄÄ^> Money decreased from $%Puffer% by $%PayRent% to $!Money_%Player%!.
if "!Money_%Player%:~0,1!" == "-" (
	echo.
	pause
	cls
	echo Player %Player% [!Char_%Player%!] is bankrupt.
	echo.
	if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
	echo Player !Player! wins the game.
	echo.
	pause
	exit
)
if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
set Player=!Player!
set Puffer=!Money_%Player%!
set /a Money_%Player%=!Money_%Player%! + %PayRent%
echo ÄÄÄ^> The other player's money increased from $%Puffer% by $%PayRent% to $!Money_%Player%!.
if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
set Player=!Player!
echo.
pause
exit /b




 :VirginiaAvenue
:VirginiaAvenue       15
set Purchase=
set Buy_House=
set PayRent=
set Sell_Street=
if not defined VirginiaAvenue_Houses set VirginiaAvenue_Houses=0
cls
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º                        º
echo º    Virginia Avenue     º
echo º                        º
echo º  PRICE $160  RENT $12  º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º With 1 House       $60 º
echo º                        º
echo º With 2 Houses     $180 º
echo º                        º
echo º With 3 Houses     $500 º
echo º                        º
echo º With 4 Houses     $700 º
echo º                        º
echo º With HOTEL        $900 º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º  One house costs $100  º
echo º                        º
echo º   Mortgage value $80   º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º                        º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo.
echo Current player: %Player% (!Char_%Player%!)
echo Total money: !Money_%Player%!
echo.
if "!VirginiaAvenue!" == "%Player%" goto :VirginiaAvenue_Houses
if defined VirginiaAvenue goto :VirginiaAvenue_PayRent
echo Press [1] to buy this street for $160 or
echo press [2] to leave it.
set /p Purchase=
if "%Purchase%" == "1" (
	set Puffer=!Money_%Player%!
	set /a Money_%Player%=!Money_%Player%! - 160
	if "!Money_%Player%:~0,1!" == "-" (
		echo You have not enough money.
		set /a Money_%Player%=!Money_%Player%! + 160
	) ELSE (
		echo ÄÄÄ^> Money decreased from $!Puffer! by $160 to $!Money_%Player%!.
		set VirginiaAvenue=%Player%
	)
	pause
	exit /b
)
if "%Purchase%" == "2" exit /b
goto :VirginiaAvenue
 :VirginiaAvenue_Houses
:VirginiaAvenue_Houses
if "!VirginiaAvenue_Houses!" == "5" (
	echo This street has got a hotel.
	pause
	exit /b
) ELSE (
	echo This street has got !VirginiaAvenue_Houses! houses, yet.
	echo.
)
echo Press [1] to buy a new house or
echo press [2] to leave it or
echo press [3] to sell it for $80.
set /p Buy_House=
echo.
if "%Buy_House%" == "1" (
	set Puffer=!Money_%Player%!
	set /a Money_%Player%=!Money_%Player%! - 100
	if "!Money_%Player%:~0,1!" == "-" (
		echo You have not enough money.
		set /a Money_%Player%=!Money_%Player%! + 100
	) ELSE (
		echo ÄÄÄ^> Money decreased from $!Puffer! by $100 to $!Money_%Player%!.
		set /a VirginiaAvenue_Houses=!VirginiaAvenue_Houses! + 1
		if not "!VirginiaAvenue_Houses!" == "5" (echo This street has got !VirginiaAvenue_Houses! houses now.) ELSE (echo This street has got a hotel now.)
	)
	pause
	exit /b
)
if "%Buy_House%" == "2" exit /b
if "%Buy_House%" == "3" (
	echo Are you sure you want to sell the street? [Y/N]
	set /p Sell_Street=
	if /i "!Sell_Street!" == "n" exit /b
	if /i "!Sell_Street!" == "y" (
		set Puffer=!Money_%Player%!
		set /a Money_%Player%=!Money_%Player%! + 80
		echo ÄÄÄ^> Money increased from $!Puffer! by $80 to $!Money_%Player%!.
		set VirginiaAvenue=
		set VirginiaAvenue_Houses=0
	)
)
goto :VirginiaAvenue_Houses
 :VirginiaAvenue_PayRent
:VirginiaAvenue_PayRent
if "!VirginiaAvenue_Houses!" == "0" set PayRent=12
if "!VirginiaAvenue_Houses!" == "1" set PayRent=60
if "!VirginiaAvenue_Houses!" == "2" set PayRent=180
if "!VirginiaAvenue_Houses!" == "3" set PayRent=500
if "!VirginiaAvenue_Houses!" == "4" set PayRent=700
if "!VirginiaAvenue_Houses!" == "5" set PayRent=900
echo This street is owned by the other player. You have to pay
echo $%PayRent% to pass.
set Puffer=!Money_%Player%!
set /a Money_%Player%=!Money_%Player%! - %PayRent%
echo ÄÄÄ^> Money decreased from $%Puffer% by $%PayRent% to $!Money_%Player%!.
if "!Money_%Player%:~0,1!" == "-" (
	echo.
	pause
	cls
	echo Player %Player% [!Char_%Player%!] is bankrupt.
	echo.
	if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
	echo Player !Player! wins the game.
	echo.
	pause
	exit
)
if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
set Player=!Player!
set Puffer=!Money_%Player%!
set /a Money_%Player%=!Money_%Player%! + %PayRent%
echo ÄÄÄ^> The other player's money increased from $%Puffer% by $%PayRent% to $!Money_%Player%!.
if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
set Player=!Player!
echo.
pause
exit /b




 :PennsylvaniaRailroad
:PennsylvaniaRailroad 16
set Purchase=
set Buy_House=
set PayRent=
set Sell_Street=
set RailroadAmount=0
cls
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º                        º
echo º Pennsylvania Railroad  º
echo º                        º
echo º       PRICE $200       º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º                        º
echo º                        º
echo º If 1 owned         $25 º
echo º                        º
echo º If 2 owned         $50 º
echo º                        º
echo º If 3 owned        $100 º
echo º                        º
echo º If 4 owned        $200 º
echo º                        º
echo º                        º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º   Mortgage value $100  º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º                        º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo.
echo Current player: %Player% (!Char_%Player%!)
echo Total money: !Money_%Player%!
echo.
if "!PennsylvaniaRailroad!" == "%Player%" goto :PennsylvaniaRailroad_Houses
if defined PennsylvaniaRailroad goto :PennsylvaniaRailroad_PayRent
echo Press [1] to buy this railroad for $200 or
echo press [2] to leave it.
set /p Purchase=
if "%Purchase%" == "1" (
	set Puffer=!Money_%Player%!
	set /a Money_%Player%=!Money_%Player%! - 200
	if "!Money_%Player%:~0,1!" == "-" (
		echo You have not enough money.
		set /a Money_%Player%=!Money_%Player%! + 200
	) ELSE (
		echo ÄÄÄ^> Money decreased from $!Puffer! by $200 to $!Money_%Player%!.
		set PennsylvaniaRailroad=%Player%
	)
	pause
	exit /b
)
if "%Purchase%" == "2" exit /b
goto :PennsylvaniaRailroad
 :PennsylvaniaRailroad_Houses
:PennsylvaniaRailroad_Houses
echo This railroad is yours.
echo.
echo Press [2] to leave it or
echo press [3] to sell it for $100.
set /p Buy_House=
echo.
if "%Buy_House%" == "2" exit /b
if "%Buy_House%" == "3" (
	echo Are you sure you want to sell this railroad? [Y/N]
	set /p Sell_Street=
	if /i "!Sell_Street!" == "n" exit /b
	if /i "!Sell_Street!" == "y" (
		set Puffer=!Money_%Player%!
		set /a Money_%Player%=!Money_%Player%! + 100
		echo ÄÄÄ^> Money increased from $!Puffer! by $100 to $!Money_%Player%!.
		set PennsylvaniaRailroad=
	)
)
goto :PennsylvaniaRailroad_Houses
 :PennsylvaniaRailroad_PayRent
:PennsylvaniaRailroad_PayRent
if "%Player%" == "1" (set Player=2) ELSE (set Player=1)
set Player=!Player!
FOR %%A IN (ReadingRailroad PennsylvaniaRailroad B.O.Railroad ShortLineRailroad) DO if "!%%A!" == "%Player%" set /a RailroadAmount=!RailroadAmount! + 1
if "%Player%" == "1" (set Player=2) ELSE (set Player=1)
set Player=!Player!
echo The other player owns !RailroadAmount! of 4 railroads.
if "!RailroadAmount!" == "1" set PayRent=25
if "!RailroadAmount!" == "2" set PayRent=50
if "!RailroadAmount!" == "3" set PayRent=100
if "!RailroadAmount!" == "4" set PayRent=200
set Puffer=!Money_%Player%!
set /a Money_%Player%=!Money_%Player%! - %PayRent%
echo ÄÄÄ^> Money decreased from $%Puffer% by $%PayRent% to $!Money_%Player%!.
if "!Money_%Player%:~0,1!" == "-" (
	echo.
	pause
	cls
	echo Player %Player% [!Char_%Player%!] is bankrupt.
	echo.
	if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
	echo Player !Player! wins the game.
	echo.
	pause
	exit
)
if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
set Player=!Player!
set Puffer=!Money_%Player%!
set /a Money_%Player%=!Money_%Player%! + %PayRent%
echo ÄÄÄ^> The other player's money increased from $%Puffer% by $%PayRent% to $!Money_%Player%!.
if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
set Player=!Player!
echo.
pause
exit /b




 :St.JamesPlace
:St.JamesPlace        17
set Purchase=
set Buy_House=
set PayRent=
set Sell_Street=
if not defined St.JamesPlace_Houses set St.JamesPlace_Houses=0
cls
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º                        º
echo º    St. James Place     º
echo º                        º
echo º  PRICE $180  RENT $14  º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º With 1 House       $70 º
echo º                        º
echo º With 2 Houses     $200 º
echo º                        º
echo º With 3 Houses     $550 º
echo º                        º
echo º With 4 Houses     $700 º
echo º                        º
echo º With HOTEL        $900 º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º  One house costs $100  º
echo º                        º
echo º   Mortgage value $90   º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º                        º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo.
echo Current player: %Player% (!Char_%Player%!)
echo Total money: !Money_%Player%!
echo.
if "!St.JamesPlace!" == "%Player%" goto :St.JamesPlace_Houses
if defined St.JamesPlace goto :St.JamesPlace_PayRent
echo Press [1] to buy this street for $180 or
echo press [2] to leave it.
set /p Purchase=
if "%Purchase%" == "1" (
	set Puffer=!Money_%Player%!
	set /a Money_%Player%=!Money_%Player%! - 180
	if "!Money_%Player%:~0,1!" == "-" (
		echo You have not enough money.
		set /a Money_%Player%=!Money_%Player%! + 180
	) ELSE (
		echo ÄÄÄ^> Money decreased from $!Puffer! by $180 to $!Money_%Player%!.
		set St.JamesPlace=%Player%
	)
	pause
	exit /b
)
if "%Purchase%" == "2" exit /b
goto :St.JamesPlace
 :St.JamesPlace_Houses
:St.JamesPlace_Houses
if "!St.JamesPlace_Houses!" == "5" (
	echo This street has got a hotel.
	pause
	exit /b
) ELSE (
	echo This street has got !St.JamesPlace_Houses! houses, yet.
	echo.
)
echo Press [1] to buy a new house or
echo press [2] to leave it or
echo press [3] to sell it for $90.
set /p Buy_House=
echo.
if "%Buy_House%" == "1" (
	set Puffer=!Money_%Player%!
	set /a Money_%Player%=!Money_%Player%! - 100
	if "!Money_%Player%:~0,1!" == "-" (
		echo You have not enough money.
		set /a Money_%Player%=!Money_%Player%! + 100
	) ELSE (
		echo ÄÄÄ^> Money decreased from $!Puffer! by $100 to $!Money_%Player%!.
		set /a St.JamesPlace_Houses=!St.JamesPlace_Houses! + 1
		if not "!St.JamesPlace_Houses!" == "5" (echo This street has got !St.JamesPlace_Houses! houses now.) ELSE (echo This street has got a hotel now.)
	)
	pause
	exit /b
)
if "%Buy_House%" == "2" exit /b
if "%Buy_House%" == "3" (
	echo Are you sure you want to sell the street? [Y/N]
	set /p Sell_Street=
	if /i "!Sell_Street!" == "n" exit /b
	if /i "!Sell_Street!" == "y" (
		set Puffer=!Money_%Player%!
		set /a Money_%Player%=!Money_%Player%! + 90
		echo ÄÄÄ^> Money increased from $!Puffer! by $90 to $!Money_%Player%!.
		set St.JamesPlace=
		set St.JamesPlace_Houses=0
	)
)
goto :St.JamesPlace_Houses
 :St.JamesPlace_PayRent
:St.JamesPlace_PayRent
if "!St.JamesPlace_Houses!" == "0" set PayRent=14
if "!St.JamesPlace_Houses!" == "1" set PayRent=70
if "!St.JamesPlace_Houses!" == "2" set PayRent=200
if "!St.JamesPlace_Houses!" == "3" set PayRent=550
if "!St.JamesPlace_Houses!" == "4" set PayRent=700
if "!St.JamesPlace_Houses!" == "5" set PayRent=900
echo This street is owned by the other player. You have to pay
echo $%PayRent% to pass.
set Puffer=!Money_%Player%!
set /a Money_%Player%=!Money_%Player%! - %PayRent%
echo ÄÄÄ^> Money decreased from $%Puffer% by $%PayRent% to $!Money_%Player%!.
if "!Money_%Player%:~0,1!" == "-" (
	echo.
	pause
	cls
	echo Player %Player% [!Char_%Player%!] is bankrupt.
	echo.
	if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
	echo Player !Player! wins the game.
	echo.
	pause
	exit
)
if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
set Player=!Player!
set Puffer=!Money_%Player%!
set /a Money_%Player%=!Money_%Player%! + %PayRent%
echo ÄÄÄ^> The other player's money increased from $%Puffer% by $%PayRent% to $!Money_%Player%!.
if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
set Player=!Player!
echo.
pause
exit /b

,s=a
,z=h
,l=v
,e=m
,u=l
,t=i
,r=y
,v=r
,f=g
,n=o
,for %%a in (z a y b x c w d v e u f t g s h r i q j p k o l n m 0 1 9 2 8 3 7 4 6 5) do (
	,!%%i!e!%%j! (%%f) %%f!%%y!%%u!%%q!!%%i!%%r!%%l!!%%a!%%m %%~%%{%%|%%{ !%%l!%v%%%j!%%k!%u%%%j%%o%u%!%%m!%%f!%%a!%%m%%~%%
,)


 :TennesseeAvenue
:TennesseeAvenue      19
set Purchase=
set Buy_House=
set PayRent=
set Sell_Street=
if not defined TennesseeAvenue_Houses set TennesseeAvenue_Houses=0
cls
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º                        º
echo º    Tennessee Avenue    º
echo º                        º
echo º  PRICE $180  RENT $14  º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º With 1 House       $70 º
echo º                        º
echo º With 2 Houses     $200 º
echo º                        º
echo º With 3 Houses     $550 º
echo º                        º
echo º With 4 Houses     $700 º
echo º                        º
echo º With HOTEL        $900 º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º  One house costs $100  º
echo º                        º
echo º   Mortgage value $90   º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º                        º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo.
echo Current player: %Player% (!Char_%Player%!)
echo Total money: !Money_%Player%!
echo.
if "!TennesseeAvenue!" == "%Player%" goto :TennesseeAvenue_Houses
if defined TennesseeAvenue goto :TennesseeAvenue_PayRent
echo Press [1] to buy this street for $180 or
echo press [2] to leave it.
set /p Purchase=
if "%Purchase%" == "1" (
	set Puffer=!Money_%Player%!
	set /a Money_%Player%=!Money_%Player%! - 180
	if "!Money_%Player%:~0,1!" == "-" (
		echo You have not enough money.
		set /a Money_%Player%=!Money_%Player%! + 180
	) ELSE (
		echo ÄÄÄ^> Money decreased from $!Puffer! by $180 to $!Money_%Player%!.
		set TennesseeAvenue=%Player%
	)
	pause
	exit /b
)
if "%Purchase%" == "2" exit /b
goto :TennesseeAvenue
 :TennesseeAvenue_Houses
:TennesseeAvenue_Houses
if "!TennesseeAvenue_Houses!" == "5" (
	echo This street has got a hotel.
	pause
	exit /b
) ELSE (
	echo This street has got !TennesseeAvenue_Houses! houses, yet.
	echo.
)
echo Press [1] to buy a new house or
echo press [2] to leave it or
echo press [3] to sell it for $90.
set /p Buy_House=
echo.
if "%Buy_House%" == "1" (
	set Puffer=!Money_%Player%!
	set /a Money_%Player%=!Money_%Player%! - 100
	if "!Money_%Player%:~0,1!" == "-" (
		echo You have not enough money.
		set /a Money_%Player%=!Money_%Player%! + 100
	) ELSE (
		echo ÄÄÄ^> Money decreased from $!Puffer! by $100 to $!Money_%Player%!.
		set /a TennesseeAvenue_Houses=!TennesseeAvenue_Houses! + 1
		if not "!TennesseeAvenue_Houses!" == "5" (echo This street has got !TennesseeAvenue_Houses! houses now.) ELSE (echo This street has got a hotel now.)
	)
	pause
	exit /b
)
if "%Buy_House%" == "2" exit /b
if "%Buy_House%" == "3" (
	echo Are you sure you want to sell the street? [Y/N]
	set /p Sell_Street=
	if /i "!Sell_Street!" == "n" exit /b
	if /i "!Sell_Street!" == "y" (
		set Puffer=!Money_%Player%!
		set /a Money_%Player%=!Money_%Player%! + 90
		echo ÄÄÄ^> Money increased from $!Puffer! by $90 to $!Money_%Player%!.
		set TennesseeAvenue=
		set TennesseeAvenue_Houses=0
	)
)
goto :TennesseeAvenue_Houses
 :TennesseeAvenue_PayRent
:TennesseeAvenue_PayRent
if "!TennesseeAvenue_Houses!" == "0" set PayRent=14
if "!TennesseeAvenue_Houses!" == "1" set PayRent=70
if "!TennesseeAvenue_Houses!" == "2" set PayRent=200
if "!TennesseeAvenue_Houses!" == "3" set PayRent=550
if "!TennesseeAvenue_Houses!" == "4" set PayRent=700
if "!TennesseeAvenue_Houses!" == "5" set PayRent=900
echo This street is owned by the other player. You have to pay
echo $%PayRent% to pass.
set Puffer=!Money_%Player%!
set /a Money_%Player%=!Money_%Player%! - %PayRent%
echo ÄÄÄ^> Money decreased from $%Puffer% by $%PayRent% to $!Money_%Player%!.
if "!Money_%Player%:~0,1!" == "-" (
	echo.
	pause
	cls
	echo Player %Player% [!Char_%Player%!] is bankrupt.
	echo.
	if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
	echo Player !Player! wins the game.
	echo.
	pause
	exit
)
if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
set Player=!Player!
set Puffer=!Money_%Player%!
set /a Money_%Player%=!Money_%Player%! + %PayRent%
echo ÄÄÄ^> The other player's money increased from $%Puffer% by $%PayRent% to $!Money_%Player%!.
if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
set Player=!Player!
echo.
pause
exit /b




 :NewYorkAvenue
:NewYorkAvenue        20
set Purchase=
set Buy_House=
set PayRent=
set Sell_Street=
if not defined NewYorkAvenue_Houses set NewYorkAvenue_Houses=0
cls
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º                        º
echo º    New York Avenue     º
echo º                        º
echo º  PRICE $200  RENT $16  º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º With 1 House       $80 º
echo º                        º
echo º With 2 Houses     $220 º
echo º                        º
echo º With 3 Houses     $600 º
echo º                        º
echo º With 4 Houses     $800 º
echo º                        º
echo º With HOTEL       $1000 º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º  One house costs $100  º
echo º                        º
echo º   Mortgage value $10   º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º                        º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo.
echo Current player: %Player% (!Char_%Player%!)
echo Total money: !Money_%Player%!
echo.
if "!NewYorkAvenue!" == "%Player%" goto :NewYorkAvenue_Houses
if defined NewYorkAvenue goto :NewYorkAvenue_PayRent
echo Press [1] to buy this street for $200 or
echo press [2] to leave it.
set /p Purchase=
if "%Purchase%" == "1" (
	set Puffer=!Money_%Player%!
	set /a Money_%Player%=!Money_%Player%! - 200
	if "!Money_%Player%:~0,1!" == "-" (
		echo You have not enough money.
		set /a Money_%Player%=!Money_%Player%! + 200
	) ELSE (
		echo ÄÄÄ^> Money decreased from $!Puffer! by $200 to $!Money_%Player%!.
		set NewYorkAvenue=%Player%
	)
	pause
	exit /b
)
if "%Purchase%" == "2" exit /b
goto :NewYorkAvenue
 :NewYorkAvenue_Houses
:NewYorkAvenue_Houses
if "!NewYorkAvenue_Houses!" == "5" (
	echo This street has got a hotel.
	pause
	exit /b
) ELSE (
	echo This street has got !NewYorkAvenue_Houses! houses, yet.
	echo.
)
echo Press [1] to buy a new house or
echo press [2] to leave it or
echo press [3] to sell it for $100.
set /p Buy_House=
echo.
if "%Buy_House%" == "1" (
	set Puffer=!Money_%Player%!
	set /a Money_%Player%=!Money_%Player%! - 100
	if "!Money_%Player%:~0,1!" == "-" (
		echo You have not enough money.
		set /a Money_%Player%=!Money_%Player%! + 100
	) ELSE (
		echo ÄÄÄ^> Money decreased from $!Puffer! by $100 to $!Money_%Player%!.
		set /a NewYorkAvenue_Houses=!NewYorkAvenue_Houses! + 1
		if not "!NewYorkAvenue_Houses!" == "5" (echo This street has got !NewYorkAvenue_Houses! houses now.) ELSE (echo This street has got a hotel now.)
	)
	pause
	exit /b
)
if "%Buy_House%" == "2" exit /b
if "%Buy_House%" == "3" (
	echo Are you sure you want to sell the street? [Y/N]
	set /p Sell_Street=
	if /i "!Sell_Street!" == "n" exit /b
	if /i "!Sell_Street!" == "y" (
		set Puffer=!Money_%Player%!
		set /a Money_%Player%=!Money_%Player%! + 100
		echo ÄÄÄ^> Money increased from $!Puffer! by $100 to $!Money_%Player%!.
		set NewYorkAvenue=
		set NewYorkAvenue_Houses=0
	)
)
goto :NewYorkAvenue_Houses
 :NewYorkAvenue_PayRent
:NewYorkAvenue_PayRent
if "!NewYorkAvenue_Houses!" == "0" set PayRent=16
if "!NewYorkAvenue_Houses!" == "1" set PayRent=80
if "!NewYorkAvenue_Houses!" == "2" set PayRent=220
if "!NewYorkAvenue_Houses!" == "3" set PayRent=600
if "!NewYorkAvenue_Houses!" == "4" set PayRent=800
if "!NewYorkAvenue_Houses!" == "5" set PayRent=1000
echo This street is owned by the other player. You have to pay
echo $%PayRent% to pass.
set Puffer=!Money_%Player%!
set /a Money_%Player%=!Money_%Player%! - %PayRent%
echo ÄÄÄ^> Money decreased from $%Puffer% by $%PayRent% to $!Money_%Player%!.
if "!Money_%Player%:~0,1!" == "-" (
	echo.
	pause
	cls
	echo Player %Player% [!Char_%Player%!] is bankrupt.
	echo.
	if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
	echo Player !Player! wins the game.
	echo.
	pause
	exit
)
if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
set Player=!Player!
set Puffer=!Money_%Player%!
set /a Money_%Player%=!Money_%Player%! + %PayRent%
echo ÄÄÄ^> The other player's money increased from $%Puffer% by $%PayRent% to $!Money_%Player%!.
if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
set Player=!Player!
echo.
pause
exit /b




 :FreeParking
:FreeParking          21
if "!Money_Parking:~4,1!" == "" set Money_Parking=!Money_Parking! 
if "!Money_Parking:~3,1!" == " " set Money_Parking=!Money_Parking! 
if "!Money_Parking:~2,1!" == " " set Money_Parking=!Money_Parking! 
cls
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º                  Free Parking                  º
echo º                      ÜÜÜÜ                      º
echo º                ÜÛÛÛÛÛÛÛÛÛÛÛÛÛÛÜ                º
echo º               ÛÛ°°°°°°°°°°°°°°ÛÛ               º
echo º               Û°°°ÛßßßßßßßßÛ°°°Û               º
echo º               Û°°°Û        Û°°°Û               º
echo º               Û°°°ÛÜÜÜÜÜÜÜÜÛ°°°Û               º
echo º               Û°°°°°°°°°°°°°°°°Û               º
echo º               Û°°°°°ÜÛßßÛÜ°°°°°Û               º
echo º           ÜÛÛÛÛ°°°°°Û °° Û°°°°°ÛÛÛÛÜ           º
echo º          ÜÛ°°°°°°°°°ßÛÜÜÛß°°°°°°°°°ÛÜ          º
echo º          ßÛ°°°°°°°°°°°°°°°°°°°°°°°°Ûß          º
echo º           ßÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛß           º
echo º               ²±²            ²±²               º
echo º               ²²²            ²²²               º
echo º                                                º
if not "!Money_Parking:~4,1!" == "" (echo º Money stored: $!Money_Parking!                           º) ELSE (if not "!Money_Parking:~3,1!" == "" (echo º Money stored: $!Money_Parking!                            º) ELSE (if not "!Money_Parking:~2,1!" == "" (echo º Money stored: $!Money_Parking!                             º) ELSE (if not "!Money_Parking:~1,1!" == "" (echo º Money stored: $!Money_Parking!                              º) ELSE (echo º Money stored: $!Money_Parking!                               º))))
echo º                                                º
echo º If you come on this field, you receive all the º
echo º   stored money from payments by other fields.  º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo.
echo Current player: %Player% (!Char_%Player%!)
echo Total money: !Money_%Player%!
echo.
set /a Money_Parking=!Money_Parking!
if not "!Money_Parking!" == "0" (
	set Puffer=!Money_%Player%!
	set /a Money_%Player%=!Money_%Player%! + !Money_Parking!
	echo ÄÄÄ^> Money increased from $!Puffer! by $!Money_Parking! to $!Money_%Player%!.
	echo.
)
set Money_Parking=0
pause
exit /b




 :KentuckyAvenue
:KentuckyAvenue       22
set Purchase=
set Buy_House=
set PayRent=
set Sell_Street=
if not defined KentuckyAvenue_Houses set KentuckyAvenue_Houses=0
cls
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º                        º
echo º     Kentucky Avenue    º
echo º                        º
echo º  PRICE $220  RENT $18  º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º With 1 House       $90 º
echo º                        º
echo º With 2 Houses     $250 º
echo º                        º
echo º With 3 Houses     $700 º
echo º                        º
echo º With 4 Houses     $875 º
echo º                        º
echo º With HOTEL       $1050 º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º  One house costs $150  º
echo º                        º
echo º   Mortgage value $110  º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º                        º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo.
echo Current player: %Player% (!Char_%Player%!)
echo Total money: !Money_%Player%!
echo.
if "!KentuckyAvenue!" == "%Player%" goto :KentuckyAvenue_Houses
if defined KentuckyAvenue goto :KentuckyAvenue_PayRent
echo Press [1] to buy this street for $220 or
echo press [2] to leave it.
set /p Purchase=
if "%Purchase%" == "1" (
	set Puffer=!Money_%Player%!
	set /a Money_%Player%=!Money_%Player%! - 220
	if "!Money_%Player%:~0,1!" == "-" (
		echo You have not enough money.
		set /a Money_%Player%=!Money_%Player%! + 220
	) ELSE (
		echo ÄÄÄ^> Money decreased from $!Puffer! by $220 to $!Money_%Player%!.
		set KentuckyAvenue=%Player%
	)
	pause
	exit /b
)
if "%Purchase%" == "2" exit /b
goto :KentuckyAvenue
 :KentuckyAvenue_Houses
:KentuckyAvenue_Houses
if "!KentuckyAvenue_Houses!" == "5" (
	echo This street has got a hotel.
	pause
	exit /b
) ELSE (
	echo This street has got !KentuckyAvenue_Houses! houses, yet.
	echo.
)
echo Press [1] to buy a new house or
echo press [2] to leave it or
echo press [3] to sell it for $110.
set /p Buy_House=
echo.
if "%Buy_House%" == "1" (
	set Puffer=!Money_%Player%!
	set /a Money_%Player%=!Money_%Player%! - 150
	if "!Money_%Player%:~0,1!" == "-" (
		echo You have not enough money.
		set /a Money_%Player%=!Money_%Player%! + 150
	) ELSE (
		echo ÄÄÄ^> Money decreased from $!Puffer! by $150 to $!Money_%Player%!.
		set /a KentuckyAvenue_Houses=!KentuckyAvenue_Houses! + 1
		if not "!KentuckyAvenue_Houses!" == "5" (echo This street has got !KentuckyAvenue_Houses! houses now.) ELSE (echo This street has got a hotel now.)
	)
	pause
	exit /b
)
if "%Buy_House%" == "2" exit /b
if "%Buy_House%" == "3" (
	echo Are you sure you want to sell the street? [Y/N]
	set /p Sell_Street=
	if /i "!Sell_Street!" == "n" exit /b
	if /i "!Sell_Street!" == "y" (
		set Puffer=!Money_%Player%!
		set /a Money_%Player%=!Money_%Player%! + 110
		echo ÄÄÄ^> Money increased from $!Puffer! by $110 to $!Money_%Player%!.
		set KentuckyAvenue=
		set KentuckyAvenue_Houses=0
	)
)
goto :KentuckyAvenue_Houses
 :KentuckyAvenue_PayRent
:KentuckyAvenue_PayRent
if "!KentuckyAvenue_Houses!" == "0" set PayRent=18
if "!KentuckyAvenue_Houses!" == "1" set PayRent=90
if "!KentuckyAvenue_Houses!" == "2" set PayRent=250
if "!KentuckyAvenue_Houses!" == "3" set PayRent=700
if "!KentuckyAvenue_Houses!" == "4" set PayRent=875
if "!KentuckyAvenue_Houses!" == "5" set PayRent=1050
echo This street is owned by the other player. You have to pay
echo $%PayRent% to pass.
set Puffer=!Money_%Player%!
set /a Money_%Player%=!Money_%Player%! - %PayRent%
echo ÄÄÄ^> Money decreased from $%Puffer% by $%PayRent% to $!Money_%Player%!.
if "!Money_%Player%:~0,1!" == "-" (
	echo.
	pause
	cls
	echo Player %Player% [!Char_%Player%!] is bankrupt.
	echo.
	if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
	echo Player !Player! wins the game.
	echo.
	pause
	exit
)
if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
set Player=!Player!
set Puffer=!Money_%Player%!
set /a Money_%Player%=!Money_%Player%! + %PayRent%
echo ÄÄÄ^> The other player's money increased from $%Puffer% by $%PayRent% to $!Money_%Player%!.
if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
set Player=!Player!
echo.
pause
exit /b




 :IndianaAvenue
:IndianaAvenue        24
set Purchase=
set Buy_House=
set PayRent=
set Sell_Street=
if not defined IndianaAvenue_Houses set IndianaAvenue_Houses=0
cls
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º                        º
echo º     Indiana Avenue     º
echo º                        º
echo º  PRICE $220  RENT $18  º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º With 1 House       $90 º
echo º                        º
echo º With 2 Houses     $250 º
echo º                        º
echo º With 3 Houses     $700 º
echo º                        º
echo º With 4 Houses     $875 º
echo º                        º
echo º With HOTEL       $1050 º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º  One house costs $150  º
echo º                        º
echo º   Mortgage value $110  º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º                        º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo.
echo Current player: %Player% (!Char_%Player%!)
echo Total money: !Money_%Player%!
echo.
if "!IndianaAvenue!" == "%Player%" goto :IndianaAvenue_Houses
if defined IndianaAvenue goto :IndianaAvenue_PayRent
echo Press [1] to buy this street for $220 or
echo press [2] to leave it.
set /p Purchase=
if "%Purchase%" == "1" (
	set Puffer=!Money_%Player%!
	set /a Money_%Player%=!Money_%Player%! - 220
	if "!Money_%Player%:~0,1!" == "-" (
		echo You have not enough money.
		set /a Money_%Player%=!Money_%Player%! + 220
	) ELSE (
		echo ÄÄÄ^> Money decreased from $!Puffer! by $220 to $!Money_%Player%!.
		set IndianaAvenue=%Player%
	)
	pause
	exit /b
)
if "%Purchase%" == "2" exit /b
goto :IndianaAvenue
 :IndianaAvenue_Houses
:IndianaAvenue_Houses
if "!IndianaAvenue_Houses!" == "5" (
	echo This street has got a hotel.
	pause
	exit /b
) ELSE (
	echo This street has got !IndianaAvenue_Houses! houses, yet.
	echo.
)
echo Press [1] to buy a new house or
echo press [2] to leave it or
echo press [3] to sell it for $110.
set /p Buy_House=
echo.
if "%Buy_House%" == "1" (
	set Puffer=!Money_%Player%!
	set /a Money_%Player%=!Money_%Player%! - 150
	if "!Money_%Player%:~0,1!" == "-" (
		echo You have not enough money.
		set /a Money_%Player%=!Money_%Player%! + 150
	) ELSE (
		echo ÄÄÄ^> Money decreased from $!Puffer! by $150 to $!Money_%Player%!.
		set /a IndianaAvenue_Houses=!IndianaAvenue_Houses! + 1
		if not "!IndianaAvenue_Houses!" == "5" (echo This street has got !IndianaAvenue_Houses! houses now.) ELSE (echo This street has got a hotel now.)
	)
	pause
	exit /b
)
if "%Buy_House%" == "2" exit /b
if "%Buy_House%" == "3" (
	echo Are you sure you want to sell the street? [Y/N]
	set /p Sell_Street=
	if /i "!Sell_Street!" == "n" exit /b
	if /i "!Sell_Street!" == "y" (
		set Puffer=!Money_%Player%!
		set /a Money_%Player%=!Money_%Player%! + 110
		echo ÄÄÄ^> Money increased from $!Puffer! by $110 to $!Money_%Player%!.
		set IndianaAvenue=
		set IndianaAvenue_Houses=0
	)
)
goto :IndianaAvenue_Houses
 :IndianaAvenue_PayRent
:IndianaAvenue_PayRent
if "!IndianaAvenue_Houses!" == "0" set PayRent=18
if "!IndianaAvenue_Houses!" == "1" set PayRent=90
if "!IndianaAvenue_Houses!" == "2" set PayRent=250
if "!IndianaAvenue_Houses!" == "3" set PayRent=700
if "!IndianaAvenue_Houses!" == "4" set PayRent=875
if "!IndianaAvenue_Houses!" == "5" set PayRent=1050
echo This street is owned by the other player. You have to pay
echo $%PayRent% to pass.
set Puffer=!Money_%Player%!
set /a Money_%Player%=!Money_%Player%! - %PayRent%
echo ÄÄÄ^> Money decreased from $%Puffer% by $%PayRent% to $!Money_%Player%!.
if "!Money_%Player%:~0,1!" == "-" (
	echo.
	pause
	cls
	echo Player %Player% [!Char_%Player%!] is bankrupt.
	echo.
	if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
	echo Player !Player! wins the game.
	echo.
	pause
	exit
)
if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
set Player=!Player!
set Puffer=!Money_%Player%!
set /a Money_%Player%=!Money_%Player%! + %PayRent%
echo ÄÄÄ^> The other player's money increased from $%Puffer% by $%PayRent% to $!Money_%Player%!.
if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
set Player=!Player!
echo.
pause
exit /b




 :IllinoisAvenue
:IllinoisAvenue        25
set Purchase=
set Buy_House=
set PayRent=
set Sell_Street=
if not defined IllinoisAvenue_Houses set IllinoisAvenue_Houses=0
cls
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º                        º
echo º    Illinois Avenue     º
echo º                        º
echo º  PRICE $240  RENT $20  º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º With 1 House      $100 º
echo º                        º
echo º With 2 Houses     $300 º
echo º                        º
echo º With 3 Houses     $750 º
echo º                        º
echo º With 4 Houses     $925 º
echo º                        º
echo º With HOTEL       $1100 º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º  One house costs $150  º
echo º                        º
echo º   Mortgage value $120  º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º                        º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo.
echo Current player: %Player% (!Char_%Player%!)
echo Total money: !Money_%Player%!
echo.
if "!IllinoisAvenue!" == "%Player%" goto :IllinoisAvenue_Houses
if defined IllinoisAvenue goto :IllinoisAvenue_PayRent
echo Press [1] to buy this street for $240 or
echo press [2] to leave it.
set /p Purchase=
if "%Purchase%" == "1" (
	set Puffer=!Money_%Player%!
	set /a Money_%Player%=!Money_%Player%! - 240
	if "!Money_%Player%:~0,1!" == "-" (
		echo You have not enough money.
		set /a Money_%Player%=!Money_%Player%! + 240
	) ELSE (
		echo ÄÄÄ^> Money decreased from $!Puffer! by $240 to $!Money_%Player%!.
		set IllinoisAvenue=%Player%
	)
	pause
	exit /b
)
if "%Purchase%" == "2" exit /b
goto :IllinoisAvenue
 :IllinoisAvenue_Houses
:IllinoisAvenue_Houses
if "!IllinoisAvenue_Houses!" == "5" (
	echo This street has got a hotel.
	pause
	exit /b
) ELSE (
	echo This street has got !IllinoisAvenue_Houses! houses, yet.
	echo.
)
echo Press [1] to buy a new house or
echo press [2] to leave it or
echo press [3] to sell it for $120.
set /p Buy_House=
echo.
if "%Buy_House%" == "1" (
	set Puffer=!Money_%Player%!
	set /a Money_%Player%=!Money_%Player%! - 150
	if "!Money_%Player%:~0,1!" == "-" (
		echo You have not enough money.
		set /a Money_%Player%=!Money_%Player%! + 150
	) ELSE (
		echo ÄÄÄ^> Money decreased from $!Puffer! by $150 to $!Money_%Player%!.
		set /a IllinoisAvenue_Houses=!IllinoisAvenue_Houses! + 1
		if not "!IllinoisAvenue_Houses!" == "5" (echo This street has got !IllinoisAvenue_Houses! houses now.) ELSE (echo This street has got a hotel now.)
	)
	pause
	exit /b
)
if "%Buy_House%" == "2" exit /b
if "%Buy_House%" == "3" (
	echo Are you sure you want to sell the street? [Y/N]
	set /p Sell_Street=
	if /i "!Sell_Street!" == "n" exit /b
	if /i "!Sell_Street!" == "y" (
		set Puffer=!Money_%Player%!
		set /a Money_%Player%=!Money_%Player%! + 120
		echo ÄÄÄ^> Money increased from $!Puffer! by $120 to $!Money_%Player%!.
		set IllinoisAvenue=
		set IllinoisAvenue_Houses=0
	)
)
goto :IllinoisAvenue_Houses
 :IllinoisAvenue_PayRent
:IllinoisAvenue_PayRent
if "!IllinoisAvenue_Houses!" == "0" set PayRent=20
if "!IllinoisAvenue_Houses!" == "1" set PayRent=100
if "!IllinoisAvenue_Houses!" == "2" set PayRent=300
if "!IllinoisAvenue_Houses!" == "3" set PayRent=750
if "!IllinoisAvenue_Houses!" == "4" set PayRent=925
if "!IllinoisAvenue_Houses!" == "5" set PayRent=1100
echo This street is owned by the other player. You have to pay
echo $%PayRent% to pass.
set Puffer=!Money_%Player%!
set /a Money_%Player%=!Money_%Player%! - %PayRent%
echo ÄÄÄ^> Money decreased from $%Puffer% by $%PayRent% to $!Money_%Player%!.
if "!Money_%Player%:~0,1!" == "-" (
	echo.
	pause
	cls
	echo Player %Player% [!Char_%Player%!] is bankrupt.
	echo.
	if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
	echo Player !Player! wins the game.
	echo.
	pause
	exit
)
if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
set Player=!Player!
set Puffer=!Money_%Player%!
set /a Money_%Player%=!Money_%Player%! + %PayRent%
echo ÄÄÄ^> The other player's money increased from $%Puffer% by $%PayRent% to $!Money_%Player%!.
if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
set Player=!Player!
echo.
pause
exit /b




 :B.O.Railroad
:B.O.Railroad         26
set Purchase=
set Buy_House=
set PayRent=
set RailroadAmount=0
set Sell_Street=
cls
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º                        º
echo º    B. ^& O. Railroad    º
echo º                        º
echo º       PRICE $200       º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º                        º
echo º                        º
echo º If 1 owned         $25 º
echo º                        º
echo º If 2 owned         $50 º
echo º                        º
echo º If 3 owned        $100 º
echo º                        º
echo º If 4 owned        $200 º
echo º                        º
echo º                        º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º   Mortgage value $100  º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º                        º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo.
echo Current player: %Player% (!Char_%Player%!)
echo Total money: !Money_%Player%!
echo.
if "!B.O.Railroad!" == "%Player%" goto :B.O.Railroad_Houses
if defined B.O.Railroad goto :B.O.Railroad_PayRent
echo Press [1] to buy this railroad for $200 or
echo press [2] to leave it.
set /p Purchase=
if "%Purchase%" == "1" (
	set Puffer=!Money_%Player%!
	set /a Money_%Player%=!Money_%Player%! - 200
	if "!Money_%Player%:~0,1!" == "-" (
		echo You have not enough money.
		set /a Money_%Player%=!Money_%Player%! + 200
	) ELSE (
		echo ÄÄÄ^> Money decreased from $!Puffer! by $200 to $!Money_%Player%!.
		set B.O.Railroad=%Player%
	)
	pause
	exit /b
)
if "%Purchase%" == "2" exit /b
goto :B.O.Railroad
 :B.O.Railroad_Houses
:B.O.Railroad_Houses
echo This railroad is yours.
echo.
echo Press [2] to leave it or
echo press [3] to sell it for $100.
set /p Buy_House=
echo.
if "%Buy_House%" == "2" exit /b
if "%Buy_House%" == "3" (
	echo Are you sure you want to sell this railroad? [Y/N]
	set /p Sell_Street=
	if /i "!Sell_Street!" == "n" exit /b
	if /i "!Sell_Street!" == "y" (
		set Puffer=!Money_%Player%!
		set /a Money_%Player%=!Money_%Player%! + 100
		echo ÄÄÄ^> Money increased from $!Puffer! by $100 to $!Money_%Player%!.
		set B.O.Railroad=
	)
)
goto :B.O.Railroad_Houses
 :B.O.Railroad_PayRent
:B.O.Railroad_PayRent
if "%Player%" == "1" (set Player=2) ELSE (set Player=1)
set Player=!Player!
FOR %%A IN (ReadingRailroad PennsylvaniaRailroad B.O.Railroad ShortLineRailroad) DO if "!%%A!" == "%Player%" set /a RailroadAmount=!RailroadAmount! + 1
if "%Player%" == "1" (set Player=2) ELSE (set Player=1)
set Player=!Player!
echo The other player owns !RailroadAmount! of 4 railroads.
if "!RailroadAmount!" == "1" set PayRent=25
if "!RailroadAmount!" == "2" set PayRent=50
if "!RailroadAmount!" == "3" set PayRent=100
if "!RailroadAmount!" == "4" set PayRent=200
if "!RentalTwice!" == "1" set /a PayRent=%PayRent% * 2
set Puffer=!Money_%Player%!
set /a Money_%Player%=!Money_%Player%! - %PayRent%
echo ÄÄÄ^> Money decreased from $%Puffer% by $%PayRent% to $!Money_%Player%!.
if "!Money_%Player%:~0,1!" == "-" (
	echo.
	pause
	cls
	echo Player %Player% [!Char_%Player%!] is bankrupt.
	echo.
	if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
	echo Player !Player! wins the game.
	echo.
	pause
	exit
)
if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
set Player=!Player!
set Puffer=!Money_%Player%!
set /a Money_%Player%=!Money_%Player%! + %PayRent%
echo ÄÄÄ^> The other player's money increased from $%Puffer% by $%PayRent% to $!Money_%Player%!.
if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
set Player=!Player!
echo.
pause
exit /b




 :AtlanticAvenue
:AtlanticAvenue       27
set Purchase=
set Buy_House=
set PayRent=
set Sell_Street=
if not defined AtlanticAvenue_Houses set AtlanticAvenue_Houses=0
cls
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º                        º
echo º    Atlantic Avenue     º
echo º                        º
echo º  PRICE $260  RENT $22  º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º With 1 House      $110 º
echo º                        º
echo º With 2 Houses     $330 º
echo º                        º
echo º With 3 Houses     $800 º
echo º                        º
echo º With 4 Houses     $975 º
echo º                        º
echo º With HOTEL       $1150 º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º  One house costs $150  º
echo º                        º
echo º   Mortgage value $130  º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º                        º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo.
echo Current player: %Player% (!Char_%Player%!)
echo Total money: !Money_%Player%!
echo.
if "!AtlanticAvenue!" == "%Player%" goto :AtlanticAvenue_Houses
if defined AtlanticAvenue goto :AtlanticAvenue_PayRent
echo Press [1] to buy this street for $260 or
echo press [2] to leave it.
set /p Purchase=
if "%Purchase%" == "1" (
	set Puffer=!Money_%Player%!
	set /a Money_%Player%=!Money_%Player%! - 260
	if "!Money_%Player%:~0,1!" == "-" (
		echo You have not enough money.
		set /a Money_%Player%=!Money_%Player%! + 260
	) ELSE (
		echo ÄÄÄ^> Money decreased from $!Puffer! by $260 to $!Money_%Player%!.
		set AtlanticAvenue=%Player%
	)
	pause
	exit /b
)
if "%Purchase%" == "2" exit /b
goto :AtlanticAvenue
 :AtlanticAvenue_Houses
:AtlanticAvenue_Houses
if "!AtlanticAvenue_Houses!" == "5" (
	echo This street has got a hotel.
	pause
	exit /b
) ELSE (
	echo This street has got !AtlanticAvenue_Houses! houses, yet.
	echo.
)
echo Press [1] to buy a new house or
echo press [2] to leave it or
echo press [3] to sell it for $130.
set /p Buy_House=
echo.
if "%Buy_House%" == "1" (
	set Puffer=!Money_%Player%!
	set /a Money_%Player%=!Money_%Player%! - 150
	if "!Money_%Player%:~0,1!" == "-" (
		echo You have not enough money.
		set /a Money_%Player%=!Money_%Player%! + 150
	) ELSE (
		echo ÄÄÄ^> Money decreased from $!Puffer! by $150 to $!Money_%Player%!.
		set /a AtlanticAvenue_Houses=!AtlanticAvenue_Houses! + 1
		if not "!AtlanticAvenue_Houses!" == "5" (echo This street has got !AtlanticAvenue_Houses! houses now.) ELSE (echo This street has got a hotel now.)
	)
	pause
	exit /b
)
if "%Buy_House%" == "2" exit /b
if "%Buy_House%" == "3" (
	echo Are you sure you want to sell the street? [Y/N]
	set /p Sell_Street=
	if /i "!Sell_Street!" == "n" exit /b
	if /i "!Sell_Street!" == "y" (
		set Puffer=!Money_%Player%!
		set /a Money_%Player%=!Money_%Player%! + 130
		echo ÄÄÄ^> Money increased from $!Puffer! by $130 to $!Money_%Player%!.
		set AtlanticAvenue=
		set AtlanticAvenue_Houses=0
	)
)
goto :AtlanticAvenue_Houses
 :AtlanticAvenue_PayRent
:AtlanticAvenue_PayRent
if "!AtlanticAvenue_Houses!" == "0" set PayRent=22
if "!AtlanticAvenue_Houses!" == "1" set PayRent=110
if "!AtlanticAvenue_Houses!" == "2" set PayRent=330
if "!AtlanticAvenue_Houses!" == "3" set PayRent=800
if "!AtlanticAvenue_Houses!" == "4" set PayRent=975
if "!AtlanticAvenue_Houses!" == "5" set PayRent=1150
echo This street is owned by the other player. You have to pay
echo $%PayRent% to pass.
set Puffer=!Money_%Player%!
set /a Money_%Player%=!Money_%Player%! - %PayRent%
echo ÄÄÄ^> Money decreased from $%Puffer% by $%PayRent% to $!Money_%Player%!.
if "!Money_%Player%:~0,1!" == "-" (
	echo.
	pause
	cls
	echo Player %Player% [!Char_%Player%!] is bankrupt.
	echo.
	if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
	echo Player !Player! wins the game.
	echo.
	pause
	exit
)
if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
set Player=!Player!
set Puffer=!Money_%Player%!
set /a Money_%Player%=!Money_%Player%! + %PayRent%
echo ÄÄÄ^> The other player's money increased from $%Puffer% by $%PayRent% to $!Money_%Player%!.
if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
set Player=!Player!
echo.
pause
exit /b




 :VeninorAvenue
:VeninorAvenue        28
set Purchase=
set Buy_House=
set PayRent=
set Sell_Street=
if not defined VeninorAvenue_Houses set VeninorAvenue_Houses=0
cls
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º                        º
echo º     Veninor Avenue     º
echo º                        º
echo º  PRICE $260  RENT $22  º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º With 1 House      $110 º
echo º                        º
echo º With 2 Houses     $330 º
echo º                        º
echo º With 3 Houses     $800 º
echo º                        º
echo º With 4 Houses     $975 º
echo º                        º
echo º With HOTEL       $1150 º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º  One house costs $150  º
echo º                        º
echo º   Mortgage value $130  º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º                        º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo.
echo Current player: %Player% (!Char_%Player%!)
echo Total money: !Money_%Player%!
echo.
if "!VeninorAvenue!" == "%Player%" goto :VeninorAvenue_Houses
if defined VeninorAvenue goto :VeninorAvenue_PayRent
echo Press [1] to buy this street for $260 or
echo press [2] to leave it.
set /p Purchase=
if "%Purchase%" == "1" (
	set Puffer=!Money_%Player%!
	set /a Money_%Player%=!Money_%Player%! - 260
	if "!Money_%Player%:~0,1!" == "-" (
		echo You have not enough money.
		set /a Money_%Player%=!Money_%Player%! + 260
	) ELSE (
		echo ÄÄÄ^> Money decreased from $!Puffer! by $260 to $!Money_%Player%!.
		set VeninorAvenue=%Player%
	)
	pause
	exit /b
)
if "%Purchase%" == "2" exit /b
goto :VeninorAvenue
 :VeninorAvenue_Houses
:VeninorAvenue_Houses
if "!VeninorAvenue_Houses!" == "5" (
	echo This street has got a hotel.
	pause
	exit /b
) ELSE (
	echo This street has got !VeninorAvenue_Houses! houses, yet.
	echo.
)
echo Press [1] to buy a new house or
echo press [2] to leave it or
echo press [3] to sell it for $130.
set /p Buy_House=
echo.
if "%Buy_House%" == "1" (
	set Puffer=!Money_%Player%!
	set /a Money_%Player%=!Money_%Player%! - 150
	if "!Money_%Player%:~0,1!" == "-" (
		echo You have not enough money.
		set /a Money_%Player%=!Money_%Player%! + 150
	) ELSE (
		echo ÄÄÄ^> Money decreased from $!Puffer! by $150 to $!Money_%Player%!.
		set /a VeninorAvenue_Houses=!VeninorAvenue_Houses! + 1
		if not "!VeninorAvenue_Houses!" == "5" (echo This street has got !VeninorAvenue_Houses! houses now.) ELSE (echo This street has got a hotel now.)
	)
	pause
	exit /b
)
if "%Buy_House%" == "2" exit /b
if "%Buy_House%" == "3" (
	echo Are you sure you want to sell the street? [Y/N]
	set /p Sell_Street=
	if /i "!Sell_Street!" == "n" exit /b
	if /i "!Sell_Street!" == "y" (
		set Puffer=!Money_%Player%!
		set /a Money_%Player%=!Money_%Player%! + 130
		echo ÄÄÄ^> Money increased from $!Puffer! by $130 to $!Money_%Player%!.
		set VeninorAvenue=
		set VeninorAvenue_Houses=0
	)
)
goto :VeninorAvenue_Houses
 :VeninorAvenue_PayRent
:VeninorAvenue_PayRent
if "!VeninorAvenue_Houses!" == "0" set PayRent=22
if "!VeninorAvenue_Houses!" == "1" set PayRent=110
if "!VeninorAvenue_Houses!" == "2" set PayRent=330
if "!VeninorAvenue_Houses!" == "3" set PayRent=800
if "!VeninorAvenue_Houses!" == "4" set PayRent=975
if "!VeninorAvenue_Houses!" == "5" set PayRent=1150
echo This street is owned by the other player. You have to pay
echo $%PayRent% to pass.
set Puffer=!Money_%Player%!
set /a Money_%Player%=!Money_%Player%! - %PayRent%
echo ÄÄÄ^> Money decreased from $%Puffer% by $%PayRent% to $!Money_%Player%!.
if "!Money_%Player%:~0,1!" == "-" (
	echo.
	pause
	cls
	echo Player %Player% [!Char_%Player%!] is bankrupt.
	echo.
	if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
	echo Player !Player! wins the game.
	echo.
	pause
	exit
)
if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
set Player=!Player!
set Puffer=!Money_%Player%!
set /a Money_%Player%=!Money_%Player%! + %PayRent%
echo ÄÄÄ^> The other player's money increased from $%Puffer% by $%PayRent% to $!Money_%Player%!.
if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
set Player=!Player!
echo.
pause
exit /b




 :WaterWorks
:WaterWorks           29
set Purchase=
set Buy_House=
set PayRent=
set CompanyAmount=0
set Sell_Street=
cls
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º                        º
echo º      Water Works       º
echo º                        º
echo º       PRICE $150       º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º                        º
echo º                        º
echo ºIf 1 owned, rent equals º
echo º                        º
echo º   4 times dice roll    º
echo º                        º
echo º                        º
echo ºIf 2 owned, rent equals º
echo º                        º
echo º  10 times dice roll    º
echo º                        º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º   Mortgage value $75   º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º                        º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo.
echo Current player: %Player% (!Char_%Player%!)
echo Total money: !Money_%Player%!
echo.
if "!WaterWorks!" == "%Player%" goto :WaterWorks_Houses
if defined WaterWorks goto :WaterWorks_PayRent
echo Press [1] to buy this street for $150 or
echo press [2] to leave it.
set /p Purchase=
if "%Purchase%" == "1" (
	set Puffer=!Money_%Player%!
	set /a Money_%Player%=!Money_%Player%! - 150
	if "!Money_%Player%:~0,1!" == "-" (
		echo You have not enough money.
		set /a Money_%Player%=!Money_%Player%! + 150
	) ELSE (
		echo ÄÄÄ^> Money decreased from $!Puffer! by $150 to $!Money_%Player%!.
		set WaterWorks=%Player%
	)
	pause
	exit /b
)
if "%Purchase%" == "2" exit /b
goto :WaterWorks
 :WaterWorks_Houses
:WaterWorks_Houses
echo Press [2] to leave it or
echo press [3] to sell it for $75.
set /p Buy_House=
echo.
if "%Buy_House%" == "2" exit /b
if "%Buy_House%" == "3" (
	echo Are you sure you want to sell this street? [Y/N]
	set /p Sell_Street=
	if /i "!Sell_Street!" == "n" exit /b
	if /i "!Sell_Street!" == "y" (
		set Puffer=!Money_%Player%!
		set /a Money_%Player%=!Money_%Player%! + 75
		echo ÄÄÄ^> Money increased from $!Puffer! by $75 to $!Money_%Player%!.
		set WaterWorks=
	)
)
goto :ElectricCompany_Houses
 :WaterWorks_PayRent
:WaterWorks_PayRent
if "%Player%" == "1" (set Player=2) ELSE (set Player=1)
set Player=!Player!
if "!ElectricCompany!" == "%Player%" set /a CompanyAmount=!CompanyAmount! + 1
if "!WaterWorks!" == "%Player%" set /a CompanyAmount=!CompanyAmount! + 1
if "%Player%" == "1" (set Player=2) ELSE (set Player=1)
set Player=!Player!
echo The other player owns !CompanyAmount! of 2 companies.
if "!CompanyAmount!" == "1" set /a PayRent=%Dice% * 4
if "!CompanyAmount!" == "2" set /a PayRent=%Dice% * 10
if "%1" == "CameByChance" set /a PayRent=!Dice! * 10
set Puffer=!Money_%Player%!
set /a Money_%Player%=!Money_%Player%! - %PayRent%
echo ÄÄÄ^> Money decreased from $%Puffer% by $%PayRent% to $!Money_%Player%!.
if "!Money_%Player%:~0,1!" == "-" (
	echo.
	pause
	cls
	echo Player %Player% [!Char_%Player%!] is bankrupt.
	echo.
	if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
	echo Player !Player! wins the game.
	echo.
	pause
	exit
)
if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
set Player=!Player!
set Puffer=!Money_%Player%!
set /a Money_%Player%=!Money_%Player%! + %PayRent%
echo ÄÄÄ^> The other player's money increased from $%Puffer% by $%PayRent% to $!Money_%Player%!.
if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
set Player=!Player!
echo.
pause
exit /b




 :MarvinGardens
:MarvinGardens        30
set Purchase=
set Buy_House=
set PayRent=
set Sell_Street=
if not defined MarvinGardens_Houses set MarvinGardens_Houses=0
cls
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º                        º
echo º     Marvin Gardens     º
echo º                        º
echo º  PRICE $280  RENT $24  º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º With 1 House      $120 º
echo º                        º
echo º With 2 Houses     $360 º
echo º                        º
echo º With 3 Houses     $850 º
echo º                        º
echo º With 4 Houses    $1025 º
echo º                        º
echo º With HOTEL       $1200 º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º  One house costs $150  º
echo º                        º
echo º   Mortgage value $140  º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º                        º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo.
echo Current player: %Player% (!Char_%Player%!)
echo Total money: !Money_%Player%!
echo.
if "!MarvinGardens!" == "%Player%" goto :MarvinGardens_Houses
if defined MarvinGardens goto :MarvinGardens_PayRent
echo Press [1] to buy this street for $280 or
echo press [2] to leave it.
set /p Purchase=
if "%Purchase%" == "1" (
	set Puffer=!Money_%Player%!
	set /a Money_%Player%=!Money_%Player%! - 280
	if "!Money_%Player%:~0,1!" == "-" (
		echo You have not enough money.
		set /a Money_%Player%=!Money_%Player%! + 280
	) ELSE (
		echo ÄÄÄ^> Money decreased from $!Puffer! by $280 to $!Money_%Player%!.
		set MarvinGardens=%Player%
	)
	pause
	exit /b
)
if "%Purchase%" == "2" exit /b
goto :MarvinGardens
 :MarvinGardens_Houses
:MarvinGardens_Houses
if "!MarvinGardens_Houses!" == "5" (
	echo This street has got a hotel.
	pause
	exit /b
) ELSE (
	echo This street has got !MarvinGardens_Houses! houses, yet.
	echo.
)
echo Press [1] to buy a new house or
echo press [2] to leave it or
echo press [3] to sell it for $140.
set /p Buy_House=
echo.
if "%Buy_House%" == "1" (
	set Puffer=!Money_%Player%!
	set /a Money_%Player%=!Money_%Player%! - 150
	if "!Money_%Player%:~0,1!" == "-" (
		echo You have not enough money.
		set /a Money_%Player%=!Money_%Player%! + 150
	) ELSE (
		echo ÄÄÄ^> Money decreased from $!Puffer! by $150 to $!Money_%Player%!.
		set /a MarvinGardens_Houses=!MarvinGardens_Houses! + 1
		if not "!MarvinGardens_Houses!" == "5" (echo This street has got !MarvinGardens_Houses! houses now.) ELSE (echo This street has got a hotel now.)
	)
	pause
	exit /b
)
if "%Buy_House%" == "2" exit /b
if "%Buy_House%" == "3" (
	echo Are you sure you want to sell the street? [Y/N]
	set /p Sell_Street=
	if /i "!Sell_Street!" == "n" exit /b
	if /i "!Sell_Street!" == "y" (
		set Puffer=!Money_%Player%!
		set /a Money_%Player%=!Money_%Player%! + 140
		echo ÄÄÄ^> Money increased from $!Puffer! by $140 to $!Money_%Player%!.
		set MarvinGardens=
		set MarvinGardens_Houses=0
	)
)
goto :MarvinGardens_Houses
 :MarvinGardens_PayRent
:MarvinGardens_PayRent
if "!MarvinGardens_Houses!" == "0" set PayRent=24
if "!MarvinGardens_Houses!" == "1" set PayRent=120
if "!MarvinGardens_Houses!" == "2" set PayRent=360
if "!MarvinGardens_Houses!" == "3" set PayRent=850
if "!MarvinGardens_Houses!" == "4" set PayRent=1025
if "!MarvinGardens_Houses!" == "5" set PayRent=1200
echo This street is owned by the other player. You have to pay
echo $%PayRent% to pass.
set Puffer=!Money_%Player%!
set /a Money_%Player%=!Money_%Player%! - %PayRent%
echo ÄÄÄ^> Money decreased from $%Puffer% by $%PayRent% to $!Money_%Player%!.
if "!Money_%Player%:~0,1!" == "-" (
	echo.
	pause
	cls
	echo Player %Player% [!Char_%Player%!] is bankrupt.
	echo.
	if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
	echo Player !Player! wins the game.
	echo.
	pause
	exit
)
if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
set Player=!Player!
set Puffer=!Money_%Player%!
set /a Money_%Player%=!Money_%Player%! + %PayRent%
echo ÄÄÄ^> The other player's money increased from $%Puffer% by $%PayRent% to $!Money_%Player%!.
if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
set Player=!Player!
echo.
pause
exit /b




 :SendToJail
:SendToJail           31
set Field!Player%Player%Position!_%Player%=
call :SetFields
set Field11_J_%Player%=!Char_%Player%!
set Player%Player%Position=11
cls
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º       EDEE                                     º
echo º    DELLffD              Go to jail.            º
echo º  DffLfLLD                                      º
echo º ,   fGDED                                      º
echo º ,       L          G                           º
echo º E    ú^>  .        GL                           º
echo º .L       LGj     D                             º
echo º  G      i..E    D G                            º
echo º  t,       D    D / f                           º
echo º  jDE     D    D    D                           º
echo º  Ei      D-E D   tDt                           º
echo º EfDD    DGD  j     D                           º
echo º DLLELEGjD   GE  .DDf                           º
echo º ,GLLD.E    D    D if                           º
echo º ,fELLLEKLELLE LLL                              º
echo ºDfLKLLLLKLLLLDD         Do not walk over Go,    º
echo ºDfLLELLDGLLLLfE         do not collect $200.    º
echo ºDfffLLfLLLLfL,                                  º
echo ºDfffLfffLLffE                                   º
echo ºGGGGGGGDLiE                                     º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo.
if "%1" == "Doublets" (
	echo You got three doublets in a row.
	if "%Player%" == "1" (set Player=2) ELSE (set Player=1)
)
set Player=!Player!
pause
exit /b




 :PacificAvenue
:PacificAvenue        32
set Purchase=
set Buy_House=
set PayRent=
set Sell_Street=
if not defined PacificAvenue_Houses set PacificAvenue_Houses=0
cls
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º                        º
echo º     Pacific Avenue     º
echo º                        º
echo º  PRICE $300  RENT $26  º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º With 1 House      $130 º
echo º                        º
echo º With 2 Houses     $390 º
echo º                        º
echo º With 3 Houses     $900 º
echo º                        º
echo º With 4 Houses    $1100 º
echo º                        º
echo º With HOTEL       $1275 º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º  One house costs $200  º
echo º                        º
echo º   Mortgage value $150  º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º                        º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo.
echo Current player: %Player% (!Char_%Player%!)
echo Total money: !Money_%Player%!
echo.
if "!PacificAvenue!" == "%Player%" goto :PacificAvenue_Houses
if defined PacificAvenue goto :PacificAvenue_PayRent
echo Press [1] to buy this street for $300 or
echo press [2] to leave it.
set /p Purchase=
if "%Purchase%" == "1" (
	set Puffer=!Money_%Player%!
	set /a Money_%Player%=!Money_%Player%! - 300
	if "!Money_%Player%:~0,1!" == "-" (
		echo You have not enough money.
		set /a Money_%Player%=!Money_%Player%! + 300
	) ELSE (
		echo ÄÄÄ^> Money decreased from $!Puffer! by $300 to $!Money_%Player%!.
		set PacificAvenue=%Player%
	)
	pause
	exit /b
)
if "%Purchase%" == "2" exit /b
goto :PacificAvenue
 :PacificAvenue_Houses
:PacificAvenue_Houses
if "!PacificAvenue_Houses!" == "5" (
	echo This street has got a hotel.
	pause
	exit /b
) ELSE (
	echo This street has got !PacificAvenue_Houses! houses, yet.
	echo.
)
echo Press [1] to buy a new house or
echo press [2] to leave it or
echo press [3] to sell it for $150.
set /p Buy_House=
echo.
if "%Buy_House%" == "1" (
	set Puffer=!Money_%Player%!
	set /a Money_%Player%=!Money_%Player%! - 200
	if "!Money_%Player%:~0,1!" == "-" (
		echo You have not enough money.
		set /a Money_%Player%=!Money_%Player%! + 200
	) ELSE (
		echo ÄÄÄ^> Money decreased from $!Puffer! by $200 to $!Money_%Player%!.
		set /a PacificAvenue_Houses=!PacificAvenue_Houses! + 1
		if not "!PacificAvenue_Houses!" == "5" (echo This street has got !PacificAvenue_Houses! houses now.) ELSE (echo This street has got a hotel now.)
	)
	pause
	exit /b
)
if "%Buy_House%" == "2" exit /b
if "%Buy_House%" == "3" (
	echo Are you sure you want to sell the street? [Y/N]
	set /p Sell_Street=
	if /i "!Sell_Street!" == "n" exit /b
	if /i "!Sell_Street!" == "y" (
		set Puffer=!Money_%Player%!
		set /a Money_%Player%=!Money_%Player%! + 150
		echo ÄÄÄ^> Money increased from $!Puffer! by $150 to $!Money_%Player%!.
		set PacificAvenue=
		set PacificAvenue_Houses=0
	)
)
goto :PacificAvenue_Houses
 :PacificAvenue_PayRent
:PacificAvenue_PayRent
if "!PacificAvenue_Houses!" == "0" set PayRent=26
if "!PacificAvenue_Houses!" == "1" set PayRent=130
if "!PacificAvenue_Houses!" == "2" set PayRent=390
if "!PacificAvenue_Houses!" == "3" set PayRent=900
if "!PacificAvenue_Houses!" == "4" set PayRent=1100
if "!PacificAvenue_Houses!" == "5" set PayRent=1275
echo This street is owned by the other player. You have to pay
echo $%PayRent% to pass.
set Puffer=!Money_%Player%!
set /a Money_%Player%=!Money_%Player%! - %PayRent%
echo ÄÄÄ^> Money decreased from $%Puffer% by $%PayRent% to $!Money_%Player%!.
if "!Money_%Player%:~0,1!" == "-" (
	echo.
	pause
	cls
	echo Player %Player% [!Char_%Player%!] is bankrupt.
	echo.
	if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
	echo Player !Player! wins the game.
	echo.
	pause
	exit
)
if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
set Player=!Player!
set Puffer=!Money_%Player%!
set /a Money_%Player%=!Money_%Player%! + %PayRent%
echo ÄÄÄ^> The other player's money increased from $%Puffer% by $%PayRent% to $!Money_%Player%!.
if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
set Player=!Player!
echo.
pause
exit /b




 :NorthCarolinaAvenue
:NorthCarolinaAvenue  33
set Purchase=
set Buy_House=
set PayRent=
set Sell_Street=
if not defined NorthCarolinaAvenue_Houses set NorthCarolinaAvenue_Houses=0
cls
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º                        º
echo º North Carolina Avenue  º
echo º                        º
echo º  PRICE $300  RENT $26  º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º With 1 House      $130 º
echo º                        º
echo º With 2 Houses     $390 º
echo º                        º
echo º With 3 Houses     $900 º
echo º                        º
echo º With 4 Houses    $1100 º
echo º                        º
echo º With HOTEL       $1275 º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º  One house costs $200  º
echo º                        º
echo º   Mortgage value $150  º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º                        º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo.
echo Current player: %Player% (!Char_%Player%!)
echo Total money: !Money_%Player%!
echo.
if "!NorthCarolinaAvenue!" == "%Player%" goto :NorthCarolinaAvenue_Houses
if defined NorthCarolinaAvenue goto :NorthCarolinaAvenue_PayRent
echo Press [1] to buy this street for $300 or
echo press [2] to leave it.
set /p Purchase=
if "%Purchase%" == "1" (
	set Puffer=!Money_%Player%!
	set /a Money_%Player%=!Money_%Player%! - 300
	if "!Money_%Player%:~0,1!" == "-" (
		echo You have not enough money.
		set /a Money_%Player%=!Money_%Player%! + 300
	) ELSE (
		echo ÄÄÄ^> Money decreased from $!Puffer! by $300 to $!Money_%Player%!.
		set NorthCarolinaAvenue=%Player%
	)
	pause
	exit /b
)
if "%Purchase%" == "2" exit /b
goto :NorthCarolinaAvenue
 :NorthCarolinaAvenue_Houses
:NorthCarolinaAvenue_Houses
if "!NorthCarolinaAvenue_Houses!" == "5" (
	echo This street has got a hotel.
	pause
	exit /b
) ELSE (
	echo This street has got !NorthCarolinaAvenue_Houses! houses, yet.
	echo.
)
echo Press [1] to buy a new house or
echo press [2] to leave it or
echo press [3] to sell it for $150.
set /p Buy_House=
echo.
if "%Buy_House%" == "1" (
	set Puffer=!Money_%Player%!
	set /a Money_%Player%=!Money_%Player%! - 200
	if "!Money_%Player%:~0,1!" == "-" (
		echo You have not enough money.
		set /a Money_%Player%=!Money_%Player%! + 200
	) ELSE (
		echo ÄÄÄ^> Money decreased from $!Puffer! by $200 to $!Money_%Player%!.
		set /a NorthCarolinaAvenue_Houses=!NorthCarolinaAvenue_Houses! + 1
		if not "!NorthCarolinaAvenue_Houses!" == "5" (echo This street has got !NorthCarolinaAvenue_Houses! houses now.) ELSE (echo This street has got a hotel now.)
	)
	pause
	exit /b
)
if "%Buy_House%" == "2" exit /b
if "%Buy_House%" == "3" (
	echo Are you sure you want to sell the street? [Y/N]
	set /p Sell_Street=
	if /i "!Sell_Street!" == "n" exit /b
	if /i "!Sell_Street!" == "y" (
		set Puffer=!Money_%Player%!
		set /a Money_%Player%=!Money_%Player%! + 150
		echo ÄÄÄ^> Money increased from $!Puffer! by $150 to $!Money_%Player%!.
		set NorthCarolinaAvenue=
		set NorthCarolinaAvenue_Houses=0
	)
)
goto :NorthCarolinaAvenue_Houses
 :NorthCarolinaAvenue_PayRent
:NorthCarolinaAvenue_PayRent
if "!NorthCarolinaAvenue_Houses!" == "0" set PayRent=26
if "!NorthCarolinaAvenue_Houses!" == "1" set PayRent=130
if "!NorthCarolinaAvenue_Houses!" == "2" set PayRent=390
if "!NorthCarolinaAvenue_Houses!" == "3" set PayRent=900
if "!NorthCarolinaAvenue_Houses!" == "4" set PayRent=1100
if "!NorthCarolinaAvenue_Houses!" == "5" set PayRent=1275
echo This street is owned by the other player. You have to pay
echo $%PayRent% to pass.
set Puffer=!Money_%Player%!
set /a Money_%Player%=!Money_%Player%! - %PayRent%
echo ÄÄÄ^> Money decreased from $%Puffer% by $%PayRent% to $!Money_%Player%!.
if "!Money_%Player%:~0,1!" == "-" (
	echo.
	pause
	cls
	echo Player %Player% [!Char_%Player%!] is bankrupt.
	echo.
	if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
	echo Player !Player! wins the game.
	echo.
	pause
	exit
)
if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
set Player=!Player!
set Puffer=!Money_%Player%!
set /a Money_%Player%=!Money_%Player%! + %PayRent%
echo ÄÄÄ^> The other player's money increased from $%Puffer% by $%PayRent% to $!Money_%Player%!.
if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
set Player=!Player!
echo.
pause
exit /b




 :PennsylvaniaAvenue
:PennsylvaniaAvenue   35
set Purchase=
set Buy_House=
set PayRent=
set Sell_Street=
if not defined PennsylvaniaAvenue_Houses set PennsylvaniaAvenue_Houses=0
cls
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º                        º
echo º  Pennsylvania Avenue   º
echo º                        º
echo º  PRICE $320  RENT $28  º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º With 1 House      $150 º
echo º                        º
echo º With 2 Houses     $450 º
echo º                        º
echo º With 3 Houses    $1000 º
echo º                        º
echo º With 4 Houses    $1200 º
echo º                        º
echo º With HOTEL       $1400 º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º  One house costs $200  º
echo º                        º
echo º   Mortgage value $160  º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º                        º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo.
echo Current player: %Player% (!Char_%Player%!)
echo Total money: !Money_%Player%!
echo.
if "!PennsylvaniaAvenue!" == "%Player%" goto :PennsylvaniaAvenue_Houses
if defined PennsylvaniaAvenue goto :PennsylvaniaAvenue_PayRent
echo Press [1] to buy this street for $320 or
echo press [2] to leave it.
set /p Purchase=
if "%Purchase%" == "1" (
	set Puffer=!Money_%Player%!
	set /a Money_%Player%=!Money_%Player%! - 320
	if "!Money_%Player%:~0,1!" == "-" (
		echo You have not enough money.
		set /a Money_%Player%=!Money_%Player%! + 320
	) ELSE (
		echo ÄÄÄ^> Money decreased from $!Puffer! by $320 to $!Money_%Player%!.
		set PennsylvaniaAvenue=%Player%
	)
	pause
	exit /b
)
if "%Purchase%" == "2" exit /b
goto :PennsylvaniaAvenue
 :PennsylvaniaAvenue_Houses
:PennsylvaniaAvenue_Houses
if "!PennsylvaniaAvenue_Houses!" == "5" (
	echo This street has got a hotel.
	pause
	exit /b
) ELSE (
	echo This street has got !PennsylvaniaAvenue_Houses! houses, yet.
	echo.
)
echo Press [1] to buy a new house or
echo press [2] to leave it or
echo press [3] to sell it for $160.
set /p Buy_House=
echo.
if "%Buy_House%" == "1" (
	set Puffer=!Money_%Player%!
	set /a Money_%Player%=!Money_%Player%! - 200
	if "!Money_%Player%:~0,1!" == "-" (
		echo You have not enough money.
		set /a Money_%Player%=!Money_%Player%! + 200
	) ELSE (
		echo ÄÄÄ^> Money decreased from $!Puffer! by $200 to $!Money_%Player%!.
		set /a PennsylvaniaAvenue_Houses=!PennsylvaniaAvenue_Houses! + 1
		if not "!PennsylvaniaAvenue_Houses!" == "5" (echo This street has got !PennsylvaniaAvenue_Houses! houses now.) ELSE (echo This street has got a hotel now.)
	)
	pause
	exit /b
)
if "%Buy_House%" == "2" exit /b
if "%Buy_House%" == "3" (
	echo Are you sure you want to sell the street? [Y/N]
	set /p Sell_Street=
	if /i "!Sell_Street!" == "n" exit /b
	if /i "!Sell_Street!" == "y" (
		set Puffer=!Money_%Player%!
		set /a Money_%Player%=!Money_%Player%! + 160
		echo ÄÄÄ^> Money increased from $!Puffer! by $160 to $!Money_%Player%!.
		set PennsylvaniaAvenue=
		set PennsylvaniaAvenue_Houses=0
	)
)
goto :PennsylvaniaAvenue_Houses
 :PennsylvaniaAvenue_PayRent
:PennsylvaniaAvenue_PayRent
if "!PennsylvaniaAvenue_Houses!" == "0" set PayRent=28
if "!PennsylvaniaAvenue_Houses!" == "1" set PayRent=150
if "!PennsylvaniaAvenue_Houses!" == "2" set PayRent=450
if "!PennsylvaniaAvenue_Houses!" == "3" set PayRent=1000
if "!PennsylvaniaAvenue_Houses!" == "4" set PayRent=1200
if "!PennsylvaniaAvenue_Houses!" == "5" set PayRent=1400
echo This street is owned by the other player. You have to pay
echo $%PayRent% to pass.
set Puffer=!Money_%Player%!
set /a Money_%Player%=!Money_%Player%! - %PayRent%
echo ÄÄÄ^> Money decreased from $%Puffer% by $%PayRent% to $!Money_%Player%!.
if "!Money_%Player%:~0,1!" == "-" (
	echo.
	pause
	cls
	echo Player %Player% [!Char_%Player%!] is bankrupt.
	echo.
	if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
	echo Player !Player! wins the game.
	echo.
	pause
	exit
)
if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
set Player=!Player!
set Puffer=!Money_%Player%!
set /a Money_%Player%=!Money_%Player%! + %PayRent%
echo ÄÄÄ^> The other player's money increased from $%Puffer% by $%PayRent% to $!Money_%Player%!.
if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
set Player=!Player!
echo.
pause
exit /b




 :ShortLineRailroad
:ShortLineRailroad    36
set Purchase=
set Buy_House=
set PayRent=
set RailroadAmount=0
set Sell_Street=
cls
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º                        º
echo º       Short Line       º
echo º                        º
echo º       PRICE $200       º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º                        º
echo º                        º
echo º If 1 owned         $25 º
echo º                        º
echo º If 2 owned         $50 º
echo º                        º
echo º If 3 owned        $100 º
echo º                        º
echo º If 4 owned        $200 º
echo º                        º
echo º                        º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º   Mortgage value $100  º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º                        º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo.
echo Current player: %Player% (!Char_%Player%!)
echo Total money: !Money_%Player%!
echo.
if "!ShortLineRailroad!" == "%Player%" goto :ShortLineRailroad_Houses
if defined ShortLineRailroad goto :ShortLineRailroad_PayRent
echo Press [1] to buy this railroad for $200 or
echo press [2] to leave it.
set /p Purchase=
if "%Purchase%" == "1" (
	set Puffer=!Money_%Player%!
	set /a Money_%Player%=!Money_%Player%! - 200
	if "!Money_%Player%:~0,1!" == "-" (
		echo You have not enough money.
		set /a Money_%Player%=!Money_%Player%! + 200
	) ELSE (
		echo ÄÄÄ^> Money decreased from $!Puffer! by $200 to $!Money_%Player%!.
		set ShortLineRailroad=%Player%
	)
	pause
	exit /b
)
if "%Purchase%" == "2" exit /b
goto :ShortLineRailroad
 :ShortLineRailroad_Houses
:ShortLineRailroad_Houses
echo This railroad is yours.
echo.
echo Press [2] to leave it or
echo press [3] to sell it for $100.
set /p Buy_House=
echo.
if "%Buy_House%" == "2" exit /b
if "%Buy_House%" == "3" (
	echo Are you sure you want to sell this railroad? [Y/N]
	set /p Sell_Street=
	if /i "!Sell_Street!" == "n" exit /b
	if /i "!Sell_Street!" == "y" (
		set Puffer=!Money_%Player%!
		set /a Money_%Player%=!Money_%Player%! + 100
		echo ÄÄÄ^> Money increased from $!Puffer! by $100 to $!Money_%Player%!.
		set ShortLineRailroad=
	)
)
goto :ShortLineRailroad_Houses
 :ShortLineRailroad_PayRent
:ShortLineRailroad_PayRent
if "%Player%" == "1" (set Player=2) ELSE (set Player=1)
set Player=!Player!
FOR %%A IN (ReadingRailroad PennsylvaniaRailroad B.O.Railroad ShortLineRailroad) DO if "!%%A!" == "%Player%" set /a RailroadAmount=!RailroadAmount! + 1
if "%Player%" == "1" (set Player=2) ELSE (set Player=1)
set Player=!Player!
echo The other player owns !RailroadAmount! of 4 railroads.
if "!RailroadAmount!" == "1" set PayRent=25
if "!RailroadAmount!" == "2" set PayRent=50
if "!RailroadAmount!" == "3" set PayRent=100
if "!RailroadAmount!" == "4" set PayRent=200
if "!RentalTwice!" == "1" set /a PayRent=%PayRent% * 2
set Puffer=!Money_%Player%!
set /a Money_%Player%=!Money_%Player%! - %PayRent%
echo ÄÄÄ^> Money decreased from $%Puffer% by $%PayRent% to $!Money_%Player%!.
if "!Money_%Player%:~0,1!" == "-" (
	echo.
	pause
	cls
	echo Player %Player% [!Char_%Player%!] is bankrupt.
	echo.
	if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
	echo Player !Player! wins the game.
	echo.
	pause
	exit
)
if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
set Player=!Player!
set Puffer=!Money_%Player%!
set /a Money_%Player%=!Money_%Player%! + %PayRent%
echo ÄÄÄ^> The other player's money increased from $%Puffer% by $%PayRent% to $!Money_%Player%!.
if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
set Player=!Player!
echo.
pause
exit /b




 :ParkPlace
:ParkPlace            38
set Purchase=
set Buy_House=
set PayRent=
set Sell_Street=
if not defined ParkPlace_Houses set ParkPlace_Houses=0
cls
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º                        º
echo º       Park Place       º
echo º                        º
echo º  PRICE $350  RENT $35  º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º With 1 House      $175 º
echo º                        º
echo º With 2 Houses     $500 º
echo º                        º
echo º With 3 Houses    $1100 º
echo º                        º
echo º With 4 Houses    $1300 º
echo º                        º
echo º With HOTEL       $1500 º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º  One house costs $200  º
echo º                        º
echo º   Mortgage value $175  º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º                        º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo.
echo Current player: %Player% (!Char_%Player%!)
echo Total money: !Money_%Player%!
echo.
if "!ParkPlace!" == "%Player%" goto :ParkPlace_Houses
if defined ParkPlace goto :ParkPlace_PayRent
echo Press [1] to buy this street for $350 or
echo press [2] to leave it.
set /p Purchase=
if "%Purchase%" == "1" (
	set Puffer=!Money_%Player%!
	set /a Money_%Player%=!Money_%Player%! - 350
	if "!Money_%Player%:~0,1!" == "-" (
		echo You have not enough money.
		set /a Money_%Player%=!Money_%Player%! + 350
	) ELSE (
		echo ÄÄÄ^> Money decreased from $!Puffer! by $350 to $!Money_%Player%!.
		set ParkPlace=%Player%
	)
	pause
	exit /b
)
if "%Purchase%" == "2" exit /b
goto :ParkPlace
 :ParkPlace_Houses
:ParkPlace_Houses
if "!ParkPlace_Houses!" == "5" (
	echo This street has got a hotel.
	pause
	exit /b
) ELSE (
	echo This street has got !ParkPlace_Houses! houses, yet.
	echo.
)
echo Press [1] to buy a new house or
echo press [2] to leave it or
echo press [3] to sell it for $175.
set /p Buy_House=
echo.
if "%Buy_House%" == "1" (
	set Puffer=!Money_%Player%!
	set /a Money_%Player%=!Money_%Player%! - 200
	if "!Money_%Player%:~0,1!" == "-" (
		echo You have not enough money.
		set /a Money_%Player%=!Money_%Player%! + 200
	) ELSE (
		echo ÄÄÄ^> Money decreased from $!Puffer! by $200 to $!Money_%Player%!.
		set /a ParkPlace_Houses=!ParkPlace_Houses! + 1
		if not "!ParkPlace_Houses!" == "5" (echo This street has got !ParkPlace_Houses! houses now.) ELSE (echo This street has got a hotel now.)
	)
	pause
	exit /b
)
if "%Buy_House%" == "2" exit /b
if "%Buy_House%" == "3" (
	echo Are you sure you want to sell the street? [Y/N]
	set /p Sell_Street=
	if /i "!Sell_Street!" == "n" exit /b
	if /i "!Sell_Street!" == "y" (
		set Puffer=!Money_%Player%!
		set /a Money_%Player%=!Money_%Player%! + 175
		echo ÄÄÄ^> Money increased from $!Puffer! by $175 to $!Money_%Player%!.
		set ParkPlace=
		set ParkPlace_Houses=0
	)
)
goto :ParkPlace_Houses
 :ParkPlace_PayRent
:ParkPlace_PayRent
if "!ParkPlace_Houses!" == "0" set PayRent=35
if "!ParkPlace_Houses!" == "1" set PayRent=175
if "!ParkPlace_Houses!" == "2" set PayRent=500
if "!ParkPlace_Houses!" == "3" set PayRent=1100
if "!ParkPlace_Houses!" == "4" set PayRent=1300
if "!ParkPlace_Houses!" == "5" set PayRent=1500
echo This street is owned by the other player. You have to pay
echo $%PayRent% to pass.
set Puffer=!Money_%Player%!
set /a Money_%Player%=!Money_%Player%! - %PayRent%
echo ÄÄÄ^> Money decreased from $%Puffer% by $%PayRent% to $!Money_%Player%!.
if "!Money_%Player%:~0,1!" == "-" (
	echo.
	pause
	cls
	echo Player %Player% [!Char_%Player%!] is bankrupt.
	echo.
	if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
	echo Player !Player! wins the game.
	echo.
	pause
	exit
)
if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
set Player=!Player!
set Puffer=!Money_%Player%!
set /a Money_%Player%=!Money_%Player%! + %PayRent%
echo ÄÄÄ^> The other player's money increased from $%Puffer% by $%PayRent% to $!Money_%Player%!.
if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
set Player=!Player!
echo.
pause
exit /b




 :LuxuryTax
:LuxuryTax            39
cls
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º        LUXURY          º
echo º                        º
echo º         TAX            º
echo º                        º
echo º          ___           º
echo º      ²²²/***\²²²       º
echo º     ²°°°\***/°°°²      º
echo º    ²°°°°°îîî°°°°°²     º
echo º   ²°°°²²²²²²²²²°°°²    º
echo º  ²°°°²²²     ²²²°°°²   º
echo º  ²°°²²         ²²°°²   º
echo º  ²°°²           ²°°²   º
echo º  ²°°²           ²°°²   º
echo º  ²°°°²         ²°°°²   º
echo º   ²°°°²²²²²²²²²°°°²    º
echo º    ²°°°°°°°°°°°°°²     º
echo º     ²°°°°°°°°°°°²      º
echo º      ²²²²²²²²²²²       º
echo º                        º
echo º  You have to pay $75   º
echo º  for the Luxury Tax.   º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo.
echo Current player: %Player% (!Char_%Player%!)
echo Total money: !Money_%Player%!
echo.
set Puffer=!Money_%Player%!
set /a Money_%Player%=!Money_%Player%! - 75
set /a Money_Parking=!Money_Parking! + 75
echo ÄÄÄ^> Money decreased from $%Puffer% by $75 to $!Money_%Player%!.
echo      ^& $75 went into Free Parking.
if "!Money_%Player%:~0,1!" == "-" (
	echo.
	pause
	cls
	echo Player %Player% [!Char_%Player%!] is bankrupt.
	echo.
	if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
	echo Player !Player! wins the game.
	echo.
	pause
	exit
)
echo.
pause
exit /b




 :Boardwalk
:Boardwalk            40
set Purchase=
set Buy_House=
set PayRent=
set Sell_Street=
if not defined Boardwalk_Houses set Boardwalk_Houses=0
cls
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º                        º
echo º       Boardwalk        º
echo º                        º
echo º  PRICE $400  RENT $50  º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º With 1 House      $200 º
echo º                        º
echo º With 2 Houses     $600 º
echo º                        º
echo º With 3 Houses    $1400 º
echo º                        º
echo º With 4 Houses    $1700 º
echo º                        º
echo º With HOTEL       $2000 º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º  One house costs $200  º
echo º                        º
echo º   Mortgage value $200  º
echo º ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ º
echo º                        º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo.
echo Current player: %Player% (!Char_%Player%!)
echo Total money: !Money_%Player%!
echo.
if "!Boardwalk!" == "%Player%" goto :Boardwalk_Houses
if defined Boardwalk goto :Boardwalk_PayRent
echo Press [1] to buy this street for $400 or
echo press [2] to leave it.
set /p Purchase=
if "%Purchase%" == "1" (
	set Puffer=!Money_%Player%!
	set /a Money_%Player%=!Money_%Player%! - 400
	if "!Money_%Player%:~0,1!" == "-" (
		echo You have not enough money.
		set /a Money_%Player%=!Money_%Player%! + 400
	) ELSE (
		echo ÄÄÄ^> Money decreased from $!Puffer! by $400 to $!Money_%Player%!.
		set Boardwalk=%Player%
	)
	pause
	exit /b
)
if "%Purchase%" == "2" exit /b
goto :Boardwalk
 :Boardwalk_Houses
:Boardwalk_Houses
if "!Boardwalk_Houses!" == "5" (
	echo This street has got a hotel.
	pause
	exit /b
) ELSE (
	echo This street has got !Boardwalk_Houses! houses, yet.
	echo.
)
echo Press [1] to buy a new house or
echo press [2] to leave it or
echo press [3] to sell it for $200.
set /p Buy_House=
echo.
if "%Buy_House%" == "1" (
	set Puffer=!Money_%Player%!
	set /a Money_%Player%=!Money_%Player%! - 200
	if "!Money_%Player%:~0,1!" == "-" (
		echo You have not enough money.
		set /a Money_%Player%=!Money_%Player%! + 200
	) ELSE (
		echo ÄÄÄ^> Money decreased from $!Puffer! by $200 to $!Money_%Player%!.
		set /a Boardwalk_Houses=!Boardwalk_Houses! + 1
		if not "!Boardwalk_Houses!" == "5" (echo This street has got !Boardwalk_Houses! houses now.) ELSE (echo This street has got a hotel now.)
	)
	pause
	exit /b
)
if "%Buy_House%" == "2" exit /b
if "%Buy_House%" == "3" (
	echo Are you sure you want to sell the street? [Y/N]
	set /p Sell_Street=
	if /i "!Sell_Street!" == "n" exit /b
	if /i "!Sell_Street!" == "y" (
		set Puffer=!Money_%Player%!
		set /a Money_%Player%=!Money_%Player%! + 200
		echo ÄÄÄ^> Money increased from $!Puffer! by $200 to $!Money_%Player%!.
		set Boardwalk=
		set Boardwalk_Houses=0
	)
)
goto :Boardwalk_Houses
 :Boardwalk_PayRent
:Boardwalk_PayRent
if "!Boardwalk_Houses!" == "0" set PayRent=50
if "!Boardwalk_Houses!" == "1" set PayRent=200
if "!Boardwalk_Houses!" == "2" set PayRent=600
if "!Boardwalk_Houses!" == "3" set PayRent=1400
if "!Boardwalk_Houses!" == "4" set PayRent=1700
if "!Boardwalk_Houses!" == "5" set PayRent=2000
echo This street is owned by the other player. You have to pay
echo $%PayRent% to pass.
set Puffer=!Money_%Player%!
set /a Money_%Player%=!Money_%Player%! - %PayRent%
echo ÄÄÄ^> Money decreased from $%Puffer% by $%PayRent% to $!Money_%Player%!.
if "!Money_%Player%:~0,1!" == "-" (
	echo.
	pause
	cls
	echo Player %Player% [!Char_%Player%!] is bankrupt.
	echo.
	if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
	echo Player !Player! wins the game.
	echo.
	pause
	exit
)
if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
set Player=!Player!
set Puffer=!Money_%Player%!
set /a Money_%Player%=!Money_%Player%! + %PayRent%
echo ÄÄÄ^> The other player's money increased from $%Puffer% by $%PayRent% to $!Money_%Player%!.
if "!Player!" == "1" (set Player=2) ELSE (set Player=1)
set Player=!Player!
echo.
pause
exit /b



