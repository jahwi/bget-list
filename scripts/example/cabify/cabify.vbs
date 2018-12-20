Option Explicit 
Dim objShell 
Dim objfso 
Dim objFolder 
Dim colFiles 
Dim objFile 
Dim inffile 
Dim rptfile 
Dim ddtfile 
Dim MakeCabPath 
Dim txtCabDirect 
Dim outputDir 
Dim inputDir
Dim args
''''Bgetdescription#[VBS] Compress a file or folder into a .CAB.
''''Bgetauthor#Jahwi
''''Bgetcategory#example
 'usage: cabify "folder to compress" "output folder" "cab_output_filename"
Set args = Wscript.Arguments
 
'Set the paths for where to get the files from, and where to place the final cab files. 
inputDir = args(0)
outputDir = args(1)

 
Set objShell = WScript.CreateObject("WScript.Shell") 
Set objfso=CreateObject("Scripting.FileSystemObject") 
 
'Make sure makecab.exe exists in wither its normal location in the system32 dir, or in the current dir 
If objfso.FileExists (objfso.GetSpecialFolder(1) & "\makecab.exe") Then  
 MakeCabPath=objfso.GetSpecialFolder(1) & "\makecab.exe" 
ElseIf objfso.FileExists (objShell.CurrentDirectory & "\makecab.exe") Then 
 MakeCabPath=WshShell.CurrentDirectory & "\makecab.exe" 
Else 
 WScript.Echo "Error: Could not find Makecab.exe" 
 WScript.Quit 
End If 
 
'Makecab creates several output files used fo setup that are not needed if all you want is a cab file.   
'We create temp files to pass as these file names, so we can clean them up later.
 
ddtfile=objfso.GetTempName 
inffile=objfso.GetTempName 
rptfile=objfso.GetTempName 
 
'Create the ddt file used to tell makecab which files to package, and where to place the output. 
'see the white paper at http://support.microsoft.com/Default.aspx?id=310618 for more details. 
'DiskDirectoryTemplate is where the packaged files will be placed2/17/2006 9:43AM 
'CabinetNameTemplate is the name of the output file. Change the extension to \ .* instead of .cab for a multi volume archive.  
'Files will be named .1, .2, etc 
'MaxDiskSize sets the max size of the output file. 0=no max size. If this is not 0, make sure CabinetNameTemplate (above) is set to output.* 
'rather then .cab or else each time the max file size is reached a new logs.cab will be created and overwrite the previous file. 
 
Set txtCabDirect = objfso.CreateTextFile(ddtfile, True) 
txtCabDirect.WriteLine ".OPTION EXPLICIT"  & vbCrLf  & _  
".Set CabinetNameTemplate=" & args(2) & vbCrLf  & _ 
".set DiskDirectoryTemplate=" & outputDir & vbCrLf  & _ 
".Set CompressionType=MSZIP" & vbCrLf  & _ 
".Set MaxDiskSize=0" & VbCrLf  & _ 
".Set InfFileName=" & inffile & vbCrLf  & _ 
".Set RptFileName=" & rptfile & vbCrLf  & _ 
".Set Cabinet=on" & vbCrLf  & _ 
".Set Compress=on" 
Set objFolder = objFSO.GetFolder(inputDir) 
Function printFolder(folder, subFolderPath, cabDirect)
  Dim fldrFiles, subFolders, subFolder, targetPath, subFolderName
  Set fldrFiles = folder.Files
  For Each objFile in fldrFiles 
    cabDirect.WriteLine Chr(34) & objFile.Path & Chr(34) 
  Next
  
  Set subFolders = folder.SubFolders
  
  For Each subFolder in subFolders
    If subFolderPath = "" Then
      targetPath = subFolder.Name
    Else
      targetPath = subFolderPath & "\" & subFolder.Name
    End If
    
    cabDirect.WriteLine ".Set DestinationDir=" & targetPath
    printFolder subfolder, targetPath, cabDirect
  Next
End Function

printFolder objFolder, "", txtCabDirect
 
objShell.Run "makecab.exe /f " & ddtfile, 0, True 
txtCabDirect.close 
 
'clean up the tmp files 
objfso.DeleteFile(inffile) 
objfso.DeleteFile(rptfile) 
objfso.DeleteFile(ddtfile) 
 
'open the output directory 
objShell.Run (outputdir) 