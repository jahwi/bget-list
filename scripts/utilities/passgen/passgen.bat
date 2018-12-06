::----------------------------------------------------------------------------------------
:: Generates a random password based on provided parameters
::
:: USAGE: passgen.bat [-?][-s <string length>][-a <number between 1 and 4>][-c][--gui]
::
:: Options:
::     -?    Displays usage
::     -s    Specify length of password. Default value is 8.
::     -a    Specify the alphabet complexity. Default value is 3.
::               1 - Lower case letters
::               2 - Lower case letters and Upper case letters
::               3 - Lower case letters, Upper case letters, and Numbers
::               4 - Lower case letters, Upper case letters, Numbers, and Punctuation
::     -c    Copy the password to the clipboard. Disabled by default.
::     --gui Displays the GUI for further customization
::
:: VERSION HISTORY
:: ===============
:: 0.1 (2016-11-20) - Initial Version 
::----------------------------------------------------------------------------------------

::::BgetDescription#Generates passwords that meet a given criteria.
::::BgetAuthor#ShadowThief
::::BgetCategory#utilities

@echo off
setlocal enabledelayedexpansion
set "password="

:: Set contants
set "MIN_LENGTH=1"
set "MAX_LENGTH=73"
set "MIN_COMPLEXITY=1"
set "MAX_COMPLEXITY=4"

:: Displays usage if desired
set "show_help=N"
if /i "%~1"=="-?" set "show_help=Y"
if /i "%~1"=="/?" set "show_help=Y"
if /i "%~1"=="--help" set "show_help=Y"
if "%show_help%"=="Y" goto :Usage

:: Parse arguments. If none are provided, ask for them.
:: Based on http://stackoverflow.com/a/27497837/4158862
set "switches=s a"
set "no_args=c -gui"
set "other_parameters="

for %%A in (%switches% %no_args%) do set "%%A="

:switchLoop
if "%~1"=="" goto processComplete

for %%A in (%no_args%) do (
	if /i "-%%A"=="%~1" (
		set "%%A=Y"
		shift
		goto :switchLoop
	)
)
for %%A in (%switches%) do (
	if /i "-%%A"=="%~1" (
		set "%%A=%~2"
		call :validate_number %~2
		if "!errorlevel!"=="1" goto :Usage
		shift
		shift
		goto :switchLoop
	)
)
set "other_parameters=%other_parameters% %~1"
shift
goto :switchLoop

