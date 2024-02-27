<#
.SYNOPSIS
	Backup copy with Robocopy and Telegram notification
.DESCRIPTION
	This PowerShell script backup files with Robocopy and make Telegram notification
.EXAMPLE
	PS> ./backup.ps1
    or powershell.exe -File backup.ps1
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

# Robocopy log file (same as bat file)
$logpath = "c:\cmd\logfile.log"

# SOLUTION - Error Powershell Invoke-WebRequest with secure SSL / TLS
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# Telegram notification - job start
$text = "Backup starts"
$URI = "https://api.telegram.org/bot" + $token + "/sendMessage?chat_id=" + $chat_id + "&text=" + $text + "&parse_mode=html"
$Request = Invoke-WebRequest -URI ($URI) 

# Robocopy bat file
start 'c:\cmd\robocopy.bat' -Wait 

# Telegram notification - job finish
$text = "Backup ended"
$URI = "https://api.telegram.org/bot" + $token + "/sendMessage?chat_id=" + $chat_id + "&text=" + $text + "&parse_mode=html"
$Request = Invoke-WebRequest -URI ($URI) 

# Telegram notification - job report
$log = Get-Content $logpath -Tail 10
$URI = "https://api.telegram.org/bot" + $token + "/sendMessage?chat_id=" + $chat_id + "&text=" + $log + "&parse_mode=html"
$Request = Invoke-WebRequest -URI ($URI) 



