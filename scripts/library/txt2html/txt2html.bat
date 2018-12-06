@echo off
goto checkParam

::::BgetDescription#Convert a text file with special format into a HTML encoded file
::::BgetAuthor#Aacini
::::BgetCategory#library
TextToHtml.bat: Convert a text file with special format into a HTML encoded file
Antonio Perez Ayala

References:
- http://www.w3.org/MarkUp/Guide/
- http://www.quackit.com/
- http://www.w3schools.com/

This program does not include any error detection code, so it may break because erroneous data 
or by Batch special characters inserted in certain particular places.

Known bugs:
- If an input line is too large and contain many tags, the translated output line may exceed max variable lenght.
- Exclamation-marks can not be used in included file names in Tables and CodeSegments, and are stripped from data in included Tables.
- If [color="colorValue"], [style="param:value;..."], [br clear="all"] or [hr attrib="value"] tags are included in a paragraph, then *all* "] in that paragraph are changed to ">

Future improvements:
- Extract the HTML header to a separate style sheet file and replace it by <link type="text/css" rel="stylesheet" href="HTMLheader.css">
- Give an include folder in a parameter for included files.
- Give the definition of dropdown menu in include file (like Table and CodeSegment)
- [include] tag to include commonly used segments, like footers.


:checkParam
if "%~1" neq "" if "%~1" neq "/?" goto checkFile
(
echo Convert a source text file to an equivalent HTML file
echo/
echo TextToHtml.bat "Source text file.txt" [/N] ["param=#"] ...
echo/
echo   /N          Not launch the created HTML file.
echo   "param=#"   Change the value of a limiting parameter; quotes are mandatory.
echo/
echo These are the original values of limiting parameters:
echo/
echo   maxCodeTags=16
echo   maxImgTags=8
echo   maxUrlTags=8
echo   maxSelectTags=4
echo/
echo   maxFilesInImage=20
echo   maxUrlTagsInImage=24
echo   maxUrlTagsInSelect=24
echo   maxColumnsInTable=20
echo/
echo First four values limit tags in one line/paragraph. For example:
echo/
echo   TextToHtml.bat Example.txt "maxImgTags=12" "maxFilesInImage=32"
echo/
echo/
type "Format of the source text file.txt"
echo/
echo To show a detailed explanation, type:
echo   TextToHtml.bat "TextToHtml.bat conversion program.txt"
) | more 
goto :EOF


:checkFile
if not exist "%~F1" echo File not found: %1 & goto :EOF

cd /D "%~DP1"
setlocal DisableDelayedExpansion

rem Initialize static variables
set not=!
set slash=/
set quote="
set "equalSigns======="
set "mods6ForCells=/[align/"
set "mods8ForCells=/[bgcolor/[colspan/[rowspan/"
for %%a in (" =none" "1=decimal" "0=decimal-leading-zero"
            "a=lower-alpha" "UA=upper-alpha" "i=lower-roman" "UI=upper-roman"
            "g=lower-greek" "UG=upper-greek" "d=disc" "lc=circle" "s=square" ) do (
   for /F "tokens=1,2 delims==" %%b in (%%a) do (
      set listStyle[%%b]=%%c
   )
)

rem Initialize limiting parameters, first four values are in one line/paragraph
set maxCodeTags=16
set maxImgTags=8
set maxUrlTags=8
set maxSelectTags=4
set maxFilesInImage=20
set maxUrlTagsInImage=24
set maxUrlTagsInSelect=24
set maxColumnsInTable=20

rem Process parameters
set "thisFile=%~N1"
set "fullFile=%~DPN1"
set "fullFileExt=%~F1"
:nextParam
   shift
   if "%~1" equ "" goto endParams
   if /I "%~1" equ "/N" (
      set noStart=true
   ) else (
      set %1
   )
   goto nextParam
:endParams

echo Converting "%thisFile%"
echo/
del JavaCode.tmp 2> NUL

rem Create the HTML header
(
echo ^<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"^>
echo ^<!-- This file was created using TextToHtml.bat conversion program written by Antonio Pérez Ayala (aka Aacini^) --^>
echo ^<html^>
echo ^<head^>
echo    ^<title^>%thisFile%^</title^>
echo    ^<style type="text/css"^>
echo    h1 { margin-left: -6%%; }
echo    h2 { margin-left: -3%%; margin-top: 2em; }
echo    body { 
echo       margin-left: 10%%; 
echo       margin-right: 10%%; 
echo       color: black;
echo       background: white;
echo       font-family: "Lucida Grande", Verdana, Helvetica, Arial, sans-serif;
echo    }
echo    code {
echo       color: black;
echo       background:  #CCDDFF;
echo       font-weight: bold;
echo       white-space: pre; 
echo       font-family: "Courier New", Monaco, monospace;
echo       font-size: 1.05em;
echo    }
echo    pre {
echo       color: black;
echo       background:  #CCDDFF;
echo       font-weight: bold;
echo       white-space: pre; 
echo       font-family: "Courier New", Monaco, monospace;
echo       font-size: 1.05em;
echo       border: none;
echo       padding: 0.3em;
echo       width: 100%%;
echo       overflow: auto;
echo       scrollbar-base-color: #99CCFF;
echo    }
echo    kbd {
echo       font-size: 0.8em;
echo       font-family: Arial, Helvetica, sans-serif;
echo       border: 1px solid #999999;
echo       border-radius: 3px;
echo       padding: 0.1em 0.6em;
echo       margin: 0 0.1em;
echo       display: inline-block;
echo       white-space: nowrap;
echo    }
echo    #horList li {
echo       display: inline;
echo    }
echo    ^</style^>
echo ^</head^>
echo ^<body^>
echo ^<h1^>%thisFile%^</h1^>
) > "%fullFile%.html"

rem Initialize control variables
set TOClevel=1
set TOCheader=Table of Contents
set "codeBlock="
set "tableRow="
set "endOfList="
set "horListPad="
set nameNumber=0

