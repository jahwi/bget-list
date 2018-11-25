@if (@CodeSection == @Batch) @Then

:: -----------------------------------------------------
:: csv.bat v1.1.2
:: csv.bat /? for usage
::.
:: For updates and discussion, visit
:: http://www.dostips.com/forum/viewtopic.php?f=3&t=6184
:: -----------------------------------------------------
::::BgetDescription#CSV.BAT allows interaction with CSV or TSV or similar files with SQL syntax.
::::BgetAuthor#Rojo
::::BgetCategory#library
@echo off
setlocal enabledelayedexpansion

if "%~1"=="" goto usage

for %%I in (sqlfile tmpfile found) do set %%I=
for %%I in (_E _S _Debug) do set %%I=0
set "_D=,"

set keywords="SELECT" "INSERT" "UPDATE" "DELETE" "DESCRIBE" "TRUNCATE"

:: loop through arguments until either a keyword or a filename is reached
for %%I in (%*) do (
   if "!_D!"=="found" set "_D=%%~I"
   if /i "%%~I"=="/d" set "_D=found"
   if /i "%%~I"=="/e" set "_E=1"
   if /i "%%~I"=="/s" set "_S=1"
   if /i "%%~I"=="/debug" set "_Debug=1"
   if not "!keywords!"=="!keywords:%%~I=!" (
      goto break
   )
   if exist "%%~I" (
      set "sqlfile=%%~I"
      goto break
   )
)
:break

if not defined sqlfile (

   if "%_S%"=="1" (
      set "sqlfile=%CD%"
   ) else (

      set "args=%*"
      for %%I in (SELECT INSERT UPDATE DELETE DESCRIBE TRUNCATE /D) do (
         if not "!args!"=="!args:%%I=!" set found=1
      )

      if "%_E%"=="1" goto usage

      if not defined found goto usage
      set "tmpfile=%temp%\raw%time::=%.tmp"
   )
)

