<!-- :Begin Batch
:::
:::Name: XORCrypt.bat
:::
:::This Batch-WSF Hybrid "experiment" encrypts and decrypts the Base64
:::encoding of a file using a simple "XOR" cipher with a random
:::64 bit key produced.
:::
:::NOTE:
:::   This code automatically overwrites content to the output file.
:::
:::Usage: Call XORCrypt.bat [/D] [/E] [File]
::===================== History =====================
::   *Version: 2.1 - BUGFIX: Always get real full path, even if file name
::                   contains spaces, and called in CMD with quotes.
::   *Version: 2.0 - Moved key input in VBScript, so that quotes will
::                   also be parsed in regex.
::   *Version: 1.0 - Initial release.
::===================================================
@echo off
setlocal disabledelayedexpansion

::::BgetDescription#XOR encryption example.
::::BgetAuthor#Meerkat
::::BgetCategory#example

rem Workaround - Always get full path...
call :getFull

rem Validate options
if /i "%~1"=="/D" (
   set "task=DEC"
) else if /i "%~1"=="/E" (
   set "task=ENC"
) else (
   for /f "tokens=* delims=:" %%A in ('findstr /b ":::" "%thisFile%"') do echo:%%A
   exit /b
)

rem Check if the file exists
if not exist "%~f2" (
   echo:File not found.
   exit /b
)

rem Set important variables for temp files
set "key="
set "rnd_name=%random%%random%"
set "inp_file=%TMP%\%rnd_name%.tmp"
set "out_file=%TMP%\%rnd_name%_.tmp"
del "%inp_file%" "%out_file%" 2>nul

if "%task%"=="ENC" (
   echo:[XORCrypt.bat XOR Encryption]
   echo:
   rem Generate key now.
   echo:Generating a random 64-bit key...
   call :keygen
) else (
   echo:[XORCrypt.bat XOR Decryption]
   echo:
   echo:Encryption Key required...

   rem Get and validate input key
   for /f "delims=" %%? in ('cscript //nologo //job:"validate" "%thisFile%?.wsf"') do (
      if "%%?"=="Invalid" (
         echo:Invalid key! Must be a base64 encoded key with 64 characters.
         exit /b
      ) else (set "key=%%?")
   )
)

echo:Convert input to base64 encoding...
certutil -encode "%~f2" "%inp_file%" >nul || (
   echo:Error in encoding file input.
   exit /b
)

if "%task%"=="ENC" (echo:Encrypting...) else (echo:Decrypting...)
(
   echo:-----BEGIN CERTIFICATE-----
   cscript //nologo //job:"execute" "%thisFile%?.wsf" "%inp_file%" "%key%"
   echo:-----END CERTIFICATE-----
)>"%out_file%"

rem Delete temp files.
del "%inp_file%" "%~dpn2_%~x2" 2>nul

echo:Decoding base64 file back to binary...
certutil -decode "%out_file%" "%~dpn2_%~x2" >nul
del "%out_file%" 2>nul

echo:DONE!
exit /b

rem Generate a 64 bit random key.
:keygen
setlocal enabledelayedexpansion
set "alpha=ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
for /l %%. in (1,1,64) do (
   set /a "rnd_num=!random!%%64"
   for /f "delims=" %%? in ("!rnd_num!") do set "key=!key!!alpha:~%%?,1!"
)
echo:KEY: %key%
endlocal & set "key=%key%"
goto :EOF

rem Always get full path...
rem To get what I mean, check this link:
rem http://www.dostips.com/forum/viewtopic.php?f=3&t=6919
:getFull
set "thisFile=%~f0"
goto :EOF

---- :End Batch ----->

<package>
<job id="execute"><script language="vbscript">
Dim alpha,cipher,inputfile,key,a,b,c
   alpha = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
   inputfile = WScript.Arguments(0)
   key = WScript.Arguments(1)

   Set fso = CreateObject("Scripting.FileSystemObject")
   Set openFile = fso.OpenTextFile(inputfile,1)
   inputLine=Split(openFile.ReadAll,vbCrLf)

   For x = 1 to UBound(inputLine) - 2
      input = inputLine(x)
      For i=1 to Len(input)
         a = Instr(alpha,Mid(input,i,1))
         b = Instr(alpha,Mid(key,i,1))
         If Mid(input,i,1) = "=" Then
            cipher = cipher & "="
         Else
            c = ((a-1) XOR (b-1)) +1
            cipher = cipher & Mid(alpha,c,1)
         End If
      Next
   Next
WScript.Echo cipher
</script></job>

<job id="validate"><script language="vbscript">
Dim key:key = WScript.StdIn.ReadLine()
Set re = new regExp
re.pattern = "^[A-Za-z0-9+/]+$"
If re.test(key) = False Or len(key) <> 64 Then
   WScript.Echo "Invalid"
Else
   WScript.Echo key
End If
</script></job>
</package>