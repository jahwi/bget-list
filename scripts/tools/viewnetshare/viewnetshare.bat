:: View All Network Shares on a Windows PC

:::
:::		   ·   ·▐ ▄ ▄▄▄ .▄▄▄  ·▄▄▄▄▪  ·  ▪
:::		     · •█▌▐█▀▄.▀·▀▄ █·██▪ ██   .  
:::		   ▪   ▐█▐▐▌▐▀▀▪▄▐▀▀▄ ▐█· ▐█▌   ▪ 
:::		    · ▪██▐█▌▐█▄▄▌▐█•█▌██. ██ .   .
:::		   ▪   ▀▀ █▪ ▀▀▀ .▀  ▀▀▀▀▀▀•  ▪   
:::		   ▄▄▄  ▄▄▄ . ▌ ▐·  .   ▄▄▌ ▐▄▄▄▄▌
:::		   ▀▄ █·▀▄.▀·▪█·█▌▪     ██•  •██  
:::		   ▐▀▀▄ ▐▀▀▪▄▐█▐█• ▄█▀▄ ██▪   ▐█.▪
:::		   ▐█•█▌▐█▄▄▌ ███ ▐█▌.▐▌▐█▌▐▌ ▐█▌·
:::	   	   .▀  ▀ ▀▀▀ . ▀   ▀█▄▀▪.▀▀▀  ▀▀▀ 
:::        (ccc)2020 by {name} @ NerdRevolt
:::
:::    /// ::: /// ::: /// ::: /// ::: /// :::

::::BgetDescription#View network shares on current or remote PCs.
::::BgetAuthor#FreeBooter
::::BgetCategory#tools

@Echo off & Cls

REM  --> Check for permissions
Reg query "HKU\S-1-5-19\Environment" 
REM --> If error flag set, we do not have admin.
if %errorlevel% NEQ 0 (
ECHO                 **************************************
ECHO                  Running Admin shell... Please wait...
ECHO                 **************************************

    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = "%*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B


:gotAdmin


:_Start
Cls & Mode CON  LINES=11 COLS=80 & Color 0E 
Echo.
Echo.       
Echo         1 - View All Network Shares on Current PC    
Echo.       
Echo.
Echo.
Echo.         
Echo         2 - View All Network Shares on a Remote Computer    
Echo.         



Set /p input=:^> 
If /i  Not %input%==1 (Goto :_Ex) Else (Goto :_CurrentPC)

:_Ex
If /i  Not %input%==2  (Goto :_Start) Else (Goto :_RemotePC)






:_CurrentPC

Cls & Mode CON  LINES=40 COLS=90 & Color 0E 
Echo.
Echo.

net share

Pause > Nul

Exit


:_RemotePC

Cls & Mode CON  LINES=40 COLS=90 & Color 0E 
Echo.
Echo.
Echo.
Set /p IP="Input Remote Computer Name or IP Address: "
Cls
net view \\%IP% /All

Pause > Nul

Exit