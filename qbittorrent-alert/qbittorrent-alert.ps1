<#
.SYNOPSIS
	Qbittorent telegram alert template
.DESCRIPTION
	This PowerShell script Qbittorent Telegram alert template
.EXAMPLE
	PS> ./qbittorrent-alert.ps1 "%N"
    or powershell.exe -File qbittorrent-alert.ps1 "%N"

    Below are Qbittorrent parameters:Supported parameters (case sensitive):
    %N: Torrent name
    %L: Category
    %G: Tags (separated by comma)
    %F: Content path (same as root path for multifile torrent)
    %R: Root path (first torrent subdirectory path)
    %D: Save path
    %C: Number of files
    %Z: Torrent size (bytes)
    %T: Current tracker
    %I: Info hash
    (if you want to use more parameters, you need add more external variables below)
.LINK
	https://github.com/skurudo/poshpower    
.NOTES
    tested with Powershell 5.1 (Windows 10 / Windows Server 2016)

    Emoji list
    https://apps.timwhitlock.info/emoji/tables/unicode

    PowerShell Policy:
    Set-Executionpolicy -Scope CurrentUser -ExecutionPolicy UnRestricted
#>

# External variables
$args[0]
#$args[1]
#$args[2]

# Emoji to show
$EmojiIcon = [System.Convert]::toInt32("2705",16)

# Telegram credentials
$token = "your token"
$chat_id = "your chat id"

# SOLUTION - Error Powershell Invoke-WebRequest with secure SSL / TLS
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# Telegram notification - job start
$text = [System.Char]::ConvertFromUtf32($EmojiIcon) + " Successfully downloaded on " + $env:computername + ": " + "%0A" + "<b>" + $args[0] + "</b>"
$URI = "https://api.telegram.org/bot" + $token + "/sendMessage?chat_id=" + $chat_id + "&text=" + $text + "&parse_mode=html"
$Request = Invoke-WebRequest -URI ($URI) 