rem Process the lines in the source file and create the HTML body
(for /F delims^=^ eol^= %%a in ('findstr /N "^" "%fullFileExt%"') do (
   set "line=%%a"
   call set "line=%%line:!=&#33;%%"
   setlocal EnableDelayedExpansion
   set "line=!line:*:=!"
   if defined line (
      set "line=!line:<=&lt;!"
      set "line=!line:ÿ=&#255;!"
   )

   set "middle="
   if defined codeBlock (
      rem 1- Insert unprocessed lines in the code block
      if "!line!" neq "[%slash%code]" (
         echo(!line!
      ) else (
         if "!codeBlock!" neq "nul" call :TypeFile "!codeBlock!"
         echo ^</pre^>
         set "codeBlock="
      )
   ) else if defined tableRow (
      rem 2- Process rows in the table
      if "!line!" neq "[/table]" (
         call :tableRow
      ) else (
         if "!tableRow:~3!" neq "" (
            for /F "usebackq delims=" %%c in ("!tableRow:~3!") do (
               set "line=%%c"
               set "line=!line:<=&lt;!"
               call :tableRow
            )
         )
         echo    ^</table^>
         set "tableRow="
      )
   ) else if not defined line (
      rem 3- Show empty lines as line breaks
      echo ^<p^>^<br^>
   rem Process tags at start of line
   ) else if "!line:~0,1!" equ "[" (
      rem 4- Start of code block, or Start of table, or Start/Item/End of list
      if "!line:~0,5!" equ "[code" (
         rem 4.1- Start of code block: get modifiers and caption
         if "!line:~5,1!" equ "]" (
            rem Code block with no modifiers: [code]caption
            set "modifiers="
            set "caption=!line:~6!"
         ) else (
            rem Code block with includeFile and/or modifiers: [code:includeFile modifiers]caption
            call :getIncludefileModifiersCaption 5 ":"
            set "codeBlock=!includeFile!"
         )
         if defined caption echo ^<p^>^<b^>^<a name="!caption: =_!"^>!caption!^</a^>^</b^>
         if defined modifiers set modifiers= style="!modifiers!"
         echo ^<pre!modifiers!^>
         if not defined codeBlock (
            set codeBlock=nul
         )
      ) else if "!line:~0,6!" equ "[table" (
         rem 4.2- Start of table: get modifiers and caption
         if "!line:~6,1!" equ "]" (
            rem Table with no modifiers: [table]caption
            for %%v in (modifiers tableHeader tableData tableCol) do set "%%v="
            set "caption=!line:~7!"
         ) else (
            rem Table with includeFile and/or modifiers:
            rem [table=includeFile tableMods;headerMods;dataMods;col|Mods]caption
            call :getIncludefileModifiersCaption 6 "="
            for /F "tokens=1-4 delims=;" %%e in ("!modifiers!") do (
               set "modifiers=%%e" & set "tableHeader=%%f" & set "tableData=%%g" & set "tableCol=%%h"
            )
            for %%v in (modifiers tableHeader tableData) do (
               if defined %%v (
                  if "!%%v!" neq " " (set "%%v= !%%v!") else (set "%%v=")
               )
            )
         )
         echo [table]!caption! >&2
         echo    ^<table!modifiers!^>
         if defined caption echo    ^<caption^>^<b^>^<a name="!caption: =_!"^>!caption!^</a^>^</b^>^</caption^>
         set tableRow=th:!includeFile!
      ) else if "!line:~0,5!" equ "[list" (
         rem 4.3- Start of list: get type (Unordered/Ordered/Definition-horizontal) and caption
         if "!line:~5,1!" equ "]" (
            rem Unordered list: [list]caption
            set "list=<ul>"
            set "caption=!line:~6!"
            set "endOfList=!endOfList!</ul>"
         ) else (
            rem Ordered/Definition-horizontal list: [list=t]caption
            set "type=!line:~6,1!"
            for %%t in (A I G) do if "!type!" equ "%%t" set "type=U%%t"
            if "!type!" equ "c" set type=lc
            for /F "delims=" %%t in ("!type!") do set "style=!listStyle[%%t]!"
            if defined style (
               rem Ordered list
               set list=^<ol style="list-style-type: !style!"^>
               set "caption=!line:~8!"
               set "endOfList=!endOfList!</ol>"
            ) else if /I "!type!" equ "H" (
               rem Definition list: [list=H]caption
               set "list=<dl>"
               set "caption=!line:~8!"
               set "endOfList=!endOfList!</dl>"
            ) else (
               rem Horizontal list: [list=C:pad]caption or [list=LR:pad:margin]caption or [list=B:pad:Lmargin:Rmargin]caption 
               set "list=<ul"
               for /F "tokens=2* delims==]" %%c in ("!line!") do for /F "tokens=2* delims=:" %%e in ("%%c") do (
                  set "caption=%%d" & set "padding=%%e" & set "margin=%%f"
               )
               if not defined padding set padding=0
               set typeCorLorB=true
               if "!type!" neq "C" if "!type!" neq "L" if "!type!" neq "B" set "typeCorLorB="
               if defined typeCorLorB (
                  set horListPad=padding-right:!padding!em;
                  if "!type!" equ "C" (
                     set style=text-align:center;
                  ) else (
                     set style=float:left;
                     if defined margin for /F "tokens=1,2 delims=:" %%c in ("!margin!") do (
                        set style=!style! margin-left:%%cem;
                        set horListPad=!horListPad!:%%d
                     )
                  )
                  set list=!list! id="horList" style="!style!"
               ) else if /I "!type!" equ "R" (
                  set horListPad=padding-left:!padding!em;
                  set style=float:right;
                  if defined margin set style=!style! margin-right:!margin!em;
                  set list=!list! id="horList" style="!style!"
               )
               set "list=!list!>"
               set "endOfList=!endOfList!</ul>"
            )
         )
         if not defined horListPad (
            echo    !list!
            if defined caption echo    ^<b^>^<a name="!caption: =_!"^>!caption!^</a^>^</b^>
         ) else (
            if defined caption echo    ^<b^>^<a name="!caption: =_!"^>!caption!^</a^>^</b^>
            echo    !list!
         )
      ) else if "!line:~0,3!" equ "[*]" (
         rem 4.4- List item
         if defined endOfList (
            set "item=!line:~3!"
            call :ProcessCodeSegments item
            if "!endOfList:~-5!" equ "</dl>" (
               echo       ^<dt^>!item!^<dd^>
            ) else if not defined horListPad (
               echo       ^<li^>!item!
            ) else for /F "tokens=1-3 delims=:" %%c in ("!horListPad!") do (
               if defined item (
                  echo       ^<li style="%%c:%%d"^>!item!
               ) else (
                  echo    ^</ul^>
                  set horListPad=!horListPad:right=left!
                  set style=float:right;
                  if "%%e" neq "" set style=!style! margin-right:%%eem;
                  echo    ^<ul id="horList" style="!style!"^>
               )
            )
         ) else (
            rem No open list: continue checking the line
            set "middle=!line!"
         )
      ) else if "!line!" equ "[/list]" (
         rem 4.5- End of list
         if defined endOfList (
            echo    !endOfList:~-5!
            set "endOfList=!endOfList:~0,-5!"
            if defined horListPad echo ^<br clear="all"^>& set "horListPad="
         ) else (
            rem No open list: continue checking the line
            set "middle=!line!"
         )
      ) else (
         rem 4.6- The tag at start of line is no code, table or list: continue checking the line
         set "middle=!line!"
      )
   ) else if "!line:~0,1!" equ "=" (
      rem 5- Start of section (subdivision)
      echo !line! >&2
      set "break="
      for /L %%i in (6,-1,2) do if not defined break (
         if "!line:~0,%%i!" equ "!equalSigns:~0,%%i!" (
            for /F "tokens=1,2 delims=|" %%c in ("!line!") do (
               set "section=%%c" & set "title=%%d"
            )
            set "section=!section:~%%i,-%%i!"
            rem If this is a level-2 section
            if %%i equ 2 (
               rem If this is the first level 2 section
               if !TOClevel! equ 1 (
                  rem Insert the "TOCheader" before it
                  echo ^<h4^>^<a name="!TOCheader: =_!"^>!TOCheader!^</a^>^</h4^>>> "%fullFile%.html"
               ) else (
                  rem Insert a "Top" link before level 2 sections
                  echo ^<br^>^<a href="#"^>^<span style="float:right; font-size:small;"^>Top^</span^>^</a^>
               )
            )
            rem Create the Table of Contents below the HTML header
            set /A adjust=%%i-TOClevel
            ( rem Start of redirected block
            for /L %%l in (1,1,!adjust!) do echo ^<ol^>
            for /L %%l in (!adjust!,1,-1) do echo ^</ol^>
            if defined title set title= title="!title!"
            echo ^<li^>^<a href="#!section: =_!"!title!^>!section!^</a^>
            ) >> "%fullFile%.html"
            rem Insert section with name reference
            echo ^<h%%i^>^<a name="!section: =_!"^>!section!^</a^>^</h%%i^>
            set TOClevel=%%i
            set break=on
         )
      )
      if not defined break (
         if "!line!" neq "=" (
            rem =Table of Contents header=
            set "TOCheader=!line:~1,-1!"
         ) else (
            rem =   (end of last subdivision, start of footer)
            if !TOClevel! gtr 1 (
               rem Insert the last "Top" link
               echo ^<br^>^<a href="#"^>^<span style="float:right; font-size:small;"^>Top^</span^>^</a^>^<br^>
               rem Close the Table of Contents
               for /L %%i in (!TOClevel!,-1,2) do echo ^</ol^>>> "%fullFile%.html"
            )
           set TOClevel=0
         )
      )
   ) else (
      rem 6- No tag at start of line: continue checking the line
      set "middle=!line!"
   )

   rem 7- Process the middle of the line for code segments in-line
   if defined middle (
      call :ProcessCodeSegments middle
      rem Write the converted line as new paragraph
      if "!endOfList:~-5!" equ "</dl>" (
         rem ... excepting into definition lists
         echo !middle!
      ) else if !TOClevel! equ 1 (
         rem Write initial paragraph(s) *before* the Table of Contents
         echo ^<p^>!middle!>> "%fullFile%.html"
      ) else (
         echo ^<p^>!middle!
      )
   )

   rem Preserve variables for next line
   for %%c in ("endlocal" "TOClevel=!TOClevel!"       "TOCheader=!TOCheader!"   "codeBlock=!codeBlock!"
                          "endOfList=!endOfList!"     "horListPad=!horListPad!"
                          "tableHeader=!tableHeader!" "tableData=!tableData!"   "tableRow=!tableRow!" "tableCol=!tableCol!"
                          "nameNumber=!nameNumber!"   "javaCode=!javaCode!") do (
      if %%c equ "endlocal" (endlocal) else set %%c
   )

)) > HTMLbody.tmp

rem Close the Table of Contents
for /L %%i in (%TOClevel%,-1,2) do echo ^</ol^>>> "%fullFile%.html"

rem Insert the HTML body, the Java code and the HTML tail below the Table of Contents
(
type HTMLbody.tmp
del  HTMLbody.tmp
if exist JavaCode.tmp (
   echo ^<script language="javascript"^>
   echo ^<!--
   type JavaCode.tmp
   del  JavaCode.tmp
   echo --^>
   echo ^</script^>
)
echo ^</body^>
echo ^</html^>
) >> "%fullFile%.html"

echo/
echo "%thisFile%.html" file created
if not defined noStart start "" "%fullFile%.html"
goto :EOF


rem Type a file converting "<" characters to "&lt;"

:TypeFile filename
setlocal DisableDelayedExpansion
for /F delims^=^ eol^= %%c in ('findstr /N "^" %1') do (
   set "line=%%c"
   setlocal EnableDelayedExpansion
   set "line=!line:*:=!"
   if defined line set "line=!line:<=&lt;!"
   echo(!line!
   endlocal
)
endlocal
exit /B


rem Extract parts of [tag:includeFile modifiers]caption for [code:] and [table=] tags
rem First param is position of first separator: 5 or 6, second param is first separator: ":" or "="

:getIncludefileModifiersCaption firstSepPos firstSepChar
set /A sepPos=%1, sepPosP1=sepPos+1, sepPosP2=sepPos+2
if "!line:~%sepPos%,1!" neq "%~2" (
   rem Tag with no include file: [tag modifiers]caption
   for /F "tokens=1* delims=]" %%c in ("!line:~%sepPosP1%!") do (
      set "modifiers=%%c" & set "caption=%%d"
   )
) else (
   rem Tag with include file: [tag:includeFile ...
   if "!line:~%sepPosP1%,1!" neq "!quote!" (
      rem Include file with no quotes: [tag:includeFile modifiers]caption
      for /F "tokens=1* delims=]" %%c in ("!line:~%sepPosP1%!") do (
         for /F "tokens=1*" %%e in ("%%c") do set "includeFile=%%e" & set "modifiers=%%f"
         set "caption=%%d"
      )
   ) else (
      rem Include file enclosed in quotes: [tag:"include File" modifiers]caption
      for /F "tokens=1* delims=]" %%c in ("!line:~%sepPosP2%!") do (
         for /F ^tokens^=1*^ delims^=^" %%e in ("%%c") do set "includeFile=%%e" & set "modifiers=%%f"
         set "caption=%%d"
      )
   )
)
exit /B


rem Assemble a table row: "|header": tr-th-Header1-/th-th-Header2-/th-...-/tr or:
rem                       "data":    tr-td-Data1-/td-td-Data2-/td-...-/tr

:tableRow
if "!line:~0,1!" equ "|" (
   rem Header row
   set "line=!line:~1!"
) else (
   rem Data row
   set tableHeader=!tableData!
   set tableRow=td%tableRow:~2%
   rem Get modifiers for each data column, if any
   if defined tableCol (
      set "tableColDup=!tableCol!"
      for /L %%i in (1,1,%maxColumnsInTable%) do if defined tableColDup (
         for /F "tokens=1* delims=|" %%a in ("!tableColDup!") do (
            if "%%a" neq " " set "tableCol[%%i]= %%a"
            set "tableColDup=%%b"
         )
      )   
   )
)
rem Create the table row
echo       ^<tr!tableHeader!^>
for /L %%i in (1,1,%maxColumnsInTable%) do if defined line (
   for /F "tokens=1* delims=| eol=|" %%a in ("!line!") do (
      set "tableCell="
      set "cell=%%a"
      for /F %%m in ("!cell:~0,6!") do if "!mods6ForCells:/%%m/=!" neq "%mods6ForCells%" (
         for /F "tokens=1* delims=]" %%c in ("!cell:~1!") do set "tableCell= %%c" & set "cell=%%d"
      )
      for /F %%m in ("!cell:~0,8!") do if "!mods8ForCells:/%%m/=!" neq "%mods8ForCells%" (
         for /F "tokens=1* delims=]" %%c in ("!cell:~1!") do set "tableCell= %%c" & set "cell=%%d"
      )
      call :ProcessCodeSegments cell
      set "row=<%tableRow:~0,2%!tableCol[%%i]!!tableCell!>!cell!</%tableRow:~0,2%>"
      echo          !row!
      set "line=%%b"
   )
)
echo       ^</tr^>
exit /B


rem Process code segments in-line

:ProcessCodeSegments middle
setlocal EnableDelayedExpansion
if not defined %1 exit /B
set "last=!%1:[code]=ÿ!"
set "last=!last:[%slash%code]=ÿ!"
set "last=!last:ÿÿ=ÿ ÿ!"
set "middle="
for /L %%i in (1,1,%maxCodeTags%) do if defined last (
   if "!last:~0,1!" equ "ÿ" set "last= !last!"
   for /F "tokens=1,2* delims=ÿ eol=ÿ" %%a in ("!last!") do (
      if "%%a" neq " " (
         rem Process tags at left of this code segment
         set "left=%%a"
         call :ProcessTagsInSegment left
         set "middle=!middle!!left!"
      )
      if "%%b" neq "" (
         rem Insert this code segment
         set "middle=!middle!<code>%%b</code>"
      )
      set "last=%%c"
   )
)
for /F "delims=" %%a in ("!middle!") do endlocal & set "%1=%%a" & set "nameNumber=%nameNumber%" & set "javaCode=%javaCode%"
exit /B


rem Process tags in segment: text styles, dropdown menus, image links, web site links, color of text, CSS styles and others

:ProcessTagsInSegment segment
rem Do NOT use setlocal here; some new variables needs to be returned to the calling code
set "segment=!%1!"

rem Nonbreaking space
set "segment=!segment:[nbsp]=&nbsp;!"

rem Text styles
for %%a in (b i u s tt big small sub sup q kbd) do (
   set "segment=!segment:[%%a]=<%%a>!"
   set "segment=!segment:[/%%a]=</%%a>!"
)


rem Dropdown menu, From: [select][url=addr1]Desc1[/url][url=addr2]Desc2[/url][/select] 
rem                To:   <select onChange="javaCode"><option value=addr1>Desc1</option>
rem                                                  <option value=addr2>Desc2</option></select>
set "selectSeg=!segment:[select]=ÿ!"
if "!selectSeg!" neq "!segment!" (
   rem Process menu options
   set "selectSeg=!selectSeg:[/select]=ÿ!"
   set "selectSeg=!selectSeg:ÿÿ=ÿ ÿ!"
   set "segment="
   for /L %%I in (1,1,%maxSelectTags%) do if defined selectSeg (
      if "!selectSeg:~0,1!" equ "ÿ" set "selectSeg= !selectSeg!"
      for /F "tokens=1,2* delims=ÿ eol=ÿ" %%a in ("!selectSeg!") do (
         if "%%a" neq " " set "segment=!segment!%%a"
         if "%%b" neq "" (
            set /A nameNumber+=1
            call :IncludeJavaFunction selectFunctions
            set segment=!segment!^<select id="s!nameNumber!" onFocus="oF()" onKeyDown="oKD(!nameNumber!)" onChange="oC(!nameNumber!)"^>

            rem Define menu options from nested url tags
            set "optGroupEnd="
            set "selectUrls=%%b"
            set "selectUrls=!selectUrls:[url]=[url=nohref]!"
            set "selectUrls=!selectUrls:[url=ÿ!"
            set "selectUrls=!selectUrls:[/url]=ÿ!"
            set "selectUrls= !selectUrls:ÿÿ=ÿ ÿ!"

            for /L %%J in (1,1,%maxUrlTagsInSelect%) do if defined selectUrls (
               for /F "tokens=1,2* delims=ÿ eol=ÿ" %%A in ("!selectUrls!") do (
                  rem From [url="question"?target:siteAddress]group:Description|Title[/url] to appropriate onClick="code" in each case
                  for /F "tokens=1* delims==]" %%D in ("%%B") do for /F "tokens=1* delims=|" %%F in ("%%E") do (
                     set "href=%%D" & set "description=%%F" & set "title=%%G"
                  )

                  if defined title set title= title="!title:"=^&#34;!"
                  if /I "!description:~0,6!" equ "group:" (
                     set "segment=!segment!!optGroupEnd!<optgroup label="!description:~6!">"
                     set "optGroupEnd=</optgroup>"
                  ) else (
                     set "href=!href:'=\'!"
                     if "!description:~0,5!" equ "open:" (
                        for /F "tokens=1* delims=:" %%i in ("!description:~5!") do (
                           set "action=OpenCloseMenu(!nameNumber!,%%i)" & set "description=%%j"
                        )
                     ) else if "!href:~0,1!" equ "!quote!" (
                        if "!href:~-1!" equ "!quote!" (
                           set "action=alert('!href:~1,-1!')"
                        ) else (
                           set "href=!href:"?=ÿ!"
                           for /F "tokens=1* delims=ÿ" %%i in ("!href:~1!") do (
                              set "action=confirmAndOpen('%%i','%%j')"
                              call :IncludeJavaFunction confirmAndOpen
                           )
                        )
                     ) else (
                        set "action=openWindow('!href!')"
                        call :IncludeJavaFunction openWindow
                     )
                     set "segment=!segment!<option!title! value="!action!">!description!</option>"
                  )

                  set "selectUrls=%%C"
               )
            )
            set "segment=!segment!!optGroupEnd!</select>"
         )
         set "selectSeg=%%c"
      )
   )
)


rem Link to image: from [img modifiers]imageAddress[/img] to <img modifiers src="imageAddress">
set "imgSeg=!segment:[img=ÿ!"
if "!imgSeg!" neq "!segment!" (
   rem Process links to images
   set "imgSeg=!imgSeg:[/img]=ÿ!"
   set "imgSeg=!imgSeg:ÿÿ=ÿ ÿ!"
   set "segment="
   for /L %%I in (1,1,%maxImgTags%) do if defined imgSeg (
      if "!imgSeg:~0,1!" equ "ÿ" set "imgSeg= !imgSeg!"
      for /F "tokens=1,2* delims=ÿ eol=ÿ" %%a in ("!imgSeg!") do (
         if "%%a" neq " " set "segment=!segment!%%a"
         if "%%b" neq "" (

            rem Separate img tag parts
            for /F "tokens=1,2* delims=][" %%d in (" %%b") do (
               set "modifiers=%%d" & set "imgAddr=%%e" & set "imgUrl=%%f"
            )


            rem Separate the image files given in this img tag
            set fileNum=0
            for /L %%J in (1,1,%maxFilesInImage%) do if defined imgAddr (
               for /F "tokens=1* delims=|" %%d in ("!imgAddr!") do (
                  set "imgAddr[!fileNum!]=%%d" & set /A fileNum+=1 & set "imgAddr=%%e"
               )
            )

            rem Initialize this img element
            set /A nameNumber+=1
            set "imgAddr=!imgAddr[0]!"
            set imgCode= name="img!nameNumber!"

            if !fileNum! gtr 1 ( rem Process several image files

               rem Extract ":start-end+step" delay parts from first and last image files, if any
               set /A lastFile=fileNum-1
               for %%i in (0 !lastFile!) do for /F "tokens=1-3 delims=:" %%d in ("!imgAddr[%%i]!") do (
                  if /I "%%d" neq "http" (
                     set "imgAddr[%%i]=%%d" & set "delay%%i=%%e"
                  ) else (
                     set "imgAddr[%%i]=%%d:%%e" & set "delay%%i=%%f"
                  )
                  set "delayN=!delay%%i!"
               )
               set "imgAddr=!imgAddr[0]!"
               set "randomImg="
               if defined delayN if /I "!delayN:~0,1!" equ "R" set "randomImg=true" & set "delayN=!delayN:~1!"
               for %%i in (0 N) do (
                  if defined delay%%i for /F "tokens=1-3 delims=-+" %%d in ("!delay%%i!") do (
                     set "start%%i=%%d" & set "end%%i=%%e" & set "step%%i=%%f"
                  )
               )
               set "mouseOver="
               if defined startN if /I "!startN:~-1!" equ "M" set "mouseOver=, img!nameNumber!play = false" & set "startN=!startN:~0,-1!"

               rem Create the array of image file names in Java code
               (
               echo var img!nameNumber!File = new Array(^), i!nameNumber! = 0!mouseOver!;
               for /L %%i in (0,1,!lastFile!) do echo (img!nameNumber!File[%%i]=new Image^).src = "!imgAddr[%%i]!";
               ) >> JavaCode.tmp

               if not defined delayN ( rem Images change as mouse moved over
                  rem From: imgAddr0|imgAddr1|imgAddr2...:R to: onMouseOver=imgAddr1|imgAddr2|...[,R]; onMouseOut=imgAddr0;

                  if !fileNum! equ 2 (
                     set imgCode=!imgCode! onMouseOver="document['img!nameNumber!'].src=img!nameNumber!File[i!nameNumber!=1].src"
                  ) else if not defined randomImg (
                     set imgCode=!imgCode! onMouseOver="if(++i!nameNumber!^>!lastFile!)i!nameNumber!=1; document['img!nameNumber!'].src=img!nameNumber!File[i!nameNumber!].src"
                  ) else (
                     set imgCode=!imgCode! onMouseOver="i!nameNumber!=Math.floor(!lastFile!*Math.random()+1); document['img!nameNumber!'].src=img!nameNumber!File[i!nameNumber!].src" 
                  )
                  set imgCode=!imgCode! onMouseOut="document['img!nameNumber!'].src=img!nameNumber!File[0].src"

               ) else if not defined stepN ( rem Images change as "startM-end" values indicate
                  rem From: imgAddr0|imgAddr1|...|imgAddrN:Rstart-end to cycleimgAddrs()[,start[,range][,R]]

                  if defined mouseOver (
                     set imgCode=!imgCode! onMouseOver="img!nameNumber!play = true" onMouseOut="img!nameNumber!play = false"
                     set "mouseOver= && img!nameNumber!play"
                  )
                  ( rem Start of redirected block
                  echo function cycle!nameNumber! (^) {
                  echo    if (document.img!nameNumber!.complete!mouseOver!^) {
                  if not defined randomImg (
                     echo       if (++i!nameNumber! ^> !lastFile!^) i!nameNumber! = 0;
                  ) else (
                     echo       i!nameNumber! = Math.floor(!fileNum!*Math.random(^)^);
                  )
                  echo       document.img!nameNumber!.src = img!nameNumber!File[i!nameNumber!].src;
                  echo    }
                  if not defined endN (
                     echo }
                     echo setInterval("cycle!nameNumber!()",!startN!^);
                  ) else (
                     set /A range=endN-startN
                     echo    setTimeout("cycle!nameNumber!()",!startN!+!range!*Math.random(^)^);
                     echo }
                     echo cycle!nameNumber!(^);
                  )
                  ) >> JavaCode.tmp

               ) else ( rem Images change as "start-end+step" indicate in combination with "play:", "fast:" and "slow:" areas
                  rem From: imgAddr0|imgAddr1|...|imgAddrN:Rstart-end+step to cycleimgAddrs()[,R]
                  rem play: {play=!play; cycleimgAddrs()}, fast: delay=min(delay+step,end), slow: delay=max(delay-step,start)

                  set /A "middleN=(startN+endN)/2, middle0=(start0+end0)/2"
                  if defined delay0 (
                     set "delay0= "
                     if defined step0 set "delay0=, img!nameNumber!delay0 = !middle0!"
                  )
                  ( rem Start of redirected block
                  echo var img!nameNumber!play = 0, img!nameNumber!delayN = !middleN!!delay0!;
                  echo function cycle!nameNumber! (^) {
                  echo    if (document.img!nameNumber!.complete ^&^& img!nameNumber!play^) {
                  if defined delay0 (
                     echo      if (i!nameNumber!^) {
                     echo        document.img!nameNumber!.src = img!nameNumber!File[i!nameNumber!=0].src;
                     if not defined end0 (
                        echo        setTimeout("cycle!nameNumber!()",!start0!^);
                     ) else if not defined step0 (
                        set /A range=end0-start0
                        echo        setTimeout("cycle!nameNumber!()",!start0!+!range!*Math.random(^)^);
                     ) else (
                        echo        setTimeout("cycle!nameNumber!()",img!nameNumber!delay0^);
                     )
                     echo      } else {
                     if not defined randomImg (
                        echo        if (++i!nameNumber! ^> !lastFile!^) i!nameNumber! = 1;
                     ) else (
                        echo        i!nameNumber! = Math.floor(!lastFile!*Math.random(^)^)+1;
                     )
                  ) else (
                     if not defined randomImg (
                        echo        if (++i!nameNumber! ^> !lastFile!^) i!nameNumber! = 0;
                     ) else (
                        echo        i!nameNumber! = Math.floor(!fileNum!*Math.random(^)^);
                     )
                  )
                  echo        document.img!nameNumber!.src = img!nameNumber!File[i!nameNumber!].src;
                  echo        setTimeout("cycle!nameNumber!()",img!nameNumber!delayN^);
                  if defined delay0 (
                     echo      }
                  )
                  echo    }
                  echo }
                  ) >> JavaCode.tmp

               )
            )


            rem Separate the url's given in this img tag
            if defined imgUrl (
               set "imgUrl=[!imgUrl!"
               set "imgUrl=!imgUrl:[url]=[url=nohref]!"
               set "imgUrl=!imgUrl:][/url]=] [/url]!" 
               set "imgUrl=!imgUrl:[url=ÿ!"
               set "imgUrl=!imgUrl:[/url]=ÿ!"
               set "imgUrl= !imgUrl:ÿÿ=ÿ ÿ!"
            )
            set firstUrl=0
            if defined delay0 set firstUrl=1
            set urlNum=!firstUrl!
            for /L %%J in (1,1,%maxUrlTagsInImage%) do if defined imgUrl (
               for /F "tokens=1,2* delims=ÿ eol=ÿ" %%A in ("!imgUrl!") do (
                  set "imgUrl[!urlNum!]=%%B" & set /A urlNum+=1 & set "imgUrl=%%C"
               )
            )


            rem Process nested url tags as area shapes for imagemap
            rem From: [url=addr1]shape1=x,y...|title1[/url][url=addr2]shape2=a,b...|title2[/url]...
            rem To:   <area href="addr1" shape="shape1" coords="x,y..." title="title1">...

            set "imgHref="
            set "imgMap="
            set /A lastUrl=urlNum-1
            for /L %%J in (!firstUrl!,1,!lastUrl!) do (

               rem From [url="question"?target:siteAddress]Description|Title[/url] to appropriate action/target:
               rem "message": alert(), "question"?: if confirm(), new: target="_blank", popup: openWindow()
               for /F "tokens=1* delims==]" %%D in ("!imgUrl[%%J]!") do for /F "tokens=1* delims=|" %%F in ("%%E") do (
                  set "href=%%D" & set "description=%%F" & set "title=%%G"
               )

               if defined href (
                  set "href=!href:'=\'!"
               ) else (
                  set href=nohref
               )
               if "!href:~0,1!" equ "!quote!" (
                  if "!href:~-1!" equ "!quote!" (
                     set "href=javascript:alert('!href:~1,-1!')"
                  ) else (
                     set "href=!href:"?=ÿ!"
                     for /F "tokens=1* delims=ÿ" %%i in ("!href:~1!") do (
                        set "question=%%i"
                        set "href=javascript:confirmAndOpen('!question:"=\"!','%%j')"
                        call :IncludeJavaFunction confirmAndOpen
                     )
                  )
               ) else if "!href!" neq "nohref" (
                  set "href=javascript:openWindow('!href!')"
                  call :IncludeJavaFunction openWindow
               )

               if "!description!" equ " " set "description="
               if not defined description ( rem No image parts: each url match a changing image
                  if not defined imgHref (
                     echo var img!nameNumber!Href = new Array(^);>> JavaCode.tmp
                     set modifiers=!modifiers! onClick="eval(img!nameNumber!Href[i!nameNumber!]^)"
                     set imgHref=true
                  )
                  if "!href!" neq "nohref" echo img!nameNumber!Href[%%J] = "!href:\=\\!";>> JavaCode.tmp
               ) else ( rem Image parts: each url divide the unique image, or match part of a changing image
                  set "control="
                  if "!description:~4,1!" equ ":" set "control=!description:~0,4!" & set "description=!description:~5!"
                  for /F "tokens=1* delims==" %%i in ("!description!") do (
                     set imgMap=!imgMap!^<area shape="%%i" coords="%%j"
                  )
                  if "!fileNum!" equ "1" ( rem This part divide the unique image
                     if "!href!" neq "nohref" set href=href="!href!"
                     set "imgMap=!imgMap! !href!"
                     if defined title (
                        if /I "!title:~0,4!" neq "img:" (
                           set imgMap=!imgMap! title="!title:"=^&#34;!"
                        ) else (
                           set imgMap=!imgMap! onMouseOver="document['img!nameNumber!'].src='!title:~4!'" onMouseOut="document['img!nameNumber!'].src='!imgAddr[0]:'=\'!'"
                        )
                     )
                  ) else ( rem This part match the corresponding image or is an animation control
                     if "!control!" equ "play" (
                        set imgMap=!imgMap! onClick="img!nameNumber!play=-(img!nameNumber!play-1); cycle!nameNumber!();"
                     ) else if "!control!" equ "slow" (
                        set imgMap=!imgMap! onClick="img!nameNumber!delayN=Math.min(img!nameNumber!delayN+!stepN!,!endN!^);
                        if defined step0 set imgMap=!imgMap!img!nameNumber!delay0=Math.min(img!nameNumber!delay0+!step0!,!end0!^);
                        set imgMap=!imgMap!"
                     ) else if "!control!" equ "fast" (
                        set imgMap=!imgMap! onClick="img!nameNumber!delayN=Math.max(img!nameNumber!delayN-!stepN!,!startN!^);
                        if defined step0 set imgMap=!imgMap!img!nameNumber!delay0=Math.max(img!nameNumber!delay0-!step0!,!start0!^);
                        set imgMap=!imgMap!"
                     ) else (
                        set imgMap=!imgMap! onClick="if (i!nameNumber!==%%J) !href:\=\\!"
                     )
                  )
                  set imgMap=!imgMap!^>
               )
            )

            if defined imgMap (
               set /A nameNumber+=1
               set segment=!segment!^<map name="map!nameNumber!"^>!imgMap!^</map^>
               set modifiers=!modifiers! usemap="#map!nameNumber!"
            )

            set segment=!segment!^<img!modifiers:~1! src="!imgAddr!"!imgCode!^>
         )

         set "imgSeg=%%c"
      )
   )
)


rem Link to site, From: [url=siteAddress]description|title[/url] 
rem               To:   <a href="siteAddress" title="title">description</a>
set "urlSeg=!segment:[url=ÿ!"
if "!urlSeg!" neq "!segment!" (
   rem Process links to sites
   set "urlSeg=!urlSeg:[/url]=ÿ!"
   set "urlSeg=!urlSeg:ÿÿ=ÿ ÿ!"
   set "segment="
   for /L %%i in (1,1,%maxUrlTags%) do if defined urlSeg (
      if "!urlSeg:~0,1!" equ "ÿ" set "urlSeg= !urlSeg!"
      for /F "tokens=1,2* delims=ÿ eol=ÿ" %%a in ("!urlSeg!") do (
         if "%%a" neq " " set "segment=!segment!%%a"
         if "%%b" neq "" (
            for /F "tokens=1* delims==]" %%d in ("%%b") do for /F "tokens=1* delims=|" %%f in ("%%e") do (
               set "href=%%d" & set "description=%%f" & set "title=%%g"
            )

            if defined title set title= title="!title:"=^&#34;!"
            if /I "!description:~0,7!" neq "button:" (
               rem From [url="question"?target:siteAddress]plain:description to appropriate action/target: 
               rem "message": alert(), "question"?: if confirm(), new: target="_blank", popup: openWindow()
               if "!href:~0,1!" equ "!quote!" (
                  set "href=!href:'=\'!"
                  if "!href:~-1!" equ "!quote!" (
                     set "href=javascript:alert('!href:~1,-1!');"
                  ) else (
                     set "href=!href:"?=ÿ!"
                     for /F "tokens=1* delims=ÿ" %%i in ("!href:~1!") do (
                        set "question=%%i"
                        set "href=javascript:confirmAndOpen('!question:"=\"!','%%j');"
                        call :IncludeJavaFunction confirmAndOpen
                     )
                  )
                  set "target="
               ) else if "!href:~0,4!" equ "new:" (
                  set "href=!href:~4!"
                  set target= target="_blank"
               ) else if "!href:~0,6!" equ "popup:" (
                  set target= onClick="openWindow('!href:'=\'!');return false;"
                  set "href=!href:~6!"
                  call :IncludeJavaFunction openWindow
               )
               set "plain="
               if /I "!description:~0,6!" equ "plain:" (
                  set plain= style="text-decoration:none"
                  set "description=!description:~6!"
               )
               set "segment=!segment!<a href="!href!"!target!!title!!plain!>!description!</a>"
            ) else (
               rem From [url="question"?target:siteAddress]button:Description to appropriate onClick="code" in each case
               set "href=!href:'=\'!"
               if "!href:~0,1!" equ "!quote!" (
                  if "!href:~-1!" equ "!quote!" (
                     set "onClick=alert('!href:~1,-1!')"
                  ) else (
                     set "href=!href:"?=ÿ!"
                     for /F "tokens=1* delims=ÿ" %%i in ("!href:~1!") do (
                        set "question=%%i"
                        set "onClick=confirmAndOpen('!question:"=\"!','%%j');return false;"
                        call :IncludeJavaFunction confirmAndOpen
                     )
                  )
               ) else (
                  set "onClick=openWindow('!href!');return false;"
                  call :IncludeJavaFunction openWindow
               )
               set "segment=!segment!<button type="button" onClick="!onClick!"!title!>!description:~7!</button>"
            )
         )

         set "urlSeg=%%c"
      )
   )
)


rem Color of text: from [color="colorValue" ...]text[/color] to <font color="colorValue" ...>text</font>
set "colorSeg=!segment:[/color]=</font>!"
if "!colorSeg!" neq "!segment!" (
   set "segment=!colorSeg:[color=<font color!"
   set "segment=!segment:"]=">!"
)

rem CSS style: from [style="param:value; ..."]text[/style] to <span style="param:value; ...">text</span>
set "styleSeg=!segment:[/style]=</span>!"
if "!styleSeg!" neq "!segment!" (
   set "segment=!styleSeg:[style=<span style!"
   set "segment=!segment:"]=">!"
)

