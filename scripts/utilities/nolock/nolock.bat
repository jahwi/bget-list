:: Enable or Disable Lock Screen in Windows 10
::::BgetDescription#Enable or disable lock screen in windows 10.
::::BgetAuthor#freebooter
::::BgetCategory#utilities
@Echo Off


net sess>nul 2>&1||(powershell start cmd -ArgumentList """/c %~0""" -verb Runas & exit)

:_Start
Cls & Mode CON  LINES=11 COLS=70 & Color 0E 
Echo.
Echo.       
Echo         Type (D) letter to Disable the Lock Screen   
Echo.       
Echo.
Echo.
Echo.         
Echo         Type (E) letter to Enable the Lock Screen   
Echo.         



Set /p input= RESPONSE: 
If /i  Not %input%==D (Goto :_Ex) Else (Goto :_Disable)

:_Ex
If /i  Not %input%==E  (Goto :_Start) Else (Goto :_Enable)





:_Disable

Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Authentication\LogonUI\SessionData" /v "AllowLockScreen" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Personalization" /v "NoLockScreen" /t REG_DWORD /d "1" /f

Exit



:_Enable

Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Authentication\LogonUI\SessionData" /v "AllowLockScreen" /t REG_DWORD /d "1" /f
Reg.exe delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\Personalization" /v "NoLockScreen" /f