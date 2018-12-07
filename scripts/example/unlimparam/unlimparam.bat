@echo off
::::BgetDescription#Use unlimited parameters.
::::BgetAuthor#Lucas
::::BgetCategory#example
:ParameterFunction
set ParamCount=0
:FunctionLoop
if "%~1"=="" goto EndFunction
set /a ParamCount+=1
set F%ParamCount%=%1
Set F%ParamCount%Q=%~1
shift
goto Functionloop
:EndFunction

:: Now Any Paramaters are assigned to F variables.
:: Examples:   %1 is now assigned to %F1%
::             what would be %10 is now %F10%
:: To Get a Paramater without quotes (like %~1) you can use %F1Q% (add Q to the end).
:: You can also see how many parameters there are with %ParamCount%


echo %%F1%%: %F1%
echo %%F1Q%%: %F1Q%
echo %%PARAMCOUNT%%: %ParamCount%
pause
exit /b








