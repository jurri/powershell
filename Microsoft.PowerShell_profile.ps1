# Shell-Style
Import-Module posh-git
Import-Module oh-my-posh
Set-PoshPrompt -Theme Paradox

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

# Add ExchangeOnline
Import-Module ExchangeOnlineManagement
$secpasswd = ConvertTo-SecureString '<Password>' -AsPlainText -Force
$o365cred = New-Object System.Management.Automation.PSCredential ('<Admin-Login>', $secpasswd)
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/PowerShell-LiveID/ -Credential $o365cred -Authentication Basic -AllowRedirection
Import-PSSession $Session