:processComplete
if defined s (
	if !s! lss %MIN_LENGTH% echo(ERROR: Minimum password length is %MIN_LENGTH%.&exit /b
	if !s! gtr %MAX_LENGTH% echo(ERROR: Maximum password length is %MAX_LENGTH%.&exit /b
	set "pass_length=!s!"
) else (
	set "pass_length=8"
)
if defined c (set "copy_pass=Y") else (set "copy_pass=N")
if defined a (
	if !a! lss %MIN_COMPLEXITY% echo(Minimum alphabet complexity is %MIN_COMPLEXITY%.&exit /b
	if !a! gtr %MAX_COMPLEXITY% echo(Maximum alphabet complexity is %MAX_COMPLEXITY%.&exit /b
	if "!a!"=="1" (
		set "alphabet=abcdefghijklmnopqrstuvwxyz"
		set "alphabet_length=26"
	)
	if "!a!"=="2" (
		set "alphabet=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
		set "alphabet_length=52"
	)
	if "!a!"=="3" (
		set "alphabet=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"
		set "alphabet_length=62"
	)
	if "!a!"=="4" (
		set "alphabet=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890@#$'()*+,-./:;=?`{}~[]"
		set "alphabet_length=84"
	)
) else (
	set "alphabet=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"
	set "alphabet_length=62"
	set "a=3"
)

:: If GUI Mode is activated, show the GUI; otherwise, generate a random password
if defined -gui (
	call :showGUI
) else (
	call :generatePassword
	echo(!password!
	
	if "!copy_pass!"=="Y" set /p "=!password!"<nul|clip
)
exit /b

::------------------------------------------------------------------------------
:: Provides a GUI to specify options
::
:: Arguments: pass_length - the initial size of the password
::            alphabet    - the pool of characters used for creating the password
::            copy_pass   - Y if the password should be copied to the clipboard
:: Returns:   Updated values of the above parameters
::------------------------------------------------------------------------------
:showGUI
mode con cols=80 lines=23
cls

:: Set up GUI array for alphabet
if defined a (
	for /L %%A in (1,1,4) do (
		set "alphabet[%%A]= "
		if !a! geq %%A set "alphabet[%%A]=X"
	)
	set "a="
)

:: Right-pad the password size with spaces for aesthetic reasons
set "raw_display_size=!pass_length!                                                      "
set "display_size=!raw_display_size:~0,55!"

:: Right-pad the password with spaces for aesthetic reasons
if not "!password!"=="" (
	set "raw_display_password=!password!                                                                         "
	set "display_password=!raw_display_password:~0,73!"
) else (
	set "display_password=                                                                         "
)

echo(===============================================================================
echo(^|^|                                  PASSGEN                                  ^|^|
echo(===============================================================================
echo(^|^|                                                                           ^|^|
echo(^|^|  1. Password Size: !display_size!^|^|
echo(^|^|  2. [!alphabet[1]!] Use lower case letters                                            ^|^|
echo(^|^|  3. [!alphabet[2]!] Use upper case letters                                            ^|^|
echo(^|^|  4. [!alphabet[3]!] Use numbers                                                       ^|^|
echo(^|^|  5. [!alphabet[4]!] Use punctuation                                                   ^|^|
echo(^|^|  6. Copy to clipboard: !copy_pass!                                                  ^|^|
echo(^|^|                                                                           ^|^|
echo(^|=============================================================================^|
echo(^|^| !display_password! ^|^|
echo(===============================================================================
choice /C:123456gq /n /m "Use the numbers 1-6 to set variables, G to generate a password, or Q to quit:"

if %errorlevel% equ 1 call :setPasswordSize
if %errorlevel% equ 2 call :toggleAlphabet 1
if %errorlevel% equ 3 call :toggleAlphabet 2
if %errorlevel% equ 4 call :toggleAlphabet 3
if %errorlevel% equ 5 call :toggleAlphabet 4
if %errorlevel% equ 6 if "!copy_pass!"=="Y" (set "copy_pass=N") else (set "copy_pass=Y")
if %errorlevel% equ 7 (
	call :setAlphabet
	call :generatePassword
)
if %errorlevel% equ 8 (
	if "!copy_pass!"=="Y" set /p "=!password!"<nul|clip
	exit /b
)
goto :showGUI

::------------------------------------------------------------------------------
:: Generates the password based on length and alphabet
::
:: Arguments: None
:: Returns:   None
::------------------------------------------------------------------------------
:generatePassword
set "password="
if !alphabet_length! gtr 0 (
	for /L %%A in (1,1,!pass_length!) do (
		set /a alphabet_index=!random!%%!alphabet_length!
		for /f %%B in ("!alphabet_index!") do (
			set "password=!password!!alphabet:~%%B,1!
		)
	)
)
goto :eof

::------------------------------------------------------------------------------
:: Generates the alphabet and alphabet length based on which options are
:: toggled in the GUI
::
:: Arguments: None
:: Returns:   The alphabet to use when randomly generating the password
::            The length of the above alphabet
::------------------------------------------------------------------------------
:setAlphabet
:: Reset variables
set "alphabet="
set "alphabet_length=0"

:: Append and add based on inputs
if "!alphabet[1]!"=="X" (
	set "alphabet=!alphabet!abcdefghijklmnopqrstuvwxyz"
	set /a alphabet_length+=26
)
if "!alphabet[2]!"=="X" (
	set "alphabet=!alphabet!ABCDEFGHIJKLMNOPQRSTUVWXYZ"
	set /a alphabet_length+=26
)
if "!alphabet[3]!"=="X" (
	set "alphabet=!alphabet!1234567890"
	set /a alphabet_length+=10
)
if "!alphabet[4]!"=="X" (
	set "alphabet=!alphabet!@#$'()*+,-./:;=?`{}~[]"
	set /a alphabet_length+=22
)
goto :eof

::------------------------------------------------------------------------------
:: Toggles the state of the alphabet array
::
:: Arguments: Which array element to toggle
:: Returns:   None
::------------------------------------------------------------------------------
:toggleAlphabet
if "!alphabet[%1]!"=="X" (set "alphabet[%1]= ") else (set "alphabet[%1]=X")
goto :eof

::------------------------------------------------------------------------------
:: Sets the size of the password to a number between 1 and 73.
:: The maximum of 73 is purely for aesthetics, and can hypothetically go as
:: high as 8192 (the maximum size of a variable in batch).
::
:: Arguments: None
:: Returns:   The new length of the password
::------------------------------------------------------------------------------
:setPasswordSize
set /p "input_size=New password size: "

:: Validate input
call :validate_number !input_size!
if !errorlevel! equ 1 (echo(ERROR: Input must be a number.&goto :setSize)
if !input_size! lss %MIN_LENGTH% (echo(ERROR: Minimum password length is %MIN_LENGTH%.&goto :setSize)
if !input_size! gtr %Max_LENGTH% (echo(ERROR: Maximum password length is %MAX_LENGTH%.&goto :setSize)

set "pass_length=!input_size!"
goto :eof

::------------------------------------------------------------------------------
:: Validates if user input is numeric
::
:: Arguments: raw_input  - the input provided by the user
:: Returns:   None
::------------------------------------------------------------------------------
:validate_number
set raw_input=%~1
for /f "delims=1234567890" %%A in ("%raw_input%") do set processed_input=%%A
if not "!processed_input!"=="" exit /b 1
exit /b 0

::------------------------------------------------------------------------------
:: Displays proper usage for the script
:: NOTE: This is not a function; use GOTO instead of CALL
::------------------------------------------------------------------------------
:Usage
echo(USAGE: passgen.bat [-?][-s ^<string length^>][-a ^<1^|2^|3^|4^>][-c][--gui]
echo(
echo(Options:
echo(    -?    Displays usage
echo(    -s    Specify length of password. Default value is 8.
echo(    -a    Specify the alphabet complexity. Default value is 3.
echo(          1 - Lower case letters
echo(          2 - Lower case letters and Upper case letters
echo(          3 - Lower case letters, Upper case letters, and Numbers
echo(          4 - Lower case letters, Upper case letters, Numbers, and Punctuation
echo(    -c    Copy the password to the clipboard. Disabled by default.
echo(
echo(    --gui Displays the GUI for further customization
exit /b