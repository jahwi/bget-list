:: Defer Feature Updates in Windows 10 Version 2004
::::BgetDescription#Defer Feature Updates in Windows 10 Version 2004
::::BgetAuthor#FreeBooter
::::BgetCategory#tools

@Echo Off & Cls 


(Net session >nul 2>&1)||(PowerShell start """%~0""" -verb RunAs & Exit /B)



:Choice

Cls & Mode CON  LINES=11 COLS=80 & Color 0E & Title Created By FreeBooter
Echo.
Echo.
Echo.
Echo         How Long Do You Want To Defer Feature Updates For (0 - 365 days).  
Echo.       
Echo.        
Echo.


Set /p input= Input Days: 

If  %input% GTR 365  (Goto :Choice) Else (Goto :_Defer)



:_Defer


Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "DeferFeatureUpdates" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "BranchReadinessLevel" /t REG_DWORD /d "16" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "DeferFeatureUpdatesPeriodInDays" /t REG_DWORD /d %input% /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "PauseFeatureUpdatesStartTime" /t REG_SZ /d "" /f



Cls & Mode CON  LINES=11 COLS=55 & Color 0E & Title Created By FreeBooter
Echo.
Echo.
Echo.
Echo.
Echo         Defering Feature Updates For %input% Days
Echo.
Echo.
Echo. 
Ping -n 5 localhost >Nul

Exit







