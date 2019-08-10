:: Add 'Run with priority' to the context menu of .exe files to change the process priority of applications for processor resources in Windows 10.

::::BgetDescription#[Win 10] Add 'Run with priority' to the context menu of .exe files to change the process priority of applications for processor resources in Windows 10.
::::BgetAuthor#FreeBooter
::::BgetCategory#utilities

@Echo Off
Cls & Color 1A

Cd %systemroot%\system32

net sess>nul 2>&1||(start mshta vbscript:code(close(Execute("CreateObject(""Shell.Application"").ShellExecute""%~0"",,,""RunAs"",1"^)^)^)&exit)

Cls & Mode CON  LINES=11 COLS=60 & Color 0D & Title Created By FreeBooter
Echo.
Echo.
Echo.
Echo.
Echo          Add "Run with priority" to Context Menu (Y/N)?   
Echo.       
Echo.
Echo.


Set /p input= RESPONSE: 

If /i  Not %input%==Y (Goto :_Ex) Else (Goto :_Start) 

:_Ex
If /i Not %input%==N  (Goto :EOF) Else (Goto :_RegRestore)



:_Start

Reg.exe add "HKCR\exefile\shell\Priority" /v "MUIVerb" /t REG_SZ /d "Run with priority" /f  >Nul
Reg.exe add "HKCR\exefile\shell\Priority" /v "SubCommands" /t REG_SZ /d "" /f  >Nul
Reg.exe add "HKCR\exefile\Shell\Priority\shell\001flyout" /ve /t REG_SZ /d "Realtime" /f  >Nul
Reg.exe add "HKCR\exefile\Shell\Priority\shell\001flyout\command" /ve /t REG_SZ /d "cmd.exe /c start \"\" /Realtime \"%%1\"" /f  >Nul
Reg.exe add "HKCR\exefile\Shell\Priority\shell\002flyout" /ve /t REG_SZ /d "High" /f  >Nul
Reg.exe add "HKCR\exefile\Shell\Priority\shell\002flyout\command" /ve /t REG_SZ /d "cmd.exe /c start \"\" /High \"%%1\"" /f  >Nul
Reg.exe add "HKCR\exefile\Shell\Priority\shell\003flyout" /ve /t REG_SZ /d "Above normal" /f  >Nul
Reg.exe add "HKCR\exefile\Shell\Priority\shell\003flyout\command" /ve /t REG_SZ /d "cmd.exe /c start \"\" /AboveNormal \"%%1\"" /f  >Nul
Reg.exe add "HKCR\exefile\Shell\Priority\shell\004flyout" /ve /t REG_SZ /d "Normal" /f  >Nul
Reg.exe add "HKCR\exefile\Shell\Priority\shell\004flyout\command" /ve /t REG_SZ /d "cmd.exe /c start \"\" /Normal \"%%1\"" /f  >Nul
Reg.exe add "HKCR\exefile\Shell\Priority\shell\005flyout" /ve /t REG_SZ /d "Below normal" /f  >Nul
Reg.exe add "HKCR\exefile\Shell\Priority\shell\005flyout\command" /ve /t REG_SZ /d "cmd.exe /c start \"\" /BelowNormal \"%%1\"" /f  >Nul
Reg.exe add "HKCR\exefile\Shell\Priority\shell\006flyout" /ve /t REG_SZ /d "Low" /f  >Nul
Reg.exe add "HKCR\exefile\Shell\Priority\shell\006flyout\command" /ve /t REG_SZ /d "cmd.exe /c start \"\" /Low \"%%1\"" /f  >Nul


Cls & Mode CON  LINES=11 COLS=60 & Color 0D & Title Created By FreeBooter
Echo.
Echo.
Echo.
Echo.
Echo            Adding "Run with priority" to Context Menu
Echo.
Echo.
Echo. 
Ping -n 6 localhost >Nul
Exit


:_RegRestore

Reg.exe delete "HKCR\exefile\shell\Priority" /f >Nul



Cls & Mode CON  LINES=11 COLS=60 & Color 0D & Title Created By FreeBooter
Echo.
Echo.
Echo.
Echo.
Echo        Removing "Run with priority" from Context Menu  
Echo.
Echo.
Echo. 
Ping -n 6 localhost >Nul
Exit
