:: Enable or Disable F8 Advanced Boot Options in Windows 10

::::BgetDescription#[WIN 10] Enable or Disable F8 Advanced Boot Options in Windows 10
::::BgetAuthor#FreeBooter
::::BgetCategory#utilities
@Echo Off


net sess>nul 2>&1||(powershell start cmd -ArgumentList """/c %~0""" -verb Runas & exit)

:_Start
Cls & Mode CON  LINES=11 COLS=80 & Color 0E 
Echo.
Echo.       
Echo         Type (D) letter to Disable F8 Advanced Boot Options   
Echo.       
Echo.
Echo.
Echo.         
Echo         Type (E) letter to Enable F8 Advanced Boot Options   
Echo.         



Set /p input= RESPONSE: 
If /i  Not %input%==D (Goto :_Ex) Else (Goto :_Disable)

:_Ex
If /i  Not %input%==E  (Goto :_Start) Else (Goto :_Enable)





:_Disable

bcdedit /set {bootmgr} displaybootmenu no

Exit



:_Enable

bcdedit /set {bootmgr} displaybootmenu yes
