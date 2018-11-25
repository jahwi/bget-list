@if (@CodeSection == @Batch) @then

:: The first line above is...
:: - in Batch: a valid IF command that does nothing.
:: - in JScript: a conditional compilation IF statement that is false,
::               so this Batch section is omitted until next "at-sign end".


@echo off

::::BgetDescription#Advanced command to find and replace strings.
::::BgetAuthor#Antonio Perez Ayala
::::BgetCategory#library

rem FindRepl.bat: Utility to search and search/replace strings in a file
rem http://www.dostips.com/forum/viewtopic.php?f=3&t=4697
rem Antonio Perez Ayala 

rem   - Jun/26/2013: first version.
rem   - Jul/02/2013: use /Q in submatched substrings, use /VR for /V in Replace, eliminate "\r\n" in blocks.
rem   - Jul/07/2013: change /VR by /R, search for "\r\n" with /$ and no /V, /N nor blocks.

rem   - Nov/20/2014: Version 2   - New switches: /J, /L, /G, /ARG#, and || separate regexp's in /Alternations.
rem   - Nov/30/2014: Version 2.1 - Changed /ARG# by /VAR. Replacements on numbered-blocks of lines.
rem                                New sets of predefined functions for Date, File, Folder and Drive management.
rem   - Dic/15/2014: Version 2.2 - New "data generating " predefined functions for /S switch combined with /J

if "%~1" equ "/?" goto showUsage
if /I "%~1" equ "/help" goto showHelp

CScript //nologo //E:JScript "%~F0" %*
if %errorlevel% equ -1 goto showUsage
exit /B %errorlevel%

<usage>
Searches for strings in Stdin file, and prints or replaces them.

FINDREPL [/I] [/V] [/N] [rSearch] [/E:rEndBlk] [/O:s:e] [/B:rBlock] [/$:1:2...]
         [[/R] [/A] sReplace] [/Q:c] [/S:sSource]
         [/J[:n] [/L:jLast]] [/G:file] [/VAR:name=value,...]

  /I         Specifies that the search is not to be case-sensitive.
  /V         Prints only lines that do not contain a match.
  /N         Prints the line number before each line that matches.
  rSearch    Text to be searched for. Also mark the Start of a block of lines.
  /E:rEndBlk Text to be searched for that mark the End of a block of lines.
  /O:s:e     Specifies signed numbers to add to Start/End lines of blocks.
  /B:rBlock  Extra text to be searched for in the blocks of lines.
  /$:1:2...  Specifies to print saved submatched substrings instead of lines.
  sReplace   Text that will replace the matched text.
  /R         Prints only replaced lines.
  /A         Specifies that sReplace has alternative values matching rSearch.
  /Q:c       Specifies a character that is used in place of quotation marks.
  /S:sSource Text to be processed instead of Stdin file.
  /J[:n]     Specifies that sReplace/sSource texts have JScript expressions.
  /L:jLast   Execute jLast as a JScript expression after the last line of file.
  /G:file    Specifies the file to get rSearch and sReplace texts from.
  /VAR:n=v,..Specifies a series of JScript "name=value" var's to initialize.

The /Q:c switch allows to use the given character in the search/replacement
texts in the places where quotes are needed, and replace them later.

If the first character of any text is an equal-sign, it specifies the name of
a Batch variable that contain the text to be processed.

The /J switch specifies that sReplace/sSource texts contain JScript expressions
that are evaluated in order to provide the actual replacement and source texts.

All search texts must be given in VBScript regular expression format (regexp).
Matching characters: .=any char, \d=[0-9], \D=non-digit, \w=[A-Za-z0-9_],
\W=non-alphanumeric, \s=[ \t\r\n], \S=non-space. Anchors: ^=begin of line,
$=end of line, \b=begin/end of word. Quantifiers (repeats previous match):
*=zero or more times, +=one or more times, ?=zero or one time. Use parentheses
to delimit these constructs and create "subexpressions". To search for these
special characters, place a back-slash before each one of them: \*+?^$.[]{}()|

The /A (alternation) switch allows to define several alternatives separated by
pipe in rSearch/sReplace: "a|b|c" /A "x|y|z" replace a with x, b with y, etc.;
in this case the alternatives can only be case-sensitive literal strings. If /J
switch is added, the alternatives in rSearch are always regular expressions and
in sReplace are JScript expressions, and they must be separated by double
pipes: "red|green|blue||Peter|Paul|Mary" /A "'a color'||'a name'" /J


The operation performed and the output displayed varies depending on the mix
of parameters and switches given, that can be divided in three general cases.

FINDREPL  [/V] [rSearch] [/E:rEndBlk] [/O:s:e] [/B:rBlock]  [[/R] sReplace] 


A) Find-only operation: when sReplace parameter is not given.

rSearch                            Show matching lines.
rSearch /V                         Show non-matching lines.
rSearch /O:s:e                     Add S and E to each matching line (block).
rSearch /E:rEndBlk                 From rSearch line(s) to rEndBlk line(s).
rSearch /E:rEndBlk /O:s:e          Add S to rSearch line and E to rEndBlk line.
                                   The last three cases define a "block".
