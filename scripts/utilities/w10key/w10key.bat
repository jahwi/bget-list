@echo off 
::::BgetDescription#Find Built in Windows 10 Key then Set Key and Activate.
::::BgetAuthor#Rbley
::::BgetCategory#utilities
SetLocal EnableDelayedExpansion 
set count=0 
for /F "delims=" %%a in ('wmic path softwarelicensingservice get oa3xoriginalproductkey') do ( 
  set key=%%a 
  set /a count=!count! + 1 
  if !count! GTR 1 goto Exit 
) 
:Exit 
echo Key=%key% 
choice /c yn /n /m "Activate key? [y/n]
if "!errorlevel!"=="2" exit /b
cscript //NoLogo //B %windir%\system32\slmgr.vbs /ipk %key% 
cscript //NoLogo //B %windir%\system32\slmgr.vbs /ato