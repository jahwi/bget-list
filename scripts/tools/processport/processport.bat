:: Find out a name of the process running on local port connection in Windows 10
::::BgetDescription#Find out a name of the process running on local port connection in Windows 10
::::BgetAuthor#FreeBooter
::::BgetCategory#tools

@Echo off & Cls

(Net session >nul 2>&1)||(PowerShell start """%~0""" -verb RunAs & Exit /B)

Echo.
Echo.
Echo.
Set /p PORT_NUMBER="Input Port Number: "

Cls

PowerShell Get-Process -Id (Get-NetTCPConnection -LocalPort %PORT_NUMBER%).OwningProcess


Echo.
Echo.
Echo.


CHOICE /C YN /M "Press Y to Terminate Process, N for No."

PowerShell Get-Process -Id (Get-NetTCPConnection -LocalPort %PORT_NUMBER%).OwningProcess ^| Stop-Process  -Force

Echo Process Terminated...
Echo.
Echo.
Pause 