rSearch block /B:rBlock            Search rBlock in the previous block.

When rSearch/rEndBlk includes subexpressions, the /$ switch may be added in
order to print only saved submatched substrings instead of complete lines.


B) Find-Replace operation: when sReplace parameter is added to previous ones.

rSearch sReplace                   Show all file lines after replacements.
rSearch sReplace /R                Show only replaced lines.
rSearch block sReplace             Replaces text in blocks only.
rSearch block /B:rBlock sReplace   Replaces only text matched by rBlock.

When rSearch/rBlock includes subexpressions, the replacement text may
include $0, $1, ... in order to retrieve saved submatched substrings.


C) Numbered-block operation: when rSearch parameter is null (requires /O).

/O:s:e                             Show block of lines, from line S to line E.
/O:s:e /B:rBlock                   Search rBlock in the previous block.
"" /O:s:e /B:rBlock sReplace       Replaces only text matched by rBlock.

In this case if S or E is negative, it specifies counting lines from the end of
file. If E is not given, it defaults to the last line of the file (same as -1).


The total number of matchings/replacements is returned in ERRORLEVEL.


</usage>

:showUsage
< "%~F0" CScript //nologo //E:JScript "%~F0" "^<usage>" /E:"^</usage>" /O:+1:-1
echo -^> For further help, type: %0 /help
goto :EOF

<help>

A web site may be opened in order to get further help on the following topics:

   1- FindRepl.bat documentation:
         Detailed description of FindRepl features with multiple examples.

   2- FindRepl.bat version 2 documentation:
         Additional descriptions on /J, /L, /G switches and || alternatives.

   3- Regular Expressions documentation:
         Describe the features that may be used in rSearch, rEndBlk and rBlock.

   4- Alternation and Subexpressions documentation:
         Describe how use | to separate values in rSearch with /A switch
         and features of subexpressions for /$ switch and $0..$n in sReplace.

   5- JScript expressions documentation (/J switch):
         Describe the operators that may be used in JScript expressions.

   6- Data types and functions for JScript expressions.
         Describe additional operations available in JScript:
         - String Object: functions to manipulate strings.
         - Math Object: arithmetic functions.
         - Date Object: functions for date calculations.
         See also Topic 2- Section 3. on predefined functions.

   7- FileSystemObject objects documentation:
         Describe the properties that may be used in Property functions
         and the rest of File/Folder/Drive predefined functions.

   8- Special folders documentation:
         Describe the values used in specialFolders predefined function.

   9- Windows Management Instrumentation FAQ:
         General description about the features and capabilities (classes and
         properties) that may be used in wmiCollection predefined function.

</help>

:showHelp
setlocal EnableDelayedExpansion
set n=1
set "choices="
for %%a in ("http://www.dostips.com/forum/viewtopic.php\Qf=3&t=4697"
            "http://www.dostips.com/forum/viewtopic.php\Qf=3&t=4697&p=38121#p38121"
            "http://msdn.microsoft.com/en-us/library/6wzad2b2(v=vs.84).aspx"
            "http://msdn.microsoft.com/en-us/library/kstkz771(v=vs.84).aspx"
            "http://msdn.microsoft.com/en-us/library/ce57k8d5(v=vs.84).aspx"
            "http://msdn.microsoft.com/en-us/library/htbw4ywd(v=vs.84).aspx"
            "http://msdn.microsoft.com/en-us/library/bkx696eh(v=vs.84).aspx"
            "http://msdn.microsoft.com/en-us/library/0ea7b5xe(v=vs.84).aspx"
            "http://technet.microsoft.com/en-us/library/ee692772.aspx"
           ) do (
   set "choices=!choices!!n!"
   set "option[!n!]=%%~a"
   set /A n+=1
)
< "%~F0" CScript //nologo //E:JScript "%~F0" "^<help>" /E:"^</help>" /O:+1:-1

:getOption
echo/
choice /C %choices%0 /N /M "Select one of previous topics, or press 0 to end:"
if errorlevel %n% goto :EOF
set "choice=%errorlevel%"
explorer "!option[%choice%]:\Q=?!"
echo  - Help on topic %choice% started...
goto getOption


End of Batch section


@end


// JScript section


// FINDREPL [/I] [/V] [/N] rSearch [/E:rEndBlk] [/O:s:e] [/B:rBlock] [/$:1:2...]
//          [[/R] [/A] sReplace] [/Q:c] [/S:source]
//          [/J[:n] [/L:jEnd]] [/G:file]

