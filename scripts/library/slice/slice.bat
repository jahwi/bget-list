@Echo Off
:: Usage: slice.cmd filename [<int>start] [<int>end]
:: Note: if end is 0 then prints until the end of file
:: Add trick for bigger files. Tested on Win7 32bit monocore

::::BgetDescription#Print lines of a text file within a specific range.
::::BgetAuthor#Einstein1969
::::BgetCategory#library

Setlocal EnableExtensions DisableDelayedExpansion
Set /A b=%~2+0,e=%~3+0,#=0 2>Nul
If %b% Leq 0 Set "b=1"
If %e% Leq 0 Set "e=2147483647"

set "tmp_file=%tmp%\slice_%random%_%random%.dat"
Findstr /n "^" "%~dpf1">%tmp_file%

rem For /f "delims=" %%$ In ('Findstr /n "^" "%~dpf1"') Do (
For /f "delims=" %%$ In (%tmp_file%) Do (
Set /A #+=1 & Set "$=%%$"
Setlocal EnableDelayedExpansion
Set "$=!$:*:=!"
If !#! Geq %b% Echo(!$!
If !#! Geq %e% (Endlocal & Goto End)
Endlocal
)

:End
Endlocal & Goto:Eof