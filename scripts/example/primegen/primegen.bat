@echo off & setlocal enableDelayedExpansion

::::BgetDescription#Using loops to generate primes.
::::BgetAuthor#Icarus
::::BgetCategory#example
::::Bgettags#number

set "n=1000"
for /l %%i in (2,1,%n%)do set/a"w=%%i * 2" &(for /l %%j in (!w!,%%i,%n%)do set "p%%j=0")& if "!p%%i!" equ "" echo %%i 

pause
