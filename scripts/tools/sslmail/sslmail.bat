<# : Batch portion
@rem # The previous line does nothing in Batch, but begins a multiline comment block
@rem # in PowerShell.  This allows a single script to be executed by both interpreters.
@echo off & Mode 100,5 & color 0A
::::BgetDescription#Batch-PS hybrid to send SSL-encrypted emails.
::::BgetAuthor#Hackoo
::::BgetCategory#tools
Title Sending E-mail with SSL Authentification with an Hybrid code Batch and Powershell Script by Hackoo
echo(
rem # This a Powershell command executes the hybrid portion at the bottom of this script
for /f "delims=" %%I in ('powershell -noprofile "iex (${%~f0}|out-string)"') do set "%%I"
exit /b
rem # End multi-line PowerShell comment block.  Begin PowerShell scripting.
: end Batch / begin PowerShell hybrid code #>
#################################### First 1 Step ###########################################
# First Step we encrypt the Plain Text Password to an encrypted one using the key AES.key
# Première étape, nous cryptons le mot de passe en clair vers un mot de passe chiffré
# à l'aide de la clé AES.key
$AppData = [Environment]::GetFolderPath('ApplicationData')
$KeyFile = $AppData+"\AES.key"
$Key = New-Object Byte[] 32   # You can use 16, 24, or 32 for AES
[Security.Cryptography.RNGCryptoServiceProvider]::Create().GetBytes($Key)
$Key | out-file $KeyFile
$AppData = [Environment]::GetFolderPath('ApplicationData')
$PasswordFile = $AppData+"\Password.txt"
$Key = Get-Content $KeyFile
$GmailUserName = Read-Host "Please enter your Gmail Account without ""@gmail.com"" "
$Password = Read-Host "Please enter your Gmail Password to be encrypted " -AsSecureString `
| ConvertFrom-SecureString -key $Key | Out-File $PasswordFile
#################################### First 1 Step ###########################################
 
#################################### Second 2 Step ##########################################
# We send the email with our encrypted Credentials
# Nous envoyons le courrier électronique avec les informations d'identification cryptés
#############################################################################################
Function Show-BalloonTip {
  [CmdletBinding(SupportsShouldProcess = $true)]
  param (
    [Parameter(Mandatory=$true)]$Text,
    [Parameter(Mandatory=$true)]$Title,  
    [ValidateSet('None', 'Info', 'Warning', 'Error')]$Icon = 'Info',
   $Timeout = 10000
  )
  Add-Type -AssemblyName System.Windows.Forms
 
  if ($script:balloon -eq $null) { $script:balloon = New-Object System.Windows.Forms.NotifyIcon }
 
  $path                    = Get-Process -id $pid | Select-Object -ExpandProperty Path
  $balloon.Icon            = [System.Drawing.Icon]::ExtractAssociatedIcon($path)
  $balloon.BalloonTipIcon  = $Icon
  $balloon.BalloonTipText  = $Text
  $balloon.BalloonTipTitle = $Title
  $balloon.Visible         = $true
  $balloon.ShowBalloonTip($Timeout)
  Start-Sleep -s 10
  $balloon.Dispose()
}
################################################################################################
function Show-Message {
 
param (
    [string]$Message = "Veuillez entrer votre message",
    [string]$Titre = "Titre de la fenêtre",
    [switch]$OKCancel,
    [switch]$AbortRetryIgnore,
    [switch]$YesNoCancel,
    [switch]$YesNo,
    [switch]$RetryCancel,
    [switch]$IconErreur,
    [switch]$IconQuestion,
    [switch]$IconAvertissement,
    [switch]$IconInformation
    )
 
# Affecter la valeur selon le type de boutons choisis
if ($OKCancel) { $Btn = 1 }
elseif ($AbortRetryIgnore) { $Btn = 2 }
elseif ($YesNoCancel) { $Btn = 3 }
elseif ($YesNo) { $Btn = 4 }
elseif ($RetryCancel) { $Btn = 5 }
else { $Btn = 0 }
 
# Affecter la valeur pour l'icone
if ($IconErreur) {$Icon = 16 }
elseif ($IconQuestion) {$Icon = 32 }
elseif ($IconAvertissement) {$Icon = 48 }
elseif ($IconInformation) {$Icon = 64 }
else {$Icon = 0 }
   
# Charger la biblithèque d'objets graphiques Windows.Forms
[System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") | Out-Null
 
# Afficher la boite de dialogue et renvoyer la valeur de retour (bouton appuyé)
$Reponse = [System.Windows.Forms.MessageBox]::Show($Message, $Titre , $Btn, $Icon)
Return $Reponse
}
################################################################################################
$SuccessMsg = "The email was sent successfully ; Please, check your email !"
$FailureMsg = "ERROR occurred while sending the email"
$AppData = [Environment]::GetFolderPath('ApplicationData')
$PasswordFile = $AppData+"\Password.txt"
$keyFile = $AppData+"\AES.Key"
$key = Get-Content $KeyFile
$GmailEncryptedPassword = Get-Content $PasswordFile | ConvertTo-SecureString -Key $key
$Credentials = New-Object -TypeName System.Management.Automation.PSCredential `
-ArgumentList($GmailUserName,$GmailEncryptedPassword)
$EmailFrom = $GmailUserName+"@gmail.com"
$EmailTo = $EmailFrom
$Subject = "Sending E-mail with SSL Authentification with an Hybrid code Batch and Powershell Script"
$Body = (Get-Date -format F)  + "  Hello ! the sending email is working now with PowerShell and Batch Script!"
$SMTPServer = "smtp.gmail.com"
$SMTPClient = New-Object Net.Mail.SmtpClient($SmtpServer,587)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = $Credentials
try
{
  $SMTPClient.Send($EmailFrom, $EmailTo, $Subject, $Body)
  Show-Message -Message $SuccessMsg -Titre $SuccessMsg -IconInformation
  Show-BalloonTip -Text $SuccessMsg -Title $SuccessMsg -Icon 'Info'
}
catch
{
  Show-Message -Message $_.Exception.Message -Titre $FailureMsg -IconErreur
  Show-BalloonTip -Text $_.Exception.Message -Title 'ERROR occurred while sending the email' -Icon 'Error'
}
exit(1)