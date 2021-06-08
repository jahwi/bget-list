:: Create a Wi-Fi history report in Windows 10 
::::BgetDescription#Create a Wi-Fi history report in Windows 10.
::::BgetAuthor#FreeBooter
::::BgetCategory#utilities


@Echo Off

Cls & Color 0E


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
:::        (ccc)2021 by {FreeBooter} @NerdRevolt
:::
:::    /// ::: /// ::: /// ::: /// ::: /// ::: 



(Net session >nul 2>&1)||(PowerShell start """%~0""" -verb RunAs & Exit /B)

If exist "%ProgramData%\Microsoft\Windows\WlanReport" Rd /s /q "%ProgramData%\Microsoft\Windows\WlanReport" > nul

Netsh wlan show wlanreport

Start "%ProgramData%\Microsoft\Windows\WlanReport\wlan-report-latest.html"