var options = WScript.Arguments.Named,
    args    = WScript.Arguments.Unnamed,
    env     = WScript.CreateObject("WScript.Shell").Environment("Process"),
    fso     = new ActiveXObject("Scripting.FileSystemObject"), file,

    ignoreCase   = options.Exists("I")?"i":"",
    notMatched   = options.Exists("V"),
    showNumber   = options.Exists("N"),
    search       = "",
    endBlk       = undefined,
    offset       = undefined,
    block        = undefined,
    submatches   = undefined,
    justReplaced = options.Exists("R"),
    alternation  = options.Exists("A"),
    replace      = undefined,
    quote        = options.Item("Q"),
    inputLines,
    Jexpr        = options.Exists("J"),

    lineNumber = 0, range = new Array(),
    procLines = false, procBlocks = false,
    nextMatch, result  = 0,

    match = function ( line, regex ) { return line.search(regex) >= 0; },

    parseInts = 
       function ( strs ) { 
          var Ints = new Array();
          for ( var i = 0; i < strs.length; ++i ) {
             Ints[i] = parseInt(strs[i]); 
          }
          return Ints;
       },

    getRegExp =
       function ( param, justLoad ) {
          var result = param;
          if ( result.substr(0,1) == "=" ) result = env(result.substr(1));
          if ( quote != undefined ) result = result.replace(eval("/"+quote+"/g"),"\\x22");
          if ( ! justLoad ) result = new RegExp(result,"gm"+ignoreCase);
          return result;
       }
    ; // end var


// PREDEFINED VARIABLES AND FUNCTIONS

if ( Jexpr) {
   JexprN = options.Item("J") ? parseInt(options.Item("J")) : 10;
   var SUM = new Array(JexprN+1), N = new Array(JexprN+1), PROD = new Array(JexprN+1),
       MAX = new Array(JexprN+1), MIN = new Array(JexprN+1), n = 0;
   for ( var i = 1; i <= JexprN; i++ ) {
      SUM[i] = 0; N[i] = 0; PROD[i] = 1;
      MAX[i] = Number.NEGATIVE_INFINITY; MIN[i] = Number.POSITIVE_INFINITY;
   }
}

// Range functions

function choose(arg,i){return(arg[i]);}
function hlookup(arg,lim,a,b) {
   var ind=a;
   for ( var i=a; i<=b; i++ ) if ( arg[i]>arg[ind] && arg[i]<=lim ) ind=i;
   return(ind);
}
function sum(arg,a,b) {
   var val = 0, n = 0, v;
   for ( var i=a; i<=b; i++ ) {
      if ( ! isNaN(v=parseFloat(arg[i])) ) { val+=v; SUM[i]+=v; N[i]++; n++; }
   }
   return(val);
}
function prod(arg,a,b) {
   var val = 1, n = 0, v;
   for ( var i=a; i<=b; i++ ) {
      if ( ! isNaN(v=parseFloat(arg[i])) ) { val*=v; PROD[i]*=v; n++; }
   }
   return(val);
}
function max(arg,a,b) { 
   var val=Number.NEGATIVE_INFINITY, v;
   for ( var i=a; i<=b; i++ ) {
      if ( ! isNaN(v=parseFloat(arg[i])) ) {
         if ( v>val ) val=v;
         if ( v>MAX[i] ) MAX[i]=v;
      }
   }
   return(val);
}
function min(arg,a,b) {
   var val=Number.POSITIVE_INFINITY, v;
   for ( var i=a; i<=b; i++ ) {
      if ( ! isNaN(v=parseFloat(arg[i])) ) {
         if ( v<val ) val=v;
         if ( v<MIN[i] ) MIN[i]=v;
      }
   }
   return(val);
}

// Date functions

file = fso.CreateTextFile("FindRepl.tmp", true);
file.WriteLine( (new Date("12/31/2000")).getVarDate() );  // give proper credit, please...
file.Close();
file = fso.OpenTextFile("FindRepl.tmp", 1);
var date1st = file.Read(2);
file.Close();
file = fso.GetFile("FindRepl.tmp");
file.Delete();

function toDate(s) {  // Convert a string or a number (of milliseconds) to Date
   try {
      var d = s.split("/");
      if ( date1st == "31" ) { var aux = d[0]; d[0] = d[1]; d[1] = aux; }  // DD/MM/YYYY
      if ( date1st == "20" ) { aux = d[0]; d[0] = d[1]; d[1] = d[2]; d[2] = aux; }  // YYYY/MM/DD
      d = new Date(d[0]+"/"+d[1]+"/"+d[2]);
   } catch(e) {
      var d = new Date();
      d.setTime(s);
   }
   return(d);
}
function showDate(d,fmt) {  // Show a Date or a number (of milliseconds) with Date formats
   var d2 = d, s = "Unknown date format";
   if ( ! Date.prototype.isPrototypeOf(d2) ) d2 = toDate(d2);
   if ( fmt == 0 || fmt == undefined ) {
      s = d2.toDateString().split(" ");
      s = s[1]+"/"+s[2]+"/"+s[3];
   } else if ( fmt == 1 ) {
      s = d2.toDateString();
   } else if ( fmt == 2 ) {
      s = d2.toString();
   } else if ( fmt == 3 ) {
      s = d2.toString().split(" ");
      s = s[3];
   } else if ( fmt == 4 ) {
      s = d2.toLocaleString().split(" ");
      s = s[s.length-3]+" "+s[s.length-2]+" "+s[s.length-1];
   } else if ( fmt == 5 || fmt == 6 ) {
      d2.setTime(d2.getTime()+d2.getTimezoneOffset()*60000);
      s = d2.toString().split(" ");
      s = s[3]+((fmt==6)?"."+d2.getTime().toString().slice(-3):"");
   } else if ( fmt == 11 ) {
      s = d2.toLocaleDateString();
   } else if ( fmt == 12 ) {
      s = d2.toLocaleString();
   } else {
      var D = (100+d2.getDate()).toString().substr(1), 
          M = (101+d2.getMonth()).toString().substr(1),
          Y = d2.getFullYear();
      if ( fmt == 7 ) {
         s = D+"-"+M+"-"+Y;
      } else if ( fmt == 8 ) {
         s = Y+"-"+M+"-"+D;
      } else {
         var t = (d2.toString().split(" "))[3].split(":");
         if ( fmt == 9 ) {
            s = Y+"-"+M+"-"+D+"@"+t.join(".");
         } else if ( fmt == 10 ) {
            s = Y+M+D+t.join("");
         }
      }
   }
   return(s);
}

