/*
@echo off & cls & color 1E 
Mode con Cols=14 lines=1
::Autor Delmar Grande
::http://bbat.forumeiro.com/t248-bat-exe-printscreen-usando-vb-net
::Data  Qui 11 Jul 2013
:: Modified by Hackoo on 09/09/2016 to save image with system date
::::BgetDescription#Printscreen script. Requires .NET Framework.
::::BgetAuthor#Delmar Grande/Hackoo
::::BgetCategory#tools
title PrintScreen by Delmar Grande and modified by Hackoo
Rem Just adding a little timeout to organise our screenshot
Timeout /T 4 /Nobreak>nul
findstr "'%skip%VB" "%~f0" > "%tmp%\%~n0.vb"
for /F %%i in ('dir /B /S ^"%WinDir%\Microsoft.NET\Framework\vbc.exe^"') do set "vbc=%%i"
if /i "%vbc%"=="" cls & color 1c & echo This script needs the framework & pause & Exit
cls
%vbc% /nologo /out:"%tmp%\%~n0.exe" "%tmp%\%~n0.vb"
"%tmp%\%~n0.exe"
del "%tmp%\%~n0.vb" >NUL 2>&1
del "%tmp%\%~n0.exe" >NUL 2>&1
exit
*/
Imports System.Windows.Forms 'VB
Module ModulePrintscreen 'VB
    Sub Main() 'VB
        Dim MaDate As String 'VB
        SendKeys.SendWait("{%}({PRTSC})") 'VB
        If My.Computer.Clipboard.ContainsImage() Then 'VB
            MaDate = Format(Now,"dd-MM-yyyy_hh-mm-ss") 'VB
            My.Computer.Clipboard.GetImage.Save(MaDate & ".jpg", System.Drawing.Imaging.ImageFormat.Jpeg) 'VB
        End If 'VB
    End Sub 'VB
End Module 'VB