rem Hypertext name: from [name="The_name"]text[/name] to <a name="The_name">text</a>
set "nameSeg=!segment:[/name]=</a>!"
if "!nameSeg!" neq "!segment!" (
   set "segment=!nameSeg:[name=<a name!"
   set "segment=!segment:"]=">!"
)

rem Line break (clear="value")
set "segment=!segment:[br]=<br>!"
if "!segment:[br clear=!" neq "!segment!" (
   set "segment=!segment:[br clear=<br clear!"
   set "segment=!segment:"]=">!"
)

rem Horizontal rule (with modifiers)
set "segment=!segment:[hr]=<hr>!"
if "!segment:[hr =!" neq "!segment!" (
   set "segment=!segment:[hr =<hr !"
   set "segment=!segment:"]=">!"
)

set "%1=!segment!"
exit /B


rem Include Java functions in JavaCode.tmp file (just once)

:IncludeJavaFunction funcName

if defined javaCode if "!javaCode:%1=!" neq "!javaCode!" exit /B
goto %1

:confirmAndOpen
(
echo function confirmAndOpen(question,url^) {
echo    if (confirm(question^)^) openWindow(url^);
echo }
) >> JavaCode.tmp
set javaCode=!javaCode!,confirmAndOpen
if "!javaCode:openWindow=!" neq "!javaCode!" exit /B

