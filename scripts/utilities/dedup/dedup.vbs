'DeDup v1.0.1
'https://pastebin.com/u/jcunews
'https://greasyfork.org/en/users/85671-jcunews
'https://www.reddit.com/u/jcunews1
''''Bgetdescription#[VBS] Convert duplicate files into hardlinks or symlinks to save disk space.
''''Bgetauthor#jcunews
''''Bgetcategory#utilities
'
'Convert duplicate files into hardlinks or symlinks to save disk space.
'Requires Windows Vista or newer version.
'
'Usage: dedup [options] {path} [options]
'
'Options:
'/c  Continue to next file even if errors occur.
'/m  Use symlinks instead of hardlinks.
'/s  Process subdirectories.
'/t  Test/simulation mode. Does not actually change anything.
'
'Notes:
'- This script can not detect hardlinks. They will be seen as separate files.
'  So, this script will keep converting files if processing the same directory
'  for multiple times.
'- Hardlink file dates will always be the same as the link target file's.
'  Symlink file dates will always be set to the current time.
'- Once hardlinks are moved into different drve, the links will break and
'  become separate copies. Once symlinks or their target file are moved into
'  different directory, the links will no longer point to existing file.

sub help
  set f = fs.opentextfile(wscript.scriptfullname)
  do while true
    s = f.readline
    if s = "" then wscript.quit 1
    wscript.stdout.writeline mid(s, 2)
  loop
  wscript.quit 1
end sub

'treat number as 64-bit integer and convert it to binary string
function qwordAsStr(n)
  dim r, i
  r = ""
  for i = 0 to 7
    r = r & chr(n - int(n / 256) * 256)
    n = int(n / 256)
  next
  qwordasstr = r
end function

'returns binary string of: {8 chars file size},{20 chars sha1}
function calcHash(path)
  dim h
  ds.loadfromfile path
  ds.position = 0
  hs.position = 0
  hs.seteos
  hs.type = 1 'binary
  hs.write cr.computehash_2(ds.read)
  hs.position = 0
  hs.type = 2 'text
  hs.charset = "x-user-defined"
  calchash = qwordasstr(ds.size) & hs.readtext
end function

'calculate hash on specified directory
sub processDir(path)
  dim l, f
  set l = fs.getfolder(path)
  for each f in l.files
    if (f.attributes and 1024) = 0 then
      redim preserve hashfiles(ubound(hashfiles) + 1)
      hashfiles(ubound(hashfiles)) = calchash(f.path) & f.path
    end if
    wscript.stdout.write "."
  next
  if not recurs then exit sub
  for each f in l.subfolders
    processdir f.path
  next
end sub

'compare binary string
function binComp(s1, s2)
  dim i, a, b
  for i = 1 to 28
    a = asc(mid(s1, i, 1))
    b = asc(mid(s2, i, 1))
    if a < b then
      bincomp = -1
      exit function
    elseif a > b then
      bincomp = 1
      exit function
    end if
  next
  bincomp = 0
end function

'array quicksort. modified for binary string array.
'original author: Christopher J. Scharer
sub array_quicksort(byref rarr_arraytosort(), byval rlng_low, _
  byval rlng_high)
  dim var_pivot, lng_swap, lng_low, lng_high
  lng_low = rlng_low
  lng_high = rlng_high
  var_pivot = rarr_arraytosort((rlng_low + rlng_high) / 2)
  do while lng_low <= lng_high
    do while bincomp(rarr_arraytosort(lng_low), var_pivot) < 0 and _
      lng_low < rlng_high
      lng_low = lng_low + 1
    loop
    do while bincomp(var_pivot, rarr_arraytosort(lng_high)) < 0 and _
      lng_high > rlng_low
      lng_high = lng_high - 1
    loop
    if lng_low <= lng_high then
      lng_swap = rarr_arraytosort(lng_low)
      rarr_arraytosort(lng_low) = rarr_arraytosort(lng_high)
      rarr_arraytosort(lng_high) = lng_swap
      lng_low = lng_low + 1
      lng_high = lng_high - 1
    end if
  loop
  if rlng_low < lng_high then
    array_quicksort rarr_arraytosort, rlng_low, lng_high
  end if
  if lng_low < rlng_high then
    array_quicksort rarr_arraytosort, lng_low, rlng_high
  end if
end sub

'format number with thousand separator
function comma(byval n)
  dim r, i
  n = cstr(int(n))
  i = len(n) - 2
  r = ""
  do while i > 1
    r = "," & mid(n, i, 3) & r
    i = i - 3
  loop
  comma = left(n, i + 2) & r
end function

function strSize(n, byval sign)
  if sign and (n > 0) then
    sign = "+"
  else
    sign = ""
  end if
  if n >= 1073741824 then
    strsize = "(" & sign & comma(n / 1073741824) & " GB) "
  elseif n >= 1048576 then
    strsize = "(" & sign & comma(n / 1048576) & " MB) "
  elseif n >= 1024 then
    strsize = "(" & sign & comma(n / 1024) & " KB) "
  else
    strsize = ""
  end if
end function



'process command line parameters
set fs = createobject("scripting.filesystemobject")
path = ""
igerr = false
test = false
slink = false
recurs = false
for each s in wscript.arguments
  if left(s, 1) = "/" then
    select case ucase(s)
      case "/C" igerr = true
      case "/M" slink = true
      case "/S" recurs = true
      case "/T" test = true
      case else help
    end select
  elseif path = "" then
    path = s
  else
    help
  end if
next
if path = "" then help
df = fs.getfolder(path).drive.freespace

set ds = createobject("adodb.stream")
ds.open
ds.type = 1 'binary
set hs = createobject("adodb.stream")
hs.open
on error resume next
set cr = createobject("system.security.cryptography.sha1cryptoserviceprovider")
if err.number <> 0 then
  wscript.stdout.writeline _
    "This script requires .NET Framework of any version."
  wscript.quit 2
end if
on error goto 0

wscript.stdout.write "Gathering file information"
redim hashfiles(-1) 'hash+path
processdir path
wscript.stdout.writeline

wscript.stdout.writeline "Sorting file information..."
array_quicksort hashfiles, 0, ubound(hashfiles)

set ws = createobject("wscript.shell")
uniqcount = 0
dupecount = 0
okcount = 0
errcount = 0
freed = 0
redim dups(-1) '[[{8 chars file size},{20 chars sha1}], ...]
prevhash = ""
prevfile = ""
for each s in hashfiles
  h = left(s, 28)
  f = mid(s, 29)
  if h <> prevhash then
    if ubound(dups) >= 0 then
      uniqcount = uniqcount + 1
      dupecount = dupecount + ubound(dups)
      freed = freed + ubound(dups) * fs.getfile(dups(0)(1)).size
      wscript.stdout.writeline vbcrlf & "Uniq: " & dups(0)(1)
      on error resume next
      for i = 1 to ubound(dups)
        wscript.stdout.writeline "Link: " & dups(i)(1)
        if not test then
          err.clear
          set sf = fs.getfile(dups(i)(1))
          sn = sf.name
          sf.name = sn & ".todelete"
          if err.number = 0 then
            if slink then
              s = ""
            else
              s = "/h "
            end if
            set xc = ws.exec("cmd.exe /c mklink " & s & """" & dups(i)(1) & _
              """ """ & dups(0)(1) & """")
            if err.number = 0 then
              do while xc.status = 0
                wscript.sleep 50
              loop
              if xc.exitcode = 0 then
                okcount = okcount + 1
                fs.deletefile dups(i)(1) & ".todelete"
              else
                do while not xc.stdout.atendofstream
                  wscript.stdout.writeline xc.stdout.readline
                loop
                sf.name = sn
                errcount = errcount + 1
                if not igerr then wscript.quit
              end if
            else
              wscript.stdout.writeline err.description
              sf.name = sn
              errcount = errcount + 1
              if not igerr then wscript.quit
            end if
          else
            wscript.stdout.writeline err.description
            errcount = errcount + 1
            if not igerr then wscript.quit
          end if
        end if
      next
      on error goto 0
      redim dups(-1)
    end if
  elseif ubound(dups) >= 0 then
    redim preserve dups(ubound(dups) + 1)
    dups(ubound(dups)) = array(h, f)
  else
    redim preserve dups(ubound(dups) + 2)
    dups(ubound(dups) - 1) = array(prevhash, prevfile)
    dups(ubound(dups)) = array(h, f)
  end if
  prevhash = h
  prevfile = f
next
df = fs.getfolder(path).drive.freespace - df
if df > 0 then
  df = "+" & comma(df) & " Bytes " & strsize(df, true)
else
  df = comma(df) & " Bytes " & strsize(df, false)
end if
wscript.stdout.writeline vbcrlf & _
  "Found " & comma(dupecount) & " duplicates of " & comma(uniqcount) & _
  " unique files." & _
  vbcrlf & _
  comma(okcount) & " duplicates has been successfully linked. " & _
  comma(errcount) & " have failed." & _
  vbcrlf & _
  comma(freed) & " Bytes " & strsize(freed, false) & _
  "of disk space is supposedly be freed." & _
  vbcrlf & _
  "Actual disk free space difference: " & df