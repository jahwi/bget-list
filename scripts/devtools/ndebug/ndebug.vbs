'NDebug v1.0.2. Is Not a Debugger.
'https://pastebin.com/u/jcunews
'https://www.reddit.com/user/jcunews1
'
'DOS DEBUG clone mainly for binary file editing (as a hex editor).
'
'Differences:
'- No disassembler and assembler functions.
'- No executable program/code.
'- No disk sector, I/O port, and expanded memory (EMS).
'- No CPU flag register, and CPU/FPU mode.
'- Memory is simulated using zero filled buffer.
'- CPU registers are simulated.
'- Default segment for loading file is 0000.
'- E command's list parameter is required.
'- L command accepts file name as third parameter.
'- Support file size up to 256MB.

''''Bgetdescription#[VBS] DOS DEBUG clone mainly for binary file editing [as a hex editor].
''''Bgetauthor#jcunews
''''Bgetcategory#devtools
'
'Effective CPU registers:
'- CS:IP = Starting address of file for L & W commands
'- BX:CX = Size of file for L & W commands
'- DS    = Default segment for C, D, E, F, M, and S commands.
'- SI    = Number of 1MB memory storages. From 2 up to 256. Default is 2.
'- DI    = Index of memory storage. Default is 0. i.e.:
'          DI:DS:AX = 001 1234:5678 = 1 179B8 = linear address 1179B8.
'
'Usage: NDebug.vbs [file]
'
'For a list of commands, run script and type ? at the prompt.

'Debug help screen
'compare      C range address
'dump         D [range]
'enter        E address list
'fill         F range list
'hex add/sub  H value1 value2
'load file    L [address [[path]filename]]
'move         M range address
'set name     N [path]filename
'quit         Q
'register     R [register [value]]
'search       S range list
'write file   W [address]
'range: address [l length | offset]
'address: [segment:]offset
'list: byte[,byte..] | "string"[ "string"...]
'value: word

function hexb(n)
  a = "0" & hex(n)
  hexb = right(a, 2)
end function

function hexw(n)
  a = "000" & hex(n)
  hexw = right(a, 4)
end function

function loadfile(seg, ofs, fn)
  on error resume next
  a = clng(int(((seg * 65536) + ofs + fs.getfile(fn).size + 65535) / 65536))
  loadfile = err.number = 0
  if not loadfile then exit function
  if a > (ubound(mem) + 1) then
    if not resizemem(a) then
      writeln "Insufficient memory"
      loadfile = false
      exit function
    end if
  end if
  st.type = 2
  st.charset = "x-user-defined"
  st.open
  st.loadfromfile fn
  if err.number = 0 then
    a = st.readtext
    writemems seg, ofs, a
    bx = clng(int(len(a) / 65536))
    cx = len(a) and 65535
    loadfile = true
  end if
  st.close
end function

function parseaddr(byref ms, mi, reqofs, defseg, defofs, byref seg, byref ofs)
  parseaddr = true
  if ms(mi) <> "" then 'number: segment
    seg = str2intw(ms(mi))
  elseif ms(mi + 1) <> "" then 'register: segment
    seg = eval(ms(mi + 1))
  else
    seg = defseg
  end if
  if ms(mi + 2) <> "" then 'number: offset
    ofs = str2intw(ms(mi + 2))
  elseif ms(mi + 3) <> "" then 'register: offset
    ofs = eval(ms(mi + 3))
  elseif reqofs then
    parseaddr = false
  else
    ofs = defofs
  end if
end function

function parselist(ofs, s, byref data)
  if s = "" then
    parselist = true
    exit function
  end if
  parselist = true
  set y = new regexp
  y.pattern = "\s*([0-9a-f]{1,2}|""[^""]+"")"
  c = s
  data = ""
  f = ofs
  do while c <> ""
    set m = y.execute(c)
    if m.count = 0 then
      parselist = false
      exit function
    end if
    e = m(0).submatches(0)
    if left(e, 1) <> """" then
      data = data & chr(str2intb(e)) 'byte
      f = f + 1
    else
      g = mid(e, 2, len(e) - 2)
      data = data & g 'string
      f = f + len(g)
    end if
    if f > 65535 then
      parselist = false
      exit function
    end if
    c = mid(c, m(0).length + 1)
  loop
end function

function parserange(byref ms, mi, reqofs, reqlen, clip, defseg, defofs, _
  deflen, byref seg, byref ofs, byref last)
  parserange = parseaddr(ms, mi, reqofs, defseg, defofs, seg, ofs)
  if not parserange then exit function
  if ms(mi + 4) <> "" then 'number: length
    last = ofs + str2intw(ms(mi + 4)) - 1
  elseif ms(mi + 5) <> "" then 'register: length
    last = ofs + eval(ms(mi + 5)) - 1
  elseif ms(mi + 6) <> "" then 'number: end offset
    last = str2intw(ms(mi + 6))
  elseif ms(mi + 7) <> "" then 'register: end offset
    last = eval(ms(mi + 7))
  elseif reqlen then
    parserange = false
    exit function
  else
    last = ofs + deflen - 1
  end if
  if clip then
    if last > 65535 then last = 65535
  else
    parserange = last <= 65535
  end if
end function

function readln
  on error resume next
  do while true
    readln = wscript.stdin.readline
    if err.number = 0 then exit do
    err.clear
  loop
end function

function readmemb(cs, ip)
  a = segofs2memadr(cs, ip)
  readmemb = mid(mem((di * 16) + a(0)), a(1) + 1, 1)
end function

function readmems(seg, ofs, length)
  a = (di * 16) + clng(int(seg / 4096))
  b = ((seg and &Hfff) * &H10) + ofs
  i = 0
  r = ""
  do while i < length
    c = length - i
    if (b + c) > 65536 then c = 65536 - b
    r = r & mid(mem(a), b + 1, c)
    a = a + 1
    b = 0
    i = i + c
  loop
  readmems = r
end function

function resizemem(n)
  resizemem = (n * 65536) <= maxmem
  if not resizemem then exit function
  a = ubound(mem)
  redim preserve mem(n)
  if n > a then
    for i = a + 1 to ubound(mem)
      mem(i) = string(65536, chr(0))
    next
  end if
end function

function segofs(a, b)
  segofs = hexw(a) & ":" & hexw(b)
end function

function segofs2memadr(seg, ofs)
  a = (seg * &H10) + ofs
  segofs2memadr = array(clng(int(a / 65536)), a and 65535)
end function

function str2intb(a)
  str2intb = eval("&H" & a) and 255
end function

function str2intw(a)
  str2intw = eval("&H" & a) and 65535
end function

sub write(s)
  wscript.stdout.write s
end sub

sub writeln(s)
  wscript.stdout.writeline s
end sub

sub writememb(seg, ofs, n)
  a = (di * 16) + clng(int(seg / 4096))
  b = ((seg and &Hfff) * &H10) + ofs
  mem(a) = mid(mem(a), 1, b) & chr(n) & mid(mem(a), b + 2)
end sub

sub writemems(seg, ofs, data)
  a = (di * 16) + clng(int(seg / 4096))
  b = ((seg and &Hfff) * &H10) + ofs
  i = 0
  do while i <= (len(data) - 1)
    c = len(data) - i
    if (b + c) > 65536 then c = 65536 - b
    mem(a) = mid(mem(a), 1, b) & mid(data, i + 1, c) & mid(mem(a), b + c + 1)
    a = a + 1
    b = 0
    i = i + c
  loop
end sub

'--------------------------------------------------------------------

sub compare
  x.pattern = "^c\s*" & xrng & "\s+" & xaddr & "\s*$" '8+4
  set m = x.execute(cl)
  if m.count > 0 then
    set m = m(0).submatches
    if not parserange(m, 0, true, true, false, ds, 0, 0, a, b, c) then
      writeln "Error"
      exit sub
    end if
    d = (c + 1) - b 'length
    parseaddr m, 8, true, ds, 0, e, f
    if (c < b) or ((65536 - f) < d) then
      writeln "Error"
      exit sub
    end if
    do while d > 0
      g = 65536 - b
      h = 65536 - f
      if h < g then g = h
      h = readmems(a, b, g)
      i = readmems(e, f, g)
      for j = 1 to len(h)
        k = mid(h, j, 1)
        l = mid(i, j, 1)
        if k <> l then
          writeln segofs(a, b + j - 1) & "  " & hexb(asc(k)) & "  " & _
            hexb(asc(l)) & "  " & segofs(e, f + j - 1)
        end if
      next
      b = b + g
      if b = 0 then a = a + &H1000
      f = f + g
      if f = 0 then e = e + &H1000
      d = d - g
    loop
  else
    writeln "Error"
  end if
end sub

sub dump
  x.pattern = "^d\s*(?:" & xrng & "?)?\s*$" '8
  set m = x.execute(cl)
  if m.count > 0 then
    set m = m(0).submatches
    parserange m, 0, false, false, true, dg, df, &H80, k, a, b
    if (b < a) or (b > 65535) then
      writeln "Error"
      exit sub
    end if
    j = b and &Hfff0
    c = a and &Hfff0
    d = a and &Hf
    do while c <= b
      write segofs(k, c) & "  "
      e = " "
      if c <> j then
        f = &Hf
      else
        f = b and &Hf
      end if
      for i = 0 to &Hf
        if (i >= d) and (i <= f) then
          g = readmemb(k, c + i)
          h = asc(g)
          if (h < &H20) or (h > &H7e) then g = "."
          write hexb(h)
        else
          g = " "
          write "  "
        end if
        e = e & g
        if i = 7 then
          write "-"
        else
          write " "
        end if
      next
      writeln e
      d = 0
      c = c + 16
    loop
    dg = k
    df = (b + 1) and 65535
  else
    writeln "Error"
  end if
end sub

sub enter
  x.pattern = "^e\s*" & xaddr & "(.*?)\s*$" '4+1
  set m = x.execute(cl)
  if m.count > 0 then
    set m = m(0).submatches
    parseaddr m, 0, true, ds, 0, a, b
    if not parselist(b, m(4), d) then
      writeln "Error"
      exit sub
    end if
    writemems a, b, d
  else
    writeln "Error"
  end if
end sub

sub fill
  x.pattern = "^f\s*" & xrng & "(.*?)\s*$" '8+1
  set m = x.execute(cl)
  if m.count > 0 then
    set m = m(0).submatches
    if not parserange(m, 0, true, true, false, ds, 0, 0, a, b, c) then
      writeln "Error"
      exit sub
    end if
    if not parselist(b, m(8), d) then
      writeln "Error"
      exit sub
    end if
    do while b < c
      if (b + len(d)) > c then d = left(d, c - b)
      writemems a, b, d
      b = b + len(d)
    loop
  else
    writeln "Error"
  end if
end sub

sub help
  set sf = fs.opentextfile(wscript.scriptfullname)
  s = " "
  do while s <> ""
    s = sf.readline
  loop
  i = 0
  do while true
    s = sf.readline
    if s = "" then exit sub
    writeln mid(s, 2)
    i = i + 1
    if i = 23 then
      i = 0
      write "[press ENTER for more]"
      readln
      write chr(13) & space(22) & chr(13)
    end if
  loop
end sub

sub hexCalc
  x.pattern = "^h\s*" & xval & "\s+" & xval & "\s*$" '1+1
  set m = x.execute(cl)
  if m.count > 0 then
    set m = m(0).submatches
    a = str2intw(m(0))
    b = str2intw(m(1))
    writeln hexw(a + b) & " " & hexw(a - b)
  else
    writeln "Error"
  end if
end sub

sub load
  x.pattern = "^l\s*(?:" & xaddr & "(?:\s*(.*?))?)?\s*$" '4+1
  set m = x.execute(cl)
  if m.count > 0 then
    set m = m(0).submatches
    parseaddr m, 0, false, 0, &H100, a, b
    if m(4) <> "" then 'file
      c = m(4)
      if left(c, 1) = """" then
        if right(c, 1) = """" then
          c = trim(mid(c, 2, len(c) - 2))
        else
          c = ltrim(mid(c, 2))
        end if
      end if
    else
      c = fp
    end if
    if loadfile(a, b, c) then
      fp = c
    else
      writeln "File not found"
    end if
  else
    writeln "Error"
  end if
end sub

sub move
  x.pattern = "^m\s*" & xrng & "\s+" & xaddr & "\s*$" '8+4
  set m = x.execute(cl)
  if m.count > 0 then
    set m = m(0).submatches
    if not parserange(m, 0, true, true, false, ds, 0, 0, a, b, c) then
      writeln "Error"
      exit sub
    end if
    d = (c + 1) - b 'length
    parseaddr m, 8, true, ds, 0, e, f
    if (c < b) or ((65536 - f) < d) then
      writeln "Error"
      exit sub
    end if
    writemems e, f, readmems(a, b, c - b + 1)
  else
    writeln "Error"
  end if
end sub

sub name
  a = ltrim(mid(cl, 2))
  if left(a, 1) = """" then
    if right(a, 1) = """" then
      a = trim(mid(a, 2, len(a) - 2))
    else
      a = ltrim(mid(a, 2))
    end if
  end if
  fp = a
end sub

sub register
  x.pattern = "^r\s*(?:" & xregs & "(?:\s+" & xvlrg & ")?)?\s*$" '1+2
  set m = x.execute(cl)
  if m.count > 0 then
    set m = m(0).submatches
    if m(0) <> "" then 'set registers
      a = ucase(m(0))
      if a = "SI" then
        tsi = si
      elseif a = "DI" then
        tdi = di
      end if
      if m(1) <> "" then 'immediate number
        b = str2intw(m(1))
        if isempty(b) then
          writeln "Error"
          exit sub
        end if
        executeglobal a & "=" & b
      elseif m(2) <> "" then 'immediate register
        b = eval(m(2))
        if isempty(b) then
          writeln "Error"
          exit sub
        end if
        executeglobal a & "=" & b
      else 'prompt
        b = eval(a)
        write a & " " & hexw(b) & "  :"
        b = trim(readln)
        if b = "" then exit sub
        y.pattern = "^" & xvlrg & "$"
        set m = y.execute(b)
        if m.count > 0 then
          set m = m(0).submatches
          if m(0) <> "" then 'number
            b = str2intw(b)
          else 'register
            b = eval(b)
          end if
        else
          writeln "Error"
          exit sub
        end if
        executeglobal a & "=" & b
      end if
      if a = "SI" then
        if si <> tsi then
          if (si > 0) and (si <= int(maxmem / 1048576)) then
            resizemem si
          else
            si = tsi
            writeln "Error"
          end if
        end if
      elseif a = "DI" then
        if di <> tdi then
          if di > (int((ubound(mem) + 1) / 16) - 1) then
            di = tdi
            writeln "Error"
          end if
        end if
      end if
    else 'display registers
      writeln "AX=" & hexw(ax) & " BX=" & hexw(bx) & " CX=" & hexw(cx) & _
        " DX=" & hexw(dx) & " SP=" & hexw(sp) & " BP=" & hexw(bp) & _
        " SI=" & hexw(si) & " DI=" & hexw(di) & vbcrlf & "DS=" & hexw(ds) & _
        " ES=" & hexw(es) & " SS=" & hexw(ss) & " CS=" & hexw(cs) & _
        " IP=" & hexw(ip)
    end if
  else
    writeln "Error"
  end if
end sub

sub search
  x.pattern = "^s\s*" & xrng & "(.*?)\s*$" '8+1
  set m = x.execute(cl)
  if m.count > 0 then
    set m = m(0).submatches
    if not parserange(m, 0, true, true, false, ds, 0, 0, a, b, c) then
      writeln "Error"
      exit sub
    end if
    if not parselist(b, m(8), d) then
      writeln "Error"
      exit sub
    end if
    c = c - len(d) + 1
    do while b < c
      if readmems(a, b, len(d)) = d then
        writeln segofs(a, b)
      end if
      b = b + 1
    loop
  else
    writeln "Error"
  end if
end sub

sub writefile
  x.pattern = "^w\s*(?:" & xaddr & "(?:\s*(.*?))?)?\s*$" '4+1
  set m = x.execute(cl)
  if m.count > 0 then
    set m = m(0).submatches
    parseaddr m, 0, false, 0, &H100, a, b
    c = (bx * 65536) + cx
    d = (a * &H10) + b + c
    if d > ((ubound(mem) + 1) * 65536) then
      writeln "Error"
      exit sub
    end if
    st.type = 2
    st.charset = "x-user-defined"
    st.open
    st.writetext readmems(a, b, c)
    on error resume next
    st.savetofile fp, 2
    if err.number = 0 then
      d = hex(c)
      if len(d) < 4 then d = string(4 - len(d), "0") & d
      writeln "Writing " & d & " bytes"
    else
      writeln "File not found"
    end if
    st.close
  else
    writeln "Error"
  end if
end sub

'====================================================================

if wscript.arguments.count > 0 then
  fp = wscript.arguments(0)
else
  fp = ""
end if
set fs = createobject("scripting.filesystemobject")
if fp <> "" then
  if left(fp, 1) = "/" then
    if fp = "/?" then
      set sf = fs.opentextfile(wscript.scriptfullname)
      do while true
        s = sf.readline
        if s = "" then wscript.quit
        writeln mid(s, 2)
      loop
    else
      writeln "Invalid switch - " & mid(fp, 2, 1)
    end if
    wscript.quit
  end if
end if
set st = createobject("adodb.stream")

ax = 0
bx = 0 'file write length high
cx = 0 'file write length low
dx = 0
sp = 0
bp = 0
si = 2 'memory bank size. 1mb each
di = 0 'memory bank index
ds = 0 'data segment
es = 0
ss = 0
cs = 0 'file segment
ip = &H100 'file offset
dg = ds 'dump segment context
df = ip 'dump offset context
maxmem = 256 * 1048576 'max memory storage in bytes
redim mem(-1)
resizemem si * 16 - 1 'memory storage in 64kb blocks. min & default is 1mb+64k

if fp <> "" then
  if fs.fileexists(fp) then
    loadfile cs, ip, fp
  else
    writeln "File not found"
  end if
end if

set x = new regexp
x.ignorecase = true
set y = new regexp
y.ignorecase = true
set z = new regexp
z.ignorecase = true
xval  = "([0-9a-f]{1,4})" '1
xregs = "(ax|bx|cx|dx|sp|bp|si|di|ds|es|ss|cs|ip)" '1
xvlrg = "(?:" & xval & "|" & xregs & ")" '2
xaddr = "(?:" & xvlrg & ":)?" & xvlrg '4=2+2
xrng  = xaddr & "(?:\s*l\s*" & xvlrg & "|\s*" & xvlrg & ")" '8=4+2+2
do while true
  write "-"
  t = timer
  cl = trim(readln)
  u = timer 'use input speed to determine input redirection
  if (u - t) < 0.03 then writeln "" 'fast = input redirected
  on error goto 0
  select case ucase(left(cl, 1))
    case "C"  compare
    case "D"  dump
    case "E"  enter
    case "F"  fill
    case "H"  hexCalc
    case "L"  load
    case "M"  move
    case "N"  name
    case "Q"  wscript.quit
    case "R"  register
    case "S"  search
    case "W"  writefile
    case "?"  help
    case else if cl <> "" then writeln "Error"
  end select
loop