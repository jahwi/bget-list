:: Backup and Restore Network Shares in Windows 10
::::BgetDescription#Backup and Restore Network Shares in Windows 10
::::BgetAuthor#FreeBooter
::::BgetCategory#tools

@Echo Off & Cls 


(Net session >nul 2>&1)||(PowerShell start """%~0""" -verb RunAs & Exit /B)

SET DESTFOLDER=%userprofile%\Desktop\Network Shares

:choice

Cls & Mode CON  LINES=11 COLS=50 & Color 0E & Title Created By FreeBooter
Echo.
Echo.
Echo.
Echo        Backup Network Shares   (B)?   
Echo.       
Echo        Restore Network Shares  (R)?
Echo.


Set /p input= RESPONSE: 

If /i  Not %input%==B (Goto :_Ex) Else (Goto :_Backup) 

:_Ex
If /i Not %input%==R  (Goto :choice) Else (Goto :_Restore)



:_Backup


mkdir "%DESTFOLDER%"  > NUL 2> NUL
REG EXPORT "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Shares" "%DESTFOLDER%\NetworkShares.reg" /y > NUL 2> NUL



Cls & Mode CON  LINES=11 COLS=50 & Color 0E & Title Created By FreeBooter
Echo.
Echo.
Echo.
Echo.
Echo         Backing up Network Shares
Echo.
Echo.
Echo. 
Ping -n 5 localhost >Nul

Exit



:_Restore


REG IMPORT "%DESTFOLDER%\NetworkShares.reg" > NUL 2> NUL



Cls & Mode CON  LINES=11 COLS=50 & Color 0E & Title Created By FreeBooter
Echo.
Echo.
Echo.
Echo.
Echo        Restoring Network Shares 
Echo.
Echo.
Echo. 
Ping -n 5 localhost >Nul