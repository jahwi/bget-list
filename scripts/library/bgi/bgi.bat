"Batch-BGI" Borland Graphics Interface library for Windows Batch files
Written by Antonio Perez Ayala aka Aacini
::::BgetDescription#Borland Graphics Interface library for Windows Batch files
::::BgetAuthor#Aacini
::::BgetCategory#library
BGI Reference: http://www.cs.colorado.edu/~main/bgi/doc/
Canvas Reference: http://www.w3schools.com/tags/ref_canvas.asp

2015/08/23 - Version 0.1 (preliminary)
    - Several BGI functions are under development or research; see individual notes below.
    - Most "BGI for Windows" [WIN] functions will not be developed, and a few were/will be modified.

----------------------------------------------------------------------

All numeric parameters for Batch-BGI subroutines must be constants or JScript expressions over constants. Note
that commas, semicolons and equal-signs may be used to separate parameters in Batch subroutines and are optional.
When an expression may include separators or special Batch characters, it must be enclosed in quotes:
set /A x=100, y=100, r=90
call :arc x, y, 0, 360, r                           - Wrong (x, y and r are *variables*)
call :arc %x%, %y%, 0, 360, %r%                     - Correct (their values are constants)
call :arc %x% %y% 0 360 Math.min(%x%,%y%)-10        - Wrong, the comma separate Batch parameters
call :arc %x% %y% 0 360 "Math.min(%x%,%y%)-10"      - Correct
call :setfillstyle SOLID_FILL RED                   - Wrong
call :setfillstyle %SOLID_FILL% %RED%               - Correct
call :setfillstyle = %SOLID_FILL%, %RED%;           - Correct
The only subroutines that accept BGI names in the parameters are initgraph and closegraph.

All Batch-BGI subroutines with "getvalue" name just return the value of the corresponding
variable called "_value", so you may directly use it. For example, instead of:
   call :getmaxx width=
   call :getmaxy height=
   set /A midX = width / 2, midY = height / 2
you may directly do this:
   set /A midX = _maxx / 2, midY = _maxy / 2

======================================================================

:arc x y stangle endangle radius
echo ctx.beginPath();ctx.arc(%~1,%~2,%~5,(360-(%~3))*Math.PI/180,(360-(%~4))*Math.PI/180,true);ctx.stroke(); >&3
goto refresh

======================================================================

:bar left top right bottom
echo ctx.fillRect(%~1,%~2,(%~3)-(%~1),(%~4)-(%~2)); >&3
goto refresh

======================================================================

depth and topflag are optional parameters and must be constants, not expressions.

:bar3d left top right bottom [depth [topflag]]
echo ctx.beginPath();ctx.rect(%~1,%~2,(%~3)-(%~1),(%~4)-(%~2)); >&3
if "%5" equ "" (goto endbar3d) else if "%5" equ "0" goto endbar3d
   echo ctx.moveTo(%~3,%~4);ctx.lineTo((%~3)+(%~5),(%~4)-(%~5));ctx.lineTo((%~3)+(%~5),(%~2)-(%~5));ctx.lineTo(%~3,%~2); >&3
   if "%6" equ "" (goto endbar3d1) else if "%6" equ "0" goto endbar3d1
      echo ctx.lineTo((%~3)+(%~5),(%~2)-(%~5));ctx.lineTo((%~1)+(%~5),(%~2)-(%~5));ctx.lineTo(%~1,%~2);ctx.lineTo(%~3,%~2); >&3
   :endbar3d1
:endbar3d
echo ctx.fill();ctx.stroke(); >&3
goto refresh

======================================================================

:circle x y radius
echo ctx.beginPath();ctx.arc(%~1,%~2,%~3,0,2*Math.PI);ctx.stroke(); >&3
goto refresh

=======================================================================

:cleardevice
echo ctx.clearRect(0,0,canvas.width,canvas.height); >&3
goto refresh

=======================================================================

void clearviewport (void);
Under development

=======================================================================

closegraph [pagenum|CURRENT_WINDOW|ALL_WINDOWS|KEEP_CURRENT_WINDOW|KEEP_ALL_WINDOWS]

