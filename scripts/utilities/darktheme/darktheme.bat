@Echo Off
Color 1A

::::BgetDescription#[Win 10] Enables the dark mode explorer theme.
::::BgetAuthor#FreeBooter
::::BgetCategory#utilities

Cd %systemroot%\system32

Call :NoAdmin



Cls & Mode CON  LINES=11 COLS=70 & Color 0D &Title Created By FreeBooter
Echo.
Echo.
Echo.
Echo       ษอออออออออออออออออออออออออออออออออออออออออออออออออออป
Echo       บ Do You Want To Restore Default Light Theme (Y/N)? บ  
Echo       ศอออออออออออออออออออออออออออออออออออออออออออออออออออผ
Echo.
Echo.


Set /p input= RESPONSE: 
If /i  Not %input%==Y (Goto :_Ex) Else (Goto :_RegRestore)

:_Ex
If /i Not %input%==N  (Goto :EOF) Else (Goto :_Start)



:_Start

Reg Add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AppsUseLightTheme" /t REG_DWORD /d "0" /f >nul
Reg Add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "SystemUsesLightTheme" /t REG_DWORD /d "0" /f >nul


Cls & Mode CON  LINES=11 COLS=70 & Color 0D &Title Created By FreeBooter
Echo.
Echo.
Echo.
Echo       ษออออออออออออออออออออออออออออออออออออออออออออออออออป
Echo       บ Dark Theme For Settings And Modern Apps Enabled  บ  
Echo       ศออออออออออออออออออออออออออออออออออออออออออออออออออผ
Echo.
Echo. 
ping -n 8 localhost >nul 
Exit


:_RegRestore
Reg Delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AppsUseLightTheme" /f >nul
Reg Delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "SystemUsesLightTheme" /f >nul

Cls & Mode CON  LINES=11 COLS=70 & Color 0D &Title Created By FreeBooter
Echo.
Echo.
Echo.
Echo       ษออออออออออออออออออออออออออออออออออออออออออออออออออป
Echo       บ Dark Theme For Settings And Modern Apps Disabled บ  
Echo       ศออออออออออออออออออออออออออออออออออออออออออออออออออผ
Echo.
Echo. 
ping -n 8 localhost >nul 
Exit



:NoAdmin
Reg query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Mode CON  LINES=5 COLS=48 & Color 0C &  Title  .....................- WARNING -.......................
 Echo.
 Echo. 
 Echo  YOU MUST HAVE ADMINISTRATOR RIGHTS TO CONTINUE 
 Pause >Nul & Exit
)
 Cls
 Goto :eof