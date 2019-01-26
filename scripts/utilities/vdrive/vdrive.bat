@Echo Off
@Title Virtual Drive v 3 Revolution - SmartGenius, Corp. 2012
Setlocal Enabledelayedexpansion

::::BgetDescription#Create edit and remove virtual drives.
::::BgetAuthor#SmartGenius
::::BgetCategory#utilities


:Init
Call :GetSID
Call :GetWorkPath
Call :Config

:Main
Cls
Echo.
Echo. 1. Open Drive
Echo. 2. Close Drive
Echo. 3. Create Drive
Echo. 4. Delete Drive
Echo. 5. Show Info
Echo. 6. Get help
Echo. 7. Exit
Echo.
Set /p "User= Choice an option from the list > "
If Not Defined User Goto :Main
If "1"=="%User%" (
Call :Select
Call :OpenDrive "!Opc!")
If "2"=="%User%" (
Call :Select
Call :CloseDrive "!Opc!")
If "3"=="%User%" (Call :CreateDrive)
If "4"=="%User%" (
Call :Select
Call :DeleteDrive "!Opc!")
If "5"=="%User%" (Goto :ShowOpc)
If "6"=="%User%" (Goto :GetHelp)
If "7"=="%User%" (Echo. Thanks for using this software&Pause&Exit)
If "8"=="%User%" (Goto :QuitVD)
Goto :Main

:ShowOpc
Cls
Echo.
Echo. Virtual Drive v 3 Info
Echo.
Echo. User    = %Username%
Echo. SID     = %SID%
Echo. Path    = %WorkPath%
Echo. Version = %Version%
Echo. Drives  = %NumDrives%
Echo.
Pause
Goto :Main

:GetHelp
Cls
Echo. Virtual Drive v 3 Revolution
Echo.
Echo. Simple Batch Soft to Manage Virtual Drives
Echo.
Echo. Open, Close, Create or Delete Virtual Drives
Echo. with the option to use Password on New Drive
Echo. created.
Echo.
Echo. For More Help, Go to the Forums
Echo.
Echo. http://www.redinfocol.org
Echo. http://twitter.com/thesmartgenius
Echo.
Echo.    SmartGenius, Corp. 2012
Echo.
Pause
Goto :Main

::::::::::::::::: Drive functions :::::::::::::::::::::::::::::::::::::::::::::::

:ListDrives
Echo. Avaliable Drives
For /l %%n in (1,1,%NumDrives%) do (
Call :GetDriveProps "%%n"
Echo. %%n - Drive #%%n [!Drive%%n_Alias!])
Echo.
Goto :Eof

:OpenDrive
Call :GetDriveProps "%~1"
If Not "Null"=="!Drive%~1_Key!" (
Echo. The Drive "!Drive%~1_Alias!" is protected.
Call :GetPass "!Drive%~1_Alias!" "%~1")
Call :Unlock "%~1"
Start "" !Drive%~1_Letter!
Ping -n 2 localhost >nul
Goto :Eof

:CloseDrive
Echo. Closing "!Drive%~1_Alias!"
For /f "tokens=1 delims=\" %%S in ('Subst^|Find "Drive%~1"') do (
Subst /D %%S
Cacls "%WorkPath%\VD\Drive%~1" /e /d Todos>nul 2>&1
)
Ping -n 2 localhost >nul
Goto :Eof

:CreateDrive
Cls
Echo.
Set /a "nDrive=%NumDrives%+1"
Echo. Creating New Virtual Drive
Set /p "nAlias= Enter an Alias for the Drive > "
If Not Defined nAlias Set "nAlias=VD_%nDrive%"
Set /p "nKey= Enter a Password Key for the Drive > "
If Not Defined nKey Set "nKey=Null"
If Not "Null"=="%nKey%" (Set "mKey=%nKey%"&Call :Key mKey) else (Set "mKey=Null")
Echo. New Virtual Drive #%nDrive% will be created
Echo. Drive #%nDrive% "Alias=%nAlias%" - "Password=%nKey%"
Echo.
MD "%WorkPath%\VD\Drive%nDrive%" >nul 2>&1
For %%a in ("Alias=%nAlias%","Key=%mKey%") do (Echo.%%~a>>"%WorkPath%\VD\Drive%nDrive%\Properties.vdf")
Attrib +h "%WorkPath%\VD\Drive%nDrive%\Properties.vdf">nul 2>&1
Set /a "NumDrives=%NumDrives%+1"
Reg Add "%R_Key%" /v NumDrives /d %NumDrives% /f >nul 2>&1
Pause
Goto :Eof