Closes the graphics system and all graphics windows. This function has an optional parameter which is the page
number (given to initwindow when the window was created) of the window that is to be closed. This parameter may
also be one of these words: CURRENT_WINDOW (causing closegraph to close only the current window), or ALL_WINDOWS
(which is the default, causing closegraph to close all open graphics windows). If the current window is closed,
then there is no longer a current window and no further drawing operations may be done until a new window is
created via initgraph/initwindow or an existent window page is activated by calling setactivepage.

The parameter may also be KEEP_CURRENT_WINDOW or KEEP_ALL_WINDOWS that close the access to current or all
windows, respectively, but keep the windows open; in this case the user must manually close the windows.
All Batch-BGI programs must always call closegraph before terminate.

closegraph function body was moved to the end of this file

=======================================================================

:converttorgb color rgb=
setlocal EnableDelayedExpansion
endlocal & set "%2=!p%1!"
exit /B

=======================================================================

               void delay (int millisec); [WIN]

               void detectgraph (int *graphdriver, int *graphmode);

               void drawpoly (int numpoints, int *polypoints);

=======================================================================

void ellipse (int x, int y, int stangle, int endangle, int xradius, int yradius);
Under development

=======================================================================

void fillellipse (int x, int y, int xradius, int yradius);
Under development

=======================================================================

               void fillpoly (int numpoints, int *polypoints);

               void floodfill (int x, int y, int border);

=======================================================================

:getactivepage activepage=
set "%~1=%_activepage%"
exit /B

=======================================================================

void getarccoords (struct arccoordstype *arccoords);
Under development

=======================================================================

:getaspectratio xasp= yasp=
set /A "%~1=1, %~2=1"
exit /B

=======================================================================

:getbkcolor bkcolor=
set "%~1=%_bkcolor%"
exit /B

=======================================================================

:getcolor color=
set "%~1=%_color%"
exit /B

=======================================================================

:getdefaultpalette defaultpalette=
set "%~1=%_defaultpalette%"
exit /B

=======================================================================

:getdrivername drivername=
set "%~1=%_drivername%"
exit /B

=======================================================================

               void getfillpattern (char *pattern); 

=======================================================================

:getfillsettings struct_fillsettingstype=
set /A "%~1.pattern=_fillpattern, %~1.color=_fillcolor"
exit /B

=======================================================================

:getgraphmode graphmode=
set "%~1=%_graphmode%"
set /B

=======================================================================

               void getimage (int left, int top, int right, int bottom, void *bitmap);

=======================================================================

:getlinesettings struct_linesettingstype=
set /A "%~1.linestyle=_linestyle, %~1.upattern=_upattern, %~1.thickness=_thickness"
exit /B

=======================================================================

:getmaxcolor maxcolor=
set "%~1=%_maxcolor%"
exit /B

=======================================================================

:getmaxmode maxmode=
set "%~1=%_himode%"
exit /B

=======================================================================

:getmaxx maxx=
set "%~1=%_maxx%"
exit /B

=======================================================================

:getmaxy maxy=
set "%~1=%_maxy%"
exit /B

=======================================================================

              char* getmodename (int mode_number);

=======================================================================

:getmoderange dummydriver lomode= himode=
set /A "%2=_lomode, %3=_himode"
exit /B

=======================================================================

Return the current values in "p#" palette array as a list; this will fail if the result
is larger than 8191 chars, that is, when the palette contain more than 1023 colors

:getpalette palette=
setlocal EnableDelayedExpansion
set "p="
for /L %%i in (0,1,%_maxcolor%) do set "p=!p! !p%%i!"
endlocal & set "%~1=%p:~1%
exit /B

=======================================================================

:getpalettesize palettesize=
set "%~1=%_palettesize%"
exit /B

=======================================================================
int getpixel (int x, int y);
Not implemented
=======================================================================

:gettextsettings struct_textsettingstype=
set /A "%~1.font=_font, %~1.direction=_direction, %~1.charsize=_charsize, %~1.horiz=_horiz, %~1.vert=_vert"
exit /B

=======================================================================

               void getviewsettings (struct viewporttype *viewport);

=======================================================================

:getvisualpage visualpage=
set "%~1=_visualpage%"
exit /B

