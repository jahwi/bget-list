:: ADVENTURE.BAT - A pure batch implementation of the classic game
::                 by Will Crowther and Don Woods
::
::                 Batch implementation by Dave Benham.
:: ---------------------------------------------------------------
:: This game is derived from the FORTRAN source code distributed
:: with Ken Plotkin's port to the PC. Ken's port was a port of the
:: DECUS Program 11-340 port done by Kent Blackett and Bob Supnik.
:: ---------------------------------------------------------------
:: Release History:
::
:: 1.6   2015/03/27
::  - Fixed a pit fall detection bug that made it too easy to fall into a pit.
::
:: 1.5   2013/10/30
::  - Do not PAUSE at end if launched from within a command console
::    (Not 100% accurate test, but good enough)
::
:: 1.4   2013/10/27
::  - Fixed multiple end-game bugs by fixing end-game mechanics of toted items.
::
:: 1.3   2013/08/28
::  - Disabled debug commands when running encrypted version.
::
:: 1.2   2013/08/28
::  - Fixed a bug on XP that caused LOAD to give a bogus error message.
::    The bug stemmed from the fact that SET "VAR=" sets ERRORLEVEL to 1 on XP.
::
:: 1.1   2013/08/26
::  - Fixed spelling of "infromation"
::  - Added PAUSE at end of game
::
:: 1.0   2013/08/25
::  - Initial release

::::BgetDescription#A pure batch implementation of the classic game-Adventure.
::::BgetAuthor#DaveBenham
::::BgetCategory#game
::::Bgettags#rpg


@echo off
if "%~1" equ ":modFile" goto :modFile

cls
<nul set /p "=Initializing "

