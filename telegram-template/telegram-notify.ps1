<#
.SYNOPSIS
	Telegram notification template
.DESCRIPTION
	This PowerShell script Telegram notification template
.EXAMPLE
	PS> ./telegram-notify.ps1
    or powershell.exe -File telegram-notify.ps1
.LINK
	https://github.com/skurudo/poshpower    
.NOTES
    tested with Powershell 5.1 (Windows 10 / Windows Server 2016)

	PowerShell Policy:
    Set-Executionpolicy -Scope CurrentUser -ExecutionPolicy UnRestricted
#>

# Telegram credentials
$token = "your token"
$chat_id = "your chat id"

# SOLUTION - Error Powershell Invoke-WebRequest with secure SSL / TLS
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# Telegram notification - job start
$text = "Backup starts"
$URI = "https://api.telegram.org/bot" + $token + "/sendMessage?chat_id=" + $chat_id + "&text=" + $text + "&parse_mode=html"
$Request = Invoke-WebRequest -URI ($URI) 

#
# Some job 
#

# Telegram notification - job finish
$text = "Backup ended"
$URI = "https://api.telegram.org/bot" + $token + "/sendMessage?chat_id=" + $chat_id + "&text=" + $text + "&parse_mode=html"
$Request = Invoke-WebRequest -URI ($URI) 




