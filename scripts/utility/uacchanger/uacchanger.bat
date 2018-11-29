::::BgetDescription#Changes the current user account name and password.  Runs invisible so do not launch more than once.
::::BgetAuthor#b00st3d
::::BgetCategory#utility
@echo off
if exist %temp%\ChangeUNJunkFile.txt del %temp%\ChangeUNJunkFile.txt 2>nul&goto bypass
at >nul
if %errorlevel% == 0 goto elevated

REM build vbs to invoke UAC 
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute %0, "1", "", "runas", 1 >> "%temp%\getadmin.vbs"
   
ECHO **************************************
ECHO Requesting Admin Privileges...
ECHO **************************************

"%temp%\getadmin.vbs" >nul
exit

:elevated
    del "%temp%\getadmin.vbs" 2>nul     
    CD "%temp%"
echo junk >ChangeUNJunkFile.txt
cls
echo *************************************************************************
echo * This will allow you to change your current username and password.     *
echo * Nothing will be done until after your new password is set.            *
echo * This can run a little slow.  Please do not relaunch                   *
echo *                                                                       *
echo * DO NOT RUN THIS UNLESS YOU INTEND TO CHANGE YOUR USERNAME.            *
echo *************************************************************************
echo.
pause
cls
echo CreateObject^("Wscript.Shell"^).Run """" ^& WScript.Arguments^(0^) ^& """" , 0, False > invisible.vbs
timeout 1 >nul
wscript.exe invisible.vbs %0
del invisible.vbs
exit
:bypass
set Input=
set output=
call :buildPWChange

::Change Username
<nul set /p .=Username: 
call :InputBox "Your current username is %username%.  What would you like to change it to?" "Change Username"
    if "%Input%"=="" exit
    set Input=%Input: =_%
echo wscript.quit msgbox ^("Current Username: %username%" ^& vbcrlf ^& "New username: %Input%" ^&vbcrlf ^& "Press ok to continue or cancel to enter a new username", 1, "Change Username"^) > output.vbs
wscript.exe //nologo "output.vbs"
If %errorlevel%==2 exit
echo %Input%
echo.&<nul set /p .=Password: 

echo. >output.txt
timeout 1 >nul
call pw.hta
for /f %%a in (output.txt) do set pw=%%a
if "%pw%"=="" set pw=""
echo Set
del output.txt 2>nul
echo.

call :createUser %input% %pw%

echo wscript.quit msgbox ^("Would you like to restart now?",4,"username changed to %input%"^) > output.vbs
wscript.exe //nologo output.vbs
If %errorlevel%==7 net user "%username%" /delete&exit
net user "%username%" /delete
del output.vbs 2>nul
shutdown -r -t 0
exit 

:buildPWChange
(
echo ^<html^>
echo ^<head^>
echo ^<title^>PW Entry^</title^>
echo ^<hta:application
echo scroll="no"
echo /^>
echo ^<script language="VBScript"^>
echo Sub Window_onLoad
echo window.resizeTo 300,175
echo End Sub
echo ^</script^>
echo ^<script type="text/javascript"^>
echo function noSpace^(PW^) {
echo return PW.indexOf^(' '^);}
echo function checkPW^(^) {
echo var pass=myForm.PW.value;
echo if ^(^(myForm.PW.value!=myForm.CPW.value^) ^|^| ^(noSpace^(pass^) !=-1^)^){
echo myForm.reset^(^);
echo alert^("Password Mismatch or Space in Password"^);
echo } else {
echo writeFile^(^);
echo }}
echo function writeFile^(^){
echo var fso = new ActiveXObject^("Scripting.FileSystemObject"^);
echo var fh = fso.CreateTextFile^("c:\output.txt", true^);
echo fh.WriteLine^(myForm.PW.value^);
echo fh.Close^(^);
echo window.close^(^);
echo }
echo ^</script^>
echo ^</head^>
echo ^<body^>
echo ^<form name="myForm"^>
echo ^<div id="pw"^>^<p^>Password:    ^<input name="PW" type="password"^>^</p^>^</div^>
echo ^<div id="confirm"^>^<p^>Confirm:^&nbsp;^&nbsp;^&nbsp;^&nbsp;^<input name="CPW" type="password"^>^</p^>^</div^>
echo ^<p^>^<input type="button" value="Continue" onClick="checkPW()"^>^</p^>
echo ^</form^>
echo ^</body^>
echo ^</html^>
) >pw.hta
exit /b

:InputBox
set input=
set heading=%~2
set message=%~1
echo wscript.echo inputbox(WScript.Arguments(0),WScript.Arguments(1)) >input.vbs
for /f "tokens=* delims=" %%a in ('cscript //nologo "input.vbs" "%message%" "%heading%"') do set input=%%a
del input.vbs
exit /b

:createUser 
set newUser=%1
set pass=%2
net user "%newUser%" %pass% /add >nul&net localgroup administrators "%newUser%" /add >nul&echo %input% added to administrators group
schtasks /create /SC ONLOGON /tn "newUser" /RU "%computername%\%input%" /RL HIGHEST /TR c:\newUser.bat >nul
(
echo xcopy /E /Y c:\users\%username% c:\users\%input%
echo schtasks /delete /tn "newUser" /f
echo del %%0
) >c:\newUser.bat
exit /b