::{ Inevnoyr qrsvavgvbaf:
::
:: @kkkkk = znpeb qrsvavgvba
:: $kkkkk = fgngvp inyhr, hfhnyyl qrevirq sebz qngnonfr
:: #kkkkk = qlanzvp inyhr arrqrq sbe fnir svyrf
:: kkkkk  = qlanzvp inyhr bs grzc vzcbegnapr
::
:: ${Boshfpngrq}    {qrsvarq bayl vs gur pbqr unf orra boshfpngrq
:: ${CynprPag}      {Ahzore bs ybpngvbaf (ernyyl n znk inyhr)
:: ${bowPag}        {Ahzore bs bowrpgf (ernyyl n znk inyhr)
:: ${enaxPag}       {Ahzore bs enaxf
:: ${uvagZnk}       {Znkvzhz uvag ahzore
:: ${zvaGernfher}   {Zva bowrpg VQ sbe gerfher.
:: ${znkGernfher}   {Znk bowrpg VQ sbe gernfher.
:: ${ybatQrfp}.N    {Ybat qrfpevcgvba ng ybpngvba A
:: ${fubegQrfp}.N   {Fubeg qrfpevcgvba ng ybpngvba A
:: ${geniry}.L.M    {Fcnpr qryvzvgrq yvfg bs pbaqvgvbany qrfgvangvbaf sbe ybpngvba Y jvgu zbir Z
:: ${cynprPbaq}.N   {Ovanel ovg neenl ercerfragvat pbaqvgvbaf ng ybpngvba A
:: ${zbir.kkkk}     {Zbirzrag gbxra VQ sbe jbeq kkkk
:: ${abha.kkkk}     {Abha gbxra VQ sbe jbeq kkkk
:: ${kkkk2}         {VQ sbe cunagbz frpbaq bowrpg (ebq2, cynag2, gebyy2)
:: ${ireo.kkkk}     {Ireo gbxra VQ sbe jbeq kkkk
:: ${fcrpvny.kkkk}  {Fcrpvny gbxra VQ sbe jbeq kkkk
:: ${bowrpg}.N      {Vairagbel qrfpevcgvba bs bowrpg A
:: ${bowrpg}.N.P    {Qrfpevcgvba sbe bowrpg A va fgngr (jvgu cebcregl) C
:: ${zrffntr}.N     {Grkg sbe zrffntr A
:: ${bowCynpr}.N    {Vavgvny ybpngvba bs bowrpg A.
:: ${bowSvkrq}.N    {Vavgvny svkrq pbaqvgvbaf sbe bowrpg A. -1=svkrq, 0=zbirnoyr, >0=svkrq va 2aq ybpngvba
:: ${ireoQrsnhyg}.N {Qrsnhyg zrffntr sbe ireo A
:: ${enaxFpber}.N   {Znk fpber sbe enax A
:: ${enaxGrkg}.N    {Qrfpevcgvba sbe enax A
:: ${uvagOvg}.N     {Cynpr pbaqvgvba ovg sbe uvag A
:: ${uvagGheaf}.N   {Gheaf erdhverq gb npgvingr uvag A
:: ${uvagQrqhpg}.N  {Fpber cranygl sbe npprcgvat uvag A
:: ${uvagCebzcg}.N  {Cebzcg gb frr vs cynlre jnagf uvag A
:: ${uvagGrkg}.N    {Zrffntr VQ sbe uvag A
:: ${purfgYbp}      {Riraghny ybpngvba bs cvengr'f purfg
:: ${iraqYbp}       {Ybpngvba bs iraqvat znpuvar znmr
:: ${qjnesPag}      {Vavgvny ahzore bs qjneirf. Gur ynfg qjnes vf gur cvengr.
:: ${qjnesNygYbp}   {Nygreangr qjnes fgnegvat ybpngvba va pnfr bs pbyyvfvba
:: ${erqverpgvba)   {fgqbhg erqverpgvba
:: ${fnirAnzr}      {Anzr bs fnir svyr
::
:: #{FnirIrefvba}   {Irefvba ahzore bs fnirq tnzr sbezng - ernyyl n pbafgnag
::
:: #{cynprBowf}.N   {Fcnpr qryvzvgrq yvfg bs bowrpgf ng ybpngvba A, jvgu yrnqvat naq genvyvat fcnprf.
::                   Bowrpg >100 vs ng nygreangr svkrq ybpngvba.
:: #{cynprNooe}.N   {Ahzore bs gvzrf gur fubeg qrfpevcgvba unf orra yvfgrq
:: #{bowCynpr}.N    {Pheerag ybpngvba bs bowrpg A.  0=abjurer (qrfgeblrq)  -1=gbgvat
:: #{bowSvkrq}.N    {Pheerag svkrq pbaqvgvbaf sbe bowrpg A. -1=svkrq, 0=zbirnoyr, >0=svkrq va 2aq ybpngvba
:: #{bowCebc}.N     {Pheerag fgngr bs bowrpg A. -1=hasbhaq sbe gernfherf
:: #{uvagGheaf}.N   {Ahzore bs gheaf haqre uvag pbaqvgvbaf fvapr ynfg uvag bssre sbe uvag A
:: #{uvagrq}.N      {1 vs uvag A jnf npprcgrq, 0 vs abg npprcgrq be abg bssrerq lrg
:: #{abgSbhaqPag}   {Ahzore bs gernfherf lrg gb or sbhaq
:: #{ybfgPag}       {Ahzore bs gernfherf gung pnaabg or sbhaq
:: #{qjnesYbp}.N    {Pheerag ybpngvba bs qjnes A
:: #{qjnesByqYbp}.N {Cevbe ybpngvba bs qjnes A
:: #{qjnesFrra}.N   {1 vs qjnes A vf sbyybjvat cynlre, 0 vs abg
:: #{qjnesFgngr}    {Pheerag fgngr bs qjnes cebprffvat.
::                    0   Ab qjnes fghss lrg (jnvg hagvy ernpu unyy bs zvfgf)
::                    1   Ernpurq unyy bs zvfgf, ohg unfa'g zrg svefg qjnes
::                    2   Zrg svefg qjnes, bguref fgneg zbivat, ab xavirf guebja lrg
::                    3   N xavsr unf orra guebja (svefg frg nyjnlf zvffrf)
::                    >3  Qjneirf ner znq (vapernfrf gurve npphenpl)
::
:: ${svkrqGEBYY}    {Gebyy VQ + 100
:: ${svkrqGEBYY2}   {Gebyy2 VQ + 100
:: ${bvyJngre}      {Hfrq gb grfg vs gbxra vf bvy be jngre
:: ${qbbeCynag}     {hfrq gb grfg vs gbxra vf qbee be cynag
:: ${znkQvr}        {Znkvzhz ahzore bs qrnguf
:: #{nooAhz}        {Ubj bsgra gb cevag fubeg qrfpevcgvba orsber ybat qrfpevcgvba, 0 = nyjnlf fubeg

:: #{gheaf}         {Ahzore bs gheaf gnxra
:: #{ynzcYbj}       {1 = ynzc vf ybj, 0 = ynzc bx
:: #{ynzcYvsr}      {Gheaf yrsg va ynzc
:: #{xavsrYbp}      {Ybpngvba bs xavsr
:: #{ynzcJnea}      {1 vs ybj onggrel jneavat unf orra tvira, 0 vs abg
:: #{qrgnvyPag}     {Ahzore bs gvzrf fnvq "Abg nyybjrq gb tvir zber qrgnvy"
:: #{qvrPag}        {Ahzore bs qrnguf
:: #{ubyqPag}       {Pbhag bs bowrpgf va vairagbel
:: #{qrnqQjnesPag}  {Ahzore bs xvyyrq qjneirf
:: #{sbbPag}        {Pheerag fgngr bs "Srr Svr Sbr Sbb"
:: #{obahf}         {Hfrq gb qrgrezvar obahf ng pybfvat
:: #{pybpx1}        {Ahzore bs gheaf sebz ynfg gernfher sbhaq hagvy pybfvat
:: #{pybpx2}        {Ahzore bs gheaf sebz svefg jneavat hagvy oyvaqvat synfu

:: #{pybfvat}       {1 = Gvzr gb pybfr, 0 = Abg gvzr gb pybfr
:: #{cnavp}         {1 = Ur xabjf ur'f genccrq va pnir, 0 = bgurejvfr
:: #{pybfrq}        {1 = Gur pnir vf pbzcyrgryl pybfrq, 0 = bgurejvfr
:: #{tnirhc}        {1 = Ur dhvg, 0 = bgurejvfr
:: #{fpbevat}       {1 = Rkrphgvat n fpber pbzznaq, 0 = bgurejvfr
:: #{jnfQnex}       {1 = Ur'f pbzvat sebz n qnex ybpngvba, 0 = bgurejvfr

:: #{ybp}           {Pheerag ybpngvba
:: #{arjybp}        {Arj ybpngvba
:: #{byqybp}        {Cerivbhf ybpngvba
:: #{byqybp2}       {Ybpngvba 2 zbirf ntb


:: {pzq}       {Gur pheerag pbzznaq nf gur hfre glcrq vg, rkprcg ! fgevccrq gb nibvq pbeehcgvba
:: {jbeq1}     {Gur svefg jbeq sebz gur pbzznaq, nsgre abeznyvmngvba
:: {jbeq2}     {Gur frpbaq jbeq sebz gur pbzznaq, nsgre abeznyvmngvba
:: {jbeq3}     {Gur erznvaqre bs gur grkg vs zber guna gjb jbeqf va pbzznaq
:: {gbxra1}    {Gur svefg 5 punenpgref bs jbeq1
:: {gbxra2}    {Gur svefg 5 punenpgref bs jbeq2
:: {zbir}      {Gur zbirzrag VQ bs gur pbzznaq
:: {abhaNhk}   {Gur nhkvyyvnel bowrpg VQ pbagnvarq jvguva gur cevznel bowrpg
:: {abha}      {Gur bowrpg VQ bs gur pbzznaq
:: {abhaGkg}   {Gur bowrpg grkg npghnyyl ragrerq
:: {ireo}      {Gur npgvba VQ bs gur pbzznaq
:: {ireoGrkg}  {Gur npgvba grkg npghnyyl ragrerq
:: {fcrpvny1}  {Gur fcrpvny VQ vs gbxra1 vf fcrpvny
:: {fcrpvny2}  {Gur fcrpvny VQ vs gbxra2 vf fcrpvny
::
::}

:: Make sure we start with a clean slate
setlocal disableDelayedExpansion
for /f "eol== delims==" %%V in ('set^|findstr /rc:"^[^=]*!"') do set "%%V="
set "preserve= TEMP TMP PATH PATHEXT COMSPEC PRESERVE "
setlocal enableDelayedExpansion
for /f "eol== delims==" %%V in ('set') do (
  if defined %%V if "!preserve: %%V =!" equ "!preserve!" set "%%V="
)
set "preserve="

:: define macros
setlocal disableDelayedExpansion

:: @{vs}  var
::{ Gehr vs inyhr bs ine vf 1 (abg 0), Snyfr vs 0 }
set @{vs}=for %%. in (1 2) do if %%.==2 (2^>nul set /a "1/!arg: =!") else set arg=

:: @{cpg}  N
::{ Gehr vs enaqbz ahzore vf yrff guna A creprag }
set @{cpg}=for %%. in (1 2) do if %%.==2 (2^>nul set /a "1/((!random!%%100+1)/(100-arg+1))") else set arg=

:: @{gbgvat}  {bow}
::{ Gehr vs pneelvat bow }
set @{gbgvat}=for %%. in (1 2) do if %%.==2 (2^>nul set /a "1/^!(#{bowCynpr}.!arg: =!+1)") else set arg=

:: @{urer}  {bow}
::{ Gehr vs pneelvat bow be bow vf ng pheeerag ybpgngvba }
set @{urer}=for %%. in (1 2) do if %%.==2 (2^>nul set /a "1/^!((#{bowCynpr}.!arg: =!+1)*(#{bowCynpr}.!arg: =!-#{ybp}))") else set arg=

:: @{ng}  {bow}
::{ Gehr vs svkrq bowrpg vf ng pheerag ybpngvba }
set @{ng}=for %%. in (1 2) do if %%.==2 (2^>nul set /a "1/^!((#{bowCynpr}.!arg: =!-#{ybp})*(${bowSvkrq}.!arg: =!-#{ybp}))") else set arg=

:: @{qnex}
::{ Gehr vs vg vf qnex ng pheerag ybpngvba }
set @{qnex}=(2^>nul set /a "1/^!((${cynprPbaq}.!#{ybp}!%%2)|#{bowCebc}.!${abha.ynzc}!&^!((#{bowCynpr}.!${abha.ynzc}!-#{ybp})*(#{bowCynpr}.!${abha.ynzc}!+1)))")

:: @{sbeprq}  {ybp}
::{ Gehr vs ybp unf sbeprq zbirzrag }
set @{sbeprq}=for %%. in (1 2) do if %%.==2 (2^>nul set /a "1/^!(${cynprPbaq}.!arg: =!-2)") else set arg=

:: @{vfCynprPbaq}  {ybp}  {ovg}
::{ Gehr vs pbaqvgvba ovg vf frg ng ybp }
set @{vfCynprPbaq}=for %%. in (1 2) do if %%.==2 (for /f "tokens=1,2" /f %%1 in ("!args!") do 2^>nul set /a "1/(${cynprPbaq}.%%1&1<<%%2)") else set args=

:: @{obggyrYvdhvq}  rtn
::{ Frg ega gb bowrpg ahzore bs obggyr pbagragf, 0 vs abar }
set @{obggyrYvdhvq}=for %%. in (1 2) do if %%.==2 (set /a "!arg!=#{bowCebc}.!${abha.obggy}!,!arg!=${abha.jngre}*^!!arg!+${abha.bvy}*^!(!arg!-2)") else set arg=

:: @{cynprYvdhvq}  rtn
::{ Frg ega gb bowrpg ahzore bs yvdhvq ng pheerag ybpngvba, 0 vs abar }
set @{cynprYvdhvq}=for %%. in (1 2) do if %%.==2 (set /a "!arg!=${cynprPbaq}.!#{ybp}!,!arg!=(^!^!(!arg!&4)*(${abha.jngre}*^!(!arg!&2)+${abha.bvy}*^!^!(!arg!&2)))") else set arg=

:: Define CR as Carriage Return
for /f %%C in ('copy /Z "%~dpf0" nul') do set "CR=%%C"

:: Define LF as a Line Feed (newline) string
set LF=^


::Above 2 blank lines are required - do not remove

::define a newline with line continuation
set ^"\n=^^^%LF%%LF%^%LF%%LF%^^"

:: @{pyeRee}
::{  Frgf gur REEBEYRIRY gb 0 }
set "@clrErr=(call )"

:: @{whttyr}  {bow}
::{ Zbir gur bow gb gur urnq bs gur yvfg ng vgf pheerag ybpngvba }
set @{whttyr}=for %%. in (1 2) do if %%.==2 (%\n%
  set /a "arg=(arg), arg100=arg+100"%\n%
  set /a "{ybp}=#{bowCynpr}.!arg!, {svk}=#{bowSvkrq}.!arg!"%\n%
  for /f "tokens=1-4" %%A in ("!arg! !{ybp}! !arg100! !{svk}!") do (%\n%
    endlocal%\n%
    set "#{cynprBowf}.%%B= %%A!#{cynprBowf}.%%B: %%A = !"%\n%
    if %%D gtr 0 set "#{cynprBowf}.%%D= %%C!#{cynprbowf}.%%D: %%C = !"%\n%
  )%\n%
) else setlocal^&set arg=

:: @{zbir}  {bow}  {ybp}
::{
::  Zbir bowrpg bow gb ybpngvba ybp, cynpvat gur bow ng gur urnq bs gur ybpngvba yvfg.
::  Nyfb erzbir bow sebz gur sbezre ybpngvba yvfg.
::  bow < 100 vaqvpngrf abezny zbinoyr bowrpg
::    ybp = 0 vaqvpngrf haninvynoyr (qrfgeblrq)
::    ybp = -1 vaqvpngrf gbgvat (frys)
::  bow >= 100 vaqvpngrf svkrq bowrpg va 2aq ybpngvba
::    ybp = 0 vaqvpngrf bowrpg ab ybatre svkrq, qb abg cynpr bow ng urnq bs ybpngvba yvfg.
::    ybp = -1 vaqvpngrf svkrq va fvatyr ybpngvba, qb abg cynpr bow ng urnq bs ybpngvba yvfg
::}
set @{zbir}=for %%. in (1 2) do if %%.==2 (for /f "tokens=1,2 delims= " %%1 in ("!args!") do (%\n%
  if %%1 lss 100 (%\n%
    set /a "{zbir.byqYbp}=#{bowCynpr}.%%1, #{bowCynpr}.%%1=%%2"%\n%
    for %%O in (!{zbir.byqYbp}!) do set "#{cynprBowf}.%%O=!#{cynprBowf}.%%O: %%1 = !"%\n%
    set "#{cynprBowf}.%%2= %%1!#{cynprBowf}.%%2!"%\n%
  ) else (%\n%
    set /a "{zbir.bow100}=%%1-100"%\n%
    set /a "{zbir.byqYbp}=#{bowSvkrq}.!{zbir.bow100}!, #{bowSvkrq}.!{zbir.bow100}!=%%2"%\n%
    for %%O in (!{zbir.byqYbp}!) do set "#{cynprBowf}.%%O=!#{cynprBowf}.%%O: %%1 = !"%\n%
    if %%2 gtr 0 set "#{cynprBowf}.%%2= %%1!#{cynprBowf}.%%2!"%\n%
  )%\n%
)) else set args=


:: {Vavgvnyvmr}

setlocal enableDelayedExpansion
set "}="
set "{="}
set "${erqverpgvba}=>"
set "${fnirAnzr}=%{%nqiragher.fni%}%"
set "#{fnirIrefvba}=1"
set "${hccre}=ABCDEFGHIJKLMNOPQRSTUVWXYZ"
set "${ybjre}=abcdefghijklmnopqrstuvwxyz"
for /l %%A in (0 1 25) do (
  set /a "B=(%%A+13)%%26"
  for /f %%B in ("!B!") do (
    set "${hccre}!${hccre}:~%%A,1!=!${hccre}:~%%B,1!"
    set "${ybjre}!${ybjre}:~%%A,1!=!${ybjre}:~%%B,1!"
  )
)
set "${Boshfpngrq}="
set "{BoshfpngvbaGrfg}={N}"
if "!{BoshfpngvbaGrfg}:A=!" equ "!{BoshfpngvbaGrfg}!" set "${Boshfpngrq}=%{%_fep%}%"

:: Load database
set "BANG=^!"
set "section="
set "type0={zbir"   }
set "type1={abha"   }
set "type2={ireo"   }
set "type3={fcrpvny"}
set /a "${CynprPag}=${bowPag}=${enaxPag}=0"
for /f "delims=:" %%N in ('findstr /nlbc:":: Begin Database " "%~f0"') do set /a "skip=%%N"
set "search=^!"
set "replace=^!BANG^!"
set /a "${zvaGernfher}=50, ${znkGernfher}=${zvaGernfher}-1"
<nul set /p "=. "
for /f "eol=: delims=, tokens=1*" %%A in ('^""%~f0" :modFile "%~f0" %skip% search replace^"') do (
  if not defined section (
    set "section=%%A"
    <nul set /p "=. "
  ) else if %%A lss 0 (
    set "section="
  ) else (

    %={ Ybpngvba Ybat Qrfpevcgvbaf }=%
    if !section! equ 1 (
      if defined ${ybatQrfp}.%%A (set delim=\) else (set delim=)
      set "${ybatQrfp}.%%A=!${ybatQrfp}.%%A!!delim!%%B"
      set "#{cynprBowf}.%%A= "
      set "${cynprPbaq}.%%A=0"
      set "#{cynprNooe}.%%A=0"
      set "${CynprPag}=%%A"
    )

    %={ Ybpngvba Fubeg Qrfpevcgvbaf }=%
    if !section! equ 2 (
      set "${fubegQrfp}.%%A=%%B"
    )

    %={ Geniry Ehyrf }=%
    if !section! equ 3 (
      %={ pbaq=P enjYbp2=Q ireoYvfg=R ybp2=S ireo=T }=%
      for /f "delims=, tokens=1,2*" %%C in ("%%B") do (
        for /f "delims=0 tokens=*" %%F in ("%%D") do (
          for %%G in (%%E) do (
            if %%G neq 0 (
              set "{ybp}=%%F"
              if not defined {ybp} set "{ybp}=0"
              set "${geniry}.%%A.%%G=!${geniry}.%%A.%%G! !{ybp}!:%%C"
              if %%A geq 15 if !{ybp}! geq 15 if !{ybp}! leq 300 if %%G neq 1 if %%C neq 100 (
                if not defined ${qjnesGeniry}.%%A set "${qjnesGeniry}.%%A= "
                if "!${qjnesGeniry}.%%A: %%F =!" equ "!${qjnesGeniry}.%%A!" set "${qjnesGeniry}.%%A=!${qjnesGeniry}.%%A!%%F "
              )
            )
          )
        )
      )
    )

    %={ Ibpnohynel Jbeqf }=%
    if !section! equ 4 (
      for /f "delims=, " %%C in ("%%B") do (
        set /a "type=%%A/1000, val=%%A%%1000"
        for %%D in (!type!) do if not defined $!type%%D!.%%C} (
          set "$!type%%D!.%%C}=!val!"
        ) else (
          set "${%}%%%C2}=!val!"
        )
      )
    )

    %={ Bowrpg Qrfpevcgvbaf }=%
    if !section! equ 5 (
      if %%A gtr 0 if %%A lss 100 (
        set "{bow}=%%A"
        set "${bowrpg}.%%A=%%B"
        set /a "#{bowCebc}.%%A=0"
        if %%A geq %${zvaGernfher}% (
          set /a "#{abgSbhaqPag}+=1, #{bowCebc}.%%A=-1, ${znkGernfher}+=1"
        )
      )
      if !{bow}! neq %%A (
        set /a "{cebc}=%%A/100"
        for /f "tokens=1,2" %%O in ("!{bow}! !{cebc}!") do (
          if defined ${bowrpg}.%%O.%%P (set delim=\) else (set delim=)
          set "${bowrpg}.%%O.%%P=!${bowrpg}.%%O.%%P!!delim!%%B"
        )
      )
    )

    %={ Zrffntrf }=%
    if !section! equ 6 (
      if defined ${zrffntr}.%%A (set delim=\) else (set delim=)
      set "${zrffntr}.%%A=!${zrffntr}.%%A!!delim!%%B"
    )

    %={ Bowrpg Fgneg Ybpngvbaf }=%
    if !section! equ 7 (
      for /f "tokens=1-2 delims=, " %%C in ("%%B") do (
        set "C=%%C"
        set "D=%%D"
        set /a "${bowCynpr}.%%A=#{bowCynpr}.%%A=C,${bowSvkrq}.%%A=#{bowSvkrq}.%%A=D"
      )
      set "${bowPag}=%%A"
    )

    %={ Qrsnhyg Npgvbaf }=%
    if !section! equ 8 (
      set "${ireoQrsnhyg}.%%A=%%B"
    )

    %={ Ybpngvba Pbaqvgvbaf }=%
    if !section! equ 9 (
      for %%C in (%%B) do set /a "${cynprPbaq}.%%C|=1<<%%A"
    )

    %={ Fpber Enaxvat }=%
    if !section! equ 10 (
      set /a ${enaxPag}+=1
      set "${enaxFpber}.!${enaxPag}!=%%A"
      set "${enaxGrkg}.!${enaxPag}!=%%B"
    )

    %={ Uvag Ehyrf }=%
    if !section! equ 11 (
      for /f "delims=, tokens=1-4" %%C in ("%%B") do (
        set "${uvagZnk}=%%A"
        set "${uvagGheaf}.%%A=%%C"
        set "${uvagQrqhpg}.%%A=%%D"
        set "${uvagCebzcg}.%%A=%%E"
        set "${uvagGrkg}.%%A=%%F"
        set "#{uvagGheaf}.%%A=0"
        set "#{uvagrq}.%%A=0"
      )
    )
  )
)
<nul set /p "=. "

::{ Rfgnoyvfu yvfg bs bowrpgf ng rnpu ybpngvba }
set "#{cynprBowf}.-1= "
for /l %%N in (!${bowPag}! -1 1) do for %%P in (!${bowSvkrq}.%%N!) do if %%P neq 0 for %%Q in (!#{bowCynpr}.%%N!) do (
  set /a N=%%N+100
  if %%P gtr 0 set "#{cynprBowf}.%%P= !N!!#{cynprBowf}.%%P!"
  set "#{cynprBowf}.%%Q= %%N!#{cynprBowf}.%%Q!"
)
for /l %%N in (!${BowPag}! -1 1) do for %%P in (!#{bowCynpr}.%%N!) do if !${bowSvkrq}.%%N! equ 0 (
  set "#{cynprBowf}.%%P= %%N!!#{cynprBowf}.%%P!"
)

::{ Rfgnoyvfu sbeprq zbir ybpngvbaf }
for /f "tokens=2 delims=." %%N in (
  'set ${geniry}.^|findstr /rc:"^\${geniry}\..*\.1="'
) do set "${cynprPbaq}.%%N=2"

::{ Vavgvnyvmr qjneirf }
set /a "${purfgYbp}=114, ${iraqYbp}=140, ${qjnesNygYbp}=18, #{qjnesFgngr}=0, ${qjnesPag}=0"
for %%A in (
  19 27 33 44 64 %${purfgYbp}%
) do (
  set /a "${qjnesPag}+=1"
  set /a "#{qjnesYbp}.!${qjnesPag}!=#{qjnesByqYbp}.!${qjnesPag}!=%%A, #{qjnesFrra}.!${qjnesPag}!=0"
)

::{ Zvfpryynarbhf fghss }
set /a "${svkrqGEBYY}=${abha.GEBYY}+100, ${svkrqGEBYY2}=${GEBYY2}+100"
set "${bvyJngre}= !${abha.BVY}! !${abha.JNGRE}! "
set "${qbbeCynag}= !${abha.QBBE}! !${abha.CYNAG}! "
set "${znkQvr}=3"
set "#{nooAhz}=5"
set "#{gheaf}=0"
set "#{ybfgPag}=0"
set "#{ynzcYbj}=0"
set "#{ynzcYvsr}=330"
set "#{ynzcJnea}=0"
set "#{xavsrYbp}=0"
set "#{qrgnvyPag}=0"
set "#{qvrPag}=0"
set "#{ubyqPag}=0"
set "#{qrnqQjnesPag}=0"
set "#{sbbPag}=0"
set "#{obahf}=0"
set "#{pybpx1}=30"
set "#{pybpx2}=50"
set "#{pybfvat}=0"
set "#{cnavp}=0"
set "#{pybfrq}=0"
set "#{tnirhc}=0"
set "#{fpbevat}=0"
set "#{jnfQnex}=0"

::{ Qbar Vavgvnyvmngvba }
cls

::{ Frg fgneg }
set /a "#{byqYbp}=#{byqYbp2}=#{ybp}=#{arjybp}=1"
call :{lrf} 65 1 0 && (
  set "#{ynzcYvsr}=1000"
  set "#{uvagrq}.3=1"
)

:{znvaYbbc}

if !#{pybfvat}! equ 1 if !#{arjybp}! lss 9 if !#{arjybp}! neq 0 (
  call :{jevgrZft} 130
  set "#{arjybp}=!#{ybp}!"
  if !#{cnavp}! equ 0 set /a "#{cnavp}=1, #{pybpx2}=15"
)

::{ Purpx vs n qjnes vf oybpxvat }
if !#{arjybp}! neq !#{ybp}! (%@{sbeprq}% !@{ybp}!) || (%@{vfCynprPbaq}% !#{ybp}! 3) || (
  for /l %%N in (1 1 5) do if !#{qjnesByqYbp}.%%N! equ !#{arjybp}! if !#{qjnesFrra}.%%N! equ 1 (
    set /a "#{arjybp}=#{ybp}"
    call :{jevgrZft} 2
    goto :{raqQjnesOybpxPurpx}
  )
)
:{raqQjnesOybpxPurpx}

::{ Rfgnoyvfu cynlre'f arj ybpngvba }
set /a "#{ybp}=#{arjybp}"

::{ Vtaber qjneirf vs qrnq, vs ybpngvba unf sbeprq zbirzrag, be vs ybpngvba sbeovqf qjneirf }
if !#{ybp}! equ 0 goto :{qrfpevorYbpngvba}
(%@{sbeprq}% !#{ybp}!) && goto :{qrfpevorYbpngvba}
(%@{vfCynprPbaq}% !#{ybp}! 3) && goto :{qrfpevorYbpngvba}

::{ Npgvingr qjneirf jura Unyy bs Zvfgf vf ernpurq }
if !#{qjnesFgngr}! equ 0 (
  if !#{ybp}! geq 15 set /a #{qjnesFgngr}=1
  goto :{qrfpevorYbpngvba}
)

::{ Purpx sbe naq unaqyr vavgvny qjnes rapbhagre }
if !#{qjnesFgngr}! equ 1 (
  if !#{ybp}! lss 15 goto :{qrfpevorYbpngvba}
  (%@{cpg}% 95) && goto :{qrfpevorYbpngvba}
  set /a #{qjnesFgngr}=2
  for /l %%N in (1 1 2) do (
    set /a D=!random!%%5+1
    (%@{cpg}% 50) && set /a "#{qjnesYbp}.!D!=0
  )
  for /l %%N in (1 1 5) do (
    if !#{qjnesYbp}.%%N! equ !#{ybp}! set /a #{qjnesYbp}.%%N=${qjnesNygYbp}
    set /a #{qjnesByqYbp}.%%N=#{qjnesYbp}.%%N
  )
  call :{jevgrZft} 3
  %@{zbir}% !${abha.NKR}! !#{ybp}!
  goto :{qrfpevorYbpngvba}
)

::{ Vavgvnyvmr qjnes rapbhagref sbe guvf ghea }
set /a "{qjnesPag}={nggnpx}={fgvpx}={sbhaqGernfher}={fgrny}=0"

::{ Enaqbzyl zbir qjneirf naq cvengr, ybbx sbe rapbhagref, rgp. }
for /l %%D in (1 1 6) do if !#{qjnesYbp}.%%D! neq 0 for /f "tokens=1,2" %%A in ("!#{qjnesByqYbp}.%%D! !#{qjnesYbp}.%%D!") do (

  %{= Rfgnoyvfu yvfg bs cbgragvny qrfgvangvbaf =}%
  set /a "{ybp}.0=%%A, {ybpPag}=1"
  for %%L in (!${qjnesGeniry}.%%B!) do if %%L neq %%A if %%L neq %%B 2>nul set /a "1/(6-%%D+^!(${cynprPbaq}.%%L&8))" && set /a "{ybp}.!{ybpPag}!=%%L, {ybpPag}+=1"

  %{= Enaqbzyl fryrpg n qrfgvangvba =}%
  set /a "N=!random!%%{ybpPag}, #{qjnesByqYbp}.%%D=%%B"
  set /a "#{qjnesYbp}.%%D={ybp}.!N!"

  %{= Qrgrezvar vs qjnes/cvengr frrf cynlre naq vs fb, gura sbyybj cynlre naq cbgragvnyyl gnxr npgvba =}%
  if %%D equ 6 if !#{abgSbhaqPag}! equ 1 if !#{bowCynpr}.%${abha.ZRFFN}%! equ 0 (%@{cpg}% 15) && set "#{qjnesFrra}.%%D=1"
  if !#{ybp}! lss 15 set "#{qjnesFrra}.%%D=0"
  if !#{ybp}! equ !#{qjnesYbp}.%%D! set "#{qjnesFrra}.%%D=1"
  if !#{ybp}! equ !#{qjnesByqYbp}.%%D! set "#{qjnesFrra}.%%D=1"
  if !#{qjnesFrra}.%%D! equ 1 (
    set /a "#{qjnesYbp}.%%D=#{ybp}"
    if %%D lss 6 (

      %{= Qjnes npgvbaf =}%
      set /a "{qjnesPag}+=1"
      if !#{qjnesByqYbp}.%%D! equ !#{qjnesYbp}.%%D! (
        set /a "{nggnpx}+=1, {ebyy}=!random!%%1000, N=95*(#{qjnesFgngr}-2)"
        if !#{xavsrYbp}! geq 0 set "#{xavsrYbp}=!#{ybp}!"
        if !{ebyy}! lss !N! set /a "{fgvpx}+=1"
      )

    ) else if !#{ybp}! neq !${purfgYbp}! if !#{bowCebc}.%${abha.PURFG}%! lss 0 (

      %{= Cvengr npgvbaf =}%
      for /l %%O in (!${zvaGernfher}! 1 !${znkGernfher}!) do (
        if !#{bowCynpr}.%%O! equ -1 (
          set /a "{fgrny}+=1, {sbhaqGernfher}=1"
          if %%O equ !${abha.CLENZ}! (
            if !#{ybp}! equ !${bowCynpr}.%${abha.RZREN}%! set /a {fgrny}-=1
            if !#{ybp}! equ !${bowCynpr}.%${abha.CLENZ}%! set /a {fgrny}-=1
          )
        )
        if !#{bowCynpr}.%%O! equ !#{ybp}! set /a "{sbhaqGernfher}=1"
      )
      2>nul set /a "1/(#{abgSbhaqPag}-#{ybfgPag}-1)" || if !{sbhaqGernfher}! equ 0 if !#{bowCynpr}.%${abha.PURFG}%! equ 0 if !#{bowCebc}.%${abha.YNZC}%! equ 1 (%@{urer}% !${abha.YNZC}!) && set "{fgrny}=-1"

    )
  )
)
:{raqQjnesZbirzrag}

::{ Pbzcyrgr cvengr npgvbaf }
if !{fgrny}! neq 0 (
  %{= Fraq gur qjnes gb uvf uvqrl ubyr =}%
  set /a "#{qjnesYbp}.6=#{qjnesByqYbp}.6=${purfgYbp}, #{qjnesFrra}.6=0"
  %{= Uvqr purfg vs abg nyernql qbar fb =}%
  if !#{bowCynpr}.%${abha.ZRFFN}%! equ 0 (
    %@{zbir}% !${abha.PURFG}! !${purfgYbp}!
    %@{zbir}% !${abha.ZRFFN}! !${iraqYbp}!
  )
  set "{fcx}=186"
  if !{fgrny}! gtr 0 (
    %={ Fgrny ybbg =}%
    set "{fcx}=128"
    for /l %%O in (!${zvaGernfher}! 1 !${znkGernfher}!) do (
      set "N=1"
      if %%O equ !${abha.CLENZ}! (
        if !#{ybp}! equ !${bowCynpr}.%${abha.RZREN}%! set "N="
        if !#{ybp}! equ !${bowCynpr}.%${abha.CLENZ}%! set "N="
      )
      if defined N (
        set "N="
        if !#{bowCynpr}.%%O! equ -1 set /a "N=1, #{ubyqPag}-=1"
        if !#{bowCynpr}.%%O! equ !#{ybp}! if !#{bowSvkrq}! equ 0 set "N=1"
      )
      if defined N %@{zbir}% %%O !${purfgYbp}!
    )
  )
  call :{jevgrZft} !{fcx}!
)

::{ Fubj qjnes erfhygf }
if !{qjnesPag}! gtr 0 (
  set "{fcx}=!${zrffntr}.4!"
  if !{qjnesPag}! gtr 1 set "{fcx}=%{%Gurer ner !{qjnesPag}!%{% guerngravat yvggyr qjneirf va gur ebbz jvgu lbh.%}%"
  call :{jevgr} {fcx}
)
if !{nggnpx}! gtr 0 (
  if !#{qjnesFgngr}! equ 2 set /a "#{qjnesFgngr}=3"
  set "{fcx}=!${zrffntr}.5!"
  set "N=52"
  if !{nggnpx}! gtr 1 (
    set "N=6"
    set "{fcx}=%{%!{nggnpx}!%{% bs gurz guebj xavirf ng lbh^!%}%"
  )
  call :{jevgrArkg} {fcx}
  if !{fgvpx}! leq 1 (
    set /a "N+={fgvpx}
    call :{jevgrArkg} ${zrffntr}.!N!
  ) else (
    set "{fcx}=%{%!{fgvpx}! of them get you^!%}%"
    call :{jevgrArkg} {fcx}
  )
  if !{fgvpx}! gtr 0 (
    set "#{byqYbp2}=!#{ybp}!"
    goto :{unaqyrQrngu}
  )
)


:{qrfpevorYbpngvba}

if !#{ybp}! equ 0 goto :{unaqyrQrngu}

::{ Vs va qroht zbqr, gura qvfcynl qjnes nggevohgrf naq pheerag ybpngvba }
if !dbug! equ 1 (
  set #{ybp}
  set #{qjnes%}%
)

if not defined ${fubegQrfp}.!#{ybp}! (set "{fcx}=${ybatQrfp}") else (
  set "{fcx}=${fubegQrfp}"
  if !#{cynprNooe}.%#{ybp}%! equ 0 set "{fcx}=${ybatQrfp}"
)
set "{fcx}=!{fcx}!.!#{ybp}!"

::{ unaqyr yrnivat qnex ybpngvba }
(%@{sbeprq}% !#{ybp}!) || %@{qnex}% && (
  if !#{jnfQnex}! equ 1 (%@{cpg}% 35) && goto :{cvgSnyy}
  set "{fcx}=${zrffntr}.16"
)

(%@{gbgvat}% !${abha.ORNE}!) && call :{jevgrZft} 141
call :{jevgr} !{fcx}!

::{ unaqyr sbeprq zbirzrag }
(%@{sbeprq}% !#{ybp}!) && (set "{zbir}=1" & goto :{zbirzrag})

::{ unaqyr CYHTU }
if !#{ybp}!==33 if !#{pybfvat}!==0 (%@{cpg}% 25) && call :{jevgrZft} 8

::{ unaqyr qnexarff }
%@{qnex}% && goto :{uvagPurpx}

set /a "#{cynprNooe}.!#{ybp}!+=1, #{cynprNooe}.!#{ybp}!%%=#{nooAhz}" 2>nul

::{ yvfg bowrpgf ng ybpngvba }
for %%O in (!#{cynprBowf}.%#{ybp}%!) do (
  set /a "{bow}=%%O %% 100"
  set /a "{cebc}=#{bowCebc}.!{bow}!"
  set "skip="
  if !{cebc}! lss 0 if !#{pybfrq}! equ 0 (
    %{= sbhaq n arj gernfher =}%
    set /a "{cebc}=1, #{abgSbhaqPag}-=1"
    if !{bow}! neq !${abha.EHT}! if !{bow}! neq !${abha.PUNVA}! set "{cebc}=0"
    set "#{bowCebc}.!{bow}!=!{cebc}!"
    %{=  mnc ynzc vs erznvavat gernfher gbb ryhfvir =}%
    if !#{abgSbhaqPag}! equ !#{ybfgPag}! if !#{abgSbhaqPag}! neq 0 if !#{ynzcYvsr}! gtr 35 set "#{ynzcYvsr}=35"
  ) else set skip=1
  if !{bow}! equ !${abha.FGRCF}! (%@{gbgvat}% !${abha.TBYQ}!) && (set skip=1) || if %%O geq 100 set "{cebc}=1"
  if not defined skip call :{jevgr} ${bowrpg}.!{bow}!.!{cebc}!
)

:{uvagPurpx}
for /l %%H in (4 1 !${uvagZnk}!) do if !#{uvagrq}.%%H! equ 0 (
  set "{qbUvag}="
  (%@{vfCynprPbaq}% !#{ybp}! %%H) && set /a "#{uvagGheaf}.%%H+=1" || set "#{uvagGheaf}.%%H=0"
  if !#{uvagGheaf}.%%H! geq !${uvagGheaf}.%%H! (
    if %%H equ 4 if !#{bowCebc}.%${abha.TENGR}%! EQU 0 (%@{urer}% !${abha.XRLF}!) || set "{qbUvag}=1"
    if %%H equ 5 if !{abha}! equ !#{abha.OVEQ}! (%@{urer}% !${abha.OVEQ}!) && (%@{gbgvat}% !${abha.EBQ}!) && set "{qbUvag}=1"
    if %%H equ 6 (%@{urer}% !${abha.OVEQ}!) || (%@{urer}% !${abha.FANXR}!) && set "{qbUvag}=1"
    if %%H equ 7 if "!{cynprBowf}.%#{ybp}%: =!" equ "" if "!{cynprBowf}.%#{byqybp}%: =!" equ "" if "!{cynprBowf}.%#{byqybp2}%: =!" equ "" if !#{ubyqPag}! gtr 1 set "{qbUvag}=1"
    if %%H equ 8 if !#{bowCebc}.%${abha.RZREN}%! neq -1 if !#{bowCebc}.%${abha.CLENZ}%! equ -1 set "{qbUvag}=1"
    if %%H equ 9 set "{qbUvag}=1"
    if defined {qbUvag} (
      set "#{uvagGheaf}.%%H=0"
      call :{lrf} !${uvagCebzcg}.%%H! 0 54 || set "{qbUvag}="
    ) else if %%H neq 5 set "#{uvagGheaf}.%%H=0"
    if defined {qbUvag} (
      call :{jevgrFge} %{%"V nz cercnerq gb tvir lbh n uvag, ohg vg jvyy pbfg lbh !${uvagQrqhpg}.%%H!%{% cbvagf."%}%
      call :{lrf} 175 !${uvagGrkg}.%%H! 54 && (
        set "#{uvagrq}.%%H=1"
        if !#{ynzcYvsr}! gtr 30 set /a "#{ynzcYvsr}+=30*${uvagQrqhpg}.%%H"
      )
    )
  )
)

::{ unaqyr fcrpvny pybfrq pnir fvghgngvbaf }
if !#{pybfrq}! equ 1 for %%O in (!#{cynprBowf}.-1!) do if !#{bowCebc}.%%O! lss 0 (
  if %%O equ !${abha.BLFGR}! call :{jevgr} ${bowrpg}.%%O.1
  set /a "#{bowCebc}.%%O=-1-#{bowCebc}.%%O"
)

set "#{jnfQnex}=0"
%@{qnex}% && set "#{jnfQnex}=1"
if !#{xavsrYbp}! gtr 0 if !#{xavsrYbp}! neq !#{ybp}! set "#{xavsrYbp}=0"

::{ znvaVachg }
call :{trgPzq}

:{xvyyQentbaYbbc}

if !#{sbbPag}! lss 0 (set #{sbbPag}=0) else set /a "#{sbbPag}*=-1"

set /a "#{gheaf}+=1"

::{ Unaqyr pnir pybfher }
if !#{abgSbhaqPag}! equ 0 if !#{ybp}! geq 15 if !#{ybp}! neq 33 2>nul set /a "1/(#{pybpx1}-=1)" || (
  set /a "#{bowCebc}.!${abha.TENGR}!=#{bowCebc}.!${abha.SVFFH}!=#{bowCebc}.!${abha.PUNVA}!=#{bowCebc}.!${abha.NKR}!=#{bow.Svkrq}.!${abha.PUNVA}!=#{bow.Svkrq}.!${abha.NKR}!=0, #{pybfvat}=1, #{pybpx1}=-1"
  for /l %%D in (1 1 6) do set /a "#{qjnesFrra}.%%D=#{qjnesYbp}.%%D=0"
  %@{zbir}% !${abha.GEBYY}! 0
  %@{zbir}% !${svkrqGEBYY}! 0
  %@{zbir}% !${GEBYY2}! !${bowCynpr}.%${abha.GEBYY}%!
  %@{zbir}% !${svkrqGEBYY2}! !${bowCynpr}.%${abha.GEBYY}%!
  %@{whttyr}% !${abha.PUNFZ}!
  if !#{bowCebc}.%${abha.ORNE}%! neq 3 (
    if !#{bowCynpr}.%${abha.ORNE}%! equ -1 set /a "#{ubyqPag}-=1"
    %@{zbir}% !${abha.ORNE}! 0
  )
  call :{jevgrZft} 129
  goto :{raqPybfher}
)
if !#{pybpx1}! lss 0 2>nul set /a "1/(#{pybpx2}-=1)" || goto :{pybfrPnir}

::{ Unaqyr ynzc yvsr }
if !#{bowCebc}.%${abha.YNZC}%! equ 1 set /a "#{ynzcYvsr}-=1"
if !#{ynzcYvsr}! leq 30 if !#{bowCebc}.%${abha.ONGGR}%! equ 0 (%@{urer}% !${abha.YNZC}!) && (%@{urer}% !${abha.ONGGR}!) && (
  call :{jevgrZft} 188
  set /a "#{ynzcYvsr}+=2500, #{ynzcJnea}=0, #{bowCebc}.!${abha.ONGGR}!=1"
  (%@{gbgvat}% !${abha.ONGGR}!) && (
    %@{zbir}% !${abha.ONGGR}! !#{ybp}!
    set /a "#{ubyqPag}-=1"
  )
)
if !#{ynzcYvsr}! equ 0  (
  set /a "#{ynzcYvsr}=-1, #{bowCebc}.!${abha.YNZC}!=0"
  (%@{urer}% !${abha.YNZC}!) && call :{jevgrZft} 184
) else if !#{ynzcYvsr}! lss 0 (
  set "#{tnirhc}=1"
  call :{jevgrZft} 185
  goto :{trgFpber}
) else if !#{ynzcYvsr}! leq 30 if !#{ynzcJnea}! equ 0 (%@{urer}% !${abha.YNZC}!) && (
  set /a "#{ynzcJnea}=1, {fcx}=187"
  if !#{bowCynpr}.%${abha.ONGGR}%! equ 0 set "{fcx}=183"
  if !#{bowCebc}.%${abha.ONGGR}%! equ 1 set "{fcx}=189"
  call :{jevgrZft} !{fcx}!
)
:{raqPybfher}

::{ qrohttvat pbzznaqf bayl ninvynoyr gb harapelcgrq irefvba }
if not defined ${Boshfpngrq} (
  if /i !{jbeq1}! equ %{%FRG%}% echo(&set %{jbeq2}%&goto :{uvagPurpx}
  if /i !{jbeq1}! equ %{%qoht%}% set /a "dbug=^!dbug"&goto :{uvagPurpx}
)

::{ unaqyr gur sbhy zbhgurq FBO }
if !{fcrpvny1}! equ !${fcrpvny.QNZA}! call :{jevgrZft} !{fcrpvny1}! & goto :{uvagPurpx}
if !{fcrpvny2}! equ !${fcrpvny.QNZA}! call :{jevgrZft} !{fcrpvny2}! & goto :{uvagPurpx}

::{ unaqyr gbb pbzcyrk }
if defined {jbeq3} (
  call :{jevgrZft} 205
  goto :{uvagPurpx}
)

::{ unaqyr zbirzrag }
if defined {zbir} if not defined {gbxra2} goto :{zbirzrag}

::{ unaqyr RAGRE JNGRE }
if /i !{gbxra1}! equ %{%RAGRE%}% if !{abha}! equ !${abha.JNGRE}! (
  %@{cynprYvdhvq}% {yvd}
  if !{yvd}! equ !${abha.JNGRE}! (call :{jevgrZft} 70) else call :{jevgrFge} "%{%V qba'g frr nal jngre.%}%"
  goto :{uvagPurpx}
)

::{ unaqyr ireo }
if defined {ireo} (
  set "{fcx}=!${ireoQrsnhyg}.%{ireo}%!"
  if !{ireo}! equ !${ireo.FNL}! if defined {jbeq2} goto :{gena!{ireo}!} { unaqyr genafvgvir FNL }
  if defined {abha} (
    if !{ireo}! equ !${ireo.SVAQ}! goto :{gena!{ireo}!}  { unaqyr genafvgvir SVAQ }
    call :{inyvqngrAbha} && goto :{gena!{ireo}!}  { unaqyr genafvgvir ireo }
    goto :{uvagPurpx}
  )
  if not defined {jbeq2} goto :{vagena!{ireo}!}  { unaqyr vagenafvgvir ireo }
)

::{ unaqyr fcrpvny jbeqf }
if defined {fcrpvny1} call :{jevgrZft} !{fcrpvny1}! & goto :{uvagPurpx}
if defined {fcrpvny2} call :{jevgrZft} !{fcrpvny2}! & goto :{uvagPurpx}

::{ unaqyr anxrq abha }
if defined {abha} if not defined {jbeq2} (
  call :{inyvqngrAbha} && (
    call :{jevgrFge} "%{%Jung qb lbh jnag gb qb jvgu gur !{abhaGkg}!?"
    set "{byqAbha}=!{abha}!"
    set "{byqAbhaGkg}=!{abhaGkg}!"
  )
  goto :{uvagPurpx}
)

::{ unaqyr V qba'g haqrefgnaq }
set {fcx}=60
(%@{cpg}% 33) && (set {fcx}=61) || (%@{cpg}% 50) && (set {fcx}=13)
call :{jevgrZft} !{fcx}!
goto :{uvagPurpx}


:{inyvqngrAbha}
if !#{bowSvkrq}.%{abha}%! equ !#{ybp}! exit /b 0
(%@{urer}% %{abha}%) && exit /b 0

if !{abha}! equ !${abha.QJNES}! if !#{qjnesFgngr}! geq 2 (
  for /l %%N in (1 1 5) do if !#{qjnesYbp}.%%N! equ !#{ybp}! exit /b 0
)
(%@{urer}% !${abha.OBGGY}!) && (
  %@{obggyrYvdhvq}% {yvd}
  if !{yvd}! equ !{abha}! exit /b 0
)
%@{cynprYvdhvq}% {yvd}
if !{yvd}! equ !{abha}! exit /b 0
if !{abha}! equ !${abha.CYNAG}! (%@{ng}% !${cynag2}!) && if !#{bowCebc}.%{cynag2}%! neq 0 (
  set "{abha}=!{cynag2}!"
  exit /b 0
)
if !{abha}! equ !${abha.XAVSR}! if !#{xavsrYbp}! equ !#{ybp}! (
  set "#{xavsrYbp}=-1"
  call :{jevgrZft} 116
  exit /b 1
)
if !{abha}! equ !${abha.EBQ}! (%@{urer}% %${ebq2}%) && (
  set "{abha}=%${ebq2}%"
  exit /b 0
)
call :{jevgrFge} "%{%V qba'g frr nal !{abhaGkg}!."
exit /b 1


::---------------------
::{ Ireo npgvbaf }

:{vagena1}  {GNXR}
set "{grfg}="
if !#{qjnesFgngr} geq 2 for /l %%N in (1 1 5) do if !#{qjnesYbp}.%%N! equ !#{ybp}! set "{grfg}=!${abha.QJNES}!"
for /f "tokens=1,2" %%A in ("!#{cynprBowf}.%#{ybp}%! !{grfg}!") do if "%%B" equ "" (
  set "{abha}=%%A"
  goto :{gena1}
)
goto :{trgBowrpg}

:{gena1}  {GNXR}
(%@{gbgvat}% !{abha}!) && goto :{qrsnhygNpgvba}
set "{abhaNhk}="
set "{yvd}= !${abha.JNGRE}! !${abha.BVY}! "
if "!{yvd}: %{abha}% =!" neq "!{yvd}!" (
  %@{obggyrYvdhvq}% {yvd}
  if !{abha}! equ !{yvd}! (%@{urer}% !${abha.OBGGY}!) && set /a "{abha}=${abha.OBGGY}"
  if !{abha}! neq !${abha.OBGGY}! (
    %@{cynprYvdhvq}% {yvd}
    if !{abha}! equ !{yvd}! (
      (%@{gbgvat}% !${abha.OBGGY}!) && (
        if !#{bowCebc}.%${abha.OBGGY}%! equ 1 (
          set "{abha}=!${abha.OBGGY}!"
          goto :{gena22} {SVYY}
        ) else (
          call :{jevgrZft} 105 & goto :{uvagPurpx}
        )
      ) || (
        call :{jevgrZft} 104 & goto :{uvagPurpx}
      )
    )
  )
)
if !#{bowSvkrq}.%{abha}%! neq 0 (
  set "{fcx}=25"
  if !{abha}! equ !${abha.CYNAG}! if !#{bowCebc}.%${abha.CYNAG}%! leq 0 set "{fcx}=115"
  if !{abha}! equ !${abha.ORNE}!  if !#{bowCebc}.%${abha.ORNE}%!  equ 1 set "{fcx}=169"
  if !{abha}! equ !${abha.PUNVA}! if !#{bowCebc}.%${abha.ORNE}%!  neq 0 set "{fcx}=170"
  call :{jevgrZft} !{fcx}!
  goto :{uvagPurpx}
)
if !#{ubyqPag}! geq 7 call :{jevgrZft} 92 & goto :{uvagPurpx}
if !{abha}! equ !${abha.OVEQ}! (
  (%@{gbgvat}% !${abha.PNTR}!) && (
    (%@{gbgvat}% !${abha.EBQ}!) && (CALL :{jevgrZft} 26 & goto :{uvagPurpx})
    set /a "{abha}=${abha.PNTR}, #{ubyqPag}-=1, #{bowCebc}.%${abha.OVEQ}%=1"
  ) || (
    if !#{bowCebc}.%${abha.OVEQ}%! neq 1 call :{jevgrZft} 27 & goto :{uvagPurpx}
    set "{abha}=!${abha.PNTR}!"
  )
)
if !{abha}! equ !${abha.PNTR}! if !#{bowCebc}.%${abha.OVEQ}%! equ 1 set "{abhaNhk}=!${abha.OVEQ}!"
if !{abha}! equ !${abha.OBGGY}! (
  %@{obggyrYvdhvq}% {abhaNhk}
  if !{abhaNhk}! equ 0 set "{abhaNhk}="
)
if defined {abhaNhk} (
  %@{zbir}% !{abhaNhk}! -1
  set "{abhaNhk}="
)
%@{zbir}% !{abha}! -1
set /a #{ubyqPag}+=1
call :{jevgrZft} 54
goto :{uvagPurpx}


:{gena2}  {QEBC}
if !{abha}! equ !${abha.EBQ}! (%@{gbgvat}% !${EBQ2}!) && ((%@{gbgvat}% !{abha}!) || set "{abha}=!${EBQ2}!")
(%@{gbgvat}% !{abha}!) || (
  call :{jevgrZft} !{fcx}!
  goto :{uvagPurpx}
)
if !{abha}! neq !${abha.OVEQ}! set /a "#{ubyqPag}-=1"
if !{abha}! equ !${abha.OVEQ}! (%@{urer}% !${abha.FANXR}!) && (
  call :{jevgrZft} 30
  if !#{pybfrq}! neq 0 goto :{qjnesRaqTnzr}
  %@{zbir}% !${abha.FANXR}! 0
  set "#{bowCebc}.!${abha.FANXR}!=1"
  goto :{svavfuQebc}
)
if !{abha}! equ !${abha.PBVAF}! (%@{urer}% !${abha.IRAQV}!) && (
  %@{zbir}% !{abha}! 0
  %@{zbir}% !${abha.ONGGR}! !#{ybp}!
  call :{jevgr} ${bowrpg}.!${abha.ONGGR}!.0
  goto :{uvagPurpx}
)
if !{abha}! equ !${abha.OVEQ}! if !#{bowCebc}.%${abha.QENTB}%! equ 0 (%@{ng}% %${abha.QENTB}%) && (
  call :{jevgrZft} 154
  %@{zbir}% !{abha}! 0
  set "#{bowCebc}.!{abha}!=0"
  if !${bowCynpr}.%${abha.FANXR}%! equ !#{bowCynpr}.%${abha.FANXR}%! set /a "#{ybfgPag}+=1"
  goto :{uvagPurpx}
)
if !{abha}! equ !${abha.ORNE}! (%@{ng}% !${abha.GEBYY}!) && (
  call :{jevgrZft} 163
  %@{zbir}% !${abha.GEBYY}! 0
  %@{zbir}% !${svkrqGEBYY}! 0
  %@{zbir}% !${GEBYY2}! !${bowCynpr}.%${abha.GEBYY}%!
  %@{zbir}% !${svkrqGEBYY2}! !${bowSvkrq}.%${abha.GEBYY}%!
  set "#{bowCebc}.!${abha.GEBYY}!=2"
  %@{whttyr}% !${abha.PUNFZ}!
  goto :{svavfuQebc}
)
if !{abha}! equ !${abha.INFR}! if !#{ybp}! neq !${bowCynpr}.%${abha.CVYYB}%! (
  (%@{ng}% !${abha.CVYYB}!) && (
    set "#{bowCebc}.!{abha}!=0
    call :{jevgr} ${bowrpg}.!{abha}!.1
  ) || (
    set "#{bowCebc}.!{abha}!=2
    call :{jevgr} ${bowrpg}.!{abha}!.3
    set "#{bowSvkrq}.!{abha}!=-1"
  )
  goto :{svavfuQebc}
)
call :{jevgrZft} 54
:{svavfuQebc}
%@{obggyrYvdhvq}% {yvd}
if !{abha}! equ !{yvd}! set "{abha}=!${abha.OBGGY}!"
if !{abha}! equ !${abha.OBGGY}! if !{yvd}! neq 0 (%@{zbir}% !{yvd}! 0)
if !{abha}! equ !${abha.PNTR}! if !#{bowCebc}.%${abha.OVEQ}%! neq 0 (%@{zbir}% !${abha.OVEQ}! !#{ybp}!)
if !{abha}! equ !${abha.OVEQ}! set "#{bowCebc}.%${abha.OVEQ}%=0"
%@{zbir}% !{abha}! !#{ybp}!
goto :{uvagPurpx}


:{gena3}  {FNL}
set "{fcx}=%{%Bxnl, "!{jbeq2}!"."
call :{jevgr} {fcx}
goto :{uvagPurpx}


:{vagena4}  {BCRA}
:{vagena6}  {PYBFR}
(%@{urer}% !${abha.PYNZ}!) && set "{abha}=!${abha.PYNZ}!"
(%@{urer}% !${abha.BLFGR}!) && set "{abha}=!${abha.BLFGR}!"
(%@{ng}% !${abha.QBBE}!) && set "{abha}=!${abha.QBBE}!"
(%@{ng}% !${abha.TENGR}!) && set "{abha}=!${abha.TENGR}!"
(%@{urer}% !${abha.PUNVA}!) && if defined {abha} (
  set "{abha}="
  goto :{trgBowrpg}
) else set "{abha}=!${abha.PUNVA}!"
if not defined {abha} (
  call :{jevgrZft} 28
  goto :{uvagPurpx}
)
::{ snyy guebhtu gb genafvgvir sbez }


:{gena4}  {BCRA}
:{gena6}  {PYBFR}
if !{abha}! equ !${abha.PYNZ}! goto :{qbPynz}
if !{abha}! equ !${abha.BLFGR}! goto :{qbPynz}
if !{abha}! equ !${abha.QBBE}! (
  set "{fcx}=111"
  if !#{bowCebc}.%${abha.QBBE}%! equ 1 set "{fcx}=54"
)
if !{abha}! equ !${abha.PNTR}! set "{fcx}=32"
if !{abha}! equ !${abha.XRLF}! set "{fcx}=55"
if !{abha}! equ !${abha.TENGR}! set "{fcx}=31"
if !{abha}! equ !${abha.PUNVA}! set "{fcx}=31"
(%@{urer}% !${abha.XRLF}!) && 2>nul set /a "1/^!({fcx}-31)" || (
  call :{jevgrZft} !{fcx}!
  goto :{uvagPurpx}
)
if !{abha}! equ !${abha.PUNVA}! goto :{qbPunva}
if !#{pybfvat}! equ 1 (
  call :{jevgrZft} 130
  if !#{cnavp}! equ 0 set "#{pybpx2}=15"
  set "#{cnavp}=1"
  goto :{uvagPurpx}
)
::{ qbTengr }
set /a "{fcx}=34+#{bowCebc}.%${abha.TENGR}%"
set "#{bowCebc}.%${abha.TENGR}%=1"
if !{ireo}! equ !${ireo.YBPX}! set "#{bowCebc}.%${abha.TENGR}%=0"
set /a "{fcx}+=(2*#{bowCebc}.%${abha.TENGR}%)"
call :{jevgrZft} !{fcx}!
goto :{uvagPurpx}
:{qbPynz}
set /a "N={abha}-${abha.PYNZ}, {fcx}=124+N"
(%@{gbgvat}% !{abha}!) && set /a "{fcx}=120+N"
(%@{gbgvat}% !${abha.GEVQR}!) || set /a "{fcx}=122+N"
if !{ireo}! equ !${ireo.YBPX}! set "{fcx}=61"
if !{fcx}! equ 124 (
  %@{zbir}% !${abha.PYNZ}! 0
  %@{zbir}% !${abha.BLFGR}! !#{ybp}!
  %@{zbir}% !${abha.CRNEY}! 105
)
call :{jevgrZft} !{fcx}!
goto :{uvagPurpx}
:{qbPunva}
if !{ireo}! equ !${ireo.YBPX}! (
echo locking
  set "{fcx}=172"
  if !#{bowCebc}.%${abha.PUNVA}$! neq 0 set "{fcx}=34"
  if !#{ybp}! neq !${bowCynpr}.%${abha.PUNVA}%! set "{fcx}=173"
  if !{fcx}! equ 172 (
    (%@{gbgvat}% !${abha.PUNVA}!) && (
      %@{zbir}% !${abha.PUNVA}! !#{ybp}!
      set /a "#{ubyqPag}-=1"
    )
    set /a "#{bowCebc}.!${abha.PUNVA}!=2, #{bowSvkrq}.!${abha.PUNVA}!=-1"
  )
) else (
echo unlocking
  set "{fcx}=171"
  if !#{bowCebc}.%${abha.ORNE}%! equ 0 set "{fcx}=41"
  if !#{bowCebc}.%${abha.PUNVA}%! equ 0 set "{fcx}=37"
  if !{fcx}! equ 171 (
    if !#{bowCebc}.%${abha.ORNE}%! neq 3 set "#{bowCebc}.%${abha.ORNE}%=2"
    set /a "#{bowCebc}.!${abha.PUNVA}!=#{bowSvkrq}.!${abha.PUNVA}!=0, #{bowSvkrq}.!${abha.ORNE}!=2-#{bowCebc}.!${abha.ORNE}!"
  )
)
call :{jevgrZft} !{fcx}!
goto :{uvagPurpx}


:{vagena7}  {BA}
:{gena7}    {BA}
  (%@{urer}% !${abha.YNZC}!) || goto :{qrsnhygNpgvba}
  if !#{ynzcYvsr}! lss 0 (
    call :{jevgrZft} 184
    goto :{uvagPurpx}
  )
  set "#{bowCebc}.!${abha.YNZC}!=1"
  call :{jevgrZft} 39
  if !#{jnfQnex}! neq 0 goto :{qrfpevorYbpngvba}
  goto :{uvagPurpx}


:{vagena8}  {BSS}
:{gena8}    {BSS}
  (%@{urer}% !${abha.YNZC}!) || goto :{qrsnhygNpgvba}
  set "#{bowCebc}.!${abha.YNZC}!=0"
  call :{jevgrZft} 40
  %@{qnex}% && call :{jevgrZft} 16
  goto :{uvagPurpx}


:{gena9}  {JNIR}
if !{abha}! equ !${abha.EBQ}! (%@{ng}% !${abha.SVFFH}!) && (%@{gbgvat}% !${abha.EBQ}!) && (
  set /a "#{bowCebc}.!${abha.SVFFH}!=^!#{bowCebc}.!${abha.SVFFH}!, {fcx}=2-#{bowCebc}.!${abha.SVFFH}!"
  call :{jevgr} ${bowrpg}.!${abha.SVFFH}!.!{fcx}!
  goto :{uvagPurpx}
)
(%@{gbgvat}% !{abha}!) || (
  if !{abha}! neq !${abha.EBQ}! set "{fcx}=29"
  (%@{gbgvat}% !${EBQ2}!) || set "{fcx}=29"
)
call :{jevgrZft} !{fcx}!
goto :{uvagPurpx}


:{vagena12} {XVYY}
:{gena12}   {XVYY}
if not defined {abha} (
  if !#{qjnesFgngr}! geq 2 for /l %%N in (1 1 5) do if !#{qjnesYbp}.%%N! equ !#{ybp}! set "{abha}=!${abha.QJNES}!"
  (%@{urer}% !${abha.FANXR}!) && set /a "{abha}={abha}*100+${abha.FANXR}"
  if !#{bowCebc}.%${abha.QENTB}%! equ 0 (%@{ng}% !${abha.QENTB}!) && set /a "{abha}={abha}*100+${abha.QENTB}"
  (%@{ng}% !${abha.GEBYY}!) && set /a "{abha}={abha}*100+${abha.GEBYY}"
  if !#{bowCebc}.%${abha.ORNE}%! equ 0 (%@{urer}% !${abha.ORNE}!) && set /a "{abha}={abha}*100+${abha.ORNE}"
  if !{abha}! gtr 100 (
    if !{ireo}! neq !{ireo.XVYY}! set "{ireo}=!{ireo.XVYY}!"
    goto :{trgBowrpg}
  )
  if not defined {abha} (
    if !{ireo}! neq !${ireo.GUEBJ}! (%@{urer}% !${abha.OVEQ}!) && set "{abha}=!${abha.OVEQ}!"
    (%@{urer}% !${abha.PYNZ}!) && set /a "{abha}={abha}*100+${abha.PYNZ}"
    (%@{urer}% !${abha.BLFGR}!) && set /a "{abha}={abha}*100+${abha.PYNZ}"
    if !{abha}! gtr 100 (
      if !{ireo}! neq !${ireo.XVYY}! set "{ireo}=!{ireo.XVYY}!"
      goto :{trgBowrpg}
    )
  )
)
if !{abha}! equ !${abha.OVEQ}! (
  if !#{pybfrq}! equ 1 (
    call :{jevgrZft} 137
    goto :{uvagPurpx}
  )
  %@{zbir}% !{abha}! 0
  set "#{bowCebc}.!{abha}!=0"
  if !#{bowCynpr}.%${abha.FANXR}%! equ !${bowCynpr}.%${abha.FANXR}%! set /a "#{ybfgPag}+=1"
  set "{fcx}=45"
)
if !{abha}! equ !${abha.QENTB}! if !{bowCebc}.%${abha.QENTB}%! equ 0 goto :{xvyyQentba}
if not defined {abha} set "{fcx}=44"
if !{abha}! equ !${abha.PYNZ}! set "{fcx}=150"
if !{abha}! equ !${abha.BLFGR}! set "{fcx}=150"
if !{abha}! equ !${abha.FANXR}! set "{fcx}=46"
if !{abha}! equ !${abha.QJNES}! (
  set "{fcx}=49"
  if !#{pybfrq}! equ 1 goto :{qjnesRaqTnzr}
)
if !{abha}! equ !${abha.QENTB}! set "{fcx}=167"
if !{abha}! equ !${abha.GEBYY}! set "{fcx}=157"
if !{abha}! equ !${abha.ORNE}! set /a "{fcx}=165+(#{bowCebc}.!${abha.ORNE}!+1)/2"
call :{jevgrZft} !{fcx}!
goto :{uvagPurpx}

:{xvyyQentba}
call :{jevgrZft} 49
call :{trgPzq}
if /i !{pzq}! neq %{%L%}% if /i !{pzq}! neq %{%lrf%}% goto :{xvyyQentbaYbbc}
call :{jevgr} ${bowrpg}.!${abha.QENTB}!.1
set /a "#{bowCebc}.!${abha.QENTB}!=2, #{bowCebc}.!${abha.EHT}!=0, N=(${bowCynpr}.!${abha.QENTB}!+${bowSvkrq}.!${abha.QENTB}!)/2, {svkrqQENTB}=${abha.QENTB}+100, {svkrqEHT}=${abha.EHT}+100"
%@{zbir}% !{svkrqQENTB}! -1
%@{zbir}% !{svkrqEHT}! 0
%@{zbir}% !${abha.QENTB}! !N!
%@{zbir}% !${abha.EHT}! !N!
for %%P in (!${bowCynpr}.%${abha.QENTB}%!) do for %%O in (!#{cynprBowf}.%%P!) do (
  %@{zbir}% %%O !N!
  if %%O equ !${abha.OVEQ}! if !#{bowCebc}.%%O! equ 1 %@{zbir}% !${abha.PNTR}! !N!
)
for %%P in (!${bowSvkrq}.%${abha.QENTB}%!) do for %%O in (!#{cynprBowf}.%%P!) do (
  %@{zbir}% %%O !N!
  if %%O equ !${abha.OVEQ}! if !#{bowCebc}.%%O! equ 1 %@{zbir}% !${abha.PNTR}! !N!
)
set /a "#{ybp}=N, {zbir}=${zbir.AHYY}"
goto :{zbirzrag}


:{vagena13} {CBHE}
:{gena13}   {CBHE}
%@{obggyrYvdhvq}% {yvd}
if not defined {abha} set "{abha}=!{yvd}!"
if !{abha}! equ !${abha.OBGGY}! set "{abha}=!{yvd}!"
if !{abha}! equ 0 if defined {abhaGkg} (
  call :{jevgrZft} 207
  goto :{uvagPurpx}
) else goto :{trgBowrpg}
(%@{gbgvat}% !{abha}!) || goto :{qrsnhygNpgvba}
if !{abha}! neq !{yvd}! (
  call :{jevgrZft} 78
  goto :{uvagPurpx}
)
set "{fcx}=77"
set "#{bowCebc}.!${abha.OBGGY}!=1"
%@{zbir}% !{abha}! 0
(%@{ng}% !${abha.CYNAG}!) && (
  set "{fcx}=112"
  if !{abha}! equ !${abha.JNGRE}! (
    set /a "N=#{bowCebc}.!${abha.CYNAG}!+1, #{bowCebc}.!${abha.CYNAG}!=(#{bowCebc}.!${abha.CYNAG}!+2)%%6, #{bowCebc}.!${CYNAG2}!=#{bowCebc}.!${abha.CYNAG}!/2, {zbir}=!${zbir.AHYY}!"
    call :{jevgr} ${bowrpg}.!${abha.CYNAG}!.!N!
    goto :{zbirzrag}
  )
)
(%@{ng}% !${abha.QBBE}!) && (
  set "{fcx}=113"
  if !{abha}! equ !${abha.BVY}! set /a "#{bowCebc}.!${abha.QBBE}!=1, {fcx}=114"
)
call :{jevgrZft} !{fcx}!
goto :{uvagPurpx}


:{gena14} {RNG}
if !{abha}! equ !${abha.SBBQ}! goto :{vagena14}
for %%A in ( %{% OVEQ FANXR PYNZ BLFGR QJNES QENTB GEBYY ORNE %}% ) do if !{abha}! equ !${abha%}%.%%A}! set "{fcx}=71"
call :{jevgrZft} !{fcx}!
goto :{uvagPurpx}


:{vagena14} {RNG}
(%@{urer}% !${abha.SBBQ}!) || goto :{trgBowrpg}
(%@{gbgvat}% !${abha.SBBQ}!) && set /a "#{ubyqPag}-=1"
%@{zbir}% !${abha.SBBQ}! 0
call :{jevgrZft} 72
goto :{uvagPurpx}


:{vagena15} {QEVAX}
:{gena15}   {QEVAX}
%@{cynprYvdhvq}% {yvd}
%@{obggyrYvdhvq}% {oyvd}
if not defined {abha} if !{yvd}! neq !${abha.JNGRE}! (
  if !{oyvd}! neq !${abha.JNGRE}! goto :{trgBowrpg}
  (%@{urer}% !${abha.OBGGY}!) || goto :{trgBowrpg}
)
if defined {abha} if !{abha}! neq !${abha.JNGRE}! set "{fcx}=110"
if !{fcx}! neq 110 if !{oyvd}! equ !${abha.JNGRE}! (
  (%@{urer}% !${abha.OBGGY}!) && (
    %@{zbir}% !${abha.JNGRE}! 0
    set /a "{fcx}=74, #{bowCebc}.!${abha.OBGGY}!=1"
  )
)
call :{jevgrZft} !{fcx}!
goto :{uvagPurpx}


:{gena16} {EHO}
if !{abha}! neq !${abha.YNZC}! set "{fcx}=76"
call :{jevgrZft} !{fcx}!
goto :{uvagPurpx}


:{gena17} {GUEBJ}
:: if !{abha}! equ !${abha.EBQ}! (%@{gbgvat}% !${EBQ2}!) && ((%@{gbgvat}% !${abha.EBQ}!) || set "{abha}=!${EBQ2}!)
(%@{gbgvat}% !{abha}!) || goto :{qrsnhygNpgvba}
if !{abha}! geq !${zvaGernfher}! if !{abha}! leq !${znkGernfher}! (%@{ng}% !${abha.GEBYY}!) && (
  set /a "#{ubyqPag}-=1"
  %@{zbir}% !{abha}! 0
  %@{zbir}% !${abha.GEBYY}! 0
  %@{zbir}% !${svkrqGEBYY}! 0
  %@{zbir}% !${GEBYY2}! !${bowCynpr}.%${abha.GEBYY}%!
  %@{zbir}% !${svkrqGEBYY2}! !${bowSvkrq}.%${abha.GEBYY}%!
  %@{whttyr}% !${abha.PUNFZ}!
  call :{jevgrZft} 159
  goto :{uvagPurpx}
)
if !{abha}! equ !${abha.SBBQ}! (%@{urer}% !${abha.ORNE}!) && (
  set "{abha}=!${abha.ORNE}!"
  goto :{gena21}  {SRRQ}
)
if !{abha}! neq !${abha.NKR}! goto :{gena2}  {QEBC}
(%@{urer}% !${abha.ORNE}!) && if !${bowCebc}.%${abha.ORNE}%! equ 0 (
  set /a "${ubyqPag}-=1"
  %@{zbir}% !{abha}! !#{ybp}!
  %@{whttyr}% !${abha.ORNE}!
  set /a "#{bowCebc}.!{abha}!=1, #{bowSvkrq}.!{abha}!=-1"
  call :{jevgrZft} 164
  goto :{uvagPurpx}
)
set "{fcx}="
(%@{ng}% !${abha.QENTB}!) && if !${bowCebc}.%${abha.QENTB}%! equ 0 set "{fcx}=152"
(%@{ng}% !${abha.GEBYY}!) && set "{fcx}=175"
for /l %%N in (1 1 5) do if !#{qjnesYbp}.%%N! equ !#{ybp}! (
  set "{fcx}=48"
  (%@{cpg}% 67) && (
    set /a "#{qjnesFrra}.%%N=#{qjnesYbp}.%%N=0, #{qrnqQjnesPag}+=1"
    if !#{qrnqQjnesPag}! equ 1 (set {fcx}=149) else (set {fcx}=47)
  )
  goto :{raqQjnesNggnpx}
)
:{raqQjnesNggnpx}
if not defined {fcx} (
  set "{abha}="
  set "{ireoGkg}=attack"
  goto :{vagena12}  {XVYY}
)
set /a "#{ubyqPag}-=1"
call :{jevgrZft} !{fcx}!
%@{zbir}% !{abha}! !#{ybp}!
set "{zbir}=!${zbir.AHYY}!"
goto :{zbirzrag}


:{vagena18} {DHVG}
call :{lrf} 22 54 54 && (
  set "#{tnirhc}=1"
  goto :{trgFpber}
)
goto :{uvagPurpx}


:{gena20} {VAIRAGBEL}
:{gena19} {SVAQ}
(%@{ng}% !{abha}!) && set "{fcx}=94"
%@{cynprYvdhvq}% {yvd}
if !{yvd}! equ !{abha}! set "{fcx}=94"
%@{obggyrYvdhvq}% {yvd}
if !{yvd}! equ !{abha}! (%@{ng}% !{abha}!) && set "{fcx}=94"
if !{abha}! equ !${abha.QJNES}! if !#{qjnesFgngr}! geq 2 for /l %%N in (1 1 5) do if !#{qjnesYbp}.%%N! equ !#{ybp}! set "{fcx}=94"
if !#{pybfrq}! neq 0 set "{fcx}=138"
(%@{gbgvat}% !{abha}!) && set "{fcx}=24"
call :{jevgrZft} !{fcx}!
goto :{uvagPurpx}


:{vagena20} {VAIRAGBEL}
set "{abar}=1"
for %%O in (!#{cynprBowf}.-1!) do if %%O neq !${abha.ORNE}! (
  if defined {abar} (
    call :{jevgrZft} 99
    set "{abar}="
  )
  call :{jevgrArkg} ${bowrpg}.%%O
)
(%@{gbgvat}% !${abha.ORNE}!) && (
  call :{jevgrZft} 141
  set "{abar}="
)
if defined {abar} call :{jevgrZft} 98
goto :{uvagPurpx}


:{gena21} {SRRQ}   174
if !{abha}! equ !${abha.OVEQ}! set "{fcx}=100"
if !{abha}! equ !${abha.GEBYY}! set "{fcx}=182"
if !{abha}! equ !${abha.QENTB}! (
  set "{fcx}=102"
  if !#{bowCebc}.%{abha}%! neq 0 set "{fcx}=110"
)
if !{abha}! equ !${abha.FANXR}! (
  set "{fcx}=102"
  if !#{pybfrq}! equ 0 (%@{urer}% !${abha.OVEQ}!) && (
    %@{zbir}% !${abha.OVEQ}! 0
    set /a "#{bowCebc}.!${abha.OVEQ}!=0, #{ybfgPag}+=1, {fcx}=101"
  )
)
if !{abha}! equ !${abha.QJNES}! (
  set "{fcx}=174"
  (%@{urer}% !${abha.SBBQ}!) && set /a "{fcx}=103, #{qjnesFgngr}+=1"
)
if !{abha}! equ !${abha.ORNE}! (
  set "{fcx}=174"
  if !#{bowCebc}.%{abha}%! equ 0 set "{fcx}=102"
  if !#{bowCebc}.%{abha}%! equ 3 set "{fcx}=110"
  (%@{urer}% !${abha.SBBQ}!) && (
    set "{fcx}=168"
    (%@{gbgvat}% !${abha.SBBQ}!) && set /a "#{ubyqPag}-=1"
    %@{zbir}% !${abha.SBBQ}! 0
    set /a "#{bowCebc}.!{abha}!=1, #{bowCebc}.!${abha.NKR}!=#{bowSvkrq}.!${abha.NKR}!=0"
  )
)
call :{jevgrZft} !{fcx}!
goto :{uvagPurpx}


:{vagena22} {SVYY}
:{gena22}   {SVYY}
%@{cynprYvdhvq}% {yvd}
%@{obggyrYvdhvq}% {oyvd}
if !{abha}! equ !${abha.INFR}! (
  set "{fcx}=145"
  if !{yvd}! equ 0 set "{fcx}=144"
  (%@{gbgvat}% !${abha.INFR}!) || set "{fcx}=29"
  call :{jevgrZft} !{fcx}!
  if !{fcx}! equ 145 (
    %@{zbir}% !${abha.INFR}! !#{ybp}!
    call :{jevgr} ${bowrpg}.!${abha.INFR}!.3
    set /a "#{bowCebc}.!${abha.INFR}!=2, #{bowSvkrq}.!${abha.INFR}!=-1, #{ubyqPag}-=1"
  )
) else (
  if defined {abha} if !{abha}! neq !${abha.OBGGY}! goto :{qrsnhygNpgvba}
  if !{abha}! equ 0 (%@{urer}% !${abha.OBGGY}!) || goto :{trgBowrpg}
  set "{fcx}=107"
  if !{yvd}! equ 0 set "{fcx}=106"
  if !{oyvd}! neq 0 set "{fcx}=105"
  if !{fcx}! equ 107 (
    set /a "#{bowCebc}.!${abha.OBGGY}!=({yvd}-21)*2"
    (%@{gbgvat}% !${abha.OBGGY}!) && (
      %@{zbir}% !{yvd}! -1
      %@{zbir}% !${abha.OBGGY}! -1
    )
    if !{yvd}! equ !${abha.BVY}! set "{fcx}=108"
  )
  call :{jevgrZft} !{fcx}!
)
goto :{uvagPurpx}


:{vagena23} {OYNFG}
:{gena23} {OYNFG}
if !#{bowCebc}.%${EBQ2}%! lss 0 goto :{qrsnhygNpgvba}
if !#{pybfrq}! equ 0 goto :{qrsnhygNpgvba}
set "#{obahf}=133"
if !#{ybp}! equ 115 set "#{obahf}=134"
(%@{urer}% !${EBQ2}!) && set "#{obahf}=135"
call :{jevgrZft} !#{obahf}!
goto :{trgFpber}


:{vagena24} {FPBER}
set "#{fpbevat}=1"
call :{trgFpber}
set "#{fpbevat}=0"
call :{jevgrFge} "%{%Vs lbh jrer gb dhvg abj, lbh jbhyq fpber !{fpber}!%{% bhg bs n cbffvoyr !{znkFpber}!."
goto :{uvagPurpx}


:{vagena25} {SBB}
set /a "#{sbbPag}=1-#{sbbPag}"
if !#{sbbPag}! neq !${fcrpvny.%{gbxra1}%}! (
  if !#{sbbPag}! equ 1 (set "{fcx}=42") else set "{fcx}=151"
  set "#{sbbPag}=0"
  call :{jevgrZft} !{fcx}!
  goto :{uvagPurpx}
)
if !#{sbbPag}! neq 4 (
  call :{jevgrZft} 54
  goto :{uvagPurpx}
)
set "#{sbbPag}=0"
if !#{bowCynpr}.%${abha.RTTF}%! equ !${bowCynpr}.%${abha.RTTF}%! set "{fcx}=42"
if !#{ybp}! equ !${bowCynpr}.%${abha.RTTF}%! (%@{gbgvat}% !${abha.RTTF}!) && set "{fcx}=42"
if !{fcx}! equ 42 (
  call :{jevgrZft} !{fcx}!
  goto :{uvagPurpx}
)
if !#{bowCynpr}.%${abha.RTTF}%! equ 0 if !#{bowCynpr}.%${abha.GEBYY}%! equ 0 if !#{bowCebc}.%${abha.GEBYY}%! equ 0 set "#{bowCebc}.%${abha.GEBYY}%=1"
set "{fcx}=2"
(%@{urer}% !${abha.RTTF}!) && set "{fcx}=1"
if !#{ybp}! equ !${bowCynpr}.%${abha.RTTF}%! set "{fcx}=0"
(%@{gbgvat}% !${abha.RTTF}!) && set /a "#{ubyqPag}-=1"
%@{zbir}% !${abha.RTTF}! !${bowCynpr}.%${abha.RTTF}%!
call :{jevgr} ${bowrpg}.!${abha.RTTF}!.!{fcx}!
goto :{uvagPurpx}


:{vagena26} {OEVRS}
set /a "#{nooAhz}=0, #{qrgnvyPag}=3"
call :{jevgrZft} 156
goto :{uvagPurpx}


:{vagena27} {ERNQ}
%@{qnex}% && (
  call :{jevgrZft} 208
  goto :{uvagPurpx}
)
(%@{urer}% !${abha.ZNTNM}!) && set /a "{abha}=${abha.ZNTNM}"
(%@{urer}% !${abha.GNOYR}!) && set /a "{abha}={abha}*100+${abha.GNOYR}"
(%@{urer}% !${abha.ZRFFN}!) && set /a "{abha}={abha}*100+${abha.ZRFFN}"
if !#{pybfrq}! equ 1 (%@{gbgvat}% !${abha.BLFGR}!) && set /a "{abha}=${abha.BLFGR}"
if not defined {abha} goto :{trgBowrpg}
if !{abha}! gtr 100 goto :{trgBowrpg}
::{ snyy guebhtu gb genafvgvir sbez }

:{gena27}   {ERNQ}
%@{qnex}% && (
  call :{jevgrZft} 208
  goto :{uvagPurpx}
)
if !{abha}! equ !${abha.ZNTNM}! set "{fcx}=190"
if !{abha}! equ !${abha.GNOYR}! set "{fcx}=196"
if !{abha}! equ !${abha.ZRFFN}! set "{fcx}=191"
if !{abha}! equ !${abha.ZNTNM}! set "{fcx}=190"
if !{abha}! equ !${abha.BLFGR}! if !#{pybfrq}! equ 1 (%@{gbgvat}% !${abha.BLFGR}!) && (
  if !#{uvagrq}.2! equ 0 (
    call :{lrf} 192 193 54 && set "#{uvagrq}.2=1"
    goto :{uvagPurpx}
  ) else set "{fcx}=194"
)
call :{jevgrZft} !{fcx}!
goto :{uvagPurpx}


:{gena28} {OERNX}
if !{abha}! equ !${abha.INFR}! if !#{bowCebc}.%${abha.INFR}%! equ 0 (
  (%@{gbgvat}% !{abha}!) && (
    %@{zbir}% !{abha}! !#{ybp}!
    set /a "#{ubyqPag}-=1"
  )
  set /a "#{bowCebc}.!{abha}!=2, #{bowSvkrq}.!{abha}!=-1"
  call :{jevgrZft} 198
  goto :{uvagPurpx}
)
if !{abha}! neq !${abha.ZVEEB}! goto :{qrsnhygNpgvba}
if !#{pybfrq}! equ 0 (
  call :{jevgrZft} 148
  goto :{uvagPurpx}
)
call :{jevgrZft} 197
goto :{qjnesRaqTnzr}


:{gena29} {JNXR}
if !{abha}! neq !${abha.QJNES}! goto :{qrsnhygNpgvba}
if !#{pybfrq}! equ 0 goto :{qrsnhygNpgvba}
call :{jevgrZft} 199
goto :{qjnesRaqTnzr}


:{vagena30} {FNIR}
:{gena30}   {FNIR}
call :{trgFnirAnzr}
%${erqverpgvba}%%{fnirAnzr}% set #
set "{fnirAnzr}="
call :{jevgrFge} %{%"Tnzr fnirq."%}%
goto :{uvagPurpx}


:{vagena31} {UBHEF}
call :{jevgrZft} 201
goto :{uvagPurpx}


:{vagena32} {YBNQ}
:{gena32}   {YBNQ}
call :{trgFnirAnzr}
if not exist %{fnirAnzr}% (
  call :{jevgrFge} %{%"Gurer vfa'g nal tnzr gb erfhzr."%}%
) else >nul findstr /lx "#{fnirIrefvba}=!#{fnirIrefvba}!" %{fnirAnzr}% && (
  for /f "delims==" %%A in ('set {%}%') do set "%%A="
  for /f "usebackq tokens=1* delims==" %%A in (%{fnirAnzr}%) do set "%%A=%%B"
  call :{jevgrFge} %{%"Tnzr erfgberq."%}%
) || (
  call :{jevgrFge} %{%"Ybnq snvyrq - Vapbeerpg fnir irefvba"%}%
)
set "{fnirAnzr}="
goto :{uvagPurpx}


:{trgFniranzr}
(set {fnirAnzr}="%${fnirAnzr}%")
if defined ${Boshfpngrq} call :{ebg13} {fnirAnzr} {fnirAnzr}
exit /b 0


:{vagena33} {BOSHFPNGR}
:{gena33}   {BOSHFPNGR}
if not defined {abha} if !#{gheaf}! equ 1 (
  set "{svyr}=%{%nqiragher!${Boshfpngrq}!%{%.ong%}%"
  if defined ${Boshfpngrq} call :{ebg13} {svyr} {svyr}
  call :{ebg13S} "%~f0" %${erqverpgvba}%!{svyr}!
  exit /b 0
)
call :{jevgrZft} 13
goto :{uvagPurpx}


:{qrsnhygNpgvba}
:{vagena5}  {ABGUVAT}
:{gena5}    {ABGUVAT}
:{gena10}   {GNZR}
:{gena11}   {JNYX}
:{vagena11} {JNYX}
:{gena18}   {DHVG}
:{vagena19} {SVAQ}
:{gena24}   {FPBER}
:{gena25}   {SBB}
:{gena26}   {OEVRS}
:{gena31}   {UBHEF}
call :{jevgrZft} !${ireoQrsnhyg}.%{ireo}%!
goto :{uvagPurpx}


:{trgBowrpg}
:{vagena2}  {QEBC}
:{vagena3}  {FNL}
:{vagena9}  {JNIR}
:{vagena10} {GNZR}
:{vagena16} {EHO}
:{vagena17} {GUEBJ}
:{vagena21} {SRRQ}
:{vagena28} {OERNX}
:{vagena29} {JNXR}
call :{jevgrFge} "%{%Jung qb lbh jnag gb !{ireoGkg}!?"
set "{byqIreo}=!{ireo}!"
set "{byqIreoGkg}=!{ireoGkg}!"
goto :{uvagPurpx}


:{pybfrPnir}
for %%O in (!#{cynprBowf}.-1!) do %@{zbir}% %%O 0
set /a "N=${abha.ZVEEB}+100, #{ybp}=#{byqybp}=#{arjybp}=115, #{ubyqPag}=0, #{pybfrq}=1"
call :{chg} !${abha.OBGGY}! 115 1
call :{chg} !${abha.CYNAG}! 115 0
call :{chg} !${abha.BLFGR}! 115 0
call :{chg} !${abha.YNZC}!  115 0
call :{chg} !${abha.EBQ}!   115 0
call :{chg} !${abha.QJNES}! 115 0
call :{chg} !${abha.ZVEEB}! 115 0
call :{chg} !${abha.FANXR}! 116 1
call :{chg} !${abha.OVEQ}!  116 1
call :{chg} !${abha.PNTR}!  116 0
call :{chg} !${abha.CVYYB}! 116 0
call :{chg} !${EBQ2}!       116 0
%@{zbir}% !${abha.TENGR}! 116
%@{zbir}% !N! 116
call :{jevgrZft} 132
goto :{znvaYbbc}

:{chg}  {bow}  {ybp}  {cebc}
%@{zbir}% %1 %2
set /a "#{bowCebc}.%1=-1-%3"
exit /b 0


:{cvgSnyy}
set "#{byqybp2}=!#{ybp}!"
call :{jevgrZft} 23
::{ snyy guebhtu gb qrngu}

:{unaqyrQrngu}
if !#{pybfvat}! equ 1 (
  set /a "#{qvrPag}+=1"
  call :{jevgrZft} 131
  goto :{trgFpber}
)
set /a "N1=81+#{qvrPag}*2, N2=82+#{qvrPag}*2, #{qvrPag}+=1, #{ubyqPag}=0, #{ybp}=#{byqybp}=3"
call :{lrf} !N1! !N2! 54 || goto :{trgFpber}
if !#{qvrPag}! geq !${znkQvr}! goto :{trgFpber}
%@{zbir}% !${abha.JNGRE}! 0
%@{zbir}% !${abha.BVY}! 0
for %%N in (!#{cynprBowf}.-1!) do (
  if %%N equ !${abha.YNZC}! (
    %@{zbir}% %%N 1
    set "#{bowCebc}.%%N=0"
  ) else (
    %@{zbir}% %%N !#{byqybp2}!
    if %%N equ !${abha.OVEQ}! %@{zbir}% !${abha.PNTR}! !#{byqybp2}!
  )
)
goto :{qrfpevorYbpngvba}


:{qjnesRaqTnzr}
call :{jevgrZft} 136
::{ snyy guebhtu gb trgFpber naq qvr }

:{trgFpber}
set /a "{fpber}={znkFpber}=0"
for /l %%N in (!${zvaGernfher}! 1 !${znkGernfher}!) do (
  set "N=12"
  if %%N equ !${abha.PURFG}! set "N=14"
  if %%N gtr !${abha.PURFG}! set "N=16"
  if !#{bowCebc}.%%N! geq 0 set /a "{fpber}+=2"
  if !#{bowCynpr}.%%N! equ 3 if !#{bowCebc}.%%N! equ 0 set /a "{fpber}+=(N-2)"
  set /a "{znkFpber}+=N"
)
set /a "{fpber}+=(${znkQvr}-#{qvrPag})*10, {znkFpber}+=(${znkqvr}*10)"
set /a "{fpber}+=^!#{fpbevat}*^!#{tnirhc}*4, {znkFpber}+=4"
set /a "{fpber}+=^!^!#{qjnesFgngr}*25, {znkFpber}+=25"
set /a "{fpber}+=#{pybfvat}*25, {znkFpber}+=25"
set /a "{fpber}+=#{pybfrq}*(^!#{obahf}*10 + ^!(#{obahf}-135)*25 + ^!(#{obahf}-134)*30 + ^!(#{obahf}-133)*45), {znkFpber}+=45"
set /a "{fpber}+=^!(#{bowCynpr}.%${abha.ZNTNM}%-108), {znkFpber}+=1"
set /a "{fpber}+=2, {znkFpber}+=2"
for /l %%N in (2 1 !${uvagZnk}!) do set /a "{fpber}-=#{uvagrq}.%%N*${uvagQrqhpg}.%%N"
if !#{fpbevat}! neq 0 exit /b 0
call :{jevgrFge} "%{%Lbh fpberq !{fpber}!%{% bhg bs n cbffvoyr !{znkFpber}!%{% hfvat !#{gheaf}!%{% gheaf."%}%
for /l %%N in (1 1 !${enaxPag}!) do if !${enaxFpber}.%%N! geq !{fpber}! set /a "N=%%N,N2=N+1"&goto :{tbgEnax}
echo Ranking error
exit /b 1
:{tbgEnax}
call :{jevgr} ${enaxGrkg}.!N!
if !N! lss !${enaxPag}! (
  set /a "${enaxFpber}.!${enaxPag}!={znkFpber}, {arkg}=${enaxFpber}.!N2!-{fpber}"
  set "{cyheny}=%{%f%}%"
  if !{arkg}! equ 1 set "{cyheny}="
  set "{zft}=%{%Gb npuvrir gur arkg uvture engvat, lbh arrq !{arkg}!%{% zber cbvag!{cyheny}!."
) else set "{zft}=%{%Gb npuvrir gur arkg uvture engvat jbhyq or n arng gevpx^!\Pbatenghyngvbaf^!^!%}%"
call :{jevgr} {zft}
echo(
echo %cmdcmdline%|find /i "%~f0">nul&&pause
exit /b 0


::---------------------
:{zbirzrag}
set /a "#{arjybp}=#{ybp}"

if !{zbir}! equ !${zbir.AHYY}! goto :{znvaYbbc}
if !{zbir}! equ !${zbir.ONPX}! (
%{= Guvf vf n fvzcyvsvrq nccebkvzngvba bs gur bevtvany orunivbe.                             =}%
%{= Bayl fvzcyr ergheaf pbafvqrerq. Pbzcyrk fpranevbf vaibyivat sbeprq zbirzrag ner vtaberq. =}%
%{= Nyy snvyherf ner yvfgrq nf "sbetbggra ubj", arire "pna'g trg gurer sebz urer"            =}%
  set /a "#{byqybp2}=#{byqybp}, #{byqybp}=#{ybp}"
  (%@{sbeprq}% !#{byqybp2}!) || for /f "tokens=3 delims=.=" %%A in ('set ${geniry}.!#{ybp}!.^|findstr /rc:" !#{byqybp2}!:"') do (
    set "{zbir}=%%A"
    goto :{pbagvahrONPX}
  )
  call :{jevgrZft} 91
  goto :{znvaYbbc}
)
if !{zbir}! equ !${zbir.YBBX}! (
  if !#{qrgnvyPag}! lss 3 (
    set /a "#{qrgnvyPag}+=1"
    call :{jevgrZft} 15
  )
  set /a "#{cynprNooe}.!#{ybp}!=#{jnfQnex}=0"
  goto :{znvaYbbc}
)
if !{zbir}! equ !${zbir.PNIR}! (
  if !#{ybp}! lss 8 (call :{jevgrZft} 57) else (call :{jevgrZft} 58)
  goto :{znvaYbbc}
)
set /a "#{byqybp2}=#{byqybp}, #{byqybp}=#{ybp}"
:{pbagvahrONPX}
for /f "tokens=1,2" %%A in (" !#{ybp}! !{zbir}!") do for %%M in (!${geniry}.%%A.%%B!) do for /f "tokens=1,2 delims=:" %%C in ("%%M") do (
  call :{purpxZbirPbaqvgvba} %%D && (
    if %%C leq 300 (set "#{arjybp}=%%C" & goto :{znvaYbbc})
    if %%C leq 500 (goto :{geniry%}%%%C})
    set /a "N=%%C-500"
    call :{jevgrZft} !N!
    goto :{znvaYbbc}
  )
)
::{ unaqyr onq zbir }
set "{fcx}=12"
if !{zbir}! geq 43 if !{zbir}! leq 50 set "{fcx}=9"
if !{zbir}! geq 29 if !{zbir}! leq 30 set "{fcx}=9"
if !{zbir}! equ 7 set "{fcx}=10"
if !{zbir}! geq 36 if !{zbir}! leq 37 set "{fcx}=10"
if !{zbir}! equ 11 set "{fcx}=11"
if !{zbir}! equ 19 set "{fcx}=11"
if !{zbir}! equ 62 set "{fcx}=42"
if !{zbir}! equ 65 set "{fcx}=42"
call :{jevgrZft} !{fcx}!
goto :{znvaYbbc}


:{purpxZbirPbaqvgvba} {pbaqvgvba}
if %1==0 exit /b 0
%@clrErr%
if %1 leq 100 ((%@{cpg}% %1) & exit /b)
set /a "N=%1 %% 100"
if %1 leq 200 ((%@{gbgvat}% %N%) & exit /b)
if %1 leq 300 ((%@{urer}% %N%) & exit /b)
%@clrErr%
2>nul set /a "1/(#{bowCebc}.%N% - (%1-300)/100)"
exit /b

:{geniry301}
set /a "#{arjybp}=199-#{ybp}"
if !#{ubyqPag}! equ 0 goto :{znvaYbbc}
if !#{ubyqPag}! equ 1 (%@{gbgvat}% !${abha.RZREN}!) && goto :{znvaYbbc}
set /a "#{arjybp}=#{ybp}"
call :{jevgrZft} 117
goto :{znvaYbbc}

:{geniry302}
%@{zbir}% !${abha.RZREN}! !#{ybp}!
set /a "#{ubyqPag}-=1"
goto :{zbirzrag}

:{geniry303}
if !#{bowCebc}.%${abha.GEBYY}%! equ 1 (
  call :{jevgr} ${bowrpg}.!${abha.GEBYY}!.1
  set /a "#{bowCebc}.!${abha.GEBYY}!=0, #{arjybp}=#{ybp}"
  %@{zbir}% !${GEBYY2}! 0
  %@{zbir}% !${svkrqGEBYY2}! 0
  %@{zbir}% !${abha.GEBYY}! !${bowCynpr}.%${abha.GEBYY}%!
  %@{zbir}% !${svkrqGEBYY}! !${bowSvkrq}.%${abha.GEBYY}%!
  %@{whttyr}% !${abha.PUNFZ}!
  goto :{znvaYbbc}
)
set /a "#{arjybp}=${bowCynpr}.!${abha.GEBYY}!+${bowSvkrq}.!${abha.GEBYY}!-#{ybp}"
if !#{bowCebc}.%${abha.GEBYY}%! equ 0 set "#{bowCebc}.%${abha.GEBYY}%=1"
(%@{gbgvat}% !${abha.ORNE}!) || goto :{znvaYbbc}
call :{jevgrZft} 162
set /a "#{bowCebc}.!${abha.PUNFZ}!=1, #{bowCebc}.!${abha.GEBYY}!=2, #{bowCebc}.!${abha.ORNE}!=3, #{bowSvkrq}.!${abha.ORNE}!=-1, #{byqybp2}=#{arjybp}"
%@{zbir}% !${abha.ORNE}! !#{arjYbp}!
if !#{bowCebc}.%${abha.FCVPR}%! lss 0 set /a "#{ybfgPag}+=1"
goto :{unaqyrQrngu}


:{lrf}  {cebzcg}  {lrfZft}  {abZft}
setlocal
set "{lrf}=%{% L LRF %}%"
set "{ab}=%{% A AB %}%"
if %1 neq 0 call :{jevgrZft} %1
call :{vachg} {ega}
for /f "delims=" %%A in ("!{ega}!") do (
  if "!{lrf}: %%A =!" neq "!{lrf}!" (
    if %2 neq 0 call :{jevgrZft} %2
    exit /b 0
  ) else if "!{ab}: %%A =!" neq "!{ab}!" (
    if %3 neq 0 call :{jevgrZft} %3
    exit /b 1
  )
)
call :{jevgrFge} %{%"Cyrnfr nafjre gur dhrfgvba."%}%
endlocal
goto :{lrf}


:{trgPzq}
call :{vachg}  {pzq}
set "{jbeq1}="
set "{jbeq2}="
set "{jbeq3}="
set "{gbxra1}="
set "{gbxra2}="
for /f "eol= tokens=1,2* delims= " %%A in ("!{pzq}!") do (
  set "{jbeq1}=%%A"
  set "{jbeq2}=%%B"
  set "{jbeq3}=%%C"
)
if defined {jbeq1} set "{gbxra1}=!{jbeq1}:~0,5!"
if defined {jbeq2} set "{gbxra2}=!{jbeq2}:~0,5!"

::{ Fjrne naljurer vf fcrpvny }
for /f "delims= " %%A in (" !{gbxra2}!") do if "!${fcrpvny%}%.%%A}!" equ "!${fcrpvny.QNZA}!" (
  set "{jbeq1}=!{jbeq2}!"
  set "{gbxra1}=!{gbxra2}!"
)
for /f "delims= " %%A in (" !{gbxra1}!") do if "!${fcrpvny%}%.%%A}!" equ "!${fcrpvny.QNZA}!" (
  set "{jbeq2}="
  set "{gbxra2}="
)

::{ Vs FNLvat zntvp, gura chg zntvp nf svefg naq bayl gbxra }
if defined {gbxra2} for /f "tokens=1,2 delims= " %%A in (" !{gbxra1}! !{gbxra2}!") do (
  if "!${ireo%}%.%%A}!" neq "!${ireo.fnl}!" goto :{abgFnlvatZntvp}
  if !${ireo%}%.%%B}! neq !${ireo.SRR}! if !${zbir%}%.%%B}! neq !${zbir.CYHTU}! if !${zbir%}%.%%B}! neq !${zbir.CYBIR}! if !${zbir%}%.%%B}! neq !${zbir.KLMML}! goto :{abgFnlvatZntvp}
    set "{jbeq1}=!{jbeq2}!"
    set "{gbxra1}=!{gbxra2}!"
    set "{jbeq2}="
    set "{gbxra2}="
  )
)
:{abgFnlvatZntvp}

if defined {gbxra2} for /f "tokens=1,2 delims= " %%A in (" !{gbxra1}! !{gbxra2}!") do (

  %{= Fjnc jbeqf vs 2aq jbeq vf ireo hayrff 1fg jbeq vf GNXR be FNL =}%
  if /i "%%A" neq "%{%GNXR%}%" if "!${ireo%}%.%%A}!" neq "!${ireo.fnl}!" if defined ${ireo%}%.%%B} (
    set "{fnir}=!{jbeq1}!"
    set "{jbeq1}=!{jbeq2}!"
    set "{jbeq2}=!{fnir}!"
    set "{fnir}=!{gbxra1}!"
    set "{gbxra1}=!{gbxra2}!"
    set "{gbxra2}=!{fnir}!"
  )

  %{= Pbaireg "jngre cynag" naq "bvy qbbe" gb "cbhe jngre/bvy" vs ng "cynag/qbbe" =}%
  if defined ${abha%}%.%%A} if defined ${abha%}%.%%B} for /f "tokens=1,2 delims= " %%C in ("!${abha%}%.%%A}! !${abha%}%.%%B}!") do (
    if "!${bvyJngre}:%%C=!" neq "!${bvyJngre}!" if "!${qbbeCynag}:%%D=!" neq "!${qbbeCynag}!" (%@{ng}% %%D) && (
      set "{jbeq2}=!{jbeq1}!
      set "{gbxra2}=!{gbxra1}!
      set "{jbeq1}=%{%cbhe%}%"
      set "{gbxra1}=%{%cbhe%}%"
    )
  )

  %{= Pbaireg "pyvzo cynag" gb "pyvzo" =}%
  if "!${zbir%}%.%%A}!" equ "!${zbir.PYVZO}!" if "!${abha%}%.%%B}!" equ "!${abha.CYNAG}!" (
    set "{jbeq2}="
    set "{gbxra2}="
  )

  %{= Pbaireg "svaq zbirzrag" naq "vairagbel zbirzrag" gb ireo bayl =}%
  if defined ${zbir%}%.%%B} (
    if "!${ireo%}%.%%A}!" equ "!${ireo.SVAQ}!" set "{jbeq2}="&set "{gbxra2}="
    if "!${ireo%}%.%%A}!" equ "!${ireo.VAIRA}!" (
      set "{jbeq2}="&set "{gbxra2}="
      set "{jbeq1}=find"&set "{gbxra1}=find"
    )
  )
)

::{ Punatr "ragre fgernz" gb "ragre jngre" }
if /i "!{gbxra1}!" equ "%{%RAGRE%}%" if /i "!{gbxra2}!" equ "%{%FGERN%}%" (
  set "{jbeq2}=%{%JNGRE%}%"
  set "{gbxra2}=%{%JNGRE%}%"
)

::{ Pbaireg "ragre zbirzrag" naq "jnyx zbirzrag" gb fvzcyl "zbirzrag" }
for /f "tokens=1,2 delims= " %%A in (" !{gbxra1}! !{gbxra2}!") do (
  set "true="
  if /i "!{gbxra1}!" equ "%{%RAGRE%}%" set true=1
  if "!${ireo%}%.%%A}!" equ "!${ireo.jnyx}!" set true=1
  if defined true if defined ${zbir%}%.%%B} (
    set "{jbeq1}=!{jbeq2}!"
    set "{gbxra1}=!{gbxra2}!"
    set "{jbeq2}="
    set "{gbxra2}="
  )
)

::{ Cnefr gbxraf vagb fcrrpu VQf }
for /f "tokens=1,2 delims= " %%A in (" !{gbxra1}! !{gbxra2}!") do (
  set "{zbir}=!${zbir%}%.%%A}!"
  set "{abha}=!${abha%}%.%%A}!"
  set "{abhaGkg}=!{jbeq1}!"
  if not defined {abha} (
    set "{abha}=!${abha%}%.%%B}!"
    set "{abhaGkg}=!{jbeq2}!"
  )
  set "{ireo}=!${ireo%}%.%%A}!"
  set "{ireoGkg}=!{jbeq1}!"
  set "{fcrpvny1}=!${fcrpvny%}%.%%A}!"
  set "{fcrpvny2}=!${fcrpvny%}%.%%B}!"
)

::{ Pbaireg anxrq ireo vagb ireo abha vs rkvfgf abha ubyqbire }
if defined {ireo} if not defined {jbeq2} if defined {byqAbha} (
  set "{abha}=!{byqAbha}!"
  set "{abhaGkg}=!{byqAbhaGkg}!"
)

::{ Pbaireg anxrq abha vagb ireo abha vs rkvfgf ireo ubyqbire }
if defined {abha} if not defined {jbeq2} if defined {byqIreo} (
  set "{ireo}=!{byqIreo}!"
  set "{ireoGkg}=!{byqIreoGkg}!"
)

::{ Pyrne abha naq ireo ubyqbiref }
for %%V in (%{%byqAbha byqAbhaGkg byqIreo byqIreoGkg%}%) do set "{%}%%%V}="
exit /b 0


:{vachg}  {ega}
set "%~1="
echo(
<nul set /p "=>"
set /p "%~1="
::{ Ryvzvangr nal crfxl rkpynzngvba cbvagf. Zvtug pbeehcg vachg, ohg bu jryy. }
for /f "tokens=*" %%A in ("!%~1!") do set "%~1=%%A"
if not defined %~1 (
  (%@{cpg}% 33) && (
    set {fcx}=202
  ) || (
    (%@{cpg}% 50) && (set {fcx}=203) || (set {fcx}=204)
  )
  call :{jevgrZft} !{fcx}!
  goto :{vachg}
)
if defined ${Boshfpngrq} call :{ebg13}  %1  %1
exit /b 0


:{jevgrFge}  {fge}
setlocal
set "{zft}=%~1"
call :{jevgr} {zft}
exit /b 0

:{jevgrZft}  {zftVQ}
call :{jevgr} ${zrffntr}.%1
exit /b 0

:{jevgr}  {FgeIne}
::{
:: Jevgrf n oynax yvar, naq gura snyyf vagb jevgrArkg.
::}
echo(

:{jevgrArkg}  {FgeIne}
::{
:: Jevgrf gur inyhr bs FgeIne gb gur fperra.
:: Vs Boshfpngrq vf gehr, gura pnyy EBG13 svefg.
:: Nyfb pbaireg \ vagb yvarsrrqf
::}
setlocal enableDelayedExpansion
set "{zft}=!%~1!"
if "!{zft}:>$<=!" neq "!{zft}!" exit /b
if defined ${Boshfpngrq} (
  call :{EBG13} {zft}
) else (
  for %%L in ("!LF!") do echo(!{zft}:\=%%~L!
)
exit /b 0

:{ebg13}  {FgeIne}  [{EgaIne}]
::{
::  Nccyvrf gur fvzcyr "ebgngr nycunorg 13 cynprf" pvcure gb gur fgevat
::  pbagnvarq jvguva inevnoyr FgeIne.
::
::  Frgf EgaIne=erfhyg
::  be qvfcynlf erfhyg vs EgaIne abg fcrpvsvrq
::
::  Vs EgaIne abg fcrpvsvrq, gura \ punef ner ercynprq jvgu <YS>
::}
  setlocal
  set "NotDelayedFlag=!"
  setlocal enableDelayedExpansion
  set "str=A!%~1!"
  set "len=0"
  for /L %%A in (12,-1,0) do (
    set /a "len|=1<<%%A"
    for %%B in (!len!) do if "!str:~%%B,1!"=="" set /a "len&=~1<<%%A"
  )
  set /a len-=1
  set rtn=
  for /l %%n in (0,1,!len!) do (
    set "c=!%~1:~%%n,1!"
    if defined ${hccre}!c! for /f %%c in ("!c!") do (
      if "!${hccre}:%%c=%%c!" equ "!${hccre}!" (
        set "c=!${hccre}%%c!"
      ) else (
        set "c=!${ybjre}%%c!"
      )
    )
    if "%~2" equ "" (
      if !c! equ \ (
        echo(!rtn!
        set "rtn="
      ) else set "rtn=!rtn!!c!"
    ) else  set "rtn=!rtn!!c!"
  )
  if "%~2"=="" (
    if defined rtn echo(!rtn!
    exit /b 0
  )
  :: The remainder is "jeb magic" used to transfer the rtn value across the function endlocal barrier
  if defined rtn (
    set "rtn=!rtn:%%=%%~B!"
    set "rtn=!rtn:"=%%~C!"
    if not defined NotDelayedFlag set "rtn=!rtn:^=^^^^!"
  )
  if defined rtn if not defined NotDelayedFlag set "rtn=%rtn:!=^^^!%" !
  set "replace=%% """"
  for /f "tokens=1,2" %%B in ("!replace!") do (
    endlocal
    endlocal
    set "%~2=%rtn%" !
  )
exit /b 0


:{ebg13S}  {VaSvyr}
::{
::  Fryrpgviryl nccyvrf gur fvzcyr "ebgngr nycunorg 13 cynprf" pvcure
::  gb gur pbagragf bs svyr VaSvyr. Bayl grkg orgjrra pheyl oenprf
::  vf nssrpgrq. Gur nssrpgrq pbagrag pna fcna zhygvcyr yvarf.
::
::  Jevgrf gur erfhygf gb fgqbhg.
::  Creprag pbzcyrgvba vf pbagvahbhfyl jevggra gb fgqree.
::}
  setlocal disableDelayedExpansion
  >&2 cls
  set "{ort}={"}
  set "{raq}=}"
  set "{npgvir}="
  for /f %%N in ('type %1^|find /c /v ""') do set /a "lnCnt=%%N, pct=-1"
  for /f "skip=2 tokens=1,* delims=[]" %%a in ('find /v /n "" %1') do (
    set "ln=%%b"
    setlocal enableDelayedExpansion
    set "str=A!ln!"
    set "len=0"
    for /L %%A in (12,-1,0) do (
      set /a "len|=1<<%%A"
      for %%B in (!len!) do if "!str:~%%B,1!"=="" set /a "len&=~1<<%%A"
    )
    set /a len-=1
    set rtn=
    for /l %%n in (0,1,!len!) do (
      set "c=!ln:~%%n,1!"
      if "!c!" equ "{%}%" set "{npgvir}=1"
      if "!c!" equ "}" set "{npgvir}="
      if defined {npgvir} if defined ${hccre}!c! for /f %%c in ("!c!") do (
        if "!${hccre}:%%c=%%c!" equ "!${hccre}!" (
          set "c=!${hccre}%%c!"
        ) else (
          set "c=!${ybjre}%%c!"
        )
      )
      set "rtn=!rtn!!c!"
    )
    echo(!rtn!
    set /a "oldPct=pct, pct=%%a*100/lnCnt"
    if !oldPct! neq !pct! >&2(cls&echo !pct!%%)
    for /f "tokens=1*" %%A in ("!pct! !{npgvir}!") do (
      endlocal
      set "pct=%%A"
      set "{npgvir}=%%B"
    )
  )
exit /b 0


:modFile File SkipCnt SearchVar [ReplaceVar] [/I]
::
::  Perform a search and replace operation on each line within File
::  after skipping the first SkipCnt lines.
::  Write result to stdout.
::
::  SkipCnt = Number of lines to skip.
::
::  SearchVar = A variable containing the search string.
::
::  ReplaceVar = A variable containing the replacement string.
::               If ReplaceVar is missing or is not defined then the
::               search string is replaced with an empty string.
::
::  The /I option specifies a case insensitive search.
::
::  The number of replacements made is returned as errorlevel.
::
::  If an error occurs then the errorlevel is set to -1.
::
::  Limitations
::    - File must use Windows style line terminators <CR><LF>.
::    - Trailing control characters will be stripped from each line.
::    - The maximum input line length is 1021 characters.
::
setlocal enableDelayedExpansion

  if "%~1" == ":modFile" shift /1
  ::error checking
  if "%~3"=="" (
    >&2 echo ERROR: Insufficient arguments
    exit /b -1
  )
  if not exist "%~1" (
    >&2 echo ERROR: Input file "%~1" does not exist
    exit /b -1
  )
  2>nul pushd "%~1" && (
    popd
    >&2 echo ERROR: Input file "%~1" does not exist
    exit /b -1
  )
  if not defined %~3 (
    >&2 echo ERROR: searchVar %3 not defined
    exit /b -1
  )
  if /i "%~4"=="/I" (
    >&2 echo ERROR: /I option can only be specified as 5th argument
    exit /b -1
  )
  if "%~5" neq "" if /i "%~5" neq "/I" (
    >&2 echo ERROR: Invalid option %5
    exit /b -1
  )
  set /a "SkipCnt=%~2" || (
    >&2 echo ERROR: Invalid SkipCnt %2
    exit /b -1
  )

  ::get search and replace strings
  set "_search=!%~3!"
  set "_replace=!%~4!"

  ::build list of lines that must be changed, simply exit if none
  set "replaceCnt=0"
  set changes="%temp%\%~n1Changes%random%.tmp"
  <"%~1" find /n %~5 "!_search:"=""!^" >%changes% || goto :cleanup

  ::compute length of _search
  set "str=A!_search!"
  set searchLen=0
  for /l %%A in (12,-1,0) do (
    set /a "searchLen|=1<<%%A"
    for %%B in (!searchLen!) do if "!str:~%%B,1!"=="" set /a "searchLen&=~1<<%%A"
  )

  ::count number of lines + 1
  for /f %%N in ('find /v /c "" ^<"%~1"') do set /a "lnCnt=%%N+1"

  ::initialize
  set /a "skip=SkipCnt+2"

  <"%~1" (

    %=skip SkipCnt lines=%
    for /l %%N in (1 1 %SkipCnt%) do set /p "ln="

    %=for each line that needs changing=%
    for %%l in (!searchLen!) do for /f "usebackq delims=[]" %%L in (%changes%) do if %%L gtr %skipCnt% (

      %=read and write preceding lines that don't need changing=%
      for /l %%N in (!skip! 1 %%L) do (
        set "ln="
        set /p "ln="
        if defined ln if "!ln:~1021!" neq "" goto :lineLengthError
        echo(!ln!
      )

      %=read the line that needs changing=%
      set /p "ln="
      if defined ln if "!ln:~1021!" neq "" goto :lineLengthError

      %=compute length of line=%
      set "str=A!ln!"
      set lnLen=0
      for /l %%A in (12,-1,0) do (
        set /a "lnLen|=1<<%%A"
        for %%B in (!lnLen!) do if "!str:~%%B,1!"=="" set /a "lnLen&=~1<<%%A"
      )

      %=perform search and replace on line=%
      set "modLn="
      set /a "end=lnLen-searchLen, beg=0"
      for /l %%o in (0 1 !end!) do (
        if %%o geq !beg! if %~5 "!ln:~%%o,%%l!"=="!_search!" (
          set /a "len=%%o-beg"
          for /f "tokens=1,2" %%a in ("!beg! !len!") do set "modLn=!modLn!!ln:~%%a,%%b!!_replace!"
          set /a "beg=%%o+searchLen, replaceCnt+=1"
        )
      )
      for %%a in (!beg!) do set "modLn=!modLn!!ln:~%%a!"

      %=write the modified line=%
      echo(!modLn!

      %=prepare for next iteration=%
      set /a skip=%%L+2
    )

    %=read and write remaining lines that don't need changing=%
    for /l %%N in (!skip! 1 !lnCnt!) do (
      set "ln="
      set /p "ln="
      if defined ln if "!ln:~1021!" neq "" goto :lineLengthError
      echo(!ln!
    )

  )

  :cleanup
  del %changes%
exit /b %replaceCnt%

:lineLengthError
  del %changes%
  >&2 echo ERROR: Maximum input line length exceeded.
exit /b -1


::{============================================================================
:: QRFPEVCGVBA BS GUR QNGNONFR SBEZNG
::
:: GUR QNGN SVYR PBAGNVAF FRIRENY FRPGVBAF.  RNPU ORTVAF JVGU N YVAR PBAGNVAVAT
:: N AHZORE VQRAGVSLVAT GUR FRPGVBA, NAQ RAQF JVGU N YVAR PBAGNVAVAT "-1".
::
:: FRPGVBA 1: YBAT SBEZ QRFPEVCGVBAF.  RNPU YVAR PBAGNVAF N YBPNGVBA AHZORE,
::      N PBZZN, NAQ N YVAR BS GRKG.  GUR FRG BS (ARPRFFNEVYL NQWNPRAG) YVARF
::      JUBFR AHZOREF NER K SBEZ GUR YBAT QRFPEVCGVBA BS YBPNGVBA K.
:: FRPGVBA 2: FUBEG SBEZ QRFPEVCGVBAF.  FNZR SBEZNG NF YBAT SBEZ.  ABG NYY
::      CYNPRF UNIR FUBEG QRFPEVCGVBAF.
:: FRPGVBA 3: GENIRY GNOYR.  RNPU YVAR PBAGNVAF N YBPNGVBA AHZORE (K), N
::      pbaqvgvba ahzore Z, naq n qrfgvangvba ybpngvba ahzore A,
::      NAQ N YVFG BS ZBGVBA AHZOREF (FRR FRPGVBA 4).
::      RNPU ZBGVBA ERCERFRAGF N IREO JUVPU JVYY TBGB A VS PHEERAGYL NG K.
::
::              VS A<=300       VG VF GUR YBPNGVBA GB TB GB.
::              VS 300<A<=500   A-300 VF HFRQ VA N PBZCHGRQ TBGB GB
::                                      N FRPGVBA BS FCRPVNY PBQR.
::              VS A>500        ZRFFNTR A-500 SEBZ FRPGVBA 6 VF CEVAGRQ,
::                                      NAQ UR FGNLF JURERIRE UR VF.
::      ZRNAJUVYR, Z FCRPVSVRF GUR PBAQVGVBAF BA GUR ZBGVBA.
::              VS Z=0          VG'F HAPBAQVGVBANY.
::              VS 0<Z<100      VG VF QBAR JVGU Z% CEBONOVYVGL.
::              VS Z=100        HAPBAQVGVBANY, OHG SBEOVQQRA GB QJNEIRF.
::              VS 100<Z<=200   UR ZHFG OR PNEELVAT BOWRPG Z-100.
::              VS 200<Z<=300   ZHFG OR PNEELVAT BE VA FNZR EBBZ NF Z-200.
::              VS 300<Z<=400   CEBC(Z ZBQ 100) ZHFG *ABG* OR 0.
::              VS 400<Z<=500   CEBC(Z ZBQ 100) ZHFG *ABG* OR 1.
::              VS 500<Z<=600   CEBC(Z ZBQ 100) ZHFG *ABG* OR 2, RGP.
::      VS GUR PBAQVGVBA (VS NAL) VF ABG ZRG, GURA GUR ARKG *QVSSRERAG*
::      "QRFGVANGVBA" INYHR VF HFRQ (HAYRFF VG SNVYF GB ZRRG *VGF* PBAQVGVBAF,
::      VA JUVPU PNFR GUR ARKG VF SBHAQ, RGP.).  GLCVPNYYL, GUR ARKG QRFG JVYY
::      OR SBE BAR BS GUR FNZR IREOF, FB GUNG VGF BAYL HFR VF NF GUR NYGREANGR
::      QRFGVANGVBA SBE GUBFR IREOF.  SBE VAFGNAPR:
::              15      110022  29      31      34      35      23      43
::              15      14      29
::      GUVF FNLF GUNG, SEBZ YBP 15, NAL BS GUR IREOF 29, 31, RGP., JVYY GNXR
::      UVZ GB 22 VS UR'F PNEELVAT BOWRPG 10, NAQ BGUREJVFR JVYY TBGB 14.
::              11      303008  49
::              11      9       50
::      GUVF FNLF GUNG, SEBZ 11, 49 GNXRF UVZ GB 8 HAYRFF CEBC(3)=0, VA JUVPU
::      PNFR UR TBRF GB 9.  IREO 50 GNXRF UVZ GB 9 ERTNEQYRFF BS CEBC(3).
:: FRPGVBA 4: IBPNOHYNEL.  RNPU YVAR PBAGNVAF N AHZORE (A), N GNO, NAQ N
::      SVIR-YRGGRE JBEQ.  PNYY Z=A/1000.  VS Z=0, GURA GUR JBEQ VF N ZBGVBA
::      IREO SBE HFR VA GENIRYYVAT (FRR FRPGVBA 3).  RYFR, VS Z=1, GUR JBEQ VF
::      NA BOWRPG.  RYFR, VS Z=2, GUR JBEQ VF NA NPGVBA IREO (FHPU NF "PNEEL"
::      BE "NGGNPX").  RYFR, VS Z=3, GUR JBEQ VF N FCRPVNY PNFR IREO (FHPU NF
::      "QVT") NAQ A ZBQ 1000 VF NA VAQRK VAGB FRPGVBA 6.  Bowrpgf terngre
::      guna be rdhny gb 50 NER PBAFVQRERQ GERNFHERF (SBE CVENGR, PYBFRBHG).
:: FRPGVBA 5: BOWRPG QRFPEVCGVBAF.  RNPU YVAR PBAGNVAF N AHZORE (A), N GNO,
::      NAQ N ZRFFNTR.  VS A VF SEBZ 1 GB 100, GUR ZRFFNTR VF GUR "VAIRAGBEL"
::      ZRFFNTR SBE BOWRPG A.  BGUREJVFR, A FUBHYQ OR 000, 100, 200, RGP., NAQ
::      GUR ZRFFNTR FUBHYQ OR GUR QRFPEVCGVBA BS GUR CERPRQVAT BOWRPG JURA VGF
::      CEBC INYHR VF A/100.  GUR A/100 VF HFRQ BAYL GB QVFGVATHVFU ZHYGVCYR
::      ZRFFNTRF SEBZ ZHYGV-YVAR ZRFFNTRF; GUR CEBC VASB NPGHNYYL ERDHVERF NYY
::      ZRFFNTRF SBE NA BOWRPG GB OR CERFRAG NAQ PBAFRPHGVIR.  CEBCREGVRF JUVPU
::      CEBQHPR AB ZRFFNTR FUBHYQ OR TVIRA GUR ZRFFNTR ">$<".
:: FRPGVBA 6: NEOVGENEL ZRFFNTRF.  FNZR SBEZNG NF FRPGVBAF 1, 2, NAQ 5, RKPRCG
::      GUR AHZOREF ORNE AB ERYNGVBA GB NALGUVAT (RKPRCG SBE FCRPVNY IREOF
::      VA FRPGVBA 4).
:: FRPGVBA 7: BOWRPG YBPNGVBAF.  RNPU YVAR PBAGNVAF NA BOWRPG AHZORE NAQ VGF
::      VAVGVNY YBPNGVBA (MREB (BE BZVGGRQ) VS ABAR).  VS GUR BOWRPG VF
::      VZZBINOYR, GUR YBPNGVBA VF SBYYBJRQ OL N "-1".  VS VG UNF GJB YBPNGVBAF
::      (R.T. GUR TENGR) GUR SVEFG YBPNGVBA VF SBYYBJRQ JVGU GUR FRPBAQ, NAQ
::      GUR BOWRPG VF NFFHZRQ GB OR VZZBINOYR.
:: FRPGVBA 8: NPGVBA QRSNHYGF.  RNPU YVAR PBAGNVAF NA "NPGVBA-IREO" AHZORE NAQ
::      GUR VAQRK (VA FRPGVBA 6) BS GUR QRSNHYG ZRFFNTR SBE GUR IREO.
:: FRPGVBA 9: YVDHVQ NFFRGF, RGP.  RNPU YVAR PBAGNVAF N AHZORE (A) NAQ HC GB 20
::      YBPNGVBA AHZOREF.  OVG A (JURER 0 VF GUR HAVGF OVG) VF FRG VA PBAQ(YBP)
::      SBE RNPU YBP TVIRA.  GUR PBAQ OVGF PHEERAGYL NFFVTARQ NER:
::              0       YVTUG
::              1       VS OVG 2 VF BA: BA SBE BVY, BSS SBE JNGRE
::              2       YVDHVQ NFFRG, FRR OVG 1
::              3       CVENGR QBRFA'G TB URER HAYRFF SBYYBJVAT CYNLRE
::      BGURE OVGF NER HFRQ GB VAQVPNGR NERNF BS VAGRERFG GB "UVAG" EBHGVARF:
::              4       GELVAT GB TRG VAGB PNIR
::              5       GELVAT GB PNGPU OVEQ
::              6       GELVAT GB QRNY JVGU FANXR
::              7       YBFG VA ZNMR
::              8       CBAQREVAT QNEX EBBZ
::              9       NG JVGG'F RAQ
::      PBAQ(YBP) VF FRG GB 2, BIREEVQVAT NYY BGURE OVGF, VS YBP UNF SBEPRQ
::      ZBGVBA.
:: FRPGVBA 10: PYNFF ZRFFNTRF.  RNPU YVAR PBAGNVAF N AHZORE (A), N GNO, NAQ N
::      ZRFFNTR QRFPEVOVAT N PYNFFVSVPNGVBA BS CYNLRE.  GUR FPBEVAT FRPGVBA
::      FRYRPGF GUR NCCEBCEVNGR ZRFFNTR, JURER RNPU ZRFFNTR VF PBAFVQRERQ GB
::      NCCYL GB CYNLREF JUBFR FPBERF NER UVTURE GUNA GUR CERIVBHF A OHG ABG
::      UVTURE GUNA GUVF A.  ABGR GUNG GURFR FPBERF CEBONOYL PUNATR JVGU RIREL
::      ZBQVSVPNGVBA (NAQ CNEGVPHYNEYL RKCNAFVBA) BS GUR CEBTENZ.
:: FRPGVBA 11: UVAGF.  RNPU YVAR PBAGNVAF N UVAG AHZORE (PBEERFCBAQVAT GB N
::      PBAQ OVG, FRR FRPGVBA 9), GUR AHZORE BS GHEAF UR ZHFG OR NG GUR EVTUG
::      YBP(F) ORSBER GEVTTREVAT GUR UVAG, GUR CBVAGF QRQHPGRQ SBE GNXVAT GUR
::      UVAG, GUR ZRFFNTR AHZORE (FRPGVBA 6) BS GUR DHRFGVBA, NAQ GUR ZRFFNTR
::      AHZORE BS GUR UVAG.  GURFR INYHRF NER FGNFURQ VA GUR "UVAGF" NEENL.
::      UAGZNK VF FRG GB GUR ZNK UVAG AHZORE (<= UAGFVM).  AHZOREF 1-3 NER
::      HAHFNOYR FVAPR PBAQ OVGF NER BGUREJVFR NFFVTARQ, FB 2 VF HFRQ GB
::      ERZRZORE VS UR'F ERNQ GUR PYHR VA GUR ERCBFVGBEL, NAQ 3 VF HFRQ GB
::      ERZRZORE JURGURE UR NFXRQ SBE VAFGEHPGVBAF (TRGF ZBER GHEAF, OHG YBFRF
::      CBVAGF).
::      Gur cbvag qrqhpgvba vf nyfb n snpgbe hfrq gb qrgrezvar ubj zhpu gb
::      rkgraq gur yvsr bs gur onggrevrf vs gur uvag vf npprcgrq.
:: FRPGVBA 0: RAQ BS QNGNONFR.
::}============================================================================
:: Begin Database {
1
1,Lbh ner fgnaqvat ng gur raq bs n ebnq orsber n fznyy oevpx ohvyqvat.
1,Nebhaq lbh vf n sberfg.  N fznyy fgernz sybjf bhg bs gur ohvyqvat naq
1,qbja n thyyl.
2,Lbh unir jnyxrq hc n uvyy, fgvyy va gur sberfg.  Gur ebnq fybcrf onpx
2,qbja gur bgure fvqr bs gur uvyy.  Gurer vf n ohvyqvat va gur qvfgnapr.
3,Lbh ner vafvqr n ohvyqvat, n jryy ubhfr sbe n ynetr fcevat.
4,Lbh ner va n inyyrl va gur sberfg orfvqr n fgernz ghzoyvat nybat n
4,ebpxl orq.
5,Lbh ner va bcra sberfg, jvgu n qrrc inyyrl gb bar fvqr.
6,Lbh ner va bcra sberfg arne obgu n inyyrl naq n ebnq.
7,Ng lbhe srrg nyy gur jngre bs gur fgernz fcynfurf vagb n 2-vapu fyvg
7,va gur ebpx.  Qbjafgernz gur fgernzorq vf oner ebpx.
8,Lbh ner va n 20-sbbg qrcerffvba sybberq jvgu oner qveg.  Frg vagb gur
8,qveg vf n fgebat fgrry tengr zbhagrq va pbapergr.  N qel fgernzorq
8,yrnqf vagb gur qrcerffvba.
9,Lbh ner va n fznyy punzore orarngu n 3k3 fgrry tengr gb gur fhesnpr.
9,N ybj penjy bire pbooyrf yrnqf vajneq gb gur jrfg.
10,Lbh ner penjyvat bire pbooyrf va n ybj cnffntr.  Gurer vf n qvz yvtug
10,ng gur rnfg raq bs gur cnffntr.
11,Lbh ner va n ebbz svyyrq jvgu qroevf jnfurq va sebz gur fhesnpr.
11,N ybj jvqr cnffntr jvgu pbooyrf orpbzrf cyhttrq jvgu zhq naq qroevf
11,urer, ohg na njxjneq pnalba yrnqf hcjneq naq jrfg.  N abgr ba gur jnyy
11,fnlf "ZNTVP JBEQ KLMML".
12,Lbh ner va na njxjneq fybcvat rnfg/jrfg pnalba.
13,Lbh ner va n fcyraqvq punzore guvegl srrg uvtu.  Gur jnyyf ner sebmra
13,eviref bs benatr fgbar.  Na njxjneq pnalba naq n tbbq cnffntr rkvg
13,sebz rnfg naq jrfg fvqrf bs gur punzore.
14,Ng lbhe srrg vf n fznyy cvg oernguvat genprf bs juvgr zvfg.  Na rnfg
14,cnffntr raqf urer rkprcg sbe n fznyy penpx yrnqvat ba.
15,Lbh ner ng bar raq bs n infg unyy fgergpuvat sbejneq bhg bs fvtug gb
15,gur jrfg.  Gurer ner bcravatf gb rvgure fvqr.  Arneol, n jvqr fgbar
15,fgnvepnfr yrnqf qbjajneq.  Gur unyy vf svyyrq jvgu jvfcf bs juvgr zvfg
15,fjnlvat gb naq seb nyzbfg nf vs nyvir.  N pbyq jvaq oybjf hc gur
15,fgnvepnfr.  Gurer vf n cnffntr ng gur gbc bs n qbzr oruvaq lbh.
16,Gur penpx vf sne gbb fznyy sbe lbh gb sbyybj.
17,Lbh ner ba gur rnfg onax bs n svffher fyvpvat pyrne npebff gur unyy.
17,Gur zvfg vf dhvgr guvpx urer, naq gur svffher vf gbb jvqr gb whzc.
18,Guvf vf n ybj ebbz jvgu n pehqr abgr ba gur jnyy.  Gur abgr fnlf,
18,"Lbh jba'g trg vg hc gur fgrcf".
19,Lbh ner va gur Unyy bs gur Zbhagnva Xvat, jvgu cnffntrf bss va nyy
19,qverpgvbaf.
20,Lbh ner ng gur obggbz bs gur cvg jvgu n oebxra arpx.
21,Lbh qvqa'g znxr vg.
22,Gur qbzr vf hapyvzonoyr.
23,Lbh ner ng gur jrfg raq bs gur Gjbcvg Ebbz.  Gurer vf n ynetr ubyr va
23,gur jnyy nobir gur cvg ng guvf raq bs gur ebbz.
24,Lbh ner ng gur obggbz bs gur rnfgrea cvg va gur Gjbcvg Ebbz.  Gurer vf
24,n fznyy cbby bs bvy va bar pbeare bs gur cvg.
25,Lbh ner ng gur obggbz bs gur jrfgrea cvg va gur Gjbcvg Ebbz.  Gurer vf
25,n ynetr ubyr va gur jnyy nobhg 25 srrg nobir lbh.
26,Lbh pynzore hc gur cynag naq fpheel guebhtu gur ubyr ng gur gbc.
27,Lbh ner ba gur jrfg fvqr bs gur svffher va gur Unyy bs Zvfgf.
28,Lbh ner va n ybj abegu/fbhgu cnffntr ng n ubyr va gur sybbe.  Gur
28,ubyr tbrf qbja gb na rnfg/jrfg cnffntr.
29,Lbh ner va gur fbhgu fvqr punzore.
30,Lbh ner va gur jrfg fvqr punzore bs gur Unyy bs gur Zbhagnva Xvat.
30,N cnffntr pbagvahrf jrfg naq hc urer.
31,>$<
32,Lbh pna'g trg ol gur fanxr.
33,Lbh ner va n ynetr ebbz, jvgu n cnffntr gb gur fbhgu, n cnffntr gb gur
33,jrfg, naq n jnyy bs oebxra ebpx gb gur rnfg.  Gurer vf n ynetr "L2" ba
33,n ebpx va gur ebbz'f pragre.
34,Lbh ner va n whzoyr bs ebpx, jvgu penpxf rireljurer.
35,Lbh'er ng n ybj jvaqbj bireybbxvat n uhtr cvg, juvpu rkgraqf hc bhg bs
35,fvtug.  N sybbe vf vaqvfgvapgyl ivfvoyr bire 50 srrg orybj.  Genprf bs
35,juvgr zvfg pbire gur sybbe bs gur cvg, orpbzvat guvpxre gb gur evtug.
35,Znexf va gur qhfg nebhaq gur jvaqbj jbhyq frrz gb vaqvpngr gung
35,fbzrbar unf orra urer erpragyl.  Qverpgyl npebff gur cvg sebz lbh naq
35,25 srrg njnl gurer vf n fvzvyne jvaqbj ybbxvat vagb n yvtugrq ebbz.  N
35,funqbjl svther pna or frra gurer crrevat onpx ng lbh.
36,Lbh ner va n qvegl oebxra cnffntr.  Gb gur rnfg vf n penjy.  Gb gur
36,jrfg vf n ynetr cnffntr.  Nobir lbh vf n ubyr gb nabgure cnffntr.
37,Lbh ner ba gur oevax bs n fznyy pyrna pyvzonoyr cvg.  N penjy yrnqf
37,jrfg.
38,Lbh ner va gur obggbz bs n fznyy cvg jvgu n yvggyr fgernz, juvpu
38,ragref naq rkvgf guebhtu gval fyvgf.
39,Lbh ner va n ynetr ebbz shyy bs qhfgl ebpxf.  Gurer vf n ovt ubyr va
39,gur sybbe.  Gurer ner penpxf rireljurer, naq n cnffntr yrnqvat rnfg.
40,Lbh unir penjyrq guebhtu n irel ybj jvqr cnffntr cnenyyry gb naq abegu
40,bs gur Unyy bs Zvfgf.
41,Lbh ner ng gur jrfg raq bs gur Unyy bs Zvfgf.  N ybj jvqr penjy pbagvahrf
41,jrfg naq nabgure tbrf abegu.  Gb gur fbhgu vf n yvggyr cnffntr 6 srrg
41,bss gur sybbe.
42,Lbh ner va n znmr bs gjvfgl yvggyr cnffntrf, nyy nyvxr.
43,Lbh ner va n znmr bs gjvfgl yvggyr cnffntrf, nyy nyvxr.
44,Lbh ner va n znmr bs gjvfgl yvggyr cnffntrf, nyy nyvxr.
45,Lbh ner va n znmr bs gjvfgl yvggyr cnffntrf, nyy nyvxr.
46,Qrnq raq.
47,Qrnq raq.
48,Qrnq raq.
49,Lbh ner va n znmr bs gjvfgl yvggyr cnffntrf, nyy nyvxr.
50,Lbh ner va n znmr bs gjvfgl yvggyr cnffntrf, nyy nyvxr.
51,Lbh ner va n znmr bs gjvfgl yvggyr cnffntrf, nyy nyvxr.
52,Lbh ner va n znmr bs gjvfgl yvggyr cnffntrf, nyy nyvxr.
53,Lbh ner va n znmr bs gjvfgl yvggyr cnffntrf, nyy nyvxr.
54,Qrnq raq.
55,Lbh ner va n znmr bs gjvfgl yvggyr cnffntrf, nyy nyvxr.
56,Qrnq raq.
57,Lbh ner ba gur oevax bs n guvegl sbbg cvg jvgu n znffvir benatr pbyhza
57,qbja bar jnyy.  Lbh pbhyq pyvzo qbja urer ohg lbh pbhyq abg trg onpx
57,hc.  Gur znmr pbagvahrf ng guvf yriry.
58,Qrnq raq.
59,Lbh unir penjyrq guebhtu n irel ybj jvqr cnffntr cnenyyry gb naq abegu
59,bs gur Unyy bs Zvfgf.
60,Lbh ner ng gur rnfg raq bs n irel ybat unyy nccneragyl jvgubhg fvqr
60,punzoref.  Gb gur rnfg n ybj jvqr penjy fynagf hc.  Gb gur abegu n
60,ebhaq gjb sbbg ubyr fynagf qbja.
61,Lbh ner ng gur jrfg raq bs n irel ybat srngheryrff unyy.  Gur unyy
61,wbvaf hc jvgu n aneebj abegu/fbhgu cnffntr.
62,Lbh ner ng n pebffbire bs n uvtu abegu/fbhgu cnffntr naq n ybj rnfg/jrfg
62,bar.
63,Qrnq raq.
64,Lbh ner ng n pbzcyrk whapgvba.  N ybj unaqf naq xarrf cnffntr sebz gur
64,abegu wbvaf n uvture penjy sebz gur rnfg gb znxr n jnyxvat cnffntr
64,tbvat jrfg.  Gurer vf nyfb n ynetr ebbz nobir.  Gur nve vf qnzc urer.
65,Lbh ner va Orqdhvyg, n ybat rnfg/jrfg cnffntr jvgu ubyrf rireljurer.
65,Gb rkcyber ng enaqbz fryrpg abegu, fbhgu, hc, be qbja.
66,Lbh ner va n ebbz jubfr jnyyf erfrzoyr Fjvff purrfr.  Boivbhf cnffntrf
66,tb jrfg, rnfg, abegurnfg, naq abegujrfg.  Cneg bs gur ebbz vf bpphcvrq
66,ol n ynetr orqebpx oybpx.
67,Lbh ner ng gur rnfg raq bs gur Gjbcvg Ebbz.  Gur sybbe urer vf
67,yvggrerq jvgu guva ebpx fynof, juvpu znxr vg rnfl gb qrfpraq gur cvgf.
67,Gurer vf n cngu urer olcnffvat gur cvgf gb pbaarpg cnffntrf sebz rnfg
67,naq jrfg.  Gurer ner ubyrf nyy bire, ohg gur bayl ovt bar vf ba gur
67,jnyy qverpgyl bire gur jrfg cvg jurer lbh pna'g trg gb vg.
68,Lbh ner va n ynetr ybj pvephyne punzore jubfr sybbe vf na vzzrafr fyno
68,snyyra sebz gur prvyvat (Fyno Ebbz).  Rnfg naq jrfg gurer bapr jrer
68,ynetr cnffntrf, ohg gurl ner abj svyyrq jvgu obhyqref.  Ybj fznyy
68,cnffntrf tb abegu naq fbhgu, naq gur fbhgu bar dhvpxyl oraqf jrfg
68,nebhaq gur obhyqref.
69,Lbh ner va n frperg abegu/fbhgu pnalba nobir n ynetr ebbz.
70,Lbh ner va n frperg abegu/fbhgu pnalba nobir n fvmnoyr cnffntr.
71,Lbh ner va n frperg pnalba ng n whapgvba bs guerr pnalbaf, ornevat
71,abegu, fbhgu, naq fbhgurnfg.  Gur abegu bar vf nf gnyy nf gur bgure
71,gjb pbzovarq.
72,Lbh ner va n ynetr ybj ebbz.  Penjyf yrnq abegu, fbhgurnfg, naq
72,fbhgujrfg.
73,Qrnq raq penjy.
74,Lbh ner va n frperg pnalba juvpu urer ehaf rnfg/jrfg.  Vg pebffrf
74,bire n irel gvtug pnalba 15 srrg orybj.  Vs lbh tb qbja lbh znl abg
74,or noyr gb trg onpx hc.
75,Lbh ner ng n jvqr cynpr va n irel gvtug abegu/fbhgu pnalba.
76,Gur pnalba urer orpbzrf gbb gvtug gb tb shegure fbhgu.
77,Lbh ner va n gnyy rnfg/jrfg pnalba.  N ybj gvtug penjy tbrf 3 srrg
77,abegu naq frrzf gb bcra hc.
78,Gur pnalba ehaf vagb n znff bs obhyqref -- qrnq raq.
79,Gur fgernz sybjf bhg guebhtu n cnve bs 1 sbbg qvnzrgre frjre cvcrf.
79,Vg jbhyq or nqivfnoyr gb hfr gur rkvg.
80,Lbh ner va n znmr bs gjvfgl yvggyr cnffntrf, nyy nyvxr.
81,Qrnq raq.
82,Qrnq raq.
83,Lbh ner va n znmr bs gjvfgl yvggyr cnffntrf, nyy nyvxr.
84,Lbh ner va n znmr bs gjvfgl yvggyr cnffntrf, nyy nyvxr.
85,Qrnq raq.
86,Qrnq raq.
87,Lbh ner va n znmr bs gjvfgl yvggyr cnffntrf, nyy nyvxr.
88,Lbh ner va n ybat, aneebj pbeevqbe fgergpuvat bhg bs fvtug gb gur
88,jrfg.  Ng gur rnfgrea raq vf n ubyr guebhtu juvpu lbh pna frr n
88,cebshfvba bs yrnirf.
89,Gurer vf abguvat urer gb pyvzo.  Hfr "HC" be "BHG" gb yrnir gur cvg.
90,Lbh unir pyvzorq hc gur cynag naq bhg bs gur cvg.
91,Lbh ner ng gur gbc bs n fgrrc vapyvar nobir n ynetr ebbz.  Lbh pbhyq
91,pyvzo qbja urer, ohg lbh jbhyq abg or noyr gb pyvzo hc.  Gurer vf n
91,cnffntr yrnqvat onpx gb gur abegu.
92,Lbh ner va gur Tvnag Ebbz.  Gur prvyvat urer vf gbb uvtu hc sbe lbhe
92,ynzc gb fubj vg.  Pnireabhf cnffntrf yrnq rnfg, abegu, naq fbhgu.  Ba
92,gur jrfg jnyy vf fpenjyrq gur vafpevcgvba, "SRR SVR SBR SBB" [fvp].
93,Gur cnffntr urer vf oybpxrq ol n erprag pnir-va.
94,Lbh ner ng bar raq bs na vzzrafr abegu/fbhgu cnffntr.
95,Lbh ner va n zntavsvprag pnirea jvgu n ehfuvat fgernz, juvpu pnfpnqrf
95,bire n fcnexyvat jngresnyy vagb n ebnevat juveycbby juvpu qvfnccrnef
95,guebhtu n ubyr va gur sybbe.  Cnffntrf rkvg gb gur fbhgu naq jrfg.
96,Lbh ner va gur Fbsg Ebbz.  Gur jnyyf ner pbirerq jvgu urnil phegnvaf,
96,gur sybbe jvgu n guvpx cvyr pnecrg.  Zbff pbiref gur prvyvat.
97,Guvf vf gur Bevragny Ebbz.  Napvrag bevragny pnir qenjvatf pbire gur
97,jnyyf.  N tragyl fybcvat cnffntr yrnqf hcjneq gb gur abegu, nabgure
97,cnffntr yrnqf fbhgurnfg, naq n unaqf naq xarrf penjy yrnqf jrfg.
98,Lbh ner sbyybjvat n jvqr cngu nebhaq gur bhgre rqtr bs n ynetr pnirea.
98,Sne orybj, guebhtu n urnil juvgr zvfg, fgenatr fcynfuvat abvfrf pna or
98,urneq.  Gur zvfg evfrf hc guebhtu n svffher va gur prvyvat.  Gur cngu
98,rkvgf gb gur fbhgu naq jrfg.
99,Lbh ner va na nypbir.  N fznyy abegujrfg cngu frrzf gb jvqra nsgre n
99,fubeg qvfgnapr.  Na rkgerzryl gvtug ghaary yrnqf rnfg.  Vg ybbxf yvxr
99,n irel gvtug fdhrrmr.  Na rrevr yvtug pna or frra ng gur bgure raq.
100,Lbh'er va n fznyy punzore yvg ol na rrevr terra yvtug.  Na rkgerzryl
100,aneebj ghaary rkvgf gb gur jrfg.  N qnex pbeevqbe yrnqf abegurnfg.
101,Lbh'er va gur Qnex Ebbz.  N pbeevqbe yrnqvat fbhgu vf gur bayl rkvg.
102,Lbh ner va na nepurq unyy.  N pbeny cnffntr bapr pbagvahrq hc naq rnfg
102,sebz urer, ohg vf abj oybpxrq ol qroevf.  Gur nve fzryyf bs frn jngre.
103,Lbh'er va n ynetr ebbz pneirq bhg bs frqvzragnel ebpx.  Gur sybbe naq
103,jnyyf ner yvggrerq jvgu ovgf bs furyyf vzorqqrq va gur fgbar.  N
103,funyybj cnffntr cebprrqf qbjajneq, naq n fbzrjung fgrrcre bar yrnqf
103,hc.  N ybj unaqf naq xarrf cnffntr ragref sebz gur fbhgu.
104,Lbh ner va n ybat fybcvat pbeevqbe jvgu enttrq funec jnyyf.
105,Lbh ner va n phy-qr-fnp nobhg rvtug srrg npebff.
106,Lbh ner va na nagrebbz yrnqvat gb n ynetr cnffntr gb gur rnfg.  Fznyy
106,cnffntrf tb jrfg naq hc.  Gur erzanagf bs erprag qvttvat ner rivqrag.
106,N fvta va zvqnve urer fnlf: "Pnir haqre pbafgehpgvba orlbaq guvf cbvag.
106,Cebprrq ng bja evfx.  [Jvgg Pbafgehpgvba Pbzcnal]"
107,Lbh ner va n znmr bs gjvfgl yvggyr cnffntrf, nyy qvssrerag.
108,Lbh ner ng Jvgg'f Raq.  Cnffntrf yrnq bss va NYY qverpgvbaf.
109,Lbh ner va n abegu/fbhgu pnalba nobhg 25 srrg npebff.  Gur sybbe vf
109,pbirerq ol juvgr zvfg frrcvat va sebz gur abegu.  Gur jnyyf rkgraq
109,hcjneq sbe jryy bire 100 srrg.  Fhfcraqrq sebz fbzr hafrra cbvag sne
109,nobir lbh, na rabezbhf gjb-fvqrq zveebe vf unatvat cnenyyry gb naq
109,zvqjnl orgjrra gur pnalba jnyyf.  (Gur zveebe vf boivbhfyl cebivqrq
109,sbe gur hfr bs gur qjneirf, jub nf lbh xabj, ner rkgerzryl inva.)  N
109,fznyy jvaqbj pna or frra va rvgure jnyy, fbzr svsgl srrg hc.
110,Lbh'er ng n ybj jvaqbj bireybbxvat n uhtr cvg, juvpu rkgraqf hc bhg bs
110,fvtug.  N sybbe vf vaqvfgvapgyl ivfvoyr bire 50 srrg orybj.  Genprf bs
110,juvgr zvfg pbire gur sybbe bs gur cvg, orpbzvat guvpxre gb gur yrsg.
110,Znexf va gur qhfg nebhaq gur jvaqbj jbhyq frrz gb vaqvpngr gung
110,fbzrbar unf orra urer erpragyl.  Qverpgyl npebff gur cvg sebz lbh naq
110,25 srrg njnl gurer vf n fvzvyne jvaqbj ybbxvat vagb n yvtugrq ebbz.  N
110,funqbjl svther pna or frra gurer crrevat onpx ng lbh.
111,N ynetr fgnynpgvgr rkgraqf sebz gur ebbs naq nyzbfg ernpurf gur sybbe
111,orybj.  Lbh pbhyq pyvzo qbja vg, naq whzc sebz vg gb gur sybbe, ohg
111,univat qbar fb lbh jbhyq or hanoyr gb ernpu vg gb pyvzo onpx hc.
112,Lbh ner va n yvggyr znmr bs gjvfgvat cnffntrf, nyy qvssrerag.
113,Lbh ner ng gur rqtr bs n ynetr haqretebhaq erfreibve.  Na bcndhr pybhq
113,bs juvgr zvfg svyyf gur ebbz naq evfrf encvqyl hcjneq.  Gur ynxr vf
113,srq ol n fgernz, juvpu ghzoyrf bhg bs n ubyr va gur jnyy nobhg 10 srrg
113,bireurnq naq fcynfurf abvfvyl vagb gur jngre fbzrjurer jvguva gur
113,zvfg.  Gur bayl cnffntr tbrf onpx gbjneq gur fbhgu.
114,Qrnq raq.
115,Lbh ner ng gur abegurnfg raq bs na vzzrafr ebbz, rira ynetre guna gur
115,tvnag ebbz.  Vg nccrnef gb or n ercbfvgbel sbe gur "NQIRAGHER"
115,cebtenz.  Znffvir gbepurf sne bireurnq ongur gur ebbz jvgu fzbxl
115,lryybj yvtug.  Fpnggrerq nobhg lbh pna or frra n cvyr bs obggyrf (nyy
115,bs gurz rzcgl), n ahefrel bs lbhat ornafgnyxf zhezhevat dhvrgyl, n orq
115,bs blfgref, n ohaqyr bs oynpx ebqf jvgu ehfgl fgnef ba gurve raqf, naq
115,n pbyyrpgvba bs oenff ynagreaf.  Bss gb bar fvqr n terng znal qjneirf
115,ner fyrrcvat ba gur sybbe, fabevat ybhqyl.  N fvta arneol ernqf: "Qb
115,abg qvfgheo gur qjneirf!"  Na vzzrafr zveebe vf unatvat ntnvafg bar
115,jnyy, naq fgergpurf gb gur bgure raq bs gur ebbz, jurer inevbhf bgure
115,fhaqel bowrpgf pna or tyvzcfrq qvzyl va gur qvfgnapr.
116,Lbh ner ng gur fbhgujrfg raq bs gur ercbfvgbel.  Gb bar fvqr vf n cvg
116,shyy bs svrepr terra fanxrf.  Ba gur bgure fvqr vf n ebj bs fznyy
116,jvpxre pntrf, rnpu bs juvpu pbagnvaf n yvggyr fhyxvat oveq.  Va bar
116,pbeare vf n ohaqyr bs oynpx ebqf jvgu ehfgl znexf ba gurve raqf.  N
116,ynetr ahzore bs iryirg cvyybjf ner fpnggrerq nobhg ba gur sybbe.  N
116,infg zveebe fgergpurf bss gb gur abegurnfg.  Ng lbhe srrg vf n ynetr
116,fgrry tengr, arkg gb juvpu vf n fvta juvpu ernqf, "Gernfher inhyg.
116,Xrlf va Znva Bssvpr."
117,Lbh ner ba bar fvqr bs n ynetr, qrrc punfz.  N urnil juvgr zvfg evfvat
117,hc sebz orybj bofpherf nyy ivrj bs gur sne fvqr.  N fbhgujrfg cngu
117,yrnqf njnl sebz gur punfz vagb n jvaqvat pbeevqbe.
118,Lbh ner va n ybat jvaqvat pbeevqbe fybcvat bhg bs fvtug va obgu
118,qverpgvbaf.
119,Lbh ner va n frperg pnalba juvpu rkvgf gb gur abegu naq rnfg.
120,Lbh ner va n frperg pnalba juvpu rkvgf gb gur abegu naq rnfg.
121,Lbh ner va n frperg pnalba juvpu rkvgf gb gur abegu naq rnfg.
122,Lbh ner ba gur sne fvqr bs gur punfz.  N abegurnfg cngu yrnqf njnl
122,sebz gur punfz ba guvf fvqr.
123,Lbh'er va n ybat rnfg/jrfg pbeevqbe.  N snvag ehzoyvat abvfr pna or
123,urneq va gur qvfgnapr.
124,Gur cngu sbexf urer.  Gur yrsg sbex yrnqf abegurnfg.  N qhyy ehzoyvat
124,frrzf gb trg ybhqre va gung qverpgvba.  Gur evtug sbex yrnqf fbhgurnfg
124,qbja n tragyr fybcr.  Gur znva pbeevqbe ragref sebz gur jrfg.
125,Gur jnyyf ner dhvgr jnez urer.  Sebz gur abegu pna or urneq n fgrnql
125,ebne, fb ybhq gung gur ragver pnir frrzf gb or gerzoyvat.  Nabgure
125,cnffntr yrnqf fbhgu, naq n ybj penjy tbrf rnfg.
126,Lbh ner ba gur rqtr bs n oerngu-gnxvat ivrj.  Sne orybj lbh vf na
126,npgvir ibypnab, sebz juvpu terng tbhgf bs zbygra ynin pbzr fhetvat
126,bhg, pnfpnqvat onpx qbja vagb gur qrcguf.  Gur tybjvat ebpx svyyf gur
126,snegurfg ernpurf bs gur pnirea jvgu n oybbq-erq tyner, tvivat rirel-
126,guvat na rrevr, znpnoer nccrnenapr.  Gur nve vf svyyrq jvgu syvpxrevat
126,fcnexf bs nfu naq n urnil fzryy bs oevzfgbar.  Gur jnyyf ner ubg gb
126,gur gbhpu, naq gur guhaqrevat bs gur ibypnab qebjaf bhg nyy bgure
126,fbhaqf.  Rzorqqrq va gur wnttrq ebbs sne bireurnq ner zlevnq gjvfgrq
126,sbezngvbaf pbzcbfrq bs cher juvgr nynonfgre, juvpu fpnggre gur zhexl
126,yvtug vagb fvavfgre nccnevgvbaf hcba gur jnyyf.  Gb bar fvqr vf n qrrc
126,tbetr, svyyrq jvgu n ovmneer punbf bs gbegherq ebpx juvpu frrzf gb
126,unir orra pensgrq ol gur qrivy uvzfrys.  Na vzzrafr evire bs sver
126,penfurf bhg sebz gur qrcguf bs gur ibypnab, oheaf vgf jnl guebhtu gur
126,tbetr, naq cyhzzrgf vagb n obggbzyrff cvg sne bss gb lbhe yrsg.  Gb
126,gur evtug, na vzzrafr trlfre bs oyvfgrevat fgrnz rehcgf pbagvahbhfyl
126,sebz n oneera vfynaq va gur pragre bs n fhyshebhf ynxr, juvpu ohooyrf
126,bzvabhfyl.  Gur sne evtug jnyy vf nsynzr jvgu na vapnaqrfprapr bs vgf
126,bja, juvpu yraqf na nqqvgvbany vasreany fcyraqbe gb gur nyernql
126,uryyvfu fprar.  N qnex, sberobqvat cnffntr rkvgf gb gur fbhgu.
127,Lbh ner va n fznyy punzore svyyrq jvgu ynetr obhyqref.  Gur jnyyf ner
127,irel jnez, pnhfvat gur nve va gur ebbz gb or nyzbfg fgvsyvat sebz gur
127,urng.  Gur bayl rkvg vf n penjy urnqvat jrfg, guebhtu juvpu vf pbzvat
127,n ybj ehzoyvat.
128,Lbh ner jnyxvat nybat n tragyl fybcvat abegu/fbhgu cnffntr yvarq jvgu
128,bqqyl funcrq yvzrfgbar sbezngvbaf.
129,Lbh ner fgnaqvat ng gur ragenapr gb n ynetr, oneera ebbz.  N fvta
129,cbfgrq nobir gur ragenapr ernqf:  "Pnhgvba!  Orne va ebbz!"
130,Lbh ner vafvqr n oneera ebbz.  Gur pragre bs gur ebbz vf pbzcyrgryl
130,rzcgl rkprcg sbe fbzr qhfg.  Znexf va gur qhfg yrnq njnl gbjneq gur
130,sne raq bs gur ebbz.  Gur bayl rkvg vf gur jnl lbh pnzr va.
131,Lbh ner va n znmr bs gjvfgvat yvggyr cnffntrf, nyy qvssrerag.
132,Lbh ner va n yvggyr znmr bs gjvfgl cnffntrf, nyy qvssrerag.
133,Lbh ner va n gjvfgvat znmr bs yvggyr cnffntrf, nyy qvssrerag.
134,Lbh ner va n gjvfgvat yvggyr znmr bs cnffntrf, nyy qvssrerag.
135,Lbh ner va n gjvfgl yvggyr znmr bs cnffntrf, nyy qvssrerag.
136,Lbh ner va n gjvfgl znmr bs yvggyr cnffntrf, nyy qvssrerag.
137,Lbh ner va n yvggyr gjvfgl znmr bs cnffntrf, nyy qvssrerag.
138,Lbh ner va n znmr bs yvggyr gjvfgvat cnffntrf, nyy qvssrerag.
139,Lbh ner va n znmr bs yvggyr gjvfgl cnffntrf, nyy qvssrerag.
140,Qrnq raq.
-1,Raq
2
1,Lbh'er ng raq bs ebnq ntnva.
2,Lbh'er ng uvyy va ebnq.
3,Lbh'er vafvqr ohvyqvat.
4,Lbh'er va inyyrl.
5,Lbh'er va sberfg.
6,Lbh'er va sberfg.
7,Lbh'er ng fyvg va fgernzorq.
8,Lbh'er bhgfvqr tengr.
9,Lbh'er orybj gur tengr.
10,Lbh'er va Pbooyr Penjy.
11,Lbh'er va Qroevf Ebbz.
13,Lbh'er va Oveq Punzore.
14,Lbh'er ng gbc bs Fznyy Cvg.
15,Lbh'er va Unyy bs Zvfgf.
17,Lbh'er ba rnfg onax bs Svffher.
18,Lbh'er va Ahttrg bs Tbyq Ebbz.
19,Lbh'er va Unyy bs Zg Xvat.
23,Lbh'er ng jrfg raq bs Gjbcvg Ebbz.
24,Lbh'er va Rnfg Cvg.
25,Lbh'er va Jrfg Cvg.
33,Lbh'er ng "L2".
35,Lbh'er ng jvaqbj ba Cvg.
36,Lbh'er va Qvegl Cnffntr.
39,Lbh'er va Qhfgl Ebpx Ebbz.
41,Lbh'er ng jrfg raq bs Unyy bs Zvfgf.
57,Lbh'er ng oevax bs Cvg.
60,Lbh'er ng rnfg raq bs Ybat Unyy.
61,Lbh'er ng jrfg raq bs Ybat Unyy.
64,Lbh'er ng Pbzcyrk Whapgvba.
66,Lbh'er va Fjvff Purrfr Ebbz.
67,Lbh'er ng rnfg raq bs Gjbcvg Ebbz.
68,Lbh'er va Fyno Ebbz.
71,Lbh'er ng Whapgvba bs Guerr Frperg Pnalbaf.
74,Lbh'er va Frperg Rnfg/Jrfg Pnalba nobir gvtug pnalba.
88,Lbh'er va Aneebj Pbeevqbe.
91,Lbh'er ng fgrrc vapyvar nobir Ynetr Ebbz.
92,Lbh'er va Tvnag Ebbz.
95,Lbh'er va Pnirea jvgu Jngresnyy.
96,Lbh'er va Fbsg Ebbz.
97,Lbh'er va Bevragny Ebbz.
98,Lbh'er va Zvfgl Pnirea.
99,Lbh'er va Nypbir.
100,Lbh'er va Cybire Ebbz.
101,Lbh'er va Qnex Ebbz.
102,Lbh'er va Nepurq Unyy.
103,Lbh'er va Furyy Ebbz.
106,Lbh'er va Nagrebbz.
108,Lbh'er ng Jvgg'f Raq.
109,Lbh'er va Zveebe Pnalba.
110,Lbh'er ng jvaqbj ba Cvg.
111,Lbh'er ng gbc bs Fgnynpgvgr.
113,Lbh'er ng Erfreibve.
115,Lbh'er ng abegurnfg raq.
116,Lbh'er ng fbhgujrfg raq.
117,Lbh'er ba fbhgujrfg fvqr bs Punfz.
118,Lbh'er va Fybcvat Pbeevqbe.
122,Lbh'er ba abegurnfg fvqr bs Punfz.
123,Lbh'er va Pbeevqbe.
124,Lbh'er ng Sbex va Cngu.
125,Lbh'er ng Whapgvba jvgu Jnez Jnyyf.
126,Lbh'er ng Oerngu-gnxvat Ivrj.
127,Lbh'er va Punzore bs Obhyqref.
128,Lbh'er va Yvzrfgbar Cnffntr.
129,Lbh'er va sebag bs Oneera Ebbz.
130,Lbh'er va Oneera Ebbz.
-1
3
1,0,2,2,44,29,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1,0,3,3,12,19,43,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1,0,4,5,13,14,46,30,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1,0,5,6,45,43,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1,0,8,63,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
2,0,1,2,12,7,43,45,30,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
2,0,5,6,45,46,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
3,0,1,11,32,44,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
3,0,11,62,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
3,0,33,65,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
3,0,79,5,14,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
4,0,1,4,12,45,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
4,0,5,6,43,44,29,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
4,0,7,5,46,30,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
4,0,8,63,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
5,0,4,9,43,30,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
5,50,005,6,7,45,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
5,0,6,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
5,0,5,44,46,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
6,0,1,2,45,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
6,0,4,9,43,44,30,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
6,0,5,6,46,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
7,0,1,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
7,0,4,4,45,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
7,0,5,6,43,44,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
7,0,8,5,15,16,46,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
7,0,595,60,14,30,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
8,0,5,6,43,44,46,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
8,0,1,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
8,0,7,4,13,45,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
8,303,009,3,19,30,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
8,0,593,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
9,303,008,11,29,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
9,0,593,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
9,0,10,17,18,19,44,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
9,0,14,31,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
9,0,11,51,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
10,0,9,11,20,21,43,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
10,0,11,19,22,44,51,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
10,0,14,31,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
11,303,008,63,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
11,0,9,64,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
11,0,10,17,18,23,24,43,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
11,0,12,25,19,29,44,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
11,0,3,62,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
11,0,14,31,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
12,303,008,63,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
12,0,9,64,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
12,0,11,30,43,51,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
12,0,13,19,29,44,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
12,0,14,31,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
13,303,008,63,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
13,0,9,64,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
13,0,11,51,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
13,0,12,25,43,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
13,0,14,23,31,44,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
14,303,008,63,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
14,0,9,64,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
14,0,11,51,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
14,0,13,23,43,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
14,150,020,30,31,34,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
14,0,15,30,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
14,0,16,33,44,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
15,0,18,36,46,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
15,0,17,7,38,44,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
15,0,19,10,30,45,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
15,150,022,29,31,34,35,23,43,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
15,0,14,29,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
15,0,34,55,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
16,0,14,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
17,0,15,38,43,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
17,312,596,39,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
17,412,021,39,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
17,412,597,41,42,44,69,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
17,0,27,41,42,44,69,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
18,0,15,38,11,45,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
19,0,15,10,29,43,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
19,311,028,45,36,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
19,311,029,46,37,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
19,311,030,44,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
19,0,32,45,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
19,35,074,49,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
19,211,032,49,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
19,0,74,66,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
20,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
21,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
22,0,15,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
23,0,67,43,42,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
23,0,68,44,61,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
23,0,25,30,31,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
23,0,648,52,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
24,0,67,29,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
25,0,23,29,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
25,724,031,56,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
25,0,26,56,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
26,0,88,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
27,312,596,39,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
27,412,021,39,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
27,412,597,41,42,43,69,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
27,0,17,41,42,43,69,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
27,0,40,45,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
27,0,41,44,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
28,0,19,38,11,46,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
28,0,33,45,55,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
28,0,36,30,52,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
29,0,19,38,11,45,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
30,0,19,38,11,43,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
30,0,62,44,29,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
31,524,089,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
31,0,90,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
32,0,19,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
33,0,3,65,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
33,0,28,46,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
33,0,34,43,53,54,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
33,0,35,44,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
33,159,302,71,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
33,0,100,71,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
34,0,33,30,55,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
34,0,15,29,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
35,0,33,43,55,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
35,0,20,39,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
36,0,37,43,17,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
36,0,28,29,52,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
36,0,39,44,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
36,0,65,70,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
37,0,36,44,17,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
37,0,38,30,31,56,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
38,0,37,56,29,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
38,0,595,60,14,30,4,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
39,0,36,43,23,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
39,0,64,30,52,58,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
39,0,65,70,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
40,0,41,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
41,0,42,46,29,23,56,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
41,0,27,43,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
41,0,59,45,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
41,0,60,44,17,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
42,0,41,29,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
42,0,42,45,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
42,0,43,43,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
42,0,45,46,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
42,0,80,44,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
43,0,42,44,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
43,0,44,46,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
43,0,45,43,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
44,0,43,43,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
44,0,48,30,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
44,0,50,46,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
44,0,82,45,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
45,0,42,44,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
45,0,43,45,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
45,0,46,43,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
45,0,47,46,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
45,0,87,29,30,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
46,0,45,44,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
47,0,45,43,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
48,0,44,29,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
49,0,50,43,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
49,0,51,44,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
50,0,44,43,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
50,0,49,44,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
50,0,51,30,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
50,0,52,46,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
51,0,49,44,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
51,0,50,29,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
51,0,52,43,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
51,0,53,46,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
52,0,50,44,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
52,0,51,43,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
52,0,52,46,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
52,0,53,29,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
52,0,55,45,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
52,0,86,30,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
53,0,51,44,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
53,0,52,45,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
53,0,54,46,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
54,0,53,44,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
55,0,52,44,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
55,0,55,45,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
55,0,56,30,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
55,0,57,43,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
56,0,55,29,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
57,0,13,30,56,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
57,0,55,44,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
57,0,58,46,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
57,0,83,45,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
57,0,84,43,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
58,0,57,43,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
59,0,27,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
60,0,41,43,29,17,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
60,0,61,44,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
60,0,62,45,30,52,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
61,0,60,43,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
61,0,62,45,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
61,100,107,46,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
62,0,60,44,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
62,0,63,45,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
62,0,30,43,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
62,0,61,46,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
63,0,62,46,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
64,0,39,29,56,59,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
64,0,65,44,70,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
64,0,103,45,74,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
64,0,106,43,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
65,0,64,43,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
65,0,66,44,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
65,80,556,46,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
65,0,68,61,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
65,80,556,29,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
65,50,070,29,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
65,0,39,29,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
65,60,556,45,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
65,75,072,45,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
65,0,71,45,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
65,80,556,30,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
65,0,106,30,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
66,0,65,47,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
66,0,67,44,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
66,80,556,46,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
66,0,77,25,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
66,0,96,43,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
66,50,556,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
66,0,97,72,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
67,0,66,43,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
67,0,23,44,42,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
67,0,24,30,31,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
68,0,23,46,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
68,0,69,29,56,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
68,0,65,45,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
69,0,68,30,61,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
69,331,120,46,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
69,0,119,46,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
69,0,109,45,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
69,0,113,75,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
70,0,71,45,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
70,0,65,30,23,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
70,0,111,46,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
71,0,65,48,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
71,0,70,46,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
71,0,110,45,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
72,0,65,70,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
72,0,118,49,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
72,0,73,45,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
72,0,97,48,72,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
73,0,72,46,17,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
74,0,19,43,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
74,331,120,44,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
74,0,121,44,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
74,0,75,30,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
75,0,76,46,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
75,0,77,45,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
76,0,75,45,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
77,0,75,43,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
77,0,78,44,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
77,0,66,45,17,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
78,0,77,46,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
79,0,3,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
80,0,42,45,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
80,0,80,44,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
80,0,80,46,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
80,0,81,43,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
81,0,80,44,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
82,0,44,46,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
83,0,57,46,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
83,0,84,43,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
83,0,85,44,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
84,0,57,45,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
84,0,83,44,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
84,0,114,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
85,0,83,43,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
86,0,52,29,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
87,0,45,29,30,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
88,0,25,30,56,43,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
88,0,20,39,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
88,0,92,44,27,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
89,0,25,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
90,0,23,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
91,0,95,45,73,23,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
91,0,72,30,56,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
92,0,88,46,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
92,0,93,43,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
92,0,94,45,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
93,0,92,46,27,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
94,0,92,46,27,23,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
94,309,095,45,3,73,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
94,0,611,45,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
95,0,94,46,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
95,0,92,27,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
95,0,91,44,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
96,0,66,44,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
97,0,66,48,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
97,0,72,44,17,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
97,0,98,29,45,73,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
98,0,97,46,72,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
98,0,99,44,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
99,0,98,50,73,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
99,0,301,43,23,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
99,0,100,43,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
100,0,301,44,23,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
100,0,99,44,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
100,159,302,71,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
100,0,33,71,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
100,0,101,47,22,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
101,0,100,46,71,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
102,0,103,30,74,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
103,0,102,29,38,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
103,0,104,30,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
103,114,618,46,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
103,115,619,46,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
103,0,64,46,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
104,0,103,29,74,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
104,0,105,30,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
105,0,104,29,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
105,0,103,74,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
106,0,64,29,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
106,0,65,44,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
106,0,108,43,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
107,0,131,46,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
107,0,132,49,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
107,0,133,47,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
107,0,134,48,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
107,0,135,29,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
107,0,136,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
107,0,137,43,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
107,0,138,44,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
107,0,139,45,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
107,0,61,30,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
108,95,556,43,45,46,47,48,49,50,29,30,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
108,0,106,43,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
108,0,626,44,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
109,0,69,46,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
109,0,113,45,75,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
110,0,71,44,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
110,0,20,39,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
111,0,70,45,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
111,40,050,30,39,56,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
111,50,053,30,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
111,0,45,30,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
112,0,131,49,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
112,0,132,45,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
112,0,133,43,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
112,0,134,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
112,0,135,48,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
112,0,136,47,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
112,0,137,44,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
112,0,138,30,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
112,0,139,29,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
112,0,140,46,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
113,0,109,46,11,109,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
114,0,84,48,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
115,0,116,49,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
116,0,115,47,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
116,0,593,30,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
117,0,118,49,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
117,233,660,41,42,69,47,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
117,332,661,41,42,69,47,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
117,0,303,41,42,69,47,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
117,332,021,39,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
117,0,596,39,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
118,0,72,30,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
118,0,117,29,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
119,0,69,45,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
119,0,653,43,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
120,0,69,45,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
120,0,74,43,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
121,0,74,43,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
121,0,653,45,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
122,0,123,47,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
122,233,660,41,42,69,49,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
122,0,303,41,42,69,49,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
122,0,596,39,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
122,0,124,77,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
122,0,126,28,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
122,0,129,40,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
123,0,122,44,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
123,0,124,43,77,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
123,0,126,28,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
123,0,129,40,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
124,0,123,44,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
124,0,125,47,36,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
124,0,128,48,37,30,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
124,0,126,28,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
124,0,129,40,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
125,0,124,46,77,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
125,0,126,45,28,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
125,0,127,43,17,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
126,0,125,46,23,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
126,0,124,77,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
126,0,610,30,39,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
127,0,125,44,11,17,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
127,0,124,77,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
127,0,126,28,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
128,0,124,45,29,77,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
128,0,129,46,30,40,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
128,0,126,28,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
129,0,128,44,29,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
129,0,124,77,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
129,0,130,43,19,40,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
129,0,126,28,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
130,0,129,44,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
130,0,124,77,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
130,0,126,28,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
131,0,107,44,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
131,0,132,48,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
131,0,133,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
131,0,134,49,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
131,0,135,47,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
131,0,136,29,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
131,0,137,30,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
131,0,138,45,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
131,0,139,46,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
131,0,112,43,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
132,0,107,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
132,0,131,29,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
132,0,133,45,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
132,0,134,46,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
132,0,135,44,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
132,0,136,49,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
132,0,137,47,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
132,0,138,43,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
132,0,139,30,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
132,0,112,48,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
133,0,107,29,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
133,0,131,30,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
133,0,132,44,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
133,0,134,47,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
133,0,135,49,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
133,0,136,43,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
133,0,137,45,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
133,0,138,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
133,0,139,48,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
133,0,112,46,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
134,0,107,47,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
134,0,131,45,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
134,0,132,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
134,0,133,48,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
134,0,135,43,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
134,0,136,30,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
134,0,137,46,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
134,0,138,29,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
134,0,139,44,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
134,0,112,49,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
135,0,107,45,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
135,0,131,48,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
135,0,132,30,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
135,0,133,46,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
135,0,134,43,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
135,0,136,44,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
135,0,137,49,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
135,0,138,47,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
135,0,139,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
135,0,112,29,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
136,0,107,43,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
136,0,131,44,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
136,0,132,29,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
136,0,133,49,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
136,0,134,30,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
136,0,135,46,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
136,0,137,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
136,0,138,48,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
136,0,139,47,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
136,0,112,45,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
137,0,107,48,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
137,0,131,47,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
137,0,132,46,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
137,0,133,30,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
137,0,134,29,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
137,0,135,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
137,0,136,45,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
137,0,138,49,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
137,0,139,43,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
137,0,112,44,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
138,0,107,30,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
138,0,131,43,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
138,0,132,47,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
138,0,133,29,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
138,0,134,44,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
138,0,135,45,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
138,0,136,46,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
138,0,137,48,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
138,0,139,49,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
138,0,112,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
139,0,107,49,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
139,0,131,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
139,0,132,43,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
139,0,133,44,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
139,0,134,45,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
139,0,135,30,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
139,0,136,48,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
139,0,137,29,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
139,0,138,46,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
139,0,112,47,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
140,0,112,45,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
-1
4
2,EBNQ
2,UVYY
3,RAGRE
4,HCFGE
5,QBJAF
6,SBERF
7,SBEJN
7,PBAGV
7,BAJNE
8,ONPX
8,ERGHE
8,ERGER
9,INYYR
10,FGNVE
11,BHG
11,BHGFV
11,RKVG
11,YRNIR
12,OHVYQ
12,UBHFR
13,THYYL
14,FGERN
15,EBPX
16,ORQ
17,PENJY
18,PBOOY
19,VAJNE
19,VAFVQ
19,VA
20,FHESN
21,AHYY
21,ABJUR
22,QNEX
23,CNFFN
23,GHAAR
24,YBJ
25,PNALB
26,NJXJN
27,TVNAG
28,IVRJ
29,HCJNE
29,HC
29,H
29,NOBIR
29,NFPRA
30,Q
30,QBJA
30,QRFPR
31,CVG
32,BHGQB
33,PENPX
34,FGRCF
35,QBZR
36,YRSG
37,EVTUG
38,UNYY
39,WHZC
40,ONEER
41,BIRE
42,NPEBF
43,RNFG
43,R
44,JRFG
44,J
45,ABEGU
45,A
46,FBHGU
46,F
47,AR
48,FR
49,FJ
50,AJ
51,QROEV
52,UBYR
53,JNYY
54,OEBXR
55,L2
56,PYVZO
57,YBBX
57,RKNZV
57,GBHPU
57,QRFPE
58,SYBBE
59,EBBZ
60,FYVG
61,FYNO
62,KLMML
63,QRCER
64,RAGEN
65,CYHTU
66,FRPER
67,PNIR
69,PEBFF
70,ORQDH
71,CYBIR
72,BEVRA
73,PNIRE
74,FURYY
75,ERFRE
76,ZNVA
76,BSSVP
77,SBEX
1001,XRLF
1001,XRL
1002,YNZC
1002,URNQY
1002,YNAGR
1003,TENGR
1004,PNTR
1005,EBQ
1006,EBQ     (ZHFG OR ARKG BOWRPG NSGRE "ERNY" EBQ)
1007,FGRCF
1008,OVEQ
1009,QBBE
1010,CVYYB
1010,IRYIR
1011,FANXR
1012,SVFFH
1013,GNOYR
1014,PYNZ
1015,BLFGR
1016,ZNTNM
1016,VFFHR
1016,FCRYH
1016,"FCRY
1017,QJNES
1018,XAVSR
1018,XAVIR
1019,SBBQ
1019,ENGVB
1020,OBGGY
1020,WNE
1021,JNGRE
1021,U2B
1022,BVY
1023,ZVEEB
1024,CYNAG
1024,ORNAF
1025,CYNAG,(ZHFG OR ARKG BOWRPG NSGRE "ERNY" CYNAG)
1026,FGNYN
1027,FUNQB
1027,SVTHE
1028,NKR
1029,QENJV
1030,CVENG
1031,QENTB
1032,PUNFZ
1033,GEBYY
1034,GEBYY,(ZHFG OR ARKG BOWRPG NSGRE "ERNY" GEBYY)
1035,ORNE
1036,ZRFFN
1037,IBYPN
1037,TRLFR,(FNZR NF IBYPNAB)
1038,ZNPUV
1038,IRAQV
1039,ONGGR
1040,PNECR
1040,ZBFF
1050,TBYQ
1050,AHTTR
1051,QVNZB
1052,FVYIR
1052,ONEF
1053,WRJRY
1054,PBVAF
1055,PURFG
1055,OBK
1055,GERNF
1056,RTTF
1056,RTT
1056,ARFG
1057,GEVQR
1058,INFR
1058,ZVAT
1058,FUNEQ
1058,CBGGR
1059,RZREN
1060,CYNGV
1060,CLENZ
1061,CRNEY
1062,EHT
1062,CREFV
1063,FCVPR
1064,PUNVA
2001,PNEEL
2001,GNXR
2001,XRRC
2001,PNGPU
2001,FGRNY
2001,PNCGH
2001,TRG
2001,GBGR
2002,QEBC
2002,ERYRN
2002,SERR
2002,QVFPN
2002,QHZC
2003,FNL
2003,PUNAG
2003,FVAT
2003,HGGRE
2003,ZHZOY
2004,HAYBP
2004,BCRA
2005,ABGUV
2005,JNVG
2006,YBPX
2006,PYBFR
2007,YVTUG
2007,BA
2008,RKGVA
2008,BSS
2009,JNIR
2009,FUNXR
2009,FJVAT
2010,PNYZ
2010,CYNPN
2010,GNZR
2011,JNYX
2011,EHA
2011,GENIR
2011,TB
2011,CEBPR
2011,PBAGV
2011,RKCYB
2011,TBGB
2011,SBYYB
2011,GHEA
2012,NGGNP
2012,XVYY
2012,SVTUG
2012,UVG
2012,FGEVX
2013,CBHE
2014,RNG
2014,QRIBH
2015,QEVAX
2016,EHO
2017,GUEBJ
2017,GBFF
2018,DHVG
2019,SVAQ
2019,JURER
2020,VAIRA
2021,SRRQ
2022,SVYY
2023,OYNFG
2023,QRGBA
2023,VTAVG
2023,OYBJH
2024,FPBER
2025,SRR
2025,SVR
2025,SBR
2025,SBB
2025,SHZ
2026,OEVRS
2027,ERNQ
2027,CREHF
2028,OERNX
2028,FUNGG
2028,FZNFU
2029,JNXR
2029,QVFGH
2030,FHFCR
2030,CNHFR
2030,FNIR
2031,UBHEF
2032,ERFGB
2032,ERFHZ
2032,YBNQ
2033,BOSHF
3001,SRR
3002,SVR
3003,SBR
3004,SBB
3005,SHZ
3050,FRFNZ
3050,BCRAF
3050,NOEN
3050,NOENP
3050,FUNMN
3050,UBPHF
3050,CBPHF
3051,URYC
3051,?
3064,GERR
3064,GERRF
3066,QVT
3066,RKPNI
3068,YBFG
3069,ZVFG
3079,SHPX
3079,FUVG
3079,QNZA
3079,CVFF
3139,FGBC
3142,VASB
3147,FJVZ
3206,IREFV
-1
5
1,  frg bs xrlf
000,Gurer ner fbzr xrlf ba gur tebhaq urer.
2,  oenff ynagrea
000,Gurer vf n fuval oenff ynzc arneol.
100,Gurer vf n ynzc fuvavat arneol.
3,*tengr
000,Gur tengr vf ybpxrq.
100,Gur tengr vf bcra.
4,  jvpxre pntr
000,Gurer vf n fznyy jvpxre pntr qvfpneqrq arneol.
5,  oynpx ebq
000,N guerr sbbg oynpx ebq jvgu n ehfgl fgne ba na raq yvrf arneol.
6,  oynpx ebq
000,N guerr sbbg oynpx ebq jvgu n ehfgl znex ba na raq yvrf arneol.
7,*fgrcf
000,Ebhtu fgbar fgrcf yrnq qbja gur cvg.
100,Ebhtu fgbar fgrcf yrnq hc gur qbzr.
8,    yvggyr oveq va pntr
000,N purreshy yvggyr oveq vf fvggvat urer fvatvat.
100,Gurer vf n yvggyr oveq va gur pntr.
9,*ehfgl qbbe
000,Gur jnl abegu vf oneerq ol n znffvir, ehfgl, veba qbbe.
100,Gur jnl abegu yrnqf guebhtu n znffvir, ehfgl, veba qbbe.
10,  iryirg cvyybj
000,N fznyy iryirg cvyybj yvrf ba gur sybbe.
11,*fanxr
000,N uhtr terra svrepr fanxr onef gur jnl!
100,>$<  (punfrq njnl)
12,*svffher
000,>$<
100,N pelfgny oevqtr abj fcnaf gur svffher.
200,Gur pelfgny oevqtr unf inavfurq!
13,*fgbar gnoyrg
000,N znffvir fgbar gnoyrg vzorqqrq va gur jnyy ernqf:
000,"Pbatenghyngvbaf ba oevatvat yvtug vagb gur Qnex Ebbz!"
14,  tvnag pynz  >tehag!<
000,Gurer vf na rabezbhf pynz urer jvgu vgf furyy gvtugyl pybfrq.
15,  tvnag blfgre  >tebna!<
000,Gurer vf na rabezbhf blfgre urer jvgu vgf furyy gvtugyl pybfrq.
100,Vagrerfgvat.  Gurer frrzf gb or fbzrguvat jevggra ba gur haqrefvqr bs
100,gur blfgre.
16,  "Fcryhaxre Gbqnl"
000,Gurer ner n srj erprag vffhrf bs "Fcryhaxre Gbqnl" zntnmvar urer.
19,  gnfgl sbbq
000,Gurer vf sbbq urer.
20,  fznyy obggyr
000,Gurer vf n obggyr bs jngre urer.
100,Gurer vf na rzcgl obggyr urer.
200,Gurer vf n obggyr bs bvy urer.
21,    jngre va gur obggyr
22,    bvy va gur obggyr
23,*zveebe
000,>$<
24,*cynag
000,Gurer vf n gval yvggyr cynag va gur cvg, zhezhevat "Jngre, jngre, ..."
100,Gur cynag fchegf vagb shevbhf tebjgu sbe n srj frpbaqf.
200,Gurer vf n 12-sbbg-gnyy ornafgnyx fgergpuvat hc bhg bs gur cvg,
200,oryybjvat "Jngre!! Jngre!!"
300,Gur cynag tebjf rkcybfviryl, nyzbfg svyyvat gur obggbz bs gur cvg.
400,Gurer vf n tvtnagvp ornafgnyx fgergpuvat nyy gur jnl hc gb gur ubyr.
500,Lbh'ir bire-jngrerq gur cynag!  Vg'f fueviryvat hc!  Vg'f, vg'f...
25,*cubal cynag (frra va gjbcvg ebbz bayl jura gnyy rabhtu)
000,>$<
100,Gur gbc bs n 12-sbbg-gnyy ornafgnyx vf cbxvat bhg bs gur jrfg cvg.
200,Gurer vf n uhtr ornafgnyx tebjvat bhg bs gur jrfg cvg hc gb gur ubyr.
26,*fgnynpgvgr
000,>$<
27,*funqbjl svther
000,Gur funqbjl svther frrzf gb or gelvat gb nggenpg lbhe nggragvba.
28,  qjnes'f nkr
000,Gurer vf n yvggyr nkr urer.
100,Gurer vf n yvggyr nkr ylvat orfvqr gur orne.
29,*pnir qenjvatf
000,>$<
30,*cvengr
000,>$<
31,*qentba
000,N uhtr terra svrepr qentba onef gur jnl!
100,Pbatenghyngvbaf!  Lbh unir whfg inadhvfurq n qentba jvgu lbhe oner
100,unaqf!  (Haoryvrinoyr, vfa'g vg?)
200,Gur obql bs n uhtr terra qrnq qentba vf ylvat bss gb bar fvqr.
32,*punfz
000,N evpxrgl jbbqra oevqtr rkgraqf npebff gur punfz, inavfuvat vagb gur
000,zvfg.  N fvta cbfgrq ba gur oevqtr ernqf, "Fgbc! Cnl gebyy!"
100,Gur jerpxntr bs n oevqtr (naq n qrnq orne) pna or frra ng gur obggbz
100,bs gur punfz.
33,*gebyy
000,N oheyl gebyy fgnaqf ol gur oevqtr naq vafvfgf lbh guebj uvz n
000,gernfher orsber lbh znl pebff.
100,Gur gebyy fgrcf bhg sebz orarngu gur oevqtr naq oybpxf lbhe jnl.
200,>$<  (punfrq njnl)
34,*cubal gebyy
000,Gur gebyy vf abjurer gb or frra.
35,>$<  (orne hfrf egrkg 141)
000,Gurer vf n srebpvbhf pnir orne rlvat lbh sebz gur sne raq bs gur ebbz!
100,Gurer vf n tragyr pnir orne fvggvat cynpvqyl va bar pbeare.
200,Gurer vf n pbagragrq-ybbxvat orne jnaqrevat nobhg arneol.
300,>$<  (qrnq)
36,*zrffntr va frpbaq znmr
000,Gurer vf n zrffntr fpenjyrq va gur qhfg va n sybjrel fpevcg, ernqvat:
000,"Guvf vf abg gur znmr jurer gur cvengr yrnirf uvf gernfher purfg."
37,*ibypnab naq/be trlfre
000,>$<
38,*iraqvat znpuvar
000,Gurer vf n znffvir iraqvat znpuvar urer.  Gur vafgehpgvbaf ba vg ernq:
000,"Qebc pbvaf urer gb erprvir serfu onggrevrf."
39,  onggrevrf
000,Gurer ner serfu onggrevrf urer.
100,Fbzr jbea-bhg onggrevrf unir orra qvfpneqrq arneol.
40,*pnecrg naq/be zbff
000,>$<
50,  ynetr tbyq ahttrg
000,Gurer vf n ynetr fcnexyvat ahttrg bs tbyq urer!
51,  frireny qvnzbaqf
000,Gurer ner qvnzbaqf urer!
52,  onef bs fvyire
000,Gurer ner onef bs fvyire urer!
53,  cerpvbhf wrjryel
000,Gurer vf cerpvbhf wrjryel urer!
54,  ener pbvaf
000,Gurer ner znal pbvaf urer!
55,  gernfher purfg
000,Gur cvengr'f gernfher purfg vf urer!
56,  tbyqra rttf
000,Gurer vf n ynetr arfg urer, shyy bs tbyqra rttf!
100,Gur arfg bs tbyqra rttf unf inavfurq!
200,Qbar!
57,  wrjryrq gevqrag
000,Gurer vf n wrjry-rapehfgrq gevqrag urer!
58,  Zvat infr
000,Gurer vf n qryvpngr, cerpvbhf, Zvat infr urer!
100,Gur infr vf abj erfgvat, qryvpngryl, ba n iryirg cvyybj.
200,Gur sybbe vf yvggrerq jvgu jbeguyrff funeqf bs cbggrel.
300,Gur Zvat infr qebcf jvgu n qryvpngr penfu.
59,  rtt-fvmrq rzrenyq
000,Gurer vf na rzrenyq urer gur fvmr bs n cybire'f rtt!
60,  cyngvahz clenzvq
000,Gurer vf n cyngvahz clenzvq urer, 8 vapurf ba n fvqr!
61,  tyvfgravat crney
000,Bss gb bar fvqr yvrf n tyvfgravat crney!
62,  crefvna eht
000,Gurer vf n crefvna eht fcernq bhg ba gur sybbe!
100,Gur qentba vf fcenjyrq bhg ba n crefvna eht!!
63,  ener fcvprf
000,Gurer ner ener fcvprf urer!
64,  tbyqra punva
000,Gurer vf n tbyqra punva ylvat va n urnc ba gur sybbe!
100,Gur orne vf ybpxrq gb gur jnyy jvgu n tbyqra punva!
200,Gurer vf n tbyqra punva ybpxrq gb gur jnyy!
-1
6
1,Fbzrjurer arneol vf Pbybffny Pnir, jurer bguref unir sbhaq sbegharf va
1,gernfher naq tbyq, gubhtu vg vf ehzberq gung fbzr jub ragre ner arire
1,frra ntnva.  Zntvp vf fnvq gb jbex va gur pnir.  V jvyy or lbhe rlrf
1,naq unaqf.  Qverpg zr jvgu pbzznaqf bs 1 be 2 jbeqf.  V fubhyq jnea
1,lbh gung V ybbx ng bayl gur svefg svir yrggref bs rnpu jbeq, fb lbh'yy
1,unir gb ragre "ABEGURNFG" nf "AR" gb qvfgvathvfu vg sebz "ABEGU".
1,
1,Fubhyq lbh trg fghpx, glcr "URYC" sbe fbzr trareny uvagf.  Sbe vasbe-
1,zngvba ba ubj gb raq lbhe nqiragher, rgp., glcr "VASB".  Sbe vasbezngvba
1,nobhg guvf irefvba bs gur tnzr, nf jryy nf vgf uvfgbel, glcr "IREFVBA".
1,                      - - -
2,N yvggyr qjnes jvgu n ovt xavsr oybpxf lbhe jnl.
3,N yvggyr qjnes whfg jnyxrq nebhaq n pbeare, fnj lbh, guerj n yvggyr
3,nkr ng lbh juvpu zvffrq, phefrq, naq ena njnl.
4,Gurer vf n guerngravat yvggyr qjnes va gur ebbz jvgu lbh!
5,Bar funec anfgl xavsr vf guebja ng lbh!
6,Abar bs gurz uvg lbh!
7,Bar bs gurz trgf lbh!
8,N ubyybj ibvpr fnlf "CYHTU".
9,Gurer vf ab jnl gb tb gung qverpgvba.
10,V nz hafher ubj lbh ner snpvat.  Hfr pbzcnff cbvagf be arneol bowrpgf.
11,V qba'g xabj "VA" sebz "BHG" urer.  Hfr pbzcnff cbvagf be anzr
11,fbzrguvat va gur trareny qverpgvba lbh jnag gb tb.
12,V qba'g xabj ubj gb nccyl gung jbeq urer.
13,V qba'g haqrefgnaq gung!
14,V'z tnzr.  Jbhyq lbh pner gb rkcynva ubj?
15,Fbeel, ohg V nz abg nyybjrq gb tvir zber qrgnvy.  V jvyy ercrng gur
15,ybat qrfpevcgvba bs lbhe ybpngvba.
16,Vg vf abj cvgpu qnex.  Vs lbh cebprrq lbh jvyy yvxryl snyy vagb n cvg.
17,Vs lbh cersre, fvzcyl glcr "J" engure guna "JRFG".
18,Ner lbh gelvat gb pngpu gur oveq?
19,Gur oveq vf sevtugrarq evtug abj naq lbh pnaabg pngpu vg ab znggre
19,jung lbh gel.  Creuncf lbh zvtug gel yngre.
20,Ner lbh gelvat gb fbzrubj qrny jvgu gur fanxr?
21,Lbh pna'g xvyy gur fanxr, be qevir vg njnl, be nibvq vg, be nalguvat
21,yvxr gung.  Gurer vf n jnl gb trg ol, ohg lbh qba'g unir gur arprffnel
21,erfbheprf evtug abj.
22,Qb lbh ernyyl jnag gb dhvg abj?
23,Lbh sryy vagb n cvg naq oebxr rirel obar va lbhe obql!
24,Lbh ner nyernql pneelvat vg!
25,Lbh pna'g or frevbhf!
26,Gur oveq jnf hansenvq jura lbh ragrerq, ohg nf lbh nccebnpu vg orpbzrf
26,qvfgheorq naq lbh pnaabg pngpu vg.
27,Lbh pna pngpu gur oveq, ohg lbh pnaabg pneel vg.
28,Gurer vf abguvat urer jvgu n ybpx!
29,Lbh nera'g pneelvat vg!
30,Gur yvggyr oveq nggnpxf gur terra fanxr, naq va na nfgbhaqvat syheel
30,qevirf gur fanxr njnl.
31,Lbh unir ab xrlf!
32,Vg unf ab ybpx.
33,V qba'g xabj ubj gb ybpx be haybpx fhpu n guvat.
34,Vg jnf nyernql ybpxrq.
35,Gur tengr vf abj ybpxrq.
36,Gur tengr vf abj haybpxrq.
37,Vg jnf nyernql haybpxrq.
38,Lbh unir ab fbhepr bs yvtug.
39,Lbhe ynzc vf abj ba.
40,Lbhe ynzc vf abj bss.
41,Gurer vf ab jnl gb trg cnfg gur orne gb haybpx gur punva, juvpu vf
41,cebonoyl whfg nf jryy.
42,Abguvat unccraf.
43,Jurer?
44,Gurer vf abguvat urer gb nggnpx.
45,Gur yvggyr oveq vf abj qrnq.  Vgf obql qvfnccrnef.
46,Nggnpxvat gur fanxr obgu qbrfa'g jbex naq vf irel qnatrebhf.
47,Lbh xvyyrq n yvggyr qjnes.
48,Lbh nggnpx n yvggyr qjnes, ohg ur qbqtrf bhg bs gur jnl.
49,Jvgu jung?  Lbhe oner unaqf?
50,Tbbq gel, ohg gung vf na byq jbea-bhg zntvp jbeq.
51,V xabj bs cynprf, npgvbaf, naq guvatf.  Zbfg bs zl ibpnohynel
51,qrfpevorf cynprf naq vf hfrq gb zbir lbh gurer.  Gb zbir, gel jbeqf
51,yvxr "SBERFG", "QBJAFGERNZ", "RAGRE", "RNFG", "JRFG", "ABEGU", "FBHGU",
51,"HC", be "QBJA".  V xabj nobhg n srj fcrpvny bowrpgf, yvxr n oynpx ebq
51,uvqqra va gur pnir.  Gurfr bowrpgf pna or znavchyngrq hfvat fbzr bs
51,gur npgvba jbeqf gung V xabj.  Hfhnyyl lbh jvyy arrq gb tvir obgu gur
51,bowrpg naq npgvba jbeqf (va rvgure beqre), ohg fbzrgvzrf V pna vasre
51,gur bowrpg sebz gur ireo nybar.  Fbzr bowrpgf nyfb vzcyl ireof; va
51,cnegvphyne, "VAIRAGBEL" vzcyvrf "GNXR VAIRAGBEL", juvpu pnhfrf zr gb
51,tvir lbh n yvfg bs jung lbh'er pneelvat.  Gur bowrpgf unir fvqr
51,rssrpgf; sbe vafgnapr, gur ebq fpnerf gur oveq.  Hfhnyyl crbcyr univat
51,gebhoyr zbivat whfg arrq gb gel n srj zber jbeqf.  Hfhnyyl crbcyr
51,gelvat hafhpprffshyyl gb znavchyngr na bowrpg ner nggrzcgvat fbzrguvat
51,orlbaq gurve (be zl!) pncnovyvgvrf naq fubhyq gel n pbzcyrgryl
51,qvssrerag gnpx.  Gb fcrrq gur tnzr lbh pna fbzrgvzrf zbir ybat
51,qvfgnaprf jvgu n fvatyr jbeq.  Sbe rknzcyr, "OHVYQVAT" hfhnyyl trgf
51,lbh gb gur ohvyqvat sebz naljurer nobir tebhaq rkprcg jura ybfg va gur
51,sberfg.  Nyfb, abgr gung pnir cnffntrf ghea n ybg, naq gung yrnivat n
51,ebbz gb gur abegu qbrf abg thnenagrr ragrevat gur arkg sebz gur fbhgu.
51,Tbbq yhpx!
52,Vg zvffrf!
53,Vg trgf lbh!
54,Bx
55,Lbh pna'g haybpx gur xrlf.
56,Lbh unir penjyrq nebhaq va fbzr yvggyr ubyrf naq jbhaq hc onpx va gur
56,znva cnffntr.
57,V qba'g xabj jurer gur pnir vf, ohg urernobhgf ab fgernz pna eha ba
57,gur fhesnpr sbe ybat.  V jbhyq gel gur fgernz.
58,V arrq zber qrgnvyrq vafgehpgvbaf gb qb gung.
59,V pna bayl gryy lbh jung lbh frr nf lbh zbir nobhg naq znavchyngr
59,guvatf.  V pnaabg gryy lbh jurer erzbgr guvatf ner.
60,V unir ab vqrn jung lbh ner gnyxvat nobhg!
61,Lbh'er abg znxvat nal frafr!
62,Ner lbh gelvat gb trg vagb gur pnir?
63,Gur tengr vf irel fbyvq naq unf n uneqrarq fgrry ybpx.  Lbh pnaabg
63,ragre jvgubhg n xrl, naq gurer ner ab xrlf arneol.  V jbhyq erpbzzraq
63,ybbxvat ryfrjurer sbe gur xrlf.
64,Gur gerrf bs gur sberfg ner ynetr uneqjbbq bnx naq zncyr, jvgu na
64,bppnfvbany tebir bs cvar be fcehpr.  Gurer vf dhvgr n ovg bs haqre-
64,tebjgu, ynetryl ovepu naq nfu fncyvatf cyhf abaqrfpevcg ohfurf bs
64,inevbhf fbegf.  Guvf gvzr bs lrne ivfvovyvgl vf dhvgr erfgevpgrq ol
64,nyy gur yrnirf, ohg geniry vf dhvgr rnfl vs lbh qrgbhe nebhaq gur
64,fcehpr naq oreel ohfurf.
65,Jrypbzr gb Nqiragher!!
65,
65,Vafgehpgvbaf ner ninvynoyr ng n pbfg bs svir cbvagf qrqhpgrq sebz lbhe
65,svany fpber. Vs lbh qrpyvar gur vafgehpgvbaf, gura V jvyy nffhzr lbh ner
65,rkcrevraprq naq lbh jvyy unir yrff gvzr gb pbzcyrgr lbhe nqiragher.
65,
65,Jbhyq lbh yvxr vafgehpgvbaf?
66,Qvttvat jvgubhg n fubiry vf dhvgr vzcenpgvpny.  Rira jvgu n fubiry
66,cebterff vf hayvxryl.
67,Oynfgvat erdhverf qlanzvgr.
68,V'z nf pbashfrq nf lbh ner.
69,Zvfg vf n juvgr incbe, hfhnyyl jngre, frra sebz gvzr gb gvzr va
69,pnireaf.  Vg pna or sbhaq naljurer ohg vf serdhragyl n fvta bs n qrrc
69,cvg yrnqvat qbja gb jngre.
70,Lbhe srrg ner abj jrg.
71,V guvax V whfg ybfg zl nccrgvgr.
72,Gunax lbh, vg jnf qryvpvbhf!
73,Lbh unir gnxra n qevax sebz gur fgernz.  Gur jngre gnfgrf fgebatyl bs
73,zvarenyf ohg vf abg hacyrnfnag.  Vg vf rkgerzryl pbyq.
74,Gur obggyr bs jngre vf abj rzcgl.
75,Ehoovat gur ryrpgevp ynzc vf abg cnegvphyneyl erjneqvat.  Naljnl,
75,abguvat rkpvgvat unccraf.
76,Crphyvne.  Abguvat harkcrpgrq unccraf.
77,Lbhe obggyr vf rzcgl, naq gur tebhaq vf jrg.
78,Lbh pna'g cbhe gung.
79,Jngpu vg!
80,Juvpu jnl?
81,Bu qrne, lbh frrz gb unir tbggra lbhefrys xvyyrq.  V zvtug or noyr gb
81,uryc lbh bhg, ohg V'ir arire ernyyl qbar guvf orsber.  Qb lbh jnag zr
81,gb gel gb ervapneangr lbh?
82,Nyy evtug.  Ohg qba'g oynzr zr vs fbzrguvat tbrf je......
82,                    --- Cbbs!! ---
82,Lbh ner rathysrq va n pybhq bs benatr fzbxr.  Pbhtuvat naq tnfcvat,
82,lbh rzretr sebz gur fzbxr naq svaq....
83,Lbh pyhzfl bns, lbh'ir qbar vg ntnva!  V qba'g xabj ubj ybat V pna
83,xrrc guvf hc.  Qb lbh jnag zr gb gel ervapneangvat lbh ntnva?
84,Bxnl, abj jurer qvq V chg zl benatr fzbxr?....  >Cbbs!<
84,Rirelguvat qvfnccrnef va n qrafr pybhq bs benatr fzbxr.
85,Abj lbh'ir ernyyl qbar vg!  V'z bhg bs benatr fzbxr!  Lbh qba'g rkcrpg
85,zr gb qb n qrprag ervapneangvba jvgubhg nal benatr fzbxr, qb lbh?
86,Bxnl, vs lbh'er fb fzneg, qb vg lbhefrys!  V'z yrnivat!
90,>>> zrffntrf 81 gueh 90 ner erfreirq sbe "bovghnevrf". <<<
91,Fbeel, ohg V ab ybatre frrz gb erzrzore ubj vg jnf lbh tbg urer.
92,Lbh pna'g pneel nalguvat zber.  Lbh'yy unir gb qebc fbzrguvat svefg.
93,Lbh pna'g tb guebhtu n ybpxrq fgrry tengr!
94,V oryvrir jung lbh jnag vf evtug urer jvgu lbh.
95,Lbh qba'g svg guebhtu n gjb-vapu fyvg!
96,V erfcrpgshyyl fhttrfg lbh tb npebff gur oevqtr vafgrnq bs whzcvat.
97,Gurer vf ab jnl npebff gur svffher.
98,Lbh'er abg pneelvat nalguvat.
99,Lbh ner pheeragyl ubyqvat gur sbyybjvat:
100,Vg'f abg uhatel (vg'f zreryl cvava' sbe gur swbeqf).  Orfvqrf, lbh
100,unir ab oveq frrq.
101,Gur fanxr unf abj qribherq lbhe oveq.
102,Gurer'f abguvat urer vg jnagf gb rng (rkprcg creuncf lbh).
103,Lbh sbby, qjneirf rng bayl pbny!  Abj lbh'ir znqr uvz ERNYYL znq!!
104,Lbh unir abguvat va juvpu gb pneel vg.
105,Lbhe obggyr vf nyernql shyy.
106,Gurer vf abguvat urer jvgu juvpu gb svyy gur obggyr.
107,Lbhe obggyr vf abj shyy bs jngre.
108,Lbhe obggyr vf abj shyy bs bvy.
109,Lbh pna'g svyy gung.
110,Qba'g or evqvphybhf!
111,Gur qbbe vf rkgerzryl ehfgl naq ershfrf gb bcra.
112,Gur cynag vaqvtanagyl funxrf gur bvy bss vgf yrnirf naq nfxf, "Jngre?"
113,Gur uvatrf ner dhvgr gubebhtuyl ehfgrq abj naq jba'g ohqtr.
114,Gur bvy unf serrq hc gur uvatrf fb gung gur qbbe jvyy abj zbir,
114,nygubhtu vg erdhverf fbzr rssbeg.
115,Gur cynag unf rkprcgvbanyyl qrrc ebbgf naq pnaabg or chyyrq serr.
116,Gur qjneirf' xavirf inavfu nf gurl fgevxr gur jnyyf bs gur pnir.
117,Fbzrguvat lbh'er pneelvat jba'g svg guebhtu gur ghaary jvgu lbh.
117,Lbh'q orfg gnxr vairagbel naq qebc fbzrguvat.
118,Lbh pna'g svg guvf svir-sbbg pynz guebhtu gung yvggyr cnffntr!
119,Lbh pna'g svg guvf svir-sbbg blfgre guebhtu gung yvggyr cnffntr!
120,V nqivfr lbh gb chg qbja gur pynz orsber bcravat vg.  >Fgenva!<
121,V nqivfr lbh gb chg qbja gur blfgre orsber bcravat vg.  >Jerapu!<
122,Lbh qba'g unir nalguvat fgebat rabhtu gb bcra gur pynz.
123,Lbh qba'g unir nalguvat fgebat rabhtu gb bcra gur blfgre.
124,N tyvfgravat crney snyyf bhg bs gur pynz naq ebyyf njnl.  Tbbqarff,
124,guvf zhfg ernyyl or na blfgre.  (V arire jnf irel tbbq ng vqragvslvat
124,ovinyirf.)  Jungrire vg vf, vg unf abj fanccrq fuhg ntnva.
125,Gur blfgre pernxf bcra, erirnyvat abguvat ohg blfgre vafvqr.  Vg
125,cebzcgyl fancf fuhg ntnva.
126,Lbh unir penjyrq nebhaq va fbzr yvggyr ubyrf naq sbhaq lbhe jnl
126,oybpxrq ol n erprag pnir-va.  Lbh ner abj onpx va gur znva cnffntr.
127,Gurer ner snvag ehfgyvat abvfrf sebz gur qnexarff oruvaq lbh.
128,Bhg sebz gur funqbjf oruvaq lbh cbhaprf n orneqrq cvengr!  "Une, une,"
128,ur pubegyrf, "V'yy whfg gnxr nyy guvf obbgl naq uvqr vg njnl jvgu zr
128,purfg qrrc va gur znmr!"  Ur fangpurf lbhe gernfher naq inavfurf vagb
128,gur tybbz.
129,N frchypueny ibvpr erireorengvat guebhtu gur pnir, fnlf, "Pnir pybfvat
129,fbba.  Nyy nqiragheref rkvg vzzrqvngryl guebhtu Znva Bssvpr."
130,N zlfgrevbhf erpbeqrq ibvpr tebnaf vagb yvsr naq naabhaprf:
130,   "Guvf rkvg vf pybfrq.  Cyrnfr yrnir ivn Znva Bssvpr."
131,Vg ybbxf nf gubhtu lbh'er qrnq.  Jryy, frrvat nf ubj vg'f fb pybfr gb
131,pybfvat gvzr naljnl, V guvax jr'yy whfg pnyy vg n qnl.
132,Gur frchypueny ibvpr ragbarf, "Gur pnir vf abj pybfrq."  Nf gur rpubrf
132,snqr, gurer vf n oyvaqvat synfu bs yvtug (naq n fznyy chss bs benatr
132,fzbxr). . . .    Nf lbhe rlrf ersbphf, lbh ybbx nebhaq naq svaq...
133,Gurer vf n ybhq rkcybfvba, naq n gjragl-sbbg ubyr nccrnef va gur sne
133,jnyy, ohelvat gur qjneirf va gur ehooyr.  Lbh znepu guebhtu gur ubyr
133,naq svaq lbhefrys va gur Znva Bssvpr, jurer n purrevat onaq bs
133,sevraqyl ryirf pneel gur pbadhrevat nqiraghere bss vagb gur fhafrg.
134,Gurer vf n ybhq rkcybfvba, naq n gjragl-sbbg ubyr nccrnef va gur sne
134,jnyy, ohelvat gur fanxrf va gur ehooyr.  N evire bs zbygra ynin cbhef
134,va guebhtu gur ubyr, qrfgeblvat rirelguvat va vgf cngu, vapyhqvat lbh!
135,Gurer vf n ybhq rkcybfvba, naq lbh ner fhqqrayl fcynfurq npebff gur
135,jnyyf bs gur ebbz.
136,Gur erfhygvat ehpxhf unf njnxrarq gur qjneirf.  Gurer ner abj frireny
136,guerngravat yvggyr qjneirf va gur ebbz jvgu lbh!  Zbfg bs gurz guebj
136,xavirf ng lbh!  Nyy bs gurz trg lbh!
137,Bu, yrnir gur cbbe haunccl oveq nybar.
138,V qnerfnl jungrire lbh jnag vf nebhaq urer fbzrjurer.
139,V qba'g xabj gur jbeq "FGBC".  Hfr "DHVG" vs lbh jnag gb tvir hc.
140,Lbh pna'g trg gurer sebz urer.
141,Lbh ner orvat sbyybjrq ol n irel ynetr, gnzr orne.
142,Vs lbh jnag gb raq lbhe nqiragher rneyl, fnl "DHVG".  Gb fhfcraq lbhe
142,nqiragher fhpu gung lbh pna pbagvahr yngre, fnl "FHFCRAQ" (be "CNHFR"
142,be "FNIR").  Gb frr jung ubhef gur pnir vf abeznyyl bcra, fnl "UBHEF".
142,Gb frr ubj jryy lbh'er qbvat, fnl "FPBER".  Gb trg shyy perqvg sbe n
142,gernfher, lbh zhfg yrnir vg fnsryl va gur ohvyqvat, gubhtu lbh trg
142,cnegvny perqvg whfg sbe ybpngvat vg.  Lbh ybfr cbvagf sbe trggvat
142,xvyyrq, be sbe dhvggvat, gubhtu gur sbezre pbfgf lbh zber.  Gurer ner
142,nyfb cbvagf onfrq ba ubj zhpu (vs nal) bs gur pnir lbh'ir znantrq gb
142,rkcyber; va cnegvphyne, gurer vf n ynetr obahf whfg sbe trggvat va (gb
142,qvfgvathvfu gur ortvaaref sebz gur erfg bs gur cnpx), naq gurer ner
142,bgure jnlf gb qrgrezvar jurgure lbh'ir orra guebhtu fbzr bs gur zber
142,uneebjvat frpgvbaf.  Vs lbh guvax lbh'ir sbhaq nyy gur gernfherf, whfg
142,xrrc rkcybevat sbe n juvyr.  Vs abguvat vagrerfgvat unccraf, lbh
142,unira'g sbhaq gurz nyy lrg.  Vs fbzrguvat vagrerfgvat QBRF unccra,
142,vg zrnaf lbh'er trggvat n obahf naq unir na bccbeghavgl gb tneare znal
142,zber cbvagf va gur znfgre'f frpgvba.  V znl bppnfvbanyyl bssre uvagf
142,vs lbh frrz gb or univat gebhoyr.  Vs V qb, V'yy jnea lbh va nqinapr
142,ubj zhpu vg jvyy nssrpg lbhe fpber gb npprcg gur uvagf.  Svanyyl, gb
142,fnir cncre, lbh znl fcrpvsl "OEVRS", juvpu gryyf zr arire gb ercrng
142,gur shyy qrfpevcgvba bs n cynpr hayrff lbh rkcyvpvgyl nfx zr gb.
143,Qb lbh vaqrrq jvfu gb dhvg abj?
144,Gurer vf abguvat urer jvgu juvpu gb svyy gur infr.
145,Gur fhqqra punatr va grzcrengher unf qryvpngryl funggrerq gur infr.
146,Vg vf orlbaq lbhe cbjre gb qb gung.
147,V qba'g xabj ubj.
148,Vg vf gbb sne hc sbe lbh gb ernpu.
149,Lbh xvyyrq n yvggyr qjnes.  Gur obql inavfurf va n pybhq bs ternfl
149,oynpx fzbxr.
150,Gur furyy vf irel fgebat naq vf vzcreivbhf gb nggnpx.
151,Jung'f gur znggre, pna'g lbh ernq?  Abj lbh'q orfg fgneg bire.
152,Gur nkr obhaprf unezyrffyl bss gur qentba'f guvpx fpnyrf.
153,Gur qentba ybbxf engure anfgl.  Lbh'q orfg abg gel gb trg ol.
154,Gur yvggyr oveq nggnpxf gur terra qentba, naq va na nfgbhaqvat syheel
154,trgf oheag gb n pvaqre.  Gur nfurf oybj njnl.
155,Ba jung?
156,Bxnl, sebz abj ba V'yy bayl qrfpevor n cynpr va shyy gur svefg gvzr
156,lbh pbzr gb vg.  Gb trg gur shyy qrfpevcgvba, fnl "YBBX".
157,Gebyyf ner pybfr eryngvirf jvgu gur ebpxf naq unir fxva nf gbhtu nf
157,gung bs n euvabprebf.  Gur gebyy sraqf bss lbhe oybjf rssbegyrffyl.
158,Gur gebyy qrsgyl pngpurf gur nkr, rknzvarf vg pnershyyl, naq gbffrf vg
158,onpx, qrpynevat, "Tbbq jbexznafuvc, ohg vg'f abg inyhnoyr rabhtu."
159,Gur gebyy pngpurf lbhe gernfher naq fpheevrf njnl bhg bs fvtug.
160,Gur gebyy ershfrf gb yrg lbh pebff.
161,Gurer vf ab ybatre nal jnl npebff gur punfz.
162,Whfg nf lbh ernpu gur bgure fvqr, gur oevqtr ohpxyrf orarngu gur
162,jrvtug bs gur orne, juvpu jnf fgvyy sbyybjvat lbh nebhaq.  Lbh
162,fpenooyr qrfcrengryl sbe fhccbeg, ohg nf gur oevqtr pbyyncfrf lbh
162,fghzoyr onpx naq snyy vagb gur punfz.
163,Gur orne yhzoref gbjneq gur gebyy, jub yrgf bhg n fgnegyrq fuevrx naq
163,fpheevrf njnl.  Gur orne fbba tvirf hc gur chefhvg naq jnaqref onpx.
164,Gur nkr zvffrf naq ynaqf arne gur orne jurer lbh pna'g trg ng vg.
165,Jvgu jung?  Lbhe oner unaqf?  Ntnvafg UVF orne unaqf??
166,Gur orne vf pbashfrq; ur bayl jnagf gb or lbhe sevraq.
167,Sbe pelvat bhg ybhq, gur cbbe guvat vf nyernql qrnq!
168,Gur orne rntreyl jbysf qbja lbhe sbbq, nsgre juvpu ur frrzf gb pnyz
168,qbja pbafvqrenoyl naq rira orpbzrf engure sevraqyl.
169,Gur orne vf fgvyy punvarq gb gur jnyy.
170,Gur punva vf fgvyy ybpxrq.
171,Gur punva vf abj haybpxrq.
172,Gur punva vf abj ybpxrq.
173,Gurer vf abguvat urer gb juvpu gur punva pna or ybpxrq.
174,Gurer vf abguvat urer gb rng.
175,Qb lbh jnag gur uvag?
176,Qb lbh arrq uryc trggvat bhg bs gur znmr?
177,Lbh pna znxr gur cnffntrf ybbx yrff nyvxr ol qebccvat guvatf.
178,Ner lbh gelvat gb rkcyber orlbaq gur Cybire Ebbz?
179,Gurer vf n jnl gb rkcyber gung ertvba jvgubhg univat gb jbeel nobhg
179,snyyvat vagb n cvg.  Abar bs gur bowrpgf ninvynoyr vf vzzrqvngryl
179,hfrshy va qvfpbirevat gur frperg.
180,Qb lbh arrq uryc trggvat bhg bs urer?
181,Qba'g tb jrfg.
182,Tyhggbal vf abg bar bs gur gebyy'f ivprf.  Ninevpr, ubjrire, vf.
183,Lbhe ynzc vf trggvat qvz.  Lbh'q orfg fgneg jenccvat guvf hc, hayrff
183,lbh pna svaq fbzr serfu onggrevrf.  V frrz gb erpnyy gurer'f n iraqvat
183,znpuvar va gur znmr.  Oevat fbzr pbvaf jvgu lbh.
184,Lbhe ynzc unf eha bhg bs cbjre.
185,Gurer'f abg zhpu cbvag va jnaqrevat nebhaq bhg urer, naq lbh pna'g
185,rkcyber gur pnir jvgubhg n ynzc.  Fb yrg'f whfg pnyy vg n qnl.
186,Gurer ner snvag ehfgyvat abvfrf sebz gur qnexarff oruvaq lbh.  Nf lbh
186,ghea gbjneq gurz, gur ornz bs lbhe ynzc snyyf npebff n orneqrq cvengr.
186,Ur vf pneelvat n ynetr purfg.  "Fuvire zr gvzoref!" ur pevrf, "V'ir
186,orra fcbggrq!  V'q orfg uvr zrfrys bss gb gur znmr gb uvqr zr purfg!"
186,Jvgu gung, ur inavfurf vagb gur tybbz.
187,Lbhe ynzc vf trggvat qvz.  Lbh'q orfg tb onpx sbe gubfr onggrevrf.
188,Lbhe ynzc vf trggvat qvz.  V'z gnxvat gur yvoregl bs ercynpvat gur
188,onggrevrf.
189,Lbhe ynzc vf trggvat qvz, naq lbh'er bhg bs fcner onggrevrf.  Lbh'q
189,orfg fgneg jenccvat guvf hc.
190,Vg'f nqqerffrq gb "Jvgg'f Raq". Gur erfg vf jevggra va qjneivfu.
191,"Guvf vf abg gur znmr jurer gur cvengr yrnirf uvf gernfher purfg."
192,Uzzz, guvf ybbxf yvxr n pyhr, juvpu zrnaf vg'yy pbfg lbh 10 cbvagf gb
192,ernq vg.  Fubhyq V tb nurnq naq ernq vg naljnl?
193,Vg fnlf, "Gurer vf fbzrguvat fgenatr nobhg guvf cynpr, fhpu gung bar
193,bs gur jbeqf V'ir nyjnlf xabja abj unf n arj rssrpg."
194,Vg fnlf gur fnzr guvat vg qvq orsber.
195,V'z nsenvq V qba'g haqrefgnaq.
196,"Pbatenghyngvbaf ba oevatvat yvtug vagb gur Qnex Ebbz!"
197,Lbh fgevxr gur zveebe n erfbhaqvat oybj, jurerhcba vg funggref vagb n
197,zlevnq gval sentzragf.
198,Lbh unir gnxra gur infr naq uheyrq vg qryvpngryl gb gur tebhaq.
199,Lbh cebq gur arnerfg qjnes, jub jnxrf hc tehzcvyl, gnxrf bar ybbx ng
199,lbh, phefrf, naq tenof sbe uvf nkr.
200,Vf guvf npprcgnoyr?
201,Pbybffny Pnir vf NYJNLF bcra, cebivqrq guvf vf lbhe CP.
202,V'z fbeel. Qvq lbh fnl fbzrguvat?
203,V ort lbhe cneqba?
204,Fcrnx ybhqre. V pna'g urne lbh!
205,V'z fbeel - V pna'g unaqyr zber guna gjb jbeqf ng n gvzr.
206,NQIRAGHER.ONG irefvba 1.6
206,
206,NQIRAGHER jnf bevtvanyyl qrirybcrq ol Jvyyvr Pebjgure.  Zbfg bs gur
206,srngherf bs gur pheerag cebtenz jrer nqqrq ol Qba Jbbqf.
206,
206,Guvf irefvba jnf jevggra ol Qnir Oraunz nf n Jvaqbjf ongpu fpevcg.
206,Bayl angvir ongpu pbzznaqf jrer hfrq.  Gur tnzr vf vagraqrq gb or
206,n snvgushy ercebqhpgvba bs gur 350 cbvag bevtvany jvgu zvavzny punatrf.
206,Vg jnf qrevirq sebz gur SBEGENA fbhepr pbqr sbe QRPHF Cebtenz 11-340
206,qbar ol Xrag Oynpxrgg naq Obo Fhcavx.  Gur npghny fbhepr pbqr hfrq jnf
206,gnxra sebz gur qvfgevohgvba cnpxntr cebivqrq jvgu gur Xra Cybgxva erubfg
206,gb gur CP.
207,Abj gung vf whfg fvyyl - vg'f nyernql rzcgl!
208,Lbh pna'g ernq va gur qnex!
-1
7
1,3
2,3
3,8,9
4,10
5,11
6,0
7,14,15
8,13
9,94,-1
10,96
11,19,-1
12,17,27
13,101,-1
14,103
15,0
16,106
17,0,-1
18,0
19,3
20,3
21,0
22,0
23,109,-1
24,25,-1
25,23,67
26,111,-1
27,35,110
28,0
29,97,-1
30,0,-1
31,119,121
32,117,122
33,117,122
34,0,0
35,130,-1
36,0,-1
37,126,-1
38,140,-1
39,0
40,96,-1
50,18
51,27
52,28
53,29
54,30
55,0
56,92
57,95
58,97
59,100
60,101
61,0
62,119,121
63,127
64,130,-1
-1
8
1,24
2,29
3,0
4,33
5,54
6,33
7,38
8,38
9,42
10,14
11,43
12,110
13,29
14,110
15,73
16,75
17,29
18,13
19,59
20,59
21,14
22,109
23,67
24,13
25,147
26,155
27,195
28,146
29,110
30,13
31,13
32,13
-1
9
0,1,2,3,4,5,6,7,8,9,10
0,100,115,116,126
2,1,3,4,7,38,95,113,24
1,24
3,46,47,48,54,56,58,82,85,86
3,122,123,124,125,126,127,128,129,130
4,8
5,13
6,19
7,42,43,44,45,46,47,48,49,50,51
7,52,53,54,55,56,80,81,82,86,87
8,99,100,101
9,108
-1
10
35,Lbh ner boivbhfyl n Enax Nzngrhe.  Orggre yhpx arkg gvzr.
100,Lbhe fpber dhnyvsvrf lbh nf n Abivpr Pynff Nqiraghere.
130,Lbh unir npuvrirq gur engvat: "Rkcrevraprq Nqiraghere".
200,Lbh znl abj pbafvqre lbhefrys n "Frnfbarq Nqiraghere".
250,Lbh unir ernpurq "Whavbe Znfgre" fgnghf.
300,Lbhe fpber chgf lbh va Znfgre Nqiraghere Pynff P.
330,Lbhe fpber chgf lbh va Znfgre Nqiraghere Pynff O.
349,Lbhe fpber chgf lbh va Znfgre Nqiraghere Pynff N.
9999,Nyy bs Nqiragherqbz tvirf gevohgr gb lbh, Nqiragher Tenaqznfgre!
-1
11
2,9999,10,0,0
3,9999,5,0,0
4,4,2,62,63
5,5,2,18,19
6,8,2,20,21
7,75,4,176,177
8,25,5,178,179
9,20,3,180,181
-1
0
::}
