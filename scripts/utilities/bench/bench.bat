@ECHO  off
SETLOCAL ENABLEDELAYEDEXPANSION
CLS

::::BgetDescription#Small benchmarking script that will tell you how long time it took to call a bat file or execute a command.
::::BgetAuthor#demux4555
::::BgetCategory#utilities
:: Small benchmarking script that will tell you how long time it took to call a bat file
:: version 2   - 2016.06.08 - Fixed so leading zeroes don't fuck up. Both SET /A and PERL are dandy now.
:: version 2.1 - 2016.07.27 - Vastly improved SET /A, but a lot more complex. Super fast. Removed perl, because this method is rock steady.

SET "argumentsOriginal=%*"
SET "arguments=!argumentsOriginal:%1=!"

:: Here we grab start time, execute the script we wanna time, and then grab the end time.
SET "StartTime=%time%"
CALL  %1 %arguments%
SET "EndTime=%time%"

:: We add a "1" to M, S, mS so they aren't accidentally read as octals if they show "09".
FOR /F "tokens=1,2,3,4,5,6,7,8 delims=:., " %%A IN ("%StartTime%:%EndTime%") DO ( SET /A "ScriptTimeTaken=(((%%E*60*60*100)+(1%%F*60*100)+(1%%G*100)+1%%H)-((%%A*60*60*100)+(1%%B*60*100)+(1%%C*100)+1%%D))" )
:: If midnight transitions between start and end time, we get a negative number.
IF !ScriptTimeTaken! LSS 0 ( SET /A ScriptTimeTaken=ScriptTimeTaken+8640000 )
:: Depending on number of millisecs, we have to pad output with "0.0" or "0."
IF !ScriptTimeTaken! LEQ 9 ( SET "ExecutionTime=0.0!ScriptTimeTaken:~-2!" ) ELSE ( IF !ScriptTimeTaken! LEQ 99 ( SET "ExecutionTime=0.!ScriptTimeTaken:~-2!" ) ELSE ( IF !ScriptTimeTaken! GEQ 100 ( SET "ExecutionTime=!ScriptTimeTaken:~0,-2!.!ScriptTimeTaken:~-2!" ) ) )

ECHO ----------------------------------------------------------------------- 1>&2
ECHO   COMMAND LINE:  !argumentsOriginal! 1>&2
ECHO   ELAPSED TIME:  %ExecutionTime% sec 1>&2
ECHO ----------------------------------------------------------------------- 1>&2

:End

ECHO.  1>&2