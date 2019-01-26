@echo off

setlocal enableDelayedExpansion

::::BgetDescription#Copy/move files created within a certain time range on the same day.
::::BgetAuthor#Jahwi
::::BgetCategory#example
::::Bgettags#paste;move

::init working folders
set source=ParentFolder
set inter=Testing
set final=Post

set tmp_mindate=
set mindate=999999999
set tmp_maxdate=
set maxdate=0
set filedate=
::get min and max time ranges
::caveat, doesnt give correct output if files were created on different days
for %%a in (!source!\*) do (
	for /f "tokens=1-5 delims= " %%b in ("%%~ta") do (
		REM echo "%%b" "%%c" "%%d" "%%e" "%%f"
		set tmp_mindate=%%c
		set tmp_maxdate=%%c
		set tmp_mindate=!tmp_mindate::=!
		set tmp_maxdate=!tmp_maxdate::=!
		if !tmp_mindate! LSS !mindate! set mindate=!tmp_mindate!
		if !tmp_maxdate! GTR !maxdate! set maxdate=!tmp_maxdate!
	)
)

::copy files within the range.

for %%a in (!inter!\JVC*.txt) do (
	for /f "tokens=1-5 delims= " %%b in ("%%~ta") do (
		REM echo "%%b" "%%c" "%%d" "%%e" "%%f"
		set file_time=%%c
		set file_time=!file_time::=!
		if not !file_time! LSS !mindate! (
			if not !file_time! GTR !maxdate! (
				copy "%%a" "!final!\"
			)
		)
	)
)
pause