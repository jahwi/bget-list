@echo off
::::BgetDescription#Batch version of the Linux touch command that creates empty files.
::::BgetAuthor#aziascreations
::::BgetCategory#tools
setlocal enableextensions disabledelayedexpansion

(for %%a in (%*) do if exist "%%~a" (
	pushd "%%~dpa" && ( copy /b "%%~nxa"+,, & popd )
) else (
	type nul > "%%~fa"
)) >nul 2>&1