=======================================================================
int getwindowheight (void); [WIN]
Not implemented
=======================================================================
int getwindowwidth (void); [WIN]
Not implemented
=======================================================================

                int getx (void);

                int gety (void);

=======================================================================
char* grapherrormsg (int errorcode);
Not implemented
=======================================================================
int graphresult(void);
Not implemented
=======================================================================

           unsigned imagesize (int left, int top, int right, int bottom);

=======================================================================

initgraph graphdriver graphmode

Initializes the graphics system, open the graphics window and resets all graphics settings to their defaults.
The graphdriver parameter must be one of these *words* (a number is NOT valid here):
DETECT, CGA, MCGA, EGA, EGA64, EGAMONO, IBM8514, HERCMONO, ATT400, VGA, PC3270.
If the first parameter is DETECT, the initwindow subroutine with no parameters is called instead;
otherwise, the second parameter must be one of the words given below as described at:
http://www.cs.colorado.edu/~main/bgi/doc/initgraph.html
(CGAC0, CGAC1, CGAC2, CGAC3, CGAHI)  (MCGAC0, MCGAC1, MCGAC2, MCGAC3, MCGAMED, MCGAHI)
(EGALO, EGAHI)  (EGA64LO, EGA64HI)  (EGAMONOHI)  (IBM8514LO, IBM8514HI)  (HERCMONOHI)
(ATT400C0, ATT400C1, ATT400C2, ATT400C3, ATT400MED, ATT400HI)  (VGALO, VGAMED, VGAHI)  (PC3270HI)
This subroutine does NOT return any value; use getdrivername, getgraphmode and getmoderange instead.

As a (preferred) alternative, the user may call initwindow instead of initgraph.

The initgraph function body was moved to the end of this file

=======================================================================

initwindow  width=640  height=480  title="Batch-BGI"  left=-1  top=-1  page=0

This function initializes the graphics system by opening a graphics window.
All parameters are optional; the parameters and their default values are listed in the line above.
The width and height parameters specify the size of the graphics window area in pixels.
The title parameter is the title that will be printed at the top of the window.
The left and top parameters determine the screen coordinates of the left and top sides of the window;
a value less than zero (the default) indicate to let the system place the window.
The page parameter is the page number of the created window ("window page") that will be used in
setactivepage/setvisualpage subroutines in order to set which of several windows is currently being
used. You may choose any numbers you wish; all created windows should have different page numbers.
Immediately after calling initwindow, the current window is always the window that was just created. 

The initgraph function body was moved to the end of this file

=======================================================================
int installuserdriver (char *name, int huge (*detect)(void)); 
Not implemented
=======================================================================
int installuserfont (char *name); 
Not implemented
=======================================================================

:line x1 y1 x2 y2
echo ctx.beginPath();ctx.moveTo(%~1,%~2);ctx.lineTo(%~3,%~4);ctx.stroke(); >&3
goto refresh

=======================================================================

               void linerel (int dx, int dy);

=======================================================================

:lineto x y
echo ctx.lineTo(%~1,%~2);ctx.stroke(); >&3
goto refresh

=======================================================================
int mousex (void); [WIN]
Not implemented
=======================================================================
int mousey (void); [WIN]
Not implemented
=======================================================================

               void moverel (int dx, int dy);

=======================================================================

:moveto x y
echo ctx.beginPath();ctx.moveTo(%~1,%~2); >&3
exit /B

=======================================================================

               void outtext (char *textstring);

=======================================================================

To do: separate text color from lines color, and then use strokeText instead of fillText

:outtextxy x y "textstring"
echo ctx.fillText("%~3",%~1,%~2); >&3
goto refresh

=======================================================================

:pieslice x y stangle endangle radius
echo ctx.beginPath();ctx.arc(%~1,%~2,%~5,(360-(%~3))*Math.PI/180,(360-(%~4))*Math/180.PI,true);ctx.lineTo(%~1,%~2);ctx.closePath();ctx.fill(); >&3
exit /B

=======================================================================

void putimage (int left, int top, void *bitmap, int op);
Under research

=======================================================================

void putpixel (int x, int y, int color);
Under research