var millisecsPerDay = 1000 * 60 * 60 * 24,
    startTime = new Date(),
    daysNow = Math.floor(startTime.getTime()/millisecsPerDay);
function dateDiff(d1,d2) {
   return( Math.floor((Date.prototype.isPrototypeOf(d1)?d1.getTime():d1)/millisecsPerDay) - 
           Math.floor((Date.prototype.isPrototypeOf(d2)?d2.getTime():d2)/millisecsPerDay) );
}
function days(d){return( daysNow - Math.floor((Date.prototype.isPrototypeOf(d)?d.getTime():d)/millisecsPerDay) );}
function dateAdd(d,n) {
   var newD = new Date();
   newD.setTime( (Date.prototype.isPrototypeOf(d)?d.getTime():d) + n*millisecsPerDay );
   return(newD);
}

// File, Folder and Drive functions

function fileExist(name) {
   return(fso.FileExists(name));
}

// === Start of new section added in FindRepl V2.2
function fileCopy(name,destination) {
   fso.CopyFile(name,destination);
   return('File(s) "'+name+'" copied');
}
function fileMove(name,destination) {
   fso.MoveFile(name,destination);
   return('File(s) "'+name+'" moved');
}
function fileDelete(name) {
   fso.DeleteFile(name);
   return('File(s) "'+name+'" deleted');
}

var A = "Attributes", TC = "DateCreated", TA = "DateLastAccessed", TW = "DateLastModified",
    D = "Drive", NX = "Name", N = "NameOnly", P = "ParentFolder", F = "Path", SN = "ShortName",
    SF = "ShortPath", Z = "Size", X = "Extension", T = "Type";
function fileProperty(fileName,property) {
   var p,x;
   if ( property == "Extension" ) {
      p = fso.GetExtensionName(fileName);
   } else if ( property == "NameOnly" ) {
      p = fso.GetFile(fileName).Name;
      if ( x=fso.GetExtensionName(fileName) ) p = p.slice(0,-(x.length+1));
   } else {
      p = eval("fso.GetFile(fileName)."+property);
   }
   return(p);
}

function folderExist(name) {
   return(fso.FolderExists(name));
}

function fileRename(fileName,newName) {
   var file = fso.GetFile(fileName);
   if ( fileName.toUpperCase() == newName.toUpperCase() ) file.Name = "_  .  _";
   file.Name = newName;
   return('File "'+fileName+'" renamed to "'+newName+'"');
}
function folderRename(folderName,newName) {
   var folder = fso.GetFolder(fileName);
   if ( folderName.toUpperCase() == newName.toUpperCase() ) folder.Name = "_  .  _";
   folder.Name = newName;
   return('Folder "'+folderName+'" renamed to "'+newName+'"');
}

function Copy(name,destination) {
   fso.GetFile(name).Copy(destination);
   return('File/Folder "'+name+'" copied');
}
function Move(name,destination) {
   fso.GetFile(name).Move(destination);
   return('File/Folder "'+name+'" moved');
}
function Delete(name) {
   fso.GetFile(name).Delete();
   return('File/Folder "'+name+'" deleted');
}

function folderCopy(name,destination) {
   fso.CopyFolder(name,destination);
   return('Folder(s) "'+name+'" copied');
}
function folderMove(name,destination) {
   fso.MoveFolder(name,destination);
   return('Folder(s) "'+name+'" moved');
}
function folderDelete(name) {
   fso.DeleteFolder(name);
   return('Folder(s) "'+name+'" deleted');
}

function driveProperty(drivePath,property) {
   return( eval("fso.GetDrive(fso.GetDriveName(drivePath))."+property) );
}

function folderProperty(folderName,property) {
   var p,x;
   if ( property == "Extension" ) {
      p = fso.GetExtensionName(folderName);
   } else if ( property == "NameOnly" ) {
      p = fso.GetFolder(folderName).Name;
      if ( x=fso.GetExtensionName(fileName) ) p = p.slice(0,-(x.length+1));
   } else {
      p = eval("fso.GetFolder(folderName)."+property);
   }
   return(p);
}