:openWindow
(
echo function openWindow(url^) {
echo    if ( url.substr(0,4^) == "new:" ^) {
echo       window.open(url.substr(4^),'_blank'^);
echo    } else if (url.substr(0,6^) == "popup:" ^) {
echo       if (screen.width^) { w = screen.width*3/4; l = screen.width/8; } else { w = 500; l = 100; }
echo       if (screen.height^) { h = screen.height*3/4; t = screen.height/16; } else { h = 300; t = 50; }
echo       specs = "width="+w+",height="+h+",left="+l+",top="+t+",scrollbars=yes,resizable";
echo       window.open(url.substr(6^),"_blank",specs^);
echo    } else if (url !not!= "nohref"^) {
echo       window.open(url,'_self'^);  // document.location.href=url;
echo    }
echo }
) >> JavaCode.tmp
set javaCode=!javaCode!,openWindow
exit /B


:selectFunctions
(
echo var lastMouse;

echo function oF (^) {  // onFocus
echo    lastMouse = true;
echo }

echo function oKD ( selNumber ^) {  // onKeyDown
echo    select = document.getElementById("s" + selNumber^);
echo    if (event.keyCode == 13^) {
echo       eval(select.options[select.selectedIndex].value^);
echo    }
echo    if (event.keyCode == 27^) { 
echo       select.disabled = true;
echo       select.disabled = false;
echo       select.size = 1;
echo    } 
echo    lastMouse = false;
echo }

echo function oC ( selNumber ^) {  // onChange
echo    select = document.getElementById("s" + selNumber^);
echo    if (lastMouse^) {
echo       eval(select.options[select.selectedIndex].value^);
echo    }
echo    lastMouse = true;
echo }

echo function OpenCloseMenu ( selNumber, selSize ^) {
echo    select = document.getElementById("s" + selNumber^);
echo    select.size = (select.size==1^)?selSize:1;
echo }
) >> JavaCode.tmp

set javaCode=!javaCode!,selectFunctions
exit /B
