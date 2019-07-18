:: Batch Script Created by FreeBooter

::::BgetDescription#Rebuilds the icon cache.
::::BgetAuthor#FreeBooter
::::BgetCategory#utilities
@Echo Off & Cls

Cd %~dp0

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



Mode CON  LINES=15 COLS=79 & Title Created By FREEBOOTER
  
  Echo.
  Echo.
  Echo.
  Echo.
  Echo.
  Echo  ษออออออออออออออออออออออออออออออ  READ ME   ออออออออออออออออออออออออออออออออป
  Echo  บ                                                                          บ
  Echo  บ   PLEASE SAVE AND CLOSE ALL FILES BEEN WORKED ON AND CLOSE ALL PROGRAMS  บ 
  Echo  บ   THAT ARE STARTED BY YOU                                                บ 
  Echo  บ                                                                          บ
  Echo  บ                                                                          บ
  Echo  บ   WHEN YOU ARE READY PRESS ANY KEYBOARD KEY TO EXECUTE THE BATCH SCRIPT  บ  
  Echo  บ                                            	                            บ 
  Echo  ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
  Echo.
	  
  Pause > Nul 

	
Taskkill /IM Explorer.exe /F

:: Repair system icons do not appear in the notification area.

 Reg Delete "HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\TrayNotify" /v  IconStreams /f 2>&1 >Nul 

Cls

 Reg Delete "HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\TrayNotify" /v  PastIconsStream /f 2>&1 >Nul 

Cls

Ping /n 2 127.0.0.1 > Nul


Del /F /Q /A %LOCALAPPDATA%\IconCache.db 1>Nul 2>Nul

Del /F /Q /A %LOCALAPPDATA%\Microsoft\Windows\Explorer\*.db 1>Nul 2>Nul

Del /F /Q /A "%UserProfile%\Local Settings\Application Data\IconCache.db" 1>Nul 2>Nul 

:: Repair Blank Shourtcut Icons
Reg Delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\User Choice" /f

:: Configuring Settings for Windows Disk Cleanup Tool
 
Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Active Setup Temp Folders" /v "StateFlags0064" /t REG_DWORD /d "2" /f 2>&1 >nul

Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\BranchCache" /v "StateFlags0064" /t REG_DWORD /d "2" /f 2>&1 >nul

Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Downloaded Program Files" /v "StateFlags0064" /t REG_DWORD /d "2" /f 2>&1 >nul

Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Internet Cache Files" /v "StateFlags0064" /t REG_DWORD /d "2" /f 2>&1 >nul

Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Memory Dump Files" /v "StateFlags0064" /t REG_DWORD /d "2" /f 2>&1 >nul

Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Old ChkDsk Files" /v "StateFlags0064" /t REG_DWORD /d "2" /f 2>&1 >nul

Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Recycle Bin" /v "StateFlags0064" /t REG_DWORD /d "2" /f 2>&1 >nul

Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Service Pack Cleanup" /v "StateFlags0064" /t REG_DWORD /d "2" /f 2>&1 >nul

Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Setup Log Files" /v "StateFlags0064" /t REG_DWORD /d "2" /f 2>&1 >nul

Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\System error memory dump files" /v "StateFlags0064" /t REG_DWORD /d "2" /f 2>&1 >nul

Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\System error minidump files" /v "StateFlags0064" /t REG_DWORD /d "2" /f 2>&1 >nul

Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Temporary Files" /v "StateFlags0064" /t REG_DWORD /d "2" /f 2>&1 >nul

Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Temporary Setup Files" /v "StateFlags0064" /t REG_DWORD /d "2" /f 2>&1 >nul

Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Thumbnail Cache" /v "StateFlags0064" /t REG_DWORD /d "2" /f 2>&1 >nul

Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Update Cleanup" /v "StateFlags0064" /t REG_DWORD /d "2" /f 2>&1 >nul

Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\User file versions" /v "StateFlags0064" /t REG_DWORD /d "2" /f 2>&1 >nul

Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Windows Defender" /v "StateFlags0064" /t REG_DWORD /d "2" /f 2>&1 >nul

Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Windows Error Reporting Archive Files" /v "StateFlags0064" /t REG_DWORD /d "2" /f 2>&1 >nul

Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Windows Error Reporting Queue Files" /v "StateFlags0064" /t REG_DWORD /d "2" /f 2>&1 >nul

Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Windows Error Reporting System Archive Files" /v "StateFlags0064" /t REG_DWORD /d "2" /f 2>&1 >nul

Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Windows Error Reporting System Queue Files" /v "StateFlags0064" /t REG_DWORD /d "2" /f 2>&1 >nul

Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Windows ESD installation files" /v "StateFlags0064" /t REG_DWORD /d "2" /f 2>&1 >nul



Cls

Mode CON  LINES=5 COLS=48 
Cls
Echo.
Echo.
Echo.
Echo.
Echo.
Echo.
Echo              Please Wait..
Echo.
Echo.

:: Starting Windows Disk Cleanup Utility
CLEANMGR /sagerun:64 

:: Checking if the computer running Windows XP OS.
Reg QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Windows XP" >Nul
If Not Errorlevel 1 Goto :Win_XP


Mode CON  LINES=5 COLS=48 
Cls
Echo.
Echo.
Echo.
Echo.
Echo              DO YOU WANT TO REBOOT
Echo.
Echo.

:: Ask user if they will reboot system now or later.
Cd %~dp0
choice /c yn /n /m "Reboot? [Y/N]"
if errorlevel 1 shutdown /r /t 0 /c "Icon Cache Rebuilder scheduled restart."
if errorlevel 2 start explorer.exe
Exit
:: Making sure user runs the batch script as a administrator.
:IsAdmin
Reg query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Mode CON  LINES=5 COLS=48 & Color 0C & Title - WARNING -
 Echo.
 Echo. 
 Echo  YOU MUST HAVE ADMINISTRATOR RIGHTS TO CONTINUE 
 Pause >Nul & Exit
)
Cls
Goto :EOF


:Win_XP

Cls & Mode CON  LINES=11 COLS=42 & Color 0E & Title FreeBooter 
Echo.
Echo.
Echo    THIS COMPUTER WILL REBOOT 
Echo.
Echo.
Echo    PLEASE SAVE ALL WORK IN PROGRESS
Echo. 
Echo.
Echo    PRESS 'ENTER' KEY TO RESTART COMPUTER
Pause >Nul

Shutdown  -r  -t 0  -c "REBOOTING SYSTEM" 2>&1 > Nul
Cls
Exit