// Data generating functions

function drivesCollection ( propList ) {
   var e = new Enumerator(fso.Drives), drives = "";
   if ( arguments.length ) {
      for ( ; !e.atEnd(); e.moveNext() ) {
         var drive = e.item();
         for ( var i = 0; i < arguments.length; i++ ) {
            var a = arguments[i];
            drives += (i?",":"")+'"'+(((a=="DriveLetter"||a=="DriveType"||a=="Path")||drive.IsReady)?
                                      eval("drive."+arguments[i]):"Not ready")+'"';
         }
         drives += "\r\n";
      }
   } else {
      for ( ; !e.atEnd(); e.moveNext() ) {
         drives += '"'+e.item().Path+'"\r\n';
      }
   }
   return(drives);
}

function filesCollection ( pathOrCol, propList ) {
   var files = "", fc;
   if ( arguments.length ) {
      try {  // if ( pathOrCol is path ) {
         fc = fso.GetFolder(pathOrCol).Files;
      } catch (e) {  // } else {  // pathOrCol is filesCol
         fc = pathOrCol;
      }
      for ( fc = new Enumerator(fc); !fc.atEnd(); fc.moveNext() ) {
         var file = fc.item();
         for ( var i = 1; i < arguments.length; i++ ) {
            files += (i>1?",":"")+'"'+eval("file."+arguments[i])+'"';
         }
         files += "\r\n";
      }
   } else {
      for ( fc = new Enumerator(fso.GetFolder(".").Files); !fc.atEnd(); fc.moveNext() ) {
         files += '"'+fc.item().Name+'"\r\n';
      }
   }
   return(files);
}

function foldersCollection ( pathOrCol, propList ) {
   var folders = "", fc;
   if ( arguments.length ) {
      try {  // if ( pathOrCol is path ) {
         fc = fso.GetFolder(pathOrCol).SubFolders;
      } catch (e) {  // } else {  // pathOrCol is foldersCol
         fc = pathOrCol;
      }
      for ( fc = new Enumerator(fc); !fc.atEnd(); fc.moveNext() ) {
         var folder = fc.item();
         for ( var i = 1; i < arguments.length; i++ ) {
            if ( arguments[i].indexOf(".SubFolders") >= 0 ) {
               if ( folder.SubFolders && eval(arguments[i]) ) {
                  arguments[0] = folder.SubFolders;
                  folders += (folders.slice(-2)!="\r\n"?"\r\n":"") + foldersCollection.apply(undefined,arguments);
                  if ( i+1 < arguments.length ) eval(arguments[i+1]);
               }
               i = arguments.length;
            } else if ( arguments[i].indexOf(".Files") >= 0 ) {
               folders += (folders.slice(-2)!="\r\n"?"\r\n":"") + eval(arguments[i]);
            } else {
               folders += (i>1?",":"")+'"'+eval("folder."+arguments[i])+'"';
            }
         }
         if ( folders.slice(-2) != "\r\n" ) folders += "\r\n";
      }
   } else {
      for ( fc = new Enumerator(fso.GetFolder(".").SubFolders); !fc.atEnd(); fc.moveNext() ) {
         folders += '"'+fc.item().Name+'"\r\n';
      }
   }
   return(folders);
}

function specialFolders ( specialFolder, propList ) {
   var WshShell = WScript.CreateObject("WScript.Shell"), special = "", fc;
   if ( arguments.length ) {
      var fc = specialFolder.split("."), folder = WshShell.SpecialFolders(fc[0]);
      for ( fc = new Enumerator(eval("fso.GetFolder(folder)."+fc[1])); !fc.atEnd(); fc.moveNext() ) {
         var s = fc.item();
         for ( var i = 1; i < arguments.length; i++ ) {
            special += (i>1?",":"")+'"'+eval("s."+arguments[i])+'"';
         }
         special += "\r\n";
      }
   } else {
      for ( fc = new Enumerator(WshShell.SpecialFolders); !fc.atEnd(); fc.moveNext() ) {
         special += fc.item()+"\r\n";
      }
   }
   return(special);
}