=======================================================================

    void readimagefile (const char* filename=NULL,
                        int left=0, int top=0, int right=INT_MAX, int bottom=INT_MAX);

=======================================================================

:rectangle left top right bottom
echo ctx.beginPath();ctx.rect(%~1,%~2,(%~3)-(%~1),(%~4)-(%~2));ctx.stroke(); >&3
goto refresh

=======================================================================
int registerbgidriver (void (*driver)(void));
Not implemented
=======================================================================
int registerbgifont (void (*font)(void));
Not implemented
=======================================================================
:restorecrtmode
exit /B
Do nothing function
=======================================================================

void sector (int x, int y, int stangle, int endangle, int xradius, int yradius);
Under development

=======================================================================

setactivepage makes page the active graphics window page.
All subsequent graphics output will be directed to that graphics window page.
If screen refresh is suspended via call :setvisualpage -1, the commands directed
to all window pages (via pipes) will be read until screen refresh is resumed.

To do: multiple "window pages" management is not fully implemented...

:setactivepage page
if defined _maxx[%~1] (
   set "_activepage=%~1"
   echo eval("activepage=%~1"); >&3
   set /A "_maxx=_maxx[%~1], _maxy=_maxy[%~1]"
)
exit /B

=======================================================================

setallpalette color0 color1 ... colorN

Each parameter of setallpalette must be an HTML color given as standard name or in #RRGGBB format.
The palette can contain *any number* of colors, that will be used via their 0..(palettesize-1) numbers.
A maximum of 395 colors can be given to this subroutine, but any number of colors may be defined via
direct Batch code. Another method to show many different colors is use a palette with less colors
(i.e. the default 16) and for each different color modify a palette entry via setrgbpalette and use it.
In Batch-BGI library, when the palette is changed the colors shown on the screen are *NOT* changed.

setallpalette subroutine body was moved to the end of this file

Below there are three extra Batch-BGI subroutines that create standard palettes.

Create a 256 colors palette with even distribution (expand one byte to three)

:get256palette palette=
setlocal EnableDelayedExpansion
set "hexa=0123456789ABCDEF"
set "p="
set i=0
for /L %%r in (0,1,7) do (
   set /A "RR=%%r*36, RH=RR>>4, RL=RR&15"
   for /F "tokens=1,2" %%i in ("!RH! !RL!") do set "RR=!hexa:~%%i,1!!hexa:~%%j,1!"
   for /L %%g in (0,1,7) do (
      set /A "GG=%%g*36, GH=GG>>4, GL=GG&15"
      for /F "tokens=1,2" %%i in ("!GH! !GL!") do set "GG=!hexa:~%%i,1!!hexa:~%%j,1!"
      for /L %%b in (0,2,6) do (
         set /A "BB=%%b*36, BH=BB>>4, BL=BB&15"
         for /F "tokens=1,2" %%i in ("!BH! !BL!") do set "BB=!hexa:~%%i,1!!hexa:~%%j,1!"
         set "p=!p! #!RR!!GG!!BB!"
         set /A i+=1
      )
   )
)
endlocal & set "%~1=%p:~1%"
exit /B

Create the standard "Web Safe Color" palette (6x6x6 Cube) with 216 colors

:get6x6x6palette palette=
setlocal EnableDelayedExpansion
set "p="
set "i=0"
for %%r in (00 33 66 99 CC FF) do (
   for %%g in (00 33 66 99 CC FF) do (
      for %%b in (00 33 66 99 CC FF) do (
         set "p=!p! #%%r%%g%%b"
         set /A i+=1
      )
   )
)
endlocal & set "%~1=%p:~1%"
exit /B

Create the 256 gray shades Black&White palette

:get256BWpalette palette=
setlocal EnableDelayedExpansion
set "p="
set "i=0"
for %%h in (0 1 2 3 4 5 6 7 8 9 A B C D E F) do (
   for %%l in (0 1 2 3 4 5 6 7 8 9 A B C D E F) do (
      set "p=!p! #%%h%%l%%h%%l%%h%%l"
      set /A i+=1
   )
)
endlocal & set "%~1=%p:~1%"
exit /B

=======================================================================
void setaspectratio (int xasp, int yasp);
Not implemented
=======================================================================