:DeleteDrive
Cls
Echo.
Echo. You will delete Drive #~1 [!Drive%~1_Alias!]
Echo. This will delete all files and folder in it
Echo.
Set /p "YNDel= Are you sure ? [Y] Yes - [N] No >
If Not Defined YNDel Goto :Main
If /i Not "Y"=="%YNDel%" (Goto :Main)
Echo. Deleting Drive #%~1 [!Drive%~1_Alias!]
Cacls "%WorkPath%\VD\Drive%~1" /e /p Todos:f>nul 2>&1
RD /s /q "%WorkPath%\VD\Drive%~1">nul 2>&1
Set /a "NumDrives=%NumDrives%-1"
Reg Add "%R_Key%" /v NumDrives /d %NumDrives% /f >nul 2>&1
Pause
Goto :Main

:GetDriveProps
Cacls "%WorkPath%\VD\Drive%~1" /e /p Todos:f>nul 2>&1
For %%P in (Alias,Key) do (
For /f "tokens=2 delims==" %%R in ('Type "%WorkPath%\VD\Drive%~1\Properties.vdf"^|Find "%%P"') do (
Set "Drive%~1_%%P=%%R"
))
Cacls "%WorkPath%\VD\Drive%~1" /e /d Todos>nul 2>&1
Goto :Eof

:Unlock
Echo. Unlocking Drive%~1
Cacls "%WorkPath%\VD\Drive%~1" /e /p Todos:f>nul 2>&1
For %%D in (Z,Y,X,W,V,U,T,S,R,Q,P,O,N,M,L,K,J,I,H,G) do (If Not Exist "%%D:" (Set "FreeDrive=%%D:"))
Subst "%FreeDrive%" "%WorkPath%\VD\Drive%~1"
Set "Drive%~1_Letter=%FreeDrive%"
Goto :Eof
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::: User interaction :::::::::::::::::::::::::::::::::::::::::::::::
:GetPass
Set "Pass="
Set /p "Pass=  Enter Password for "%~1" Drive > "
If Not Defined Pass Goto :GetPass
Call :Key Pass
If Not "!Drive%~2_Key!"=="%Pass%" (
Echo. Bad Password.
Pause
Goto :Main)
Goto :Eof

:Select
Cls
Echo.
Call :ListDrives
Set /p "Opc= Choice an option from the list > "
If Not Defined Opc Goto :Select
Set /a "Max=%NumDrives%+1"
If %Opc% GEQ %Max% Goto :Main
Goto :Eof
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::Main Program Functions::::::::::::::::::

:GetSID
For /f "tokens=*" %%s in ('Dir "%appdata%\Microsoft\Credentials" /b /a:d') do (Set "SID=%%s")
If Not [""]==["%SID%"] (Set "SID=%SID%") else (
For /f "tokens=5 delims=\" %%a in ('Reg Query "HKCU\Software\Microsoft\Protected Storage System Provider"') do (Set "SID=%%a")
If Not [""]==["!SID!"] (Set "SID=!SID!") else (
Set "SID=Null"))
Goto :Eof

:GetWorkPath
For %%W in (RECYCLER $Recycle.Bin) do (
If Exist "%SystemDrive%\%%W\%SID%" (Set "WorkPath=%SystemDrive%\%%W\%SID%"))
Goto :Eof

:Config
Set "R_Key=HKCU\Software\SmartGenius\VirtualDrive"
Reg Query "%R_Key%" /v Version >nul 2>&1
If "%Errorlevel%"=="1" (Call :Install)
Call :ReadReg
Goto :Eof

:Install
Echo. Instalando VirtualDrive v 3
For %%a in (
"/v Version /d 3"
"/v NumDrives /d 1"
) do (Reg Add "%R_Key%" %%~a /f >nul 2>&1)
MD "%WorkPath%\VD" >nul 2>&1
MD "%WorkPath%\VD\Drive1" >nul 2>&1
For %%a in ("Alias=Default","Key=Null") do (Echo.%%~a>>"%WorkPath%\VD\Drive1\Properties.vdf")
Goto :Eof

:ReadReg
For %%a in (Version,NumDrives) do (
For /f "tokens=3" %%b in ('Reg Query "%R_Key%" /v %%a') do (Set "%%a=%%b"))
For /l %%n in (1,1,%NumDrives%) do (Set "Path_Drive%%n=%WorkPath%\VD\Drive%%n")
Goto :Eof

:QuitVD
Cacls "%WorkPath%\VD" /T /e /p Todos:f>nul 2>&1
RD /s /q "%WorkPath%\VD" >nul 2>&1
Reg Delete "%R_Key%" /f
Echo. Virtual Drive Deleted
Pause
Exit

:Key
If not defined %1 Goto :Eof
Set "cf="
Set "d=0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz =/\()[]{}_-.:,;* @#"
:Key.b
Set "c=!%1:~,1!"
For /l %%l in (0 1 80) do if "!c!" equ "!d:~%%l,1!" (
  set /a "x=%%l^5"
  call set "cf=!cf!%%d:~!x!,1%%"
)
Set "%1=!%1:~1!"
If defined %1 Goto :Key.b
Set "%1=!cf!"
Goto :Eof