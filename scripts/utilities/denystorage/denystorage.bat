@Echo Off & Cls
::::BgetDescription#Deny access to all removable storage on a computer.
::::BgetAuthor#FreeBooter
::::BgetCategory#utilities
net sess>nul 2>&1||(powershell start cmd -ArgumentList """/c %~0""" -verb Runas & exit)

Cls & Mode CON  LINES=11 COLS=70 & Color 0E & Title Created By FreeBooter
Echo.
Echo.
Echo.
Echo.       
Echo         Deny Access to All Removable Storage Devices (Y/N)?  
Echo.       
Echo.
Echo.


Set /p input= RESPONSE: 
If /i  Not %input%==Y (Goto :_Ex) Else (Goto :_Start) 

:_Ex
If /i Not %input%==N  (Goto :EOF) Else (Goto :_RegRestore)



:_Start

Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\RemovableStorageDevices" /v "Deny_All" /t REG_DWORD /d "1" /f > Nul

Cls & Mode CON  LINES=11 COLS=60 & Color 0E & Title Created By FreeBooter
Echo.
Echo.
Echo.
Echo.       
Echo         Access To All Removable Storage Devices Denied   
Echo.       
Echo.
Echo. 
ping -n 6 localhost >nul 
Goto Reboot


:_RegRestore

Reg.exe delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\RemovableStorageDevices" /v "Deny_All" /f > Nul


Cls & Mode CON  LINES=11 COLS=60 & Color 0E & Title Created By FreeBooter
Echo.
Echo.
Echo.
Echo.       
Echo        Access To All Removable Storage Devices Enabled   
Echo.       
Echo.
Echo. 
ping -n 6 localhost >nul 




:Reboot

CHOICE /C YN /M "Press Y to Reboot, N for exiting script."


If %errorlevel% == 1 ( Shutdown /r /t 0) Else (Exit)