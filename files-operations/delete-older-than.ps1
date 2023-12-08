<#
.SYNOPSIS
	Delete files/folder older than...
.DESCRIPTION
	Delete files/folder older than...
.EXAMPLE
	PS> ./delete-older-than.ps1
    or powershell.exe -File delete-older-than.ps1
.LINK
	https://github.com/skurudo/poshpower    
.NOTES
    tested with Powershell 5.1 (Windows 10 / Windows Server 2016)
#>

$path = "...."
$exclude = @('FOLDERNAME', 'filename.txt')
$older = (Get-Date).AddDays(-30)

Get-ChildItem $path -Exclude $exclude | foreach{
    if ($_.LastWriteTime -le $older){
        Remove-Item $_.fullname -Recurse -Force -Confirm:$false
    }
}