:setbkcolor color
set "_bkcolor=%~1"
call echo document.body.style.background="%%p%~1%%"; >&3
goto refresh

=======================================================================

:setcolor color
set "_color=%~1"
call echo ctx.strokeStyle="%%p%~1%%"; >&3
exit /B

=======================================================================

void setfillpattern (char *upattern, int color); 
Under research

=======================================================================

To do: define fill patterns via ctx.fillStyle=ctx.createPattern(img,"repeat");
Predefined Batch variables: EMPTY_FILL, SOLID_FILL, LINE_FILL, LTSLASH_FILL, SLASH_FILL, BKSLASH_FILL,
LTBKSLASH_FILL, HATCH_FILL, XHATCH_FILL, INTERLEAVE_FILL, WIDE_DOT_FILL and CLOSE_DOT_FILL;

:setfillstyle pattern, color
set /A "_fillpattern=%~1, _fillcolor=%~2"
call echo ctx.fillStyle="%%p%~2%%"; >&3
exit /B

=======================================================================
unsigned setgraphbufsize (unsigned bufsize); 
Not implemented
=======================================================================
:setgraphmode (int mode); 
exit /B
Do nothing function
=======================================================================

To do: define line patterns via ctx.strokeStyle=ctx.createPattern(img,"repeat");
Predefined Batch variables: SOLID_LINE, DOTTED_LINE, CENTER_LINE and DASHED_LINE;
NORM_WIDTH (1) and THICK_WIDTH (3). thickness parameter may be any value.

:setlinestyle linestyle upattern thickness
set /A "_linestyle=%~1, _upattern=%~2, _thickness=%~3"
echo ctx.lineWidth=%~3; >&3
exit /b

=======================================================================

:setpalette colornum color
set "p%1=%~2"
exit /B

=======================================================================

:setrgbpalette colornum red green blue
setlocal EnableDelayedExpansion
set "hexa=0123456789ABCDEF"
set "rgb=#"
for %%a in (%~2 %~3 %~4) do (
   set /A "H=%%a >> 4, L=%%a & 15"
   for /F "tokens=1,2" %%i in ("!H! !L!") do set "rgb=!rgb!!hexa:~%%i,1!!hexa:~%%j,1!"
)
endlocal & set "p%~1=%rgb%"
exit /B

=======================================================================

set /A LEFT_TEXT=0, CENTER_TEXT=1, RIGHT_TEXT=2,  BOTTOM_TEXT=0, TOP_TEXT=2

:settextjustify horiz vert
set /A "_horiz=%~1, _vert=%~2, _i=_horiz+1, _j=_vert+1"
for /F "tokens=%_i%" %%a in ("left center right") do echo ctx.textAlign="%%a"; >&3
for /F "tokens=%_j%" %%a in ("bottom middle top") do echo ctx.textBaseline="%%a"; >&3
exit /B

=======================================================================

http://www.w3schools.com/tags/canvas_font.asp

set /A "DEFAULT_FONT=0, TRIPLEX_FONT=1, SMALL_FONT=2, SANS_SERIF_FONT=3, GOTHIC_FONT=4, SCRIPT_FONT=5"
set /A "SIMPLEX_FONT=6, TRIPLEX_SCR_FONT=7, COMPLEX_FONT=8, EUROPEAN_FONT=9, BOLD_FONT=10"

Default values: _font="sans-serif" _charsize=10 (direction=0 ALWAYS)
To do: find a better match between BGI predefined fonts and existent Windows fonts

:settextstyle font direction charsize
set /A "_font=%~1, _direction=%~2, _charsize=%~3"
setlocal EnableDelayedExpansion
set "i=0"
for %%a in (Monospace  "Times New Roman"  Fantasy  sans-serif  Helvetica  Script
                       "Comic Sans"       Arial    Verdana     serif      Impact) do (
   if "!i!" equ "%_font%" echo ctx.font="%~3px %%~a"; >&3
   set /A i+=1
)
endlocal
exit /B

=======================================================================
void setusercharsize (int multx, int divx, int multy, int divy);
Not implemented
=======================================================================

               void setviewport (int left, int top, int right, int bottom, int clip);

=======================================================================