:: pass arguments via text file to avoid stripping quotation marks
if defined tmpfile (
   >"%tmpfile%" echo(%*
   set "sqlfile=%tmpfile%"
)

:: if 64-bit Windows, use 32-bit cscript for Jet driver compat
set "cscript=%systemroot%\SysWOW64\cscript.exe"
if not exist "%cscript%" set "cscript=cscript"

"%cscript%" /nologo /e:jscript "%~f0" "%sqlfile%" "/d:%_D%" "/e:%_E%" "/s:%_S%" "/debug:%_Debug%"

:: end normal runtime
set "exitcode=%ERRORLEVEL%"
if defined tmpfile del "%tmpfile%"
exit /b %exitcode%

:usage
setlocal enabledelayedexpansion
set "self=%~nx0"
call :heredoc usage >"%temp%\%~n0.txt" && goto end_usage
Usage: !self! [/D "?"] query
       !self! [/D "?"] [/E] file
       !self! [/S [path]]

    ... where query is a SQL query using SELECT, INSERT, UPDATE, DELETE,
        DESCRIBE, or TRUNCATE

    ... or file is a file containing a list of SQL queries (one query per line)

  Switches:
    /D "?"
        specifies the delimiter (default: comma)
        For tab delimited files, use /D "tab"

    /E file
        On caught error, continue executing subsequent lines in file
        Omitting the /E switch will cause the script to halt on error.

    /S [path]
        Generate Schema.ini for all text files in the specified directory
        (default: current)

  Examples:
    !self! SELECT column1 FROM test.csv WHERE column2="value" ORDER BY column1
    !self! INSERT INTO test.csv (h1, h2, h3) VALUES ("v1", "v2", "v3")
    !self! DELETE FROM test.csv WHERE col1="value"
    !self! UPDATE TOP 1 test.csv SET col2="value" WHERE col1="value"
    !self! DESCRIBE TABLE test.csv

  Notes:
    * Values are treated as strings.  Math operations (col+=int) won't work.
    * SELECT count(*) works, though.  So does UPDATE file SET col1=col2.
    * If the csv file does not exist, INSERT will attempt to create it.
    * The csv file MUST include a header row.
    * The SQL keywords are not case-sensitive.  Be lazy if you wish.
    * To avoid having to escape parentheses, you can enclose your statement in
      quotation marks.

    Example:
    !self! "INSERT INTO test.csv (h1, h2, h3) VALUES ('val1', 'val2', 'val3')"

    * If you need to refer to a column name containing spaces, enclose it in
      backticks.

    Example:
    !self! UPDATE test.csv SET `column 1`=`column 2` WHERE idx="5"

  Complex extra-credit example:
    !self! "INSERT INTO `new file.csv` SELECT a.col1 AS `column 1`, a.col2 AS 
    `column 2`, a.col3 AS `column 3`, b.`col1` AS `column 4` FROM test.csv AS a 
    LEFT JOIN `test 2.csv` AS b ON a.`col1`=b.`col1`"
:end_usage
2>NUL ( endlocal & more /e /t4 "%temp%\%~n0.txt" & del "%temp%\%~n0.txt" )
goto :EOF

:: http://stackoverflow.com/a/15032476/1683264
:heredoc <uniqueIDX>
setlocal enabledelayedexpansion
set go=
for /f "delims=" %%A in ('findstr /n "^" "%~f0"') do (
    set "line=%%A" && set "line=!line:*:=!"
    if defined go (if #!line:~1!==#!go::=! (goto :EOF) else echo(!line!)
    if "!line:~0,13!"=="call :heredoc" (
        for /f "tokens=3 delims=>^ " %%i in ("!line!") do (
            if #%%i==#%1 (
                for /f "tokens=2 delims=&" %%I in ("!line!") do (
                    for /f "tokens=2" %%x in ("%%I") do set "go=%%x"
                )
            )
        )
    )
)
goto :EOF

@end

// JScript portion

String.prototype.strip = function() {
   return this.replace(/^(['"`])(.*)\1$/,"$2");
}

String.prototype.csvQuotes = function() {
   return this.strip().replace(/"([^"]+)"/g, '""$1""');
}

String.prototype.sqlQuotes = function() {
   return this.strip().replace(/'/g, "''");
}

// Array.prototype.indexOf Polyfill from MDN
// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/indexOf
if (!Array.prototype.indexOf) {
   Array.prototype.indexOf = function(e, t) {
      var n;
      if (this == null) {
         throw new TypeError('"this" is null or not defined')
      }
      var r = Object(this);
      var i = r.length >>> 0;
      if (i === 0) return -1;
      var s = +t || 0;
      if (Math.abs(s) === Infinity) s = 0;
      if (s >= i) return -1;
      n = Math.max(s >= 0 ? s : i - Math.abs(s), 0);
      while (n < i) {
         if (n in r && r[n] === e) return n;
         n++
      }
      return -1
   }
}

Array.prototype.toLowerCase = function() {
   for (var i=0, arr = []; i<this.length; i++) {
      arr.push(this[i].toLowerCase());
   }
   return arr;
}

Array.prototype.moveDotsLeft = function() {
   for (var i=0; i<this.length; i++) {
      if (this[i] == '.' && i+1 < this.length) {
         this[--i] += this.splice(i+1,2).join('');
      }
   }
   return this;
}

function fatal(err) {
   if (!suppressErrors) {
      if (typeof err == 'string') WSH.StdErr.WriteLine(err);
      else for (var i in err)
         if (i != 'message') WSH.StdErr.WriteLine(i + ': ' + err[i]);
   }
   if (!errorResume) WSH.Quit(1);

   else exitCode += 1;
}

function fetch(what) {

   var attempts = arguments[1] || 0;

   if (!oConn.State)
      oConn.Open('Provider=Microsoft.Jet.OLEDB.4.0;Data Source="' + path
         + '";Extended Properties="text;HDR=YES;FMT=Delimited"');
   try {
      if (oRS.State) oRS.Close();
      oRS.Open(what, oConn, 3, 3, 1);
      if (debug) WSH.Echo(what);
      if (debug && oRS.State) WSH.Echo(oRS.RecordCount + ' records returned\n');
      return true;
   }
   catch(e) {
      if (e.number == -2147467259 && /exclusive/i.test(e.message)) {
         // exclusive lock error.  If 20 failed attempts, give up.
         if (++attempts > 19) {
            e.command = what;
            fatal(e);
         }

         // Otherwise, sleep a little and try again.
         WSH.Sleep(1);
         return fetch(what, attempts);
      }
      e.command = what; fatal(e);
      return false;
   }
}

function flushBuffer(proc) {
   while (!proc.StdOut.AtEndOfStream) WSH.Echo(proc.StdOut.ReadLine());
   while (!proc.StdErr.AtEndOfStream) WSH.StdErr.WriteLine(proc.StdErr.ReadLine());
}

function fixSchema() {
   var schema = fso.OpenTextFile(path + 'Schema.ini', 1),
      fixed = fso.CreateTextFile(path + 'Schema2.ini', true);
   while (!schema.AtEndOfStream) {
      fixed.WriteLine(schema.ReadLine().replace(/^\[__/,'['));
   }
   schema.Close();
   fixed.Close();
   var cmd = 'cmd /c move /y "'+path+'Schema2.ini" "'+path+'Schema.ini"',
      proc = oSH.Exec(cmd);
   while (!proc.Status) WSH.Sleep(1);
}

var oConn = WSH.CreateObject('adodb.connection'),
   oRS = WSH.CreateObject('adodb.recordset'),
   oSH = WSH.CreateObject('wscript.shell'),
   fso = WSH.CreateObject('scripting.filesystemobject'),
   exitCode = 0,
   skip = WSH.Arguments.Named('skip') || 0,
   processRoot = !skip,
   errorResume = (WSH.Arguments.Named('e') || 0) * 1,
   suppressErrors = 0,
   delim = WSH.Arguments.Named('d') || ',',
   debug = (WSH.Arguments.Named('debug') || 0) * 1;
   threads = [];

if (delim.toLowerCase() == 'tab') delim='\t';

if (WSH.Arguments.Unnamed(0) == 'query') {
   var path = WSH.Arguments(1);
   fetch(WSH.Arguments(2));
   WSH.Quit(0);
}
else if (WSH.Arguments.Unnamed(0) == 'debug') {
   var debug = path = WSH.Arguments(1);
   fetch(WSH.Arguments(2));
   WSH.Quit(0);
}

/*
Registry tweaks for greater compatibility

File extensions:
http://msdn.microsoft.com/en-us/library/ms974559.aspx
See the section "Working with Custom File Extensions".

Delimiters:
http://www.connectionstrings.com/textfile/
*/
function setDelim(delim) {
   var jet = "HKLM\\Software\\Microsoft\\Jet\\4.0\\Engines\\Text\\",
      ext = jet + "DisabledExtensions",
      del = jet + "Format",
      ch = delim == '\t' ? 'TabDelimited' : 'Delimited('+delim+')';

   try {
      oSH.RegWrite(ext,"","REG_SZ");
      if (delim == ',') {
         try { oSH.RegDelete(del); }
         catch(e) {}
      }
      else oSH.RegWrite(del,ch,"REG_SZ");
   }
   catch(e) {
      ext = ext.replace('HKLM','HKCU');
      del = del.replace('HKLM','HKCU');
      try {
         oSH.RegWrite(ext,"","REG_SZ");
         if (delim == ',') {
            try { oSH.RegDelete(del); }
            catch(e) {}
         }
         else oSH.RegWrite(del,ch,"REG_SZ");
      }
      catch(e) { fatal(e) }
   }
}

function resetDefaultDelim() {
   try { oSH.RegDelete(del); }
   catch(e) {
      try { oSH.RegDelete(del.replace('HKLM','HKCU')); }
      catch(e) {}
   }
}

if (processRoot) {
   setDelim(delim);
}

if (WSH.Arguments.Named('s') * 1) {
   var path = WSH.Arguments(0) + '\\',
      folder = fso.GetFolder(path),
      errorResume = suppressErrors = 1,
      total = folder.files.Count,
      col = new Enumerator(folder.files);
   if (!debug) WSH.StdOut.Write('Working...  0%');
   if (fso.FileExists(path + 'Schema.ini'))
      fso.DeleteFile(path + 'Schema.ini');
   for (var i=0; !col.atEnd(); col.moveNext(), i++) {
      var file = col.item().Name,
         size = col.item().Size,
         f = fso.OpenTextFile(path + file, 1),
         sample = f.Read(Math.min(1024, size));
      f.Close();
      if (sample.indexOf("\x00") == -1
         && !/^schema.+ini$/i.test(file)
         && size > 2
      ) {
         if (debug) WSH.Echo('adding ' + file);
         sample = sample.split(/\r?\n/)[0].replace(/".+?"/g,'');

         // if first line contains no commas, auto detect delimiter
         if (sample.indexOf(',') > -1) most = ',';
         else {
            var chars = {}, most = '';
            sample.replace(
               /[\s\x21\x23-\x26\x28-\x2D\/\x3A-\x40\x5B-\x60\x7B-\x7E]/g,
               function($1) { chars[$1] = (chars[$1] || 0) + 1; }
            );
            for (var x in chars) {
               if (!most || chars[x] > chars[most]) most = x;
            }
            if (debug) WSH.Echo('delimiter "' + most + '": ' + chars[most]);
         }
         setDelim(most);

         try {
            // force Jet driver to reacquire delimiter setting from registry
            if (oConn.State) oConn.Close();
            fetch('SELECT * INTO `__' + file + '` FROM `' + file + '` WHERE 0');
            if (oRS.State) oRS.Close();
         }
         catch(e) {}
         if (fso.FileExists(path + '__' + file))
            fso.DeleteFile(path + '__' + file);
      } else if (debug) WSH.Echo('skipping ' + file);
      if (!debug) {
         var pct = (' ' + Math.floor(100 * i / total) + '%').slice(-3);
         WSH.StdOut.Write("\x08\x08\x08"+pct);
      }
   }
   if (!debug) WSH.Echo("\x08\x08\x08100%");
   fixSchema();
   resetDefaultDelim();
   WSH.Quit(0);
}

var rawfile = fso.OpenTextFile(WSH.Arguments(0), 1);
for (var i=skip, raw=''; i && !rawfile.AtEndOfStream; i--) rawfile.SkipLine();
if (rawfile.AtEndOfStream) WSH.Quit(0);
var raw = rawfile.ReadLine();
rawfile.Close();
if (!/\w/.test(raw)) WSH.Quit(0);

while (1) {

   var raw = raw.replace(/\r?\n/g, '').strip(),
      argRxp = /(`.+?`|'.+?'|".+?"|[,=\.\(\)]|[^,=\.\(\) ]+)/g,
      args = raw.match(argRxp).moveDotsLeft(),
      lCaseArgs = args.toLowerCase();

   for (var i=file=path=0; i<args.length; i++) {

      if (/^\/d$/i.test(args[i])) {
         delim = args.splice(i,2)[1].strip();
         if (delim.toLowerCase() == 'tab') delim='\t';
         args = args.join(' ').strip().match(argRxp).moveDotsLeft();
         lCaseArgs = args.toLowerCase();
         i=-1;
      }

      if (/^\/debug$/i.test(args[i])) {
         var debug = 1;
         args.splice(i,1);
         args = args.join(' ').strip().match(argRxp).moveDotsLeft();
         lCaseArgs = args.toLowerCase();
         i=-1;
      }

      if (file && !path) {

         if (fso.FileExists(args[file].strip())) {
            path = fso.GetAbsolutePathName(args[file].strip() + '\\..') + '\\';
            args[file] = fso.GetFileName(args[file].strip());

         } else { // if file doesn't exist

            var filename = args[file].strip();
            if (lCaseArgs[0] == 'insert') { // allow insert to create the file
               var headers = [],
                  csvfile = fso.CreateTextFile(filename, true);

               if (args[++i] == '(') { // if insert defines the headers
                  while (args[++i] != ')') {
                     if (args[i] != ',') {
                        args[i] = args[i].strip();
                        headers.push('"' + args[i].csvQuotes() + '"');
                     }
                  }
                  csvfile.WriteLine(headers.join(delim));
               }
               // else if insert...select
               else if (lCaseArgs.indexOf('select') > -1) {

                  var select = lCaseArgs.indexOf('select') + 1,
                     from = lCaseArgs.indexOf('from'),
                     lSelectFrom = lCaseArgs.slice(select, from);

                  args[from+1] = '`' + args[from+1].strip() + '`';

                  // if select col as alias, write alias
                  if (lSelectFrom.indexOf('as') > -1) {
                     var selectFrom = args.slice(select, from),
                        headers = [];

                     for (var i=0; i<selectFrom.length; i++) {

                        if (lSelectFrom[++i] == 'as')
                           headers.push(selectFrom[++i].strip());

                        else if (selectFrom[--i] != ',') {
                           headers.push(selectFrom[i].strip());
                        }
                     }

                     csvfile.WriteLine('"' + headers.join('"'+delim+'"') + '"');

                  // otherwise, just copy the header row from queried file
                  } else {
                     var othercsv = args[lCaseArgs.indexOf('from') + 1],
                        otherfile = fso.OpenTextFile(othercsv, 1);
                     csvfile.WriteLine(otherfile.ReadLine());
                     otherfile.Close();
                  }
               }
               csvfile.Close();
               path = fso.GetAbsolutePathName(filename + '\\..') + '\\';
               args[file] = fso.GetFileName(filename);

            }
         }

      } else if (!path && /^(from|into|update|table)$/i.test(args[i])) {
         if (lCaseArgs[i+2] != 'from') {
            file=i+1;
            if (lCaseArgs[file] == 'top') {
               i += 2;
               file=i+1;
            }
         }
      }

      // join [var, =, value] into [var=value]
      if (args[i] == '=') args[i-1] += args.splice(i--,2).join('');
   }

   if (!path) {
      fatal({
         name: 'Error',
         description: 'Unsupported syntax.',
         command: args.join(' ')
      });
      continue;
   }

   args[file] = '`' + args[file].strip() + '`';

   if (debug) WSH.Echo(': ' + args.join('\n: '));

   if (lCaseArgs.length != args.length) lCaseArgs = args.toLowerCase();

   switch (lCaseArgs[0]) {
      case 'insert':
      case 'select':

         var command = args.join(' ');

         if (!fetch(command)) break;

         while (oRS.State && args[0].toLowerCase() == 'select' && !oRS.eof) {
            for (var i=0; i<oRS.Fields.Count; i++) {
               var val = oRS.Fields(i).Value;
               if (typeof val === 'object' && val == null) val = '';
               WSH.Echo(oRS.Fields(i).Name + '=' + val);
            }
            oRS.MoveNext();
         }

      break;

      case 'describe':

         function readSchema(file) {
            var schema = fso.OpenTextFile(path + 'Schema.ini', 1);
            for (var found = ret = 0; !schema.AtEndOfStream;) {
               var line = schema.ReadLine().replace(/\r?\n/,'');
               if (line.toLowerCase() == '[' + file + ']') found=ret=1;
               else if (/^\[.*\]$/.test(line)) found=0;
               if (found) WSH.Echo(line);
            }
            schema.Close();
            return ret;
         }

         var leaveSchema = fso.FileExists(path + 'Schema.ini');

         if (leaveSchema && readSchema(lCaseArgs[file].strip())) break;

         var command = 'SELECT * INTO `__' + args[file].strip() + '` FROM '
            + args[file] + ' WHERE 0';

         if (!fetch(command)) break;
         if (oRS.State) oRS.Close();
         fso.DeleteFile(path + '__'+args[file].strip());

         fixSchema();
         readSchema(lCaseArgs[file].strip());

         if (!leaveSchema) fso.DeleteFile(path + 'Schema.ini');

      break;

      /* The MS Jet OLEDB text driver does not natively support UPDATE or
      DELETE statements.  Work around this by copying unaffected rows to a
      new file, appending modified rows, and replacing the original csv. */
      case 'update':
      case 'delete':
      case 'truncate':   // *shrug* Why not?

         var where = lCaseArgs.indexOf('where'),
            set = lCaseArgs.indexOf('set'),
            top = lCaseArgs.indexOf('top') + 1,
            whereNot = (where > -1) ? args.slice(where+1) : [],
            update = 0;

         // copy header row to new file
         var othercsv = '_' + args[file].strip(),
            csvfile = fso.OpenTextFile(args[file].strip(), 1),
            otherfile = fso.CreateTextFile(othercsv, true);

         otherfile.WriteLine(csvfile.ReadLine());
         otherfile.Close();
         csvfile.Close();

         if (args[0].toLowerCase() == 'update') {
            update = 1;

            // convert "set var1=val1, var2=val2" to JS object
            var setArgs = (where > set) ?
                  args.slice(set + 1, where) :
                  args.slice(set + 1),
               set = {};

            for (var i=0; i<setArgs.length; i++) {
               if (setArgs[i].indexOf('=') > 0) {
                  var varval=setArgs[i].split('=');
                  set[varval[0].strip()] = varval[1].replace(/^`(.+)`$/,"$1");
               }
            }
         }

         if (whereNot.length) {

            for (var i=0; i<whereNot.length; i++) {
               if (whereNot[i].indexOf('=') > 0) {
                  var varval = whereNot[i].split('=');
                  whereNot[i] = '`' + varval[0].strip() + '`=' + varval[1];
               }
            }

            var command = 'INSERT INTO `_' + args[file].strip()
               + '` SELECT * FROM ' + args[file]
               + ' WHERE NOT ' + whereNot.join(' '),
               cscript = oSH.Environment('Process')('cscript'),
               cmd = 'cmd /c ' + cscript + ' /nologo /e:JScript "' + WSH.ScriptFullName
                  + (debug ? '" debug "' : '" query "') + path + '" "' + command.replace(/"/g,"'") + '"';

            if (debug) WSH.Echo('\nforking new thread for query:\n' + cmd + '\n');
            threads.push(oSH.Exec(cmd));

            if (update) {
               var command = 'SELECT * FROM ' + args[file] + ' WHERE '
                  + whereNot.join(' ');

               if (!fetch(command)) break;
            }

         } else if (update) {
            var command = 'SELECT * FROM ' + args[file];

            if (!fetch(command)) break;
         }

         if (update) {

            topN = top ? args[top] * 1 : 0;

            var insert = [], r = 0;
            while (!oRS.eof) {
               var line = [];
               for (var i=0; i<oRS.Fields.Count; i++) {
                  if (!topN || r < topN) {
                     var val = set[oRS.Fields(i).Name] || oRS.Fields(i).Value;
                     if (isNaN(val)) {
                        try { val = oRS.Fields(val); }
                        catch(e) {}
                     }
                  }
                  else var val = oRS.Fields(i).Value;
                  line.push(typeof val === 'object' && val == null ?
                     "''" : "'" + (''+val).sqlQuotes() + "'")
               }
               insert.push(line.join(','));
               oRS.MoveNext();
               r++;
            }
            if (oRS.State) oRS.Close();

            for (var i=0; i<insert.length; i++) {
               var command = 'INSERT INTO `_' + args[file].strip() + '` VALUES ('
                  + insert[i] + ')';

               if (!fetch(command)) break;
               if (oRS.State) oRS.Close();
            }
            i = Math.min(i, topN || i);
            WSH.Echo(i + (i==1 ? ' row' : ' rows') + ' affected' + (debug ? '\n' : ''));
         }

         while (threads.length) {
            if (!threads[0].Status) WSH.Sleep(1);
            else {
               flushBuffer(threads[0]);
               threads.splice(0,1);
            }
         }

         if (debug) WSH.Echo('Updated csv file: _'+args[file].strip());

         else {
            // replace old csv file
            try {
               fso.CopyFile(path + '_' + args[file].strip(), path + args[file].strip(), true);
               fso.DeleteFile(path + '_' + args[file].strip(), true);
            }
            catch(e) {
               // in case of pointless "Permission Denied" failures
               var cmd = 'cmd /c move /y "'+path+'_'+args[file].strip()+'" "'+path+args[file].strip()+'"',
                  proc = oSH.Exec(cmd);
               while (!proc.Status) WSH.Sleep(1);
            }
         }

      break;
   }   // end switch(lCaseArgs[0])

   break;
}   // end while (1)

if (oRS.State) oRS.Close();
if (oConn.State) oConn.Close();

if ((errorResume || !exitCode) && processRoot) {

   var sqlScript = fso.OpenTextFile(WSH.Arguments(0), 1);
   for (var i=0; !sqlScript.AtEndOfStream; i++) {
      sqlScript.SkipLine();
   }
   sqlScript.Close();

   for (var j=1; j<=i; j++) {
      cscript = oSH.Environment('Process')('cscript');
      var cmd = 'cmd /c ' + cscript + ' /nologo /e:JScript "' + WSH.ScriptFullName + '" "'
         + WSH.Arguments(0) + '" "/d:' + delim + '" "/e:' + (WSH.Arguments.Named('e') || 0)
         + '" "/debug:' + (WSH.Arguments.Named('debug') || 0) + '" "/skip:' + j + '"';

      if (debug) WSH.Echo('\nspawning new thread for next line:\n' + cmd + '\n');
      var proc = oSH.Exec(cmd);

      while (!proc.Status) {
         WSH.Sleep(1);
         flushBuffer(proc);
      }
      flushBuffer(proc);

      exitCode += proc.ExitCode;

      if (!errorResume && exitCode) break;
   }
}

if (processRoot) {
   try { oSH.RegDelete(del); }
   catch(e) {
      try { oSH.RegDelete(del.replace('HKLM','HKCU')); }
      catch(e) {}
   }
}

WSH.Quit(exitCode);