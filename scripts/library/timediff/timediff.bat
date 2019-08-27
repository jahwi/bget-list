@echo off
::::BgetDescription#Calculate time difference using the command line.
::::BgetAuthor#Aacini
::::BgetCategory#library
::::BgetTags#timer

REM https://stackoverflow.com/a/9935540/4908958
setlocal EnableDelayedExpansion

set "startTime=%time: =0%"

set /P "=Any process here..."

set "endTime=%time: =0%"



rem Get elapsed time:
set "end=!endTime:%time:~8,1%=%%100)*100+1!"  &  set "start=!startTime:%time:~8,1%=%%100)*100+1!"
set /A "elap=((((10!end:%time:~2,1%=%%100)*60+1!%%100)-((((10!start:%time:~2,1%=%%100)*60+1!%%100)"

rem Convert elapsed time to HH:MM:SS:CC format:
set /A "cc=elap%%100+100,elap/=100,ss=elap%%60+100,elap/=60,mm=elap%%60+100,hh=elap/60+100"

echo Start:    %startTime%
echo End:      %endTime%
echo Elapsed:  %hh:~1%%time:~2,1%%mm:~1%%time:~2,1%%ss:~1%%time:~8,1%%cc:~1%