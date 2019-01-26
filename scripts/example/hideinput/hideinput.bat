::!CARLOS_HIDE_INPUT.BAT
::Code by Carlos on AMBNT 2013-03-10
::Subject: Getkey without Display the input.
::Thread started by jeb
::Note: My edits/additions are not indented 3 spaces

::::BgetDescription#Hide input in asterisks.
::::BgetAuthor#Carlos
::::BgetCategory#example
::::Bgettags#password;mask
   :::::::::::::BEGIN OF CODE:::::::::::::   
   @Echo Off   
   :HInput
   ::Version 3.0      
   SetLocal DisableDelayedExpansion
Echo Enter your password below:
   Set "Line="
   Rem Save 0x08 character in BS variable
   For /F %%# In (
   '"Prompt;$H&For %%# in (1) Do Rem"'
   ) Do Set "BS=%%#"
   
   :HILoop
   Set "Key="
   For /F "delims=" %%# In (
   'Xcopy /W "%~f0" "%~f0" 2^>Nul'
   ) Do If Not Defined Key Set "Key=%%#"
   Set "Key=%Key:~-1%"
   SetLocal EnableDelayedExpansion
   If Not Defined Key Goto :HIEnd 
   If %BS%==^%Key% (Set /P "=%BS% %BS%" <Nul
   Set "Key="
   If Defined Line Set "Line=!Line:~0,-1!"
   ) Else Set /P "=*" <Nul
   If Not Defined Line (EndLocal &Set "Line=%Key%"
   ) Else For /F delims^=^ eol^= %%# In (
   "!Line!") Do EndLocal &Set "Line=%%#%Key%" 
   Goto :HILoop
   
   :HIEnd
   Echo(
Echo Your password is '!Line!'
   Pause
   Goto :Eof
   
   ::::::::::::::END OF CODE::::::::::::::