function wmiCollection ( className, propList ) {
   // http://msdn.microsoft.com/en-us/library/aa393741(v=vs.85).aspx
   var wmi = "", colItems;
   if ( arguments.length > 1 ) {
      // http://msdn.microsoft.com/en-us/library/windows/desktop/aa394606(v=vs.85).aspx
      colItems = GetObject("WinMgmts:").ExecQuery("Select * from " + className);
      for ( var e = new Enumerator(colItems); ! e.atEnd(); e.moveNext() ) {
         var s = e.item();
         for ( var i = 1; i < arguments.length; i++ ) {
            wmi += (i>1?",":"")+'"'+eval("s."+arguments[i])+'"';
         }
         wmi += "\r\n";
      }
   } else if ( arguments.length == 1 ) {
      // Method suggested by: http://msdn.microsoft.com/en-us/library/aa392315(v=vs.85).aspx
      //                      https://gallery.technet.microsoft.com/f0666124-3b67-4254-8ff1-3b75ae15776d
      colItems = GetObject("WinMgmts:").Get(className).Properties_;
      for ( var e = new Enumerator(colItems); ! e.atEnd(); e.moveNext() ) {
         wmi += e.item().Name+"\r\n";
      }
   } else {
      // https://gallery.technet.microsoft.com/scriptcenter/5649568b-074e-4f5d-be52-e8b7d8fe4517
      colItems = GetObject("WinMgmts:");  // imply ("WinMgmts:\root\cimv2")
      for ( var e = new Enumerator(colItems.SubclassesOf()); ! e.atEnd(); e.moveNext() ) {
         wmi += e.item().Path_.Class+"\r\n";
      }
   }
   return(wmi);
}

// === End of new section added in FindRepl V2.2
// Other functions

function prompt(s){WScript.Stderr.Write(s); return(keyb.ReadLine());}
function FOR($,init,test,inc,body) {
   var For=""; 
   for ( eval(init); eval(test); eval(inc) ) For+=eval(body);
   return(For);
}
var arguments="";


// PROCESS PARAMETERS

if ( file=options.Item("G") ) {
   file = fso.OpenTextFile(file, 1);
   search = "";
   if ( alternation ) replace = "";
   var sepIn = Jexpr?/(\\\\|\\\||[^\|]|[^\|][^\|])+/g:/(\\\\|\\\||[^\|])+/g, sepOut = "";
   while ( ! file.AtEndOfStream ) {
      if ( block=file.ReadLine() ) {
         if ( block.substr(0,4) == "var " && Jexpr ) {
            eval ( block );
         } else if ( block.substr(0,2) != "//" ) {
            if ( block.slice(0,1)+block.slice(-1) == '""' ) block = block.slice(1,-1);
            block = block.match(sepIn);
            search += sepOut+block[0];
            if ( alternation ) replace += sepOut+(block[1]?block[1]:"");
            sepOut = Jexpr?"||":"|";
         }
      }
   }
   file.Close();
   if ( quote != undefined ) search = search.replace(eval("/"+quote+"/g"),"\\x22");
} else {  // No option /G given
   if ( args.length > 0 ) {
      search = getRegExp(args.Item(0),true);
   }
   if ( args.length > 1 ) {
      replace = args.Item(1);
      if ( replace.substr(0,1) == "=" ) replace = env(replace.substr(1));
   }
}
if ( replace ) {
   if ( quote != undefined ) replace = replace.replace(eval("/"+quote+"/g"),"\\x22");
}

if ( ! WScript.Arguments.length ) WScript.Quit(-1);

if ( options.Exists("E") ) {
   endBlk = getRegExp(options.Item("E"));
   procBlocks = true;
}
if ( options.Exists("O") ) {
   offset = parseInts(options.Item("O").split(":"));
   procBlocks = true;
}
block = undefined;
if ( options.Exists("B") ) {
   block = getRegExp(options.Item("B"),true);
}
if ( options.Exists("$") ) submatches = parseInts(options.Item("$").split(":"));
var removeCRLF = false;