setvisualpage makes page the visual graphics page.
If the page is set to -1 (no visual page), the screen window refresh is suspended.
To do: multiple "window pages" management is not fully implemented yet

:setvisualpage page
set "_visualpage=%~1"
echo eval("visualpage=%~1"); >&3
exit /B

=======================================================================

               void setwritemode (int mode);

=======================================================================

                int textheight (char *textstring);

=======================================================================

This is a special function that currently can only be called as a *real JScript function*, that is,
included in an expression. For example: call :outtextxy  (%_maxx%-textwidth("%text%"))/2  %_maxy%/2  "%text%"

                int textwidth ("textstring")

=======================================================================

    void writeimagefile (const char* filename=NULL,
                         double width_inches=7, double border_left_inches=0.75, double border_top_inches=0.75,
                         int left=0, int top=0, int right=INT_MAX, int bottom=INT_MAX); [WIN]

=======================================================================

To do: multiple "window pages" management is not yet implemented; open just one window for now...

:initwindow width height title left top page
set /A "_maxx=640, _maxy=480, _left=-1, _top=-1, _page=0
set "_title=Batch-BGI"

if "%~1" neq "" set /A "_maxx=%~1, _maxy=%~2"
shift & shift
if "%~1" neq "" set "_title=%~1"
shift
if "%~1" neq "" set /A "_left=%~1, _top=%~2"
shift & shift
if "%~1" neq "" set /A "_page=%~1"

set "_drivername=Batch-BGI"
set /A "_maxpage=0, _lomode=0, _himode=0, _graphmode=0"
set /A "_maxx[%_page%]=_maxx, _maxy[%_page%]=_maxy, _visualpage=_page"
if %_page% gtr %_maxpage% "set _maxpage=%_page%"
set "_defaultpalette=Black Navy Green Teal Maroon Purple Olive Silver Gray Blue Lime Aqua Red Fuchsia Yellow White"

::  -----------------------------------------------------------------------

rem openwindow entry point is used in both initgraph and initwindow subroutines
rem To do: insert "nomovable" property in the pages of standard video modes (EGA/VGA),
rem        and test if this way the several pages can not be separated

:openwindow
if not defined BLACK (
   rem First window created in the system: define standard colors and palette
   set _i=0
   for %%a in (BLACK     BLUE       GREEN       CYAN       RED       MAGENTA       BROWN   LIGHTGRAY
               DARKGRAY  LIGHTBLUE  LIGHTGREEN  LIGHTCYAN  LIGHTRED  LIGHTMAGENTA  YELLOW  WHITE    ) do (
      set /A "%%a=_i, _i+=1"
   )
   call :setallpalette %_defaultpalette%
)

echo openwindow;%_maxx%;%_maxy%;%_title%;%_left%;%_top%;%_page%; >&3
set "_color=%_maxcolor%"
call echo ctx.strokeStyle="%%p%_maxcolor%%%"; >&3
set SOLID_FILL=1
set /A "_fillpattern=SOLID_FILL, _fillcolor=_maxcolor"
call echo ctx.fillStyle="%%p%_maxcolor%%%"; >&3
set "_bkcolor=0"
goto refresh

=======================================================================

:setallpalette color0 color1 ... colorN
setlocal EnableDelayedExpansion
set "p="
set "i=0"
for %%a in (%*) do (
   set "p=!p!& set "p!i!=%%a" "
   set /A i+=1
)
endlocal & set "_palettesize=%i%" & %p:~1%
set /A "_maxcolor=_palettesize-1"
exit /B

=======================================================================

To do: several "window pages" management is not yet implemented, just KEEP_CURRENT_WINDOW parameter

:closegraph [pagenum|CURRENT_WINDOW|ALL_WINDOWS|KEEP_CURRENT_WINDOW|KEEP_ALL_WINDOWS]
if "%~1" equ "KEEP_CURRENT_WINDOW" (
   echo ignorekey=function (^) { }; window.onkeydown=ignorekey; >&3
) else (
   echo window.close(^); >&3
)
echo/>&3
exit /B

=======================================================================

Common exit point: request refresh window contents after all drawing functions

:refresh
echo/>&3
exit /B

=======================================================================

:: Batch-BGI library: End Of File