if ( replace != undefined ) {
   removeCRLF = (block == "\\r\\n") && (replace == "");

   if ( alternation ) {  // Enable alternation replacements from "Se|ar|ch" to "Re|pla|ce"
      if ( ! Jexpr ) {  // Original version

         var searchA = search.match(/(\\\\|\\\||[^\|])+/g),
             replaceA = replace.match(/(\\\\|\\\||[^\|])+/g),
             repl = new Array();
         for ( var i = 0; i < searchA.length; i++ ) {
            repl[eval('"'+searchA[i]+'"')] = replaceA?replaceA[i]?eval('"'+replaceA[i]+'"'):"":"";
         }
         replace = function($0,$1,$2) { return repl[$0]; };
         searchA.length = 0;
         if ( replaceA ) replaceA.length = 0;

      } else {  // Version 2: Search alternation have regular expressions:  "regexp1||regexp2||regexp3"
                //            Replace alternation have JScript expressions: "'Re'||'pla'||'ce'"

         var searchA = search.match(/(\\\\|\\\||[^\|]|[^\|][^\|])+/g), // divide search "regexp1||regexp2" in parts
             repl = replace.match(/(\\\\|\\\||[^\|]|[^\|][^\|])+/g);   // the same for "replace1||replace2"

         search = "";
         replace = "$0,";                               // "function($0,"
         for ( var i = 0; i < searchA.length; i++ ) {   // process each regexpI
            search += (i?'|':'')+'('+searchA[i]+')';    // re-assemble search regexp as "(regexp1)|(regexp2)"
            var subexprs = searchA[i].match(/[^\\]?\(/g);// count subexpressions in this regexpI
            subexprs = subexprs?subexprs.length:0;      // zero if no one
            for ( var j = 0; j <= subexprs; j++ ) {     // insert each subexpression
                  replace += '$'+(i+1)+'$'+j+',';       // 'function($0,' + "$i$0,$i$j,..."
            }
            repl[i] = repl[i].replace(/\$(\d{1,2})/g,"$$"+(i+1)+"$$$1");        // change "$n" by "$i$n" in replaceI
         }

         replace += "$offset,$string";                  // 'function($0, $i$0,$i$1,$i$2, ...' + "$offset, $string)"
         eval ("replace=function("+replace+"){for (var i=1; !eval('$'+i+'$0'); i++);return(eval(repl[i-1]));};");

         Jexpr = false;                                 // the replace function already includes the "eval" part

         searchA = undefined;
         if ( subexprs ) subexprs = undefined;

      }

   } else {  // No alternation

      var evalReplace = "";
      if ( Jexpr) {
         for ( var i = 0; i <= JexprN; i++ ) evalReplace += (i?',':'')+'$'+i;
         eval ( "evalReplace = function("+evalReplace+") { return(eval(replace)); };" );
      }

   }

} else {  // replace == undefined: Find-only operation (to do: adjust values of /$ switch)

   if ( Jexpr ) {  // Find a "second-level" alternation
      var searchA = search.split("||");                 // divide search "regexp1||regexp2" in parts
      search = "";
      for ( var i = 0; i < searchA.length; i++ ) {
         search += (i?'|':'')+'('+searchA[i]+')';       // re-assemble search regexp as "(regexp1)|(regexp2)"
      }
      searchA = undefined;
   }

}

if ( block=options.Item("VAR") ) eval ( "var "+block+";" );
if ( search != "" ) search = new RegExp(search, "gm"+ignoreCase);
if ( block  != undefined ) block  = new RegExp(block , "gm"+ignoreCase);
var keyb = fso.OpenTextFile("CONIN$", 1);


// PROCESS INPUT FILE


// FINDREPL [/I] [/V] [/N] rSearch [/E:rEndBlk] [/O:s:e] [/B:rBlock] [/$:s1...]
//          [[/R] [/A] sReplace] [/Q:c] [/S:sSource]

//          In Search and Replace operations:
//            /V or /N switches implies line processing
//            /E or /O switches implies block (and line) processing
//          If Search operation (with no previous switches) have NOT /$ switch:
//            implies line processing (otherwise is file processing)

var severalLines = false;
if ( options.Exists("S") ) {  // Process Source string instead of file
   var source = options.Item("S");
   if ( source.substr(0,1) == "=" ) source = env(source.substr(1));
   if ( ! Jexpr ) {
      inputLines = new Array(); lastLine = 1;
      inputLines[0] = source;
      procLines = true;
   } else {
      inputLines = eval(source);
      severalLines = true;
   }
} else {  // Process Stdin file
   inputLines = WScript.StdIn.ReadAll();
   severalLines = true;
}

if ( severalLines ) {

   if ( notMatched || showNumber || procBlocks ) procLines = true;
   if ( replace==undefined && submatches==undefined ) procLines = true;

   if ( procLines ) {  // Separate file contents in lines
      var lastByte = inputLines.slice(-1);
      inputLines = inputLines.replace(/([^\r\n]*)\r?\n/g,"$1\n").match(/^.*$/gm);
      lastLine = inputLines.length - ((lastByte == "\n")?1:0);
   }

   if ( procBlocks ) {  // Create blocks of lines
      if ( search != "" ) {  // Blocks based on Search lines:
         if ( offset == undefined ) offset = new Array(0,0);
         for ( var i = 1; i <= lastLine; i++ ) {
            if ( match(inputLines[i-1],search) ) {
               if ( endBlk != undefined ) {  // 1- from Search line to EndBlk line [+offsets].
                  for ( var j=i+1; j<=lastLine && !match(inputLines[j-1],endBlk); j++ );
                  if ( j <= lastLine ) {
                     var s = i+offset[0], e = j+offset[1];
                     // Insert additional code here to cancel overlapped blocks
                     range.push(s>0?s:1, e>0?e:1);
                  }
                  i = j;
               } else {  // 2- surrounding Search lines with offsets.
                  s = i+offset[0], e = i+offset[1];
                  range.push(s>0?s:1, e>0?e:1);
               }
            }
         }
      } else {  // Offset with no Search: block is range of lines
         if ( offset.length < 2 ) offset[1] = lastLine;
         s = offset[0]<0 ? offset[0]+lastLine+1 : offset[0];
         e = offset[1]<0 ? offset[1]+lastLine+1 : offset[1];
         range.push(s>0?s:1, e>0?e:1);
      }
      if ( range.length == 0 ) WScript.Quit(0);
      range.push(0xFFFFFFFF,0xFFFFFFFF);
   }

}
// endif severalLines

if ( replace == undefined ) {  // Search operations
   if ( procLines ) {  // Search on lines
      if ( procBlocks ) {  // Process previously created blocks
         for ( var r=0, lineNumber=1; lineNumber <= lastLine; lineNumber++ ) {
            if ( (range[r]<=lineNumber && lineNumber<=range[r+1]) != notMatched ) {
               if ( submatches != undefined ) {
                  if ( showNumber ) WScript.Stdout.Write(lineNumber+":");
                  while ( (nextMatch = block.exec(inputLines[lineNumber-1])) != null ) {
                     for ( var s = 0; s < submatches.length; s++ ) {
                        WScript.Stdout.Write(" " + (quote!=undefined?quote:'"') + 
                                                   nextMatch[submatches[s]] + 
                                                   (quote!=undefined?quote:'"'));
                     }
                     result++;
                  }
                  WScript.Stdout.WriteLine();
               } else {
                  if ( block == undefined  ||  match(inputLines[lineNumber-1],block) ) {
                     if ( showNumber ) WScript.Stdout.Write(lineNumber+":");
                     WScript.Stdout.WriteLine(inputLines[lineNumber-1]);
                     result++;
                  }
               }
            }
            if ( lineNumber >= range[r+1] ) r += 2;
         }
      } else {  // Process all lines for Search
         for ( lineNumber = 1; lineNumber <= lastLine; lineNumber++ ) {
            if ( match(inputLines[lineNumber-1],search) != notMatched ) {
               if ( showNumber ) WScript.Stdout.Write(lineNumber+":");
               if ( submatches != undefined ) {
                  search.lastIndex = 0;
                  while ( (nextMatch = search.exec(inputLines[lineNumber-1])) != null ) {
                     for ( var s = 0; s < submatches.length; s++ ) {
                        WScript.Stdout.Write(" " + (quote!=undefined?quote:'"') +
                                                   nextMatch[submatches[s]] +
                                                   (quote!=undefined?quote:'"'));
                     }
                     result++;
                  }
                  WScript.Stdout.WriteLine();
               } else {
                  WScript.Stdout.WriteLine(inputLines[lineNumber-1]);
                  result++;
               }
            }
         }
      }

   } else {  // Search on entire file and show submatched substrings
      if ( submatches != undefined ) {
         while ( (nextMatch = search.exec(inputLines)) != null ) {
            for ( var s = 0; s < submatches.length; s++ ) {
               WScript.Stdout.Write(" " + (quote!=undefined?quote:'"') +
                                          nextMatch[submatches[s]] +
                                          (quote!=undefined?quote:'"'));
            }
            result++;
            WScript.Stdout.WriteLine();
         }
      }
   }

} else {  // Replace operations

   if ( procLines ) {  // Replace on lines
      if ( procBlocks ) {  // Process previously created blocks
         if ( block == undefined ) block = search;  // Replace rSearch or rBlock (the last one)
         var CRLFremoved = false;
         for ( var r=0, lineNumber=1; lineNumber <= lastLine; lineNumber++ ) {
            if ( range[r]<=lineNumber && lineNumber<=range[r+1] ) {
               if ( removeCRLF ) {
                  WScript.Stdout.Write(inputLines[lineNumber-1]);
                  CRLFremoved = true;
                  result++;
               } else {
                  if ( match(inputLines[lineNumber-1],block) ) {
                     if ( CRLFremoved ) { WScript.Stdout.WriteLine(); CRLFremoved = false; }
                     WScript.Stdout.WriteLine(inputLines[lineNumber-1].replace(block,Jexpr?evalReplace:replace));
                     result++;
                  } else {
                     if ( CRLFremoved ) { WScript.Stdout.WriteLine(); CRLFremoved = false; }
                     if ( ! justReplaced ) WScript.Stdout.WriteLine(inputLines[lineNumber-1]);
                  }
               }
            } else {
               if ( CRLFremoved ) { WScript.Stdout.WriteLine(); CRLFremoved = false; }
               if ( ! justReplaced ) WScript.Stdout.WriteLine(inputLines[lineNumber-1]);
            }
            if ( lineNumber >= range[r+1] ) r += 2;
         }
         if ( CRLFremoved ) { WScript.Stdout.WriteLine(); CRLFremoved = false; }
      } else {  // Process all lines for Replace
         for ( lineNumber = 1; lineNumber <= lastLine; lineNumber++ ) {
            if ( match(inputLines[lineNumber-1],search) ) {
               WScript.Stdout.WriteLine(inputLines[lineNumber-1].replace(search,Jexpr?evalReplace:replace));
               result++;
            } else {
               if ( ! justReplaced ) WScript.Stdout.WriteLine(inputLines[lineNumber-1]);
            }
         }
      }

   } else {  // Replace on entire file
      WScript.Stdout.Write(inputLines.replace(search,Jexpr?evalReplace:replace));
   }

}

if ( Jexpr && (lastLine=options.Item("L")) ) {
   if ( lastLine.substr(0,1) == '=' ) lastLine = env(lastLine.substr(1));
   if ( quote != undefined ) lastLine = lastLine.replace(eval("/"+quote+"/g"),"\\x22");
   WScript.Stdout.WriteLine( eval(lastLine) );
}

WScript.Quit(result);